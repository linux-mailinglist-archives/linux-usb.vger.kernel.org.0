Return-Path: <linux-usb+bounces-21946-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB62A6A56D
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 12:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B884116E9D5
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 11:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6A222068D;
	Thu, 20 Mar 2025 11:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LmNU/Nq4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F1B21E0BC
	for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 11:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742471359; cv=none; b=WxJdOaPEzCt1NClcDLxfhlyGcXLtlE6KMh5jBG1DZTI8HeaO0leBeRXJwyH99oek14dw+DMJsQFfLC+QLFVxSQ3Sk+MTImP0ymP6OyQT6wD0S08d3J0yht+BLsxNnRIGk8BSGTXz35wAxaJ1E/FsMejKQK+JpzjXXIMn9c1WRvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742471359; c=relaxed/simple;
	bh=uiOIpPftMNj+mJfOVt7z/oY3CV/1/UJJ+6MyjN5b91k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=edi0C/8PohXi8HPxKYEC8PpUjq+zLEU7j9McKXV/+qQA3lDu9soA08POs6V1KNI58qMwwY6Bkiw+vP9QFZy3GklnUjfvGCMo80KeNGGBQS9p/TS3itQqX4IQLnVjaWJoSNOSaGUnAT9WIA/MUp6VgNLPnyt1Q+AryvbhoOAIWJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LmNU/Nq4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742471358; x=1774007358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uiOIpPftMNj+mJfOVt7z/oY3CV/1/UJJ+6MyjN5b91k=;
  b=LmNU/Nq4uG8RiU1nedNYrDPTsMHE/cp8pc0EfBNLWebAePGRlgc4SqCb
   xBEzMRWeKOHLM9n1nY98rK65RKpQ7k0Tmcqw719/mvirUJknMCNn3UJ+q
   nZNVPf4Psce69JOMK3G8OFhdkt9U+d6VremSjfHQ/ecjc5gBk5CHDDzjq
   73thQZEckc/PZJegqgnYX0/gc6Uzd1HeyrB1ApnAuOB9aCmGmY1BS2tON
   OeDh65jFOKzPA2F3MRmQWpcfHdEEnhRzHmshSPiJy9xQQXnwqGR+sxjTF
   KEEgp9ofUjL0t4RlphwayCIts59LAEHJawWDSfLPlDQWp9SRVjebOgxxw
   Q==;
X-CSE-ConnectionGUID: 2/qhOzL6RxaXCltGJ74VxQ==
X-CSE-MsgGUID: 3m3fUsI5RJW3fPYvDV0I9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="42866605"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="42866605"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 04:49:18 -0700
X-CSE-ConnectionGUID: HcgLUqikTIu9d9SeUthdmg==
X-CSE-MsgGUID: MoX5wVe9QbW8EDgBSA3GUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="123077250"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 20 Mar 2025 04:49:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id BDBF91D9; Thu, 20 Mar 2025 13:49:14 +0200 (EET)
Date: Thu, 20 Mar 2025 13:49:14 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt changes for v6.15 merge window
Message-ID: <20250320114914.GO3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.15-rc1

for you to fetch changes up to ad79c278e478ca8c1a3bf8e7a0afba8f862a48a1:

  thunderbolt: Do not add non-active NVM if NVM upgrade is disabled for retimer (2025-03-17 12:24:56 +0200)

----------------------------------------------------------------
thunderbolt: Changes for v6.15 merge window

This includes following USB4/Thunderbolt changes for the v6.15 merge
window:

  - Move retimer scanning to happen bit later to work better with
    Pluggable USB4 devices.
  - No need to add non-active NVM for retimers if NVM upgrade is not
    supported.
  - Cleanup for tb_tunnel_alloc_usb3().
  - MAINTAINERS update.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Alan Borzeszkowski (1):
      thunderbolt: Make tb_tunnel_alloc_usb3() error paths consistent with the rest

Mika Westerberg (3):
      MAINTAINERS: Use my kernel.org address for USB4/Thunderbolt work
      thunderbolt: Scan retimers after device router has been enumerated
      thunderbolt: Do not add non-active NVM if NVM upgrade is disabled for retimer

 MAINTAINERS                   |  4 ++--
 drivers/thunderbolt/retimer.c |  8 +++++---
 drivers/thunderbolt/tb.c      | 16 ++++++++++++++--
 drivers/thunderbolt/tunnel.c  | 16 ++++++++--------
 4 files changed, 29 insertions(+), 15 deletions(-)

