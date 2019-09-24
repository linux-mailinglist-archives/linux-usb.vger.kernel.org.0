Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F38E5BC429
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2019 10:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440628AbfIXIgZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Sep 2019 04:36:25 -0400
Received: from mail-eopbgr140045.outbound.protection.outlook.com ([40.107.14.45]:35606
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2439052AbfIXIgY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Sep 2019 04:36:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSqu6p8EgNmMrPZldzn+QTdNvIRWTgjifL+as+TqITmVVZNLKy7eJbYu5DiuYIql5XCMuw34cb5lV05DleJrnHgX5iQpihZ1Jz5UzqRE8m3Nshc6kpNP0+wy55hLUNi8sprLC6zQ4NrUpkN0Eev4Mu+CAVz0y7mjaS3VULEHuvt2Z6XYZiuPGsCkfUyXlIYIv8Auc2VoxXtOEzYCpgfDzBX6NxZvww2lGKrObh4FFcuKyQLntO9ErnvpBCDkspBUhYIbDZtyQMxpfpzzz2ugNPdcB+WIyxzF6lNQgOUmSUUpuY4nP7bXO8P2XwX6bRojCPYiFITF4W2djpLxszm7Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+riSyZhNx/KQJu4ryDVcMh3iI5DlFY13LY/4cxTed8o=;
 b=nMjdzgcuNR2WJlE03X9flmDJz28YfAboKjqrqJMQKp5x5SWytHwoA+EkMgA00+qAkgSXqSFaq1nKuJ2oNVcOOdyK6Gr9+6GgaObqE75RKHqIpGNicB5HJ5Tz4kzg8wPTkF6JH2HNnyfpWzF/vTJVzgO7QoK3A7bi/Tho+eStrb3GQoWz7dIzm0Pw3UwQ1TYAhyXvYPFnEjn9GIaLonLcBnpUnOJjcP7qQWbC+BWBDtzNT5w5LInAAE6xj7QxOzbPj6JuCEKB49OTlqBGxWsbE5l3+JTL4o4EV+MEJ+ARdOKu/ksQIn0RwT+6spshAuF9EtPhBm1CuJrq2cDafjFaIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+riSyZhNx/KQJu4ryDVcMh3iI5DlFY13LY/4cxTed8o=;
 b=AsCg/gF/XPWUgNc+dJ7bhTZeQLkIAwzUKUeIkSEixL5UrZ/GitmyomrXN0azrUjJDco2fLfq+kwBf5kIczKQW2vZSCLXUOcMcv71T+tG0Kw092Jtcm0+aX5iRUgZgO0ET1aQMMUl9fjNl2sq3YC7b7IuNbXUarV1t1FcBwyFV0I=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB4733.eurprd04.prod.outlook.com (20.177.48.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Tue, 24 Sep 2019 08:35:38 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 08:35:38 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] usb: host: xhci: update event ring dequeue pointer on
 purpose
Thread-Topic: [PATCH 1/1] usb: host: xhci: update event ring dequeue pointer
 on purpose
Thread-Index: AQHVcrMKaurOoYA1KEG+PiAfH5L+xQ==
Date:   Tue, 24 Sep 2019 08:35:38 +0000
Message-ID: <20190924083727.22260-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-clientproxiedby: HK0PR03CA0039.apcprd03.prod.outlook.com
 (2603:1096:203:2f::27) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:60::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9bd3224-6631-4993-1adc-08d740ca2d4b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VI1PR04MB4733;
x-ms-traffictypediagnostic: VI1PR04MB4733:|VI1PR04MB4733:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4733806704D34E87DDA3853A8B840@VI1PR04MB4733.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(189003)(199004)(71200400001)(81156014)(8676002)(81166006)(2351001)(2501003)(71190400001)(186003)(66946007)(3846002)(26005)(64756008)(102836004)(386003)(476003)(478600001)(6506007)(36756003)(14454004)(66476007)(7736002)(2616005)(66446008)(4326008)(99286004)(66556008)(6116002)(44832011)(15650500001)(1076003)(52116002)(25786009)(305945005)(2906002)(486006)(256004)(14444005)(6486002)(316002)(6916009)(8936002)(66066001)(86362001)(6436002)(6512007)(5640700003)(5660300002)(50226002)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4733;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uNonkEmvBsS7G9K5IArBYGbVP3U6vqtR901qcAid+igvuX5kbQLdFu7VE6Ih6XYm6FEfeAQYpfj7u7d1sSaCEVOjYvD4B0R9MRpD0m7+AneSn9/yk08n0PqdtrdK6FDyF5PKbH88nNqoCauizovuWF3mE3frOfBHAY/QJAKEDZUEb7DcYd2evfFCgM4XTo3CNpGqybuVIpmKZSzIsKfKTW+vd+fkCnUCLfG08wFO400HoJ6ep3RM2Tn77ML4+hnoYtlhUuA7YLgD425crrSyg7AcjHoDKXIb/ipfyWPpE4SyS/obOGf5hlpc91u1tISLevD+NKQrGOx46jKY/Xot/W09xvJF6itOUf5YbOW2x/jh8qhcYogFXhP26i4iVQkEZTMtN+NzSlhpbw2LzOrKM8TPNKfQyOlPkg4BYHI5VD4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9bd3224-6631-4993-1adc-08d740ca2d4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 08:35:38.5851
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5eKMN4xPQnrWlbZlAi7oI70UEVUp3K8TWi/+h4QUaI0qX8AJeO5jtyhNNEFZKT0h7Bygu8B2Yk0kWqVOqzgX+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4733
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On some situations, the software handles TRB events slower
than adding TRBs, then xhci_handle_event can't return zero
long time, the xHC will consider the event ring is full,
and trigger "Event Ring Full" error, but in fact, the software
has already finished lots of events, just no chance to
update ERDP (event ring dequeue pointer).

In this commit, we force update ERDP if half of TRBS_PER_SEGMENT
events have handled to avoid "Event Ring Full" error.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci-ring.c | 53 ++++++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e220bcbee173..92b6b07cf33d 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2737,6 +2737,35 @@ static int xhci_handle_event(struct xhci_hcd *xhci)
 	return 1;
 }
=20
+/*
+ * Update Event Ring Dequeue Pointer:
+ * - When all events have finished
+ * - To avoid "Event Ring Full Error" condition
+ */
+static void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
+		union xhci_trb *event_ring_deq)
+{
+	u64 temp_64;
+	dma_addr_t deq;
+
+	temp_64 =3D xhci_read_64(xhci, &xhci->ir_set->erst_dequeue);
+	/* If necessary, update the HW's version of the event ring deq ptr. */
+	if (event_ring_deq !=3D xhci->event_ring->dequeue) {
+		deq =3D xhci_trb_virt_to_dma(xhci->event_ring->deq_seg,
+				xhci->event_ring->dequeue);
+		if (deq =3D=3D 0)
+			xhci_warn(xhci, "WARN something wrong with SW event "
+					"ring dequeue ptr.\n");
+		/* Update HC event ring dequeue pointer */
+		temp_64 &=3D ERST_PTR_MASK;
+		temp_64 |=3D ((u64) deq & (u64) ~ERST_PTR_MASK);
+	}
+
+	/* Clear the event handler busy flag (RW1C) */
+	temp_64 |=3D ERST_EHB;
+	xhci_write_64(xhci, temp_64, &xhci->ir_set->erst_dequeue);
+}
+
 /*
  * xHCI spec says we can get an interrupt, and if the HC has an error cond=
ition,
  * we might get bad data out of the event ring.  Section 4.10.2.7 has a li=
st of
@@ -2748,9 +2777,9 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 	union xhci_trb *event_ring_deq;
 	irqreturn_t ret =3D IRQ_NONE;
 	unsigned long flags;
-	dma_addr_t deq;
 	u64 temp_64;
 	u32 status;
+	int event_loop =3D 0;
=20
 	spin_lock_irqsave(&xhci->lock, flags);
 	/* Check if the xHC generated the interrupt, or the irq is shared */
@@ -2804,24 +2833,14 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 	/* FIXME this should be a delayed service routine
 	 * that clears the EHB.
 	 */
-	while (xhci_handle_event(xhci) > 0) {}
-
-	temp_64 =3D xhci_read_64(xhci, &xhci->ir_set->erst_dequeue);
-	/* If necessary, update the HW's version of the event ring deq ptr. */
-	if (event_ring_deq !=3D xhci->event_ring->dequeue) {
-		deq =3D xhci_trb_virt_to_dma(xhci->event_ring->deq_seg,
-				xhci->event_ring->dequeue);
-		if (deq =3D=3D 0)
-			xhci_warn(xhci, "WARN something wrong with SW event "
-					"ring dequeue ptr.\n");
-		/* Update HC event ring dequeue pointer */
-		temp_64 &=3D ERST_PTR_MASK;
-		temp_64 |=3D ((u64) deq & (u64) ~ERST_PTR_MASK);
+	while (xhci_handle_event(xhci) > 0) {
+		if (event_loop++ < TRBS_PER_SEGMENT / 2)
+			continue;
+		xhci_update_erst_dequeue(xhci, event_ring_deq);
+		event_loop =3D 0;
 	}
=20
-	/* Clear the event handler busy flag (RW1C); event ring is empty. */
-	temp_64 |=3D ERST_EHB;
-	xhci_write_64(xhci, temp_64, &xhci->ir_set->erst_dequeue);
+	xhci_update_erst_dequeue(xhci, event_ring_deq);
 	ret =3D IRQ_HANDLED;
=20
 out:
--=20
2.17.1

