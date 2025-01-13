Return-Path: <linux-usb+bounces-19257-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C33DA0B986
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 15:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59C18165460
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 14:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2461E2397BF;
	Mon, 13 Jan 2025 14:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gu5nUTmB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F8F20459B
	for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 14:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736778651; cv=none; b=b8Tt7mMWYOxaxFbFJyt3IDGCKdbJJeqE+gvBj2ZeipsZ41SjnYb5oJ6a5UlT7J4ItRcgaEXTIt6WDJTYmi5069y26uYVrdIs0lMvFp2vyIACHid7UElTL0a/eZ89nV8R9/K61xO1nH45Sslc6rOVn/5+j+0QTtXc8JH/IJ1xV7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736778651; c=relaxed/simple;
	bh=D2WzDMqpOcBHy8wvlAaZt2x+UeMjXZbwy3IJmqc94fo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XDWOU5ny4AXfC6+6WMGGBtCPyJKP5euXrQEJo9sOD6KWXO8Aw1BrTbXuNpeawBeZqTj8KDA0tnqrAy16EkCb5KrHzuvfyaB0BBq1anzBpQRhZQ3Dme+J+GtLUwdcpT6ZNC5gaX/9z4VrBg5r6WBbJ34tv4vxszTQE/QSL40ybYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gu5nUTmB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736778650; x=1768314650;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D2WzDMqpOcBHy8wvlAaZt2x+UeMjXZbwy3IJmqc94fo=;
  b=Gu5nUTmBeAXt+2cGDla85+t+0O//brGZ12ak5NILCHNZp8Gu4xLNXQqQ
   myukuFdIB65pDOMe0CjNhPhGjx4J3CTKFx2RYwDniQqUFeCXVbsbmhQYn
   Aa4rMYMB09jZ4jubHmjAEJPZKJtSJ2fqFNLtdjxWLBQ7rBZDYilUW5mtl
   neJnBKCoQoZDBTC2BesTmUZqoo+5Yv3N+Ojkk4ZDEfBMg5ztkFpUIFs20
   iMF49uCQ/AH6z2Q4d38hU89E54ctvp7Ak4k6yRnVhnvnw+9F595IWrnGM
   kxWHPZuBXhFl7bqtsgJzhM9mvrYk9B13rT3sRcsqP0ojqUr/ALqzy2jqO
   g==;
X-CSE-ConnectionGUID: D7QNL/PAShiaidkn7IJuhg==
X-CSE-MsgGUID: ATlBaYi1SdOXhptrmdT+7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48458168"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48458168"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 06:30:49 -0800
X-CSE-ConnectionGUID: ttBG9BxWRgWPSLY5jlfBcw==
X-CSE-MsgGUID: ueJLXmZDTyijexUpci8EdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141774285"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 13 Jan 2025 06:30:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1058)
	id DEB853B7; Mon, 13 Jan 2025 16:30:46 +0200 (EET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: michal.pecio@gmail.com,
	linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 0/2] usb: xhci: page size improvements
Date: Mon, 13 Jan 2025 16:30:35 +0200
Message-ID: <20250113143037.2131346-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct off-by-one page size debug message.
Set page size to the xHCI-supported size, instead of 4KB.

Clarified the interpretation of the xHCI spec 1.9 regarding page size.
The correct interpretation is that only one bit is set, indicating the
only supported page size. This is supported by the following sources:

Section 6.6.1, PSZ:
  The PSZ calculation uses the page size bit and would not work with
  multiple bits set.

Section 7.7, Implementation Notes:
  "This version of the xHCI spec only allows an implementation to support
   a single page size, as reported by the PAGESIZE register."


Version 2 changes:
* Added handling for invalid page size register values.

Niklas Neronin (2):
  usb: xhci: correct debug message page size calculation
  usb: xhci: set page size to the xHCI-supported size

 drivers/usb/host/xhci-mem.c | 34 ++++++++++++++++++----------------
 drivers/usb/host/xhci.h     |  8 ++++----
 2 files changed, 22 insertions(+), 20 deletions(-)

-- 
2.45.2


