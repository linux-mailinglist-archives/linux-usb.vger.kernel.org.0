Return-Path: <linux-usb+bounces-9629-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8586E8ADD0F
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 07:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C2461F21FFE
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 05:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B96E20328;
	Tue, 23 Apr 2024 05:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LlzpML6h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148F21CA82
	for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 05:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713849295; cv=none; b=KYAdSSOEZJJ/nYYIyaR0Gr5dRKbWccPQ8xECpoqdCJ2f5SNCuXypFt/lj7qZKEl5BLdU/8nZx1JWUzOZBnuApdh3sSZ765A7An/VGhvbjTwQGz5RqMJizdwsNGYY+3A9Yz4XY8u/yNBrm93V6sBY3LF1TsBYpTgvXadpcMXB9kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713849295; c=relaxed/simple;
	bh=Hpjz34VUGXjJ5+WRBdeZIzChB8OsUn4nQbUy/wdsumo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q2VqaVLWrjgKgU+AIvxqTJxtTuzytUjyCj2zKFHeq101CK8n9LF/hLDO3Pwp3XvC4oHI61F3q8IPFOMTmu41PkgEUh5krhzuVNPzzmglwL07jDDiif/wM0NW+T37JaQu+gJUs+JiBwixfEQtvt/elcJCUByPgErsjdp6K0MgnWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LlzpML6h; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713849294; x=1745385294;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hpjz34VUGXjJ5+WRBdeZIzChB8OsUn4nQbUy/wdsumo=;
  b=LlzpML6hEp9HaQN6M3e0Z/ibuKCWh5/Q8jWI/DjjADj3UqDtmhEagh8M
   srl2PAzcB5LICTRxzJ0ZhPVAlN26PGLIohtTLg3mRPndajDIlhlUnf3CN
   jV3fOPGrUBMxTPnQPcTZ2rvfU74xWwl9Fde6srzqbCYC+yS2AXF9Q5WPB
   +fVku+pOShuBvckMIC7mKdxgvDaGJs3BDeusPIhGERQtaAWqQgyrh8PkB
   q7Rt9UlKcfPO4V8ePlKx4+GzvLMFvSjx0XzFoIc4kBet1gAnw1AgZv7VC
   X+mNsNDR2opOi1GbbJ6Qc9Y3d9vHxrzE8VQ9sW3DSTp/nCwCDiv3OaqmQ
   Q==;
X-CSE-ConnectionGUID: 581Ey7rnSEqA8yw0Znkuvg==
X-CSE-MsgGUID: sjo9DJyER6CHrQA/m/NEbg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20566645"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20566645"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 22:14:53 -0700
X-CSE-ConnectionGUID: vjV929fNS4S1CzNqm8bLFA==
X-CSE-MsgGUID: 4Xr3C6ZbSxi1rQiZRs0CFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="28758438"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 22 Apr 2024 22:14:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id C3BD1192; Tue, 23 Apr 2024 08:14:50 +0300 (EEST)
Date: Tue, 23 Apr 2024 08:14:50 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 1/2] thunderbolt: Increase sideband access polling delay
Message-ID: <20240423051450.GX112498@black.fi.intel.com>
References: <20240418050623.3157002-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240418050623.3157002-1-mika.westerberg@linux.intel.com>

On Thu, Apr 18, 2024 at 08:06:21AM +0300, Mika Westerberg wrote:
> The USB4 sideband access is slow compared to the high-speed link and the
> access timing parameters are tens of milliseconds according the spec. To
> avoid too much unnecessary polling for the sideband pass the wait delay
> to usb4_port_wait_for_bit() and use larger (5ms) value compared to the
> high-speed access.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Both patches applied to thunderbolt.git/next.

