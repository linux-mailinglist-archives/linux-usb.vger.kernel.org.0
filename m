Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B569D44275F
	for <lists+linux-usb@lfdr.de>; Tue,  2 Nov 2021 08:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhKBHEM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Nov 2021 03:04:12 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:28438 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229497AbhKBHEL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Nov 2021 03:04:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635836497; x=1667372497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rmlq2mRo2a6AljwIeeGhxxJDSH75L1XvLG8o/iAtLQY=;
  b=eB8BlI9aQu0HwW4Is5F9xTFU7L44zBcbeOiNVUvrzLlLeSzRopjEC9fa
   f7hW7ZGeDjBNcbUqiXl5xnM26fPYTl3peQblwoFWAymtBKA8mtg9dRr4z
   O2/c9J3lIb8dZf/FpaRg6+BeNuy6N4jzUunp4YWVRbYUHWJk+bEyKmoWp
   A=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Nov 2021 00:01:37 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 00:01:37 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 2 Nov 2021 00:01:36 -0700
Received: from jackp-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 2 Nov 2021 00:01:36 -0700
Date:   Tue, 2 Nov 2021 00:01:31 -0700
From:   Jack Pham <quic_jackp@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     <linux-usb@vger.kernel.org>,
        Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@google.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
Subject: Re: [PATCH] usb: typec: ucsi: Only get source PDOs from the actual
 source
Message-ID: <20211102070131.GA31877@jackp-linux.qualcomm.com>
References: <20211027064842.6901-1-quic_jackp@quicinc.com>
 <YXqPtNmETT0ZtnKl@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YXqPtNmETT0ZtnKl@kuha.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

On Thu, Oct 28, 2021 at 02:55:32PM +0300, Heikki Krogerus wrote:
> On Tue, Oct 26, 2021 at 11:48:42PM -0700, Jack Pham wrote:
> > The intent of ucsi_get_src_pdos() is to obtain the source's PDOs
> > in order to provide the power_supply object the required data to
> > report the mininum, maximum and currently operating voltage &
> > current should a PD contract be in place.
> > 
> > If however, the port is operating as a PD source, this call would
> > invoke GET_PDOS on the partner causing the PPM to send a
> > Get_Source_Caps PD message to the port partner which may not make
> > sense especially if the partner is not a dual-power role capable
> > device.  Further, it has been observed that certain DisplayPort
> > adapter cables (which are power sink-only devices) even fail to
> > bring up the display link after receiving a Get_Source_Caps
> > message, suggesting they can't cope well with an unsupported PD
> > message to the point that it renders them functionally inoperable.
> > 
> > Fix this by checking the connector status flags for the power
> > direction and use this to decide whether to send the GET_PDOs
> > query to the partner or the port.  This also helps to make the
> > power_supply VOLTAGE_{MIN,MAX,NOW} and CURRENT_{MAX,NOW}
> > properties more consistent when the port is in source mode.
> > 
> > Signed-off-by: Jack Pham <quic_jackp@quicinc.com>
> > ---
> > Hi Heikki,
> > 
> > Was wrestling with how exactly to do this.  The other approach I was
> > thinking was to not even do GET_PDOs at all if operating as a source,
> > but that would also mean we'd need to add similar checking to the
> > VOLTAGE/CURRENT property getters in psy.c so that they would not
> > return incorrect/stale data.  Since the ONLINE property will already
> > be 0 anyway it may make more sense to invalidate the rest of the props?
> > 
> > The patch below is concise though...so that's what I went with ;)
> 
> Would it still make sense / help if we had separate power supplies
> registered for the port-source, port-sink, partner-source and
> partner-sink?

The name "power_supply" of the class to me implies a source :). So I
can see perhaps having separate port-source and partner-source supplies
making sense; they would effectively be mutually exclusive as only one
of the pair would be "online" at a time when a partner is present
depending on the power direction.

But I'm not sure I see a use for having port-sink/partner-sink objects
though.  While the VOLTAGE_NOW / CURRENT_NOW properties might be
redundantly reporting the same value from corresponding -source objects,
would there be different MIN/MAX values which are obtained from
Get_Sink_Caps?

> I also think we need to unify these power supplies so that tcpm and
> ucsi (and others) always register the same power supplies.

I like that idea too!

Thanks,
Jack
