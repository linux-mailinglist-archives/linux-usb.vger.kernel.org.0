Return-Path: <linux-usb+bounces-19074-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28945A0426B
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 15:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 236991889A7C
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 14:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68621F2360;
	Tue,  7 Jan 2025 14:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBggmnlE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617891F1917
	for <linux-usb@vger.kernel.org>; Tue,  7 Jan 2025 14:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736259847; cv=none; b=qBJamXbdt6/ONlsJWWPvcfRWaXM3BxsSyEOV4Ho4jl70LuGg9caUx7x4pKDdVK+1HO4A8OZ59bjZJ3sYRJWhm3uXeCUbpRatCpMoeHfll7kGUGaxhnErR94OUvDZnYpOioOetqXvb48MwP1GXXdcZNoz+OMqbzhcm4dAs6EUc3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736259847; c=relaxed/simple;
	bh=DKUB5N6zBRnsUz40+1DfTxbA9feQPoygT1xKXdZu1gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLS2s6XFWM8P/6Mi1DQROBqlgdeoCT7EzYHyx3zq9qUXwCXDXahjX/x/HcymYHj1c6egsp5mN3+Y5mIpxSrnZ14YL3BL4IrDs5EdoL+zvcgD/vhNFlkuBCYFew++PkrNGJYkr8wWQhQXk5eT5QgMO24FpFY7RyTmq+63Okr1NPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBggmnlE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736259846; x=1767795846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DKUB5N6zBRnsUz40+1DfTxbA9feQPoygT1xKXdZu1gk=;
  b=fBggmnlEFolKbcmdqtoXhAdzjEyjzGNl++ykRj+TbCFFZnlwv4x9F1mW
   sD3i5nbTbMSpJ9ipqRouNYsj62JJ4a39+3r/9R+ovzpheNdhZ8mFZKL5d
   0g2DfpS0DH4w8MgVUIWdMDphPmPEfUJ61/zQPSR22G2sO7kLi1DR5NqB0
   AKCC7zbWkvD1F/B+0zjVeXtUyeI0L/hIDk5y6cjecIF2a6nKfuSrmWw+u
   mWmlbC1Q7kwSzXtOPvbTY5JNAA+0CG6CwOX3WCLdGdgQhPwZYXJbveiBC
   k5sCTivYMYhQ6qvOE04gXA7IG8muhr1Pp5SedDl7nUbcbPcEo9qbECQ/9
   A==;
X-CSE-ConnectionGUID: 3hzWiFnHRmCexNChfLQFTg==
X-CSE-MsgGUID: g0xso2nqRKaE0sT27J9tUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47435853"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="47435853"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 06:24:05 -0800
X-CSE-ConnectionGUID: ZXGBPImtQyiSb5bG1+q/Pw==
X-CSE-MsgGUID: 36RdC2GzSlKpX4rrigxShg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102654212"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa010.jf.intel.com with SMTP; 07 Jan 2025 06:24:03 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 07 Jan 2025 16:24:01 +0200
Date: Tue, 7 Jan 2025 16:24:01 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: [bug report] usb: typec: Add driver for Thunderbolt 3 Alternate
 Mode
Message-ID: <Z305AQk4awMzPycL@kuha.fi.intel.com>
References: <48dbbbab-3d09-4162-9d76-74c9baca6603@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48dbbbab-3d09-4162-9d76-74c9baca6603@stanley.mountain>

+Abhishek

On Tue, Jan 07, 2025 at 05:16:43PM +0300, Dan Carpenter wrote:
> Hello Heikki Krogerus,
> 
> Commit 100e25738659 ("usb: typec: Add driver for Thunderbolt 3
> Alternate Mode") from Dec 13, 2024 (linux-next), leads to the
> following (unpublished) Smatch static checker warnings:
> 
> drivers/usb/typec/altmodes/thunderbolt.c:116 tbt_altmode_work() warn: why is zero skipped 'i'
> drivers/usb/typec/altmodes/thunderbolt.c:147 tbt_enter_modes_ordered() warn: why is zero skipped 'i'
> drivers/usb/typec/altmodes/thunderbolt.c:153 tbt_enter_modes_ordered() info: return a literal instead of 'ret'
> drivers/usb/typec/altmodes/thunderbolt.c:328 tbt_altmode_remove() warn: why is zero skipped 'i'
> drivers/usb/typec/altmodes/thunderbolt.c:354 tbt_ready() warn: 'plug' is not an error pointer
> 
> drivers/usb/typec/altmodes/thunderbolt.c
>     66 static void tbt_altmode_work(struct work_struct *work)
>     67 {
>     68         struct tbt_altmode *tbt = container_of(work, struct tbt_altmode, work);
>     69         int ret;
>     70 
>     71         mutex_lock(&tbt->lock);
>     72 
>     73         switch (tbt->state) {
>     74         case TBT_STATE_SOP_P_ENTER:
>     75                 ret = typec_cable_altmode_enter(tbt->alt, TYPEC_PLUG_SOP_P, NULL);
>     76                 if (ret) {
>     77                         dev_dbg(&tbt->plug[TYPEC_PLUG_SOP_P]->dev,
>     78                                 "failed to enter mode (%d)\n", ret);
>     79                         goto disable_plugs;
>     80                 }
>     81                 break;
>     82         case TBT_STATE_SOP_PP_ENTER:
>     83                 ret = typec_cable_altmode_enter(tbt->alt, TYPEC_PLUG_SOP_PP,  NULL);
>     84                 if (ret) {
>     85                         dev_dbg(&tbt->plug[TYPEC_PLUG_SOP_PP]->dev,
>     86                                 "failed to enter mode (%d)\n", ret);
>     87                         goto disable_plugs;
>     88                 }
>     89                 break;
>     90         case TBT_STATE_ENTER:
>     91                 ret = tbt_enter_mode(tbt);
>     92                 if (ret)
>     93                         dev_dbg(&tbt->alt->dev, "failed to enter mode (%d)\n",
>     94                                 ret);
>     95                 break;
>     96         case TBT_STATE_EXIT:
>     97                 typec_altmode_exit(tbt->alt);
>     98                 break;
>     99         case TBT_STATE_SOP_PP_EXIT:
>     100                 typec_cable_altmode_exit(tbt->alt, TYPEC_PLUG_SOP_PP);
>     101                 break;
>     102         case TBT_STATE_SOP_P_EXIT:
>     103                 typec_cable_altmode_exit(tbt->alt, TYPEC_PLUG_SOP_P);
>     104                 break;
>     105         default:
>     106                 break;
>     107         }
>     108 
>     109         tbt->state = TBT_STATE_IDLE;
>     110 
>     111         mutex_unlock(&tbt->lock);
>     112         return;
>     113 
>     114 disable_plugs:
>     115         for (int i = TYPEC_PLUG_SOP_PP; i > 0; --i) {
>                                                 ^^^^^
> These should be >= 0.  Humans are bad at counting backwards.
> 
> --> 116                 if (tbt->plug[i])
>     117                         typec_altmode_put_plug(tbt->plug[i]);
>     118 
>     119                 tbt->plug[i] = NULL;
>     120         }
>     121 
>     122         tbt->state = TBT_STATE_ENTER;
>     123         schedule_work(&tbt->work);
>     124         mutex_unlock(&tbt->lock);
>     125 }

Abhishek, this looks straighforward, but just in case, can you take
look?

thanks,

-- 
heikki

