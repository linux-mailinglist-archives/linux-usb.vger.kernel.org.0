Return-Path: <linux-usb+bounces-21281-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15735A4C341
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 15:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CA4D1653F1
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 14:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32126204081;
	Mon,  3 Mar 2025 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frKZ1jt8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86DB2C181
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741011672; cv=none; b=DKDRg1lkdetPueL04uRrW6zzmwwEQYtIdPjZmrKvMQJR0FymX1ViCPqATHSBJcpjl968W8kojmdrMWjSGxX+9wChLH5Oq/aqtH98LcNI3cdldZoDtzeyq3G0rOGGy+BCYf02+pazg2hGNnt8g8ElEyDEsjBZUK4fkdEbAvjM7e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741011672; c=relaxed/simple;
	bh=XHUJqkWYA6bVdesG66XC2vhZ5BHBeUuWurJ4j2Rl0QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/Vy1qjYPwec+s8IdurpKVD4Wm/+0GrNT8DzbuyYC5+toNBIDA01iBQof7CsuybpeuX/pWB0PwEV9IN34Zpi9n7EsJfIndhsewE3QBnoTUPN5AV9rEPjKBMta1lVrwPazVqk//xnRJ+6Wrx8p2d2zxiUDifdSBhOWztlxn/fa5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=frKZ1jt8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741011671; x=1772547671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XHUJqkWYA6bVdesG66XC2vhZ5BHBeUuWurJ4j2Rl0QQ=;
  b=frKZ1jt8McRLOB4vjSq5daGgm/96YdPMGAFvRlFZflwx20oPkzB6oaKw
   LomfFvFjO1ooecEUkMxUKLIHK5bx7bVUChorBYybhN2EuwWFrfqYJ9GC6
   BiHVr+Ad8UIMAm2pzIiM0p7iJ+TwxwXhlmHOrX5hW+Hc508cWJlt06hHz
   3bcaCeavDHyKY9UpV7Ko5nZD5gc7hZV6YFjNKsSG6iL+j+4H9e42UQluM
   C+Tfln6QTP3FbLXClsznmdluWct32YYMpDyMWZ4lJe/lNt5Ryh3/l41hy
   lL4Fm/MA3POtZBkdBACSmJ9KGdHrdFM6K7V0fohP+Bb+/YuprUyoq4wKR
   A==;
X-CSE-ConnectionGUID: /7KtGCQCTuy9g1/Z6NpmmA==
X-CSE-MsgGUID: 8N9H+bDgSyC+a+ObpV4F9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="53281002"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="53281002"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 06:21:01 -0800
X-CSE-ConnectionGUID: kt9uLLpDSNm7vgi23an1vw==
X-CSE-MsgGUID: 4IadTQpgRuOf3PIF3OxSiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="155209630"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 03 Mar 2025 06:21:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id E40EE191; Mon, 03 Mar 2025 16:20:58 +0200 (EET)
Date: Mon, 3 Mar 2025 16:20:58 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kenneth Crudup <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
Message-ID: <20250303142058.GA3713119@black.fi.intel.com>
References: <d56fcd99-433e-4670-8388-7035812a78d9@panix.com>
 <20250303115329.GT3713119@black.fi.intel.com>
 <68cec31a-0132-43bd-8a61-29e0ac23b326@panix.com>
 <20250303131359.GV3713119@black.fi.intel.com>
 <744090aa-074e-443f-8a94-567dadff4c7d@panix.com>
 <20250303132327.GW3713119@black.fi.intel.com>
 <20250303134618.GX3713119@black.fi.intel.com>
 <24ef839c-8fa5-4a19-b9c6-0a267aab84f5@panix.com>
 <20250303140156.GY3713119@black.fi.intel.com>
 <567725a5-f984-4ea1-bd38-8815825c1211@panix.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <567725a5-f984-4ea1-bd38-8815825c1211@panix.com>

On Mon, Mar 03, 2025 at 06:10:09AM -0800, Kenneth Crudup wrote:
> 
> > > And my system recognizes all new TB devices automatically
> > > (no manual intervention required).
> 
> On 3/3/25 06:01, Mika Westerberg wrote:
> 
> > Right it does that if you have screen unlocked.
> 
> I'm running Kubuntu (24.10); AFAIK it just allows them anyway. The "System
> Settings" dialog is just an Enable/Disable toggle.

Ah okay then nevermind.

> > If you "forget" them then it should in theory at least keep from creating
> > PCIe tunnels, so keeping them out of the equation (we just want to
> > concentrate on the TB/DP side here).
> 
> But what I can try is just connecting the monitors directly; the portable
> monitor directly to one of the laptop's USB-Cs, and the Odyssey's
> USB-C-to-DP w/o using the dock.

Actually just managed to reproduce this with hibernate \o/ so debugging
now.

My steps:

(I run buildroot based distro on my test systems so there is nothing
 authorizing PCIe tunnels by default)

1. Boot the system up, nothing connected.
2. Connect TBT 4 dock to the host.
3. Connect monitor to the TBT 4 dock.
4. Verify picture on screen.
5. Enter hibernate

  # rtcwake -s 60 -m disk

6. Once booted up and resumed from disk verify that the monitor displays
   correctly.

