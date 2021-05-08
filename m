Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD447376FD8
	for <lists+linux-usb@lfdr.de>; Sat,  8 May 2021 07:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhEHFvU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 May 2021 01:51:20 -0400
Received: from mail-eopbgr80044.outbound.protection.outlook.com ([40.107.8.44]:62119
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229481AbhEHFvT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 8 May 2021 01:51:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtCa3NZOZXppIzA/Jos00eD/vqRsQODCoIsE4MYVD3fJ06pouFTUotyotjdcNh1CZDy8LUQIf7kW09Lu+KN4KONDFXfdSB/CHa0zSpYIL3MkFcZo+aj+dZ+UaKE+/3+gfOqrWvkWQiOrjpPfX3kQkuU/WIITF9ouuHBbqxN2iBMfnJnNDpU28WrpvkuJX7Nid52xk5YULAxAFIjL0l8+nz2/cbbTFAA6F+7wNA5XDwiQ4IUMkw+b5NaD7Lxm5ksGJSnY+DXpVaKcC8L45SzvmIav8rMpiO1xvdp95oQe9K+HImKBorXlo/noJu/WKWzoxNm39/0WE7qoFjkM0DpK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHHT31ga4R0H9qZyQLw7kT1NFJaBBVJjscKuj/Kd7Fc=;
 b=k9TpS0xSEV1XRrGpzPp7Sa1F9uClgDCz2uGBkWuNy5Oj63bW9R//WrhOow2+Jmmtp4JMfcAAUeNx8IG+HEK5jiP+27efTDCaxUZyf6cyUk/2ou/UwWOHPec38ejMqrbbuwJJ1vhFA93bA+0WPcl9V2aoHpD1mxQyUWNo75Y/UHgOP8uA+Q1p9nrpm4nsJJG72fy9StWiwLLpzDVXPpSUzXUMnZl3lkYv8nCyAGrozmRJaGnV72426irUf3gKuOPmZjr/3/93UeLbYrDBQoIup892g/hR8efmAUYJ1x6O9RvRxRdwPQ9EIlX4isW48DFIh6NSGXaxm7gXtKwUabJfUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHHT31ga4R0H9qZyQLw7kT1NFJaBBVJjscKuj/Kd7Fc=;
 b=Pc/PUU7+JmgDJkDk08stHCksKBqs6sEIl1ga+QwkDBKZAvlsWklA5si76wOggQkS7CXjfAWn0AACpuhSFBXK75cn9pC1cbR5sqOrXEKZfmCjyoWzyu8vyIgWWNVj98VS83DswFuBL1dKAyPyr6QYXKWI95vMYkMDqYh5d4urJA8=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR0401MB2557.eurprd04.prod.outlook.com (2603:10a6:800:56::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.29; Sat, 8 May
 2021 05:50:17 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4108.029; Sat, 8 May 2021
 05:50:17 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        mathias.nyman@intel.com
Cc:     peter.chen@kernel.org, jun.li@nxp.com, jackp@codeaurora.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v4 2/3] usb: host: xhci: add EH SINGLE_STEP_SET_FEATURE Test for USB2
Date:   Sat,  8 May 2021 13:33:58 +0800
Message-Id: <1620452039-11694-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620452039-11694-1-git-send-email-jun.li@nxp.com>
References: <1620452039-11694-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG3P274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::21)
 To VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG3P274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4108.24 via Frontend Transport; Sat, 8 May 2021 05:50:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3aa58c6-be01-4be3-2360-08d911e5289a
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2557:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2557EAF4D27DDA8406536E1A89569@VI1PR0401MB2557.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1aUI+hijTxCfUTXGLJ5LAl5GnKDHUTbf9+R4nriA2ypnrat8XMecH13UdFHLSkYSaLcxrbITBUSPZwBouYe/CjhxFSu33Aiyb/eQNc1ojnQD03ROhy2gCL4kHrp9392i0AlS3uzsyTZekN5P6G3qRc1AR8lSaRSDmOa5zqH0IzIBnU0uzmd0jEHoq9WNVYOOASrjffmgj6z/J6qNJRgLLoMsuGa8lbvTYV+effLlFrTDlp5twJMP3Zr0qxl460moHt1vWPrik2FUc/fT9WwNWzpfTFnnxqLFMaTrK4zwU6TbbZDUQRLRtCwV+t5OIgXZT+7UsD1XdeyaIwWaLk2BYGXQ2lg3S5Q0m3EOyRxx5mQKfgNGefWV2ups1EVnrk/ZkuIJYStS93w4lteXd5uhZghRQ1X2Om9z1QMszCzQW/dO2o7RkbDUxpyCSZWpbWWK/YVSLSNKAB4d0V4dgYlMEecpAWTC4rgt6NCVr1O+mA3oHcqqf496LnQGPs29XlX9gmUpjEg2JU2C1ckozp90InTTv/s3pZuZoKp1/dCnIf6d/Gn30UjCMpImalsP62Wd4hC58KL+Azl6chOTRt9qQ+aXKR4uDm/lv3frwYUssgCyumGhQHXZmSljvlgG1q8u81dk2YUV8Ei07tGBEcyVizWRWKuVKYQ2LisTGmK/TF9gbvbzBCq0NqeBtWP63vSI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(2906002)(8936002)(52116002)(6506007)(4326008)(83380400001)(38350700002)(38100700002)(2616005)(66946007)(66476007)(66556008)(6666004)(956004)(8676002)(6512007)(16526019)(5660300002)(316002)(36756003)(478600001)(86362001)(186003)(6486002)(26005)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?oRtEbrGFWulCFZcPZutz1G2NEYzvkPcJ0nfFz+5jSuC9eDBA2LilY9C+T/wD?=
 =?us-ascii?Q?qZsig6e265pqiE6dTHPAWAEjq8rL/IcVFo0IUHfF9vh9RinyTmMty1yLDtaD?=
 =?us-ascii?Q?wC7xbxmaDb2tREqVLFxupr/XvFMSd9apZiE8yxuIcHNy6qGWunICev5BQfGR?=
 =?us-ascii?Q?3YbK+RVuJ4gf4rN8WpUnM2/UBpoQUKhDoBx383N3enywZkNvfhBnjxTVf97j?=
 =?us-ascii?Q?3fdNZFLx3vGIz9s4QFGuDFc+blyhi625jdhT0TjNud5bJVqJWM6u6Hr15sRp?=
 =?us-ascii?Q?kC+4iyVWox5ITZAe3wivmfDUWRmeuaTNpqeOg9SaIsmIUjfropZQsboFsny7?=
 =?us-ascii?Q?GKFVWZR/q1SwDk2U52tUEG+qDUPU2l2isJZml9zhQLkQGXcpLrG9UxXyAzPg?=
 =?us-ascii?Q?9LfOoCmwCSmdB+9WXS9M3quPTx9/sT7NrWnJrSC9hdkN/lgFn+QkF4ZqYIE6?=
 =?us-ascii?Q?BB93wH4sA5fr9umzolgl8B3eoiw5k/EkZZU/o64s6hQCXM28UkKWi3pDyKma?=
 =?us-ascii?Q?dFn+kLh0NjW0DpF1jvSQMV/G+kSfA5T+McLwaRiyrFZi+xAj5W6J597UuJTC?=
 =?us-ascii?Q?k2r43OOhjZIyNcMA3XHNSEBU3zZwuZ+SZ77spc/LI4PQji5E56A2fas6XJwv?=
 =?us-ascii?Q?2u00W8XRmo8f3I2GISjXaBER6/2ifgT7iZQLAT97hj1nIEOJYH8KYHz2w9ov?=
 =?us-ascii?Q?zaKutMaKEJjb9O+Mdw+xBEBgeBqK4Y2RLPB1vQY4Lj86lM/3PY5aeXHeP4Hi?=
 =?us-ascii?Q?SMLZzQc1E6MgIIfVLG+j0v6TenKIZC8Nlz39Q/oW6/F56jGEB+pQhfwQwVpN?=
 =?us-ascii?Q?2yAPemDVfvv80KCUnUAgR4+v/MYtqBNZTjnLsQgs2lHJ65JSTDIdtmMsDulA?=
 =?us-ascii?Q?qvxadrZOD3iYy5N69MG09BKO1f/Is/Uqd2g9qnUPUgro43SvyX9yr8sKfhAI?=
 =?us-ascii?Q?mHNpPRPJYjZEFnEoC2a6V8nOuQmlVkU1YW+G6TNyGped3+zzZK3VwPiRHsFR?=
 =?us-ascii?Q?YoljEAcC8oeLoOHT0OAOp4tLLc3z5lEAGnyZgO2FKimWUT9MSoMNTX9oNbVW?=
 =?us-ascii?Q?NJOoKJFdLX622m9dJriWDBLQRVGJMXBxsiaQ2yl3PuEmyXH5RXns5O4vHs0m?=
 =?us-ascii?Q?X4FJxwpwO8yV6DTZSF19weOvvF0tq8I5hEie5QxUZLVuLhzVKl32L3QAR2YM?=
 =?us-ascii?Q?Mxxx+JvX0rzQbvTRWrR8w2mTGEnJdqf3C2yQdjdqmKy7gxK8A7urr0hj6qC2?=
 =?us-ascii?Q?cakZoBYk4/W6JxPXTMGcQpabFKPA7axdXy4vcX6/KHzVaW+VMIlmT8iV/Zes?=
 =?us-ascii?Q?4bQf7KLnpNFBy92l5a47/GWD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3aa58c6-be01-4be3-2360-08d911e5289a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2021 05:50:17.8377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NkQxxmXwLLZjJVrlESMxluvs+oedzN1ovaBQbboyMyRc0JW+lCMhgJuC5fdyVI3n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2557
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
No change since v1.

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

