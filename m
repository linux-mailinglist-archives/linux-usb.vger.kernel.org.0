Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1A21255C0D
	for <lists+linux-usb@lfdr.de>; Fri, 28 Aug 2020 16:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbgH1ONR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Aug 2020 10:13:17 -0400
Received: from mga04.intel.com ([192.55.52.120]:20238 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726236AbgH1ONP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 Aug 2020 10:13:15 -0400
IronPort-SDR: n3b2WS4BrVof+fy4+0WE6rB1L80F6lGjb8GZ5oHqhUMY2eBvzQrl38HEfox7s8PIRAUb+PqOyQ
 0Xemhzjs/UMQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="154082410"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; 
   d="scan'208";a="154082410"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2020 07:13:14 -0700
IronPort-SDR: VeRSSMCHykQpfxo/L3BXcxPdq9kBqY73nr0AMvWIFwS6X8HMgyYhIC4N1XQGokcnFivLgrm0rh
 /4IYuP855YtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; 
   d="scan'208";a="403763094"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 28 Aug 2020 07:13:11 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 28 Aug 2020 17:13:11 +0300
Date:   Fri, 28 Aug 2020 17:13:11 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Badhri Jagan Sridharan <badhri@google.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/14] usb: typec: tcpm: Implement enabling Auto
 Discharge disconnect support
Message-ID: <20200828141311.GJ174928@kuha.fi.intel.com>
References: <20200825042210.300632-1-badhri@google.com>
 <20200825042210.300632-13-badhri@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825042210.300632-13-badhri@google.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 24, 2020 at 09:22:08PM -0700, Badhri Jagan Sridharan wrote:
> TCPCI spec allows TCPC hardware to autonomously discharge the vbus
> capacitance upon disconnect. The expectation is that the TCPM enables
> AutoDischargeDisconnect while entering SNK/SRC_ATTACHED states. Hardware
> then automously discharges vbus when the vbus falls below a certain
> threshold i.e. VBUS_SINK_DISCONNECT_THRESHOLD.
> 
> Apart from enabling the vbus discharge circuit, AutoDischargeDisconnect
> is also used a flag to move TCPCI based TCPC implementations into
> Attached.Snk/Attached.Src state as mentioned in
> Figure 4-15. TCPC State Diagram before a Connection of the
> USB Type-C Port Controller Interface Specification.
> In such TCPC implementations, setting AutoDischargeDisconnect would
> prevent TCPC into entering "Connection_Invalid" state as well.
> 
> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> Change-Id: I09c407eb228d69eb1259008eeb14c429b0fda765

It looks like this patch is also formated a bit differently compared
to the others.

thanks,

-- 
heikki
