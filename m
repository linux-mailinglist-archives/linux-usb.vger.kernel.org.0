Return-Path: <linux-usb+bounces-11361-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5273890AA74
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 11:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09B6B28DC6E
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 09:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566BD1946C2;
	Mon, 17 Jun 2024 09:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ES4QMh2U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5995E192B7B
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 09:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718618315; cv=none; b=BG8SIyEVTjXyA0uXcIyz0CUKOB9Hz9Srw7pBxpLHndtbjsq9U8AfJwkZmgnyD7o8WRT5slGm064oS2VS8uwon11EqNOmxEvk9TrdGmvGYu81wsHF/AKWPFYVZ5/vG5MNZiJtuxb8ngIjMHeOdLAeMIXco8EWzAZ1y6kHeGtGdn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718618315; c=relaxed/simple;
	bh=nk0qAolTVcAAx7qPOOLpAx3juXmKCouTou8x5Dztrqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibSegkvb1saqMJudByZ9pUq160X0lnHK6wC3HQAYbC4A8c5qjLUMSFiapG1LoMbjuZhxXDkbm0TtcX+h0R2f31OTdZenm9Orqb5CLTJFYSZ/3n8a9pwxlZPZL7vh7W5Pv4cqipF1m8RvY8eo8WSOLdl3o/ZFkRtHJjXXvdS1d9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ES4QMh2U; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718618315; x=1750154315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nk0qAolTVcAAx7qPOOLpAx3juXmKCouTou8x5Dztrqg=;
  b=ES4QMh2UMqK01ZyQuGrA4CUWjAY6I8SvubixmqY5lHLF6tp6NHVAy5PY
   mz3dTMqeV4M59F+2iTU4JDgHnXdDf8xJogVVTRPJ/hOTCeRpkPrm84rIT
   UVqhQtB+Wz3ptJobonRuG0FroauQzEU9ToD8zE3ei/eBZJ92WuIKzL7S5
   1xwBCDX3Ja/TwcnVqWukgmh+0hzHJvETL5xVAlIelP5l02KIwbqOpJF1S
   V6l0IPqSYwntOb1V4nSmUhQBcYk9TblLWWhfIIXtuKTdbwAimpdOLaesV
   J77aRxNAXAlv3oDM3nKbM8VxXw9mk72fSDTRDX1RvNlxypMnlKmNkJ8Uf
   g==;
X-CSE-ConnectionGUID: Hw5wQ5AiTOeUg+bYQzei+A==
X-CSE-MsgGUID: Rf79pL33S8GsBY8SzDgegA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15403632"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="15403632"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 02:58:34 -0700
X-CSE-ConnectionGUID: a/dccBR2S2y2ZBoJXQyo3w==
X-CSE-MsgGUID: ApPZ/JuOSPWf0HiR0t0IjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="46260497"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 17 Jun 2024 02:58:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id B03FE18E; Mon, 17 Jun 2024 12:58:30 +0300 (EEST)
Date: Mon, 17 Jun 2024 12:58:30 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 0/6] thunderbolt: Sideband access and retimer lane
 margining support
Message-ID: <20240617095830.GA1532424@black.fi.intel.com>
References: <20240614121512.1361184-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240614121512.1361184-1-mika.westerberg@linux.intel.com>

On Fri, Jun 14, 2024 at 03:15:06PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> This series adds USB4 link sideband access through debugfs. This can be
> used to run port operations etc. from userspace usable for example in
> manufacturing. The other feature is receiver lane margining support for
> retimers with similar use case.
> 
> Mika Westerberg (6):
>   thunderbolt: Move usb4_port_margining_caps() declaration into correct place
>   thunderbolt: Make usb4_port_sb_read/write() available outside of usb4.c
>   thunderbolt: Add sideband register access to debugfs
>   thunderbolt: Split out margining from USB4 port
>   thunderbolt: Make margining functions accept target and retimer index
>   thunderbolt: Add receiver lane margining support for retimers

Applied to thunderbolt.git/next.

