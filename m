Return-Path: <linux-usb+bounces-9852-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D178B4438
	for <lists+linux-usb@lfdr.de>; Sat, 27 Apr 2024 07:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6BF3B229FE
	for <lists+linux-usb@lfdr.de>; Sat, 27 Apr 2024 05:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2873E470;
	Sat, 27 Apr 2024 05:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YVQst2/6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2405639ACD
	for <linux-usb@vger.kernel.org>; Sat, 27 Apr 2024 05:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714194465; cv=none; b=NlLq2qd8KT1l9uGjydB4Doa+EXEtlU5RteYftTxFE4KVTCCQ0SMQjpv9ycnR9XSIDA1mtWdaosGjxiys4v//XuAucIHtOZymTdUBASRrcUqOWo8gzz0EI7BL7yqO1gbxQqSAXRD6jmPtcBze8+P+rFegnV4Hx6BvKU/DO20Hxog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714194465; c=relaxed/simple;
	bh=y9RfOaUIH+rnc6Cp27P/YBOm5zaCUsLDYLmlKtOr0h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BnKfqUfSA85aWexknrJk4cLKxUQaVa1E70e+pXPZLNEudpoaurgy9EomIxuiCwxHQLJVeQtDBI7XztlnTw0Jx18FteY6CN+WsHaxZcMNfJLyanHXH6h9jdmvf5FqmBG/A4K3j5I0qjri7jNxW+NKfcqE8evLIoCFvRTVftl+hlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YVQst2/6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714194463; x=1745730463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y9RfOaUIH+rnc6Cp27P/YBOm5zaCUsLDYLmlKtOr0h8=;
  b=YVQst2/6aoYmIuTcwXMKI2AmBMT3bMFOvhnTLcUAvrbTM537+/0KuyBj
   nNKE6td3NRqDWtoz65NjAyXiDe2M5r+RWRJM5mORrOo/SYPkuD0S+9JZC
   wLys6aZwS62KolNSgJzy7IlwEgbrAZcTKveXVFnvwZd+ihn9lOA11RWQS
   UQ6Dv8QWt7XPtl96nFJVXxj5487/cEIlgtPANp5gQ8S6TTrx5sy3BeOKh
   el73aim6JYrpDaO/SR+SEbDibnsld76Hvv6Fm9SEsfYTUrujBt0NnGreI
   JsNoURoNw1t+b/zWEobN5qHvEhwYDW/k6zH/gdl0fQoMiTfc4xKDWtc+6
   w==;
X-CSE-ConnectionGUID: 1wm4Is4gQ6KBidChk8+Tug==
X-CSE-MsgGUID: v8TPj6BJSBWBjPnw8nKwvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="27453338"
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="27453338"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 22:07:42 -0700
X-CSE-ConnectionGUID: QCSpE0FoQYeYle0v+jq3LQ==
X-CSE-MsgGUID: 2y1d7n6pRNCwc9zqq0X8pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="56527325"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 26 Apr 2024 22:07:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 005C0329; Sat, 27 Apr 2024 08:07:38 +0300 (EEST)
Date: Sat, 27 Apr 2024 08:07:38 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Gil Fine <gil.fine@linux.intel.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, gil.fine@intel.com,
	linux-usb@vger.kernel.org, lukas@wunner.de,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] thunderbolt: Fix uninitialized variable in
 tb_tunnel_alloc_usb3()
Message-ID: <20240427050738.GA3969176@black.fi.intel.com>
References: <20240425232417.3509833-1-gil.fine@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240425232417.3509833-1-gil.fine@linux.intel.com>

On Fri, Apr 26, 2024 at 02:24:17AM +0300, Gil Fine wrote:
> Currently in case of no bandwidth available for USB3 tunnel, we are left with
> uninitialized variable that can lead to huge negative allocated bandwidth.
> 
> Fix this by initializing the variable to zero.
> While there, fix the kernel-doc to describe more accurately the purpose of the
> function tb_tunnel_alloc_usb3().
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-usb/6289898b-cd63-4fb8-906a-1b6977321af9@moroto.mountain/
> Fixes: 7e227d09f80d ("thunderbolt: Allow USB3 bandwidth to be lower than maximum supported")
> Signed-off-by: Gil Fine <gil.fine@linux.intel.com>

I fixed the commit ID to match the one in my tree and applied to
thunderbolt.git/next, thanks!

