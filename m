Return-Path: <linux-usb+bounces-27505-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99202B42786
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 19:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F6B97B3091
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 17:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054A731B11F;
	Wed,  3 Sep 2025 17:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZznCImF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB2631B137
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 17:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756918914; cv=none; b=e+zR+35lTJgvEdtLBSMV9zjuQLDmWiQ5UroLZ85rml+yiX8bmGi7wZH4cBB+MEXPp8Gzb1M8djGrAbrsTBqwc6dKkQY8MUG8m9X/hZlK6J5idvMO5Cfgl4eSUK+gG2yKot4MQba9k3A0lobcqXrV5dNqRD5MepTk8sxqcRw7dCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756918914; c=relaxed/simple;
	bh=R2FhFqRoKr0RI/tRjNk9Syi/Gd3/b9VoU+w0zXBAN0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QhyPTm3n/lOqfrqSCJslX0/hGRopD17hmEEkDPBbgdjlGzumqSklvgZuYIaFNelQsG43RajO0f65T6reYAqKHEv7teU1qIq7LyFNG6FRBO+gG0bmkB/mgZ508nTFcF1h4Hjt8cZCFG0WLe+pAKczJUHleUaiEkFXzXf0/RmksSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZznCImF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756918914; x=1788454914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R2FhFqRoKr0RI/tRjNk9Syi/Gd3/b9VoU+w0zXBAN0k=;
  b=gZznCImFH7sDfFJfCOIB2xpiUN/ELL4PhuvnfII37I+hStxRmlryFmB0
   jJFGWppGC4f48EfA2updyNnXgh3G2vWbiFJ76G9FWDXhNc48ob188XZhc
   bXw5Q3WnnWS8SuGQJgL3jw+0aXnor2h4sBcyb9ZUQF+zUFjxSdLGtpmR2
   nx4EbLwUgMBslrTPBgkcmV/tmncPh9qsfoYYd0eLzQyypJXrZG7wtT7l4
   hZG131fn65oThhpzAeoL7imdsjikpqaz3XEt90VfGJay9wzJcZ5SXdN6u
   v3FtOVEGgN32LsmbWf0ocmd0OOjeRjXNwpKIjvuwZv41pdHHn183PArNv
   Q==;
X-CSE-ConnectionGUID: Hx5vK56DQm2TTboesUyr1g==
X-CSE-MsgGUID: +ITbJ8wFQkWU72uxAi/BaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76687955"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="76687955"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 10:01:52 -0700
X-CSE-ConnectionGUID: 6L0rMyg9TXS8MiEuDd33dA==
X-CSE-MsgGUID: amznMWCFQemOEtUPGbIY5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="176007540"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 03 Sep 2025 10:01:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id A6B4B94; Wed, 03 Sep 2025 19:01:49 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 4/7] usb: xhci: improve Endpoint Context register debugging
Date: Wed,  3 Sep 2025 19:01:24 +0200
Message-ID: <20250903170127.2190730-5-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve the debugging output for Endpoint Context registers in the xHCI
driver. The Endpoint Context registers consist of the following fields:
 bit 0 - Dequeue Cycle State.
 bits 3:1 - RsvdZ.
 bits 63:4 - TR Dequeue Pointer, is 16-byte aligned.

Instead of printing the entire 64-bit register as a single block, each
field is now printed separately. This approach enhances the readability.

xHCI specification, section 6.2.3.

Why not use 'dma_addr_t' for the address?
The 'dma_addr_t' type can vary between 32 and 64 bits depending on the
system architecture or xHCI driver flags, whereas the 64-bit address field
size remains constant. Since hardware cannot be fully trusted, it's better
to print the entire 64-bit address to detect any non-zero values in the
upper 32 bits. This approach ensures that potential issues are easily
detected.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 59ff84ba2d4a..2662356d048e 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2580,9 +2580,9 @@ static inline const char *xhci_decode_ep_context(char *str, u32 info,
 	ret += sprintf(str + ret, "interval %d us max ESIT payload %d CErr %d ",
 			(1 << interval) * 125, esit, cerr);
 
-	ret += sprintf(str + ret, "Type %s %sburst %d maxp %d deq %016llx ",
+	ret += sprintf(str + ret, "Type %s %sburst %d maxp %d deq %016llx cycle %llu",
 			xhci_ep_type_string(ep_type), hid ? "HID" : "",
-			burst, maxp, deq);
+			burst, maxp, deq & TR_DEQ_PTR_MASK, deq & EP_CTX_CYCLE_MASK);
 
 	ret += sprintf(str + ret, "avg trb len %d", avg);
 
-- 
2.50.1


