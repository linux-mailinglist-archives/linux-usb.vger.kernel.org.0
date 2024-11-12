Return-Path: <linux-usb+bounces-17458-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF169C516D
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 10:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 721901F22290
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 09:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7AB20DD42;
	Tue, 12 Nov 2024 09:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D//hTBhI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3E21F7092
	for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 09:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731402273; cv=none; b=il8yI43nGKpCQLDWhZzYAlxN50kxmEeq7N5rcQOhqkmeCbUSFuQTUxdw2vBikdSuOWZK0K85rYCsxv0NB07S5SCY0qowlmypBkg5A2Or8QZKaaEc40c8ycPV2orOkPqUHjGbOi8bKPR77GqTNLoANIkHDAroFVn7eFThLaUpgHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731402273; c=relaxed/simple;
	bh=rqeNHFsCgUutBj4MfjV278EF2e93Rt1b8Q/9BRn+LRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l2tZNJ1ayPc9KZ+c5LkDKK/vtADi/N9PJRge29z7Muz1VkeHF+X89yzDjxSKxXA9NxTzY9wBk+YNgJ1kIfeeIy1AUH2nZ5xN2lnqAMSiz9Alod/Aob5P6Y4SZ51QjOzABaht/6kaZU+GnEBbmcENiPzx+rxh/5+7lXkvoxN0f8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D//hTBhI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731402272; x=1762938272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rqeNHFsCgUutBj4MfjV278EF2e93Rt1b8Q/9BRn+LRs=;
  b=D//hTBhI2aOrZrOis2H/ANL2sRxlhYGqnqN/xi5QRBNuBRD8aNZbEVEo
   SUFRQOKLEMuLvDGBtgH0o4s4XTi3lZ8ZbDsrkSyxvkAWx4LHCYQm4jya2
   MP3LFi5NHL20bVQBLBflgD+J90jEaDzxdTdX+EAgZUGnfGLE5uxi9vvRJ
   mKHjRD60T94og3NN0FUCNKYnm1UAhu2WbPO01msUJZPo48iFGmr2vyxUE
   dDXopof/rZGOt/xXQDtzHkudffGhgx8PflKP9da9OfPxH2HhW8sfkpNOQ
   IDMSnytqv9WBYefZUlWA1j3nyL6Wc0wvN4jxlAIC0AB6SrJZs+VkpBl6z
   A==;
X-CSE-ConnectionGUID: l/l/DJ5DRj2AWPSIBXbFMA==
X-CSE-MsgGUID: 8aJFHMYMTDazJ47+bhy1tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="41835091"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="41835091"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 01:04:31 -0800
X-CSE-ConnectionGUID: ZkLArKxDQh+DmlgAtq+SZQ==
X-CSE-MsgGUID: R9xqgccKQ9e1TK+ePhMYmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="87240578"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 12 Nov 2024 01:04:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 4BB77233; Tue, 12 Nov 2024 11:04:28 +0200 (EET)
Date: Tue, 12 Nov 2024 11:04:28 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt changes for v6.13 merge window
Message-ID: <20241112090428.GR275077@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 81983758430957d9a5cb3333fe324fd70cf63e7e:

  Linux 6.12-rc5 (2024-10-27 12:52:02 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.13-rc1

for you to fetch changes up to 40aeea50444793ed106997a49c7083b656bccfa7:

  thunderbolt: Replace deprecated PCI functions (2024-11-07 12:59:19 +0200)

----------------------------------------------------------------
thunderbolt: Changes for v6.13 merge window

This includes following USB4/Thunderbolt changes for the v6.13 merge
window:

  - Add Gen 4 receiver lane margining support.
  - Replace usage of deprecated PCI functions.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Aapo Vienamo (8):
      thunderbolt: Don't hardcode margining capabilities size
      thunderbolt: debugfs: Add USB4 Gen 4 margining capabilities
      thunderbolt: debugfs: Implement Gen 4 margining eye selection
      thunderbolt: debugfs: Replace "both lanes" with "all lanes"
      thunderbolt: debugfs: Replace margining lane numbers with an enum
      thunderbolt: debugfs: Refactor hardware margining result parsing
      thunderbolt: debugfs: Don't hardcode margining results size
      thunderbolt: debugfs: Implement asymmetric lane margining

Philipp Stanner (1):
      thunderbolt: Replace deprecated PCI functions

 drivers/thunderbolt/debugfs.c | 504 ++++++++++++++++++++++++++++++------------
 drivers/thunderbolt/nhi.c     |  12 +-
 drivers/thunderbolt/sb_regs.h |  32 ++-
 drivers/thunderbolt/tb.h      |  16 +-
 drivers/thunderbolt/usb4.c    |  18 +-
 5 files changed, 418 insertions(+), 164 deletions(-)

