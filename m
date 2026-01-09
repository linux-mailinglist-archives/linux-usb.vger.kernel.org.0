Return-Path: <linux-usb+bounces-32113-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 20436D0A536
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 14:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3451F30259D8
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 13:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20DA35BDDD;
	Fri,  9 Jan 2026 13:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URXrZvXw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF412857FA;
	Fri,  9 Jan 2026 13:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767964572; cv=none; b=Md1DV6GHuh4xfJLXLzkHCecmh3jQ7pIWISw8tczD7tioYYaUFSTujnXQjSKYqkJ1b8Z0e57UO3Gn53HTkHZkAfV804RWFtq8PyezMF4wG2XuCLhoMwcUnvTMjKcixjLmk9gxsMyIUnjGkvE7q2KqctoW6srNnaTnW74aGjQ/ay0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767964572; c=relaxed/simple;
	bh=RrJsJcfKWs2Eg0JH/bR8NjfJepen3ZOxs3LygZYNGWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrpKG9ZeMZ7MsEkj9tQo6BxqP/iL5ITeFvBabXx9XKjkHdautMN5fdaq1uJlMUhych9x4ZzqRGy1+xgqYDfRAUXHyMaziS6j5/1E361oe9REgEDcwVg9DOASDPzVszOPabEA1UKW22zcDJvbxvgT0/HXsKkOaS2QjU8T8qsVLhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URXrZvXw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767964570; x=1799500570;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RrJsJcfKWs2Eg0JH/bR8NjfJepen3ZOxs3LygZYNGWM=;
  b=URXrZvXw2VtBz6G4H5LkDClSB/Q1ecG4LzqVo1j5uuRysj3S+SG8a1Ng
   Lv0Dtn3IiDbVheyeuCv/dZ5OI4q4rJast/q13CHBCWMjo+igrICqHEebW
   724azp13aoyBcIVolYfus++AiF2JUR5TKDhKgg1hR4abqbEq49iv6qZIc
   D4XQSsQ/pY5cN2dx2Wk6/NDvnJcB0gXM7wti03a0FrgM5gWJFkiQy1H/H
   Bsz6tCs4H2MJUT12VZIMJ8COKXQcdH5HuXM3lkBnx0cA7bcSasMFo2DZ1
   WbXtLtrDSm1B1re5EcFWejnCoimyy++VmegPkbIUmmCXRaFG3dY3vRpBy
   w==;
X-CSE-ConnectionGUID: 15g1xIi+RDC/lyWgJ58y5g==
X-CSE-MsgGUID: u6+YZ08fQ0yXVjaCF7sCFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69082785"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="69082785"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 05:16:09 -0800
X-CSE-ConnectionGUID: FwaceYeTQkmd/c46naZTrA==
X-CSE-MsgGUID: akvF155HRie2ESsMgAnexQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="203750522"
Received: from khuang2-desk.gar.corp.intel.com (HELO kuha) ([10.124.223.90])
  by fmviesa008.fm.intel.com with SMTP; 09 Jan 2026 05:16:06 -0800
Received: by kuha (sSMTP sendmail emulation); Fri, 09 Jan 2026 15:15:44 +0200
Date: Fri, 9 Jan 2026 15:15:44 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Pavan Holla <pholla@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: drop an unused Kconfig symbol
Message-ID: <aWD_gJ-8ZHaPehKW@kuha>
References: <20251228190604.2484082-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251228190604.2484082-1-rdunlap@infradead.org>

Sun, Dec 28, 2025 at 11:06:03AM -0800, Randy Dunlap kirjoitti:
> EXTCON_TCSS_CROS_EC isn't used anywhere else in the kernel tree,
> so drop it from this Kconfig file.
> 
> (unless it should be EXTCON_USBC_CROS_EC ?)
> 
> Fixes: f1a2241778d9 ("usb: typec: ucsi: Implement ChromeOS UCSI driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Cc: Pavan Holla <pholla@chromium.org>
> Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Cc: Łukasz Bartosik <ukaszb@chromium.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jameson Thies <jthies@google.com>
> Cc: Andrei Kuchynski <akuchynski@chromium.org>
> Cc: chrome-platform@lists.linux.dev
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: linux-usb@vger.kernel.org
> 
>  drivers/usb/typec/ucsi/Kconfig |    1 -
>  1 file changed, 1 deletion(-)
> 
> --- linux-next-20251219.orig/drivers/usb/typec/ucsi/Kconfig
> +++ linux-next-20251219/drivers/usb/typec/ucsi/Kconfig
> @@ -73,7 +73,6 @@ config CROS_EC_UCSI
>  	tristate "UCSI Driver for ChromeOS EC"
>  	depends on MFD_CROS_EC_DEV
>  	depends on CROS_USBPD_NOTIFY
> -	depends on !EXTCON_TCSS_CROS_EC
>  	default MFD_CROS_EC_DEV
>  	help
>  	  This driver enables UCSI support for a ChromeOS EC. The EC is

-- 
heikki

