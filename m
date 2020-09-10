Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84AAC265403
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 23:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728722AbgIJVnK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 17:43:10 -0400
Received: from mga04.intel.com ([192.55.52.120]:4396 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727805AbgIJMuj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Sep 2020 08:50:39 -0400
IronPort-SDR: KRExH6GIdf+U3snI7mDygmeJiABXC4NEWCMADr0pD+7HDnnr4p0G01PDd+hEort4INPNZG642n
 TviXh1qgenUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="155922155"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; 
   d="scan'208";a="155922155"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2020 05:50:21 -0700
IronPort-SDR: B3XKQfBrZoXfmUszbW7W7uieVLhna12y+0ybPVl+Uxs0lH9BHSTuBE8BjGGaZjTvz3WgD6B0mg
 EMA5yjOQbA/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; 
   d="scan'208";a="407752988"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 10 Sep 2020 05:50:18 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 10 Sep 2020 15:50:18 +0300
Date:   Thu, 10 Sep 2020 15:50:18 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Zwane Mwaikambo <zwanem@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Zwane Mwaikambo <zwane@yosper.io>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 1/2] usb/typec: fix array overruns in ucsi.c
 partner_altmode[]
Message-ID: <20200910125018.GA3946915@kuha.fi.intel.com>
References: <alpine.DEB.2.21.2008271035320.30454@montezuma.home>
 <0013fe6c-c0a2-1759-c769-cda025e5eb38@infradead.org>
 <alpine.DEB.2.21.2008271058220.37762@montezuma.home>
 <alpine.DEB.2.21.2008271131570.37762@montezuma.home>
 <20200828123328.GF174928@kuha.fi.intel.com>
 <alpine.DEB.2.21.2008300220350.37231@montezuma.home>
 <20200903111047.GH1279097@kuha.fi.intel.com>
 <20200909131059.GB3627076@kuha.fi.intel.com>
 <alpine.DEB.2.21.2009100030340.31932@montezuma.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2009100030340.31932@montezuma.home>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 10, 2020 at 12:52:05AM -0700, Zwane Mwaikambo wrote:
>  Hi Heikki,
> 
> On Wed, 9 Sep 2020, Heikki Krogerus wrote:
> 
> > On Thu, Sep 03, 2020 at 02:10:50PM +0300, Heikki Krogerus wrote:
> > > Hi Zwane,
> > > 
> > > Sorry to keep you waiting. I'm trying to find a board I can use to
> > > test these...
> > 
> > I've now tested this (these) with ThinkPad X280, and there is no
> > regression, however, now that (I think) I understand what's going on,
> > I would not try to fix the issue like you do. I would simply make sure
> > the alternate mode arrays are NULL terminated. For example with
> > something like this:
> > 
> > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> > index cba6f77bea61b..7e66e4d232996 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.h
> > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > @@ -317,8 +317,8 @@ struct ucsi_connector {
> >         struct typec_port *port;
> >         struct typec_partner *partner;
> >  
> > -       struct typec_altmode *port_altmode[UCSI_MAX_ALTMODES];
> > -       struct typec_altmode *partner_altmode[UCSI_MAX_ALTMODES];
> > +       struct typec_altmode *port_altmode[UCSI_MAX_ALTMODES + 1];
> > +       struct typec_altmode *partner_altmode[UCSI_MAX_ALTMODES + 1];
> >  
> >         struct typec_capability typec_cap;
> > 
> > Though I'm not sure we should need even that. Try it out in any case.
> > 
> > Even if that works, I have a feeling there is something odd going on.
> > What kinds of device has all 30 modes supported (or even more)? I want
> > to know if this is a case where the firmware is just reporting bogus
> > values.
> > 
> > What device are you plugging to the Type-C connector? Does it really
> > have all 30 altmodes? What do you see in /sys/class/typec directory
> > when you connect the device?
> > 
> >         ls /sys/class/typec
> > 
> > Actually, do this:
> > 
> >         grep . /sys/class/typec/port*-partner/port*-partner.*/svid
> > 
> > and tell what you get.
> 
> Thanks for digging into it, the device being plugged in is a Lenovo TB 
> dock 
> (https://www.lenovo.com/ca/en/accessories-and-monitors/home-office/Thunderbolt-Dock-Gen-2-US/p/40AN0135US);

It has TBT, DP, and probable the Lenovo vendor specific mode. So two
or three modes, no more, so not 30.

> thinkpad :: ~ » ls /sys/class/typec
> port0
> 
> thinkpad :: /sys/class/typec » grep . /sys/class/typec/port*-partner/port*-partner.*/svid
> zsh: no matches found: /sys/class/typec/port*-partner/port*-partner.*/svid

How can you have partner change notifications without a partner? I'm
probable still missing something. I wonder what exactly do you have in
the partner alternate mode array? I think your patche(s) are working
around some deeper issue. We really need to figure out what that is.

Let's check the trace output. You need to build the UCSI drivers as
modules. Then:

        modprobe -r ucsi_acpi
        modprobe typec_ucsi
        mount debugfs -t debugfs /sys/kernel/debug
        cd /sys/kernel/debug/tracing
        echo 1 > events/ucsi/enable
        modprobe ucsi_acpi

Wait one minute and:

        cat trace

thanks,

-- 
heikki
