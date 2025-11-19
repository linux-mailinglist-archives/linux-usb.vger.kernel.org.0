Return-Path: <linux-usb+bounces-30721-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A49BC6F668
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AAAD34FE8B5
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D247836A01B;
	Wed, 19 Nov 2025 14:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="liSIn/fB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4653A36C0A6
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562309; cv=none; b=qvvYtYvQSBG5jioeSxIzv2q3RSYZZUBEmK3Eg5JTuXUG5sqmCQ/wqTz2qLupk74LgX9nwNVVy4hQb5eRuJs3e4DYOjKeRha7zsP6ZntW9XVGcx8bmiDN+E0+QazJL6r9eK6SFY5Ygylpxx4513Aj81j423Sz5jqn+AxC5uekTu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562309; c=relaxed/simple;
	bh=gcRynVSCXR1FJ7lBal8d/svqUkZCXdC3+vI9BPnK9yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BeXU/LfOAhs75Zov7/yE4ipxI36gD6/GE5TbRx55get580gpx0QkaGKmNmN0Ahz7kzPx0D8R9OSU7UgXc6qKIutvL5czgAt073T7JhyUUhfjGWJYgHupxP1WuHIrd9gqnLsjNJ29I6HIe8JqHrie+3ky/cxJ+4orCl62Hzbq9hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=liSIn/fB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562308; x=1795098308;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gcRynVSCXR1FJ7lBal8d/svqUkZCXdC3+vI9BPnK9yg=;
  b=liSIn/fBxMcjDaRCv2PGlBeQ58b1QXIqPJ7v6RMfQzyWxuqj1nyWeT3h
   r5MHtsURN6Lq6JbV98RPtbd2H8z5GooHt8RWqoxYPPIHQbhuJKIhxuIdm
   nVssZ2YtBT/n6z62oVCkgmMzfWac/ORFu4yW3J8n5vhzUKvFUabBbp9/I
   7r11uz0iDozmW7qJG4AXoWBm6Rj2hKWE5AXn8ZfIDzTWRRV5wVjhuMXaG
   Rnkwo9ELZ4paed/oiDczgQjm8g59wR2yObzvyw/ehHCQuTmhPhgZXTGSg
   hJ+urQWav4Fe74lzDJXbU1krk6gydMLJY56+41vMx/osbtJmkbT2dpnm8
   w==;
X-CSE-ConnectionGUID: ZEzmmCzJRtq9+2FscJirkw==
X-CSE-MsgGUID: r5eHNTqeQnGeEzpY7WET7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645594"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645594"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:25:06 -0800
X-CSE-ConnectionGUID: k3GX3/msR3a0ywdxFS6zzA==
X-CSE-MsgGUID: LDOblWZWQlGk4+SJZXehhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221992197"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:25:05 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 20/23] usb: xhci: simplify Max Scratchpad buffer macros
Date: Wed, 19 Nov 2025 16:24:14 +0200
Message-ID: <20251119142417.2820519-21-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
References: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Max Scratchpad Buffers consist of two bit-fields:
bits 25:21 - Max Scratchpad Buffers High, 5 Most significant bits
bits 27:31 - Max Scratchpad Buffers Low, 5 Least significant bits
Combined they create the Max Scratchpad Buffers value.

Add two new macros, 'HCS_MAX_SP_HI' and 'HCS_MAX_SP_LO', to separately
extract the high and low parts of the Max Scratchpad Buffers. These are
then combined using 'HCS_MAX_SCRATCHPAD' macro. This change simplifies
the code and makes it similar to other split value register macros in the
xhci driver.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-caps.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
index e772d5f30d36..af47aebc5ba8 100644
--- a/drivers/usb/host/xhci-caps.h
+++ b/drivers/usb/host/xhci-caps.h
@@ -37,9 +37,11 @@
 #define HCS_ERST_MAX(p)		(((p) >> 4) & 0xf)
 /* bits 20:8 - Rsvd */
 /* bits 25:21 - Max Scratchpad Buffers (Hi), 5 Most significant bits */
+#define HCS_MAX_SP_HI(p)	(((p) >> 21) & 0x1f)
 /* bit 26 - Scratchpad restore, for save/restore HW state */
 /* bits 31:27 - Max Scratchpad Buffers (Lo), 5 Least significant bits */
-#define HCS_MAX_SCRATCHPAD(p)   ((((p) >> 16) & 0x3e0) | (((p) >> 27) & 0x1f))
+#define HCS_MAX_SP_LO(p)	(((p) >> 27) & 0x1f)
+#define HCS_MAX_SCRATCHPAD(p)	(HCS_MAX_SP_HI(p) << 5 | HCS_MAX_SP_LO(p))
 
 /* HCSPARAMS3 - hcs_params3 - bitmasks */
 /* bits 7:0 - U1 Device Exit Latency, Max U1 to U0 latency for the roothub ports */
-- 
2.43.0


