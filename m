Return-Path: <linux-usb+bounces-37247-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLccBU+vAWrXiAEAu9opvQ
	(envelope-from <linux-usb+bounces-37247-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 12:28:31 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DFB50BE3E
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 12:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E2ADA302F776
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 10:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7633D6CCE;
	Mon, 11 May 2026 10:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRfeSo5k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF593D75D1
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 10:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495276; cv=none; b=CPssXQVDGqpAtTz4fjqri3KUGzubYliuHrISw0indO6U9sF+sbi55ytuKHt3cNQ+q/rJRjsff1ppYn0VSIBjo8CnjTHK+xcJImrs4TIk+xQhq0pmAeEIVdNvmxUsnHrt5eRD5XuoF8sevzeEhr0LxvdAqoZKEuoK/R5QgHXpFiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495276; c=relaxed/simple;
	bh=7rRuZyH/VR4OrOegWl/Wce7AR/G+U8PEwPGI+V20Lwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DwQvuacmQ3KDMseB4FtFxR/pCGNZsm7Ryx9YYZ+KdF0wLJmYP9LdlzW6eiJMSzwMjc4Ii+bxjRJShuQeCvGDoo+MmEzeg8bL+Rkw1Udd3YMyJshagx0YgjrjmfPDRQd9IPxYuNaExIlyrt1ZfTKo9MKVr1zrVO1WFPNbQzHT1sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRfeSo5k; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778495275; x=1810031275;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7rRuZyH/VR4OrOegWl/Wce7AR/G+U8PEwPGI+V20Lwc=;
  b=MRfeSo5kKT6htFfGIElXDZQmNwkRaN2tx27N20CPMslJqwWMeV9rGqeL
   HABFMfYvo8r9Bypd/aBumdhZFtceqDBHdTt6o5+aOFF0KyolNogwNyDAd
   kiTxkcuZbm+xnhtQ3wLnqaisChzp51eJkK+DIjpa2NKysZQI31pNJ+/9g
   jyKEv90wGtjU/adBBL9+7ewRd+zzuk4YmTCG/frg6+SgCU3wYlYMOC0vj
   Ts+xmWYMZYXnRVH4tKp+lfPYgGlHNAh+KObB3kc+xR0wUsKGpjwF9/yMn
   dGcfohWMnTkrVxgDX5csj5J3wIpeMt3TdWacxJOwtq4uqswnTXhdv/pij
   g==;
X-CSE-ConnectionGUID: gxLyLJPUS2qU3/MY1ejPcA==
X-CSE-MsgGUID: yizqy/t9R7+d0bfDU83k5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79099669"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79099669"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 03:27:52 -0700
X-CSE-ConnectionGUID: arPDEG6FQ4e7XwpSrFu4BA==
X-CSE-MsgGUID: WCPNw2gFRs+IuHOsmPHPcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="234752251"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 11 May 2026 03:27:49 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9B72F9E; Mon, 11 May 2026 12:27:44 +0200 (CEST)
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
Subject: [PATCH v2 05/10] thunderbolt / net: Let the service drivers configure interrupt throttling
Date: Mon, 11 May 2026 12:27:39 +0200
Message-ID: <20260511102744.1867485-6-mika.westerberg@linux.intel.com>
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
X-Rspamd-Queue-Id: C4DFB50BE3E
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
	TAGGED_FROM(0.00)[bounces-37247-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Action: no action

Instead of the core driver programming fixed value for throttling let
the service drivers to specify the interval if they need this.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/net/thunderbolt/main.c |  4 +++
 drivers/thunderbolt/dma_test.c |  5 +++
 drivers/thunderbolt/nhi.c      | 58 ++++++++++++++++++----------------
 drivers/thunderbolt/nhi_regs.h |  3 +-
 include/linux/thunderbolt.h    |  5 +++
 5 files changed, 47 insertions(+), 28 deletions(-)

diff --git a/drivers/net/thunderbolt/main.c b/drivers/net/thunderbolt/main.c
index 49673f7e0055..91099b91d4ba 100644
--- a/drivers/net/thunderbolt/main.c
+++ b/drivers/net/thunderbolt/main.c
@@ -34,6 +34,7 @@
 #define TBNET_RING_SIZE		256
 #define TBNET_LOGIN_RETRIES	60
 #define TBNET_LOGOUT_RETRIES	10
+#define TBNET_THROTTLING	128000
 #define TBNET_E2E		BIT(0)
 #define TBNET_MATCH_FRAGS_ID	BIT(1)
 #define TBNET_64K_FRAMES	BIT(2)
@@ -955,6 +956,9 @@ static int tbnet_open(struct net_device *dev)
 	}
 	net->rx_ring.ring = ring;
 
+	tb_ring_throttling(net->tx_ring.ring, TBNET_THROTTLING);
+	tb_ring_throttling(net->rx_ring.ring, TBNET_THROTTLING);
+
 	napi_enable(&net->napi);
 	start_login(net);
 
diff --git a/drivers/thunderbolt/dma_test.c b/drivers/thunderbolt/dma_test.c
index af1e6bc9c7cd..7877319b1b03 100644
--- a/drivers/thunderbolt/dma_test.c
+++ b/drivers/thunderbolt/dma_test.c
@@ -155,6 +155,8 @@ static int dma_test_start_rings(struct dma_test *dt)
 		dt->tx_ring = ring;
 		e2e_tx_hop = ring->hop;
 
+		tb_ring_throttling(ring, 128000);
+
 		ret = tb_xdomain_alloc_out_hopid(xd, -1);
 		if (ret < 0) {
 			dma_test_free_rings(dt);
@@ -162,6 +164,7 @@ static int dma_test_start_rings(struct dma_test *dt)
 		}
 
 		dt->tx_hopid = ret;
+
 	}
 
 	if (dt->packets_to_receive) {
@@ -180,6 +183,8 @@ static int dma_test_start_rings(struct dma_test *dt)
 
 		dt->rx_ring = ring;
 
+		tb_ring_throttling(ring, 128000);
+
 		ret = tb_xdomain_alloc_in_hopid(xd, -1);
 		if (ret < 0) {
 			dma_test_free_rings(dt);
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 1a2051673067..13009246e617 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -93,7 +93,7 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
 	u32 old, new;
 
 	if (ring->irq > 0) {
-		u32 step, shift, ivr, misc;
+		u32 step, shift, ivr, misc, itr;
 		void __iomem *ivr_base;
 		int auto_clear_bit;
 		int index;
@@ -131,6 +131,12 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
 		if (active)
 			ivr |= ring->vector << shift;
 		iowrite32(ivr, ivr_base + step);
+
+		/* Throttling is specified in 256ns increments */
+		itr = DIV_ROUND_UP(ring->interval_nsec, 256);
+		itr &= REG_INT_THROTTLING_RATE_INTERVAL_MASK;
+		iowrite32(itr, ring->nhi->iobase + REG_INT_THROTTLING_RATE +
+			  ring->vector * 4);
 	}
 
 	old = ioread32(ring->nhi->iobase + reg);
@@ -854,6 +860,26 @@ void tb_ring_free(struct tb_ring *ring)
 }
 EXPORT_SYMBOL_GPL(tb_ring_free);
 
+/**
+ * tb_ring_throttling() - Configure throttling for ring interrupt
+ * @ring: Ring to configure
+ * @interval_nsec: Interval counter for moderation (in ns), %0 disables
+ *
+ * Enables or disables ring interrupt throttling. The ring must be
+ * stopped for this to be called. Granularity is 256 ns.
+ *
+ * Return: %0 on success, negative errno otherwise.
+ */
+int tb_ring_throttling(struct tb_ring *ring, unsigned int interval_nsec)
+{
+	guard(spinlock_irqsave)(&ring->lock);
+	if (WARN_ON_ONCE(ring->running))
+		return -EBUSY;
+	ring->interval_nsec = interval_nsec;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tb_ring_throttling);
+
 /**
  * nhi_mailbox_cmd() - Send a command through NHI mailbox
  * @nhi: Pointer to the NHI structure
@@ -1035,22 +1061,6 @@ static int nhi_poweroff_noirq(struct device *dev)
 	return __nhi_suspend_noirq(dev, wakeup);
 }
 
-static void nhi_enable_int_throttling(struct tb_nhi *nhi)
-{
-	/* Throttling is specified in 256ns increments */
-	u32 throttle = DIV_ROUND_UP(128 * NSEC_PER_USEC, 256);
-	unsigned int i;
-
-	/*
-	 * Configure interrupt throttling for all vectors even if we
-	 * only use few.
-	 */
-	for (i = 0; i < MSIX_MAX_VECS; i++) {
-		u32 reg = REG_INT_THROTTLING_RATE + i * 4;
-		iowrite32(throttle, nhi->iobase + reg);
-	}
-}
-
 static int nhi_resume_noirq(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
@@ -1065,13 +1075,10 @@ static int nhi_resume_noirq(struct device *dev)
 	 */
 	if (!pci_device_is_present(pdev)) {
 		nhi->going_away = true;
-	} else {
-		if (nhi->ops && nhi->ops->resume_noirq) {
-			ret = nhi->ops->resume_noirq(nhi);
-			if (ret)
-				return ret;
-		}
-		nhi_enable_int_throttling(tb->nhi);
+	} else if (nhi->ops && nhi->ops->resume_noirq) {
+		ret = nhi->ops->resume_noirq(nhi);
+		if (ret)
+			return ret;
 	}
 
 	return tb_domain_resume_noirq(tb);
@@ -1133,7 +1140,6 @@ static int nhi_runtime_resume(struct device *dev)
 			return ret;
 	}
 
-	nhi_enable_int_throttling(nhi);
 	return tb_domain_runtime_resume(tb);
 }
 
@@ -1271,8 +1277,6 @@ static int nhi_init_msi(struct tb_nhi *nhi)
 	/* In case someone left them on. */
 	nhi_disable_interrupts(nhi);
 
-	nhi_enable_int_throttling(nhi);
-
 	ida_init(&nhi->msix_ida);
 
 	/*
diff --git a/drivers/thunderbolt/nhi_regs.h b/drivers/thunderbolt/nhi_regs.h
index cf5222bee971..d6a197fabc74 100644
--- a/drivers/thunderbolt/nhi_regs.h
+++ b/drivers/thunderbolt/nhi_regs.h
@@ -101,7 +101,8 @@ struct ring_desc {
 
 #define REG_RING_INTERRUPT_MASK_CLEAR_BASE	0x38208
 
-#define REG_INT_THROTTLING_RATE	0x38c00
+#define REG_INT_THROTTLING_RATE			0x38c00
+#define REG_INT_THROTTLING_RATE_INTERVAL_MASK	GENMASK(15, 0)
 
 /* Interrupt Vector Allocation */
 #define REG_INT_VEC_ALLOC_BASE	0x38c40
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 1d1bd458b5af..1160e0bf5c5b 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -554,6 +554,8 @@ struct tb_nhi {
  * @start_poll: Called when ring interrupt is triggered to start
  *		polling. Passing %NULL keeps the ring in interrupt mode.
  * @poll_data: Data passed to @start_poll
+ * @interval_nsec: Interval counter if interrupt throttling is to be
+ *		   used with this ring (in ns)
  */
 struct tb_ring {
 	spinlock_t lock;
@@ -577,6 +579,7 @@ struct tb_ring {
 	u16 eof_mask;
 	void (*start_poll)(void *data);
 	void *poll_data;
+	unsigned int interval_nsec;
 };
 
 /* Leave ring interrupt enabled on suspend */
@@ -697,6 +700,8 @@ static inline int tb_ring_tx(struct tb_ring *ring, struct ring_frame *frame)
 struct ring_frame *tb_ring_poll(struct tb_ring *ring);
 void tb_ring_poll_complete(struct tb_ring *ring);
 
+int tb_ring_throttling(struct tb_ring *ring, unsigned int interval_nsec);
+
 /**
  * tb_ring_dma_device() - Return device used for DMA mapping
  * @ring: Ring whose DMA device is retrieved
-- 
2.50.1


