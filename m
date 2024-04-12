Return-Path: <linux-usb+bounces-9303-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 013E18A271E
	for <lists+linux-usb@lfdr.de>; Fri, 12 Apr 2024 08:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9217D1F21DD7
	for <lists+linux-usb@lfdr.de>; Fri, 12 Apr 2024 06:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB3746450;
	Fri, 12 Apr 2024 06:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iurCq67A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE742BB07
	for <linux-usb@vger.kernel.org>; Fri, 12 Apr 2024 06:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712904699; cv=none; b=YgWLt5nZF8HT4eVezy4xknTbY7FLhyGRP3+Tg2fJjDm7HIj5AUBDst/Brr0rmXuewKol+ljK6k8kT78ohTC0G5oQ7JEb0NeB4YqPO1tkF9/kEqsgMJHDNpvgasJRAyLgE6YkRWduchPiZUtRAwtKBljuUf0Vi0vFSxqAGIyvGCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712904699; c=relaxed/simple;
	bh=vwvZJhpBwmXaG/dl/Jsjx84hJxNOHOy66xcoEZHgks0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dvw+UpeU4FEsVOmQEzelr/rF5mDdtZf3HS0YmUIMY1RGQlWt7+kjdfinxT1JW/uHwFxIileEL6rQMnDA2cZ5OjNlzTn5DutlNLEVPAidt1bKO9/8cWt9tzmydeLAc07Gtt8U6nXlOWlpEa7+caxJWgAhs35XPAFiSoWbK6v3mvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iurCq67A; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712904698; x=1744440698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vwvZJhpBwmXaG/dl/Jsjx84hJxNOHOy66xcoEZHgks0=;
  b=iurCq67AhB1sLLST3W0EKgvchJNzVlfnb/2T6TxpZn3yyd0GcF80JZj2
   Rk94USGAevmWjRrSfwXRhOJPwgwL+DJuvaSI0nv/dXeSBy6r0qO3QsPIq
   hSmtN//pqp7wKQvdGxte4+iBnF8GTOQqyz6BJ7mCQb0K6Pkl1yNyB/Vf2
   8wyOdd7Wu2v2YOLk8CvxDa8y9RqyDWMMnCRW1bumDIcy87p2C/WyKwcHK
   0dKXE1fqt+sYhFsU6zD4LI8I9q2c5dg/AB0W+sC8wm94fOh+kc2RcUNzw
   seuSldR/YZ8IGLA70QwwrYidyohnIayJZy6R9Bxe7Gopvsd+LbNAPR8uA
   g==;
X-CSE-ConnectionGUID: TKILaMRxR+OvKKZe+KTofg==
X-CSE-MsgGUID: oThFPZMhQlmcSO+oOVjQQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8203856"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8203856"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 23:51:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="937098076"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="937098076"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Apr 2024 23:51:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 420B12D3; Fri, 12 Apr 2024 09:51:33 +0300 (EEST)
Date: Fri, 12 Apr 2024 09:51:33 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: Gil Fine <gil.fine@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] thunderbolt: Fix calculation of consumed USB3
 bandwidth on a path
Message-ID: <20240412065133.GD112498@black.fi.intel.com>
References: <20240408130031.51616-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240408130031.51616-1-mika.westerberg@linux.intel.com>

On Mon, Apr 08, 2024 at 04:00:30PM +0300, Mika Westerberg wrote:
> From: Gil Fine <gil.fine@linux.intel.com>
> 
> Currently, when setup a new USB3 tunnel that is starting from downstream USB3
> adapter of first depth router (or deeper), to upstream USB3 adapter of a second
> depth router (or deeper), we calculate consumed bandwidth. For this calculation
> we take into account first USB3 tunnel consumed bandwidth while we shouldn't,
> because we just recalculating the first USB3 tunnel allocated bandwidth.
> 
> Fix that, so that more bandwidth is available for the new USB3 tunnel being
> setup.
> 
> While there, fix the kernel-doc to decribe more accurately the purpose of the
> function.
> 
> Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Both applied to thunderbolt.git/next.

