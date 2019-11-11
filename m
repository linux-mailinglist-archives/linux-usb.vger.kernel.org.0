Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AED04F6E8F
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2019 07:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfKKGai (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Nov 2019 01:30:38 -0500
Received: from mail-eopbgr50085.outbound.protection.outlook.com ([40.107.5.85]:60644
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726360AbfKKGai (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Nov 2019 01:30:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYs8Cj4xKwW+Tj1FbnxM77xE02sH4SMR0j1+6nu31ltFdm2uv4sad/03pNPdipYpTn6aI/rXep5YqUu1HoGH0nq3ILTNEK5pFpTQC5bh02+fOTEuBeUnt0E6pNd34SiEQueXm+JsuwKzWqCAw03NEEdw9IRyK/9AcMS3Ul+X6I2bIsIvJtBtyXls8ohC0G/BylXvyYhQGVW6CqgMSXk62O7EBrpaj7KRo04/Uz1Dx45rI1x1u3BqiTl4SfsTv9DgIds17ZQJbJ7FC/ey+Aj3o6o/phDuivD9+JIgCK1L64cgP3cBBXSoISGbtCG7llghwB1u5Wm3PpEyQ73xPh6MAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJt4Na847FfHW3pDzZ1vGDkHnDnE8RzvVwTpeb1lpIc=;
 b=hLvWCAb1U4KtcOhIFLmkD0A8KDAbY7nPhESrdQq+ysG53GBeSTQ63HDeemte6dvuXJvUV2+HRRTUG3RV9fa5mbrwPrJUhw+3tWnnlugRGBIdo5QV/whtr5Z7fPqkjpkZl3n7lUer8b5K/gb5KnA463DzTaeCT0F8RgV4A67rHq7LgLuH89OFLQ/IoMV3MILNPQQPMlMbVunv4JSPH+BxK2JJT04CAHBtynydBTp8/lfWsFs1xKfymbiJp9iu6NfjXK5ViL+Ub5grlXP6dEslEUqD9zpcwz4159BxWzKwpzxhNRqOHNnsJgsB4bkk7Hnee+GwSj1/jEJZgkz5yaFODw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJt4Na847FfHW3pDzZ1vGDkHnDnE8RzvVwTpeb1lpIc=;
 b=DILc+lWAOXDcVUeeczx0S7CgZqmxeVNl8OPoMPrI6c8vnV1bbn6AcGSn5JhyE9nE86Rp0WFpgzXdx3oknxzd+PtSC4H6O62j/Sf+KvPAStbCh+UyG6+6iDCQ48ndg9WtD3OGEvzZoTIB+do3gxYZlf0/6/VIn09ZBkK5yOK0zMc=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4640.eurprd04.prod.outlook.com (20.177.54.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Mon, 11 Nov 2019 06:30:34 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::68e3:e1a6:78fd:7133]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::68e3:e1a6:78fd:7133%3]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 06:30:34 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 1/2] usb: phy: show USB charger type for user
Thread-Topic: [PATCH v2 1/2] usb: phy: show USB charger type for user
Thread-Index: AQHVmFmGwrIgMa+oY0OfmGbZQWkTfw==
Date:   Mon, 11 Nov 2019 06:30:34 +0000
Message-ID: <20191111063349.3013-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-clientproxiedby: HK2PR02CA0158.apcprd02.prod.outlook.com
 (2603:1096:201:1f::18) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:5c::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2fb6df10-f498-4b97-1ac8-08d76670a870
x-ms-traffictypediagnostic: VI1PR04MB4640:|VI1PR04MB4640:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB464069230121889F6786995C8B740@VI1PR04MB4640.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(199004)(189003)(316002)(44832011)(36756003)(52116002)(476003)(5660300002)(14454004)(2351001)(2616005)(102836004)(6916009)(1076003)(6506007)(386003)(54906003)(6116002)(3846002)(71200400001)(71190400001)(99286004)(86362001)(4326008)(486006)(5640700003)(64756008)(66556008)(66476007)(6486002)(478600001)(6436002)(66946007)(186003)(6512007)(66066001)(8936002)(256004)(14444005)(66446008)(1730700003)(81156014)(81166006)(50226002)(8676002)(2906002)(26005)(305945005)(7736002)(2501003)(25786009);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4640;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mx+h+zCl2rIGXNsuEzoEh/xh5E0kw3l5Fkt9IR+HwHx4ibyoW7wiAd9A6iBP7Iuw0AkiGTyfTeXvWUWarjmLp1D3j033aQf/nxUUxPFLWbwQGY9Ffxw88z0sylIG6aIw8IIIIy8ziebsQXFY53sNFFq57VWNtnM31G0YdUEbb+tX+MGJmkK5iyPad9vnD0v6AYWjmj84prlDCYyvWt6koPPeQGaaF5XSVyQB7UzCHTUF4VxrjEYpeqw81PQxso5T/2oPQ7wOn9r2N3CDlVsMeixnb2zk8gDekvDDYh+9uH5Mp2LevwPQF9cYcj9RObsXJ3Vn2/djyS9esSIvsBnD6tIZkjdmyOZzuna/r8RSm4/4drOFDcskpNKxbk1ADd/966f7bqM0lnKT4PB0NN3+VJ7EwVA4qIFYOAqPlL8Qlq6z0SK82QvxL5ux+3Z6oELd
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb6df10-f498-4b97-1ac8-08d76670a870
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 06:30:34.6272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mI3lPwQCprxoY81NoAkt+1UTjBA+fB1wuNCfobjcBVrPIhi6zup2685hP0GHlZx1XP5PHoeugiIFfSP+2GYM2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4640
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Current USB charger framework only shows charger state for user, but the
user may also need charger type for further use, add support for it.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes for v2:
- Some string unalignment for usb_chger_type
- Add ABI documentation for USB charger uevent

 drivers/usb/phy/phy.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
index 0277f62739a2..ad2554630889 100644
--- a/drivers/usb/phy/phy.c
+++ b/drivers/usb/phy/phy.c
@@ -34,6 +34,14 @@ struct phy_devm {
 	struct notifier_block *nb;
 };
=20
+static const char *const usb_chger_type[] =3D {
+	[UNKNOWN_TYPE]			=3D "USB_CHARGER_UNKNOWN_TYPE",
+	[SDP_TYPE]			=3D "USB_CHARGER_SDP_TYPE",
+	[CDP_TYPE]			=3D "USB_CHARGER_CDP_TYPE",
+	[DCP_TYPE]			=3D "USB_CHARGER_DCP_TYPE",
+	[ACA_TYPE]			=3D "USB_CHARGER_ACA_TYPE",
+};
+
 static struct usb_phy *__usb_find_phy(struct list_head *list,
 	enum usb_phy_type type)
 {
@@ -98,7 +106,8 @@ static void usb_phy_notify_charger_work(struct work_stru=
ct *work)
 {
 	struct usb_phy *usb_phy =3D container_of(work, struct usb_phy, chg_work);
 	char uchger_state[50] =3D { 0 };
-	char *envp[] =3D { uchger_state, NULL };
+	char uchger_type[50] =3D { 0 };
+	char *envp[] =3D { uchger_state, uchger_type, NULL };
 	unsigned int min, max;
=20
 	switch (usb_phy->chg_state) {
@@ -122,6 +131,8 @@ static void usb_phy_notify_charger_work(struct work_str=
uct *work)
 		return;
 	}
=20
+	snprintf(uchger_type, ARRAY_SIZE(uchger_type),
+		 "USB_CHARGER_TYPE=3D%s", usb_chger_type[usb_phy->chg_type]);
 	kobject_uevent_env(&usb_phy->dev->kobj, KOBJ_CHANGE, envp);
 }
=20
--=20
2.17.1

