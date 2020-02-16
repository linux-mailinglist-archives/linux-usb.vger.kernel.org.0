Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7111604FD
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2020 18:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728530AbgBPR1I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Feb 2020 12:27:08 -0500
Received: from asav22.altibox.net ([109.247.116.9]:50668 "EHLO
        asav22.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728495AbgBPR1H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Feb 2020 12:27:07 -0500
Received: from localhost.localdomain (unknown [81.166.168.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: noralf.tronnes@ebnett.no)
        by asav22.altibox.net (Postfix) with ESMTPSA id F18AA2006F;
        Sun, 16 Feb 2020 18:21:38 +0100 (CET)
From:   =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To:     broonie@kernel.org, balbi@kernel.org, lee.jones@linaro.org
Cc:     linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [RFC 1/9] regmap: Add USB support
Date:   Sun, 16 Feb 2020 18:21:09 +0100
Message-Id: <20200216172117.49832-2-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200216172117.49832-1-noralf@tronnes.org>
References: <20200216172117.49832-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ZvHD1ezG c=1 sm=1 tr=0
        a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10
        a=SJz97ENfAAAA:8 a=mUNDW0rc9m-72unTMGQA:9 a=qPv1qALXyqbN-t20:21
        a=3pyz2qYhOZPv3Z7M:21 a=m1hsav1n4tjLVwml:21 a=QEXdDO2ut3YA:10
        a=vFet0B0WnEQeilDPIY6i:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for regmap over USB for use with the Multifunction USB Device.
Two endpoints IN/OUT are used. Up to 255 regmaps are supported on one USB
interface. The register index width is always 32-bit, but the register
value can be 8, 16 or 32 bits wide. LZ4 compression is supported on bulk
transfers.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/base/regmap/Kconfig      |    8 +-
 drivers/base/regmap/Makefile     |    1 +
 drivers/base/regmap/regmap-usb.c | 1026 ++++++++++++++++++++++++++++++
 include/linux/regmap.h           |   23 +
 include/linux/regmap_usb.h       |   97 +++
 5 files changed, 1154 insertions(+), 1 deletion(-)
 create mode 100644 drivers/base/regmap/regmap-usb.c
 create mode 100644 include/linux/regmap_usb.h

diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
index 0fd6f97ee523..6c937c196825 100644
--- a/drivers/base/regmap/Kconfig
+++ b/drivers/base/regmap/Kconfig
@@ -4,7 +4,7 @@
 # subsystems should select the appropriate symbols.
 
 config REGMAP
-	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SCCB || REGMAP_I3C)
+	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SCCB || REGMAP_I3C || REGMAP_USB)
 	select IRQ_DOMAIN if REGMAP_IRQ
 	bool
 
@@ -53,3 +53,9 @@ config REGMAP_SCCB
 config REGMAP_I3C
 	tristate
 	depends on I3C
+
+config REGMAP_USB
+	tristate
+	depends on USB
+	select LZ4_COMPRESS
+	select LZ4_DECOMPRESS
diff --git a/drivers/base/regmap/Makefile b/drivers/base/regmap/Makefile
index ff6c7d8ec1cd..7e6932f100ea 100644
--- a/drivers/base/regmap/Makefile
+++ b/drivers/base/regmap/Makefile
@@ -17,3 +17,4 @@ obj-$(CONFIG_REGMAP_W1) += regmap-w1.o
 obj-$(CONFIG_REGMAP_SOUNDWIRE) += regmap-sdw.o
 obj-$(CONFIG_REGMAP_SCCB) += regmap-sccb.o
 obj-$(CONFIG_REGMAP_I3C) += regmap-i3c.o
+obj-$(CONFIG_REGMAP_USB) += regmap-usb.o
diff --git a/drivers/base/regmap/regmap-usb.c b/drivers/base/regmap/regmap-usb.c
new file mode 100644
index 000000000000..bb4f0df44d1d
--- /dev/null
+++ b/drivers/base/regmap/regmap-usb.c
@@ -0,0 +1,1026 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Register map access API - USB support
+ *
+ * Copyright 2020 Noralf Trønnes
+ */
+
+#include <linux/debugfs.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/list.h>
+#include <linux/lz4.h>
+#include <linux/regmap.h>
+#include <linux/regmap_usb.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/usb.h>
+
+#include "internal.h"
+
+/**
+ * DOC: overview
+ *
+ * This regmap over USB supports multiple regmaps over a single USB interface.
+ * Two endpoints are needed and the first IN and OUT endpoints are used.
+ * A REGMAP_USB_DT_INTERFACE descriptor request is issued to get the number of
+ * regmaps supported on the interface. A REGMAP_USB_DT_MAP descriptor request is
+ * issued to get details about a specific regmap. This is done when
+ * devm_regmap_init_usb() is called to get access to a regmap.
+ *
+ * A regmap transfer begins with the host sending OUT a &regmap_usb_header which
+ * contains info about the index of the regmap, the register address etc. Next
+ * it does an IN or OUT transfer of the register value(s) depending on if it's a
+ * read or write. This transfer can be compressed using lz4 if the device
+ * supports it. Finally a &regmap_usb_status IN request is issued to receive the
+ * status of the transfer.
+ *
+ * If a transfer fails with the error code -EPIPE, a reset control request
+ * (REGMAP_USB_REQ_PROTOCOL_RESET) is issued. The device should reset it's state
+ * machine and return its previous error code if any. The device can halt its
+ * IN/OUT endpoints to force the host to perform a reset if it fails to
+ * understand a transfer.
+ */
+
+/* Provides exclusive interface access */
+struct regmap_usb_interface {
+	struct usb_interface *interface;
+	struct mutex lock; /* Ensures exclusive interface access */
+	unsigned int refcount;
+	struct list_head link;
+
+	u32 tag;
+};
+
+struct regmap_usb_context;
+
+struct regmap_usb_transfer {
+	struct regmap_usb_context *ctx;
+	struct usb_anchor anchor;
+	struct urb *header_urb;
+	struct urb *buf_out_urb;
+	struct urb *buf_in_urb;
+	void *buf;
+	size_t bufsize;
+	struct urb *status_urb;
+	spinlock_t lock; /* Protect dynamic values */
+	u32 tag;
+	int status;
+
+	u8 compression;
+	void *buf_in_dest;
+	unsigned int length;
+	unsigned int actual_length;
+
+	ktime_t start; /* FIXME: Temporary debug/perf aid */
+};
+
+struct regmap_usb_context {
+	struct usb_device *usb;
+	struct regmap_usb_interface *ruif;
+	u8 ifnum;
+	unsigned int in_pipe;
+	unsigned int out_pipe;
+	u16 index;
+	unsigned int val_bytes;
+	void *lz4_comp_mem;
+	u8 compression;
+	unsigned int max_transfer_size;
+	struct regmap_usb_transfer *transfers[2];
+#ifdef CONFIG_DEBUG_FS
+	u64 stats_length;
+	u64 stats_actual_length;
+	unsigned int num_resets;
+	unsigned int num_errors;
+#endif
+};
+
+/* FIXME: Temporary debugging aid */
+static unsigned int debug = 8;
+
+#define udebug(level, fmt, ...)				\
+do {							\
+	if ((level) <= debug)				\
+		pr_debug(fmt, ##__VA_ARGS__);		\
+} while (0)
+
+static LIST_HEAD(regmap_usb_interfaces);
+static DEFINE_MUTEX(regmap_usb_interfaces_lock);
+
+static struct regmap_usb_interface *regmap_usb_interface_get(struct usb_interface *interface)
+{
+	struct regmap_usb_interface *ruif, *entry;
+
+	mutex_lock(&regmap_usb_interfaces_lock);
+	list_for_each_entry(entry, &regmap_usb_interfaces, link)
+		if (entry->interface == interface) {
+			ruif = entry;
+			ruif->refcount++;
+			goto out_unlock;
+		}
+
+	ruif = kzalloc(sizeof(*ruif), GFP_KERNEL);
+	if (!ruif) {
+		ruif = ERR_PTR(-ENOMEM);
+		goto out_unlock;
+	}
+
+	mutex_init(&ruif->lock);
+	ruif->interface = interface;
+	ruif->refcount++;
+	list_add(&ruif->link, &regmap_usb_interfaces);
+out_unlock:
+	mutex_unlock(&regmap_usb_interfaces_lock);
+
+	return ruif;
+}
+
+static void regmap_usb_interface_put(struct regmap_usb_interface *ruif)
+{
+	mutex_lock(&regmap_usb_interfaces_lock);
+	if (--ruif->refcount)
+		goto out_unlock;
+
+	list_del(&ruif->link);
+	mutex_destroy(&ruif->lock);
+	kfree(ruif);
+out_unlock:
+	mutex_unlock(&regmap_usb_interfaces_lock);
+}
+
+#ifdef CONFIG_DEBUG_FS
+static void regmap_usb_stats_add_length(struct regmap_usb_context *ctx, unsigned int len)
+{
+	ctx->stats_length += len;
+	/* Did it wrap around? */
+	if (ctx->stats_length <= len && ctx->stats_actual_length) {
+		ctx->stats_length = len;
+		ctx->stats_actual_length = 0;
+	}
+}
+
+#define regmap_usb_stats_add(c, v) \
+	(c) += v
+#else
+static void regmap_usb_stats_add_length(struct regmap_usb_context *ctx, unsigned int len)
+{
+}
+
+#define regmap_usb_stats_add(c, v)
+#endif
+
+static int regmap_usb_protocol_reset(struct regmap_usb_context *ctx)
+{
+	u8 *prev_errno;
+	int ret;
+
+	regmap_usb_stats_add(ctx->num_resets, 1);
+
+	prev_errno = kmalloc(1, GFP_ATOMIC);
+	if (!prev_errno)
+		return -ENOMEM;
+
+	usb_clear_halt(ctx->usb, ctx->out_pipe);
+	usb_clear_halt(ctx->usb, ctx->in_pipe);
+
+	ret = usb_control_msg(ctx->usb, usb_rcvctrlpipe(ctx->usb, 0),
+			      REGMAP_USB_REQ_PROTOCOL_RESET,
+			      USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_INTERFACE,
+			      0, ctx->ifnum, prev_errno, 1,
+			      USB_CTRL_SET_TIMEOUT);
+	udebug(0, "%s: ret=%d, prev_errno=%u\n", __func__, ret, *prev_errno);
+	if (ret < 0 || ret != 1) {
+		/* FIXME: Try a USB port reset? */
+		ret = -EPIPE;
+		goto free;
+	}
+
+	ret = *prev_errno;
+free:
+	kfree(prev_errno);
+
+	return ret ? -ret : -EPIPE;
+}
+
+static void regmap_usb_header_urb_completion(struct urb *urb)
+{
+	struct regmap_usb_transfer *transfer = urb->context;
+	unsigned long flags;
+
+	spin_lock_irqsave(&transfer->lock, flags);
+	if (urb->status)
+		transfer->status = urb->status;
+	else if (urb->actual_length != urb->transfer_buffer_length)
+		transfer->status = -EREMOTEIO;
+	transfer->start = ktime_get();
+	spin_unlock_irqrestore(&transfer->lock, flags);
+
+	udebug(4, "%s: transfer: status=%d (%d), tag=%u\n",
+	       __func__, urb->status, transfer->status, transfer->tag);
+}
+
+static void regmap_usb_status_urb_completion(struct urb *urb)
+{
+	struct regmap_usb_status *status = urb->transfer_buffer;
+	struct regmap_usb_transfer *transfer = urb->context;
+	unsigned long flags;
+	int stat;
+
+	udebug(4, "%s: urb->status=%d, signature=0x%x, tag=%u (expected %u)\n",
+	       __func__, urb->status, le32_to_cpu(status->signature),
+	       le16_to_cpu(status->tag), transfer->tag);
+
+	if (urb->status)
+		stat = urb->status;
+	else if (urb->actual_length != urb->transfer_buffer_length)
+		stat = -EREMOTEIO;
+	else if (le32_to_cpu(status->signature) != REGMAP_USB_STATUS_SIGNATURE ||
+		 le16_to_cpu(status->tag) != transfer->tag)
+		stat = -EBADMSG;
+	else
+		stat = -status->status;
+
+	spin_lock_irqsave(&transfer->lock, flags);
+	if (!transfer->status)
+		transfer->status = stat;
+	spin_unlock_irqrestore(&transfer->lock, flags);
+}
+
+static long mud_drm_throughput(ktime_t begin, ktime_t end, size_t len)
+{
+	long throughput;
+
+	throughput = ktime_us_delta(end, begin);
+	throughput = throughput ? (len * 1000) / throughput : 0;
+	throughput = throughput * 1000 / 1024;
+
+	return throughput;
+}
+
+static void regmap_usb_buf_in_urb_completion(struct urb *urb)
+{
+	struct regmap_usb_transfer *transfer = urb->context;
+	unsigned long flags;
+	ktime_t start, end;
+
+	spin_lock_irqsave(&transfer->lock, flags);
+	if (urb->status && !transfer->status)
+		transfer->status = urb->status;
+	transfer->actual_length = urb->actual_length;
+	start = transfer->start;
+	spin_unlock_irqrestore(&transfer->lock, flags);
+
+	end = ktime_get();
+
+	udebug(4, "%s: IN: status=%d, tag=%u, %ld kB/s (%lld ms), len=%u\n",
+	       __func__, urb->status, transfer->tag,
+	       mud_drm_throughput(start, end, urb->actual_length),
+	       ktime_ms_delta(end, start), urb->actual_length);
+}
+
+static void regmap_usb_buf_out_urb_completion(struct urb *urb)
+{
+	struct regmap_usb_transfer *transfer = urb->context;
+	unsigned long flags;
+	ktime_t start, end;
+
+	spin_lock_irqsave(&transfer->lock, flags);
+	if (!transfer->status) {
+		if (urb->status)
+			transfer->status = urb->status;
+		else if (urb->actual_length != urb->transfer_buffer_length)
+			transfer->status = -EREMOTEIO;
+	}
+	start = transfer->start;
+	spin_unlock_irqrestore(&transfer->lock, flags);
+
+	end = ktime_get();
+
+	udebug(4, "%s: OUT: status=%d, tag=%u, %ld kB/s (%lld ms), len=%u\n",
+	       __func__, transfer->status, transfer->tag,
+	       mud_drm_throughput(start, end, urb->transfer_buffer_length),
+	       ktime_ms_delta(end, start), urb->transfer_buffer_length);
+}
+
+static struct urb *regmap_usb_alloc_urb(struct usb_device *usb, unsigned int pipe,
+					size_t size, usb_complete_t complete_fn,
+					struct regmap_usb_transfer *transfer)
+{
+	void *buf = NULL;
+	struct urb *urb;
+
+	urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!urb)
+		return NULL;
+
+	if (size) {
+		buf = usb_alloc_coherent(usb, size, GFP_KERNEL, &urb->transfer_dma);
+		if (!buf) {
+			usb_free_urb(urb);
+			return NULL;
+		}
+	}
+
+	usb_fill_bulk_urb(urb, usb, pipe, buf, size, complete_fn, transfer);
+	if (size)
+		urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
+
+	return urb;
+}
+
+static void regmap_usb_free_transfer(struct regmap_usb_transfer *transfer)
+{
+	struct urb *urb;
+
+	if (!transfer)
+		return;
+
+	urb = transfer->header_urb;
+	if (urb)
+		usb_free_coherent(urb->dev, urb->transfer_buffer_length,
+				  urb->transfer_buffer, urb->transfer_dma);
+	usb_free_urb(urb);
+
+	urb = transfer->status_urb;
+	if (urb)
+		usb_free_coherent(urb->dev, urb->transfer_buffer_length,
+				  urb->transfer_buffer, urb->transfer_dma);
+	usb_free_urb(urb);
+
+	usb_free_urb(transfer->buf_in_urb);
+	usb_free_urb(transfer->buf_out_urb);
+	kfree(transfer->buf);
+	kfree(transfer);
+}
+
+static struct regmap_usb_transfer *regmap_usb_alloc_transfer(struct regmap_usb_context *ctx)
+{
+	struct regmap_usb_transfer *transfer;
+
+	transfer = kzalloc(sizeof(*transfer), GFP_KERNEL);
+	if (!transfer)
+		return NULL;
+
+	init_usb_anchor(&transfer->anchor);
+	spin_lock_init(&transfer->lock);
+	transfer->ctx = ctx;
+
+	transfer->header_urb = regmap_usb_alloc_urb(ctx->usb, ctx->out_pipe,
+						    sizeof(struct regmap_usb_header),
+						    regmap_usb_header_urb_completion,
+						    transfer);
+	if (!transfer->header_urb)
+		goto error;
+
+	transfer->status_urb = regmap_usb_alloc_urb(ctx->usb, ctx->in_pipe,
+						    sizeof(struct regmap_usb_status),
+						    regmap_usb_status_urb_completion,
+						    transfer);
+	if (!transfer->status_urb)
+		goto error;
+
+	transfer->buf_in_urb = regmap_usb_alloc_urb(ctx->usb, ctx->in_pipe, 0,
+						    regmap_usb_buf_in_urb_completion,
+						    transfer);
+	if (!transfer->buf_in_urb)
+		goto error;
+
+	transfer->buf_out_urb = regmap_usb_alloc_urb(ctx->usb, ctx->out_pipe, 0,
+						     regmap_usb_buf_out_urb_completion,
+						     transfer);
+	if (!transfer->buf_out_urb)
+		goto error;
+
+	transfer->bufsize = ctx->max_transfer_size;
+retry:
+	transfer->buf = kmalloc(transfer->bufsize, GFP_KERNEL);
+	if (!transfer->buf) {
+		if (transfer->bufsize < 32) /* Give up */
+			goto error;
+
+		transfer->bufsize /= 2;
+		goto retry;
+	}
+
+	return transfer;
+
+error:
+	regmap_usb_free_transfer(transfer);
+
+	return NULL;
+}
+
+static void regmap_usb_free_transfers(struct regmap_usb_context *ctx)
+{
+	regmap_usb_free_transfer(ctx->transfers[0]);
+	regmap_usb_free_transfer(ctx->transfers[1]);
+}
+
+static int regmap_usb_alloc_transfers(struct regmap_usb_context *ctx)
+{
+	ctx->transfers[0] = regmap_usb_alloc_transfer(ctx);
+	ctx->transfers[1] = regmap_usb_alloc_transfer(ctx);
+	if (!ctx->transfers[0] || !ctx->transfers[1]) {
+		regmap_usb_free_transfers(ctx);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int regmap_usb_submit_urb(struct urb *urb, struct regmap_usb_transfer *transfer)
+{
+	int ret;
+
+	usb_anchor_urb(urb, &transfer->anchor);
+	ret = usb_submit_urb(urb, GFP_KERNEL);
+	if (ret)
+		usb_unanchor_urb(urb);
+
+	return ret;
+}
+
+static void regmap_usb_kill_transfers(struct regmap_usb_context *ctx)
+{
+	usb_kill_anchored_urbs(&ctx->transfers[0]->anchor);
+	usb_kill_anchored_urbs(&ctx->transfers[1]->anchor);
+}
+
+static int regmap_usb_submit_transfer(struct regmap_usb_transfer *transfer,
+				      unsigned int regnr, u32 flags, void *buf, size_t len)
+{
+	struct regmap_usb_context *ctx = transfer->ctx;
+	struct regmap_usb_header *header;
+	struct urb *urb;
+	int ret;
+
+	spin_lock_irq(&transfer->lock);
+	transfer->actual_length = 0;
+	transfer->status = 0;
+	transfer->tag = ++ctx->ruif->tag;
+	spin_unlock_irq(&transfer->lock);
+
+	udebug(3, "%s: regnr=0x%x, in=%u flags=0x%x, len=%zu, transfer->buf=%s, tag=%u\n",
+	       __func__, regnr, !!(flags & REGMAP_USB_HEADER_FLAG_IN), flags, len,
+	       buf == transfer->buf ? "yes" : "no", ctx->ruif->tag);
+
+	header = transfer->header_urb->transfer_buffer;
+	header->signature = cpu_to_le32(REGMAP_USB_HEADER_SIGNATURE);
+	header->index = cpu_to_le16(ctx->index);
+	header->tag = cpu_to_le16(ctx->ruif->tag);
+	header->flags = cpu_to_le32(flags);
+	header->regnr = cpu_to_le32(regnr);
+	header->length = cpu_to_le32(len);
+
+	ret = regmap_usb_submit_urb(transfer->header_urb, transfer);
+	if (ret)
+		goto error;
+
+	if (flags & REGMAP_USB_HEADER_FLAG_IN)
+		urb = transfer->buf_in_urb;
+	else
+		urb = transfer->buf_out_urb;
+
+	urb->transfer_buffer = buf;
+	urb->transfer_buffer_length = len;
+
+	ret = regmap_usb_submit_urb(urb, transfer);
+	if (ret)
+		goto error;
+
+	ret = regmap_usb_submit_urb(transfer->status_urb, transfer);
+	if (ret)
+		goto error;
+
+	return 0;
+
+error:
+	regmap_usb_kill_transfers(ctx);
+
+	return ret;
+}
+
+static int regmap_usb_wait_anchor(struct regmap_usb_transfer *transfer)
+{
+	int remain;
+
+	remain = usb_wait_anchor_empty_timeout(&transfer->anchor, 5000);
+	if (!remain) {
+		/* Kill pending first */
+		if (transfer == transfer->ctx->transfers[0])
+			usb_kill_anchored_urbs(&transfer->ctx->transfers[1]->anchor);
+		else
+			usb_kill_anchored_urbs(&transfer->ctx->transfers[0]->anchor);
+		usb_kill_anchored_urbs(&transfer->anchor);
+
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int regmap_usb_transfer_decompress(struct regmap_usb_transfer *transfer)
+{
+	unsigned int length, actual_length;
+	u8 compression;
+	void *dest;
+	int ret;
+
+	spin_lock_irq(&transfer->lock);
+	length = transfer->buf_in_urb->transfer_buffer_length;
+	actual_length = transfer->actual_length;
+	compression = transfer->compression;
+	transfer->compression = 0;
+	dest = transfer->buf_in_dest;
+	spin_unlock_irq(&transfer->lock);
+
+	udebug(3, "%s: dest=%px length=%u actual_length=%u\n",
+	       __func__, dest, length, actual_length);
+
+	if (!actual_length) /* This transfer has not been used */
+		return 0;
+
+	if (!length) /* FIXME: necessary? */
+		return -EINVAL;
+
+	regmap_usb_stats_add(transfer->ctx->stats_actual_length, actual_length);
+
+	if (!compression) {
+		if (actual_length != length)
+			return -EREMOTEIO;
+
+		return 0;
+	}
+
+	if (actual_length == length) { /* Device did not compress */
+		memcpy(dest, transfer->buf, length);
+		return 0;
+	}
+
+	if (compression & REGMAP_USB_COMPRESSION_LZ4) {
+		ret = LZ4_decompress_safe(transfer->buf, dest,
+					  actual_length, transfer->bufsize);
+		udebug(3, "    decompress: ret=%d\n", ret);
+	} else {
+		return -EINVAL;
+	}
+
+	if (ret < 0 || ret != length)
+		return -EREMOTEIO;
+
+	return 0;
+}
+
+static int regmap_usb_transfer(struct regmap_usb_context *ctx, bool in,
+			       const void *reg, void *buf, size_t len)
+{
+	struct regmap_usb_transfer *transfer = NULL;
+	unsigned int i, regnr, actual_length;
+	size_t chunk, trlen, complen = 0;
+	size_t orglen = len;
+	ktime_t start, end;
+	void *trbuf;
+	u32 flags;
+	int ret;
+
+	regnr = *(u32 *)reg;
+
+	for (i = 0; i < 2; i++) {
+		struct regmap_usb_transfer *transfer = ctx->transfers[i];
+
+		spin_lock_irq(&transfer->lock);
+		transfer->actual_length = 0;
+		transfer->compression = 0;
+		transfer->status = 0;
+		spin_unlock_irq(&transfer->lock);
+	}
+
+	/* FIXME: This did not work */
+	/* Use 2 transfers to maximize compressed transfers */
+	if (0 && ctx->compression &&
+	    ctx->transfers[0]->bufsize == ctx->transfers[1]->bufsize &&
+	    len > 128 && len <= ctx->transfers[0]->bufsize)
+		complen = len / 2;
+
+	mutex_lock(&ctx->ruif->lock);
+
+	udebug(2, "\n%s: regnr=0x%x, in=%u len=%zu, buf=%px, is_vmalloc=%u\n",
+	       __func__, regnr, in, len, buf, is_vmalloc_addr(buf));
+
+	start = ktime_get();
+
+	i = 0;
+	while (len) {
+		transfer = ctx->transfers[i];
+		i = !i;
+
+		chunk = min(complen ? complen : transfer->bufsize, len);
+		trlen = chunk;
+		flags = 0;
+
+		regmap_usb_stats_add_length(ctx, chunk);
+
+		ret = regmap_usb_wait_anchor(transfer);
+		if (ret) {
+			udebug(0, "FAIL first wait %d\n", ret);
+			goto error;
+		}
+
+		spin_lock_irq(&transfer->lock);
+		ret = transfer->status;
+		actual_length = transfer->actual_length;
+		spin_unlock_irq(&transfer->lock);
+		if (ret) {
+			udebug(0, "FAIL transfer %d\n", ret);
+			goto error;
+		}
+
+		if (in && ctx->compression && actual_length) {
+			ret = regmap_usb_transfer_decompress(transfer);
+			if (ret)
+				goto error;
+		}
+
+		trbuf = buf;
+
+		if (!in) {
+			ret = 0;
+			/* LZ4_minLength = 13, use the next power of two value */
+			if (ctx->compression & REGMAP_USB_COMPRESSION_LZ4 && chunk >= 16) {
+				ret = LZ4_compress_default(buf, transfer->buf, chunk,
+							   chunk, ctx->lz4_comp_mem);
+				udebug(3, "    compress[%u](chunk=%zu): ret=%d\n", !i, chunk, ret);
+			}
+			if (ret > 0) {
+				flags |= REGMAP_USB_COMPRESSION_LZ4;
+				trbuf = transfer->buf;
+				trlen = ret;
+			} else if (is_vmalloc_addr(buf)) {
+				memcpy(transfer->buf, buf, chunk);
+				trbuf = transfer->buf;
+			}
+			regmap_usb_stats_add(ctx->stats_actual_length, trlen);
+		} else {
+			flags |= REGMAP_USB_HEADER_FLAG_IN;
+			if (ctx->compression & REGMAP_USB_COMPRESSION_LZ4 && trlen >= 16) {
+				flags |= REGMAP_USB_COMPRESSION_LZ4;
+				trbuf = transfer->buf;
+
+				spin_lock_irq(&transfer->lock);
+				transfer->compression = REGMAP_USB_COMPRESSION_LZ4;
+				transfer->buf_in_dest = buf;
+				spin_unlock_irq(&transfer->lock);
+			}
+		}
+
+		ret = regmap_usb_submit_transfer(transfer, regnr, flags, trbuf, trlen);
+		if (ret) {
+			udebug(0, "FAIL submit %d\n", ret);
+			goto error;
+		}
+
+		len -= chunk;
+		buf += chunk;
+		regnr += chunk / ctx->val_bytes;
+	}
+
+	ret = regmap_usb_wait_anchor(transfer);
+	if (ret) {
+		udebug(0, "FAIL second wait%d\n", ret);
+		goto error;
+	}
+
+	for (i = 0; i < 2; i++) {
+		struct regmap_usb_transfer *transfer = ctx->transfers[i];
+
+		spin_lock_irq(&transfer->lock);
+		ret = transfer->status;
+		spin_unlock_irq(&transfer->lock);
+		if (ret) {
+			udebug(0, "FAIL transfer2[%u] %d\n", i, ret);
+			goto error;
+		}
+	}
+
+	if (in && ctx->compression) {
+		ret = regmap_usb_transfer_decompress(ctx->transfers[0]);
+		if (ret)
+			goto error;
+		ret = regmap_usb_transfer_decompress(ctx->transfers[1]);
+	}
+
+error:
+	/*
+	 * FIXME: What errors should warrant a reset?
+	 *        Verify that the DOC section is correct.
+	 */
+	if (ret == -EPIPE || ret == -ETIMEDOUT)
+		ret = regmap_usb_protocol_reset(ctx);
+
+	if (ret)
+		regmap_usb_stats_add(ctx->num_errors, 1);
+
+	if (debug >= 2) {
+		end = ktime_get();
+		pr_debug("%s: ret=%d %ld kB/s (%lld ms)\n", __func__, ret,
+			 mud_drm_throughput(start, end, orglen),
+			 ktime_ms_delta(end, start));
+	}
+
+	mutex_unlock(&ctx->ruif->lock);
+
+	return ret;
+}
+
+static int regmap_usb_gather_write(void *context,
+				   const void *reg, size_t reg_len,
+				   const void *val, size_t val_len)
+{
+	return regmap_usb_transfer(context, false, reg, (void *)val, val_len);
+}
+
+static int regmap_usb_write(void *context, const void *data, size_t count)
+{
+	struct regmap_usb_context *ctx = context;
+	size_t val_len = count - sizeof(u32);
+	void *val;
+	int ret;
+
+	/* buffer needs to be properly aligned for DMA use */
+	val = kmemdup(data + sizeof(u32), val_len, GFP_KERNEL);
+	if (!val)
+		return -ENOMEM;
+
+	ret = regmap_usb_gather_write(ctx, data, sizeof(u32), val, val_len);
+	kfree(val);
+
+	return ret;
+}
+
+static int regmap_usb_read(void *context, const void *reg_buf, size_t reg_size,
+			   void *val_buf, size_t val_size)
+{
+	return regmap_usb_transfer(context, true, reg_buf, val_buf, val_size);
+}
+
+static void regmap_usb_free_context(void *context)
+{
+	struct regmap_usb_context *ctx = context;
+
+	udebug(1, "%s:\n", __func__);
+
+	regmap_usb_interface_put(ctx->ruif);
+	regmap_usb_free_transfers(ctx);
+	kfree(ctx->lz4_comp_mem);
+	kfree(ctx);
+}
+
+static const struct regmap_bus regmap_usb = {
+	.write = regmap_usb_write,
+	.gather_write = regmap_usb_gather_write,
+	.read = regmap_usb_read,
+	.free_context = regmap_usb_free_context,
+	/* regmap_usb_transfer() handles reg_format: */
+	.reg_format_endian_default = REGMAP_ENDIAN_NATIVE,
+	.val_format_endian_default = REGMAP_ENDIAN_LITTLE,
+};
+
+#ifdef CONFIG_DEBUG_FS
+static int regmap_usb_debugfs_usbinfo_show(struct seq_file *s, void *ignored)
+{
+	struct regmap_usb_context *ctx = s->private;
+
+	mutex_lock(&ctx->ruif->lock);
+
+	seq_printf(s, "USB interface:     %s\n", dev_name(&ctx->ruif->interface->dev));
+	seq_printf(s, "Regmap index:      %u\n", ctx->index);
+	seq_printf(s, "Max transfer size: %u\n", ctx->max_transfer_size);
+	seq_printf(s, "Tag:               %u\n", ctx->ruif->tag);
+	seq_printf(s, "Number of errors:  %u\n", ctx->num_errors);
+	seq_printf(s, "Number of resets:  %u\n", ctx->num_resets);
+
+	seq_puts(s, "Compression:      ");
+	if (ctx->compression & REGMAP_USB_COMPRESSION_LZ4)
+		seq_puts(s, " lz4");
+	seq_puts(s, "\n");
+
+	if (ctx->compression) {
+		u64 remainder;
+		u64 ratio = div64_u64_rem(ctx->stats_length, ctx->stats_actual_length,
+					  &remainder);
+		u64 ratio_frac = div64_u64(remainder * 10, ctx->stats_actual_length);
+
+		seq_printf(s, "Compression ratio: %llu.%llu\n", ratio, ratio_frac);
+	}
+
+	mutex_unlock(&ctx->ruif->lock);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(regmap_usb_debugfs_usbinfo);
+
+static void regmap_usb_debugfs_init(struct regmap *map)
+{
+	if (!map->debugfs)
+		return;
+
+	debugfs_create_file("usbinfo", 0400, map->debugfs, map->bus_context,
+			    &regmap_usb_debugfs_usbinfo_fops);
+}
+#else
+static void regmap_usb_debugfs_init(struct regmap *map) {}
+#endif
+
+static struct regmap_usb_context *
+regmap_usb_gen_context(struct usb_interface *interface, unsigned int index,
+		       const struct regmap_config *config)
+{
+	struct usb_host_interface *alt = interface->cur_altsetting;
+	struct usb_device *usb = interface_to_usbdev(interface);
+	struct usb_endpoint_descriptor *ep_in, *ep_out;
+	unsigned int num_regmaps, max_transfer_size;
+	struct regmap_usb_map_descriptor map_desc;
+	struct regmap_usb_context *ctx;
+	int ret;
+
+	ret = regmap_usb_get_interface_descriptor(interface, &num_regmaps);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (!num_regmaps)
+		return ERR_PTR(-EINVAL);
+
+	if (index >= num_regmaps)
+		return ERR_PTR(-ENOENT);
+
+	ret = regmap_usb_get_map_descriptor(interface, index, &map_desc);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (config->reg_bits != 32 ||
+	    config->val_bits != map_desc.bRegisterValueBits)
+		return ERR_PTR(-EINVAL);
+
+	max_transfer_size = 1 << map_desc.bMaxTransferSizeOrder;
+	if (max_transfer_size < (config->val_bits / 8))
+		return ERR_PTR(-EINVAL);
+
+	max_transfer_size = min_t(unsigned long, max_transfer_size, KMALLOC_MAX_SIZE);
+
+	ret = usb_find_common_endpoints(alt, &ep_in, &ep_out, NULL, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
+	ctx->usb = usb;
+	ctx->index = index;
+	ctx->ifnum = alt->desc.bInterfaceNumber;
+	ctx->val_bytes = config->val_bits / 8;
+	ctx->compression = map_desc.bCompression;
+	ctx->max_transfer_size = max_transfer_size;
+	ctx->in_pipe = usb_rcvbulkpipe(usb, usb_endpoint_num(ep_in));
+	ctx->out_pipe = usb_sndbulkpipe(usb, usb_endpoint_num(ep_out));
+
+	if (ctx->compression & REGMAP_USB_COMPRESSION_LZ4) {
+		ctx->lz4_comp_mem = kmalloc(LZ4_MEM_COMPRESS, GFP_KERNEL);
+		if (!ctx->lz4_comp_mem) {
+			ret = -ENOMEM;
+			goto err_free;
+		}
+	}
+
+	ret = regmap_usb_alloc_transfers(ctx);
+	if (ret)
+		goto err_free;
+
+	ctx->ruif = regmap_usb_interface_get(interface);
+	if (IS_ERR(ctx->ruif)) {
+		ret = PTR_ERR(ctx->ruif);
+		goto err_free_transfers;
+	}
+
+	return ctx;
+
+err_free_transfers:
+	regmap_usb_free_transfers(ctx);
+err_free:
+	kfree(ctx->lz4_comp_mem);
+	kfree(ctx);
+
+	return ERR_PTR(ret);
+}
+
+struct regmap *__devm_regmap_init_usb(struct device *dev,
+				      struct usb_interface *interface,
+				      unsigned int index,
+				      const struct regmap_config *config,
+				      struct lock_class_key *lock_key,
+				      const char *lock_name)
+{
+	struct regmap_usb_context *ctx;
+	struct regmap *map;
+
+	ctx = regmap_usb_gen_context(interface, index, config);
+	if (IS_ERR(ctx))
+		return ERR_CAST(ctx);
+
+	map = __devm_regmap_init(dev, &regmap_usb, ctx, config,
+				 lock_key, lock_name);
+	if (!IS_ERR(map))
+		regmap_usb_debugfs_init(map);
+
+	return map;
+}
+EXPORT_SYMBOL(__devm_regmap_init_usb);
+
+static int regmap_usb_get_descriptor(struct usb_interface *interface, u8 type,
+				     u8 index, void *desc, size_t size)
+{
+	u8 ifnum = interface->cur_altsetting->desc.bInterfaceNumber;
+	struct usb_device *usb = interface_to_usbdev(interface);
+	u8 *buf;
+	int ret;
+
+	buf = kmalloc(size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = usb_control_msg(usb, usb_rcvctrlpipe(usb, 0),
+			      USB_REQ_GET_DESCRIPTOR,
+			      USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_INTERFACE,
+			      (type << 8) + index, ifnum, buf, size,
+			      USB_CTRL_GET_TIMEOUT);
+	if (ret < 0)
+		goto free;
+
+	if (ret != size || buf[0] != size || buf[1] != type) {
+		ret = -ENODATA;
+		goto free;
+	}
+
+	memcpy(desc, buf, size);
+free:
+	kfree(buf);
+
+	return ret;
+}
+
+/**
+ * regmap_usb_get_interface_descriptor() - Get regmap interface descriptor
+ * @interface: USB interface
+ * @num_regmaps: Returns the number of regmaps supported on this interface
+ *
+ * Returns:
+ * Zero on success, negative error code on failure.
+ */
+int regmap_usb_get_interface_descriptor(struct usb_interface *interface,
+					unsigned int *num_regmaps)
+{
+	struct regmap_usb_interface_descriptor desc;
+	int ret;
+
+	ret = regmap_usb_get_descriptor(interface, REGMAP_USB_DT_INTERFACE, 0,
+					&desc, sizeof(desc));
+	if (ret < 0)
+		return ret;
+
+	*num_regmaps = desc.bNumRegmaps;
+
+	return 0;
+}
+EXPORT_SYMBOL(regmap_usb_get_interface_descriptor);
+
+/**
+ * regmap_usb_get_map_descriptor() - Get regmap descriptor
+ * @interface: USB interface
+ * @index: Index of register
+ * @desc: Returned descriptor (little endian representation)
+ *
+ * Returns:
+ * Zero on success, negative error code on failure.
+ */
+int regmap_usb_get_map_descriptor(struct usb_interface *interface,
+				  unsigned int index,
+				  struct regmap_usb_map_descriptor *desc)
+{
+	int ret;
+
+	ret = regmap_usb_get_descriptor(interface, REGMAP_USB_DT_MAP, index,
+					desc, sizeof(*desc));
+	if (ret < 0)
+		return ret;
+
+	if (desc->name[31] != '\0')
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL(regmap_usb_get_map_descriptor);
+
+MODULE_LICENSE("GPL");
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index dfe493ac692d..c25ae1a98538 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -32,6 +32,7 @@ struct regmap_range_cfg;
 struct regmap_field;
 struct snd_ac97;
 struct sdw_slave;
+struct usb_interface;
 
 /* An enum of all the supported cache types */
 enum regcache_type {
@@ -618,6 +619,12 @@ struct regmap *__devm_regmap_init_sdw(struct sdw_slave *sdw,
 				 const struct regmap_config *config,
 				 struct lock_class_key *lock_key,
 				 const char *lock_name);
+struct regmap *__devm_regmap_init_usb(struct device *dev,
+				      struct usb_interface *interface,
+				      unsigned int index,
+				      const struct regmap_config *config,
+				      struct lock_class_key *lock_key,
+				      const char *lock_name);
 struct regmap *__devm_regmap_init_slimbus(struct slim_device *slimbus,
 				 const struct regmap_config *config,
 				 struct lock_class_key *lock_key,
@@ -971,6 +978,22 @@ bool regmap_ac97_default_volatile(struct device *dev, unsigned int reg);
 	__regmap_lockdep_wrapper(__devm_regmap_init_sdw, #config,	\
 				sdw, config)
 
+/**
+ * devm_regmap_init_usb() - Initialise managed register map
+ *
+ * @dev: Parent device
+ * @interface: USB interface
+ * @index: Index of register
+ * @config: Configuration for register map
+ *
+ * The return value will be an ERR_PTR() on error or a valid pointer
+ * to a struct regmap. The regmap will be automatically freed by the
+ * device management code.
+ */
+#define devm_regmap_init_usb(dev, interface, index, config)		\
+	__regmap_lockdep_wrapper(__devm_regmap_init_usb, #config,	\
+				dev, interface, index, config)
+
 /**
  * devm_regmap_init_slimbus() - Initialise managed register map
  *
diff --git a/include/linux/regmap_usb.h b/include/linux/regmap_usb.h
new file mode 100644
index 000000000000..e28d5139a53c
--- /dev/null
+++ b/include/linux/regmap_usb.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2020 Noralf Trønnes
+ */
+
+#ifndef __LINUX_REGMAP_USB_H
+#define __LINUX_REGMAP_USB_H
+
+#include <linux/types.h>
+#include <uapi/linux/usb/ch9.h>
+
+struct usb_interface;
+
+#define REGMAP_USB_MAX_MAPS	255
+
+#define REGMAP_USB_DT_INTERFACE		(USB_TYPE_VENDOR | 0x01)
+#define REGMAP_USB_DT_MAP		(USB_TYPE_VENDOR | 0x02)
+
+/**
+ * struct regmap_usb_interface_descriptor - Regmap interface descriptor
+ * @bLength: Size of descriptor in bytes
+ * @bDescriptorType: DescriptorType (REGMAP_USB_DT_INTERFACE)
+ * @wNumRegmaps: Number of regmaps on this interface
+ */
+struct regmap_usb_interface_descriptor {
+	__u8 bLength;
+	__u8 bDescriptorType;
+
+	__u8 bNumRegmaps;
+} __packed;
+
+/**
+ * struct regmap_usb_map_descriptor - Regmap descriptor
+ * @bLength: Size of descriptor in bytes
+ * @bDescriptorType: DescriptorType (REGMAP_USB_DT_MAP)
+ * @name: Register name (NUL terminated)
+ * @bRegisterValueBits: Number of bits in the register value
+ * @bCompression: Supported compression types
+ * @bMaxTransferSizeOrder: Maximum transfer size the device can handle as log2.
+ */
+struct regmap_usb_map_descriptor {
+	__u8 bLength;
+	__u8 bDescriptorType;
+
+	__u8 name[32];
+	__u8 bRegisterValueBits;
+	__u8 bCompression;
+#define REGMAP_USB_COMPRESSION_LZ4	BIT(0)
+	__u8 bMaxTransferSizeOrder;
+} __packed;
+
+#define REGMAP_USB_REQ_PROTOCOL_RESET	0xff	/* Returns previous error code as u8 */
+
+/**
+ * struct regmap_usb_header - Transfer header
+ * @signature: Magic value (0x2389abc2)
+ * @index: Index of adressed register
+ * @tag: Sequential transfer number
+ * @flags: Transfer flags
+ * @regnr: Register number
+ * @length: Transfer length
+ */
+struct regmap_usb_header {
+#define REGMAP_USB_HEADER_SIGNATURE	0x2389abc2
+	__le32 signature;
+	__le16 index;
+	__le16 tag;
+	__le32 flags;
+#define REGMAP_USB_HEADER_FLAG_IN	BIT(31)
+/* First 8 bits are the same as the descriptor compression bits */
+#define REGMAP_USB_HEADER_FLAG_COMPRESSION_MASK	0xff
+	__le32 regnr;
+	__le32 length;
+} __packed;
+
+/**
+ * struct regmap_usb_status - Transfer status
+ * @signature: Magic value (0x83e7b803)
+ * @index: Index of adressed register
+ * @tag: Sequential transfer number (the same as the one received in the header)
+ * @status: Status value of the transfer (Zero on success or a Linux errno on failure)
+ */
+struct regmap_usb_status {
+#define REGMAP_USB_STATUS_SIGNATURE	0x83e7b803
+	__le32 signature;
+	__le16 index;
+	__le16 tag;
+	__u8 status;
+} __packed;
+
+int regmap_usb_get_interface_descriptor(struct usb_interface *interface,
+					unsigned int *num_regmaps);
+int regmap_usb_get_map_descriptor(struct usb_interface *interface,
+				  unsigned int index,
+				  struct regmap_usb_map_descriptor *desc);
+
+#endif
-- 
2.23.0

