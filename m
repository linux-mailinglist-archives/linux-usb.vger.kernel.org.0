Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D62726B90F
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 02:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgIPAzr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 20:55:47 -0400
Received: from mail-eopbgr30045.outbound.protection.outlook.com ([40.107.3.45]:5518
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726314AbgIOLa2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Sep 2020 07:30:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdC1rNS56godu0DNp4FG4kCXbLQJwN/IjKAG1zSjuMcokGvID4DMvof5lzDpuAXB2mTXqvYKAcs7LLZT/ORl+AHfQZCT7sTAHoMX5y9+TW7i0iMgorr/Hzam58dOde2dIklEVHGBS58hf8GubXZ+ZnOcT4lxruTiLGZ5qqtJJb+vSmifHdg3nPsrHHqrtmtdWUmjixtOgSExm3o0qJXKZcHcQDu2p8QxPM42DR26LUhc/IUPrkaXWZw28gy08e7pP8bz7/dsqTwBRQ2LO/+VrGJc0NY8acEF/lOE4GUWyEgyJ9lEpCg9tLwqdN6ZlO0tXWoMNFqDnPg6Zz2jLr9Yiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=818BGAW3i3vkSLnkctR3JRn6gIYnQTB8TNpeDgkvIho=;
 b=GaebiXctzBg7EJleEcL8ujV9P5HICnaDSw9SlvZco3+MpZUGm6eLmBInFYIJrPruuDL3CTXijc/ckHL2lB5q2hhD0maR2pJ8z0/LwN+jnpecBOw+Smfg2jSVU8FBq8KVy8hHj5CEw0hSKsIeGFGuUdFPT9gw91jCrH0o60vgFHeSN3xT+C6LfzNLBr9xS9Diy6Zfb8UZPRXCRgdk/N0xRzz+sUw9Otg3hEyQD0Rv5SGkxOZwHxp2auyBu0kFLbm6HgEL1iEU0D6l1HDdSngR6BCkH6cuZAIh3dk244C65Q7AEzIZK4DXtrjj02pl3tOgHE5MUkOtL0Zk18uB1x+l9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=818BGAW3i3vkSLnkctR3JRn6gIYnQTB8TNpeDgkvIho=;
 b=bbpNNdKtROKFHXuVLGTQ1Ajr+VcFvtmVj8oQmEj31drHA0F1+J4gN5rob+yEc6XGRkquZS8AiV8eHtC9oebdv8hAcGmV9nKQB6zdkSeocSWsX6EPqDBQuJTplDTs1yF8sOmhVAvwaPzFr1vSjnyNcQ958LSZ5z/guDY3+kLuLZw=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB7278.eurprd04.prod.outlook.com (2603:10a6:800:1b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 11:29:34 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 11:29:33 +0000
From:   Li Jun <jun.li@nxp.com>
To:     mathias.nyman@intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH v3] usb: xhci: add debugfs support for ep with stream
Date:   Tue, 15 Sep 2020 19:22:47 +0800
Message-Id: <1600168967-28675-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0145.apcprd03.prod.outlook.com
 (2603:1096:4:c8::18) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 10.192.242.69 (119.31.174.67) by SG2PR03CA0145.apcprd03.prod.outlook.com (2603:1096:4:c8::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3391.11 via Frontend Transport; Tue, 15 Sep 2020 11:29:32 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b100d4f3-bc7b-418c-fe05-08d8596a9e8f
X-MS-TrafficTypeDiagnostic: VE1PR04MB7278:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7278DE8BA8E1D55607AE2A9589200@VE1PR04MB7278.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:105;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ELQAN2bKlJNNBD7MGoJ/RHBFK5nI8ZzN8vAChV/KYx2HzySV+opKscMAwa6lM3pfaRwP8fPcZOywIslnjm00Tcu1q2SWMZqW4xoOPEYKEoDRpkj+PRb0BN/AtP5nOpWp5HpsFQ2SsZDJe8JxYRa2WxGX+S8wtkxcqg7vrQE735jppjJ7K9qxLVziL/D+bc6HTQ2aKJid4W8h0KTPUhUL6phl6UlvtkM4K0uKkMWENz8syJ8js5lVXwNxwJe1yhcqqIcAcxoCT2W2uf+q0XqPfQWbZk4Y46xm/qZtqwgTWtQazUVnlE+BGxPZoxErn+1GCptyJeItum1lx6tglkME3Bgmhx0YLcnTQJnoyhbTnpjrIfxZ2O9yyMG1E622c9pn1XCaNXWecb617zQdCKda8sa1P2jwM0eK8Tb0v7UVcY1Va9SttdDA2we3JNFDcXf8R0Ubbk2KcI9ClperZPFVsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(6916009)(8676002)(52116002)(66556008)(66946007)(66476007)(2906002)(6666004)(83380400001)(86362001)(186003)(16526019)(966005)(8936002)(26005)(36756003)(4326008)(6486002)(16576012)(316002)(956004)(478600001)(5660300002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: FoVweY1Tt0dNEj+k3ThZeW2hTc+PHob1ScXDR9PpfqCf1LbMD2LJ1z4ZYEYSs8A7B/OvFdskZWeCxOMv9sKfWgNtRX3tGIjaw8D+OBrwh03tBLXw6pJmWjZtXEX1lhoD8Gy41aBsbKfZMW1ZLT2WtW7UG1XUv8JB74VQOOu7ybVwACTStAuki97iHkfhnVf1NW9CsVD3ZH0ZSTlAFGz5adHCEs0INTrmqtAl5I3/wM/S8s3cssYWQt+pDlYAwhcMpuqw1wEYzsbxmLmGzA8Zoo++VEZL8vuXpseCFudYSk277nFzn9w67vone15xNqe/LhHSOkdYVNhE9e8jb49DvlXBfpZi6fVSLN11KA7HRIHXU5svP9sWSv0ceOgRz9wMAhtE13EYDekYXILGhRh/xUHBW3xPOT/2TvozbVHcfd4egRNL+ZYoQUR6gq/n953eg11ZXCEMFu11sTxxyQNvxYPl5Y7pVOMQMkQYtpwo7ouToMS9CklaMfYhbMUYvLm4pBtMHHmL/ox/oTheRU4drrZF4qzDp1dS2ZbDb+UUjBxBnbq5PTcOovrsTWqCRez4ahLy1gS+MT/NcS8K8Ra72MvHFwFEHYjbbImKXYCpRIaMPT2cMB8dFjJBDmwOZTiq/FBkDYAKsRJ5V8ESc+N5Uw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b100d4f3-bc7b-418c-fe05-08d8596a9e8f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 11:29:33.7535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hTgpQ+TZreGMI1/zGuJoRzt5rHoVvEz+xjtSOH9rmRxd52lJvRgdCMcokw2OpYO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7278
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
changes for v3:
-  Remove check of eps[i].ring and eps[i].new_ring, use eps[i].ring
   as target ring addr, as Mathias's patch[1] makes sure endpoint is
   enabled and ring pointer is set correctly before we call
   xhci_debugfs_create_endpoint().
   [1] https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?h=for-usb-linus&id=cf99aef5624a592fd4f3374c7060bfa1a65f15df
-  Improve the stream_id show format as suggested by Mathias. 

chanages for v2:
-  Drop stream files remove, the stream files will be removed
   with ep dir removal, keep the ep but only remove streams
   actually does not make sense in current code. 
-  Use the new_ring for show_ring pointer for non-zero ep.

 drivers/usb/host/xhci-debugfs.c | 109 +++++++++++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci-debugfs.h |  10 ++++
 drivers/usb/host/xhci.c         |   1 +
 3 files changed, 119 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 352003b..3927edb 100644
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
index 56db635..7c074b4 100644
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
index 3c41b14..5909fc2 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3530,6 +3530,7 @@ static int xhci_alloc_streams(struct usb_hcd *hcd, struct usb_device *udev,
 		xhci_dbg(xhci, "Slot %u ep ctx %u now has streams.\n",
 			 udev->slot_id, ep_index);
 		vdev->eps[ep_index].ep_state |= EP_HAS_STREAMS;
+		xhci_debugfs_create_stream_files(xhci, vdev, ep_index);
 	}
 	xhci_free_command(xhci, config_cmd);
 	spin_unlock_irqrestore(&xhci->lock, flags);
-- 
2.7.4

