Return-Path: <linux-usb+bounces-26903-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D57FDB27D4C
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 11:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D11741C82B59
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 09:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941172F83CA;
	Fri, 15 Aug 2025 09:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXx7aTwy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FCB253B47
	for <linux-usb@vger.kernel.org>; Fri, 15 Aug 2025 09:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755250446; cv=none; b=bAwoFFKUwok8K9B6whVYgT2Le0ZhcG+hcizKs2tTzasQllxrKoDwX/CzBcPKOvl93LUCPaXNUIqnFVNpguaJq3EeehfxMJmgQ0z3CiMcGUfqhzH/GN/ZJGMTNrs37SW8wQ90SB90HCVddvI5SFcMrzUgPlToGuL6vtSlkF9bMm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755250446; c=relaxed/simple;
	bh=5TgOt+3BnoTzGaSEI+LFq3V/hke0SgNB6WnzI4c9WHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXsTJRbVW165AubKuaCt/E/jzPcoaqEj9T5bRj6Jz3Q49Ao0g6FxeqbceoTiVrFXSSFgS8SLHe7krz6sy5l/XJE1slHRiQw96rMNVOdNNTqerSa+JpOvV2YejrPKAhLlsWmTzf2n+hfWNN1fcQUV71fGIF5RsyvMQHt73JokyBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXx7aTwy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755250444; x=1786786444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5TgOt+3BnoTzGaSEI+LFq3V/hke0SgNB6WnzI4c9WHI=;
  b=bXx7aTwyQefGA2DsvAE5gUXsqVvlQHMoZlYVlciuLysvrl4+r3gpG/qq
   AvkhlWTW1tji/PdvpTHg4pVR5or2aDa7zlzKQpIDl5LVXyzbozGrc6rst
   D9UiqGKvq+Xi6MsSLqRquHqiTPWQ5GsqHzobwNFVCZwluCGd9YOCFpY7H
   3RUgDqcrEdIE2WSoJzaiC8QboS3TJZQIMas70YKq8yc6i7xr5S3Co3Mjo
   x/GZGD1q1BO8Jo2P0KF7GQw+2Rwhnn3a9eclx0Ro+uIZMNnshnX9L2zUZ
   dOpvWDKeKdeKYJSHL3xODmTXa0Z8Q2PcUntkz/fr/+wPAAv1lU/Ye+b1d
   Q==;
X-CSE-ConnectionGUID: Abncjd6hRlODTceVUHgn9w==
X-CSE-MsgGUID: 9o02C11mRvmT/9OwYbKenA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61379568"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="61379568"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 02:34:04 -0700
X-CSE-ConnectionGUID: t7gxlNbaQ9ODlNtg1rQYdA==
X-CSE-MsgGUID: /IK4ny7LQROn0wlAHNTXgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171109810"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 02:34:03 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 50F5311FA65;
	Fri, 15 Aug 2025 12:34:00 +0300 (EEST)
Date: Fri, 15 Aug 2025 09:34:00 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>,
	Oliver Neukum <oneukum@suse.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/1] USB: Check no positive return values from
 pm_runtime_resume_and_get()
Message-ID: <aJ7_CMzCVwPEMSOj@kekkonen.localdomain>
References: <20250811062403.2116464-1-sakari.ailus@linux.intel.com>
 <2025081330-droplet-napping-6843@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025081330-droplet-napping-6843@gregkh>

Hi Greg,

On Wed, Aug 13, 2025 at 04:43:05PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Aug 11, 2025 at 09:24:03AM +0300, Sakari Ailus wrote:
> > pm_runtime_resume_and_get() always returns a negative error code or zero;
> > there's no need to check for positive values such as returned by
> > pm_runtime_get_sync(). Simply drop the check.
> > 
> > Fixes: 7626c52b6b46 ("usb: usb_autopm_get_interface use modern helper")
> > Cc: stable@vger.kernel.org
> 
> If there is no need for this check, why does this need to be backported
> to stable kernels?

It's not necessary IMO.

The practice lately has been to add Cc: stable if the Fixes: tag is there.
But there was no actual bug in this case, just that this change ideally
would have been part of the original patch.

-- 
Regards,

Sakari Ailus

