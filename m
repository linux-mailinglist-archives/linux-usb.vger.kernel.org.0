Return-Path: <linux-usb+bounces-18525-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9929F2B6D
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2024 09:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12C93188BFAD
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2024 08:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7D91FF7B8;
	Mon, 16 Dec 2024 08:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mqXk20Un"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527B4200130
	for <linux-usb@vger.kernel.org>; Mon, 16 Dec 2024 08:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734336033; cv=none; b=MjDhYcqXONH57MxgBtcH4WvXplPV9UiL+XUPUuT6H5z3cWT8o+4At8EsdPkiIUm1SC2SIKQtCgFRdTO+tnSpFw2KWcmw27Gx5szBiVmsScAMeZyK4LRf5j6wOhM1rJBP8dcxoPbLk/9qwj5FoZ65Whfi13ZRmMR5GyWE+RhfMeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734336033; c=relaxed/simple;
	bh=YHMQh7PBD5YcMU2XjIhyBSU01aIiLkkQ05dWV1EyFTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENtX1Go2RazDj8M+R/ahHVhm3MJhuBin/vbpiHSWQe732gj1DxcPESWYwin4fd7a+3H5qMvfSXgPfkbwVy6jgjV5vzu6yU1y62v5Xlzy3m5OWJX6T62FPa0FTvLD4HF7mKV02XEcdY7Ns3u6jb5n9pzG/iZpilOGJP7ZYcha+uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mqXk20Un; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734336033; x=1765872033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YHMQh7PBD5YcMU2XjIhyBSU01aIiLkkQ05dWV1EyFTA=;
  b=mqXk20UnY3e4d5XEJ/D8CMFCjruN/AIsPoiTZBppaNgG52Ae5dtRFnLt
   T6HGcinXkv+5YVoEuDCmZEhhbWKTGwJnoGePhldsEOjkK4MgPJUes3/MS
   +A5va4OdZQltR/wW14TpwZvLWkLz0Fy5zU6BR1/GVynd2KBElh0atzxxH
   9APbJWZdlmn2ylLpLc4gZMoXjhMjrhQiOXHeeGNnZRMUfHpBeBjpDGnkk
   E5EzY9D4jvrJFAfstQ8Hx9tjcD671kvqFtpDklNbnZm3kSQ3B+0U7KH4t
   yr98cWAEiakKkQGag02M0TAPRpKC+/ly592kdrnOUKcRj71Mr+IpssVmw
   g==;
X-CSE-ConnectionGUID: HeA4NUxiSjWcQHW/eS4tmw==
X-CSE-MsgGUID: hiuQSroISfWOgHlA9VQAaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45712373"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45712373"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 00:00:32 -0800
X-CSE-ConnectionGUID: Q6KrF5TQSyK1iO6aEPRELA==
X-CSE-MsgGUID: h05dHur5T+m8dTP/qQdU1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96977837"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 16 Dec 2024 00:00:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 36F5B329; Mon, 16 Dec 2024 10:00:27 +0200 (EET)
Date: Mon, 16 Dec 2024 10:00:27 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Aaron Rainbolt <arainbolt@kfocus.org>
Subject: Re: [PATCH] thunderbolt: Improve redrive mode handling
Message-ID: <20241216080027.GD3713119@black.fi.intel.com>
References: <20241211103529.2302706-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211103529.2302706-1-mika.westerberg@linux.intel.com>

On Wed, Dec 11, 2024 at 12:35:29PM +0200, Mika Westerberg wrote:
> When USB-C monitor is connected directly to Intel Barlow Ridge host, it
> goes into "redrive" mode that basically routes the DisplayPort signals
> directly from the GPU to the USB-C monitor without any tunneling needed.
> However, the host router must be powered on for this to work. Aaron
> reported that there are a couple of cases where this will not work with
> the current code:
> 
>   - Booting with USB-C monitor plugged in.
>   - Plugging in USB-C monitor when the host router is in sleep state
>     (runtime suspended).
>   - Plugging in USB-C device while the system is in system sleep state.
> 
> In all these cases once the host router is runtime suspended the picture
> on the connected USB-C display disappears too. This is certainly not
> what the user expected.
> 
> For this reason improve the redrive mode handling to keep the host
> router from runtime suspending when detect that any of the above cases
> is happening.
> 
> Fixes: a75e0684efe5 ("thunderbolt: Keep the domain powered when USB4 port is in redrive mode")
> Reported-by: Aaron Rainbolt <arainbolt@kfocus.org>
> Closes: https://lore.kernel.org/linux-usb/20241009220118.70bfedd0@kf-ir16/
> Cc: stable@vger.kernel.org
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/fixes.

