Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6100735BAE4
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 09:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236853AbhDLHh0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 03:37:26 -0400
Received: from mail-vi1eur05on2066.outbound.protection.outlook.com ([40.107.21.66]:35168
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236843AbhDLHhZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 03:37:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECQSQ5NMrcCCslUJ7KOEr98i4gHMzCDJ2R+aM3DRlUbVDCfJ4zdDuYQmiNzDLNUUhxKjqCgJmnUZnFoUQbyZEodmm8yw+a8nH6BmsCc0uKrNrjntBtHNhX89iaXdBKs3eWGSG/AcKopRc/PzjKUkxf7SqRPktgXpdWh3wQE1/k9aWJaFCmKcGthrcCuYwXi7uCYV32bhlsjRL/uuZxg/nrbc1tEHJ4HWS6r0Rp239iB2Q/XQJOfuxzzVE7pJ0CvbD26XcVYC01VMA66v09Ru7W52+I1cJBhceIOaWsjo0CdO71B+jyQAPNKSdDC/W8sxlgDhqDbacI5aMspz8T/+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhXYAqMqxBpTk88sILZ1iJ2zCY0W1/71emEmMheo+L0=;
 b=l1u+avpmituT787q9JGx9+08C5v1EeVaAH4vuCS0Zl7cvQe0Htds6MtWVoejlaBUAu+zAKSRoFud+Wn4lUGaWhvYnaZlUC2bSc7gNBjYUQgy41kvVhPF3x/B+FTF609xEo2HQHFWNALz3cG244haeR4CimnH8/Q7dNlktcPKLIA/DOIZfS+0eAIaf3OD0MILqhMx4kP8UdrfuSc6VfMBR2CvpgBleqCsjgf/M0fSBvPljTvsVRkyKEQEdp+B+0Dg7iLeVmJLKP8cn1/rklr5i/GZ13LDAd+kFMTBTUv9oS4Ukm9Z5A4oOsqq9vDM+is78aUAdOR/ifgLA/URrENUDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhXYAqMqxBpTk88sILZ1iJ2zCY0W1/71emEmMheo+L0=;
 b=SDClL92jcR0rTzPSEAggDM6g2ZZd+/80ZDt8PN928sanXxgcVeq3b5Bseg3fjB8fn1aNKLkU7fAouFvd505hSsN2FvmEs3gUISFMLIgYKurZ9nLWYkRTyega+Iu9KZssz+WuEkXodpgOLXqs0FYtaCnmTMuomR/imo9xuP8B6v8=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Mon, 12 Apr
 2021 07:37:04 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::801f:563a:65e:8d12]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::801f:563a:65e:8d12%6]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 07:37:04 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        mathias.nyman@intel.com
Cc:     peter.chen@kernel.org, jun.li@nxp.com, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 2/2] usb: host: xhci: add EH SINGLE_STEP_SET_FEATURE Test for USB2
Date:   Mon, 12 Apr 2021 15:22:14 +0800
Message-Id: <1618212134-20416-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618212134-20416-1-git-send-email-jun.li@nxp.com>
References: <1618212134-20416-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0006.apcprd03.prod.outlook.com
 (2603:1096:203:c8::11) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HKAPR03CA0006.apcprd03.prod.outlook.com (2603:1096:203:c8::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4042.8 via Frontend Transport; Mon, 12 Apr 2021 07:37:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 479c8625-ee28-401b-e61d-08d8fd85c46d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5935:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5935F46D359F8EB5992D345F89709@VI1PR04MB5935.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2QC+PhAQQ8GTRi8y1fW+JgZLiTSFkwSG8OQ/tpERkzMeoCxQHuP62FRxT2azH33gLk5OMXRFQY3g+G0eayLW7DA7nX5bV4DlS7tOp7wyMpwLMRbXuemQBd4AXGh0942J/75iYufKdvpwzTAwV0gf4w/mljjESonGowFKqddBqoREknibPqMUDvAqYgRv3UAALRIxvMHELMhv4BKDc/RPiiXJS2XU0UXvQdwDwZSQqhtdUyZZdSE8jsYwksY2R0eFfMYz3gRVZhmdiydYos8DIRA9ByFXZ7KphWj/OpX8u7a4awdAB5kW9dVGGEHpMJke5FmmP9LISAPBqpFlbha7laWn5i7ItJ+tl/FWsOUP1vju8RHTMT0jsymuu6YdagmTz3Vu2jspBPNZG00/GlIavU/iKgGnbsvuKk+IgyVpa7gvNH5e+2UbGLhAG3WUrunD8Noy64ozMgF2KBbWPjGLXhNOxCfIscA0x8zzn5mt4iwstyJA+G76xSYSU+cSP8Ha1C3ab3MjNRw3QZQfO2EUxWeGiV0Q/eqcdKy9xjvMySV5YinjqavikLcz/OSagzUctVQinrTsCDi98xsePsXNgLNN7+xGdtNy9wpWdC8oD+YyG2gHrxFRpb3kwY7/Tjn9A12S6+2hCkJS5P9hGy7rRgjhqvg6Y71lvpKCVk6sAlf4hP58xf7DRWw1k+9odaps
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(316002)(69590400012)(8936002)(38350700002)(8676002)(38100700002)(6512007)(4326008)(36756003)(5660300002)(66946007)(478600001)(16526019)(86362001)(186003)(66476007)(66556008)(52116002)(6506007)(83380400001)(6666004)(26005)(2616005)(956004)(2906002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OW6sJcdvS8fSXstlwByrAkQwr293xvJFmCpnNhF6yDp2r16X9uQBVqFpPCBe?=
 =?us-ascii?Q?gerkGVqlmIXtP6v7jDPIA8IepZgQIoj/1V51H5e4vDCgmbmV2VVlSxtvRL5T?=
 =?us-ascii?Q?u7BDN9v5R8jiSOkU4/HjgiZ4eRjAXgtPTN4T61PhHCqUrR8vzrbZR3vOeHHx?=
 =?us-ascii?Q?33F3CkM4demrHNXCHwJAKfonUfBSQg2C70423a6HeaAt/OEpAxzyGGkM1h8l?=
 =?us-ascii?Q?BaOY8gZmRX2tB5tw/pfQ2pX6EvZZM8xYOCVNE5c1a6BUzUZB6HnhE8tABdwn?=
 =?us-ascii?Q?JjPhIzWBJAWO+Dav7VzJgXJlCrwCIn1A1xleaO/ncaGmvYkZ2wz0cA9m8KGU?=
 =?us-ascii?Q?9Fdv3o8SPfiRUqyNf1a87U5uzQcZ9NnPiv6xrz9SZS02vFpLU/KEzcU7F2Li?=
 =?us-ascii?Q?Zyq0kWIfoPbBDF8g/cpPvAF6nc8TEicnncmbAVDHFeY5lbOEwKe/EnBtTOXe?=
 =?us-ascii?Q?Ipyb/nQgZLxUwp0LVJ9bp4JVQfVzWYZwfiuiB78ypM81A3cxuxUcWJqpWT22?=
 =?us-ascii?Q?exV1ii1XSMMpfbqF8Hmnc9Je4zJVAWr1N2z1h8JmrxbOyGT4NrQ6uiw1dR/h?=
 =?us-ascii?Q?NQW0jDw+mp+rjnf6lmA+NvCcea2KLy0XVXmVXjOVNZ+vqr8ts5elf4DG0wjw?=
 =?us-ascii?Q?MMayhAKNAkRqPuOBWq2hz7oceSLvx5tC+ZYql3wkRveMCW5RQyGaxASMNY/W?=
 =?us-ascii?Q?+MNJ4RwWSvWAOffmlV8xzMrNLR5eCP1j1OqPPi+Ltk5b2dB643SsSF/fqBHA?=
 =?us-ascii?Q?tvmcAa3mJklI6wfnf/OlvR/p9zyiKzqSSCce3ZsVap5Hku5JwBWK2XAa0dau?=
 =?us-ascii?Q?qe+nA1bGlshHZglmX08FJx8N+nWwDewzCUI+4jr+PP0hfF7rXVqooogJXEpL?=
 =?us-ascii?Q?OjC8xmnGsXvTNIvl/jPKsuZAzHlp9RuzwtR18dPt/rOHeK69K9vWF8Uafzdj?=
 =?us-ascii?Q?ooN2e6nwj5kKUFdQ93UNdVtRTE4R632yd/kKq0v6yv/wxt7MaKQEvRcmHmXN?=
 =?us-ascii?Q?2iesm56x9gse2B4N+0Fo2NpchRFlt9KrWImtKmA0zabjRZXhvmjYTuVOKqq6?=
 =?us-ascii?Q?hhiZvdbNvDUWB+fO9yMWMpG4tdpRr6CjnIJvsVH67d7OR+aRIxSpt/EP9hJY?=
 =?us-ascii?Q?9+RdU+I8FT+yvd8EpFy5pC4B9Cx10tIzjnJ1z0kuMUiWvd222Y7zBUqFBxCu?=
 =?us-ascii?Q?H8TXOneWTierNdU35tToBdwolxC4mq0TIiIRgzncmCYJ0+u7jLf+AomZ1EEu?=
 =?us-ascii?Q?0i7aIMK+45MPkFO0rMyRFDs3b+ODVb5q8J/4HoAf/fevL7nR+cQMxK4mycRa?=
 =?us-ascii?Q?vO+i+MZrdlLgKy51zqtDLJEj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 479c8625-ee28-401b-e61d-08d8fd85c46d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 07:37:04.4357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvRvVVAzGDDsy3//USqrFCUQikUzLjQMQjXRw16gbnODwDIjgdFkZSf+i8EOQco8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5935
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

This function is similar with EHCI's, but implemented using XHCI.
The USB2 host needs to send SETUP packet first, then wait 15
seconds before DATA (IN) + STATUS stage.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Jun Li <jun.li@nxp.com>
---
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
index 1eee60ac518f..8b63ee7fb299 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3797,6 +3797,129 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
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
index 5d9fc3cd07a5..13d95418db70 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5414,6 +5414,7 @@ static const struct hc_driver xhci_hc_driver = {
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

