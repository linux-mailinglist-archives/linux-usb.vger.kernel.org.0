Return-Path: <linux-usb+bounces-19843-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00896A21C1D
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 12:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3747B18845F4
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 11:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1994E1B85DF;
	Wed, 29 Jan 2025 11:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e27B8QbG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6381AE003;
	Wed, 29 Jan 2025 11:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738149880; cv=none; b=RdpaAC9FteI10EAvLRNoAw2v9OOZI7WhD0oIyPk06/MBSA7TSAdz8gSw8IidbQPdr0MfpAsltPGXkvo2Y78BaevwHAO+THx5aZgMRC0gzWVuD/inOjijf2jHOCp0ZdRU3z0QBo6RfDvX0tLDi0VZK0ijU8peXOR4Q1b7nJMglaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738149880; c=relaxed/simple;
	bh=+X6llc3EQiaQrsd21tKj4ScJE77Shx0mNp4YkOQN7uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0ORGMHqgVljoFVZP/2+9ZldQSWp0KJSQmlFKYVEJTcyOXgJ6wvIlbRdeqp0oP345kGIEeSOB8eJI3IsMdX/rmcOLPFd8qZ7T+0cD2sWgn1zNi4sfpw7fnBkerorcpGF3nMHuOgLGkv9rYfTI/3yuoPZHQXDObO7pU+XSEhfv6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e27B8QbG; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ee51f8c47dso9319054a91.1;
        Wed, 29 Jan 2025 03:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738149878; x=1738754678; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FR3q01BTHN0GRl/0d/f91ePt6aydBv8OlChJw7m0uJk=;
        b=e27B8QbGLsExFhLaE7eYYz2ngrH8Ppvsved5Z/msyLt+tuH+Sj/wxMxO6/0t3dZVAg
         djU8Ao/cuwaVI9l2Nzgmnkbegm12jxnCWnVdGzvTlv+4uMgszRewn6Q45dYVTxGLcUCr
         Mm+LDOvGfiYzxtjusGpYCNsHksz4GQaHBc+nwKR2srP0zq0Pb4wAo+mKEwTkkXPIAltP
         vfBbEyZIyHYWrWe71iLGUSIitH3xshU6OFEyAmhT1ipbaV+GDPy84FkmlBjW+Pncpo+1
         fkbXldRdr/JymgTvtvDzXvfCi3QdPTPOljDMmoBd8e0Ht6yy12rpl5hi27//SfrcTkuY
         TFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738149878; x=1738754678;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FR3q01BTHN0GRl/0d/f91ePt6aydBv8OlChJw7m0uJk=;
        b=cZKtrH4FklC8y2bcN9RoGiYeL1WhwzJYoZ8B6Zg4o/jBPIGBWMl1f/tDCcxfGkQpK4
         ITVV6Wbzwj4qo0p2fTmf1nxXO6PYwwK8grdS72/Xgk1lGqaNVC+wRf+nJ7PYsPikyBb5
         RBMIPK1VGLk6PhtdK6nGNNBQr/ylc5Os0R9hPWZIM5ulVK0oTbtlKpQjACwa3Wog9nL1
         8VBI5pUAk1+1M1oqhyBQcHCPQNiUfHM/H4Uac4gkxziySRhO+dimeORctzqHvpmaX+4C
         64wIFXOmikt+3PIsirKE0cswgaCpQdFzdbH9IQu5KhS/5TRJBXiPHZm6/6b6h7xQnTKw
         wnuw==
X-Forwarded-Encrypted: i=1; AJvYcCW/JUrrHI60Huz+wmKN+98xSP9kTEaC7gG3HeXA/F2hQ7L/uQnHPpiwLdJ+7C30nqSOmprQGSi71snk@vger.kernel.org, AJvYcCX3aA/eJrrgLTLEt85fwqQjLI6B/Ax5vlYwBUeFtd6UUdyQOInvFKUBkF1on6UDQ/ZgjLSbOGXEgQ67HGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFoiuN+1xfRG8SxK6CClHnGCb+VNzZfjCMRLs/5jXv30OdWlIc
	fqNl1SCo1M7BgGXTxT2n8YUvtc6h57wjB2VQVjo3JzqBXTflSCyJ
X-Gm-Gg: ASbGncsyEUCNRCUwtWfV0xfd+DdrGy8suSpapdNO0sNzH/frOEA2g/onHQRFD+X2glQ
	DZuxAK0lU600f4EYSG5EhS9vn881j+A2MZxVtjcmrcTjstKopkyy989eF370howoJbsJ/x5oDyh
	1H7nQcIHs55VVKoMSjUxyOtK21p+0kAVpBwc+Hv/XGazrb7yaB6yUnFZ0OBIQ6JTeo63bmTq/xm
	4lZVfHbD4SntUZvnxOWylY6fgvu8/iMrfJrXTvgSqxYBe7OB19+gxQJmJvcglfCsu050Jn0N5+Z
	1XRmJVP2aUClgw==
X-Google-Smtp-Source: AGHT+IHyAtl6DopKrgcYlii5EGlNWdZ4fTDwUWzd3K7BQCIDt0URCfPoIvEUpufIvQwiFRf3hU5tCg==
X-Received: by 2002:a17:90b:2802:b0:2f7:ef57:c7df with SMTP id 98e67ed59e1d1-2f83abaf38bmr4188871a91.7.1738149877959;
        Wed, 29 Jan 2025 03:24:37 -0800 (PST)
Received: from ubuntu ([175.141.178.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bd0cd58sm1377044a91.25.2025.01.29.03.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 03:24:37 -0800 (PST)
Date: Wed, 29 Jan 2025 11:24:33 +0000
From: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com, 
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Disable Gen 4 Recovery on Asymmetric
 Transitions
Message-ID: <tycnnkwktd4iryegey2xysib3przadada5o7xuqrt5qfxqdtdc@22gg5ssed6sc>
References: <20250128163605.19222-1-rahimi.mhmmd@gmail.com>
 <20250129063148.GT3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129063148.GT3713119@black.fi.intel.com>

Hello! Thanks for the thorough review.

On Wed, Jan 29, 2025 at 08:31:48AM GMT, Mika Westerberg wrote:
> Hi,
> 
> On Tue, Jan 28, 2025 at 04:36:05PM +0000, Mohammad Rahimi wrote:
> > Updates the Connection Manager to disable the Gen 4 Link Recovery
> > flow before transitioning from a Symmetric Link to an Asymmetric
> > Link, as specified in recent changes to the USB4 v2 specification.
> > 
> > According to the "USB4 2.0 ENGINEERING CHANGE NOTICE FORM"
> > published in September 2024, the rationale for this change is:
> > 
> >   "Since the default value of the Target Asymmetric Link might be
> >   different than Symmetric Link and Gen 4 Link Recovery flow checks
> >   this field to make sure it matched the actual Negotiated Link Width,
> >   we’re removing the condition for a Disconnect in the Gen 4 Link
> >   Recovery flow when Target Asymmetric Link doesn’t match the actual
> >   Link width and adding a Connection Manager note to Disable Gen 4 Link
> >   Recovery flow before doing Asymmetric Transitions."
> > 
> > Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
> > ---
> >  drivers/thunderbolt/tb.c      |  23 ++++---
> >  drivers/thunderbolt/tb.h      |   3 +
> >  drivers/thunderbolt/tb_regs.h |   1 +
> >  drivers/thunderbolt/usb4.c    | 125 ++++++++++++++++++++++++++++++++++
> >  4 files changed, 142 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > index a7c6919fbf97..da53e4619eca 100644
> > --- a/drivers/thunderbolt/tb.c
> > +++ b/drivers/thunderbolt/tb.c
> > @@ -1013,7 +1013,7 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
> >  			     struct tb_port *dst_port, int requested_up,
> >  			     int requested_down)
> >  {
> > -	bool clx = false, clx_disabled = false, downstream;
> > +	bool clx_was_enable = false, lrf_was_enable = false, downstream;
> 
> Let's call it link_recovery instead of lrf.
> 
> >  	struct tb_switch *sw;
> >  	struct tb_port *up;
> >  	int ret = 0;
> > @@ -1075,14 +1075,12 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
> >  			continue;
> >  
> >  		/*
> > -		 * Disable CL states before doing any transitions. We
> > -		 * delayed it until now that we know there is a real
> > -		 * transition taking place.
> > +		 * Disable CL states and Link Recovery flow before doing any
> > +		 * transitions. We delayed it until now that we know there is
> > +		 * a real transition taking place.
> >  		 */
> > -		if (!clx_disabled) {
> > -			clx = tb_disable_clx(sw);
> > -			clx_disabled = true;
> > -		}
> > +		clx_was_enable = tb_disable_clx(sw);
> > +		lrf_was_enable = usb4_disable_lrf(sw);
> 
> The naming is off here and I suggest to do this per USB4 port not per
> router. See below.
> 

Sure, I'll handle it per port. Please see my question below.

> >  		tb_sw_dbg(up->sw, "configuring asymmetric link\n");
> >  
> > @@ -1097,9 +1095,14 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
> >  		}
> >  	}
> >  
> > -	/* Re-enable CL states if they were previosly enabled */
> > -	if (clx)
> > +	/*
> > +	 * Re-enable CL states and Link Recovery flow if
> > +	 * they were previosly enabled
> > +	 */
> > +	if (clx_was_enable)
> >  		tb_enable_clx(sw);
> > +	if (lrf_was_enable)
> > +		usb4_enable_lrf(sw);
> >  
> >  	return ret;
> >  }
> > diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> > index ddbf0cd78377..3bec35f78d51 100644
> > --- a/drivers/thunderbolt/tb.h
> > +++ b/drivers/thunderbolt/tb.h
> > @@ -1336,6 +1336,9 @@ bool usb4_port_asym_supported(struct tb_port *port);
> >  int usb4_port_asym_set_link_width(struct tb_port *port, enum tb_link_width width);
> >  int usb4_port_asym_start(struct tb_port *port);
> >  
> > +bool usb4_enable_lrf(struct tb_switch *sw);
> 
> int usb4_port_link_recovery_enable(struct tb_port *port);
> 
> > +bool usb4_disable_lrf(struct tb_switch *sw);
> 
> void usb4_port_link_recovery_disable(struct tb_port *port);
> 

Here, you have suggested to return int for enabling but void for disabling.
Let’s also check my next comment.

> and move these above the asym port functions.
> 
> > +
> >  /**
> >   * enum tb_sb_target - Sideband transaction target
> >   * @USB4_SB_TARGET_ROUTER: Target is the router itself
> > diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
> > index 4e43b47f9f11..085139e1a958 100644
> > --- a/drivers/thunderbolt/tb_regs.h
> > +++ b/drivers/thunderbolt/tb_regs.h
> > @@ -398,6 +398,7 @@ struct tb_regs_port_header {
> >  #define PORT_CS_19_WOD				BIT(17)
> >  #define PORT_CS_19_WOU4				BIT(18)
> >  #define PORT_CS_19_START_ASYM			BIT(24)
> > +#define PORT_CS_19_ELR				BIT(31)
> >  
> >  /* Display Port adapter registers */
> >  #define ADP_DP_CS_0				0x00
> > diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
> > index e51d01671d8e..49dd3d201617 100644
> > --- a/drivers/thunderbolt/usb4.c
> > +++ b/drivers/thunderbolt/usb4.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/ktime.h>
> >  #include <linux/units.h>
> > +#include <linux/string_helpers.h>
> >  
> >  #include "sb_regs.h"
> >  #include "tb.h"
> > @@ -1518,6 +1519,130 @@ bool usb4_port_clx_supported(struct tb_port *port)
> >  	return !!(val & PORT_CS_18_CPS);
> >  }
> >  
> > +static int __usb4_port_lrf_enable(struct tb_port *port,
> > +		       bool enable, bool *was_enable)
> > +{
> > +	int ret;
> > +	u32 val;
> > +
> > +	ret = tb_port_read(port, &val, TB_CFG_PORT,
> > +			   port->cap_usb4 + PORT_CS_19, 1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*was_enable |= !!(val & PORT_CS_19_ELR);
> > +
> > +	if (enable)
> > +		val |= PORT_CS_19_ELR;
> > +	else
> > +		val &= ~PORT_CS_19_ELR;
> > +
> > +	ret = tb_port_write(port, &val, TB_CFG_PORT,
> > +			    port->cap_usb4 + PORT_CS_19, 1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	tb_port_dbg(port, "ELR %s\n", str_enabled_disabled(enable));
> 
> tb_port_dbg(port, "link recovery %s\n", ...)
> 
> Ditto below.
> 
> > +	return 0;
> > +}
> > +
> > +static int usb4_switch_lrf_enable(struct tb_switch *sw)
> > +{
> > +	bool was_enable = false;
> > +	struct tb_port *up, *down;
> > +	int ret;
> 
> Reverse christmas tree:
> 
> 	struct tb_port *up, *down;
> 	bool was_enable = false;
> 	int ret;
> 
> Ditto everywhere.
> 
> > +
> > +	up = tb_upstream_port(sw);
> > +	down = tb_switch_downstream_port(sw);
> > +
> > +	ret = __usb4_port_lrf_enable(up, true, &was_enable);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = __usb4_port_lrf_enable(down, true, &was_enable);
> > +	if (ret)
> > +		return ret;
> > +
> > +	tb_sw_dbg(sw, "ELR %s\n", str_enabled_disabled(true));
> > +
> > +	return 0;
> > +}
> > +
> > +static int usb4_switch_lrf_disable(struct tb_switch *sw)
> > +{
> > +	bool was_enable = false;
> > +	struct tb_port *up, *down;
> > +	int ret;
> > +
> > +	up = tb_upstream_port(sw);
> > +	down = tb_switch_downstream_port(sw);
> > +
> > +	ret = __usb4_port_lrf_enable(up, false, &was_enable);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = __usb4_port_lrf_enable(down, false, &was_enable);
> > +	if (ret)
> > +		return ret;
> > +
> > +	tb_sw_dbg(sw, "ELR %s\n", str_enabled_disabled(false));
> > +
> > +	/* At least one ELR has been disabled */
> > +	return was_enable ? 1 : 0;
> 
> Just return 0 in case of success.
> 

If we return 0 on success when disabling Link Recovery, we won’t be able
to restore ELR to its previous state before the asymmetric transition.
As a result, enabling Link Recovery will become a side effect of
asymmetric transitions. I’m not sure—is that acceptable?

> > +}
> > +
> > +/**
> > + * usb4_disable_lrf() - Enables Link Recovery flow up to host router
> > + * @sw: Router to start
> > + *
> > + * Enables Link Recovery flow from @sw up to the host router.
> > + * Returns true if every Link Recovery flow was successfully enabled.
> > + */
> > +bool usb4_enable_lrf(struct tb_switch *sw)
> > +{
> > +	bool enabled = true;
> > +
> > +	do {
> > +		if (usb4_switch_lrf_enable(sw) < 0) {
> > +			tb_sw_warn(sw, "failed to enable Link Recovery flow\n");
> > +			enabled = false;
> > +		}
> > +
> > +		sw = tb_switch_parent(sw);
> > +	} while (sw);
> > +
> > +	return enabled;
> > +}
> 
> This should go to tb.c and called tb_enable_link_recovery() analogous to
> tb_enable_clx() and it calls the low-level usb4_port_link_recovery..
> functions.
> 
> Ditto below.
> 

Just to confirm my understanding, here’s what I plan to do based on
your instructions:

I’ll add two port-level functions in usb4.c:

int usb4_port_link_recovery_enable(struct tb_port *port);
void usb4_port_link_recovery_disable(struct tb_port *port);

And two functions in tb.c:

int tb_enable_link_recovery(struct tb_switch *sw);
int tb_disable_link_recovery(struct tb_switch *sw);

Both will return 0 on success.

In tb_configure_asym(), I won’t be using the return value from
either of these two functions.

> > +
> > +/**
> > + * usb4_disable_lrf() - Disable Link Recovery flow up to host router
> > + * @sw: Router to start
> > + *
> > + * Disables Link Recovery flow from @sw up to the host router.
> > + * Returns true if any Link Recovery flow was disabled. This
> > + * can be used to figure out whether the link was setup by us
> > + * or the boot firmware so we don't accidentally enable them if
> > + * they were not enabled during discovery.
> 
> Okay I think you copied the CLx part here, no? How did you test this?
> 

The way we should handle Link Recovery seems quite similar to CL states.

I should have mentioned this in my first email, unfortunately,
I don’t have access to any Gen 4 hosts or devices for testing.

> > + */
> > +bool usb4_disable_lrf(struct tb_switch *sw)
> > +{
> > +	bool disabled = false;
> > +
> > +	do {
> > +		int ret;
> > +
> > +		ret = usb4_switch_lrf_disable(sw);
> > +		if (ret > 0)
> > +			disabled = true;
> > +		else if (ret < 0)
> > +			tb_sw_warn(sw, "Link Recovery flow cannot be disabled\n");
> > +
> > +		sw = tb_switch_parent(sw);
> > +	} while (sw);
> > +
> > +	return disabled;
> > +}
> > +
> >  /**
> >   * usb4_port_asym_supported() - If the port supports asymmetric link
> >   * @port: USB4 port
> > -- 
> > 2.45.2

