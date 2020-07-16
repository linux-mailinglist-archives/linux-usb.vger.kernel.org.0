Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 067E222229E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 14:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbgGPMkA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jul 2020 08:40:00 -0400
Received: from mail-eopbgr20053.outbound.protection.outlook.com ([40.107.2.53]:14902
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728619AbgGPMj7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Jul 2020 08:39:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMsN2tVbVYNHE+aKQ043jsfTvutmAXx30blLl3sAy+mJ6fkatjAw2+jnrmJCeTFs7DAHC96RstAS1DCm6OSSVhbvB1OoDtt4M3IF71Fy8ir/RNmDouYDqurwrC3ehU8/FQHeJ9OqEM3akPcpBGhA+Prm++exwqqHJee6LQdP/O+0qgfetpLedKBuIiUF7RsXTCYEidncZOewkC4CrDcFnLAw7wXJin1yn3SYEtImATpbuCftPypZiG1yj7SXKHuqU0fNGdzZSFrO/88wo2MLrZJa9Fds/zjW73/QPtxHNOWl5bwmhj3KrRs0Lo3QmVtzny48k9p6Y7CtC2NnpknxyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVFfSASvV3f0EKwKMeK62PV3f1VsuTxx5iNYt89uNHU=;
 b=duGwVObe8T6Pb3GswqtuQA9rMZQDLAwotDPjBs6TfS4WF4LLhf7q9muwL5AfzjRUiCPyrc/trgCu446VPflxqFlV0OZRjWy1lhTAJjXQz/rc5Hskc7+/jVl4JQRjGPFE/S19sopL/m+HWsTxXo5EvCZQz438wYIHOQEk7gwpWiXiPPXFJ4GUTm9SWvq2Di3kjGDlpSAiX/kP6/aqk0vfyMpw1TDnH6UTjQhVKMO4SdBwo6FWpkaopOY5xpJ/rC0d+11HBLKDqCs4LtWft03ZJf9Fh+FQow5+jkbreDBSCEnsIT11mSFyZJdbL/HYP0ApU/0hYf3KujeyJNL4FwA6BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVFfSASvV3f0EKwKMeK62PV3f1VsuTxx5iNYt89uNHU=;
 b=EMumx7ecAgj9wranI+z+1wjg2eb+HhUmTSdrMBK6+zxoQiW+8vFaRUQRBUKPXXcNJDPKJ8kxoqeY192SxIf0SnJG+KRn9kWBnRXBurSaImEI+b5/LGVZZA0jSZ2bHX8jZxEk6XWXZlom2UF6HqM7ofvAFNkfuGz3W2E5MbgBuqw=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB3279.eurprd04.prod.outlook.com (2603:10a6:802:3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Thu, 16 Jul
 2020 12:39:54 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e%7]) with mapi id 15.20.3174.025; Thu, 16 Jul 2020
 12:39:54 +0000
From:   Li Jun <jun.li@nxp.com>
To:     mathias.nyman@intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH v2] usb: xhci: add debugfs support for ep with stream
Date:   Thu, 16 Jul 2020 20:08:41 +0800
Message-Id: <1594901321-6992-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0096.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::22) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b47624-OptiPlex-7040.ap.freescale.net (119.31.174.71) by SG2PR01CA0096.apcprd01.prod.exchangelabs.com (2603:1096:3:15::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3195.18 via Frontend Transport; Thu, 16 Jul 2020 12:39:52 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 543b8f8a-2124-4950-c9e9-08d8298556e3
X-MS-TrafficTypeDiagnostic: VI1PR04MB3279:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB327957FAFCF436B39BC6AEBC897F0@VI1PR04MB3279.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:568;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hJ9PYaJ23BS8Nkgreypit6PfysEoDDJDYKL3MZP2HUs2CwTQqc6j9wKdLwuN7C0YmyXzjY/ZfQL7YiXrZrCcwwY1rtvNbi1SZxsUZtmvQWbUbuqATMahc34sy2gFrMh0TuXWsY+00LRJ2/rQ3SMXGARF3UBDZP7QDWoGZYr5b5nH7gxCwTu0t0tN6eTyOCK2sUX857xQITeoRV019HDBmk1hOiIEAcbUQWDd5J03O9N57KDqVXh8G7OEXVC493iimjSV2eZcjsblPxHaEnuO2tPzUgYZTC3LvEYeLYGIa4dvMP2y7AmIZnFZFWAXkVY5YETtSywFhXwiXo0AY9mJLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(36756003)(6512007)(6506007)(316002)(956004)(6486002)(6666004)(16526019)(2616005)(26005)(52116002)(5660300002)(2906002)(83380400001)(186003)(8936002)(4326008)(8676002)(6916009)(86362001)(66946007)(478600001)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: nmBKOuKhmYPB411jT1vD+6c7f4V/UT+/OLRNh9BLwy6F0MdkqNuUO55LtRsDKhZC/6464CGzFfgvfaEm4idhsCA6ZX6yiAL5a+8d1e3+CNiTzIz5ppaOKVexl3lUOWip1QV6oW2Mjbfe2yn+I6x66FnVDJCXhAh5mMnsWrml6SRS3U/cKcSiccAdUP8oqNdVDRXXd75eWeblIrHW7c6EKdAEQHQhu23njgW/wSwSgIBzGOcfGmh/4o1Vy8rBjXNID05vnY5uCUVfNLXTDkKTxavkcUZxW5UGYoSvYq40IK6yACt/S2IpmMKBbTp3/n+13+aBOHPPtR1RfwsUmc9Wzujm1XCBOtC12sqm3nCsXJl/0Av0BdNwgmAPu9KwFfl+TO5+oBVgxs752zGzxu4YcBWOLO2I8+YI6hOvMAFZw+85+NJTOFIK4EIeDn/Ai1hPqm4hsSO3u22NsRfh1L1plT2TRY5t+aPehGbfBL7aB08=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 543b8f8a-2124-4950-c9e9-08d8298556e3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 12:39:54.1761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2SC7eqsdRlyeGcW2UDXXqN5nlZT5n0lOvDpuh0qBe95xxS1EYazrH9+N/8vlaXku
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3279
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
chanages for v2:
-  Drop stream files remove, the stream files will be removed
   with ep dir removal, keep the ep but only remove streams
   actually does not make sense in current code. 
-  Use the new_ring for show_ring pointer for non-zero ep.

 drivers/usb/host/xhci-debugfs.c | 112 +++++++++++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci-debugfs.h |  10 ++++
 drivers/usb/host/xhci.c         |   1 +
 3 files changed, 122 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 65d8de4..708585c 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -450,9 +450,14 @@ void xhci_debugfs_create_endpoint(struct xhci_hcd *xhci,
 	if (!epriv)
 		return;
 
+	if (dev->eps[ep_index].ring)
+		epriv->show_ring = dev->eps[ep_index].ring;
+	else
+		epriv->show_ring = dev->eps[ep_index].new_ring;
+
 	snprintf(epriv->name, sizeof(epriv->name), "ep%02d", ep_index);
 	epriv->root = xhci_debugfs_create_ring_dir(xhci,
-						   &dev->eps[ep_index].ring,
+						   &epriv->show_ring,
 						   epriv->name,
 						   spriv->root);
 	spriv->eps[ep_index] = epriv;
@@ -474,6 +479,111 @@ void xhci_debugfs_remove_endpoint(struct xhci_hcd *xhci,
 	kfree(epriv);
 }
 
+static int xhci_stream_id_show(struct seq_file *s, void *unused)
+{
+	struct xhci_ep_priv	*epriv = s->private;
+
+	if (!epriv->stream_info)
+		return -EPERM;
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
index f7a4e24..f3348da 100644
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
index bee5dec..2d6584c 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3529,6 +3529,7 @@ static int xhci_alloc_streams(struct usb_hcd *hcd, struct usb_device *udev,
 		xhci_dbg(xhci, "Slot %u ep ctx %u now has streams.\n",
 			 udev->slot_id, ep_index);
 		vdev->eps[ep_index].ep_state |= EP_HAS_STREAMS;
+		xhci_debugfs_create_stream_files(xhci, vdev, ep_index);
 	}
 	xhci_free_command(xhci, config_cmd);
 	spin_unlock_irqrestore(&xhci->lock, flags);
-- 
2.7.4

