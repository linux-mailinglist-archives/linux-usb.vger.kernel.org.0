Return-Path: <linux-usb+bounces-27728-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B27E5B49590
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD6131C209CE
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80FF31770F;
	Mon,  8 Sep 2025 16:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2ORILSw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B170030FC1E
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349159; cv=none; b=H0NKjSqI7Ce1lTfJgYs0zO0LWci5Pb+JhWV0prS7e8ejDnpNoQRrYf6EFYYfsYCQwZdAZuMO7bEH3fkShNqP+/YK414F1elJlDl+C4FV3H5mdRkzjy5JS9vqLuHIDKWB09Zu/JzZ23AYMv2tDrl0tcYGmGYu7EnFt67qwWbKV7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349159; c=relaxed/simple;
	bh=WZBVgCN3blb2G8PMjjegoM/EFNItIRbl30HzqXUn6DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qv6hZtw7YgDhMh844xXMIPGZghGY59hoeS81Dy7PbolrUDozrq3yV4fvUivpWaf0ZsR7FmoTslT3QIZT1EfmybOHXpAzx1cQdbweO2HR8zQH2DYXY/Bdq6GAFgocOvzTDfnLc66tJDFc51cjYS11MahVjcJkhiUWEtOV60sT8PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i2ORILSw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349158; x=1788885158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WZBVgCN3blb2G8PMjjegoM/EFNItIRbl30HzqXUn6DI=;
  b=i2ORILSwl6y12HbJ5GCFsTV1Qf7S/EeLjFMPtFBm4DbL3xXXRs+eZGjf
   WsBWL6GiG25y90xOyEFtVQ42QpNQEY/MfYkw8MQ8R3IA85yBCQCJ07JGO
   7RFcT+JePemvyt/rISiM09VSGyP4Hb2RhNluOst6H13FufxjhzHskITq9
   efKGRIovySaS53kS9ag3FHjXshlOItjMFMic+V52Jadjmd7ciJNko9sV9
   5B+WqqZNE7BmgodEwexkPD13d+Kh13ofY2+B02DvaOZ2dz05PPOzG8QQ2
   6Zl4Xhk4EaC8Uf6I+82AnCkpXkoqO8wauf4/tqH12c5+J+xmAwjD5kPnR
   g==;
X-CSE-ConnectionGUID: f1VHUf2dQbGkEyCNjGIgww==
X-CSE-MsgGUID: VjollZ6HTPelLb1X6NduUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="63252102"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="63252102"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:37 -0700
X-CSE-ConnectionGUID: 6qRgsJ9UQqCGaOELgmFgmA==
X-CSE-MsgGUID: h+O6PZUgQ0qzqGWJUe85dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="203622641"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 08 Sep 2025 09:32:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id D719A9A; Mon, 08 Sep 2025 18:32:30 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 06/26] thunderbolt: Update dma_port.c function documentation
Date: Mon,  8 Sep 2025 18:32:10 +0200
Message-ID: <20250908163230.2614397-7-mika.westerberg@linux.intel.com>
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

Make dma_port.c function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/dma_port.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/dma_port.c b/drivers/thunderbolt/dma_port.c
index 9f20c7bbf0ce..dc8ea188a114 100644
--- a/drivers/thunderbolt/dma_port.c
+++ b/drivers/thunderbolt/dma_port.c
@@ -197,6 +197,8 @@ static int dma_find_port(struct tb_switch *sw)
  *
  * The DMA control port is functional also when the switch is in safe
  * mode.
+ *
+ * Return: &struct tb_dma_port on success, %NULL otherwise.
  */
 struct tb_dma_port *dma_port_alloc(struct tb_switch *sw)
 {
@@ -354,6 +356,8 @@ static int dma_port_flash_write_block(void *data, unsigned int dwaddress,
  * @address: Address relative to the start of active region
  * @buf: Buffer where the data is read
  * @size: Size of the buffer
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int dma_port_flash_read(struct tb_dma_port *dma, unsigned int address,
 			void *buf, size_t size)
@@ -372,6 +376,8 @@ int dma_port_flash_read(struct tb_dma_port *dma, unsigned int address,
  * Writes block of data to the non-active flash region of the switch. If
  * the address is given as %DMA_PORT_CSS_ADDRESS the block is written
  * using CSS command.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int dma_port_flash_write(struct tb_dma_port *dma, unsigned int address,
 			 const void *buf, size_t size)
@@ -393,6 +399,8 @@ int dma_port_flash_write(struct tb_dma_port *dma, unsigned int address,
  * dma_port_flash_update_auth_status() to get status of this command.
  * This is because if the switch in question is root switch the
  * thunderbolt host controller gets reset as well.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int dma_port_flash_update_auth(struct tb_dma_port *dma)
 {
@@ -410,12 +418,13 @@ int dma_port_flash_update_auth(struct tb_dma_port *dma)
  * @status: Status code of the operation
  *
  * The function checks if there is status available from the last update
- * auth command. Returns %0 if there is no status and no further
- * action is required. If there is status, %1 is returned instead and
- * @status holds the failure code.
+ * auth command.
  *
- * Negative return means there was an error reading status from the
- * switch.
+ * Return:
+ * * %0 - If there is no status and no further action is required.
+ * * %1 - If there is some status. @status holds the failure code.
+ * * Negative errno - An error occurred when reading status from the
+ *   switch.
  */
 int dma_port_flash_update_auth_status(struct tb_dma_port *dma, u32 *status)
 {
@@ -446,6 +455,8 @@ int dma_port_flash_update_auth_status(struct tb_dma_port *dma, u32 *status)
  * @dma: DMA control port
  *
  * Triggers power cycle to the switch.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int dma_port_power_cycle(struct tb_dma_port *dma)
 {
-- 
2.50.1


