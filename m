Return-Path: <linux-usb+bounces-30148-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08200C3AC7C
	for <lists+linux-usb@lfdr.de>; Thu, 06 Nov 2025 13:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ED321AA1CA4
	for <lists+linux-usb@lfdr.de>; Thu,  6 Nov 2025 12:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0826F30E0C8;
	Thu,  6 Nov 2025 11:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFzC56XO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3297130F925
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 11:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762430371; cv=none; b=HJ9cvKKDqhiN4GFR8z8AmajriSEM786xjRzed8XLpBOtEc5YRdll1Pm2RbppgInn3djKKvCJNlGjQIw0Zc3uNR2rT0jUWowXAIvEXrpRkkIDNuFHhHxxhauqxsTOXzk9S/qoFVC2+sJFOKXNE8QXwBC9/42oOgQbnEJAPYTfm2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762430371; c=relaxed/simple;
	bh=yoUEfAkJmJufJ+8/8++xe7EaGtgmUDtpmnIcr9t/BgU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CbJ9HUJmb+lhN6mE7BiWWeyyy1mM4l0BmVI+5WJ3RBZZbRWEQ6an3jQe+0cr2g6FEfuF1E/e2THnwbdcdWhzqCm2uIo6UGAd6xUEUIFRV/97Amw1XwTvM+E+FTEpt6ot+0Bxivo4aI7pCHKhDqujswQJz22bY8DA76OmiZD0FrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFzC56XO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762430370; x=1793966370;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yoUEfAkJmJufJ+8/8++xe7EaGtgmUDtpmnIcr9t/BgU=;
  b=QFzC56XOreIZHrte6gjVnGxdBHg8HdUCeuxFa5ccyiNpt7/XnUtL8APJ
   d5J4u1VRs2e+9MMz59gx3Denzfx5Y4oudZ3YP6QZHV003OseaOjPBs4T2
   VFgvYi7UYV1UDATSDl+5zNQObKxTnT97KRdu6JvVMV2nBpS25Hd/3XkR5
   Pi0q8+ek7PhaYWnV4t2oNrxABCTsG9AuoengqOAa28evN0JQv5qeMT0Cg
   mhVI0b+2FAqZA79lTqSPW006dEtX2hQWJU6J2iHRNq4m209V3TAJ2lOZS
   ylSSHyo6IXWqA8IoM32yaxjNjlOPoJx/2axBlzbAnhE2QhAiyBbkWBNAM
   g==;
X-CSE-ConnectionGUID: H71UykiHRBeJJbpkQaq2iw==
X-CSE-MsgGUID: BKgUIE9fTLOUIlJa2b9LQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75679067"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="75679067"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 03:59:29 -0800
X-CSE-ConnectionGUID: 1QH/9LlcRVqshTVxH89G8Q==
X-CSE-MsgGUID: o11A0BpeS9GOTfOj5GrU4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="192095758"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 06 Nov 2025 03:59:28 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc3: pci: add support for the Intel Nova Lake -S
Date: Thu,  6 Nov 2025 12:59:26 +0100
Message-ID: <20251106115926.2317877-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds the necessary PCI ID for Intel Nova Lake -S
devices.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 39c72cb52ce7..c2bab6d4d507 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -53,6 +53,7 @@
 #define PCI_DEVICE_ID_INTEL_MTLP		0x7ec1
 #define PCI_DEVICE_ID_INTEL_MTLS		0x7f6f
 #define PCI_DEVICE_ID_INTEL_MTL			0x7e7e
+#define PCI_DEVICE_ID_INTEL_NVLS_PCH		0x6e6f
 #define PCI_DEVICE_ID_INTEL_ARLH_PCH		0x777e
 #define PCI_DEVICE_ID_INTEL_TGL			0x9a15
 #define PCI_DEVICE_ID_INTEL_PTLH		0xe332
@@ -443,6 +444,7 @@ static const struct pci_device_id dwc3_pci_id_table[] = {
 	{ PCI_DEVICE_DATA(INTEL, MTLM, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, MTLP, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, MTL, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, NVLS_PCH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, MTLS, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, ARLH_PCH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, TGL, &dwc3_pci_intel_swnode) },
-- 
2.50.1


