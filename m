Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2AC0F128C
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2019 10:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfKFJlr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Nov 2019 04:41:47 -0500
Received: from mail-eopbgr20050.outbound.protection.outlook.com ([40.107.2.50]:33411
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725868AbfKFJlr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 6 Nov 2019 04:41:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKJSwhII/POWanI8EjRLrHNbR6/Y+e0nzTOxWwkcTG3IZcGkr+7kMkTfGp1O4DWiiU5lHSXSBBe8nI1B1vf9WJHecqrkTwccBjOQjggQPJIDq9tADoGV79wsTHaMXsCPI2wz1t9QWRS6sm6qmT4AQt1wfRtEV4Djm/9JVeMxjmiIDI+m/KRPtXTeB+CNRONQLVcR0l0Wb1E+Ro/MDaiKEKV/41TBq8dw6UOEuH4ZTHJXtRQ/R2XNBajMGNzqYzyNLzT4uX/LTsJTh9BbUHssWl3xAWMEwlAoz0G7PIIinslhhGoVWDRlk7t4/acqrTl4PByJx0Hte6i5kMcKh2lZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdwW6Pli2P0EJBoTaGU8vwa+cOYzbnPiGdwD7TpJMzc=;
 b=f5IQ/sGTwS3wQ2n2tmPEs2ZXQoFsSAgRsRPEe+rXRCT+G7GHdfgtTkL/v/7vbWQwv5N6yKGESf66glTbbCUdQWM78Zqj7kjPtL1g4UZ2+QxU4sJe5G4Ww9MyrXHZMWAXSkhgSvKl/aW3Jmbc14C8wvNRqx2QPqeY36x5ukbYF4lgqlcUTTbee58hlMBlACU1Zq8VNnzJB+H3SjiWrYrr8HElIIdgQ2jy7xjHqZWmsRIZfEDZbpm2XTu1e1mR7ZT5iv1SDPV4D5LElT5bGLIsxW/EBVi0S2f8x28+tSTubb7Y2WbBVTDkT1mmYDwDVSrBTSX1egG2Pj7qOFZY7iD9vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdwW6Pli2P0EJBoTaGU8vwa+cOYzbnPiGdwD7TpJMzc=;
 b=jDncYtnMfeeaFdGpfx1WB5yKfkzRQkwjNjEm2uH1+8c5/2+sa8KzPe6kSbULZBnD5u3r5h1g91YA9jxM34OpZW4mhJWj5LkoDwpsU+7BWcviehi0KicN6Q3UPyUMUPmur/9Gs6v9TOlP+Dn6FQ6lYmJxNizi530MwUi7Px4aFa8=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB5344.eurprd04.prod.outlook.com (52.134.123.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Wed, 6 Nov 2019 09:41:44 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::68e3:e1a6:78fd:7133]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::68e3:e1a6:78fd:7133%3]) with mapi id 15.20.2408.025; Wed, 6 Nov 2019
 09:41:44 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] usb: phy: show USB charger type for user
Thread-Topic: [PATCH 1/1] usb: phy: show USB charger type for user
Thread-Index: AQHVlIZm4hxRRFFpUkq33ge58kNX2w==
Date:   Wed, 6 Nov 2019 09:41:43 +0000
Message-ID: <20191106094104.7834-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-clientproxiedby: HK0PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:203:36::17) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:5c::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0309cec2-068d-44f2-bdca-08d7629d888e
x-ms-traffictypediagnostic: VI1PR04MB5344:|VI1PR04MB5344:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB534435400ED2F8A5E7E3F3598B790@VI1PR04MB5344.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(189003)(199004)(5640700003)(52116002)(5660300002)(54906003)(102836004)(1076003)(186003)(26005)(2351001)(66066001)(2906002)(36756003)(6436002)(256004)(14444005)(316002)(66946007)(66446008)(64756008)(66556008)(66476007)(86362001)(386003)(8936002)(3846002)(50226002)(6506007)(99286004)(2616005)(14454004)(71200400001)(486006)(305945005)(71190400001)(7736002)(4326008)(44832011)(25786009)(6486002)(478600001)(6512007)(8676002)(81166006)(81156014)(1730700003)(2501003)(6916009)(6116002)(476003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5344;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g9d9FSKkPxePNc1ICEZUqSe29AIeFq29H6ohFNUlkRlHliNHetoHS0Yyn4ds0Uailq3fGSSoB56X8qHEZUTuB8oZdXXb0ND2K8b6Dg038hI4pbnRZDEhUexH6WxmAaPNfSiViQkv16fIDCcohnG8rSED9pM+n5wQ82pG36CpoaAhaoYZlqLbM0EI74DDBlUIinQ/ZymJuuL5JLAWYic5dVA/SksODrHUeGhcj7jIJsSrdTic6WlIbaNM4pnUEREM6MSIXaqSKg3zm1gMNeTxQTAiASnVcGaPOdEF+/Do+F0/YstuxkDLnoIsy9Vi2ChCAb72+Bpe+1xDOU0LAEDMdzRjJAFdeG8ZlmJpE5UVFY1q+OgGH/lNmphlV/L6ZlFebrucLLUeTe6MVh7s6pswqb6otHuAO2plq5zwDbMouKT5eMsL73p9Eki76leZXU/f
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0309cec2-068d-44f2-bdca-08d7629d888e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 09:41:44.0036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oSoWITDLBCqv8Z0DRdlObEGO/4iyybjrKpCF2K/+NdLsoDp3PcOEb/cy1/IvmuSlGtqJa8oghrqsBUOgeNbKNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5344
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Current USB charger framework only shows charger state for user, but the
user may also need charger type for further use, add support for it.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/phy/phy.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
index 0277f62739a2..6e290a230b8c 100644
--- a/drivers/usb/phy/phy.c
+++ b/drivers/usb/phy/phy.c
@@ -34,6 +34,14 @@ struct phy_devm {
 	struct notifier_block *nb;
 };
=20
+static const char *const usb_chger_type[] =3D {
+	[UNKNOWN_TYPE]			=3D "USB_CHARGER_TYPE_UNKNOWN",
+	[SDP_TYPE]			=3D "USB_CHARGER_TYPE_SDP",
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

