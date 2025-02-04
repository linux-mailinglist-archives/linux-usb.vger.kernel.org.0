Return-Path: <linux-usb+bounces-20102-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA57A27270
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 14:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 983AB165F84
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 13:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E167920DD4B;
	Tue,  4 Feb 2025 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TsTWDEcu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB93720DD40
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 12:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673404; cv=none; b=qOTWh4K5Er1apJltHb0Ji06nHprGRuy1iOt9yZSC5iLnxtKSWtY7/1qBNl6Qy8YikSDGKkpcg86eOrQHWdLdi8dtymdXDxxncU3GyWmYlclf3XMlY4PRLNOEeZ3jpSJMJxt/9XGSu6ylGlIDyTTw8CWDkQ79iUMlItQWLjZMUtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673404; c=relaxed/simple;
	bh=8Uw4VQ5nb+lhco+konoBSQOXpzhjxG95Tz2ejbMJp1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ifpPdks+Ms7DHUw0oNpZZpGr8FdUjOH1oCZU6Y/a4SeO5lZ+3N5ry+TBNdFC0lDd4paF+PCac9SO+yaYJbSkfB/8mGrbU9U/sMpY6Fk3Tb8CvkQ8nX5yNZT7DYvGYojfOb44ijTtedKkXi4xEKmU1ncCQPB+QLaM+aR9/iZL8xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TsTWDEcu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738673403; x=1770209403;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8Uw4VQ5nb+lhco+konoBSQOXpzhjxG95Tz2ejbMJp1Y=;
  b=TsTWDEcum9ed3Gar2C7Tl5g2vMJbTorLrxqqs92ao51qzGF4OWqrBpGb
   GBjCcssZwbc2ejFC9sVAuQJs1nnfD90UOfGNDCyUsQz9+nyRp1jvq1Sya
   Qn0RvrV67CQs5+Secdz+Hj5vKL8yE78zKr+bSrnkSa7vpNcQRuosbcDZF
   MNvP9Mq0seK5qSW+8cqE8P9orF8Db9NKp9bs5+9ruIKppR0jDHXDxQlv5
   kqZc3lQG4gxk/q4wVY1AoYX/XTXXHDDhQrzbwnfQPKeM593t/uPbic0zH
   6hC0/zQ4YTNrmkOsK2f7nQOg9t3jjVWEU2J8R7YfuFGEQ2csiAa2VEeRj
   w==;
X-CSE-ConnectionGUID: dxst2cErTUykQDmDjOiLCA==
X-CSE-MsgGUID: CgT//arATUegj2MvN5ChWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39335177"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="39335177"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 04:50:02 -0800
X-CSE-ConnectionGUID: t5O6e1mFTiGEhvw54WYB9Q==
X-CSE-MsgGUID: 2jD8GKRuRsG6SyU/Ie0AOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141438687"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 04 Feb 2025 04:50:01 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 49E3E299; Tue, 04 Feb 2025 14:49:59 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] MAINTAINERS: Use my kernel.org address for USB4/Thunderbolt work
Date: Tue,  4 Feb 2025 14:49:59 +0200
Message-ID: <20250204124959.3998521-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to use my kernel.org address for USB4/Thunderbolt work.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..0c98d6c71372 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23571,7 +23571,7 @@ F:	drivers/thunderbolt/dma_test.c
 THUNDERBOLT DRIVER
 M:	Andreas Noever <andreas.noever@gmail.com>
 M:	Michael Jamet <michael.jamet@intel.com>
-M:	Mika Westerberg <mika.westerberg@linux.intel.com>
+M:	Mika Westerberg <westeri@kernel.org>
 M:	Yehezkel Bernat <YehezkelShB@gmail.com>
 L:	linux-usb@vger.kernel.org
 S:	Maintained
@@ -23582,7 +23582,7 @@ F:	include/linux/thunderbolt.h
 
 THUNDERBOLT NETWORK DRIVER
 M:	Michael Jamet <michael.jamet@intel.com>
-M:	Mika Westerberg <mika.westerberg@linux.intel.com>
+M:	Mika Westerberg <westeri@kernel.org>
 M:	Yehezkel Bernat <YehezkelShB@gmail.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
-- 
2.47.2


