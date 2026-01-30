Return-Path: <linux-usb+bounces-32931-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDG4A3FcfGkYMAIAu9opvQ
	(envelope-from <linux-usb+bounces-32931-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 08:23:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D38B7E30
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 08:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10A5D3017FB5
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 07:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4CB30B517;
	Fri, 30 Jan 2026 07:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="fWayQbgk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B8F2FB0B9
	for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 07:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769757785; cv=none; b=AhePZO0PtE4+m47WVPs5byBbMviyNL71DDDkYAtCvLpjLPRswKBtoqyOjo7h7Y1xcTVgLOVTpbTmjImzw0RmMcgXJJDcCHTtFUp8V4lEHWi0evUQoXrnB1kH/2sN+dRusi3Qy2pZhl5K/WnOmGnbzvxotkHsacvaaaUcfIP1OhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769757785; c=relaxed/simple;
	bh=w37bPd+UttciXG0uafnVcXwv1eTLIc0mLJvkrvpo1m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QNstzZaFuq8yW/yQhaQ11mXupjWoBv/GV48tZblJpml27Y9bPH2x/m9MsmkMgdh0yxvEVG1Fkgq7e8EzM9qK2tjZBofQslR6oVDKuFZKn0CDfL1j7Qvo8B/woKlptSr29qNQi7ApSc3MVE50xppgcs6/wrhmdenzlCrcEyayBTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=fWayQbgk; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1769757749;
	bh=jqxQHWnmcPGEuCMRmKVcNP/OaDagHqBmtXA537H/NO4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=fWayQbgkNOWdeZYhn/w1MbHwR4kd4W1sdvPODrdJlwbRLISPzBMcWMruEWsSJSD4i
	 SmK1KH9qTFtE7BCe4geuNiCLpVdLqjGHz+0v8ZfYI8KQa1CpXpWd3mTN4fEwPmhLhF
	 uTY+ztV931IaJRXwiY0RbK98Br5mDS+LUwG+PfgA=
X-QQ-mid: zesmtpip4t1769757743tf589dc80
X-QQ-Originating-IP: RS4NbyYHJcde7swhEr83IHeH6stOE8ZYq0ru1yiu0rQ=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Jan 2026 15:22:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14286146303170880498
EX-QQ-RecipientCnt: 8
From: raoxu <raoxu@uniontech.com>
To: raoxu@uniontech.com
Cc: gregkh@linuxfoundation.org,
	kenny@panix.com,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com,
	zhanjun@uniontech.com
Subject: [PATCH v13 2/2] usb: xhci: enable secondary interrupters and route transfers per slot
Date: Fri, 30 Jan 2026 15:22:19 +0800
Message-ID: <304049EC7F80BD35+20260130072219.13329-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <774DE05348EDA32D+20260130071806.7608-1-raoxu@uniontech.com>
References: <774DE05348EDA32D+20260130071806.7608-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Nx1ABH/Z49PLYXmb47pE9i3X1PukSx+4ifIwUj3+gYk8vZl8HD87cmQ3
	PuVt+OS3oVIpbuakaiwiPB5pS519hx6XhaF0TtM0ElAX15Yc3dqRGLpNlUvnAygXpteXHS5
	LK1y4i9UauPDxoy6PGTq2+gpVLFzZc1oLfVY543icu294pdpkuE+eL+CERcHfBGdPduRZ1y
	9npc4oqOPC/dfICOrs81uRIVSz5j6/qjodPzLOq0V/rx0pQvwgbhYdUf+MOVn71W3eXazL1
	PomEgXNbEzq0hBJwkj7IWEeQ+0JzMSRe6SPMkV1a3WZLvUMBeldNdr7365fqBs4O+PqeHHW
	uJyHLaj9e5dYccWKjrMQz9td7xyILWkCi6jMO5LT7KbUYm8v/Y9kDhS8EjFvC0sll31GHEB
	MdJzTkSBNGbFsdtZ9ZfR6Pdr7uaNqQ6q+01TX0rQg2zunyJlN81LRqS37oQupI1icJjb3Jj
	ncsD/27MtXmrECnfV3Ui5TWOnhj8JiWk6TAISlhBbEUl3GWGOkmAjtknqIqObAudxTeDzLh
	WmOndWQHaW4j0EtBRcapcW7/ee0nFBzmv9P5Yl+bHyDqzhJyXgvvVVGzboSA57i3PoI/93D
	meM0mFIlAjyTy7jPfNELESfYB+rE3o+8hMA/Zx3P/w2p1RG9Q1x5fenEBS7egJSbDurd62y
	Tzm07WoV+2R6WttsvHC6rBERZeSw99oPjPSBbq3dqy6DvRvep48cl0Y+G/4jMl8GJqqlY2V
	jqiXSZZHBqAXpxky/7chalWUoNQoEOpTbzy2jx/taPgBYinUPhp2Q0xwEcZS8rHPu9JbDKk
	Oli12WEMIc3Z2ykHu+QLyWfEksTc6KOBKGvpsKqkofK+7sLME/Ot9SV2CgzR8L5lYcS3cer
	G8fYglyBa4V3BDZ3BDjTNNx/JE7YNeIkbv/2wIO/MRawqb1gnWI4uRRF5PrWEWScPQznkgE
	56rzMQfhpVE3ETX1nJNkus5jc/PPRdJcGlQ7l5LqStWcqhFXSDducVHjjcr2+22NgmAStQR
	KKd0Ch1bUjIig03DGLJ6TbLTSvKXhtIT8oEIO+VNV1g12eS1Ex
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32931-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,panix.com,vger.kernel.org,linux.intel.com,gmail.com,uniontech.com];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:email,uniontech.com:dkim,uniontech.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 81D38B7E30
X-Rspamd-Action: no action

From: Xu Rao <raoxu@uniontech.com>

Some xHCI hosts expose multiple MSI/MSI-X vectors and support multiple
interrupters with independent event rings, but Linux commonly routes all
transfer completions through interrupter 0.

This is not about increasing USB link throughput, but about avoiding a
driver-imposed single hot spot. On hosts that already provide multiple
MSI/MSI-X vectors and independent event rings, routing all completions
through interrupter 0 creates unnecessary contention (serialized event
handling/locks and coupled moderation), increasing CPU cost and tail
latency under many active devices/endpoints. Using secondary interrupters
simply matches the hardware's design, similar in spirit to merged
xHCI-sideband work: exploit available parallel paths rather than
funneling all events through one.

Allocate a small capped set of secondary interrupters in xhci_mem_init()
(MAX_SECONDARY_INTRNUM, default 4) and request up to the matching number
of IRQ vectors (bounded by what PCI core provides).  Dispatch each vector
to its interrupter via the per-vector irq_ctx.

Route transfers per USB device (slot) by assigning vdev->interrupter at
device allocation time and programming the interrupter target (slot
context + TRB_INTR_TARGET) from that selection, so completions land on the
selected event ring.  Drain a slot's secondary event ring at selected
command completion boundaries to reduce late-event artifacts when teardown
happens on interrupter 0.

Signed-off-by: Xu Rao <raoxu@uniontech.com>

---
 drivers/usb/host/xhci-mem.c  |  43 ++++++++++
 drivers/usb/host/xhci-pci.c  |  39 ++++++++-
 drivers/usb/host/xhci-ring.c | 151 ++++++++++++++++++++++++++++-------
 drivers/usb/host/xhci.c      |  16 +++-
 drivers/usb/host/xhci.h      |  10 +++
 5 files changed, 228 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index c708bdd69f16..87875d518ee3 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -14,11 +14,17 @@
 #include <linux/slab.h>
 #include <linux/dmapool.h>
 #include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>

 #include "xhci.h"
 #include "xhci-trace.h"
 #include "xhci-debugfs.h"

+static bool xhci_secondary_intr __read_mostly;
+module_param_named(secondary_intr, xhci_secondary_intr, bool, 0444);
+MODULE_PARM_DESC(secondary_intr, "Enable xHCI secondary interrupters (default: N)");
+
 /*
  * Allocates a generic ring segment from the ring pool, sets the dma address,
  * initializes the segment to zero, and sets the private next pointer to NULL.
@@ -1197,6 +1203,15 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud

 	ep0_ctx->tx_info = cpu_to_le32(EP_AVG_TRB_LENGTH(8));

+	/* Match Slot Context interrupter target to vdev->interrupter. */
+	if (dev->interrupter) {
+		u32 tt = le32_to_cpu(slot_ctx->tt_info);
+
+		tt &= ~SLOT_INTR_TARGET_MASK;
+		tt |= SLOT_INTR_TARGET(dev->interrupter->intr_num);
+		slot_ctx->tt_info = cpu_to_le32(tt);
+	}
+
 	trace_xhci_setup_addressable_virt_device(dev);

 	/* Steps 7 and 8 were done in xhci_alloc_virt_device() */
@@ -2402,6 +2417,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
 	dma_addr_t	dma;
+	unsigned int	secondary_intr_num = 0;
+	int		i;

 	/*
 	 * xHCI section 5.4.6 - Device Context array must be
@@ -2495,6 +2512,32 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 	if (!xhci->interrupters[0])
 		goto fail;

+	xhci->secondary_irqs_alloc = 0;
+	if (!xhci_secondary_intr)
+		goto skip_secondary;
+
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocating secondary event ring");
+	if (xhci->max_interrupters > 1)
+		secondary_intr_num = min_t(unsigned int,
+				xhci->max_interrupters - 1,
+				(unsigned int)MAX_SECONDARY_INTRNUM);
+
+	for (i = 1; i <= secondary_intr_num; i++) {
+		if (xhci->interrupters[i])
+			continue;
+		xhci->interrupters[i] = xhci_alloc_interrupter(xhci, i, flags);
+		if (!xhci->interrupters[i]) {
+			while (--i >= 1) {
+				xhci_free_interrupter(xhci, xhci->interrupters[i]);
+				xhci->interrupters[i] = NULL;
+			}
+			xhci->secondary_irqs_alloc = 0;
+			break;
+		}
+		xhci->secondary_irqs_alloc++;
+	}
+
+skip_secondary:
 	if (scratchpad_alloc(xhci, flags))
 		goto fail;

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 3e019f2811e7..28050222f53b 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -152,6 +152,8 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	int ret;
 	struct xhci_irq_ctx *ctx;
+	unsigned int irqs_num;
+	int i;

 	/*
 	 * Some Fresco Logic host controllers advertise MSI, but fail to
@@ -174,7 +176,7 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)

 	/* TODO: Check with MSI Soc for sysdev */
 	xhci->nvecs = pci_alloc_irq_vectors(pdev, 1, xhci->nvecs,
-					    PCI_IRQ_MSIX | PCI_IRQ_MSI);
+					    PCI_IRQ_MSIX | PCI_IRQ_MSI | PCI_IRQ_AFFINITY);
 	if (xhci->nvecs < 0) {
 		xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			       "failed to allocate IRQ vectors");
@@ -192,8 +194,43 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 		goto free_irq_vectors;

 	xhci->irqs_enabled = 1;
+
+	/*
+	 * Vector 0 IRQ handler is requested above.
+	 * Request IRQ handlers for up to secondary_irqs_alloc additional vectors
+	 * (vectors 1..), limited by what PCI core actually allocated.
+	 */
+	irqs_num = min_t(unsigned int,
+			(unsigned int)xhci->nvecs,
+			(unsigned int)(1 + xhci->secondary_irqs_alloc));
+
+	/* Vector 0 requested above; request up to sec_num secondary vectors (1..). */
+	for (i = 1; i < irqs_num; i++) {
+		ctx = &xhci->irq_ctx[i];
+		ctx->hcd = hcd;
+		ctx->intr_num = i;
+		ret = request_irq(pci_irq_vector(pdev, i), xhci_msi_irq, 0,
+				"xhci_hcd", ctx);
+		if (ret) {
+			xhci_dbg_trace(xhci, trace_xhci_dbg_init,
+					"failed to request irq vector %d", i);
+			while (--i >= 1) {
+				free_irq(pci_irq_vector(pdev, i),
+						&xhci->irq_ctx[i]);
+				memset(&xhci->irq_ctx[i], 0,
+						sizeof(xhci->irq_ctx[i]));
+			}
+			xhci->irqs_enabled = 1;
+			break;
+		}
+		xhci->irqs_enabled++;
+	}
+
 	hcd->msi_enabled = 1;
 	hcd->msix_enabled = pdev->msix_enabled;
+
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "enabled %u %s interrupters",
+			xhci->irqs_enabled, pdev->msix_enabled ? "MSI-X" : "MSI");
 	return 0;

 free_irq_vectors:
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 3ea134c07c5f..5a230dbc9430 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -64,6 +64,9 @@ static int queue_command(struct xhci_hcd *xhci, struct xhci_command *cmd,
 			 u32 field1, u32 field2,
 			 u32 field3, u32 field4, bool command_must_succeed);

+static void xhci_handle_slot_secondary_events(struct xhci_hcd *xhci,
+		union xhci_trb *cmd_trb);
+
 /*
  * Returns zero if the TRB isn't in this segment, otherwise it returns the DMA
  * address of the TRB.
@@ -1859,6 +1862,9 @@ static void handle_cmd_completion(struct xhci_hcd *xhci,
 		}
 	}

+	/* Handle slot secondary events before command-specific teardown logic */
+	xhci_handle_slot_secondary_events(xhci, cmd_trb);
+
 	cmd_type = TRB_FIELD_TO_TYPE(le32_to_cpu(cmd_trb->generic.field[3]));
 	switch (cmd_type) {
 	case TRB_ENABLE_SLOT:
@@ -3138,6 +3144,72 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
 	return 0;
 }

+/*
+ * Handle a slot's secondary event ring at command completion boundaries.
+ *
+ * With secondary interrupters, transfer events may lag behind command
+ * completions (handled on interrupter 0). Commands that stop/reset/disable
+ * endpoints/slots can reclaim TD state before those transfer events are
+ * processed, leading to "Spurious event dma" reports. Call this from
+ * handle_cmd_completion() before command-specific completion handling.
+ */
+static void xhci_handle_slot_secondary_events(struct xhci_hcd *xhci,
+		union xhci_trb *cmd_trb)
+{
+	u32 field3, cmd_type, slot_id;
+	struct xhci_virt_device *vdev;
+	struct xhci_interrupter *sec_ir;
+	unsigned int intr;
+
+	/* No secondary routing -> nothing to do */
+	if (xhci->irqs_enabled <= 1)
+		return;
+
+	field3   = le32_to_cpu(cmd_trb->generic.field[3]);
+	cmd_type = TRB_FIELD_TO_TYPE(field3);
+	slot_id  = TRB_TO_SLOT_ID(field3);
+
+	if (!slot_id)
+		return;
+
+	/*
+	 * Handle only for commands that can stop/reset/disable endpoints/slots
+	 * and/or cause the driver to reclaim TD ownership.
+	 */
+	switch (cmd_type) {
+	case TRB_STOP_RING:
+	case TRB_SET_DEQ:
+	case TRB_RESET_EP:
+	case TRB_RESET_DEV:
+	case TRB_DISABLE_SLOT:
+		break;
+	case TRB_CONFIG_EP:
+		/* Only needed for deconfigure (drop endpoints) */
+		if (!(field3 & TRB_DC))
+			return;
+		break;
+	default:
+		return;
+	}
+
+	vdev = xhci->devs[slot_id];
+	if (!vdev || !vdev->interrupter)
+		return;
+
+	intr = vdev->interrupter->intr_num;
+	if (!intr || intr >= xhci->irqs_enabled)
+		return; /* slot is on primary interrupter */
+
+	sec_ir = xhci->interrupters[intr];
+	if (!sec_ir || !sec_ir->event_ring)
+		return;
+
+	lockdep_assert_held(&xhci->lock);
+
+	/* Handle pending events normally to complete URB/TD bookkeeping. */
+	xhci_handle_events(xhci, sec_ir, false);
+}
+
 /*
  * Move the event ring dequeue pointer to skip events kept in the secondary
  * event ring.  This is used to ensure that pending events in the ring are
@@ -3169,14 +3241,8 @@ void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
 	xhci_handle_events(xhci, ir, true);
 }

-/*
- * xHCI spec says we can get an interrupt, and if the HC has an error condition,
- * we might get bad data out of the event ring.  Section 4.10.2.7 has a list of
- * indicators of an event TRB error, but we check the status *first* to be safe.
- */
-irqreturn_t xhci_irq(struct usb_hcd *hcd)
+static irqreturn_t xhci_irq_ir(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
-	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 	irqreturn_t ret = IRQ_HANDLED;
 	u32 status;

@@ -3188,7 +3254,11 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 		goto out;
 	}

-	if (!(status & STS_EINT)) {
+	/*
+	 * STS_EINT is only meaningful for the primary interrupter (0).
+	 * Secondary vectors may interrupt without STS_EINT set.
+	 */
+	if (ir->intr_num == 0 && !(status & STS_EINT)) {
 		ret = IRQ_NONE;
 		goto out;
 	}
@@ -3204,30 +3274,52 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 		goto out;
 	}

-	/*
-	 * Clear the op reg interrupt status first,
-	 * so we can receive interrupts from other MSI-X interrupters.
-	 * Write 1 to clear the interrupt status.
-	 */
-	status |= STS_EINT;
-	writel(status, &xhci->op_regs->status);
+	if (ir->intr_num == 0) {
+		/*
+		 * Clear the op reg interrupt status first,
+		 * so we can receive interrupts from other MSI-X interrupters.
+		 * Write 1 to clear the interrupt status.
+		 */
+		status |= STS_EINT;
+		writel(status, &xhci->op_regs->status);
+	}

-	/* This is the handler of the primary interrupter */
-	xhci_handle_events(xhci, xhci->interrupters[0], false);
+	/* Handle events for this interrupter. */
+	xhci_handle_events(xhci, ir, false);
 out:
 	spin_unlock(&xhci->lock);

 	return ret;
 }

+/*
+ * xHCI spec says we can get an interrupt, and if the HC has an error condition,
+ * we might get bad data out of the event ring.  Section 4.10.2.7 has a list of
+ * indicators of an event TRB error, but we check the status *first* to be safe.
+ */
+irqreturn_t xhci_irq(struct usb_hcd *hcd)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+
+	return xhci_irq_ir(xhci, xhci->interrupters[0]);
+}
+
 irqreturn_t xhci_msi_irq(int irq, void *data)
 {
 	struct xhci_irq_ctx *ctx = data;
+	struct xhci_hcd *xhci;
+	struct xhci_interrupter *ir;

-	/* For now only vector 0 is requested; keep behavior unchanged. */
+	/* All MSI/MSI-X vectors use ctx (dev_id) to select interrupter.*/
 	if (!ctx || !ctx->hcd)
 		return IRQ_NONE;
-	return xhci_irq(ctx->hcd);
+
+	xhci = hcd_to_xhci(ctx->hcd);
+	ir = xhci->interrupters[ctx->intr_num];
+	if (!ir)
+		return IRQ_NONE;
+
+	return xhci_irq_ir(xhci, ir);
 }
 EXPORT_SYMBOL_GPL(xhci_msi_irq);

@@ -3629,6 +3721,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	int sent_len, ret;
 	u32 field, length_field, remainder;
 	u64 addr, send_addr;
+	struct xhci_interrupter *ir;

 	ring = xhci_urb_to_transfer_ring(xhci, urb);
 	if (!ring)
@@ -3669,6 +3762,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	start_trb = &ring->enqueue->generic;
 	start_cycle = ring->cycle_state;
 	send_addr = addr;
+	ir = xhci->devs[slot_id]->interrupter;

 	/* Queue the TRBs, even if they are zero-length */
 	for (enqd_len = 0; first_trb || enqd_len < full_len;
@@ -3729,7 +3823,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,

 		length_field = TRB_LEN(trb_buff_len) |
 			TRB_TD_SIZE(remainder) |
-			TRB_INTR_TARGET(0);
+			TRB_INTR_TARGET(ir->intr_num);

 		queue_trb(xhci, ring, more_trbs_coming | need_zero_pkt,
 				lower_32_bits(send_addr),
@@ -3761,7 +3855,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		urb_priv->td[1].end_trb = ring->enqueue;
 		urb_priv->td[1].end_seg = ring->enq_seg;
 		field = TRB_TYPE(TRB_NORMAL) | ring->cycle_state | TRB_IOC;
-		queue_trb(xhci, ring, 0, 0, 0, TRB_INTR_TARGET(0), field);
+		queue_trb(xhci, ring, 0, 0, 0, TRB_INTR_TARGET(ir->intr_num), field);
 	}

 	check_trb_math(urb, enqd_len);
@@ -3783,6 +3877,9 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	u32 field;
 	struct urb_priv *urb_priv;
 	struct xhci_td *td;
+	struct xhci_interrupter *ir;
+
+	ir = xhci->devs[slot_id]->interrupter;

 	ep_ring = xhci_urb_to_transfer_ring(xhci, urb);
 	if (!ep_ring)
@@ -3805,7 +3902,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		if (last_trb_on_seg(ep_ring->enq_seg, ep_ring->enqueue + 1)) {
 			field = TRB_TYPE(TRB_TR_NOOP) | ep_ring->cycle_state;
 			queue_trb(xhci, ep_ring, false, 0, 0,
-					TRB_INTR_TARGET(0), field);
+					TRB_INTR_TARGET(ir->intr_num), field);
 		}
 	}

@@ -3856,7 +3953,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	queue_trb(xhci, ep_ring, true,
 		  setup->bRequestType | setup->bRequest << 8 | le16_to_cpu(setup->wValue) << 16,
 		  le16_to_cpu(setup->wIndex) | le16_to_cpu(setup->wLength) << 16,
-		  TRB_LEN(8) | TRB_INTR_TARGET(0),
+		  TRB_LEN(8) | TRB_INTR_TARGET(ir->intr_num),
 		  /* Immediate data in pointer */
 		  field);

@@ -3886,7 +3983,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 				urb, 1);
 		length_field = TRB_LEN(urb->transfer_buffer_length) |
 				TRB_TD_SIZE(remainder) |
-				TRB_INTR_TARGET(0);
+				TRB_INTR_TARGET(ir->intr_num);
 		if (setup->bRequestType & USB_DIR_IN)
 			field |= TRB_DIR_IN;
 		queue_trb(xhci, ep_ring, true,
@@ -3909,7 +4006,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	queue_trb(xhci, ep_ring, false,
 			0,
 			0,
-			TRB_INTR_TARGET(0),
+			TRB_INTR_TARGET(ir->intr_num),
 			/* Event on completion */
 			field | TRB_IOC | TRB_TYPE(TRB_STATUS) | ep_ring->cycle_state);

@@ -4099,7 +4196,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,

 	xep = &xhci->devs[slot_id]->eps[ep_index];
 	ep_ring = xhci->devs[slot_id]->eps[ep_index].ring;
-	ir = xhci->interrupters[0];
+	ir = xhci->devs[slot_id]->interrupter;

 	num_tds = urb->number_of_packets;
 	if (num_tds < 1) {
@@ -4200,7 +4297,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 						   urb, more_trbs_coming);

 			length_field = TRB_LEN(trb_buff_len) |
-				TRB_INTR_TARGET(0);
+				TRB_INTR_TARGET(ir->intr_num);

 			/* xhci 1.1 with ETE uses TD Size field for TBC */
 			if (first_trb && xep->use_extended_tbc)
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 18d3093b688a..3187f4b6943b 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -577,9 +577,6 @@ static int xhci_init(struct usb_hcd *hcd)
 	/* Set USB 3.0 device notifications for function remote wake */
 	xhci_set_dev_notifications(xhci);

-	/* Since only the main interrupt is used, secondary_irqs_alloc is set to 0. */
-	xhci->secondary_irqs_alloc = 0;
-
 	/*
 	 * Initialize all allocated interrupters here.
 	 * Use allocated count as loop bound to avoid touching non-allocated
@@ -4236,6 +4233,7 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 	unsigned long flags;
 	int ret, slot_id;
 	struct xhci_command *command;
+	unsigned int sec_irqs, intr_num;

 	command = xhci_alloc_command(xhci, true, GFP_KERNEL);
 	if (!command)
@@ -4292,6 +4290,18 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)

 	udev->slot_id = slot_id;

+	/*
+	 * Spread devices across IRQ-backed secondary interrupters [1..].
+	 * If only vector 0 is enabled, default to interrupter 0.
+	 */
+	sec_irqs = (xhci->irqs_enabled > 1) ? (xhci->irqs_enabled - 1) : 0;
+	if (sec_irqs) {
+		intr_num = slot_id % sec_irqs;
+		vdev->interrupter = xhci->interrupters[intr_num + 1];
+	} else {
+		vdev->interrupter = xhci->interrupters[0];
+	}
+
 	xhci_debugfs_create_slot(xhci, slot_id);

 	/*
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 90d4ba6b3573..c437aace7af7 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -408,6 +408,11 @@ struct xhci_slot_ctx {
 #define SLOT_STATE_ADDRESSED	2
 #define SLOT_STATE_CONFIGURED	3

+/* Interrupter Target - tt_info[31:22] (xHCI Slot Context) */
+#define SLOT_INTR_TARGET_SHIFT 22
+#define SLOT_INTR_TARGET_MASK  (0x3ffU << SLOT_INTR_TARGET_SHIFT)
+#define SLOT_INTR_TARGET(p)    (((p) & 0x3ffU) << SLOT_INTR_TARGET_SHIFT)
+
 /**
  * struct xhci_ep_ctx
  * @ep_info:	endpoint state, streams, mult, and interval information.
@@ -767,6 +772,11 @@ struct xhci_virt_device {
 	void				*debugfs_private;
 	/* set if this endpoint is controlled via sideband access*/
 	struct xhci_sideband	*sideband;
+	/*
+	 * Default transfer-event interrupter for this USB device.
+	 * Queueing code programs TRB_INTR_TARGET() from vdev->interrupter.
+	 */
+	struct xhci_interrupter *interrupter;
 };

 /*
--
2.50.1


