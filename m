Return-Path: <linux-usb+bounces-28181-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 223B7B7F47E
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 15:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0355E48848B
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 05:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9783726F44D;
	Wed, 17 Sep 2025 05:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfKTRPQj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D16828682
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 05:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758088327; cv=none; b=EvT0VbFExX+4Nrgaz/Tz/VI20DE+laIrg7DGwSD2p8SgEMcuCWBGD42/+x9tve/mvAOHZ+XjbRHc8N9Vc7C38iEUZA87l4HB2uzEsPf29bSYDzMstuTVQO0yrhn1G3uM2Fo5qVlGk1VaFTW1/rAOjfWxZ94gVd93l9Vb+fXjzx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758088327; c=relaxed/simple;
	bh=dFXeQCKQ6eOyCA02jv+3oG/1QWJvJPNNUCV+vtmbL7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTwR6L+J07LZiYWde2NY5e3w8NQPNn1tC1ybDlM5N8pvwwUgTsZxerRN2I7RBCNWUSKE8rgYoB8pc30TNM7SIPXZWnD/79JWAAJY9Fgq6wzoZWUu7qDEJbf2YlQ6EOZkEudajBy9UYtUQskqgkvWY866HYdjXVYBTHyLe1i/1DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfKTRPQj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758088326; x=1789624326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dFXeQCKQ6eOyCA02jv+3oG/1QWJvJPNNUCV+vtmbL7w=;
  b=bfKTRPQjyFGRYxcr+0b5ys3Oxn34s/Ae4YP9COutMrM/xfHBQ3iDvyvB
   9TC8SnLTEMZ/xm6BnXC/c1Bf4rc2EZtvPFb7LDfCMRvZGNRJokP6QvcNi
   xpgra7qv5QXKeAqpD360Xh3l0NJbCThY7SXrQVG2lx4VroXvzZaipfKDF
   5oTWWlA50L76M5c51sXlWkEBas62ibvLreP3NtUgnR5UkOh/UXXREJPAH
   mVSD303tuFrbBwvr++k6VMZM+KOVN/BBjw/KOstC1ckhdHPwkjA14WVlJ
   oiFx5nG3gm479ukf8khiNf1pXwjzxs1qAmk7YzTaFgHRJQ78OBpV5i3y+
   Q==;
X-CSE-ConnectionGUID: 8WN3S3woSw+bQCV7bHn7wQ==
X-CSE-MsgGUID: GFuzIbFHSgS1JHoC+tPf9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="77823789"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="77823789"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 22:52:05 -0700
X-CSE-ConnectionGUID: azzzteCBRFG4YABoAwVk9A==
X-CSE-MsgGUID: k9+jLKZmTEeNEvgdfkTO3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="180287817"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 16 Sep 2025 22:52:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3F87E95; Wed, 17 Sep 2025 07:52:02 +0200 (CEST)
Date: Wed, 17 Sep 2025 07:52:02 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Subject: Re: [PATCH 00/26] thunderbolt: kernel-doc fixes
Message-ID: <20250917055202.GE2912318@black.igk.intel.com>
References: <20250908163230.2614397-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250908163230.2614397-1-mika.westerberg@linux.intel.com>

On Mon, Sep 08, 2025 at 06:32:04PM +0200, Mika Westerberg wrote:
> Alan Borzeszkowski (26):
>   thunderbolt: Update acpi.c function documentation
>   thunderbolt: Update cap.c function documentation
>   thunderbolt: Update clx.c function documentation
>   thunderbolt: Update ctl.c function documentation
>   thunderbolt: Add missing documentation in ctl.h tb_cfg_request struct
>   thunderbolt: Update dma_port.c function documentation
>   thunderbolt: Update domain.c function documentation
>   thunderbolt: Update eeprom.c function documentation
>   thunderbolt: Update lc.c function documentation
>   thunderbolt: Update nhi.c function documentation
>   thunderbolt: Add missing documentation in nhi_regs.h ring_desc structure
>   thunderbolt: Update nvm.c function documentation
>   thunderbolt: Update path.c function documentation
>   thunderbolt: Update property.c function documentation
>   thunderbolt: Update retimer.c function documentation
>   thunderbolt: Update switch.c function documentation
>   thunderbolt: Update tb.c function documentation
>   thunderbolt: Update tb.h function documentation
>   thunderbolt: Add missing documentation in tb.h
>   thunderbolt: Update tmu.c function documentation
>   thunderbolt: Update tunnel.c function documentation
>   thunderbolt: Update tunnel.h function documentation
>   thunderbolt: Update usb4.c function documentation
>   thunderbolt: Update usb4_port.c function documentation
>   thunderbolt: Update xdomain.c function documentation
>   thunderbolt: Update thunderbolt.h header file

All applied to thunderbolt.git/next.

