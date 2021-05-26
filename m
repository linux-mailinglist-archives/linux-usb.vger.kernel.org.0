Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93D4939137C
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 11:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233240AbhEZJRz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 05:17:55 -0400
Received: from mga18.intel.com ([134.134.136.126]:30552 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232849AbhEZJRy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 May 2021 05:17:54 -0400
IronPort-SDR: JTPGwePUYCuM8b9JKx19Oy5/e1clnksTGygJWwtIRW4YieU3qZq4Fb+x6S7aAJeDvXFWMLkW5W
 if3WSEedvdAQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="189797478"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="189797478"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 02:16:22 -0700
IronPort-SDR: 3J+E7tBnP4OBjc7FWcipnOuxO37Vig80c4ophYKB+ut7Cr1qDwmfYNSz3cldGAsV0b3Op0giZQ
 nApovqSsvFlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="547126937"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 26 May 2021 02:16:19 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 26 May 2021 12:16:18 +0300
Date:   Wed, 26 May 2021 12:16:18 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Jun Li <jun.li@nxp.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 3/4] usb: typec: add typec orientation switch support via
 mux controller
Message-ID: <YK4R4q1cZqQDS1qy@kuha.fi.intel.com>
References: <1621408490-23811-1-git-send-email-jun.li@nxp.com>
 <1621408490-23811-4-git-send-email-jun.li@nxp.com>
 <YKZXHG7BSSZssiBg@kuha.fi.intel.com>
 <YKdxW8SFntFYcyv+@kuha.fi.intel.com>
 <VI1PR04MB593521FEBF947882E6A394D489259@VI1PR04MB5935.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR04MB593521FEBF947882E6A394D489259@VI1PR04MB5935.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 25, 2021 at 11:46:18AM +0000, Jun Li wrote:
> Hi Heikki,
> 
> > -----Original Message-----
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Sent: Friday, May 21, 2021 4:38 PM
> > To: Jun Li <jun.li@nxp.com>
> > Cc: robh+dt@kernel.org; shawnguo@kernel.org; gregkh@linuxfoundation.org;
> > linux@roeck-us.net; linux-usb@vger.kernel.org; dl-linux-imx
> > <linux-imx@nxp.com>; devicetree@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH 3/4] usb: typec: add typec orientation switch support
> > via mux controller
> > 
> > Hi,
> > 
> > On Thu, May 20, 2021 at 03:33:36PM +0300, Heikki Krogerus wrote:
> > > Why not just do that inside fwnode_typec_switch_get() and handle the
> > > whole thing in drivers/usb/typec/mux.c (or in its own file if you
> > > prefer)?
> > >
> > > You'll just need to register a "wrapper" Type-C switch object for the
> > > OF mux controller, but that should not be a problem. That way you
> > > don't need to export any new functions, touch this file or anything
> > > else.
> > 
> > I wrote a bit of code just to see how that would look. I'm attaching you
> > the hack I made. I guess something like that would not be too bad.
> > A wrapper is probable always a bit clumsy, but I'm not sure that in this
> > case it's a huge problem. Of course if there are any better ideas, let's
> > here them :-)
> 
> Thanks for your patch, I am pasting the patch as below.
> 
> seems we need consider more than that.
> 
> diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
> index a0adb8947a301..d85231b2fe10b 100644
> --- a/drivers/usb/typec/Makefile
> +++ b/drivers/usb/typec/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_TYPEC)		+= typec.o
>  typec-y				:= class.o mux.o bus.o port-mapper.o
> +typec-$(MULTIPLEXER)		+= of_mux.o
>  obj-$(CONFIG_TYPEC)		+= altmodes/
>  obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
>  obj-$(CONFIG_TYPEC_UCSI)	+= ucsi/
> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> index 9da22ae3006c9..282622276d97b 100644
> --- a/drivers/usb/typec/mux.c
> +++ b/drivers/usb/typec/mux.c
> @@ -63,6 +63,9 @@ struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode)
>  
>  	sw = fwnode_connection_find_match(fwnode, "orientation-switch", NULL,
>  					  typec_switch_match);
> +	if (!sw)
> +		sw = of_switch_register(fwnode);
> +
> 
> How to support multiple typec_switch_get() for of_mux case?
> the second call to fwnode_typec_switch_get() will get the switch
> via fwnode_connection_find_match()? This means we still need
> a property "orientation-switch" for mux controller node, this
> seems not the expected way for a mux consumer, even with this
> property, we will get a EPROBE_DEFER for the first call.
> 
> If we use mux_control_get() for multiple caller/consumer, then
> we need some other device as input.
>   
> typec_switch object looks to me is a provider, if we create
> and maintain it in consumer side, I have not come out a better
> way:-).

Sorry, but can we rewind a bit: Why can't you just register the
orientation switch from your mux driver and be done with it? You
should then be able to use OF graph, and no special bindings should
be needed, no?

If you want to reuse a mux-controller driver, then you do need to
modify it (but only a little), and what ever mux-controller specific
bindings there are, you will not use those when the mux supplies the
orientation switching function, instead you'll use the OF graph for
that. But surely that is not a problem?

The mux-controller framework expects the "consumers" of the muxes to
understand the final function that the mux is used for. The Type-C
"mux" framework (I should not even talk about muxes with those) works
the other way around. The driver for the component that supplies the
orientation switch function must understand that it is handling that
function, and there is a good reason for doing it that way with the
USB Type-C switches. The orientation switch for example quite simply
is _not_ always a mux. In fact, it's seems to be rarely a mux these
days. With USB4 for example the orientation is handled almost always
by the first on-board retimer.

There are actually also some technical reasons why Hans failed to get
the mux-controller thing to work, which is the original reason why we
introduced the dedicated framework for the Type-C "muxes" (I really
should stop talking about muxes), but I don't remember what was the
reason.

In any case, to summarise: the orientation switch is a function. A mux
is a device that can supply that function, and if it does, then the
driver for it really needs to register the dedicated orientation
switch.

thanks,

-- 
heikki
