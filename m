Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD5536F5B6
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 08:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbhD3GdT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 02:33:19 -0400
Received: from mail-eopbgr70078.outbound.protection.outlook.com ([40.107.7.78]:58595
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229482AbhD3GdS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Apr 2021 02:33:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNbxptyCntdvaagiBs2nttEHkhyOhsAsWJY/0YY7lCDhk8TYZQAgQtWIjpcoLR+Ze4ipz4Vh7tiPN+El61ZHPQ8aA6rcNFx1k1WVYGedVGx3rnf4RORJoKtGcLc4odpOMNVA+fggicc7jF8jmXKBRGOGPBhlBg/ikwY65uxZmOLeD74vcOKNLaLWHZt8MmIZlNWtiAzI/Mk0xqcRqb469XVXtT+bw/42iz/MTjKq3u4tZY3TFaU3qjYVG+cWZjUqa1dOVwvSed1x8C+rALooHtzWOaaqRvrhrBlncpAjisAjFRYV7++j+FUox2iq6h0HepkAo2cKt5ubLcrTp8aZMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCxdmpLnUiEHNQ4m9si3rwc6Xu8mNUMOd9I52pwm998=;
 b=CqxzYDZLsGdmpcXcYW6qnoJLR31Xki0agx3j2GBgduEKUEggkuQmD6P1logUJRa05FEluOlMt/HRU3UChsRKfftaZ78fv6yhnd9HsPMzWc2+utEHjeyYHPMttvBP3lvYC70u6n/1Cyy7TnH7xmup8QnGnbUUBnzRm/36VU1QoUUlHBWggo+BQYzxp20AhilfCcPU+8FvuTYQE65uQdnG0j6HEH3DqTLkoMEhjj62H7K5LPjRaWtpmOki7/5KezUPQyDNruwz5yOrGy3iZGkSdG7+PGjp4hS2xdPsY57sRyFToALxUv7pnQfXmplg49Mn5yxNSHMezAmzddiP0YvsYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCxdmpLnUiEHNQ4m9si3rwc6Xu8mNUMOd9I52pwm998=;
 b=nqA4TlrLU9ctoGrVzY+kkgq/JG3OHWJNFAgoV/rNk49LaApvOOjv6ozz/6v/41Mv1sKR8QkgHx99TOzmJrvBOvr17IPgWwkpNerVYgk6IlBjYPFb5UUK42LWGUZy9YPDhtMCBGJk88/i+nkDGeyBbnlfxqiQyS0VnEteUAmPIhg=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VE1PR04MB6749.eurprd04.prod.outlook.com (2603:10a6:803:129::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 30 Apr
 2021 06:32:26 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4065.032; Fri, 30 Apr 2021
 06:32:26 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        mathias.nyman@intel.com
Cc:     peter.chen@kernel.org, jun.li@nxp.com, jackp@codeaurora.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v2 2/3] usb: host: xhci: add EH SINGLE_STEP_SET_FEATURE Test for USB2
Date:   Fri, 30 Apr 2021 14:16:32 +0800
Message-Id: <1619763393-20029-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619763393-20029-1-git-send-email-jun.li@nxp.com>
References: <1619763393-20029-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0010.apcprd03.prod.outlook.com
 (2603:1096:203:c8::15) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HKAPR03CA0010.apcprd03.prod.outlook.com (2603:1096:203:c8::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4108.10 via Frontend Transport; Fri, 30 Apr 2021 06:32:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58b5242b-4410-46cb-bda7-08d90ba1b82e
X-MS-TrafficTypeDiagnostic: VE1PR04MB6749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6749C4406600284168DC24CF895E9@VE1PR04MB6749.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yw3WJ+mYPhpUxN7cI79nceUJH/difEgNfsHSvmsCiDfou3jgApEFby/DZMVcuGdvZN9VKvpOt+MD5AzHfnHJsxPBaVSUMjRnT229fG/oWbIqzoQ4w+ft2dBc6b9PixukZQ06CwlIFYLbKoRaPXUevnw/ASQUiVw/MpmGaXEvY3bM12+5sKIMa5bjEyb/eeM+gA/AZNpOXJvWOn9skRoV9wAul99cRk/aMRslc2JuS2koIO1K2CAt6zEQmSmq2Fn/SGsea6YFjh2tVN+EPxdDAboemaPXxieZRn4a3GOV/f/iKE0IMpWdynUb8o7fSPBwiHZ1mJigPEpLXZYfr+DhZyy/GTHCYG+ygTHqW7HHnM4eEBGBY+ksUv0qkmINQcicelu+QvC2TzbxLpMpqHS17J6ERTnC+2Rm8/Vm5GrQ1CQiDuUr7J6Jar3ZmNJRXde3yeo2dzUckymEz8BGOHsgHKY6kb9O2DN39JUzidlcTEGCfHsAEoLHQVc3N6T85yOeEE/OlzPu7BB6mEJ6KpukYCSO8KWra5jfp3RukbN2MRQAiUozq7EfXYCDIHgX+qhArf5C0hzxWV0PVdX5lxrpy++S28LdUsx/DlQwGz1Qm8QTrOwrENguY+/fIWD6L4DXkIevlZswyJIzIr4pXF+O0n9IyLoYPcLoljwpDnSbkQxBi9YT1e7iZo9Uu7P+j9xf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(376002)(136003)(396003)(346002)(478600001)(8676002)(2616005)(66476007)(36756003)(5660300002)(6666004)(86362001)(186003)(6486002)(8936002)(6512007)(2906002)(956004)(26005)(16526019)(52116002)(38350700002)(4326008)(83380400001)(66946007)(316002)(38100700002)(6506007)(66556008)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?v7yUslptwCDZeZB0QFDNJpPGncFX1s41hS2Z6zhVFC7YngaMqoy6x9FquTbC?=
 =?us-ascii?Q?FxONZNQX2El5hpITjQYRg/mzPa0MnUXwUh7sMI9afW5CS02HmUVPEEFEuQP4?=
 =?us-ascii?Q?NEy+kKSywH0bk1H48pmxqDmhrNjM8S5xzR6HKVLO9f/+P2AtZS1Acj36DloZ?=
 =?us-ascii?Q?U60ICUjTvxwQkum+a/x5jDUKuKlXSQSYdNeYtyE7y72iZsMfyVyMM/9Hce9V?=
 =?us-ascii?Q?9tAEKSH6VjOaJ9TtPXT4xQBaqM9X1NKY0yBGA0HhJMGaCWRd64ewLrO+NIu8?=
 =?us-ascii?Q?PmZYULBYed1FkFW8iu0mQk4TZHadrCPBqwkcIRSB0WU8yiwA2d+yV+ttmKK7?=
 =?us-ascii?Q?ffo0uSylJwEdgC9Ymd7VwgwqfL0xKl4YckTXtt0LE6SRqeeCwWiPCtEJZEJt?=
 =?us-ascii?Q?vQbo4p8y8rwlwT+GO3QFo3Lc7MOpAKzxSMmzA8E6euG27GAQ/XtEwF/hXpRY?=
 =?us-ascii?Q?JjhUMHWUnnLGEvRC+Nrcm8K481YHB/9C0unwxYZe0OfL1rY978pX+EkArySo?=
 =?us-ascii?Q?8f8lxFcWUc/4/7jIvHwCszkvm5UoudkUZ2XZH1XOXyGAucV98BCOZ/+I20pY?=
 =?us-ascii?Q?1mAPAcXfNxHt8l7Xwrd4EPc0Yr9W0X3q4tBLlF+9DW2cfHVWR/pT0TMdLkNE?=
 =?us-ascii?Q?NRwJ24igDkCM73XftTnx4d2HMmWH3wG2aJCoZ4VNrtXkhIeoqhHckf7lY5C6?=
 =?us-ascii?Q?Q4+LVmZ62gETSPj2NmWBSzGsp48KDcdM9tIr2mK4u8efFA2rUECJGEZ04skF?=
 =?us-ascii?Q?9+PzLZabkuMXP7ULbEPGxA17gIilrkISO/4c+gJCWVZgEFwnNJc5JkMHH7jf?=
 =?us-ascii?Q?n5J1V8qSD4nZUmYIiVhLTguDEVHRTlFuMxGjLsRBvqcBLhRG2rCYAMUf3UyB?=
 =?us-ascii?Q?dcwcbCQkNIko0t2CXXFMQ0rzbq377CbAHOvAP+iCpW9TxIfqls00kyxbyEc4?=
 =?us-ascii?Q?RPJuNAprzYtTcA6kYgS5ieIvohQlKvDFq8flvkWEI0pjhy/Co8BevkEf+eRM?=
 =?us-ascii?Q?bbKQreVewyeG0am+EWhUZPuHBT77G3iJIxIKDjBe3pAMcyauB27trU0Xap0h?=
 =?us-ascii?Q?jBo12opHc0fxKFzuOG03VhjyOIew4Oo7AS4Ride/nRiqMXAGD5r6zpGfO0Ee?=
 =?us-ascii?Q?63NErnod3xNGFW1jTTQvdVg0YK1qgwItC60zk+CvyOnY3wE/8nBv9xIC+Oq0?=
 =?us-ascii?Q?3Gb6wEJpfsnqtyz5KvFPwfYw7ZB6jac8Fi+/HRE9tZlCP5DCVj4FlomuUEe2?=
 =?us-ascii?Q?t8tWiwMPxyrw+BW1IPi/DqAJzHgQAK8eZcMKk9KbxjW8kefUw4XAGo/xjSav?=
 =?us-ascii?Q?gZQy8qEYZ64m3znZbmTV1/KG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b5242b-4410-46cb-bda7-08d90ba1b82e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 06:32:25.9056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LdkBhGb6Puodwn9FI1D9p5aKNQ0D6lsvUuE6w8qjNkPdP5OJK44wfuiVHEh5gIyi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6749
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

