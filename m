Return-Path: <linux-usb+bounces-19845-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D0AA21CD7
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 12:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C667167180
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 11:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77DCB1DDC0F;
	Wed, 29 Jan 2025 11:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkOLFhfS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA9B1D934D;
	Wed, 29 Jan 2025 11:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151894; cv=none; b=hPK1tPA2JWJ7UXPH5yzrastGbwBSKsnmZZjXr9veIjUjAM1hGRef6Au0IJzU3q3MoqIHiR5Ii14D8j2zyzwYuzzxshKIS1kTwI/JMzS7U9fEnpw0uQRh7XreYibtuxv1+qpvRLvwoPFo/tptk5QrtUQ+H8hk/Fku1pBQb2KGuvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151894; c=relaxed/simple;
	bh=8YXKEWzppYBjuqEdLjBJDG6bd49t6X3e8TAyZdnuezg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQ+/kYU6QL7rir36H5eDJzdEqrDFEOXFVBIGdkzpLhgkIgzLg7g3hKLBT46/LokJArGsW63fAeCnZGovLFhP3YPw2ws0oVriSvEU90foTjqD8DWplBxWKMhSWa4id3NdIkVaG2GWES9uqd62Q2rOk6jKmCsVNWvAcEDI8A6ZnnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkOLFhfS; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso9320461a91.1;
        Wed, 29 Jan 2025 03:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738151890; x=1738756690; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GXxgbWgq9auGiC5HpmME8OnVS/WzFc9H4/wz2KgfOl0=;
        b=KkOLFhfSskfaLB8+REeOR8BEWUUnz+r4RhcG8kGDLEGAC02Omp2R6cSWyPdMbcQUaq
         vC+MEgyogbGMur1+HQuGV8bo3oqdLrCGGD5R1gtRXNBjOELlGvtTfHw94q9uAWMz5xk1
         lAekN3UoWZldy5bfouSYvVJSTGMq9xcy/XQN2R/CqdR8f3QtvWLdHMQBAOS1qWni8Vr4
         pRBGk9zWJF9kxRrkbWTHYYQt9h3W4LsbvASGg5SyHPHWr88QzV5BNVhw0uJAfG2frgvM
         PhgrgkSfhWqKDlic0rdNFPXdBvj2o6bZKYX4aqX6KQRaS+7cl7fQ6kJnebRhS5rm+j3e
         7ibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738151890; x=1738756690;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXxgbWgq9auGiC5HpmME8OnVS/WzFc9H4/wz2KgfOl0=;
        b=jXILWjsPaNfX58JhsKkwwtRnRGIpVGVME7OQVvQIY8NWLfOWlXOWcUQ2l8rDIbkYgA
         yFR2kYnuT9m7RuQfkrNJ6fcerpU3R+FPGdsI8rYBfOsHZf5g58puDrINMcTsvMKAXSmB
         LvDWupBBsQJ8zqR9X1dkC/kTjKXk385DZFlg8AsTMC74u4QqZ9V/m+EXIePcDXX9+y56
         Zk6rZIDh8QIWpDiHbI1IphCPU3apGeOjY8rzjcn4Prj2OXYr8mchDDv7QN4gytAerS/4
         nlkGZ6aRUkr25Pb2Ee7Bcmg+RBYPsBKyUK6ZN3yBIQpFZX3+eCukAyIcOfxA1lhwUf3P
         g3vw==
X-Forwarded-Encrypted: i=1; AJvYcCUYXudsEq6+iTJwVbV/I3d3cq7BODFMXu9LmAqGOL2SLPVLfbsNobpFNTMxpH0VhgXSbeDCAq1DtXpx@vger.kernel.org, AJvYcCVAPKxlWlZjMMBlbhvZZVd8gW8HlU/erHi3i/ony/IOr/c4dDTSm52corWg/PWCk2vPB5McrsncgpofWrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMRNRI4T1O5uCc+Wa9FsL1DeB6ujqHhUk4i+E65xYtExs+HGYL
	r0V5Ho75jEwSgWQ/qkcLrKIZT9nTScJRn6141OnWgZ+B3EMbtfdo
X-Gm-Gg: ASbGncuTW50edCCKeWt/kTBj1ye5J+LO1W4D3WgNdR3K/CNdgsKtFYK4PwXX9RP8snh
	TxA7AV6gdvCPtsDbux6qLESc97m3Ajcc6qAvko2lXQp4RDlIzQjgNbf3Qa7YukDwTDxQjBjlrOv
	1Bdq79BhQnE6KF1FeGFj+FHgUPBzeqBmoZsn7jko1s84zBzUH5pr0mwHLmjHoXu9xjP5yvl0R7E
	gzlEtqAj7MjisFrR8plGjCaPyL3n5+HVzdyKeMZNZ0nMZ8foRs/cgdZ2N7brivmXvg/5gTLAy/N
	Tj23Skcq0oqT/w==
X-Google-Smtp-Source: AGHT+IELR6Oy3ZpAHouOgGPloxeKJf5uwE0k+vzD2DfxKguvjlxuN6FhxHUmxCYzCBsaJw8QRvtnig==
X-Received: by 2002:a17:90a:c2c4:b0:2f1:3355:4a8f with SMTP id 98e67ed59e1d1-2f83abc3636mr3777692a91.4.1738151889914;
        Wed, 29 Jan 2025 03:58:09 -0800 (PST)
Received: from ubuntu ([175.141.178.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bcd1699sm1585684a91.14.2025.01.29.03.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 03:58:09 -0800 (PST)
Date: Wed, 29 Jan 2025 11:41:58 +0000
From: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com, 
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Disable Gen 4 Recovery on Asymmetric
 Transitions
Message-ID: <hx3zlixeshc4cghfthcbo33nlstst7mxxnqpdl5pj653pvk4it@s4cyqkbkwug2>
References: <20250128163605.19222-1-rahimi.mhmmd@gmail.com>
 <20250129063148.GT3713119@black.fi.intel.com>
 <tycnnkwktd4iryegey2xysib3przadada5o7xuqrt5qfxqdtdc@22gg5ssed6sc>
 <20250129114804.GU3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129114804.GU3713119@black.fi.intel.com>

Hello, thank you for your prompt reply!

On Wed, Jan 29, 2025 at 01:48:04PM GMT, Mika Westerberg wrote:
> Hi,
> 
> On Wed, Jan 29, 2025 at 11:24:33AM +0000, Mohammad Rahimi wrote:
> > Hello! Thanks for the thorough review.
> > 
> > On Wed, Jan 29, 2025 at 08:31:48AM GMT, Mika Westerberg wrote:
> > > Hi,
> > > 
> > > On Tue, Jan 28, 2025 at 04:36:05PM +0000, Mohammad Rahimi wrote:
> > > > Updates the Connection Manager to disable the Gen 4 Link Recovery
> > > > flow before transitioning from a Symmetric Link to an Asymmetric
> > > > Link, as specified in recent changes to the USB4 v2 specification.
> > > > 
> > > > According to the "USB4 2.0 ENGINEERING CHANGE NOTICE FORM"
> > > > published in September 2024, the rationale for this change is:
> > > > 
> > > >   "Since the default value of the Target Asymmetric Link might be
> > > >   different than Symmetric Link and Gen 4 Link Recovery flow checks
> > > >   this field to make sure it matched the actual Negotiated Link Width,
> > > >   we’re removing the condition for a Disconnect in the Gen 4 Link
> > > >   Recovery flow when Target Asymmetric Link doesn’t match the actual
> > > >   Link width and adding a Connection Manager note to Disable Gen 4 Link
> > > >   Recovery flow before doing Asymmetric Transitions."
> > > > 
> > > > Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
> > > > ---
> > > >  drivers/thunderbolt/tb.c      |  23 ++++---
> > > >  drivers/thunderbolt/tb.h      |   3 +
> > > >  drivers/thunderbolt/tb_regs.h |   1 +
> > > >  drivers/thunderbolt/usb4.c    | 125 ++++++++++++++++++++++++++++++++++
> > > >  4 files changed, 142 insertions(+), 10 deletions(-)
> > > > 
> > > > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > > > index a7c6919fbf97..da53e4619eca 100644
> > > > --- a/drivers/thunderbolt/tb.c
> > > > +++ b/drivers/thunderbolt/tb.c
> > > > @@ -1013,7 +1013,7 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
> > > >  			     struct tb_port *dst_port, int requested_up,
> > > >  			     int requested_down)
> > > >  {
> > > > -	bool clx = false, clx_disabled = false, downstream;
> > > > +	bool clx_was_enable = false, lrf_was_enable = false, downstream;
> > > 
> > > Let's call it link_recovery instead of lrf.
> > > 
> > > >  	struct tb_switch *sw;
> > > >  	struct tb_port *up;
> > > >  	int ret = 0;
> > > > @@ -1075,14 +1075,12 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
> > > >  			continue;
> > > >  
> > > >  		/*
> > > > -		 * Disable CL states before doing any transitions. We
> > > > -		 * delayed it until now that we know there is a real
> > > > -		 * transition taking place.
> > > > +		 * Disable CL states and Link Recovery flow before doing any
> > > > +		 * transitions. We delayed it until now that we know there is
> > > > +		 * a real transition taking place.
> > > >  		 */
> > > > -		if (!clx_disabled) {
> > > > -			clx = tb_disable_clx(sw);
> > > > -			clx_disabled = true;
> > > > -		}
> > > > +		clx_was_enable = tb_disable_clx(sw);
> > > > +		lrf_was_enable = usb4_disable_lrf(sw);
> > > 
> > > The naming is off here and I suggest to do this per USB4 port not per
> > > router. See below.
> > > 
> > 
> > Sure, I'll handle it per port. Please see my question below.
> > 
> > > >  		tb_sw_dbg(up->sw, "configuring asymmetric link\n");
> > > >  
> > > > @@ -1097,9 +1095,14 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
> > > >  		}
> > > >  	}
> > > >  
> > > > -	/* Re-enable CL states if they were previosly enabled */
> > > > -	if (clx)
> > > > +	/*
> > > > +	 * Re-enable CL states and Link Recovery flow if
> > > > +	 * they were previosly enabled
> > > > +	 */
> > > > +	if (clx_was_enable)
> > > >  		tb_enable_clx(sw);
> > > > +	if (lrf_was_enable)
> > > > +		usb4_enable_lrf(sw);
> > > >  
> > > >  	return ret;
> > > >  }
> > > > diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> > > > index ddbf0cd78377..3bec35f78d51 100644
> > > > --- a/drivers/thunderbolt/tb.h
> > > > +++ b/drivers/thunderbolt/tb.h
> > > > @@ -1336,6 +1336,9 @@ bool usb4_port_asym_supported(struct tb_port *port);
> > > >  int usb4_port_asym_set_link_width(struct tb_port *port, enum tb_link_width width);
> > > >  int usb4_port_asym_start(struct tb_port *port);
> > > >  
> > > > +bool usb4_enable_lrf(struct tb_switch *sw);
> > > 
> > > int usb4_port_link_recovery_enable(struct tb_port *port);
> > > 
> > > > +bool usb4_disable_lrf(struct tb_switch *sw);
> > > 
> > > void usb4_port_link_recovery_disable(struct tb_port *port);
> > > 
> > 
> > Here, you have suggested to return int for enabling but void for disabling.
> > Let’s also check my next comment.
> > 
> > > and move these above the asym port functions.
> > > 
> > > > +
> > > >  /**
> > > >   * enum tb_sb_target - Sideband transaction target
> > > >   * @USB4_SB_TARGET_ROUTER: Target is the router itself
> > > > diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
> > > > index 4e43b47f9f11..085139e1a958 100644
> > > > --- a/drivers/thunderbolt/tb_regs.h
> > > > +++ b/drivers/thunderbolt/tb_regs.h
> > > > @@ -398,6 +398,7 @@ struct tb_regs_port_header {
> > > >  #define PORT_CS_19_WOD				BIT(17)
> > > >  #define PORT_CS_19_WOU4				BIT(18)
> > > >  #define PORT_CS_19_START_ASYM			BIT(24)
> > > > +#define PORT_CS_19_ELR				BIT(31)
> > > >  
> > > >  /* Display Port adapter registers */
> > > >  #define ADP_DP_CS_0				0x00
> > > > diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
> > > > index e51d01671d8e..49dd3d201617 100644
> > > > --- a/drivers/thunderbolt/usb4.c
> > > > +++ b/drivers/thunderbolt/usb4.c
> > > > @@ -10,6 +10,7 @@
> > > >  #include <linux/delay.h>
> > > >  #include <linux/ktime.h>
> > > >  #include <linux/units.h>
> > > > +#include <linux/string_helpers.h>
> > > >  
> > > >  #include "sb_regs.h"
> > > >  #include "tb.h"
> > > > @@ -1518,6 +1519,130 @@ bool usb4_port_clx_supported(struct tb_port *port)
> > > >  	return !!(val & PORT_CS_18_CPS);
> > > >  }
> > > >  
> > > > +static int __usb4_port_lrf_enable(struct tb_port *port,
> > > > +		       bool enable, bool *was_enable)
> > > > +{
> > > > +	int ret;
> > > > +	u32 val;
> > > > +
> > > > +	ret = tb_port_read(port, &val, TB_CFG_PORT,
> > > > +			   port->cap_usb4 + PORT_CS_19, 1);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	*was_enable |= !!(val & PORT_CS_19_ELR);
> > > > +
> > > > +	if (enable)
> > > > +		val |= PORT_CS_19_ELR;
> > > > +	else
> > > > +		val &= ~PORT_CS_19_ELR;
> > > > +
> > > > +	ret = tb_port_write(port, &val, TB_CFG_PORT,
> > > > +			    port->cap_usb4 + PORT_CS_19, 1);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	tb_port_dbg(port, "ELR %s\n", str_enabled_disabled(enable));
> > > 
> > > tb_port_dbg(port, "link recovery %s\n", ...)
> > > 
> > > Ditto below.
> > > 
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int usb4_switch_lrf_enable(struct tb_switch *sw)
> > > > +{
> > > > +	bool was_enable = false;
> > > > +	struct tb_port *up, *down;
> > > > +	int ret;
> > > 
> > > Reverse christmas tree:
> > > 
> > > 	struct tb_port *up, *down;
> > > 	bool was_enable = false;
> > > 	int ret;
> > > 
> > > Ditto everywhere.
> > > 
> > > > +
> > > > +	up = tb_upstream_port(sw);
> > > > +	down = tb_switch_downstream_port(sw);
> > > > +
> > > > +	ret = __usb4_port_lrf_enable(up, true, &was_enable);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	ret = __usb4_port_lrf_enable(down, true, &was_enable);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	tb_sw_dbg(sw, "ELR %s\n", str_enabled_disabled(true));
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int usb4_switch_lrf_disable(struct tb_switch *sw)
> > > > +{
> > > > +	bool was_enable = false;
> > > > +	struct tb_port *up, *down;
> > > > +	int ret;
> > > > +
> > > > +	up = tb_upstream_port(sw);
> > > > +	down = tb_switch_downstream_port(sw);
> > > > +
> > > > +	ret = __usb4_port_lrf_enable(up, false, &was_enable);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	ret = __usb4_port_lrf_enable(down, false, &was_enable);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	tb_sw_dbg(sw, "ELR %s\n", str_enabled_disabled(false));
> > > > +
> > > > +	/* At least one ELR has been disabled */
> > > > +	return was_enable ? 1 : 0;
> > > 
> > > Just return 0 in case of success.
> > > 
> > 
> > If we return 0 on success when disabling Link Recovery, we won’t be able
> > to restore ELR to its previous state before the asymmetric transition.
> > As a result, enabling Link Recovery will become a side effect of
> > asymmetric transitions. I’m not sure—is that acceptable?
> 
> I missed the fact that you are using the positive return value to indicated
> whether link recovery was enabled.
> 
> The port functions can return the previous value like:
> 
> 	ret = usb4_port_link_recovery_enable(up);
> 
> then ret contains < 0 in case of error, 0 if it was not enabled > 0 if it
> was.
> 
> > > > +}
> > > > +
> > > > +/**
> > > > + * usb4_disable_lrf() - Enables Link Recovery flow up to host router
> > > > + * @sw: Router to start
> > > > + *
> > > > + * Enables Link Recovery flow from @sw up to the host router.
> > > > + * Returns true if every Link Recovery flow was successfully enabled.
> > > > + */
> > > > +bool usb4_enable_lrf(struct tb_switch *sw)
> > > > +{
> > > > +	bool enabled = true;
> > > > +
> > > > +	do {
> > > > +		if (usb4_switch_lrf_enable(sw) < 0) {
> > > > +			tb_sw_warn(sw, "failed to enable Link Recovery flow\n");
> > > > +			enabled = false;
> > > > +		}
> > > > +
> > > > +		sw = tb_switch_parent(sw);
> > > > +	} while (sw);
> > > > +
> > > > +	return enabled;
> > > > +}
> > > 
> > > This should go to tb.c and called tb_enable_link_recovery() analogous to
> > > tb_enable_clx() and it calls the low-level usb4_port_link_recovery..
> > > functions.
> > > 
> > > Ditto below.
> > > 
> > 
> > Just to confirm my understanding, here’s what I plan to do based on
> > your instructions:
> > 
> > I’ll add two port-level functions in usb4.c:
> > 
> > int usb4_port_link_recovery_enable(struct tb_port *port);
> > void usb4_port_link_recovery_disable(struct tb_port *port);
> 
> Yes.
> 
> > And two functions in tb.c:
> > 
> > int tb_enable_link_recovery(struct tb_switch *sw);
> > int tb_disable_link_recovery(struct tb_switch *sw);
> > 
> 
> It can even be one function to avoid duplicating code.
> 
> > Both will return 0 on success.
> > 
> > In tb_configure_asym(), I won’t be using the return value from
> > either of these two functions.
> 
> It should be checking the the return value and act accordingly. For example
> what happens if disabling link recovery fails? Is that error situation or
> should we continue configuring asymmetric link? Think also from users'
> perspective.
> 

Thanks again for the clear explanation. I will do that.

> > > > +
> > > > +/**
> > > > + * usb4_disable_lrf() - Disable Link Recovery flow up to host router
> > > > + * @sw: Router to start
> > > > + *
> > > > + * Disables Link Recovery flow from @sw up to the host router.
> > > > + * Returns true if any Link Recovery flow was disabled. This
> > > > + * can be used to figure out whether the link was setup by us
> > > > + * or the boot firmware so we don't accidentally enable them if
> > > > + * they were not enabled during discovery.
> > > 
> > > Okay I think you copied the CLx part here, no? How did you test this?
> > > 
> > 
> > The way we should handle Link Recovery seems quite similar to CL states.
> 
> Yeah but you copied
> 
> * can be used to figure out whether the link was setup by us
> * or the boot firmware so we don't accidentally enable them if
> * they were not enabled during discovery.
> 
> and that does not even apply for USB4 v2 host routers by default since we
> don't do discovery by default.
> 

My bad. Didn't know.

> > I should have mentioned this in my first email, unfortunately,
> > I don’t have access to any Gen 4 hosts or devices for testing.
> 
> I think this needs to get some testing on real hardware. I have here some
> so I can try the next version.

Great! Could you let me know what you are using for testing?


