Return-Path: <linux-usb+bounces-30480-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9C9C57872
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 14:04:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2105D3A753C
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 12:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867993502B1;
	Thu, 13 Nov 2025 12:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IWObtT+S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352DB34E772
	for <linux-usb@vger.kernel.org>; Thu, 13 Nov 2025 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763038724; cv=none; b=vAJtw5C/1hh7YPP3k6mJ0jqZZDztXnnpZ1ZYoMCLpJRRW5IJ6Z1mHvQAgUurJjcipN7Kd57xqpmGHpxLsYjoLWBBpkGuPFv6ISvqEYRhQ/n9dqzRU8Dz1X8uTbKtlX0SDAvB45YtSxZ5M/w4Mb+rNg8oXQfXPURx0BF4RuJcTuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763038724; c=relaxed/simple;
	bh=WmkBs79CxxXT9W+EVMvmTH6oIOEnBew+A4AaGiOiruQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JGtrB/PmSbFxgGh4U0vE8uUBm7FK1lnnJh9SNvawsRxtLUKsTSD2b7fx2ne4VHYXe5gG5TO6stQNfXRx456RfaPzPzNZnFlOly9SOL/fZ1ZaiPgX8gumRbDcrBzgCSD7kT1sGUWn7rXVJ6Vs0eEFT4SMcvOlE/sn/1e8fBRUh9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IWObtT+S; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763038722; x=1794574722;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WmkBs79CxxXT9W+EVMvmTH6oIOEnBew+A4AaGiOiruQ=;
  b=IWObtT+SYL2o88NQTqogrnt4DIoWAd8ha22o3Ve6nN9N4Xk+01EiR2gl
   AaC/oP/PgxeuJARs9DuqQUQ5conkfrMYWpHmSnI3yUriFuU+dNlW4q4Xe
   2CtIap/642jKd48n4QiMnQ3drkODBRVh1Apu7bz1r32Vi+nVt8ozQgxwg
   VV4tM4cdpWsGA1n328iyvvM+kl5YR6DDJfxffW+CEFb8zB0ET/7kaRjnv
   KWXg/0zMQ8M/rciEy0bZIBAvX3BdaSmqO/XklfEnCD9tAurPKb5mJIxy0
   zmoDGQcIfvVhp8GSNIKiGFlirTU+hhuAllsSXivzVNc0V+C1YQCMrCb7v
   Q==;
X-CSE-ConnectionGUID: /EYy7KLhSd2VpRfhWzwjaA==
X-CSE-MsgGUID: 8DmRiYe1RmW3i6u/mS4gqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65150382"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65150382"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 04:58:42 -0800
X-CSE-ConnectionGUID: wDXdMV9zST+4mBFMSfZp2w==
X-CSE-MsgGUID: RtvRl5z+T9K/the+vIOOwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189673761"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2025 04:58:41 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 06B7A97; Thu, 13 Nov 2025 13:58:40 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 01/13] usb: xhci: remove deprecated TODO comment
Date: Thu, 13 Nov 2025 13:56:28 +0100
Message-ID: <20251113125640.2875608-2-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113125640.2875608-1-niklas.neronin@linux.intel.com>
References: <20251113125640.2875608-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Device Context Base Address Array (DCBAA) contains pointers to device
contexts. These fields are 64-bit registers, capable of holding 64-bit
addresses.

When struct 'xhci_device_context_array' was introduced in commit [1],
the entries were represented as pairs of 'u32', requiring a custom helper
function to set 64-bit addresses. This was later made redundant by
commit [2], which changed the representation to a single 'u64', allowing
direct assignment.

The associated TODO comment referencing the old 32-bit representation is
no longer relevant and is removed.

Link: https://git.kernel.org/torvalds/c/a74588f94655 [1]
Link: https://git.kernel.org/torvalds/c/8e595a5d30a5 [2]
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 58a51f09cceb..8792692ba236 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -800,7 +800,6 @@ struct xhci_device_context_array {
 	/* private xHCD pointers */
 	dma_addr_t	dma;
 };
-/* TODO: write function to set the 64-bit device DMA address */
 /*
  * TODO: change this to be dynamically sized at HC mem init time since the HC
  * might not be able to handle the maximum number of devices possible.
-- 
2.50.1


