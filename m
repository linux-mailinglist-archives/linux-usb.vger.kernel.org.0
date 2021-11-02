Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3338C442910
	for <lists+linux-usb@lfdr.de>; Tue,  2 Nov 2021 09:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbhKBIHR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Nov 2021 04:07:17 -0400
Received: from mga01.intel.com ([192.55.52.88]:48461 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229497AbhKBIHN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Nov 2021 04:07:13 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="254816106"
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; 
   d="scan'208";a="254816106"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 01:04:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; 
   d="scan'208";a="638108510"
Received: from kuha.fi.intel.com ([10.237.72.166])
  by fmsmga001.fm.intel.com with SMTP; 02 Nov 2021 01:04:22 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 02 Nov 2021 10:04:21 +0200
Date:   Tue, 2 Nov 2021 10:04:21 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Jack Pham <quic_jackp@quicinc.com>
Cc:     linux-usb@vger.kernel.org, Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@google.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
Subject: Re: [PATCH] usb: typec: ucsi: Only get source PDOs from the actual
 source
Message-ID: <YYDxBV9ZqPiEmMUI@kuha.fi.intel.com>
References: <20211027064842.6901-1-quic_jackp@quicinc.com>
 <YXqPtNmETT0ZtnKl@kuha.fi.intel.com>
 <20211102070131.GA31877@jackp-linux.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070131.GA31877@jackp-linux.qualcomm.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 02, 2021 at 12:01:31AM -0700, Jack Pham wrote:
> Hi Heikki,
> 
> On Thu, Oct 28, 2021 at 02:55:32PM +0300, Heikki Krogerus wrote:
> > On Tue, Oct 26, 2021 at 11:48:42PM -0700, Jack Pham wrote:
> > > The intent of ucsi_get_src_pdos() is to obtain the source's PDOs
> > > in order to provide the power_supply object the required data to
> > > report the mininum, maximum and currently operating voltage &
> > > current should a PD contract be in place.
> > > 
> > > If however, the port is operating as a PD source, this call would
> > > invoke GET_PDOS on the partner causing the PPM to send a
> > > Get_Source_Caps PD message to the port partner which may not make
> > > sense especially if the partner is not a dual-power role capable
> > > device.  Further, it has been observed that certain DisplayPort
> > > adapter cables (which are power sink-only devices) even fail to
> > > bring up the display link after receiving a Get_Source_Caps
> > > message, suggesting they can't cope well with an unsupported PD
> > > message to the point that it renders them functionally inoperable.
> > > 
> > > Fix this by checking the connector status flags for the power
> > > direction and use this to decide whether to send the GET_PDOs
> > > query to the partner or the port.  This also helps to make the
> > > power_supply VOLTAGE_{MIN,MAX,NOW} and CURRENT_{MAX,NOW}
> > > properties more consistent when the port is in source mode.
> > > 
> > > Signed-off-by: Jack Pham <quic_jackp@quicinc.com>
> > > ---
> > > Hi Heikki,
> > > 
> > > Was wrestling with how exactly to do this.  The other approach I was
> > > thinking was to not even do GET_PDOs at all if operating as a source,
> > > but that would also mean we'd need to add similar checking to the
> > > VOLTAGE/CURRENT property getters in psy.c so that they would not
> > > return incorrect/stale data.  Since the ONLINE property will already
> > > be 0 anyway it may make more sense to invalidate the rest of the props?
> > > 
> > > The patch below is concise though...so that's what I went with ;)
> > 
> > Would it still make sense / help if we had separate power supplies
> > registered for the port-source, port-sink, partner-source and
> > partner-sink?
> 
> The name "power_supply" of the class to me implies a source :). So I
> can see perhaps having separate port-source and partner-source supplies
> making sense; they would effectively be mutually exclusive as only one
> of the pair would be "online" at a time when a partner is present
> depending on the power direction.
> 
> But I'm not sure I see a use for having port-sink/partner-sink objects
> though.  While the VOLTAGE_NOW / CURRENT_NOW properties might be
> redundantly reporting the same value from corresponding -source objects,
> would there be different MIN/MAX values which are obtained from
> Get_Sink_Caps?

A power-supply can be a supply, supplicant or both, and that aligns
perfectly with source/sink IMO. By taking advantage of that, you could
display the whole power-supply chain to the user space.

So if you had a port-sink power-supply online and partner-source
online - the partner supplying the port - then in reality the
port-sink power-supply would/could also be the "supply" for another
power-supply, for example the battery. That's the idea with the
power-supply chain.

Nevertheless, I guess there does not have to be separate source and
sink power-supplies. If we just had separate port and partner
power-supplies, we could also possibly use the "status" property to
see which one is sink and which is the source (charging or
discharging). Though, I don't think that would be ideal.

> > I also think we need to unify these power supplies so that tcpm and
> > ucsi (and others) always register the same power supplies.
> 
> I like that idea too!


thanks,

-- 
heikki
