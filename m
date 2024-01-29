Return-Path: <linux-usb+bounces-5590-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 273D783FF45
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jan 2024 08:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A1711C235E5
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jan 2024 07:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD344F1E7;
	Mon, 29 Jan 2024 07:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pb1jPdmw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A594EB23
	for <linux-usb@vger.kernel.org>; Mon, 29 Jan 2024 07:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706514707; cv=none; b=ubZkQe7w4t6KyvmLQaR4VFtK4zO5Oin/1jNRAwC/Uprzm1eFI227KHNFibIKJTX0zWf3aw5YtZRDVbLhaRyMGqRO+7riz9sqtNrqSuHyiPGjyDbzmEO7Ot5X1Pv2YCjYu9qQYhqo5DyPcxnNfbuQZQMJswaP826lSH4HnXs1hzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706514707; c=relaxed/simple;
	bh=ewzVJYLXdf1tKyGBrucR6tAkrlzjtgEf0X7b6szVZLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=em+dxqdz/aidlKG881D/JGOUS35iLOn0+Nq7UmqA4TQAF7ZogJwTPbegQb7yGFY1ducNt+pQGO63R+jUvn66LYV8wmP0Mn93MBisDsyv5IXmSFwuA/rEw8wIsXUtfkmiRLP7B88ih1PBtd3DQEbees5tvPGY5Pt4nbykmfg/SWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pb1jPdmw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706514706; x=1738050706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ewzVJYLXdf1tKyGBrucR6tAkrlzjtgEf0X7b6szVZLI=;
  b=Pb1jPdmw8R38klNq416057TdVZC+r0QaR9qWg30C5dcafBxqEer0KMJe
   KdV6aj0wasRCU9HCBG7jHFGH9E/l3x7wq2B+t6xWarR1ue7FVJNDj5q6g
   MGFLJqwFueokb9xsyCHbdVoHIF4WFgw3ZHL6mhtEjfQPC5fAwtEEOd5BK
   RR9/auGi4YzTIZQAuWZvGkF83lZQfWHZZyzSB4LoOnW/2/MkyVyladzy9
   6qIl8+Nj1x0h0l6jXUADvfQqaEnH+pkvNm0THMt02UcuP1Akxzmn6v8D7
   BChHyRAy+xfd/ED2AJyUmO5yqk9ja8BRvtk7EA4WOF92wt++CWyWKRYGt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="9988735"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="9988735"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 23:51:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="931012261"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="931012261"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2024 23:51:43 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 8F6F6263; Mon, 29 Jan 2024 09:51:42 +0200 (EET)
Date: Mon, 29 Jan 2024 09:51:42 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Fix setting the CNS bit in ROUTER_CS_5
Message-ID: <20240129075142.GT2543524@black.fi.intel.com>
References: <20240127032628.29606-1-rahimi.mhmmd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240127032628.29606-1-rahimi.mhmmd@gmail.com>

On Sat, Jan 27, 2024 at 11:26:28AM +0800, Mohammad Rahimi wrote:
> The bit 23, CM TBT3 Not Supported (CNS), in ROUTER_CS_5 indicates
> whether a USB4 Connection Manager is TBT3-Compatible and should be:
>     0b for TBT3-Compatible
>     1b for Not TBT3-Compatible

I'm sure at some point of the spec it was called C3S and the meaning was
opposite ;-) Nice catch though!

> Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>

Tagged for stable and applied to thunderbolt.git/fixes, thanks!

