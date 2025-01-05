Return-Path: <linux-usb+bounces-18987-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6D3A018A5
	for <lists+linux-usb@lfdr.de>; Sun,  5 Jan 2025 09:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 823F33A38C6
	for <lists+linux-usb@lfdr.de>; Sun,  5 Jan 2025 08:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA8C14AD19;
	Sun,  5 Jan 2025 08:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXKP6aDC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ED414A4D6
	for <linux-usb@vger.kernel.org>; Sun,  5 Jan 2025 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736066183; cv=none; b=Nm4fbUmYHVlWCBggGnFNmS3ldSG7M6OnHXKF95JrIr+oU52j3XqkK7lH4sTUaPfZ9FQB2c5gmEp65DN/ATMzIO4Mv/TAGgoICmiPgfvMrN7yAf8fticGRmfBtNvwQYFnHHASN0DnE7p2281TgIbv5XIzOiD+Z6A6SbaLcujFJWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736066183; c=relaxed/simple;
	bh=qwiIf2EbmBUROXDXMuUlRxzozr7+87V2XN8I4izh2lM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deDPIHSzvJGvIURNrhuiYnrgP5pjM0okvY6utA/J/eJbmG3J4t66XRAq8PxQRI5sgov0+jA5LxnhNcIDkKgniR3Zm0NVGDj4hY3IsVa5AOcAy4L+k4ecvAtOtzsssQaBE38znlFecFGt2rU4KXkBfNfQXZiXJimzg4Le86pgKGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXKP6aDC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736066181; x=1767602181;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qwiIf2EbmBUROXDXMuUlRxzozr7+87V2XN8I4izh2lM=;
  b=SXKP6aDCvoXAN3OBDW8DmMy7KTV8EKFdWWYv5ojhJNzpESDZwVjbt57z
   NuxyKrbyUhZf+x16mhbqMLjBO64NJGR8lj8Wo10pu/AfuL7eb/zI3AFOP
   NUQFdqexwbDzp9xlD57FVByd4W/nKct8j6A9pBqyqmJZifRSJTby5WZwX
   adr4sSFNM7xMMLE/aPtD63kmUMwjZWaiRO+NhKj23k0ssfA6NBxZ9UTOX
   9pEEh3b/ov7Wt370GaB4GxU6633jc37uavGMqak2SapgNsUPPTLzbCDTa
   zjThq6JTUqpRk3GThwQbMudOTbvF1OwfmitRcQ4rnvsKv13J/DUU9UUWy
   g==;
X-CSE-ConnectionGUID: Z4seSIREQ4qPIOgd3k9HOw==
X-CSE-MsgGUID: +inXkMx9QYibG/c7w2TSwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="36119636"
X-IronPort-AV: E=Sophos;i="6.12,290,1728975600"; 
   d="scan'208";a="36119636"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 00:36:20 -0800
X-CSE-ConnectionGUID: VdBJ4QDIRLa4Z0rn5xxEKA==
X-CSE-MsgGUID: qaT/7/DqTPyoZwcc8OYiWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,290,1728975600"; 
   d="scan'208";a="107131754"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 05 Jan 2025 00:36:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id D623826A; Sun, 05 Jan 2025 10:36:16 +0200 (EET)
Date: Sun, 5 Jan 2025 10:36:16 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH] thunderbolt: Expose router DROM through debugfs
Message-ID: <20250105083616.GV3713119@black.fi.intel.com>
References: <20241227133030.3401991-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241227133030.3401991-1-mika.westerberg@linux.intel.com>

On Fri, Dec 27, 2024 at 03:30:30PM +0200, Mika Westerberg wrote:
> Router DROM contains information that might be usable for development
> and debugging purposes. For example when new entries are added to the
> USB4 spec it is useful to be able to look for them without need to
> change the kernel.
> 
> For this reason expose the DROM through debugfs.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/next.

