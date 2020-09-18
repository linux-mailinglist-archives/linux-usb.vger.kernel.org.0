Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71CCC26FDFD
	for <lists+linux-usb@lfdr.de>; Fri, 18 Sep 2020 15:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgIRNOn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Sep 2020 09:14:43 -0400
Received: from mga09.intel.com ([134.134.136.24]:46076 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726438AbgIRNOn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Sep 2020 09:14:43 -0400
IronPort-SDR: yWdNevWn7opA84Y0fGqbj3IEgV7eHBPe+Qfd2atNfZB1S5nS8sOi5S9rjr8UWCZsOsZrJJhzCz
 KajlWg8qM/8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="160849978"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="160849978"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 06:14:41 -0700
IronPort-SDR: DlDxQZZkxnzXOl5GTc289RoEcSIiCsa438vWyKSiWgtwsbSf7DenU+Acu5E1zOYcT4DWpFYyki
 pf7PG9UZjceA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="508871214"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga005.fm.intel.com with ESMTP; 18 Sep 2020 06:14:40 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>, Li Jun <jun.li@nxp.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 10/10] usb: xhci: add debugfs support for ep with stream
Date:   Fri, 18 Sep 2020 16:17:52 +0300
Message-Id: <20200918131752.16488-11-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918131752.16488-1-mathias.nyman@linux.intel.com>
References: <20200918131752.16488-1-mathias.nyman@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

To show the trb ring of streams, use the exsiting ring files of bulk ep
to show trb ring of one specific stream ID, which stream ID's trb ring
will be shown, is controlled by a new debugfs file stream_id, this is to
avoid to create a large number of dir for every allocate stream IDs,
another debugfs file stream_context_array is created to show all the
allocated stream context array entries.

Signed-off-by: Li Jun <jun.li@nxp.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-debugfs.c | 109 +++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci-debugfs.h |  10 +++
 drivers/usb/host/xhci.c         |   1 +
 3 files changed, 119 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index c88bffd68742..2c0fda57869e 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -451,9 +451,11 @@ void xhci_debugfs_create_endpoint(struct xhci_hcd *xhci,
 	if (!epriv)
 		return;
 
+	epriv->show_ring = dev->eps[ep_index].ring;
+
 	snprintf(epriv->name, sizeof(epriv->name), "ep%02d", ep_index);
 	epriv->root = xhci_debugfs_create_ring_dir(xhci,
-						   &dev->eps[ep_index].ring,
+						   &epriv->show_ring,
 						   epriv->name,
 						   spriv->root);
 	spriv->eps[ep_index] = epriv;
@@ -475,6 +477,111 @@ void xhci_debugfs_remove_endpoint(struct xhci_hcd *xhci,
 	kfree(epriv);
 }
 
+static int xhci_stream_id_show(struct seq_file *s, void *unused)
+{
+	struct xhci_ep_priv	*epriv = s->private;
+
+	if (!epriv->stream_info)
+		return -EPERM;
+
+	seq_printf(s, "Show stream ID %d trb ring, supported [1 - %d]\n",
+		   epriv->stream_id, epriv->stream_info->num_streams - 1);
+
+	return 0;
+}
+
+static int xhci_stream_id_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, xhci_stream_id_show, inode->i_private);
+}
+
+static ssize_t xhci_stream_id_write(struct file *file,  const char __user *ubuf,
+			       size_t count, loff_t *ppos)
+{
+	struct seq_file         *s = file->private_data;
+	struct xhci_ep_priv	*epriv = s->private;
+	int			ret;
+	u16			stream_id; /* MaxPStreams + 1 <= 16 */
+
+	if (!epriv->stream_info)
+		return -EPERM;
+
+	/* Decimal number */
+	ret = kstrtou16_from_user(ubuf, count, 10, &stream_id);
+	if (ret)
+		return ret;
+
+	if (stream_id == 0 || stream_id >= epriv->stream_info->num_streams)
+		return -EINVAL;
+
+	epriv->stream_id = stream_id;
+	epriv->show_ring = epriv->stream_info->stream_rings[stream_id];
+
+	return count;
+}
+
+static const struct file_operations stream_id_fops = {
+	.open			= xhci_stream_id_open,
+	.write                  = xhci_stream_id_write,
+	.read			= seq_read,
+	.llseek			= seq_lseek,
+	.release		= single_release,
+};
+
+static int xhci_stream_context_array_show(struct seq_file *s, void *unused)
+{
+	struct xhci_ep_priv	*epriv = s->private;
+	struct xhci_stream_ctx	*stream_ctx;
+	dma_addr_t		dma;
+	int			id;
+
+	if (!epriv->stream_info)
+		return -EPERM;
+
+	seq_printf(s, "Allocated %d streams and %d stream context array entries\n",
+			epriv->stream_info->num_streams,
+			epriv->stream_info->num_stream_ctxs);
+
+	for (id = 0; id < epriv->stream_info->num_stream_ctxs; id++) {
+		stream_ctx = epriv->stream_info->stream_ctx_array + id;
+		dma = epriv->stream_info->ctx_array_dma + id * 16;
+		if (id < epriv->stream_info->num_streams)
+			seq_printf(s, "%pad stream id %d deq %016llx\n", &dma,
+				   id, le64_to_cpu(stream_ctx->stream_ring));
+		else
+			seq_printf(s, "%pad stream context entry not used deq %016llx\n",
+				   &dma, le64_to_cpu(stream_ctx->stream_ring));
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(xhci_stream_context_array);
+
+void xhci_debugfs_create_stream_files(struct xhci_hcd *xhci,
+				      struct xhci_virt_device *dev,
+				      int ep_index)
+{
+	struct xhci_slot_priv	*spriv = dev->debugfs_private;
+	struct xhci_ep_priv	*epriv;
+
+	if (!spriv || !spriv->eps[ep_index] ||
+	    !dev->eps[ep_index].stream_info)
+		return;
+
+	epriv = spriv->eps[ep_index];
+	epriv->stream_info = dev->eps[ep_index].stream_info;
+
+	/* Show trb ring of stream ID 1 by default */
+	epriv->stream_id = 1;
+	epriv->show_ring = epriv->stream_info->stream_rings[1];
+	debugfs_create_file("stream_id", 0644,
+			    epriv->root, epriv,
+			    &stream_id_fops);
+	debugfs_create_file("stream_context_array", 0444,
+			    epriv->root, epriv,
+			    &xhci_stream_context_array_fops);
+}
+
 void xhci_debugfs_create_slot(struct xhci_hcd *xhci, int slot_id)
 {
 	struct xhci_slot_priv	*priv;
diff --git a/drivers/usb/host/xhci-debugfs.h b/drivers/usb/host/xhci-debugfs.h
index 56db635fcd6e..7c074b4be819 100644
--- a/drivers/usb/host/xhci-debugfs.h
+++ b/drivers/usb/host/xhci-debugfs.h
@@ -91,6 +91,9 @@ struct xhci_file_map {
 struct xhci_ep_priv {
 	char			name[DEBUGFS_NAMELEN];
 	struct dentry		*root;
+	struct xhci_stream_info *stream_info;
+	struct xhci_ring	*show_ring;
+	unsigned int		stream_id;
 };
 
 struct xhci_slot_priv {
@@ -113,6 +116,9 @@ void xhci_debugfs_create_endpoint(struct xhci_hcd *xhci,
 void xhci_debugfs_remove_endpoint(struct xhci_hcd *xhci,
 				  struct xhci_virt_device *virt_dev,
 				  int ep_index);
+void xhci_debugfs_create_stream_files(struct xhci_hcd *xhci,
+				      struct xhci_virt_device *virt_dev,
+				      int ep_index);
 #else
 static inline void xhci_debugfs_init(struct xhci_hcd *xhci) { }
 static inline void xhci_debugfs_exit(struct xhci_hcd *xhci) { }
@@ -128,6 +134,10 @@ static inline void
 xhci_debugfs_remove_endpoint(struct xhci_hcd *xhci,
 			     struct xhci_virt_device *virt_dev,
 			     int ep_index) { }
+static inline void
+xhci_debugfs_create_stream_files(struct xhci_hcd *xhci,
+				 struct xhci_virt_device *virt_dev,
+				 int ep_index) { }
 #endif /* CONFIG_DEBUG_FS */
 
 #endif /* __LINUX_XHCI_DEBUGFS_H */
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e88f4f953995..482fe8c5e3b4 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3533,6 +3533,7 @@ static int xhci_alloc_streams(struct usb_hcd *hcd, struct usb_device *udev,
 		xhci_dbg(xhci, "Slot %u ep ctx %u now has streams.\n",
 			 udev->slot_id, ep_index);
 		vdev->eps[ep_index].ep_state |= EP_HAS_STREAMS;
+		xhci_debugfs_create_stream_files(xhci, vdev, ep_index);
 	}
 	xhci_free_command(xhci, config_cmd);
 	spin_unlock_irqrestore(&xhci->lock, flags);
-- 
2.17.1

