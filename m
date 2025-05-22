Return-Path: <linux-usb+bounces-24226-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AACAC0B13
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 14:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C66CFA26F73
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 12:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2B4281531;
	Thu, 22 May 2025 12:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+pF5wJj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C6D1A3A94
	for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 12:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747915556; cv=none; b=gt+AHBe90xfbiyZQokqK7AU/1izutHJkKe06X9tj01bOtJIAosA7yFwJaOYN8GPo1xKtux41wFY9ea1kLUICyGTCXb2DQjVK+p09OQDKrCleGR086/n/AKEPKJjW2514hCVRm7RgnO303wn2bytBN6p8qWwrMLyGhErJEpwCsFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747915556; c=relaxed/simple;
	bh=1Xuuhd0mVNh4kkFW4g5Y0IRyy23dRmBdzKsC3rIcbiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jk9GfHGa8XtV4QFtRm7lzV9/eyiGpf65yrapxHG/sxHFNvcWrS7LkJ+vCWmoOrE1BfIhUFczbzxuSiT3NEjBl+N67wAjgz4E9KTEQRq4UZhFJl8zgQ3GrzHjg1W+/PJKiupMpQabMwPddA81NGlyzwlmXSlDgFrGEEqKKJbrcW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+pF5wJj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747915555; x=1779451555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1Xuuhd0mVNh4kkFW4g5Y0IRyy23dRmBdzKsC3rIcbiM=;
  b=e+pF5wJjLB7rWT2stsRXhL9oeEY+O9+Qy/CpBQEWiHAoFf7+TiT/bAmy
   FydN6vMF2G8n5hay9deZc10ttTTPvE4rsEu99o2lRhjsRqWdtj4NWccHy
   TULB14n3o1WgmOeF+ccGThTdFIYvJOT/3f4ez8Kman+amFFcG2ZqKbSMe
   +UopvdRJr+KY1KtzLddGiuSYAaALnWD7LSoEgGfZYzpfgp799quGug/Mv
   myYIzyX+O2bd9v26MXO7oU40o8fCPDR8LJeMt8qh1JbgSUdn5iWB4td5L
   rIcy95HfkMJ7/d8m7pihEv2cp2+7v0xdC+3Bkqzy2q1JMTE/bOegRR6tr
   g==;
X-CSE-ConnectionGUID: YbcODnpERFO0h6APW5OppQ==
X-CSE-MsgGUID: PHJB+V1nQNKOdboxgKhLMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61340524"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="61340524"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 05:05:54 -0700
X-CSE-ConnectionGUID: tRW5PHmmTyGfl+2clST9yA==
X-CSE-MsgGUID: wj0d19QrRsSPKdrzQfSjmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="141635826"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa009.fm.intel.com with SMTP; 22 May 2025 05:05:52 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 22 May 2025 15:05:51 +0300
Date: Thu, 22 May 2025 15:05:51 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: typec: fix const issue in typec_match()
Message-ID: <aC8TH03vOhXI9IYW@kuha.fi.intel.com>
References: <2025052126-scholar-stainless-ad55@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025052126-scholar-stainless-ad55@gregkh>

Hi Greg,

On Wed, May 21, 2025 at 03:41:27PM +0200, Greg Kroah-Hartman wrote:
> typec_match() takes a const pointer, and then decides to cast it away
> into a non-const one, which is not a good thing to do overall.  Fix this
> up by properly setting the pointers to be const to preserve that
> attribute.
> 
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Shouldn't there be a Fixes tag? git blame gives commit d69d804845985

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

thanks,

> ---
>  drivers/usb/typec/bus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
> index ae90688d23e4..91eae95d6fa4 100644
> --- a/drivers/usb/typec/bus.c
> +++ b/drivers/usb/typec/bus.c
> @@ -449,8 +449,8 @@ ATTRIBUTE_GROUPS(typec);
>  
>  static int typec_match(struct device *dev, const struct device_driver *driver)
>  {
> -	struct typec_altmode_driver *drv = to_altmode_driver(driver);
> -	struct typec_altmode *altmode = to_typec_altmode(dev);
> +	const struct typec_altmode_driver *drv = to_altmode_driver(driver);
> +	const struct typec_altmode *altmode = to_typec_altmode(dev);
>  	const struct typec_device_id *id;
>  
>  	for (id = drv->id_table; id->svid; id++)
> -- 
> 2.49.0
> 

-- 
heikki

