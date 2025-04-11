Return-Path: <linux-usb+bounces-22966-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F08A85B9D
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 13:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92F9F9A10EB
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 11:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F87C238C08;
	Fri, 11 Apr 2025 11:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OqrFqABA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01A2238C23
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 11:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370655; cv=none; b=WhifxYJ/zoxDa5zlJPVYfIQIHfSx8FRwrzAmB1LHiJsVhkWFIBKEOkJ/EAfr3z3Y/d5tXDTQ85JtjAB7SPa3hTMqGiMb0FqXCZ+1qeEW06/z65+KqwJrCv9l51A0svRqzLZ0rqJ2KG4NvwCPB3pWBjEZ+25riIYDpXPXvH1nOh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370655; c=relaxed/simple;
	bh=9iBHr6IG13IWMT2JSk57lAbaErcXcKqoqN+kezNH/tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hq1/wDtnF5m0LsyVeSx1o4Khrm39m+nB+yeHKiMkGDaxPTOEK9mZsScR8r0eNQ66fgU5uNZCxc3L1N5DRdaKeAiTE/Lz+UDU4PILbVe1XmOU7jG/yj0K6Rojoz2lJ05SHjl4oJNNg77IoZP+Xshkc2wrjXd9q9CZui9BmYojKk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OqrFqABA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744370654; x=1775906654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9iBHr6IG13IWMT2JSk57lAbaErcXcKqoqN+kezNH/tg=;
  b=OqrFqABAIXS0PVq2IgahpAf4lgR5HEbiowOIBG8LpPu2y9BkMmOjM6F2
   GECF1u/sF7jqJjaeTx3aCIpk/6VshUupahhi2HY0pDoLKbAv+FxKxomwL
   WL46P9hsJ+IqItaLJG9Ay2DCgRNhmBZHg0M4p6hIqZQuW1NxE88Tfp2td
   U6n7rj3+s+ekimIBHfQkEhedlvwY8lIflhxZf020Nvbmvm54prcx90vU/
   wVFq3+DbUQwR11QdCz5xkfRoMFA5mCLW7TwcFEpv0IUFaZnQfzQXtOVbI
   dGe7HHPTHA7jpLwy65A30+7lk5jNNpvGrZ7TtWx38U65DL6n3klOjormx
   A==;
X-CSE-ConnectionGUID: LbYQw74vTpahXNd81sR3kA==
X-CSE-MsgGUID: kL2BQX1SQKCJ6K38SQTqJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="46047811"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="46047811"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 04:24:13 -0700
X-CSE-ConnectionGUID: /v8fPF28TFSB/JwE6ui+JA==
X-CSE-MsgGUID: 0B6kjb5oR/mNJisRtpQUrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="134034566"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 11 Apr 2025 04:24:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 4E64D57F; Fri, 11 Apr 2025 14:24:08 +0300 (EEST)
Date: Fri, 11 Apr 2025 14:24:08 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com, andreas.noever@gmail.com,
	michael.jamet@intel.com, westeri@kernel.org, YehezkelShB@gmail.com,
	Opal Voravootivat <puthik@google.com>,
	Raul Rangel <rrangel@chromium.org>,
	Utkarsh Patel <utkarsh.h.patel@intel.com>,
	Richard Gong <richard.gong@amd.com>, Sanath S <sanath.s@amd.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Use wake on connect and disconnect over
 suspend
Message-ID: <20250411112408.GC3152277@black.fi.intel.com>
References: <20250410043717.2291559-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250410043717.2291559-1-superm1@kernel.org>

On Wed, Apr 09, 2025 at 11:36:57PM -0500, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> Wake on connect is useful for being able to wake up a suspended
> laptop without opening the lid by plugging into a dock.
> 
> Add the default policy to the USB4 router when wakeup is enabled
> for the router.  Behavior for individual ports can be controlled
> by port wakeup settings.
> 
> Cc: Opal Voravootivat <puthik@google.com>
> Cc: Raul Rangel <rrangel@chromium.org>
> Cc: Utkarsh Patel <utkarsh.h.patel@intel.com>
> Cc: Richard Gong <richard.gong@amd.com>
> Cc: Sanath S <sanath.s@amd.com>
> Link: https://lore.kernel.org/linux-usb/20250410042723.GU3152277@black.fi.intel.com/T/#m0249e8c0e1c77ec92a44a3d6c8b4a8e5a9b7114e
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Applied to thunderbolt.git/next, thanks!

