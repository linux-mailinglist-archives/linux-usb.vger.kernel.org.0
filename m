Return-Path: <linux-usb+bounces-30547-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 789E5C62BD8
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 08:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3D8AD35807B
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 07:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E854B3191BF;
	Mon, 17 Nov 2025 07:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1VBGi6k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6AE284B58
	for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 07:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763364915; cv=none; b=iFazW9+MfP1TFkPd7R+ortaGXpWvRgjSgQTtXmg2ihRdLHKAtUvRgocxI+9PNLXcCZg7qtbmQJh97SBt++bdEOOxiO1Eo14Hrtc9ZxtEy3kAS5E/N3RGnyThKhzWIY/KeWAmU2NfT0zKbRVe/oubLxdRJVGDYAkbBh/lUE5IXOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763364915; c=relaxed/simple;
	bh=kagf+hFzAx+7tenSIPjde62M890TtaoVoX7tKfkY4fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9M8IWIvmwhL5+8rfA9pluGfbgDjTiypwswFeRULGzV2LxDTOFnRo/tuTg6+V7i+/7qCpzahOvlXojhm+mcI8m3jXn6gRm2Eg2MtTXZc/YlkrWozJ1fAfwBLWkQOJGW1mGCwGBqiWIrZhHyqZIRjb9g4G1qURS4599OAecZKcVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1VBGi6k; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763364913; x=1794900913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kagf+hFzAx+7tenSIPjde62M890TtaoVoX7tKfkY4fk=;
  b=Q1VBGi6kB9MEJWo4s89snu3HHqJOFbdHM0jIpRjkJbYmWYTCL6DPgqL3
   C8KGwVC1XqgykO8eBmu4HtNDaiQmwOG6vvJbw01mIonrrYBSVPYchblXh
   ylJoufvlZYFtXyACZRylPHTM2tjuumZ4UvnY6LyPnyFBri3mUtkRz3d+4
   txuwPpTajtV8vGeNHFKN+aFxCZDKiEF5V7d3JMTaTKTwPJtrUHcDiJoBi
   aXFRynH3Thv7abQcqNmEh/b7njyMfq/PGi0HnHZyMI/fnktQig+XSyCmp
   K1L5N+kPfs9+QFiVGDbqOGWlEbGz/8VwmUlhLu81zikrYwMLiBbApbRFI
   Q==;
X-CSE-ConnectionGUID: hFfXm08VT8y+p4AFNFk7QA==
X-CSE-MsgGUID: TnCsPgHLSzCyGXmXeN0hnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="67963095"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="67963095"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 23:35:11 -0800
X-CSE-ConnectionGUID: wQho1S3sRaiBSgF4GbS6aQ==
X-CSE-MsgGUID: wvRkstOORGSFF5NcEfxglg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="190393859"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 16 Nov 2025 23:35:10 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id EAC9B96; Mon, 17 Nov 2025 08:35:08 +0100 (CET)
Date: Mon, 17 Nov 2025 08:35:08 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>
Subject: Re: [PATCH 00/16] thunderbolt: Fix typos in the driver
Message-ID: <20251117073508.GY2912318@black.igk.intel.com>
References: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>

On Mon, Nov 10, 2025 at 01:30:34PM +0100, Mika Westerberg wrote:
> Hi all,
> 
> This series from Alan and Rene fixes typos found all around in the driver.
> No functional changes intended.
> 
> Alan Borzeszkowski (15):
>   thunderbolt: Fix typos in ctl.c
>   thunderbolt: Fix typos in debugfs.c
>   thunderbolt: Fix typos in domain.c
>   thunderbolt: Fix typos in icm.c
>   thunderbolt: Fix typos in lc.c
>   thunderbolt: Fix typos in nhi.c
>   thunderbolt: Fix typos in retimer.c
>   thunderbolt: Fix typos in switch.c
>   thunderbolt: Fix typos in tb.c
>   thunderbolt: Fix typos in tb.h
>   thunderbolt: Fix typos in tb_regs.h
>   thunderbolt: Fix typos in tmu.c
>   thunderbolt: Fix typos in tunnel.c
>   thunderbolt: Fix typos in usb4.c
>   thunderbolt: Fix typos in xdomain.c
> 
> Rene Sapiens (1):
>   thunderbolt: Fix typos in eeprom.c

All except this one (there is already similar patch from Dominic P. in the
next branch which I forgot) applied to thunderbolt.git/next.

