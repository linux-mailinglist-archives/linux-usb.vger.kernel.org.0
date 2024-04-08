Return-Path: <linux-usb+bounces-9023-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC7989B701
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 06:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC4A91C20E30
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 04:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B296FB9;
	Mon,  8 Apr 2024 04:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dRpLw9jL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF12E8BFC
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 04:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712551769; cv=none; b=XrnIm+Gf77VIx1IL9nV+WIrfEgYKTleX8mcqlMpIEO/xrt4q51lT5ofq1SMvgy+0tI+7SXdIj6BY94ov7ImHsjw+yoAA0tfWDdiScFpvelmKmJkOe1480km6loGXkQ1Fu1URPYnpsDzk7Y1BZ1YAzVCVzjRuRMP/ViGqISTwQsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712551769; c=relaxed/simple;
	bh=p1sMotGykbdoCBIN/7gnQCukFfFO0CvWEHAAjbqdBKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKu1m7hLPKEg42FlCIlMLhLpXOH+Xq1P7nljiLL6MSoV+Xb+tWTk2msweBcVAaFvy15gbzR9AUNSXdWBsAzkTcxqvvQ11G0jWotuXJ/G/AX16D8lU5qwGTq6MxttlvSe8SCJboJFtTFoLi2j1iZNdNhae9lntkbYkTSKZ8g+W3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dRpLw9jL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712551768; x=1744087768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p1sMotGykbdoCBIN/7gnQCukFfFO0CvWEHAAjbqdBKQ=;
  b=dRpLw9jLWWC9xDVLAxPQNbSFLbllO2SZgfGFOAH52XKDcLzwj8QtLpko
   B+g8e6G6UqCAU/XrHsaIcW4qEEJKWNuTrm/lPM01j0VVM2KwPeB4Ff8VT
   rJPVfJ2C5HioYzavr2M7Cx+J8RK7+Xvf4Jti0u3K0V4wLwb9ElR0uQHDy
   shkZewIktCMStQWbr6b0Qkkzm1O8hifjQA00VGne49ehq3xL8VqEY0EfM
   FbpTd909AFaE4OrASudMjFHoamkbcP4Wy3jpZTKNFk2EcMhapZ0d/Rjgm
   jELmwdZYMZ4ZQiRY6zCJX6U9hC0bFsZvhRKfKpQXU9QwMYWyAaxV/Y/Rk
   w==;
X-CSE-ConnectionGUID: 94n7oVK0SFSJLHm98nKwRQ==
X-CSE-MsgGUID: cIk0vDnZRGWxrr6mcllckg==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7687104"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7687104"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2024 21:49:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="937090844"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="937090844"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 07 Apr 2024 21:49:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id E71271A0; Mon,  8 Apr 2024 07:49:24 +0300 (EEST)
Date: Mon, 8 Apr 2024 07:49:24 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Alex James <git@alextjam.es>
Cc: linux-usb@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: Re: [PATCH] drivers/thunderbolt: Enable NVM upgrade support on Intel
 Maple Ridge
Message-ID: <20240408044924.GV112498@black.fi.intel.com>
References: <20240405041152.38324-1-git@alextjam.es>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240405041152.38324-1-git@alextjam.es>

On Thu, Apr 04, 2024 at 11:11:52PM -0500, Alex James wrote:
> Intel Maple Ridge supports NVM firmware upgrade with the same flows used
> on previous discrete Thunderbolt contollers from Intel (such as Titan
> Ridge). Advertise NVM upgrade support for Maple Ridge in icm_probe() to
> expose the corresponding files in /sys/bus/thunderbolt. The NVM firmware
> process was successfully tested on a system with a JHL8540 controller
> (ASUS ProArt Z790-CREATOR).
> 
> Signed-off-by: Alex James <git@alextjam.es>

Applied to thunderbolt.git/next, thanks!

