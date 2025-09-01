Return-Path: <linux-usb+bounces-27415-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB88B3DEFB
	for <lists+linux-usb@lfdr.de>; Mon,  1 Sep 2025 11:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFC26171763
	for <lists+linux-usb@lfdr.de>; Mon,  1 Sep 2025 09:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AAA922655B;
	Mon,  1 Sep 2025 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hbf8dnkS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396442FF16F
	for <linux-usb@vger.kernel.org>; Mon,  1 Sep 2025 09:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756720035; cv=none; b=DpwOiQN8R5MIV1Xl9J7TJzkcE9vD9RnTlGAqW1bGcWvQrrh4vUwD6fGHXRz7aFW3ixBKz2IwtFdRqUpxDbqMgOAMBHlfNYDqjmmJK5clIlFlx8lRjYISbQItXz9MN8fWFHW8dsX5Kmlosg9plAnKP/TOFRC6B6bmk0yKZCfZHuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756720035; c=relaxed/simple;
	bh=rFoe4np+w+simro406sFVte3IX0SfWIyT7+Seo75mUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ju75s8gD/TIoCll/+CboirFxaqXv+PSEj3nXVE+9qc0p0VHgA5mEkGnyTsEoL7TmJD+NfgU5sTTNOXRIaDWERKCaZ1kJWwZ0p1VT+eJFa1iPV3RfO6qPFwKYjD3jawqv9U5svPfOR0+0XW3czNzLpG7qQdPodOfKAG2z1Pp+igY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hbf8dnkS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756720034; x=1788256034;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rFoe4np+w+simro406sFVte3IX0SfWIyT7+Seo75mUM=;
  b=Hbf8dnkSDGkJwv00BowxJurWEk8PPXyIFSjTBSD8RbySncFNDgaM8MFW
   +1DjZcPcXBhRA1rCeAVg0xqCWKOiArh40z6H6SOsW0NMfNpT3mCZwA/WZ
   hcmGUN5gl9xuBVQyAWiLpbLEg5M3emipk0BS//qpHjTJv0zXzNRRXK5pG
   vGsVJbeK4Yc3GC9d86pZt4WkMUjgVd/WjnOhqoKEn+ELZTUSlG38eYb4G
   mgjIgSsAexcX+01nlEXCKQDExLRcXZkicTQ5vxsW7zmjxRmUvzhrLWjjN
   xpAzOLMgs8B4PexkjLdWq7opikTYCjq3OKUVyiXW+x223Km0H0qAzpl1S
   A==;
X-CSE-ConnectionGUID: Jd+ZKVahRsWCd3m73egWGw==
X-CSE-MsgGUID: E5nkX/M9S3mqWwYPg2Bljw==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="84388155"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="84388155"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 02:47:13 -0700
X-CSE-ConnectionGUID: dLROQuIpRtSKyvKiUo8f3g==
X-CSE-MsgGUID: DYrVVORVSuuVOgZeCU6z8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170526450"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.244.170]) ([10.245.244.170])
  by fmviesa007.fm.intel.com with ESMTP; 01 Sep 2025 02:47:11 -0700
Message-ID: <feff2c31-344e-4147-8c9f-081b634dc82f@linux.intel.com>
Date: Mon, 1 Sep 2025 12:47:10 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] usb: xhci: Drop the TD_CLEARED cancel status
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org
References: <20250901084642.2b42c0e7.michal.pecio@gmail.com>
 <20250901084800.35252e61.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250901084800.35252e61.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1.9.2025 9.48, Michal Pecio wrote:
> There seems to be no need to keep invalidated TDs around and require
> callers to follow up with xhci_giveback_invalidated_tds(), so make
> xhci_invalidate_cancelled_tds() give back invalidated TDs right away.
> 
> TD_CLEARED cancel status is no longer useful and therefore removed.
> Code complexity and overhead of repeated list traversals are reduced.
> 
> There is no more need to debug interactions between these functions,
> so a big source of xhci_dbg() noise (and potential bugs) goes away.
>  From now, "Removing cancelled TD starting at ..." really means that
> the TD is being removed, unless one of the errors below is logged or
> dynamic debug indicates that Set TR Dequeue is queued or deferred.
> 
> Also clean up some debug noise from xhci_handle_cmd_set_deq(), which
> practically duplicates xhci_invalidate_cancelled_tds() messages that
> will be printed just before this completion handler returns.
> 
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---


Looks good to me.

xhci_giveback_invalidated_tds() was anyways called right after
xhci_invalidate_cancelled_tds() under the same lock protection
so we can as well give back those non-cached cancelled TDs right away.

Thanks
Mathias



