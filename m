Return-Path: <linux-usb+bounces-6315-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B557852C00
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 10:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB823281D52
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 09:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4881C20B02;
	Tue, 13 Feb 2024 09:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eejXIA46"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB4722EE3
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 09:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707815469; cv=none; b=C4UywtE5LETNbfZYjXXz66p2HOXH1JKSt8QHw13B/RN0xIwHPMn5fP5KBddriIerTUHioA9NoU7X5tVRYtzQi1yQ4XcqyUSOr9136tKyhkJTwkzFSjdltnb3jYHqVXOcVvWQR6xmcQz4UNUXWhU/FNOhp/Cd8A9gYtZnV2xqbgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707815469; c=relaxed/simple;
	bh=VRt7eZ+iisR+aeqmlH4IvI7GAwfnnWvRdtN/Vjyv5YE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EdHdEU1MiigYxTs6JRXb+GPS3mSn61FZ7tg5hKm7oPqiBmLGoGJ69EOD2btXe1zZX+GN2PMG6Ddc0E6w4CDBA4KJPUlx+6E+MS3HdFPq6s3Jip9S5GcfmRaITibbV16jg3yLdY3m4Z2krXcW4nl0nnqbroYT5LDkYyZeDtyKw2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eejXIA46; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707815468; x=1739351468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VRt7eZ+iisR+aeqmlH4IvI7GAwfnnWvRdtN/Vjyv5YE=;
  b=eejXIA46ULqQN/cQaHjF92npDR/OjySiFeP0H38fVYHl9SQa/3mfM75N
   NZe/2LavYks3eNMox/0jCgOme30gUkHUby2TvJM2FnJksMvHBs3Btmec4
   5UFnoegJoHEYS7UI6sqLvd49QesN4XWaoq/yiy5z7hvb7+mOcIGmrxkFs
   GUrtbVCOsWiN5jfvp54VjdNgiA41l5hZYTWPoN7eZ6sHSIkIXngCvP7Zg
   YOTxmwWOCsMKT86qNAAIj9DjNd92vVX7bMP20164OezfJg/CiPwMJNcSe
   BYd6R4d2xuu+srvXy+VD3QpzcjAKEbouiwFYXdztmsA63nQFGG7fqmDrr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1957958"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="1957958"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 01:11:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="935306207"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="935306207"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 13 Feb 2024 01:11:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id E2318184; Tue, 13 Feb 2024 11:11:03 +0200 (EET)
Date: Tue, 13 Feb 2024 11:11:03 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Sanath S <Sanath.S@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 0/3] thunderbolt: Host router reset improvements
Message-ID: <20240213091103.GZ8454@black.fi.intel.com>
References: <20240206130354.1208816-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240206130354.1208816-1-mika.westerberg@linux.intel.com>

On Tue, Feb 06, 2024 at 03:03:51PM +0200, Mika Westerberg wrote:
> Hi all,
> 
> This series improves the host router reset support for both USB4 v1 and
> v2 routers.
> 
> Mika Westerberg (3):
>   thunderbolt: Reset only non-USB4 host routers in resume
>   thunderbolt: Skip discovery also in USB4 v2 host
>   thunderbolt: Correct typo in host_reset parameter

All applied to thunderbolt.git/next.

