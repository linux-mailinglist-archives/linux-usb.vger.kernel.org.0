Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41EED376105
	for <lists+linux-usb@lfdr.de>; Fri,  7 May 2021 09:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbhEGHPT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 May 2021 03:15:19 -0400
Received: from mail-eopbgr80042.outbound.protection.outlook.com ([40.107.8.42]:37110
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230070AbhEGHPS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 May 2021 03:15:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwQ/2BwWCXr8H/d57FIMQ1LHCaMEZ271296Eqig99zX86Nddspo5tfI9iSOicDLk/tBa/x4m0xkRrETIlqpz1HAf6pLj6O5JdCojfIzYu8JX1a5LPk6ooKFIIBbZ1tmyBCUFLMwzOAKWbgJmiSaDfnnH8v6LTjTMc6OD+zEPtYGaZw2f2cwKf0atD/9TKv31DXqYf/CDg1OCzTllvq2dr9hKo0pd6AGDuRRlOv8FslA5eoGS1ff66jy/KQj5lnEUb5JDU33M9RTABJjvS+EN3C/eNe6VNPF730zQWfpGZg9lGKJTsN0gnUNFGg3zAzLmfPXOFolMECge9+S5VDu73Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alGqOi6XK/e5JZT00T5ei5LC+hGY25nAdhn1FrfytnU=;
 b=krnl974vmcyrj/uNhbkR6wcy3uo25tm0jkTTAb3baqjyfHqvHCbYqkgXjhzMsoIjgjD+lco5c/8/ubEBd0+rARsSb6VHwkG7kN+fxq9zget27vXSrlpIf5dF/xuYeWrSaSj1/Wyu98jgqNEjJxgRqD38akI8iBu7x5oA+KJqC507tV9mOype6i+3CJTArWtEmdXnV4uy0D4kVUym6tQZdOJGQ5aBFioD5iSr/hJp7Kagry9faJ74K5LpZUYH7hj9FihGdxpJujPKYKkCmX1Zfb4+Z+CkLBM0NxywKppCHntAA4SrkFNi0ftkyfnLL1etnWkHmMiy5GGy1C/Cu7X3aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alGqOi6XK/e5JZT00T5ei5LC+hGY25nAdhn1FrfytnU=;
 b=ITRH0dLhB9mpl0e/mQGLd86q+sMVxigsG0cmTvC8vknzg1MI7PAIMyHdO7rDj5+LFVrXKQefXhNgrApCAH+QKrVXZpcOcwL9djnbZSIJ0ZJRRhBVfVV7CQX0H1JV8gjQM3ttTaYqIyPB10GwvdkwIpRkWCs0+4TMd2wketOYp5Y=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR0401MB2639.eurprd04.prod.outlook.com (2603:10a6:800:58::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Fri, 7 May
 2021 07:14:16 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4108.029; Fri, 7 May 2021
 07:14:16 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        mathias.nyman@intel.com
Cc:     peter.chen@kernel.org, jun.li@nxp.com, jackp@codeaurora.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v3 2/3] usb: host: xhci: add EH SINGLE_STEP_SET_FEATURE Test for USB2
Date:   Fri,  7 May 2021 14:58:01 +0800
Message-Id: <1620370682-10199-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620370682-10199-1-git-send-email-jun.li@nxp.com>
References: <1620370682-10199-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0302CA0020.apcprd03.prod.outlook.com
 (2603:1096:3:2::30) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0302CA0020.apcprd03.prod.outlook.com (2603:1096:3:2::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4129.11 via Frontend Transport; Fri, 7 May 2021 07:14:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d30c453-d774-473d-a67d-08d91127b955
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2639:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2639F96F035CEBF3A231D95489579@VI1PR0401MB2639.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9nE/pWGlvbkRp1oiCWuEm4c9bvWSyMRnQdN5943xz+7aLOZRKZ9GA5hp4CprOo9xUhy+MBx8FGFVvRjxJ8/MTaRv4KLnhiwAV+XrgS+OgKiiJU1zKhQsT2l4pwN7vH5vE9/eQlgCvlW+QpfSic6KCwngunhnCJCZB2iaGkmmv19VbRtyKiV2JECPTUlxuqq7tZrFsm1FZ8209RYryPWSQVw0H0dGovnRWcboJxVD+7+WHDA9ZVMJwRFSEimF9OGPujoOFUDG7zdvLAJZLIWl0VUkI8VL8Vvnm9Ae6V5bZIpc6wUSyXiKMEXlsy6nJ60VtwIPjHETtCwIpQhtVxZGU7Y5uJT2b4JrsOjWZLevjzyGUEMu+YdPHOnK/dzZkfOw5o/AUdytY8iYHDSQd4daPJHjNAxbuZXVDSVzZHOglEzl9Nhuji4DGb3ThBbwVF1v+XHZjT+NGrD1jiuxB7OpNTghXmi884i3GZrXPMBleAWHwre8Hjkmi21gStulHUJXhIpBB5vwOWzc7Ga8+w3MzLBj6QcOZaVQVIBReT+26ZRxUUPd4uZZn2H/Xs6xEo2wQc0AUwXb7aYDvLbCfNLmXJnAB/8n9pmnL/b+IgiTbEPUV8UOPBmPBdoe87XkHA7vm03ZQCYerBOq8rUiQrQEEU14Ff3dN4Yhxu2bQhhpzPNVQt83gJwYbH8ILQjZ8Nma
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(956004)(2616005)(6512007)(66556008)(26005)(4326008)(66946007)(66476007)(478600001)(36756003)(38350700002)(316002)(86362001)(2906002)(38100700002)(83380400001)(6506007)(186003)(8936002)(5660300002)(8676002)(6666004)(6486002)(52116002)(16526019)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DY8ZSuElz8dMBZD/nueALRWDEWlXttUWvGAHy/fO/7WcTrQoDy8a4DhmP7nA?=
 =?us-ascii?Q?uVPg55lKel0ulFnnat6dN00Syuny4fzzYjqcEyY3gq7WsaEZQX3ip0kcZiKx?=
 =?us-ascii?Q?4scRU+z77IEtRex+6DqfhBRWFBMVP8WpmKwSml0uK5clxrEp92qlykSGXFda?=
 =?us-ascii?Q?UDukrV42P6JmqvF1i1HNjC9L2ReheJ8+HmO0/LeYaXPb8YR9SQnqMjLPzmFz?=
 =?us-ascii?Q?7cvk12HDOe7Rik41PtvBMyXbdxES5GQrHBVEGEWFOBJZnl7pX53Qn0uFoeDe?=
 =?us-ascii?Q?tjEbWmwivR1Hi+GeLKu7EO7ISqXMvIB/FjJX5ea+a5QU/CouLDWCu2fxTRXL?=
 =?us-ascii?Q?GgPKX7Y/NXOa8Q0NFvBnK65A5VXHY9XemdGRUTGoAKoNMbYWmpGl1UqJzgSf?=
 =?us-ascii?Q?zzQDaD/5mA0Naeqm5xFxZjBcHHe+9mKwWl6ez7y54Cx7RQqSKaxkMBPoNwI8?=
 =?us-ascii?Q?n3vp1xXyyFzH08AD4hQDRBvwYb07/fGdKprh7JWfPcLhMz4zeTjCYff4Srkl?=
 =?us-ascii?Q?ytTq7kyqBogvBuSAM/bdxVTKn7pDdlCa2EKsnsF5Enmf8aiRYCTxznLGSqe9?=
 =?us-ascii?Q?XsMuh/FAVkW3Ay8FlgUX9fRbFzvabC/kaZs8qEMigdxsss+KjCmvBLp3dq3Q?=
 =?us-ascii?Q?PdVeHZdYLfzKiJsAzBsQcCgVzM8Hr1NA1D+xZQa0DoPe8w6d6JGXILdfshW8?=
 =?us-ascii?Q?Q1hL3POHXGLnYWHyc5KHPU8dFilDKcw0c7bACY2Q7+oxy7mO7FbWiQjAyY1v?=
 =?us-ascii?Q?d74y9QU676P+mVxBPQaxcXGll1DL1CDOZwoAsTngwkJDdn7y8f6khdO/qSXW?=
 =?us-ascii?Q?y/ndxTqJ1jVxXcujm/QIs0Hvg2irGgQ1rqXH4Robs9d/wRRGeo/DAt4dVr1h?=
 =?us-ascii?Q?UDpoqj/dOTHE66WMbXW7sfOZDI1QXwavJTHaUr37UhIRAtzWlcrHmgXFtu7h?=
 =?us-ascii?Q?R3uMKu0iIQkQTsabrHMQYUg0AFVo4t9IUMZJa84ZYJVurV2+aPhdcQQPFpKC?=
 =?us-ascii?Q?ZFUe8B8lzK5tTwU22CYNEExZe8BUczeU/UH2ndyRf9OC4WJBVC8HOjjYVdd8?=
 =?us-ascii?Q?RNfOlpK8XtBwL3jgXtttQ1Bdo1nn3CjzMPLYqTZX+ao0noTtvjH0XXDwEloH?=
 =?us-ascii?Q?dh9ieBl4IQ092xqe2qXjDFH3dNXu7clEIJNx8fg7QLdKUm+qNmb92lDpsvhJ?=
 =?us-ascii?Q?Zo6Au64qjxRhqEAoJgMsABsuKLSc7dXA5SPcANcQz4Kp6LtCV5PRKwbwdr43?=
 =?us-ascii?Q?Xa0mQ/lFqYwz8af+kpgra4ZUD4v6eTE3Jm0EeI8PfHSOb6n4pVnZve9eYXDz?=
 =?us-ascii?Q?vMNH2CVI5kNn/L4iS4kYAKo/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d30c453-d774-473d-a67d-08d91127b955
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 07:14:16.2679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ogQKzeEEHmiNN14gy4A7UEd09x8l3OwrxYmX+YF/xiNdOwf5L3zk9UeZTaeqYpOB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2639
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

This function is similar with EHCI's, but implemented using XHCI.
The USB2 host needs to send SETUP packet first, then wait 15
seconds before DATA (IN) + STATUS stage.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
Change for v3:
- No change.

Change for v2:
- No change.

 drivers/usb/host/xhci-hub.c  |  10 +++
 drivers/usb/host/xhci-ring.c | 123 +++++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci.c      |   1 +
 drivers/usb/host/xhci.h      |  10 +++
 4 files changed, 144 insertions(+)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index e9b18fc17617..c64ee95cc89b 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1511,6 +1511,16 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			/* 4.19.6 Port Test Modes (USB2 Test Mode) */
 			if (hcd->speed != HCD_USB2)
 				goto error;
+
+#ifdef CONFIG_USB_HCD_TEST_MODE
+			if (test_mode == EHSET_TEST_SINGLE_STEP_SET_FEATURE) {
+				spin_unlock_irqrestore(&xhci->lock, flags);
+				retval = ehset_single_step_set_feature(hcd,
+								wIndex + 1);
+				spin_lock_irqsave(&xhci->lock, flags);
+				break;
+			}
+#endif
 			if (test_mode > USB_TEST_FORCE_ENABLE ||
 			    test_mode < USB_TEST_J)
 				goto error;
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 05c38dd3ee36..87a9c1e3325a 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3793,6 +3793,129 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	return 0;
 }
 
+#ifdef CONFIG_USB_HCD_TEST_MODE
+/*
+ * This function prepare TRBs and submits them for the
+ * SINGLE_STEP_SET_FEATURE Test.
+ * This is done in two parts: first SETUP req for GetDesc is sent then
+ * 15 seconds later, the IN stage for GetDesc starts to req data from dev
+ *
+ * is_setup : argument decides which of the two stage needs to be
+ * performed; TRUE - SETUP and FALSE - IN+STATUS
+ * Returns 0 if success
+ */
+int xhci_submit_single_step_set_feature(struct usb_hcd *hcd,
+	struct urb *urb, int is_setup)
+{
+	int slot_id;
+	unsigned int ep_index;
+	struct xhci_ring *ep_ring;
+	int ret;
+	struct usb_ctrlrequest *setup;
+	struct xhci_generic_trb *start_trb;
+	int start_cycle;
+	u32 field, length_field, remainder;
+	struct urb_priv *urb_priv;
+	struct xhci_td *td;
+	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
+
+	/* urb_priv will be free after transcation has completed */
+	urb_priv = kzalloc(sizeof(struct urb_priv) +
+			sizeof(struct xhci_td), GFP_KERNEL);
+	if (!urb_priv)
+		return -ENOMEM;
+
+	td = &urb_priv->td[0];
+	urb_priv->num_tds = 1;
+	urb_priv->num_tds_done = 0;
+	urb->hcpriv = urb_priv;
+
+	ep_ring = xhci_urb_to_transfer_ring(xhci, urb);
+	if (!ep_ring) {
+		ret = -EINVAL;
+		goto free_priv;
+	}
+
+	slot_id = urb->dev->slot_id;
+	ep_index = xhci_get_endpoint_index(&urb->ep->desc);
+
+	setup = (struct usb_ctrlrequest *) urb->setup_packet;
+	if (is_setup) {
+		ret = prepare_transfer(xhci, xhci->devs[slot_id],
+				ep_index, urb->stream_id,
+				1, urb, 0, GFP_KERNEL);
+		if (ret < 0)
+			goto free_priv;
+
+		start_trb = &ep_ring->enqueue->generic;
+		start_cycle = ep_ring->cycle_state;
+		/* Save the DMA address of the last TRB in the TD */
+		td->last_trb = ep_ring->enqueue;
+		field = TRB_IOC | TRB_IDT | TRB_TYPE(TRB_SETUP) | start_cycle;
+		/* xHCI 1.0/1.1 6.4.1.2.1: Transfer Type field */
+		if ((xhci->hci_version >= 0x100) ||
+				(xhci->quirks & XHCI_MTK_HOST))
+			field |= TRB_TX_TYPE(TRB_DATA_IN);
+
+		queue_trb(xhci, ep_ring, false,
+			  setup->bRequestType | setup->bRequest << 8 |
+			  le16_to_cpu(setup->wValue) << 16,
+			  le16_to_cpu(setup->wIndex) |
+			  le16_to_cpu(setup->wLength) << 16,
+			  TRB_LEN(8) | TRB_INTR_TARGET(0),
+			  /* Immediate data in pointer */
+			  field);
+		giveback_first_trb(xhci, slot_id, ep_index, urb->stream_id,
+				start_cycle, start_trb);
+		return 0;
+	}
+
+	ret = prepare_transfer(xhci, xhci->devs[slot_id],
+			ep_index, urb->stream_id,
+			2, urb, 0, GFP_KERNEL);
+	if (ret < 0)
+		goto free_priv;
+
+	start_trb = &ep_ring->enqueue->generic;
+	start_cycle = ep_ring->cycle_state;
+	field = TRB_ISP | TRB_TYPE(TRB_DATA);
+
+	remainder = xhci_td_remainder(xhci, 0,
+				   urb->transfer_buffer_length,
+				   urb->transfer_buffer_length,
+				   urb, 1);
+
+	length_field = TRB_LEN(urb->transfer_buffer_length) |
+		TRB_TD_SIZE(remainder) |
+		TRB_INTR_TARGET(0);
+
+	if (urb->transfer_buffer_length > 0) {
+		field |= TRB_DIR_IN;
+		queue_trb(xhci, ep_ring, true,
+				lower_32_bits(urb->transfer_dma),
+				upper_32_bits(urb->transfer_dma),
+				length_field,
+				field | ep_ring->cycle_state);
+	}
+
+	td->last_trb = ep_ring->enqueue;
+	field = TRB_IOC | TRB_TYPE(TRB_STATUS) | ep_ring->cycle_state;
+	queue_trb(xhci, ep_ring, false,
+			0,
+			0,
+			TRB_INTR_TARGET(0),
+			field);
+
+	giveback_first_trb(xhci, slot_id, ep_index, 0,
+			start_cycle, start_trb);
+
+	return 0;
+free_priv:
+	xhci_urb_free_priv(urb_priv);
+	return ret;
+}
+#endif /* CONFIG_USB_HCD_TEST_MODE */
+
 /*
  * The transfer burst count field of the isochronous TRB defines the number of
  * bursts that are required to move all packets in this TD.  Only SuperSpeed
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index ca9385d22f68..a27616775845 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5426,6 +5426,7 @@ static const struct hc_driver xhci_hc_driver = {
 	.disable_usb3_lpm_timeout =	xhci_disable_usb3_lpm_timeout,
 	.find_raw_port_number =	xhci_find_raw_port_number,
 	.clear_tt_buffer_complete = xhci_clear_tt_buffer_complete,
+	.submit_single_step_set_feature	= xhci_submit_single_step_set_feature,
 };
 
 void xhci_init_driver(struct hc_driver *drv,
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 2595a8f057c4..f93fc8f59af6 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2165,6 +2165,16 @@ int xhci_find_raw_port_number(struct usb_hcd *hcd, int port1);
 struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd);
 
 void xhci_hc_died(struct xhci_hcd *xhci);
+#ifdef CONFIG_USB_HCD_TEST_MODE
+int xhci_submit_single_step_set_feature(struct usb_hcd *hcd,
+	struct urb *urb, int is_setup);
+#else
+static inline int xhci_submit_single_step_set_feature(struct usb_hcd *hcd,
+	struct urb *urb, int is_setup)
+{
+	return 0;
+}
+#endif
 
 #ifdef CONFIG_PM
 int xhci_bus_suspend(struct usb_hcd *hcd);
-- 
2.25.1

