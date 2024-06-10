Return-Path: <linux-usb+bounces-11064-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A80C90202E
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 13:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5762283E60
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 11:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBBE7BB0C;
	Mon, 10 Jun 2024 11:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bmbwMDsK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EAB78C75
	for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2024 11:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718018064; cv=none; b=HojCfm/3No1Qm/ojdfrZh1JdkNgfY3r5CAaN1glPnr9Y16LqVKmS+hLvtCffauroWdvSvDFzYH8Wl//Vqp7OTAs34r21BlUdbByEjmfd5NhzoNQgqk0Ph12HeNWzyv3kcFrZk6h9pBnnsi5aNf832CtUAgy415+VAJ9JPUNLxz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718018064; c=relaxed/simple;
	bh=XzBhYPVJDTDe51iKcxcEp7sRj2x6KXC/6mfcExa7b78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7niYSCsWrPJ5gt2Dm6pwFKbXAUSW0P31nSowT5r7J6fQEQnvmsC0cXJ6C6UYrWmXSltRP4BgECUxQ2SIW1K0aDMUftXNfOm186dEG/fgXeXSDI9Z2W4BaT6UTHnJEYuxoZ0xnIxAs2LogdT/Qofu8thSzTcB5JVosB1w74n82E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bmbwMDsK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718018062; x=1749554062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XzBhYPVJDTDe51iKcxcEp7sRj2x6KXC/6mfcExa7b78=;
  b=bmbwMDsKkiCJ4ciIEOhz45yrjPAHgDfOK2u/mYo8PcoA9gJlbAeOYLOO
   ZkCF7/iHXp9rArSDJVfQnES+d6qFE0zz7kg96dp7Ddz/af2wlM4XHxjdx
   2NWyI9sw2sRwMaVA0SrKwbZReYlWF7yy2JWXvAaVWFUeE2vcEjut1X3BB
   HtrIjJijVwc0JxPu/EpPYjdPZ7302laKXX2pEueh/nJBMRtHICsYtbyaV
   KxREu0sE1pxIizGGf62W2Rlyqxny/rPSSZXko1xo+bfCLUTI2skklS1wb
   x72DHYQ6bEtcBOJcyQL/SWeRxtLCIrCZ0K1JGuzK7Cql4XvQMlWZxZ117
   Q==;
X-CSE-ConnectionGUID: 1Pko1AOSTgmOR8Lt3vy4fA==
X-CSE-MsgGUID: guVM/LFWRQiPU7jdu6YxiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="11996299"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="11996299"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 04:14:22 -0700
X-CSE-ConnectionGUID: 70e2A76FSOKJeliwKWmHYA==
X-CSE-MsgGUID: Bi68Qfa1QaG1UayGpqcnDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39111275"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 10 Jun 2024 04:14:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 2A0E91FD; Mon, 10 Jun 2024 14:14:19 +0300 (EEST)
Date: Mon, 10 Jun 2024 14:14:19 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/6] thunderbolt: Add sideband register access to debugfs
Message-ID: <20240610111419.GL1421138@black.fi.intel.com>
References: <20240610100627.3521887-1-mika.westerberg@linux.intel.com>
 <20240610100627.3521887-4-mika.westerberg@linux.intel.com>
 <2024061052-overhear-pushcart-b91a@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2024061052-overhear-pushcart-b91a@gregkh>

On Mon, Jun 10, 2024 at 12:32:46PM +0200, Greg KH wrote:
> On Mon, Jun 10, 2024 at 01:06:24PM +0300, Mika Westerberg wrote:
> > +void tb_retimer_debugfs_init(struct tb_retimer *rt)
> > +{
> > +	rt->debugfs_dir = debugfs_create_dir(dev_name(&rt->dev),
> > +					     tb_debugfs_root);
> 
> Why save this in a local variable?  Why not just look it up when you
> want to remove it?

I think the only reason is that we add margining_retimer_init() in the
subsequent patch that then uses rt->debugfs_dir to add the margining
directory.

I will change this to use local variable and look it up in v2.

Thanks!

