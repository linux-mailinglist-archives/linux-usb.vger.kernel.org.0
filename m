Return-Path: <linux-usb+bounces-23920-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B6241AB57BC
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 16:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B390C7B7303
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 14:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CD3183CC3;
	Tue, 13 May 2025 14:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+VNIp/e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2723314B07A
	for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 14:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148208; cv=none; b=X8MhVS1bmtn+wHZMaYoRb1dwNZv2HefCgg++LcJP6egdV26i/UTMNM/RLuxlPGLe6eIx8r52l23DdWVH2ALiOnPrCorObLog6dpI1qkaLDs8G6y9JI9EHysfikwrZbX0HKAvLzzobZOH8y8GtIG25BdhgnlNGGClB2eNV5sX6OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148208; c=relaxed/simple;
	bh=5WPYX2FUSaG//R9/fOLZtAnSly0lE7TEezO9CmjsOZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WuF2y2xI+sELxsxQ/Su0wCxdNrYKqLuzYKL1Q+2r8XircIBa0omV3L24D+XGqDFn0P+e8iai/zwH1sxXK24Nd/LMWiida5dm/C5cWVXmdWWjWjt+r1AUQSlbdzmaaHp1RSe/iMkIQR+R2w/06AELtnHm/yoDuU5+zaTYQ8hCIrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+VNIp/e; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747148207; x=1778684207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5WPYX2FUSaG//R9/fOLZtAnSly0lE7TEezO9CmjsOZc=;
  b=J+VNIp/e9a5CGkV9aNp8lPeHO2wg0rvKl5Y04la9SZpb6x0fDIs1S9/y
   g/mvR0GJWpDgtfoX0GNpLojthK4oBABurhMfZ5raEj5OCgblaxy5alG4X
   mP2O558xHYr3J9uLnECizevnyOZNbT3ujyPGcNhRM3klyVnu4IpBfzmlS
   jEvxTaKYHOjWdr1AJujbGPPjznMIxXLb+ps32ISK0K5P9JNkG7qLo5RGD
   zOHdIu6z2niDw6jPbsLiUeQUBIV2T5mZrUNSVu1FDKUEyrop23KsCx8va
   cmbzarvD9ipz2LwCvJtl0hZD1O9MXEEZMMUZUKXDTCuZLnfxrlPSI/T4h
   g==;
X-CSE-ConnectionGUID: OU+oDBDETMuw5+eAO6Ug0w==
X-CSE-MsgGUID: fQZKrddVSxC4BKlL8NPiWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="52808584"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="52808584"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 07:56:42 -0700
X-CSE-ConnectionGUID: S0vdqwHNSVm4Sa+UMkEbaQ==
X-CSE-MsgGUID: onbxJ8awSaGoVWRou0orqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="138715799"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 13 May 2025 07:56:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id D14A3217; Tue, 13 May 2025 17:56:38 +0300 (EEST)
Date: Tue, 13 May 2025 17:56:38 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fix for v6.15-rc7
Message-ID: <20250513145638.GM88033@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.15-rc7

for you to fetch changes up to 0f73628e9da1ee39daf5f188190cdbaee5e0c98c:

  thunderbolt: Do not double dequeue a configuration request (2025-05-09 12:14:25 +0300)

----------------------------------------------------------------
thunderbolt: Fix for v6.15-rc7

This includes a single USB4/Thunderbolt fix for v6.15-rc7:

  - Prevent crash in tb_cfg_request_dequeue().

This has been in linux-next with no reported issues.

----------------------------------------------------------------
Sergey Senozhatsky (1):
      thunderbolt: Do not double dequeue a configuration request

 drivers/thunderbolt/ctl.c | 5 +++++
 1 file changed, 5 insertions(+)

