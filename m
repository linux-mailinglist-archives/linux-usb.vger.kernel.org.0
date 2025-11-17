Return-Path: <linux-usb+bounces-30559-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5454DC63E97
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 12:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99D0F3AA63E
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 11:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24345329373;
	Mon, 17 Nov 2025 11:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9OHZwNX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3626B219A8A
	for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 11:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379804; cv=none; b=DwzVB6yEXt9GrD9IVjgu1h4SBrHDJtYDpgU+qZx0kK2RKZlqHd82iWjI7NHpnBbEnBqKnQY6etkSsqbOmQ9R+Cmf2zEaUSXASwOsSY4ocd78tE4RSe/VrzVcjokT+iCv+8UgyBEMEm5rPN+K8RlrrfC8F5t3JIOJwbJBzVxC6j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379804; c=relaxed/simple;
	bh=yu4B+EkhNtscynMXIZTPvXA0T7Pmzr83rs/AerJyC20=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HS3eISUslKlr5/Ffr2QLxJUIGQWYQVJH2vEOnBhUp/pYS+oAMPK/ZqgjtS64OqpR/ySffys/u2z1gh2U/NHsXJMmHU46nmmI0ZGp+1HsM/8g1X828Eb9oCpiLk/4q4IMCEwZWW4IjtRpD8lTEfWwyQcqaH6Y93ZqaGZkNv4xcBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9OHZwNX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763379803; x=1794915803;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yu4B+EkhNtscynMXIZTPvXA0T7Pmzr83rs/AerJyC20=;
  b=Y9OHZwNXvXx1OarhtzbfV7K+BowdMOmJdHXbln3+Cd1g5ErfG9UUSzZe
   DxwEFOjD8m/Bi/cEYK8MGxO2q2cxufvdFi8gtSHIygVhXwm+9I87GsTGK
   H1eGrvmwzgXn39q+Wkg6eaM66QiM+LR5rgQOp7ycwg67i0Ht3Ps4SzLmM
   F2Q4lSO6BxtyQv6zrzz0AwjFW7XlVgQ9NpWLbbr2a1NnyKwob7zc/KE41
   q30SmBhI7phqG/3yUVGXEaI/ONN0Qnd6+5z3iQV71hZCkqtEIw68aO+BA
   1seE9u2GKkc427aoJF2yZitVkOaPG4Y5DcPTj94UcY+rYwkHu/KWtYvzd
   A==;
X-CSE-ConnectionGUID: w80pSLCeTSK5r1hrhJ0ZmQ==
X-CSE-MsgGUID: U0oeupRiTnKrlzSqSirVCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="82763815"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="82763815"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 03:43:22 -0800
X-CSE-ConnectionGUID: rx9byR97TfyagscRGensLg==
X-CSE-MsgGUID: zTB2P2V1TrW/pwwaugRN8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="191218351"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 17 Nov 2025 03:43:20 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id A38B896; Mon, 17 Nov 2025 12:43:19 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 0/9] usb: xhci: series of cleanups and simplifications
Date: Mon, 17 Nov 2025 12:42:32 +0100
Message-ID: <20251117114242.3507856-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains an assortment of cleanups and minor refactorings for
the xhci driver.

The goal is to simplify existing code, remove redundant constructs,
and clarify certain execution paths related to endpoint handling,
command management, and controller state transitions.

None of these patches introduce functional changes; they aim to improve
readability, reduce unnecessary operations, and make future maintenance
easier.

Niklas Neronin (9):
  usb: xhci: remove redundant function wrapper
  usb: xhci: clarify duplicate CMRT deletion on suspend/resume
  usb: xhci: simplify CMRT initialization logic
  usb: xhci: simpilfy resume root hub code
  usb: xhci: relocate Restore/Controller error check
  usb: xhci: move roothub port limit validation
  usb: xhci: simplify USBSTS register reset
  usb: xhci: remove redundant 'xhci' pointer from endpoint struct
  usb: xhci: remove duplicate '0x' prefix

 drivers/usb/host/xhci-mem.c  | 54 +++++++++++--------------
 drivers/usb/host/xhci-ring.c | 77 ++++++++++++++++--------------------
 drivers/usb/host/xhci.c      | 72 +++++++++++++++------------------
 drivers/usb/host/xhci.h      |  3 +-
 4 files changed, 88 insertions(+), 118 deletions(-)

-- 
2.50.1


