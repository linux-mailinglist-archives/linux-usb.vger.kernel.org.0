Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63D3221053
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 17:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbgGOPHa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 11:07:30 -0400
Received: from mail-eopbgr40084.outbound.protection.outlook.com ([40.107.4.84]:49923
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727939AbgGOPGs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Jul 2020 11:06:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EE9Mbhv3gd0qayBOdv4nOQv7cL4SgUOsYIF0cQL+X1BQnCiTwiYdhGvGEMjPSC6JK5x7H7/HUb1cgOrbJZF43tSlb3HTki4dzYe9rEULUNStJIYCDIWp9/FvRzfY/gyzAEAiY8kga7uVn0QbE95wMaTY2DDWx6l4A0+nr4s8NF9N7oV2RyaQU0xbe+yvqLYFqNykKLS17j7mohn4f91qxZk/R8d7M+4V/zawKHYH6WUKNd8ndcOFP1vEWP1TAu167ZDfxvDzfOT+ia5LgzodKh7+8hFaEZBqvecQvImcvcSp4GlbJ/SGLxneGiGVSTHev0qgiS8sFEHQUAZ6nAUwjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpKFDMOlTu0MzaFUsdU3/9jAYccimUwAVyeUB/tRuY0=;
 b=jJs8L92xt6VkUX3VDjkBAzAZV0Ozj7kVQmYsBesQlmg9P5FW59z88Ewjp7WDNlECy5ItFJHAdSrnquQ2lf9Nzbaz9DUK9BG9hMI90/r9KIIOOJzRrrE/uafpjE1wXzTqAJiJYcI45b+hhBpYrRx8r+avnuw9T/xHPPDRwEremTZMkDUM7/bz4pYr9qUvQa0YtX0guHjQYMszTPNPyT7Zin2E0vFWmuSuXXGKuroxwJk7H6RqfKsfbtikAjQbMGh3FtOa1XzLk/6aYh3wv4pBCsrWW+L0QNPPhvMUQmwW0prVJ4YGm9YGBf3CLTKybvfr0C/ICn968wdNq6x3C1XXBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpKFDMOlTu0MzaFUsdU3/9jAYccimUwAVyeUB/tRuY0=;
 b=ATbCNBPcM/H/RV/wca/oE4NnI+uCGEh8So5irbJnsBq818TbOazRwleTh2hE1MWAozSy8+XH2JyU36j7vwBqrkD0IdU31qUaxgkBDdRC1f8iDp6NZiZsvKSiCkBx+1TsMK/b7O+ljexQOd/lnOsMWWrY0ExDve0l9NlccECfiJ4=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0401MB2398.eurprd04.prod.outlook.com (2603:10a6:800:2a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Wed, 15 Jul
 2020 15:06:44 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e%7]) with mapi id 15.20.3174.025; Wed, 15 Jul 2020
 15:06:44 +0000
From:   Li Jun <jun.li@nxp.com>
To:     mathias.nyman@intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH] usb: xhci: add debugfs support for ep with stream
Date:   Wed, 15 Jul 2020 22:35:29 +0800
Message-Id: <1594823729-8165-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0119.apcprd03.prod.outlook.com
 (2603:1096:4:91::23) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b47624-OptiPlex-7040.ap.freescale.net (119.31.174.71) by SG2PR03CA0119.apcprd03.prod.outlook.com (2603:1096:4:91::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3195.9 via Frontend Transport; Wed, 15 Jul 2020 15:06:41 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 03f35a8d-743f-4840-ccf8-08d828d0af72
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2398:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2398C6817275402C06D6A1F9897E0@VI1PR0401MB2398.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:475;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I/ce+iGD585mNgreRumYGMzpMPy/ki1QGqRYRXfH/nUaqUQjn6uEwMWOFO/XOP5qRrR+P5EpswwlUkNpGWPv0qKM+2sZKIpTh6ychGQzyZBqX1rXmA4Qzf1vNKOcgZYv7zD3RVnGHHG6dhJUcVvGRDUcX5vxVhmJxa14Fqao8KhI2btN0j09jgxwrVm8/GJtTmfCcs0rYZWwKetXW2jz5eLQWdzlW8m9ibPkNx/pPVZLYQSWgpYBMwDBxr5PeEAp1k7KiBf6HKwtM5enTnGeby7zESpWCHHbxiBKeGUYZ8mTvFcKBlDMm3nuO8NTOsuivXhDd+bBj2bFMJpGGuMbCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(6486002)(8676002)(83380400001)(8936002)(86362001)(16526019)(26005)(5660300002)(6512007)(186003)(6916009)(2906002)(36756003)(52116002)(956004)(6506007)(66946007)(66476007)(66556008)(478600001)(4326008)(2616005)(6666004)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: qrUb1kKUvaagOhEl60aOBhZuggzGwSrutdAJcKq2IctYXVrRDmQ/mN7kho7pnrUrdKh3rL7ZMfJsr1frwoN9O1LgHPwDmhTiLMO2SkkF6ZeyDuA4cMja5A0rwtfkBQAQ3naeGus81AK0gfrvuzXrOSjMY4G+9HYBjrdWsgE24UCZuZ2G2T4g/JFgrEf6zkDqkB6iUytKYomxl4OsmtxWTa1eBX8LAPcvHY+xU5sRna1f2hCUDCOhtJxLyZpJoIy+IiJUzFtCQeZUc4Oc/7rCLSKaWTEhqNdVw0it1iIPBDnCdOoIW1OGncgWAUX3nt91nf5PST3HbqyhJoiZAgiEslnRJj9c4ZbYaYSHotev1fBIsv6xWh6bXSvS/WSQhzuh2fHYo0bEPPiy2viNsNlrh39i+RcH9UL8ooqt7QbHTnbKHCEk2zqRzCwt4UYUricy+AU7D+v1lhDcXUQKLFVY2ZhCVuBEyQTTFEx58VZDN40=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f35a8d-743f-4840-ccf8-08d828d0af72
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2020 15:06:44.0057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPmdbKFwwWsJnAhrMK+V1dIV5mQCnLpNWxURuncS9qPqtgkSujc/ygwdbf5vCmOP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2398
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To show the trb ring of streams, use the exsiting ring files of bulk ep
to show trb ring of one specific stream ID, which stream ID's trb ring
will be shown, is controlled by a new debugfs file stream_id, this is to
avoid to create a large number of dir for every allocate stream IDs,
another debugfs file stream_context_array is created to show all the
allocated stream context array entries.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/host/xhci-debugfs.c | 117 +++++++++++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci-debugfs.h |  19 +++++++
 drivers/usb/host/xhci-mem.c     |   4 +-
 drivers/usb/host/xhci.c         |   4 ++
 4 files changed, 142 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 65d8de4..0e17c4b 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -450,9 +450,10 @@ void xhci_debugfs_create_endpoint(struct xhci_hcd *xhci,
 	if (!epriv)
 		return;
 
+	epriv->show_ring = dev->eps[ep_index].ring;
 	snprintf(epriv->name, sizeof(epriv->name), "ep%02d", ep_index);
 	epriv->root = xhci_debugfs_create_ring_dir(xhci,
-						   &dev->eps[ep_index].ring,
+						   &epriv->show_ring,
 						   epriv->name,
 						   spriv->root);
 	spriv->eps[ep_index] = epriv;
@@ -474,6 +475,120 @@ void xhci_debugfs_remove_endpoint(struct xhci_hcd *xhci,
 	kfree(epriv);
 }
 
+static int xhci_stream_id_show(struct seq_file *s, void *unused)
+{
+	struct xhci_ep_priv	*epriv = s->private;
+
+	seq_printf(s, "Supported stream IDs are 1 ~ %d, trb ring to be shown is for stream id %d\n",
+		   epriv->stream_info->num_streams - 1, epriv->stream_id);
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
+	seq_printf(s, "Allocated %d streams and %d stream context array entries\n",
+			epriv->stream_info->num_streams,
+			epriv->stream_info->num_stream_ctxs);
+
+	for (id = 0; id < epriv->stream_info->num_stream_ctxs; id++) {
+		stream_ctx = epriv->stream_info->stream_ctx_array + id;
+		dma = epriv->stream_info->ctx_array_dma + id * 16;
+		if (id < epriv->stream_info->num_streams)
+			seq_printf(s, "%pad stream id %d deq %016llx\n", &dma, id,
+				   le64_to_cpu(stream_ctx->stream_ring));
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
+	epriv->stream_ctx_dentry = debugfs_create_file("stream_context_array",
+					0444, epriv->root, epriv,
+					&xhci_stream_context_array_fops);
+
+	epriv->stream_id_dentry = debugfs_create_file("stream_id", 0644,
+					epriv->root, epriv,
+					&stream_id_fops);
+}
+
+void xhci_debugfs_remove_stream_files(struct xhci_hcd *xhci,
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
+	epriv->show_ring = dev->eps[ep_index].ring;
+	debugfs_remove(epriv->stream_ctx_dentry);
+	debugfs_remove(epriv->stream_id_dentry);
+}
+
 void xhci_debugfs_create_slot(struct xhci_hcd *xhci, int slot_id)
 {
 	struct xhci_slot_priv	*priv;
diff --git a/drivers/usb/host/xhci-debugfs.h b/drivers/usb/host/xhci-debugfs.h
index f7a4e24..d4d0af0 100644
--- a/drivers/usb/host/xhci-debugfs.h
+++ b/drivers/usb/host/xhci-debugfs.h
@@ -91,6 +91,11 @@ struct xhci_file_map {
 struct xhci_ep_priv {
 	char			name[DEBUGFS_NAMELEN];
 	struct dentry		*root;
+	struct dentry		*stream_ctx_dentry;
+	struct dentry		*stream_id_dentry;
+	struct xhci_stream_info *stream_info;
+	struct xhci_ring	*show_ring;
+	unsigned int		stream_id;
 };
 
 struct xhci_slot_priv {
@@ -113,6 +118,12 @@ void xhci_debugfs_create_endpoint(struct xhci_hcd *xhci,
 void xhci_debugfs_remove_endpoint(struct xhci_hcd *xhci,
 				  struct xhci_virt_device *virt_dev,
 				  int ep_index);
+void xhci_debugfs_create_stream_files(struct xhci_hcd *xhci,
+				      struct xhci_virt_device *virt_dev,
+				      int ep_index);
+void xhci_debugfs_remove_stream_files(struct xhci_hcd *xhci,
+				      struct xhci_virt_device *virt_dev,
+				      int ep_index);
 #else
 static inline void xhci_debugfs_init(struct xhci_hcd *xhci) { }
 static inline void xhci_debugfs_exit(struct xhci_hcd *xhci) { }
@@ -128,6 +139,14 @@ static inline void
 xhci_debugfs_remove_endpoint(struct xhci_hcd *xhci,
 			     struct xhci_virt_device *virt_dev,
 			     int ep_index) { }
+static inline void
+xhci_debugfs_create_steam_files(struct xhci_hcd *xhci,
+				struct xhci_virt_device *virt_dev,
+				int ep_index) { }
+static inline void
+xhci_debugfs_remove_stream_files(struct xhci_hcd *xhci,
+				 struct xhci_virt_device *virt_dev,
+				 int ep_index) { }
 #endif /* CONFIG_DEBUG_FS */
 
 #endif /* __LINUX_XHCI_DEBUGFS_H */
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 9764122..7ee8ae5 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -898,9 +898,11 @@ void xhci_free_virt_device(struct xhci_hcd *xhci, int slot_id)
 	for (i = 0; i < 31; i++) {
 		if (dev->eps[i].ring)
 			xhci_ring_free(xhci, dev->eps[i].ring);
-		if (dev->eps[i].stream_info)
+		if (dev->eps[i].stream_info) {
 			xhci_free_stream_info(xhci,
 					dev->eps[i].stream_info);
+			xhci_debugfs_remove_stream_files(xhci, dev, i);
+		}
 		/* Endpoints on the TT/root port lists should have been removed
 		 * when usb_disable_device() was called for the device.
 		 * We can't drop them anyway, because the udev might have gone
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index bee5dec..ca511a2 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -2846,6 +2846,7 @@ static void xhci_check_bw_drop_ep_streams(struct xhci_hcd *xhci,
 		xhci_free_stream_info(xhci, ep->stream_info);
 		ep->stream_info = NULL;
 		ep->ep_state &= ~EP_HAS_STREAMS;
+		xhci_debugfs_remove_stream_files(xhci, vdev, i);
 	}
 }
 
@@ -3529,6 +3530,7 @@ static int xhci_alloc_streams(struct usb_hcd *hcd, struct usb_device *udev,
 		xhci_dbg(xhci, "Slot %u ep ctx %u now has streams.\n",
 			 udev->slot_id, ep_index);
 		vdev->eps[ep_index].ep_state |= EP_HAS_STREAMS;
+		xhci_debugfs_create_stream_files(xhci, vdev, ep_index);
 	}
 	xhci_free_command(xhci, config_cmd);
 	spin_unlock_irqrestore(&xhci->lock, flags);
@@ -3638,6 +3640,7 @@ static int xhci_free_streams(struct usb_hcd *hcd, struct usb_device *udev,
 		 */
 		vdev->eps[ep_index].ep_state &= ~EP_GETTING_NO_STREAMS;
 		vdev->eps[ep_index].ep_state &= ~EP_HAS_STREAMS;
+		xhci_debugfs_remove_stream_files(xhci, vdev, ep_index);
 	}
 	spin_unlock_irqrestore(&xhci->lock, flags);
 
@@ -3823,6 +3826,7 @@ static int xhci_discover_or_reset_device(struct usb_hcd *hcd,
 			xhci_free_stream_info(xhci, ep->stream_info);
 			ep->stream_info = NULL;
 			ep->ep_state &= ~EP_HAS_STREAMS;
+			xhci_debugfs_remove_stream_files(xhci, virt_dev, i);
 		}
 
 		if (ep->ring) {
-- 
2.7.4

