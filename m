Return-Path: <linux-usb+bounces-27731-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C56F2B495AF
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7473D7B8368
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CCD318137;
	Mon,  8 Sep 2025 16:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qp7pzOFp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C0830FF00
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349159; cv=none; b=jn6cSsHj6j9tzlChjLzt13VzH2MRudE8FVwJkK5WRLBaMlnxQA0PJ4b2dvYQXB42SFmlvtRSiZ88GbbzCo1biCntlVuy1A06guv/GDyxxU0jPWoDfjo1iJVOVpr9G6hzSjB3jNrrzeuagOR0OFwoOW3xc8nuPhSvNqMQ2NKltGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349159; c=relaxed/simple;
	bh=fM7CEZ/Ial6HsWqORRWbmKjurOOermpRHEonyRFZagw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBcor6khd5V6u1mAf8Y8b4z3pHl1l4l2ydhM42UQL+YSiQ/wZuvRzoItENa+j/SBVnlN8e2ZKbMIFUEjBan7kPQN6p4RcY29JXnI6REDh9YDQaG1e+d9ILG9fPQj1ZZpSElV9su2r19T+EMJKUKRGKxKAMWDjeG9kkmsvTjGYG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qp7pzOFp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349157; x=1788885157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fM7CEZ/Ial6HsWqORRWbmKjurOOermpRHEonyRFZagw=;
  b=Qp7pzOFpLN1od8p1aLpzlt+DqImaSFHvd2ujxeG1hwVYPAs2d459pd2m
   5g4/7q5V8IvhiG4ZKi01KyGMHcQWb0+TKxQsRrgPrSnD+0EzkLp3CyiNf
   q081snigxanoMMq6Kdi1O0pESOmC7OZS0hqtRJJli4UyWNSry3+vU9XUC
   E+v4vAMHA9NcQZ0Vf6QQglNqmUgG6D+mjSQW6GHmyPbPfTzdKQOYgwz6N
   UaUEeecjrE68GW+NJA6zB8KUbvISqb1OFcELstPEz4vIUkQCtbGRKQJ5G
   bdTUR7oOfQjI28YFMC0yKnri/onX4TLMo3oFHbi/k1Pp8OTJy9GTK7l9E
   Q==;
X-CSE-ConnectionGUID: wHzzb1RUThGlym/85vW4iw==
X-CSE-MsgGUID: KRvGZcERRTGkm8nKLFW91Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63443061"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63443061"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:35 -0700
X-CSE-ConnectionGUID: 2QBOLHnfT/mX/vJklg2N7g==
X-CSE-MsgGUID: EF8+VVCwT8uRW78BjEZmzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="173291151"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2025 09:32:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E6C609F; Mon, 08 Sep 2025 18:32:30 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 11/26] thunderbolt: Add missing documentation in nhi_regs.h ring_desc structure
Date: Mon,  8 Sep 2025 18:32:15 +0200
Message-ID: <20250908163230.2614397-12-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908163230.2614397-1-mika.westerberg@linux.intel.com>
References: <20250908163230.2614397-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Add missing description of fields in ring_desc struct found in
"nhi_regs.h". No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi_regs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/thunderbolt/nhi_regs.h b/drivers/thunderbolt/nhi_regs.h
index 297a3e440648..cf5222bee971 100644
--- a/drivers/thunderbolt/nhi_regs.h
+++ b/drivers/thunderbolt/nhi_regs.h
@@ -21,6 +21,12 @@ enum ring_flags {
 
 /**
  * struct ring_desc - TX/RX ring entry
+ * @phys: DMA mapped address of the frame
+ * @length: Size of the ring
+ * @eof: End of frame protocol defined field
+ * @sof: Start of frame protocol defined field
+ * @flags: Ring descriptor flags
+ * @time: Fill with zero
  *
  * For TX set length/eof/sof.
  * For RX length/eof/sof are set by the NHI.
-- 
2.50.1


