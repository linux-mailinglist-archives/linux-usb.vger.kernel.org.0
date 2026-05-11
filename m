Return-Path: <linux-usb+bounces-37243-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INgjID2vAWrXiAEAu9opvQ
	(envelope-from <linux-usb+bounces-37243-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 12:28:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AA750BE1B
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 12:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CBAAF301DC17
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 10:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4AE3D7D87;
	Mon, 11 May 2026 10:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYD0FwUz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12E43D75B5
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 10:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495274; cv=none; b=MALQrcehkP+qOYusizmP83Mzn+M5+ao6cv8SSyIkn8c+EkE2X1hzr6cbqcHtvA4ZMK0Uevqnl76vhjkm08LVIxxxjOjRjXe2TgenD5gFu8HKXpRHqz+ZsUM+ea9POdr3SAPnLyIe124jzOhdVzHLM28YyNeGFAhu5HDLZiRcMPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495274; c=relaxed/simple;
	bh=AlIGB9lf9eF95T/O7YxOQaHcetghLMJ9AjutOyvepFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k7iJsh8l7uf5GDSEg34x1G8FWNgSI91dQhSFGhZvY0jSTSLo67TpQ4OZ6TOJDkKEzDhKgguo2PLarUd7UDdi5REkb8lwN9jkHQhCr9K7aYRZ78UZkqY2rBLdFTIPLKwrvGdwNPce8orRiqRxf32IM1myJ4KZC/f4R7X5mQk33i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYD0FwUz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778495272; x=1810031272;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AlIGB9lf9eF95T/O7YxOQaHcetghLMJ9AjutOyvepFM=;
  b=PYD0FwUzGvg2zGJWnlnK1o2h298z8cQZe/Z+AkLXNjnJxKRAP7wzWTPS
   tKDgHo9w8OcMLo1nOj/7r5gUJkFdwKHD9yNCxg/PutDLyFthhRu6IxzzQ
   2NADrhq09Lv/a+h4yeu4matPzKdXTEP4Eeby3RQdAJm1joFWYWaCFyrYe
   tWOcOWEeSPBRTKKKBK8Z0Zf3d9ANnqlp93c0QNvTlbb8tdl/35DhIyvTG
   T4IKyK8loX/E+EQSbqg3EXWMciIUVoGfC+Uw020+0HWmt3LWULg6CavDC
   KwZreDmjMPeGP1UGo53Q7+1K0Nb4PEsHVzmbT6ZU/yIhz24Q8OBK8VHHP
   g==;
X-CSE-ConnectionGUID: yrslJMu7S1ySF87BjUfqOg==
X-CSE-MsgGUID: 0SHnzc1PT8G1JFHhVAipWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79479055"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79479055"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 03:27:48 -0700
X-CSE-ConnectionGUID: P3eEPnIVRTKC39AuPxAHdA==
X-CSE-MsgGUID: utAxSXFMTDmRRMcBp9j80A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="234358523"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 11 May 2026 03:27:45 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 97E6B9D; Mon, 11 May 2026 12:27:44 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 04/10] thunderbolt / net: Move ring_frame_size() to thunderbolt.h
Date: Mon, 11 May 2026 12:27:38 +0200
Message-ID: <20260511102744.1867485-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260511102744.1867485-1-mika.westerberg@linux.intel.com>
References: <20260511102744.1867485-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 36AA750BE1B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com,lunn.ch,lwn.net,linuxfoundation.org,davemloft.net,google.com,kernel.org,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37243-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Action: no action

This function can be used outside of thunderbolt networking driver so
move it to the common header.

No functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/net/thunderbolt/main.c | 16 ++++++----------
 include/linux/thunderbolt.h    | 10 +++++++++-
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/net/thunderbolt/main.c b/drivers/net/thunderbolt/main.c
index d8fcf18fc55c..49673f7e0055 100644
--- a/drivers/net/thunderbolt/main.c
+++ b/drivers/net/thunderbolt/main.c
@@ -38,7 +38,7 @@
 #define TBNET_MATCH_FRAGS_ID	BIT(1)
 #define TBNET_64K_FRAMES	BIT(2)
 #define TBNET_MAX_MTU		SZ_64K
-#define TBNET_FRAME_SIZE	SZ_4K
+#define TBNET_FRAME_SIZE	TB_MAX_FRAME_SIZE
 #define TBNET_MAX_PAYLOAD_SIZE	\
 	(TBNET_FRAME_SIZE - sizeof(struct thunderbolt_ip_frame_header))
 /* Rx packets need to hold space for skb_shared_info */
@@ -327,11 +327,6 @@ static void stop_login(struct tbnet *net)
 	netdev_dbg(net->dev, "login stopped\n");
 }
 
-static inline unsigned int tbnet_frame_size(const struct tbnet_frame *tf)
-{
-	return tf->frame.size ? : TBNET_FRAME_SIZE;
-}
-
 static void tbnet_free_buffers(struct tbnet_ring *ring)
 {
 	unsigned int i;
@@ -561,7 +556,7 @@ static struct tbnet_frame *tbnet_get_tx_buffer(struct tbnet *net)
 	tf->frame.size = 0;
 
 	dma_sync_single_for_cpu(dma_dev, tf->frame.buffer_phy,
-				tbnet_frame_size(tf), DMA_TO_DEVICE);
+				tb_ring_frame_size(&tf->frame), DMA_TO_DEVICE);
 
 	return tf;
 }
@@ -743,7 +738,7 @@ static bool tbnet_check_frame(struct tbnet *net, const struct tbnet_frame *tf,
 	}
 
 	/* Should be greater than just header i.e. contains data */
-	size = tbnet_frame_size(tf);
+	size = tb_ring_frame_size(&tf->frame);
 	if (size <= sizeof(*hdr)) {
 		net->stats.rx_length_errors++;
 		return false;
@@ -1010,7 +1005,8 @@ static bool tbnet_xmit_csum_and_map(struct tbnet *net, struct sk_buff *skb,
 						hdr->frame_index, hdr->frame_count);
 			dma_sync_single_for_device(dma_dev,
 				frames[i]->frame.buffer_phy,
-				tbnet_frame_size(frames[i]), DMA_TO_DEVICE);
+				tb_ring_frame_size(&frames[i]->frame),
+						   DMA_TO_DEVICE);
 		}
 
 		return true;
@@ -1084,7 +1080,7 @@ static bool tbnet_xmit_csum_and_map(struct tbnet *net, struct sk_buff *skb,
 	 */
 	for (i = 0; i < frame_count; i++) {
 		dma_sync_single_for_device(dma_dev, frames[i]->frame.buffer_phy,
-			tbnet_frame_size(frames[i]), DMA_TO_DEVICE);
+			tb_ring_frame_size(&frames[i]->frame), DMA_TO_DEVICE);
 	}
 
 	return true;
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index f60e3a1aecae..1d1bd458b5af 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -628,7 +628,15 @@ struct ring_frame {
 };
 
 /* Minimum size for ring_rx */
-#define TB_FRAME_SIZE		0x100
+#define TB_FRAME_SIZE		256
+#define TB_MAX_FRAME_SIZE	4096
+
+static inline size_t tb_ring_frame_size(const struct ring_frame *frame)
+{
+	if (frame->size)
+		return frame->size;
+	return TB_MAX_FRAME_SIZE;
+}
 
 struct tb_ring *tb_ring_alloc_tx(struct tb_nhi *nhi, int hop, int size,
 				 unsigned int flags);
-- 
2.50.1


