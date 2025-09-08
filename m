Return-Path: <linux-usb+bounces-27745-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D00CB495A3
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3C2F447736
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF55831A078;
	Mon,  8 Sep 2025 16:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6I6xsck"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0941319851
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349165; cv=none; b=bnbeKTB4HHFxYHREYLi3pr0ci+MlkO2kwQyMsMqQNjoDCy40gNxjFIIVh8/SYlncglCgxJ2l1c9ZpdmV0K29E5TkWINosn+oHTwjrgadvpN2hlyNc0WRkKVog8zPgXm8Ku8PD1EgTw00PprFoFeNAEIdajWsOQTIDnq9hapC0Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349165; c=relaxed/simple;
	bh=/OQyos260+5cIhNtF3nkR4BVkXKiPyYkSP00Tqn0Qr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHTJflUYWueGaKAaZbm6uvaKtyg+fNbQV/z1AufjYt/6I54tl6fokL8oT35jRhaXmsAhJDEsx4gO4Pjcft/oBebZJlAauBY+74WJmOiWMLoCi7lwBhSv2IN3JgP3zngd+xOSbZr2lTC6gesb9torjf9d3aOu6SbiggicjCkqeF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6I6xsck; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349162; x=1788885162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/OQyos260+5cIhNtF3nkR4BVkXKiPyYkSP00Tqn0Qr8=;
  b=i6I6xsckKmb6boPlIjVcwPyNGbk7OFKWRar0algrYPFJ6eURqfxpbAqd
   h168xDIe+ne403dVcdyZojeiRQh11bkOHQMkNkLrMDYuxw7QTxYSbHHGT
   d1YsfV1D/QMnHiQ7Mms3GjKmmzb7nPl7wFgCEDvfx7tdTbeGzRZL6/yN9
   WxtCH7U0oO6ZuUrqU75yPuFfpESKugJ4U01L3hrQpQlcAPTCGH0MYXNYn
   KzOx3Hh6lHwbcjvYPphwmsD0kx3qQwI4QMhUnqUAIwtvibmq5KzUDq4a3
   GueJyQ/qlTJbzlX9R/XK4sEuFqGD6ZI1h2VzCpUWIZEUj6lXLAIkdwSWb
   w==;
X-CSE-ConnectionGUID: PxLqyj+SSH6Y1vZdZmVFkw==
X-CSE-MsgGUID: Joi7MFXeSVChWH+gGoSRGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63443080"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63443080"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:37 -0700
X-CSE-ConnectionGUID: im+z/qt9SrmK86/hlQ7ZhQ==
X-CSE-MsgGUID: ekrGAX18SieI+MX2Xyl4Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="173291162"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2025 09:32:36 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1C0C2AC; Mon, 08 Sep 2025 18:32:31 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 24/26] thunderbolt: Update usb4_port.c function documentation
Date: Mon,  8 Sep 2025 18:32:28 +0200
Message-ID: <20250908163230.2614397-25-mika.westerberg@linux.intel.com>
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

Make usb4_port.c function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/usb4_port.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/usb4_port.c b/drivers/thunderbolt/usb4_port.c
index 852a45fcd19d..b5e06237261b 100644
--- a/drivers/thunderbolt/usb4_port.c
+++ b/drivers/thunderbolt/usb4_port.c
@@ -296,8 +296,9 @@ const struct device_type usb4_port_device_type = {
  * usb4_port_device_add() - Add USB4 port device
  * @port: Lane 0 adapter port to add the USB4 port
  *
- * Creates and registers a USB4 port device for @port. Returns the new
- * USB4 port device pointer or ERR_PTR() in case of error.
+ * Creates and registers a USB4 port device for @port.
+ *
+ * Return: Pointer to &struct usb4_port or ERR_PTR() in case of an error.
  */
 struct usb4_port *usb4_port_device_add(struct tb_port *port)
 {
@@ -356,6 +357,8 @@ void usb4_port_device_remove(struct usb4_port *usb4)
  * @usb4: USB4 port device
  *
  * Used to resume USB4 port device after sleep state.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_device_resume(struct usb4_port *usb4)
 {
-- 
2.50.1


