Return-Path: <linux-usb+bounces-11335-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF7C908BD6
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 14:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F9BA1C21F3B
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 12:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DD7197A97;
	Fri, 14 Jun 2024 12:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gY6+bq1i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53407E574
	for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2024 12:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718368678; cv=none; b=WNreDSs0yXudFmwdO4IV5CW5DjCn2ZH3zgzRd/sqNEgk1NVZyueUSCVVUsRKQmDE8p7rUP0xHK8knBG27O+dVgTsbmd68yOpoklD5xgSZX+hUDY6pj1IpYaXweNEB8dw9aJEP51rRC+9LE/uwi9mnch1j1d5NyY1BPYt7XkNosc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718368678; c=relaxed/simple;
	bh=UdLGAD1f5+PxFZ7Gq4lmrIJxcFsaypc35Gc38W8K6lM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5gkg5+hD3Xt/wFqnacxBpHiDdAyNaJDwQplDUBhCjV+mIcGW2NF8vL8kEulrPQ0w5aD8ze9lZ1ctmPCcEcdEKcskfNGoVZwXT+o/gaFBJjAgRfil0hNvQmFHRI3FcasPPvvt+vENg0b2qBSSjFmX7m+CwZ55kg2kIZc9FUTAtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gY6+bq1i; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718368677; x=1749904677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UdLGAD1f5+PxFZ7Gq4lmrIJxcFsaypc35Gc38W8K6lM=;
  b=gY6+bq1iVELUO+pjVs7lAzkLFAzMn8Z7pNri8Ubp0EeRl30RySEoxaSK
   hDi1Drz4fZZyiAe6jDPI8jG8PD6yCnHV/QAzk6/+JASu+VYgZH56TC3d5
   T9B1JT4haMeooPdbgV8PmMd8RwBDVC/zwhWyZFt0kbU31GYyBPwbgxrkE
   Af/n/+BWGkXrEWmZWNZJkO9JeNR2T/4I8D6jqgNxhrU61d9DD4wCcH04b
   femGlTX4knGdWuLAunuLDzPbypXFlnO6r1z3qeUX2IIS3UpzGWyILAwPS
   VsJeTOAB7IL3q1NuiuvtzekcwaaiXLbQmIHGjm8ZITXabwPrRR4PHS5zY
   g==;
X-CSE-ConnectionGUID: IxUcFQnaSSOvA5iZDmn+gg==
X-CSE-MsgGUID: LyO+XUnSS2+XnQsbJw4QVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15220913"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="15220913"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 05:37:56 -0700
X-CSE-ConnectionGUID: +qU/vQ7TST+hQW44n6OTDA==
X-CSE-MsgGUID: isudwLc0Ry+JlsA+dxkikw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="40622040"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 14 Jun 2024 05:37:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id C4FD01C8; Fri, 14 Jun 2024 15:37:53 +0300 (EEST)
Date: Fri, 14 Jun 2024 15:37:53 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 0/6] thunderbolt: Sideband access and retimer lane
 margining support
Message-ID: <20240614123753.GR1421138@black.fi.intel.com>
References: <20240614121512.1361184-1-mika.westerberg@linux.intel.com>
 <2024061449-wilt-goliath-8248@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2024061449-wilt-goliath-8248@gregkh>

On Fri, Jun 14, 2024 at 02:19:58PM +0200, Greg KH wrote:
> On Fri, Jun 14, 2024 at 03:15:06PM +0300, Mika Westerberg wrote:
> > Hi all,
> > 
> > This series adds USB4 link sideband access through debugfs. This can be
> > used to run port operations etc. from userspace usable for example in
> > manufacturing. The other feature is receiver lane margining support for
> > retimers with similar use case.
> > 
> > Mika Westerberg (6):
> >   thunderbolt: Move usb4_port_margining_caps() declaration into correct place
> >   thunderbolt: Make usb4_port_sb_read/write() available outside of usb4.c
> >   thunderbolt: Add sideband register access to debugfs
> >   thunderbolt: Split out margining from USB4 port
> >   thunderbolt: Make margining functions accept target and retimer index
> >   thunderbolt: Add receiver lane margining support for retimers
> > 
> >  drivers/thunderbolt/Kconfig   |  11 +-
> >  drivers/thunderbolt/debugfs.c | 623 ++++++++++++++++++++++++++--------
> >  drivers/thunderbolt/retimer.c |  53 +--
> >  drivers/thunderbolt/sb_regs.h |   9 +
> >  drivers/thunderbolt/tb.h      |  45 ++-
> >  drivers/thunderbolt/usb4.c    | 183 +++++-----
> >  6 files changed, 655 insertions(+), 269 deletions(-)
> 
> No hint as to what changed from v1?

Oh, crap. I added it but added for the v1 cover letter by accident :(
Sorry about that. The changelog is below:

Previous version can be found:

  https://lore.kernel.org/linux-usb/20240610100627.3521887-1-mika.westerberg@linux.intel.com/

Changes from previous version:

  - Do not store debugfs dentry pointer, instead look it up when needed.

