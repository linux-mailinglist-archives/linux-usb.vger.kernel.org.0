Return-Path: <linux-usb+bounces-16931-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 342489B8ACB
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2024 07:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE6561F22B94
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2024 06:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84547148833;
	Fri,  1 Nov 2024 06:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T7vApFZp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C18A380
	for <linux-usb@vger.kernel.org>; Fri,  1 Nov 2024 06:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730440863; cv=none; b=QTVFhMNUdw6ZVDqtbqyhPMRkxftybWGl/Vy9xtK2IJUW91yu5Yl2qtluLtJ3vknwgQwatQnjCBYMfArvKuWj1Ye2nfCsU8jT9XrMCeqFBTYj2AbfRIeeIByPA1HR6xLGE2nuibMh0OCFgTIEZPYD7U+2KCNFV/RduqhJb/mtYhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730440863; c=relaxed/simple;
	bh=PejUryFoijRC27DSZ6xrX0pVyySYMwIEFbY9zDpeMws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNrSVk8nj45kgknk3JgXQUTwNgfzJSh784DyUDgGD+StZNCVzTIJG6g4JNL0giVsl1ATS28Qp4a9+m7EdhpXOqdih5S1dwAhWgWXHf1mj14zKugd8t2olMZKPlqP/yf25cCzl5lSjrDPJ7dLXDazXGkoZ22r2C8CnbAKVcpaoBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T7vApFZp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730440862; x=1761976862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PejUryFoijRC27DSZ6xrX0pVyySYMwIEFbY9zDpeMws=;
  b=T7vApFZpUomVkO92UTbOEjZBPLZoCRYjF69Awlzz4kQZPrCefE1d4NYR
   B+Jwbz2kaSsE5szOro2mgWuncjG27M1F74MuUHFQ41gmY3Pllz9MoUvMa
   N0/Y9jguJvK+aT3uTUs9XJ9knxkrpReDvmCxr7kHbsbh4GP4Umy2s9Vn+
   zQ3OtVDragvmpszQdXKSUERID/wgO/5qptsKa2ve/3v5cZypisMGZTtZn
   WMXi4taH5IDSuqLJUxO1mq63YLtw2p1lKuwvhUD73PL1I2fnqFMVZtzGF
   egFZWBC0EPy06N2LmqxZfFyk09JE0JjnHpx5ucPS3n0sI2cqkLH5ER8h2
   Q==;
X-CSE-ConnectionGUID: B0Kg+NAjQAySrrF3FWVy3A==
X-CSE-MsgGUID: /B4TLnfMQAKb1AcDjHVSPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30419154"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="30419154"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 23:01:01 -0700
X-CSE-ConnectionGUID: a6d53Jn6TyCBd74TeMfciw==
X-CSE-MsgGUID: 40RO2x37QhqPtIofyDkhMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="120324716"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 31 Oct 2024 23:01:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id CF3E21AC; Fri, 01 Nov 2024 08:00:57 +0200 (EET)
Date: Fri, 1 Nov 2024 08:00:57 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Aapo Vienamo <aapo.vienamo@iki.fi>
Subject: Re: [PATCH 0/8] thunderbolt: Add support for USB4 v2 Gen 4 lane
 margining
Message-ID: <20241101060057.GV275077@black.fi.intel.com>
References: <20241023101111.3418311-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241023101111.3418311-1-mika.westerberg@linux.intel.com>

On Wed, Oct 23, 2024 at 01:11:03PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> This series from Aapo adds support for USB4 v2 Gen 4 link symmetric and
> asymmetric receiver lane margining. Useful for instance on manufacturing
> floor to check stability of the electrical signaling.
> 
> Aapo Vienamo (8):
>   thunderbolt: Don't hardcode margining capabilities size
>   thunderbolt: debugfs: Add USB4 Gen 4 margining capabilities
>   thunderbolt: debugfs: Implement Gen 4 margining eye selection
>   thunderbolt: debugfs: Replace "both lanes" with "all lanes"
>   thunderbolt: debugfs: Replace margining lane numbers with an enum
>   thunderbolt: debugfs: Refactor hardware margining result parsing
>   thunderbolt: debugfs: Don't hardcode margining results size
>   thunderbolt: debugfs: Implement asymmetric lane margining

All applied to thunderbolt.git/next.

