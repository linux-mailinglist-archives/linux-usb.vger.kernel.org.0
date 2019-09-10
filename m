Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 013B0AE42E
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2019 09:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730540AbfIJHCH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Sep 2019 03:02:07 -0400
Received: from mail-eopbgr40045.outbound.protection.outlook.com ([40.107.4.45]:20611
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729518AbfIJHCH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Sep 2019 03:02:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ll+7cIQRaJyRTYhNQM4mG59JhCYFnnetwiUNIZLHxPzahyFXc+3TPAG9F90Gby7rmZAbnAHp1eUi1GfGA70xZBZcJA7LAQ3369OJyyYEKWxdClMH39KAh5iGSFklxBr+s7nF2Dm17nhU5Pnnr3ngY8Y6N3fPSOi2JyhkDgdai9kuYTS7IKUIcHuHTEkhy/5TIlGdexVL1dLJMIOkXta+xGxq6AYGZYbZiVSordZG8jgLz626/0fgjM7BruAARt1rx42feFwRqDgGn4Gwzr8fZb6h3IpXLH1BiLuWOKuLigDoOVqbkyxh0TyTP6el55rF1dudk9DsgzZj79oK/KFJrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhKilI8m7xBM8YhATmsT/S6BdlBwfX9SwlfY98PcUuM=;
 b=S/yJZK0YvadK6TK7FSpjqO352solyrulryZo4OGNNyXKT4k/6ywVMSF/QIwbKxxAzjSWhJL2VG3BghtOcZK5qoInRrS9mSZRLRF4bvyqpGWqFpb/Oy95T/VjxkjqWZ6cSdQDPXvi+YlQvtwEIG82nBZ04HZuJORVlg+c0zhQkeFghulx/WsaQEewWdO+RM95CLXDI1ailHPDD27ZCxQJStvhoDLmuXOi2+iOqRigjYvvrOXx6B+VA+OgUVVK+8lM8LU6B8rr+aRRz4h5XQS5Db8HB0e1MY4i1a79dDHpPt+XsPFv3lPjvjIOMRGvdYSpKTdQKO/ikvq5MRorqHeUHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhKilI8m7xBM8YhATmsT/S6BdlBwfX9SwlfY98PcUuM=;
 b=BOsuI7PcIEdpzSJUYWKtN73xh8kQUCRtFbpEeG8QeL8k1bkyrcIi7DEbpitZ313vomgXnVGBZjGkV8aZvnlfAkubAiqjnOdV16tLtdKy/euqYTMdKot/Vs3Fu7c0u1XK1khvl/jCmwwWDWDaU4sMy4BrtXjlna0/foco75hB+X0=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5870.eurprd04.prod.outlook.com (20.178.205.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.20; Tue, 10 Sep 2019 07:01:23 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a%7]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 07:01:23 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/2] usb: chipidea: udc: protect usb interrupt enable
Thread-Topic: [PATCH 2/2] usb: chipidea: udc: protect usb interrupt enable
Thread-Index: AQHVZ6WOAtisvLJly0qYx71GKdfjYA==
Date:   Tue, 10 Sep 2019 07:01:23 +0000
Message-ID: <20190910070141.9321-2-peter.chen@nxp.com>
References: <20190910070141.9321-1-peter.chen@nxp.com>
In-Reply-To: <20190910070141.9321-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-clientproxiedby: SG2PR03CA0088.apcprd03.prod.outlook.com
 (2603:1096:4:7c::16) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:60::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a41f719-8aca-4e74-c63d-08d735bcb0c4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5870;
x-ms-traffictypediagnostic: VI1PR04MB5870:|VI1PR04MB5870:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB5870079D435E5F4CACE21FB88BB60@VI1PR04MB5870.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(189003)(199004)(2906002)(1076003)(446003)(476003)(71200400001)(86362001)(2616005)(11346002)(66556008)(6486002)(386003)(6506007)(66946007)(66476007)(64756008)(66446008)(25786009)(3846002)(478600001)(4326008)(54906003)(316002)(8936002)(6116002)(81166006)(99286004)(50226002)(6436002)(71190400001)(81156014)(8676002)(2501003)(14454004)(305945005)(7736002)(52116002)(76176011)(186003)(6916009)(44832011)(36756003)(66066001)(5660300002)(486006)(26005)(2351001)(53936002)(6512007)(256004)(14444005)(5640700003)(102836004);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5870;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GJ4JSDY6SUun0ogSXYBnl+0wZvxnNR9+AnnoPZXFfX1YBPRtl5qTXdF3HPuAze5f26rKCz5qkN6xZzD9EyXWpbWdY1VcsMaWavZH6Sbv0XtrzADQT/VWomnsDZ3DI7K8ix3RVt+aB8k6ECBIU32AEwfifgRBVGHQkWbe79llxK7oNtDHu5Bov/ZJY8a/v+j/qjKVGOwEZIVZKtjX833aF4lu/G/xWVSb9c2nOqhiklOidPF56JUPNGPXtzij16Tmfc+/C7LN3V0iZMZRzB3HQ96eohX1WTDx+J7qIvQLPA7mQ00jQFI6pOEXPqjS8cUWcqdoWFiygYJfYleb2vR8Mj88vJPJVMf5MvdiGDWE8/aAkzqecSmZdWViBiK4WlE28EEhAJWQLYwkHPD2TEl0WbJyYTgo8XLO/dGojEQBYn8=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a41f719-8aca-4e74-c63d-08d735bcb0c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 07:01:23.7051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eJ7zLYl8H0dGxv7ToAZ6JM82PhuH6eVQgjcFIfHVx1PJer490pz1Q163hK2AfN3EzOjeDjRNYzq3OCVXQtpEPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5870
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Jun Li <jun.li@nxp.com>

We hit the problem with below sequence:
- ci_udc_vbus_session() update vbus_active flag and ci->driver
is valid,
- before calling the ci_hdrc_gadget_connect(),
usb_gadget_udc_stop() is called by application remove gadget
driver,
- ci_udc_vbus_session() will contine do ci_hdrc_gadget_connect() as
gadget_ready is 1, so udc interrupt is enabled, but ci->driver is
NULL.
- USB connection irq generated but ci->driver is NULL.

As udc irq only should be enabled when gadget driver is binded, so
add spinlock to protect the usb irq enable for vbus session handling.

Signed-off-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Jun, I changed a little for your patch, please check if it is OK.

 drivers/usb/chipidea/udc.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 59f31c7a7136..59c34ce6b450 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1530,13 +1530,18 @@ static const struct usb_ep_ops usb_ep_ops =3D {
 static void ci_hdrc_gadget_connect(struct usb_gadget *_gadget, int is_acti=
ve)
 {
 	struct ci_hdrc *ci =3D container_of(_gadget, struct ci_hdrc, gadget);
+	unsigned long flags;
=20
 	if (is_active) {
 		pm_runtime_get_sync(&_gadget->dev);
 		hw_device_reset(ci);
-		hw_device_state(ci, ci->ep0out->qh.dma);
-		usb_gadget_set_state(_gadget, USB_STATE_POWERED);
-		usb_udc_vbus_handler(_gadget, true);
+		spin_lock_irqsave(&ci->lock, flags);
+		if (ci->driver) {
+			hw_device_state(ci, ci->ep0out->qh.dma);
+			usb_gadget_set_state(_gadget, USB_STATE_POWERED);
+			usb_udc_vbus_handler(_gadget, true);
+		}
+		spin_unlock_irqrestore(&ci->lock, flags);
 	} else {
 		usb_udc_vbus_handler(_gadget, false);
 		if (ci->driver)
@@ -1555,19 +1560,16 @@ static int ci_udc_vbus_session(struct usb_gadget *_=
gadget, int is_active)
 {
 	struct ci_hdrc *ci =3D container_of(_gadget, struct ci_hdrc, gadget);
 	unsigned long flags;
-	int gadget_ready =3D 0;
=20
 	spin_lock_irqsave(&ci->lock, flags);
 	ci->vbus_active =3D is_active;
-	if (ci->driver)
-		gadget_ready =3D 1;
 	spin_unlock_irqrestore(&ci->lock, flags);
=20
 	if (ci->usb_phy)
 		usb_phy_set_charger_state(ci->usb_phy, is_active ?
 			USB_CHARGER_PRESENT : USB_CHARGER_ABSENT);
=20
-	if (gadget_ready)
+	if (ci->driver)
 		ci_hdrc_gadget_connect(_gadget, is_active);
=20
 	return 0;
@@ -1827,6 +1829,7 @@ static int ci_udc_stop(struct usb_gadget *gadget)
 	unsigned long flags;
=20
 	spin_lock_irqsave(&ci->lock, flags);
+	ci->driver =3D NULL;
=20
 	if (ci->vbus_active) {
 		hw_device_state(ci, 0);
@@ -1839,7 +1842,6 @@ static int ci_udc_stop(struct usb_gadget *gadget)
 		pm_runtime_put(&ci->gadget.dev);
 	}
=20
-	ci->driver =3D NULL;
 	spin_unlock_irqrestore(&ci->lock, flags);
=20
 	ci_udc_stop_for_otg_fsm(ci);
--=20
2.17.1

