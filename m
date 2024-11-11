Return-Path: <linux-usb+bounces-17430-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BF29C3CAC
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2024 12:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A94F81F21F7F
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2024 11:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82BF0188905;
	Mon, 11 Nov 2024 11:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7zH5x3s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B28E14A4CC
	for <linux-usb@vger.kernel.org>; Mon, 11 Nov 2024 11:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731323301; cv=none; b=EFQqKCge4JCiCROHWuc0edXEoGQGN6o8YaAJo0dRy9ffsyAvtrLUxHlERlQDcEgYP76daETRn+GezF7te9fOfTPYjJUDxKQIOZ+XQ3zGMjLpFAG24LKyk9N5sghzyNlamP9pwg4fAL0pkMdeuSRErAzLoqP4t7cAcZeMGOU9Lbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731323301; c=relaxed/simple;
	bh=AtEsSyJhigBo9oEs8tGkKFMkrHlMa3RrI6Mo+p6ykX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kaRcg4hRhiRPDSqy2r8pebaSMxVzHsjdh8OIVXnxE9eU4A751dvSafgpKB8sSROVCzeSJecDYkHpwC6Q6BE6K0R8vs6YVJFMBr5zPfEs6XvHuenT1sxOMVVAKSWCkS/opof/cmcE5qbhORaqixgystQ0cu33BwDTC+o4ygOVxDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7zH5x3s; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731323300; x=1762859300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AtEsSyJhigBo9oEs8tGkKFMkrHlMa3RrI6Mo+p6ykX8=;
  b=E7zH5x3sT/Mse1k46OPPAiAYmyFXJP+957ehCIrMN9w5VT3HdJ7TKfKy
   /VKehAR0QHvw9bfzvdIL+GWFIV1Zy36pAJzwaunlW6eflnaUUE0Fox/7j
   onE3wAyGZEWc93W2aFNHJw/sfQSJ7ydVioxt48ZGtNJnd4QB8CVCQIWwl
   Zb74ThV0D0makDlyXUCoMuj0n+bnStfgxofApdosGRCN7kFt9vcKUlqgv
   TMNggKECLx0m22Q4/eMZD9DbWc2CVk7pO6hjUnBgWzo6oLu5iGgNg8D2J
   c+OXhXsbmJ2sA2LA2BgZDowFqXlA3yY/McC8rufWATPObyC0scjeW8CJy
   g==;
X-CSE-ConnectionGUID: SSShrD+0R/iYPWsfM8MWYA==
X-CSE-MsgGUID: IXTI30VGSLeyHD6PK/49TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31283601"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31283601"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 03:08:20 -0800
X-CSE-ConnectionGUID: IBv9xPNMREGb9WAaIMNRSg==
X-CSE-MsgGUID: qKg/iEa/SN+eVC9Jgtv9oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="117677133"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.97.183])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 03:08:18 -0800
Date: Mon, 11 Nov 2024 12:08:10 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 3/3] usb: misc: ljca: print firmware version
Message-ID: <ZzHlmqxwMKGvJJI5@linux.intel.com>
References: <20241107073718.405208-1-stanislaw.gruszka@linux.intel.com>
 <20241107073718.405208-3-stanislaw.gruszka@linux.intel.com>
 <2024110741-unfold-condense-6c54@gregkh>
 <ZyyH/S8j3nxu8yTl@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyyH/S8j3nxu8yTl@linux.intel.com>

On Thu, Nov 07, 2024 at 10:27:29AM +0100, Stanislaw Gruszka wrote:
> On Thu, Nov 07, 2024 at 09:37:34AM +0100, Greg KH wrote:
> > On Thu, Nov 07, 2024 at 08:37:18AM +0100, Stanislaw Gruszka wrote:
> > > For diagnostics purposes read firmware version from device
> > > and print it to dmesg during initialization.
> > 
> > This changelog text isn't correct anymore :(
> 
> I'll drop this one from the set.

It was decided infernally to rewrite this patch to use
sysfs attribute for providing FW version. I'll do this and
will keep the patch in the next posting of the patchset.

Regards
Stanislaw

