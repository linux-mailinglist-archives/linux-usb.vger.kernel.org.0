Return-Path: <linux-usb+bounces-23388-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46423A9A07E
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 07:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7570244345A
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 05:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80D61B0420;
	Thu, 24 Apr 2025 05:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cG5LKvKH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767D48F5C
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 05:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745472982; cv=none; b=Od5FCbvFLTX0Qg+5W752AUSIpSL4OORKLRMa0GETPkBv/fa/d2UMdES+vWGxGBwuJWAxsmDp+8uCK3DDCA/XFULqQVAQVHcBsnHusWZgHrq3MYpD0AdNLLct2nlABg5DrmSlweyk6c8ApTlYpGWsZstRzLFeMWRAOq2yqEVIvEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745472982; c=relaxed/simple;
	bh=PmeDsCuqA7Rz76GZrlCUUNbsPlKf2vLiO8/LmP6S52A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUZQhZrjgH9tJwWF7qZfV4VhtbE5JkRywIrQxOskIPMU+umHtVpcnMROnYPA2iuZmTo9R+l+Ynez2Lw5FXIEjb07QL963JrY8ILv83pj7SYuqRKEjPfthz7Lo2jaQRXmBWoJcTidkMo1Erx3jjrCTtcOspYe6TIq3xPGqC6aNC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cG5LKvKH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745472980; x=1777008980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PmeDsCuqA7Rz76GZrlCUUNbsPlKf2vLiO8/LmP6S52A=;
  b=cG5LKvKHVB4diNEDHKxK1p2NFTWClsm4NBby5UNbJ4cqbwiznXweKw1z
   1CawivxCmbRx+3CXQiI0afRCujHRupZZaPArG+qT1KF0He7MI/CzSRENN
   llSOIvvdrMMl8+8QbOjiKshPZoF/d3QO+8HKM7WQNApEMjApuIzAczcNI
   KOF+zN/mSSKWhGsTGpbIpcMCUcV/36CgFqagXgCZT2frRmmcADoUhmxeE
   /j3xzmcPjMNq+tQvHlEktOgBTjjsJXFUOckT6mXnC6VHWGtAB1Pq+Baiy
   FbMl2legwfomPkVb1Y7t8zn1mNUzsx1VNggeQqWy0Y59kLLvyQdWpscMN
   w==;
X-CSE-ConnectionGUID: e1D7rHeSRUOxcExiBNhsCw==
X-CSE-MsgGUID: /ZJD3WrLSTyiGHnxTLKvxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46998314"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="46998314"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 22:36:18 -0700
X-CSE-ConnectionGUID: k7FQ5BIkQy+Y6auNV4eT4w==
X-CSE-MsgGUID: 6qN68vxQRgypOd2SVVKyBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="163490307"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 23 Apr 2025 22:36:17 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5C3D5224; Thu, 24 Apr 2025 08:36:15 +0300 (EEST)
Date: Thu, 24 Apr 2025 08:36:15 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Saranya Gopal <saranya.gopal@intel.com>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 0/4] thunderbolt: Notify userspace about tunneling
 events in the domain
Message-ID: <20250424053615.GM88033@black.fi.intel.com>
References: <20250417090426.221773-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417090426.221773-1-mika.westerberg@linux.intel.com>

On Thu, Apr 17, 2025 at 12:04:22PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> This series adds support to sending uevents to userspace about changes in
> tunneling such as creation, removal and bandwidth related.  One intented
> use-case for this is an upcoming USB-C daemon developed by Saranya that
> then notifies user for example if there is not enough bandwidth for
> DisplayPort requirements. We also added debug tools [1] support for these
> (currently it just updates various screens on event but we are working on
> add event log there too).
> 
> The Firmware Connection manager side is kind of limited though since there
> are not that many notifications we get.
> 
> [1] https://github.com/intel/tbtools
> 
> Previous version can be found:
> 
>   https://lore.kernel.org/linux-usb/20250410125600.3074417-1-mika.westerberg@linux.intel.com/
> 
> Changes from the previous version:
> 
>   * Add missing SoB.
>   * Add documentation to admin-guide/thunderbolt.rst.
> 
> Alan Borzeszkowski (4):
>   thunderbolt: Introduce domain event message handler
>   thunderbolt: Notify userspace about software CM tunneling events
>   thunderbolt: Notify userspace about firmware CM tunneling events
>   Documentation/admin-guide: Document Thunderbolt/USB4 tunneling events

Changed the documentation to say:

  "The format currently matches what the driver uses when logging. This may change over time."

and applied the whole series to thunderbolt.git/next.

