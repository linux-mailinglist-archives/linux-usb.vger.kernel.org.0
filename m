Return-Path: <linux-usb+bounces-27734-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97344B49596
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B18981C20703
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EAB3191A8;
	Mon,  8 Sep 2025 16:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMU8Vn3l"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C306312807
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349161; cv=none; b=HHIon7s5D9HH17qB8IfQTMwbxBIRvPbDXNJ7Y8bYscnHQotnxW8DKHk2tlFgsKXCq91HPU9iRSy6du33EXyqqxOIfg+lFv3cNPgpy37MxImOUDEOp3BLs8caTlU4XEDEck5BjdZ/gvjtRVMxarJVj24KpKtSKV0C8G07KiVvbpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349161; c=relaxed/simple;
	bh=NkK9kifYJS5EJkwNHUkujNYpMKwLEzu9KZrLsOJ1DF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WidWcDfoImOoR7q9ct7TBmG8KFlpoTSruMqCJjij8+2Tklm/Twj87rfC+rAeURMy4lH3FPOevLXvpIpZ08I+9htMlwOB40a38OPQXw6g8XBCuRh6qNfmXREk/e51AFFx2LE3aUR5dcSb1T6XgsBXhAnzQs/YXJVLEH2lCe9cV3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMU8Vn3l; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349160; x=1788885160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NkK9kifYJS5EJkwNHUkujNYpMKwLEzu9KZrLsOJ1DF0=;
  b=BMU8Vn3lKl8+7ngLSEMpn2+by1akdKopHhjr+W5BXdTcdBbf43587P8j
   yLvZ8c4NgFS58wMqMcmdJUsV1CZ0M7LwQNM4neP0lflDatLkCMPrhYS9P
   ToE+BAlalsPa5bRwSc+7iHPSkA+Pb+5eqNNxms/GXesxN7LeT7qLRfqC2
   cx87wX157N12EM01Ss4ShcOPps5JkSxiR/94XP67ilyrD85prpT/Wc8B+
   FFjewMFG2KagBz/YaqiZCpfiG7T8ltocFt2oPArOV5hZ10UbiUb5V7s9f
   CNv4vy4Szcc2zMdXR/duX+7SjcgTF70s/H0eaLpZyQInPLPzIsZRGsVR6
   w==;
X-CSE-ConnectionGUID: QIYfYwm6TC2iWuVeNf6tHQ==
X-CSE-MsgGUID: vw991QYOTSyrvTj5gZs3LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="63252114"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="63252114"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:38 -0700
X-CSE-ConnectionGUID: NNWzrv4gSlqj/AhWyIenyg==
X-CSE-MsgGUID: 86zm/WDpQbC9dyWO2TGeyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="203622645"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 08 Sep 2025 09:32:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E3D069E; Mon, 08 Sep 2025 18:32:30 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 10/26] thunderbolt: Update nhi.c function documentation
Date: Mon,  8 Sep 2025 18:32:14 +0200
Message-ID: <20250908163230.2614397-11-mika.westerberg@linux.intel.com>
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

Make nhi.c function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index f3a2264e012b..cab19d79d927 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -343,8 +343,10 @@ EXPORT_SYMBOL_GPL(__tb_ring_enqueue);
  *
  * This function can be called when @start_poll callback of the @ring
  * has been called. It will read one completed frame from the ring and
- * return it to the caller. Returns %NULL if there is no more completed
- * frames.
+ * return it to the caller.
+ *
+ * Return: Pointer to &struct ring_frame, %NULL if there is no more
+ * completed frames.
  */
 struct ring_frame *tb_ring_poll(struct tb_ring *ring)
 {
@@ -639,6 +641,8 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
  * @hop: HopID (ring) to allocate
  * @size: Number of entries in the ring
  * @flags: Flags for the ring
+ *
+ * Return: Pointer to &struct tb_ring, %NULL otherwise.
  */
 struct tb_ring *tb_ring_alloc_tx(struct tb_nhi *nhi, int hop, int size,
 				 unsigned int flags)
@@ -660,6 +664,8 @@ EXPORT_SYMBOL_GPL(tb_ring_alloc_tx);
  *		interrupt is triggered and masked, instead of callback
  *		in each Rx frame.
  * @poll_data: Optional data passed to @start_poll
+ *
+ * Return: Pointer to &struct tb_ring, %NULL otherwise.
  */
 struct tb_ring *tb_ring_alloc_rx(struct tb_nhi *nhi, int hop, int size,
 				 unsigned int flags, int e2e_tx_hop,
@@ -853,8 +859,9 @@ EXPORT_SYMBOL_GPL(tb_ring_free);
  * @cmd: Command to send
  * @data: Data to be send with the command
  *
- * Sends mailbox command to the firmware running on NHI. Returns %0 in
- * case of success and negative errno in case of failure.
+ * Sends mailbox command to the firmware running on NHI.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data)
 {
@@ -890,6 +897,8 @@ int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data)
  *
  * The function reads current firmware operation mode using NHI mailbox
  * registers and returns it to the caller.
+ *
+ * Return: &enum nhi_fw_mode.
  */
 enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi)
 {
-- 
2.50.1


