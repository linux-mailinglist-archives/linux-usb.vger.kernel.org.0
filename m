Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3B0D38BC
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 07:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbfJKFma (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 01:42:30 -0400
Received: from mail-eopbgr60062.outbound.protection.outlook.com ([40.107.6.62]:35510
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726174AbfJKFma (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Oct 2019 01:42:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GaL10hbZ4SHpeCHeoR6VUaXVL8qEhgpwr2RmKvYHPhpukI+SYRMOecFQeJeKXmxHChZJjORmQfjk8Y/z9Hu4xS8T+VhuI/6UIqU81QcsWk/SE1zOM7/lssdKtp7NMRJmtMDp2RjsbtUSHqEfyPlPM9feoFj1Vd+t7qVxFYWGov0wO/Gh9rzt9//0e70xZaKjND8A9zaGbr+GdSmC3rp588295cr1bFaYqCGTQEQpZmoiuJhjuOmb7Afbq9cksDTiYwv3uSXuL+U+HHCgg7QEgGzrtsMYgBiJVHEX1gt0xRVN24be1BpKltdpciEdK0bNKxC0czCMr3G9Bl3vf2MqfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ArEl6B/UMbrE3p3K0bGbCP+xF40/CjJrNu8+63MKXs=;
 b=Hu/gnQN0vcGH4WY7FHpXyfdgsixW5n71n8GLAKdHRPlpp3VqP2R3pwgHGOvy4+OC8+WWKdtTETSpeNV12rhgVx7A/iD1fUQw0joDs5Phr5VhOl4shj0kn00RXzmruHJHrdEoxcEvXhBStZWApjtvZqdXCmn/zfHIAlvB8gvwI0+YZBME64HKqwdHIYiNfQgk0v1ayznaQb4f6Xtaree5+v2aMMsfr8BwESPzO6nFaY5YHPWtwdm3V6v+3xzCuByQ3tfEP+tTiCRcaTGRCUo+SFMBpystOdhlowO/5ShOD6fzcLQIQdpL8PZ46MD2VYlyohhxYxbrbJlP+munoQq8Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ArEl6B/UMbrE3p3K0bGbCP+xF40/CjJrNu8+63MKXs=;
 b=rol2xY0jFwIzl6Ctyp0TYW1cUA4dndjLRFJZYfDiVK48SL2Zsx9tsjbRDNh7JewPSOtNQx0sIn9H26Nem29VhLJ8YJBssw7FrC2/NVZ830GU/BfgPCDtG82geDkunMWnx/mjp36BDGdXm8Xc0vGWWPqIP+Q2qvn6my+bibCegHU=
Received: from AM0PR04MB5314.eurprd04.prod.outlook.com (20.177.41.157) by
 AM0PR04MB4915.eurprd04.prod.outlook.com (20.176.215.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 05:42:28 +0000
Received: from AM0PR04MB5314.eurprd04.prod.outlook.com
 ([fe80::99b0:3cb8:e409:1798]) by AM0PR04MB5314.eurprd04.prod.outlook.com
 ([fe80::99b0:3cb8:e409:1798%6]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 05:42:28 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "git@andred.net" <git@andred.net>, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/3] usb: chipidea: imx: refine the error handling for hsic
Thread-Topic: [PATCH 2/3] usb: chipidea: imx: refine the error handling for
 hsic
Thread-Index: AQHVf/aqoz0J9aOI3UyENrY4GDYyQA==
Date:   Fri, 11 Oct 2019 05:42:28 +0000
Message-ID: <20191011054129.20502-2-peter.chen@nxp.com>
References: <20191011054129.20502-1-peter.chen@nxp.com>
In-Reply-To: <20191011054129.20502-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-clientproxiedby: TY2PR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:404:a::36) To AM0PR04MB5314.eurprd04.prod.outlook.com
 (2603:10a6:208:cd::29)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 712581fb-5484-4b01-a3a9-08d74e0dcd1b
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: AM0PR04MB4915:|AM0PR04MB4915:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB491517EE4F3AEFF61DAA6B918B970@AM0PR04MB4915.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:146;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(189003)(199004)(6436002)(2501003)(446003)(2351001)(2616005)(256004)(6512007)(8936002)(5640700003)(50226002)(6916009)(486006)(8676002)(11346002)(476003)(186003)(81166006)(81156014)(44832011)(1076003)(26005)(386003)(305945005)(54906003)(52116002)(66946007)(102836004)(316002)(5660300002)(86362001)(36756003)(71190400001)(64756008)(66556008)(66446008)(6506007)(6486002)(66476007)(3846002)(6116002)(25786009)(478600001)(14454004)(71200400001)(76176011)(4326008)(7736002)(2906002)(99286004)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4915;H:AM0PR04MB5314.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2PUrJNdqX7HpfJWpAmlSR8CNG4BMbOUq4WpfhEoEqXS9cHmZ8w3saJeX8s6b9nZTCtZ4dnq6SmWQBpbdj2kk1XhGdY38+oYVluwE01/qWggK8lKR8r8FFJB1wwkBuCCS0UiNmgj5SEZYBydPOnLPhVq/ehov68oklwmwaGltz5BSvuc1NOuivdrVTTpHRGj7+v9+nSxb8RQRleLTkruvNAvDra9awDLFf+y0tnKXby+bvzaEifEATJPLbmrHNEpT8xfcuVI3fEgh2hILKt/EZxcyT+Lkldt52jE55Sl+sIooIgAPr7srBgbuHgh8degPqIE55WgVTHzW5tlLFSynrkUIB7If02oBohhDkRrDykQ+lDfvHpExkFAK/FV+36G1HJf3wbzEbjxnMa32NWA/C17Ks+zrjxYGbJ1n99h/4bQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 712581fb-5484-4b01-a3a9-08d74e0dcd1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 05:42:28.1455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eaMyeGmycg+hZUMESTGm5vr+UDDjC1w0kxB/whzL6rSXaxPfX78SHQj5qVPdZDPd0c37YuLFotYUoTUDM2DD1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4915
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

- -EPROBE_DEFER is an error, but without need show error message
- If pintrol is not existed, as pintrol is NULL

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_h=
drc_imx.c
index 25a38ed27aa8..c34fcc079cd4 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -330,8 +330,11 @@ static int ci_hdrc_imx_probe(struct platform_device *p=
dev)
 		pdata.flags |=3D CI_HDRC_IMX_IS_HSIC;
 		data->usbmisc_data->hsic =3D 1;
 		data->pinctrl =3D devm_pinctrl_get(dev);
-		if (IS_ERR(data->pinctrl)) {
-			dev_err(dev, "pinctrl get failed, err=3D%ld\n",
+		if (PTR_ERR(data->pinctrl) =3D=3D -ENODEV)
+			data->pinctrl =3D NULL;
+		else if (IS_ERR(data->pinctrl)) {
+			if (PTR_ERR(data->pinctrl) !=3D -EPROBE_DEFER)
+				dev_err(dev, "pinctrl get failed, err=3D%ld\n",
 					PTR_ERR(data->pinctrl));
 			return PTR_ERR(data->pinctrl);
 		}
@@ -361,13 +364,13 @@ static int ci_hdrc_imx_probe(struct platform_device *=
pdev)
=20
 		data->hsic_pad_regulator =3D
 				devm_regulator_get_optional(dev, "hsic");
-		if (PTR_ERR(data->hsic_pad_regulator) =3D=3D -EPROBE_DEFER) {
-			return -EPROBE_DEFER;
-		} else if (PTR_ERR(data->hsic_pad_regulator) =3D=3D -ENODEV) {
+		if (PTR_ERR(data->hsic_pad_regulator) =3D=3D -ENODEV) {
 			/* no pad regualator is needed */
 			data->hsic_pad_regulator =3D NULL;
 		} else if (IS_ERR(data->hsic_pad_regulator)) {
-			dev_err(dev, "Get HSIC pad regulator error: %ld\n",
+			if (PTR_ERR(data->hsic_pad_regulator) !=3D -EPROBE_DEFER)
+				dev_err(dev,
+					"Get HSIC pad regulator error: %ld\n",
 					PTR_ERR(data->hsic_pad_regulator));
 			return PTR_ERR(data->hsic_pad_regulator);
 		}
--=20
2.17.1

