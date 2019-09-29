Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E69FC1388
	for <lists+linux-usb@lfdr.de>; Sun, 29 Sep 2019 08:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbfI2GHo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Sep 2019 02:07:44 -0400
Received: from mail-eopbgr00079.outbound.protection.outlook.com ([40.107.0.79]:18926
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725958AbfI2GHo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 29 Sep 2019 02:07:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJbtDsAVl1XGQE8zoh/D3r/PAdR5O/gCTyCqLKfGHO7T7WkoklZEi0P6NrCZtKcdDA09f5fMC/1gTpeXqi0Tk5u53QzRNVkEYpzegRhO1fwJTcq9W18lxrt/6/Nblz+Lasi5Iwyck11GiJZzBJq2TvMysr3XRACFF4DHeyTclUubi1TDYO332CiTtQeLG7Mb1wfJfvpFPLa+QvuTDycwJtNgH0vNOkRR46BWkVdM1XnHw/gVxITHBoaaDiYSarVBjN4eI6/3P250060eZapJ5/K6ZAZFMnEILevhYzGOEDNZIA+RHOuHWUNC/Z6U000oywCU7wPNHEHzzzfQRO1juQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncIBHeih+29wxwUg0Nb1V0yK4GH6nupNPhsEbEFuzvk=;
 b=lhlqx1drVzV3trM22br7llQp4eOO6tqL01Cci3MuRBKWTSp6PDrKXy+v39AImFSLINq//GWwHhJU+wpRlqIbmzK6yauFjDiApgg+dU1599skxEL/B4O6Ev8jG+FS2PoLbxLsiy3vfUNlYrDxxQKu5MpAcDWUJg0pl7BldtOV6G/HlnaB7q+VpOTe6siK4KGp46IS3dY9J+DxYIzIcF4h+C4KiC+AhAtbGJo5u5lEutlnvIIxXBqFJQYsnLoNk1Ozcf3/kWpD/Bl8EHi/O4mDBQ3fP0DD2upZXdoga5ApF4H01JchZFAgRWUuH5fQlCMZiCBZqcWK/0AAVp5jQoNpVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncIBHeih+29wxwUg0Nb1V0yK4GH6nupNPhsEbEFuzvk=;
 b=rEEgZv05dIzyi0RoxDY4U3+jCICj1lCUVEQULssGwu+i8QERXaq/4gmpuDxsEmMtP+753x/lKFbi3bxplfG51+r+UDTuQU4HSsJ1CNbZPWI52xBOffhlFEesDZJJK5DOxv8sv+5ysM9mHYvGy/A7/mzmvt7ld9YV7ZsnXkguaxI=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB6096.eurprd04.prod.outlook.com (20.179.25.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Sun, 29 Sep 2019 06:07:39 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::1da:26dc:6373:4ab0]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::1da:26dc:6373:4ab0%3]) with mapi id 15.20.2305.017; Sun, 29 Sep 2019
 06:07:39 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 1/1] usb: host: xhci: update event ring dequeue pointer on
 purpose
Thread-Topic: [PATCH v2 1/1] usb: host: xhci: update event ring dequeue
 pointer on purpose
Thread-Index: AQHVdowy3KvqKrVg+E+m3SFwaVQ3lw==
Date:   Sun, 29 Sep 2019 06:07:39 +0000
Message-ID: <20190929060556.24182-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-clientproxiedby: SG2PR04CA0130.apcprd04.prod.outlook.com
 (2603:1096:3:16::14) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:60::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5120e49-4d73-4e66-6d92-08d744a354e4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VI1PR04MB6096;
x-ms-traffictypediagnostic: VI1PR04MB6096:|VI1PR04MB6096:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB6096812268A330E7AE18E5DA8B830@VI1PR04MB6096.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 017589626D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(199004)(189003)(25786009)(15650500001)(4326008)(6916009)(305945005)(81156014)(7736002)(5660300002)(6512007)(44832011)(71200400001)(71190400001)(50226002)(2351001)(386003)(26005)(54906003)(6436002)(2501003)(2906002)(66066001)(6506007)(86362001)(5640700003)(316002)(66446008)(6486002)(66476007)(99286004)(66556008)(256004)(478600001)(486006)(2616005)(52116002)(3846002)(64756008)(6116002)(102836004)(8936002)(66946007)(8676002)(186003)(81166006)(14454004)(14444005)(1076003)(476003)(36756003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6096;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Yu6prTyM2K53S3oR70cUUZ0ocL0TAclcKHLFC3uAMRzJmhbmWXnCyRd7vCQ5IcVF9aKeKAkA0XijCSkQitBQzC9TWm4Clfqp90bR4iuCjetXkePNdqLVPx8vXuKg1pMrh1tQIWpG26GM6EZTnI+1TVtczHRx0bKqDPu1EkBxhytW/GgB4UEpIKpPb/tmICMpu9tKOvq94ib1brXmbOWlFU6SBVPZLRPfhElIxzelFypOs1uqagLQ1FVJvtzbWD7ZaubdKxGfww814DJGr5cc0YPGXHmFiO78ctx+FqcsxtNRJIzXk1AuWbScUKfG1K2ti2T/IKkNJqsttg9hi72q/oBysS2aYjhX+VILGBu3coBlZ0c73VeVnowbbdZBhTwS0qprPWzwz9oJDaJ9d+5rwJH/B9MVX0hyvVrtPLa3oNs=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5120e49-4d73-4e66-6d92-08d744a354e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2019 06:07:39.3537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2/cPQdmzbUj7eAXeBuwHRKkLHrDZVzpCTrnHfMp0KsnpiMCs8wQioG/SIrUDgMRzoxsl+KxCzt5P03BFY62LNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6096
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
Changes for v2:
- If current ERDP value is the same with intended written one,
  give up this written.

 drivers/usb/host/xhci-ring.c | 62 ++++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e220bcbee173..2c0a15c3b3a7 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2737,6 +2737,44 @@ static int xhci_handle_event(struct xhci_hcd *xhci)
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
+
+		/*
+		 * Per 4.9.4, Software writes to the ERDP register shall
+		 * always advance the Event Ring Dequeue Pointer value.
+		 */
+		if ((temp_64 & (u64) ~ERST_PTR_MASK) =3D=3D
+				((u64) deq & (u64) ~ERST_PTR_MASK))
+			return;
+
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
@@ -2748,9 +2786,9 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
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
@@ -2804,24 +2842,14 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
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

