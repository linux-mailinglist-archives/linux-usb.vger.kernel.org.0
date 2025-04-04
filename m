Return-Path: <linux-usb+bounces-22584-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1578A7BBCC
	for <lists+linux-usb@lfdr.de>; Fri,  4 Apr 2025 13:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85ED53B285D
	for <lists+linux-usb@lfdr.de>; Fri,  4 Apr 2025 11:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E091E1DFB;
	Fri,  4 Apr 2025 11:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYvYCBWd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4A351C5A
	for <linux-usb@vger.kernel.org>; Fri,  4 Apr 2025 11:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767631; cv=none; b=LM6+VVKuLF3baEEQno2eIDGYCfKG6A1fTuGVFFRLLJEUyaFixaT5ImXObTeIsuU1PhC8bvSay5wZ+OTR7lzinOekBDyrxvXAyJtTaizs3UVIBmUHfa3QA9dv3BPZ0BFSvGIN7SoshSE/9BY8XlKG2kFGWQSxKQUENJvORdp+CSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767631; c=relaxed/simple;
	bh=L76x2aOI8gBopwH7Cmr1fcFh1/43f33QI4YbZJX9RqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQiPN59C2DYJcGhv49F+NtQ6rfppUdAVFFf/B/qIA1fUqqXt0lBEtIOKIN/4cBYNNq7wM19wGg7IAbUhcNKe0zAsoFnes7DA9hs3C6itlNL1hzoBKM+i9zDXjTM/JjBlXjHtASAhMfM1Bpa6Aory6xPynVwYszmdRGbg46hUstM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYvYCBWd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743767630; x=1775303630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L76x2aOI8gBopwH7Cmr1fcFh1/43f33QI4YbZJX9RqY=;
  b=IYvYCBWdz/0z+k4r5SFtBoNWeMwiqREBKj0K+drHmqEShzxlD4jCcrMl
   eog+pLmOPXqAX386T3v39ME4oz4BlnvBSujE9VCzMhBAKkjEiOFYExbkG
   jz05dHiz4Z6UJufrCxYNhRFOzFbwcy3f7fkm42y4GKLNuZJJQjWZajDsS
   mO9XbcR6y/9LjVUUPZzn6rAxS37dl1VMKYZB7sFxmeTb2vtkTtIWoKicV
   ee0uQteCSCdSH3umxYOb8CQPnGmJ12Ij+Pjxy9QFpc1hLG7CBcbBgZyCv
   2POG5WL0yg7DsnERvpLx/Rl6IRLOkA7iClwe4GyIXeejv3RvVUQ1hP7ss
   g==;
X-CSE-ConnectionGUID: 286o2hM+Qm+4gXK3bbSycA==
X-CSE-MsgGUID: wd5LUGb5QbGUVIAoUnmM8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="67676826"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="67676826"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 04:53:50 -0700
X-CSE-ConnectionGUID: UWzhF0mST96YecNA8j/hDQ==
X-CSE-MsgGUID: rLDWRjoZS3uQDHWGjaw2gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="132413495"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 04 Apr 2025 04:53:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id B613B245; Fri, 04 Apr 2025 14:53:46 +0300 (EEST)
Date: Fri, 4 Apr 2025 14:53:46 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <superm1@gmail.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	"open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
	"Gong, Richard" <Richard.Gong@amd.com>
Subject: Re: Wake on connect / wake on disconnect
Message-ID: <20250404115346.GN3152277@black.fi.intel.com>
References: <ce2048af-1044-4424-bca2-3799baefb9c2@amd.com>
 <20250404060203.GM3152277@black.fi.intel.com>
 <3b283147-cd32-410e-a163-9e603fd40bc1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3b283147-cd32-410e-a163-9e603fd40bc1@gmail.com>

On Fri, Apr 04, 2025 at 06:47:31AM -0500, Mario Limonciello wrote:
> On 4/4/25 01:02, Mika Westerberg wrote:
> > Hi Mario,
> > 
> > On Thu, Apr 03, 2025 at 01:12:07PM -0500, Mario Limonciello wrote:
> > > Mika,
> > > 
> > > Recently there are some conversations about wake-up from connect/disconnect
> > > happening and I wanted to get some background from you about the current
> > > policy set in tb_switch_suspend().
> > > 
> > > Wake on connect and disconnect are only used for runtime, not for system
> > > suspend.  Would you be open to adding wake on connect as well for system
> > > suspend?  This should help enable use cases like plugging in a closed laptop
> > > to a dock (which works on Windows).
> > 
> > Don't we already have a similar for all usb4_portX devices? That does not
> > work for you?
> > 
> 
> I think that will functionally work - but I'll double check.
> 
> However usb_portX power/wakeup defaults are 'disabled' so this would need a
> udev rule.  Could we set the kernel default for those to 'enabled' instead?

No because that would trigger wakeup each time you unplug/plug and this is
certainly not good if you close the lid, unplug from dock and throw the
laptop to your backpack. Chrome uses this with "dark resume" so if this is
supported by the userspace then it can also enable these.

