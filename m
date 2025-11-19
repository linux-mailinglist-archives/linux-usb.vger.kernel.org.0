Return-Path: <linux-usb+bounces-30713-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E969C6F647
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B68EA500BC8
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EEB836999A;
	Wed, 19 Nov 2025 14:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1o/cTwP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BAA36996C
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 14:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562296; cv=none; b=cDxJ4apJOHV7b306Jp1dayJLjKsW/9yB6QidVuuZc+fxdqi5bQ37QzbUsnd+0fVzHVSc2IrHv6PgN2iE3mq4YNaQwQyPtgPyOkJbbWjwKULj3pIwq4wvTJw1jgCeZpqD9HUXnqqN3QKKucHqYAPSvPtQyLVmEJ3adCrZy6rmytk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562296; c=relaxed/simple;
	bh=rFkm6Jnr62eIHuhUlh3K/cOq0PvCl4/ybhv20usu0mM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jUwccr3q2jSk2PGl2ZOK5XP3wGH8vsUoqcPCkKlsAB1TISnhgaz+Broci6XttFSzeKGlET6TryRQ/xx3MCqy0vsHQDPDuDqS8s4z6pO8vPx5aNQsd93er37rQauKDaQK8ODuZQZwKEn+yuX/e8LL+9bD2yjBvBHteKKGeRg0qCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1o/cTwP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763562295; x=1795098295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rFkm6Jnr62eIHuhUlh3K/cOq0PvCl4/ybhv20usu0mM=;
  b=d1o/cTwPWf8tEU2nMmT82M++QDp35bkRnzNSwxRARVtcpm8wLW7CPGJ/
   q/EO6QuuhDGMi/veV3dyu0rMq5zsbS8N0Vc0cvVLXVtTcrRsCCCAJUOAP
   mjXthKlgCMxwnEBQPdZgAUtsQhDF9hGY5BejDP5uCxfx8qQOcwnTu3eIW
   pFPl5g+meH57UayROZiudaMbbIO7ogEwdpKOIfgfJxVAkgbv0Z8MecG4W
   q4t2Rejr6eaCpONF48lx9j1rRdD1j31pvH0zkNYStUXGgjcMVrJITn1Fi
   9GrdBxjUUqX18qSJsJ9gAif1MZUuHbu0Bi/XOgMX2RrGPdrMnT+paNKup
   Q==;
X-CSE-ConnectionGUID: 8IsFHJs1QcKTYcyRXCJw+w==
X-CSE-MsgGUID: DmkPCtqSR7eun4MGMWNXIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65645550"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65645550"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:54 -0800
X-CSE-ConnectionGUID: Hqgv6ntZRymFSGvhkHhqiA==
X-CSE-MsgGUID: msvWpM+BTf+sfH60gOkfmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221992081"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 06:24:53 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 12/23] usb: xhci: remove deprecated TODO comment
Date: Wed, 19 Nov 2025 16:24:06 +0200
Message-ID: <20251119142417.2820519-13-mathias.nyman@linux.intel.com>
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
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index adabe26b413b..3d644d16d9fb 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -791,7 +791,6 @@ struct xhci_device_context_array {
 	/* private xHCD pointers */
 	dma_addr_t	dma;
 };
-/* TODO: write function to set the 64-bit device DMA address */
 /*
  * TODO: change this to be dynamically sized at HC mem init time since the HC
  * might not be able to handle the maximum number of devices possible.
-- 
2.43.0


