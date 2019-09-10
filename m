Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72C4DAE42A
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2019 09:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730065AbfIJHBZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Sep 2019 03:01:25 -0400
Received: from mail-eopbgr40053.outbound.protection.outlook.com ([40.107.4.53]:18900
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729518AbfIJHBZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Sep 2019 03:01:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SfzQs8Kk4OXHaBWwax2jWy5JYYBjVe3ZPbTv2G6mHUNliVvfKr99oMilTIlp4rvKtCGQetkLrW4/aZu8zGUlhe6uBqjmFBk5LunE/7oxbFkec7mVU6lfsT2BT5dOWmNmtzk7+smx1PuL0JC9rNSHSzoYQKvRmNm8/EGK8otJKa9NeUSLm06oK2BA73O8HJIbwG7aKb2GCdeI7f1ssHjpk3oN+PDHLO9XeZ3LDQxlPTuZNCR5eSlo71Fx5SqTpwY1YSmCkSRRkoL+jwwEg9OA/xy/+9e4G4ZOzfhlxeL2a3g424HdE/vqooecPB1KEyQr46AOw3c6NkNdOLA1Hixlpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7YajzlELb87js2uHn91BmLilsyd8StfR1na6HIZpWI=;
 b=SEW+hPCiNq07n4ynn5e+YcPu9BBWewxm8+6bj5pQnQjMtyK+RWuUgSCsnsK0GKz4na7CrC8bOTnjtJTeIcZyOIlQLzu0aIjXL2Q4LDiVW3BuLKl4Oey7CaioFILFctI02d9mfEIDgpd2gqYxSIk3Iu1bYMK+tEsNE0xlKzSj76w4b3OKZGQYtji0meQOf1zoovvwvO/yAtjjjibRdhKtkDxiclWjay7cT9Mc3q22FICAwmNtvCYJWVrq280YLIGJbagf6aJ28uZEYW1frrv/z8MmBd5FCNQPGtFU6JBdl768c1wKDcRtBQGsuiD5EhFuN0seaBMbCEqOqagoDGdSWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7YajzlELb87js2uHn91BmLilsyd8StfR1na6HIZpWI=;
 b=PalyuU5FS5sXrvfLEEKTFMjsUzKcDos0SLln1YNrL1+pvBO4P50bkdXJNJTe3y2091mcIp55PSyKrQ9Glh0h66tOgkAX2fE9mp5r+maT39h9b6yFCyNfBhTMbZALkOTQwnvbv0GmZZWhj7XLbg9PuWx6VqC29jwVDaM/yA/hwyQ=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5870.eurprd04.prod.outlook.com (20.178.205.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.20; Tue, 10 Sep 2019 07:01:21 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a%7]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 07:01:21 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>,
        Jun Li <jun.li@nxp.com>
Subject: [PATCH 1/2] usb: chipidea: udc: add new API ci_hdrc_gadget_connect
Thread-Topic: [PATCH 1/2] usb: chipidea: udc: add new API
 ci_hdrc_gadget_connect
Thread-Index: AQHVZ6WNDayIAqNrQkKPPU/HGhd2KQ==
Date:   Tue, 10 Sep 2019 07:01:21 +0000
Message-ID: <20190910070141.9321-1-peter.chen@nxp.com>
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
x-ms-office365-filtering-correlation-id: 021cbeb4-cc9f-4e11-b3f3-08d735bcaf67
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5870;
x-ms-traffictypediagnostic: VI1PR04MB5870:|VI1PR04MB5870:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB58701DA2580AAA8C03F4D21E8BB60@VI1PR04MB5870.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:506;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(189003)(199004)(2906002)(1076003)(476003)(71200400001)(86362001)(2616005)(66556008)(6486002)(386003)(6506007)(66946007)(66476007)(64756008)(66446008)(25786009)(3846002)(478600001)(4326008)(54906003)(316002)(8936002)(6116002)(81166006)(99286004)(50226002)(6436002)(71190400001)(81156014)(8676002)(2501003)(14454004)(305945005)(7736002)(52116002)(186003)(6916009)(44832011)(36756003)(66066001)(5660300002)(486006)(26005)(2351001)(53936002)(6512007)(256004)(5640700003)(102836004);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5870;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eNqa1EUsZjtvRQSGmvaFVlAUqwZZhcFs7dh/0a8paKg1iECfXWlxcqQ/7mU23wQwDPwcSO1+YwWZrJsUvxs9ARDuG1OpzaSKaZtIcIaKlZBH4iWeXpvyDCXpT4SZ49EuavadqUEmZ/cCpD/I0VdAq+OqQn7662MIexegNBrLui1MlM5QyRcxaQCDkUvym87cZ71Nki5xfd97zKapiM02V5qPCew/qdgrVCh5D77rmfyf1DOrmDc1UJ+1sxS5kja/okWRFfTGkcgeqAioPbsoWuyl/MlFZxZ9srufKuiltd3PdUf8SBu8CTm7KRhZQjg1Sb67aRqcgOgnXMfIOfwmo0cqORm9w157CCcA9OHMXwVrasc+Z0bvSJWqVE2d+KsqVxJ+XhL7/PidyOkGl1ryMXw+PjM/aCcCV6UmrjM4Do4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 021cbeb4-cc9f-4e11-b3f3-08d735bcaf67
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 07:01:21.2295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2YUaheNR7Oy1ofxibcyCh3CwcMAi4FwcBqFLi5e0+ZzlkJJcc/UJTLZ9ug6899EsZrJ0N9AjqaeraO4IA2TDDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5870
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This API is used enable device function, it is called at below
situations:
- VBUS is connected during boots up
- Hot plug occurs during runtime

Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Jun Li <jun.li@nxp.com>
---
 drivers/usb/chipidea/udc.c | 63 +++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 8f18e7b6cadf..59f31c7a7136 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1524,6 +1524,33 @@ static const struct usb_ep_ops usb_ep_ops =3D {
 /*************************************************************************=
*****
  * GADGET block
  *************************************************************************=
****/
+/**
+ * ci_hdrc_gadget_connect: caller makes sure gadget driver is binded
+ */
+static void ci_hdrc_gadget_connect(struct usb_gadget *_gadget, int is_acti=
ve)
+{
+	struct ci_hdrc *ci =3D container_of(_gadget, struct ci_hdrc, gadget);
+
+	if (is_active) {
+		pm_runtime_get_sync(&_gadget->dev);
+		hw_device_reset(ci);
+		hw_device_state(ci, ci->ep0out->qh.dma);
+		usb_gadget_set_state(_gadget, USB_STATE_POWERED);
+		usb_udc_vbus_handler(_gadget, true);
+	} else {
+		usb_udc_vbus_handler(_gadget, false);
+		if (ci->driver)
+			ci->driver->disconnect(&ci->gadget);
+		hw_device_state(ci, 0);
+		if (ci->platdata->notify_event)
+			ci->platdata->notify_event(ci,
+			CI_HDRC_CONTROLLER_STOPPED_EVENT);
+		_gadget_stop_activity(&ci->gadget);
+		pm_runtime_put_sync(&_gadget->dev);
+		usb_gadget_set_state(_gadget, USB_STATE_NOTATTACHED);
+	}
+}
+
 static int ci_udc_vbus_session(struct usb_gadget *_gadget, int is_active)
 {
 	struct ci_hdrc *ci =3D container_of(_gadget, struct ci_hdrc, gadget);
@@ -1540,26 +1567,8 @@ static int ci_udc_vbus_session(struct usb_gadget *_g=
adget, int is_active)
 		usb_phy_set_charger_state(ci->usb_phy, is_active ?
 			USB_CHARGER_PRESENT : USB_CHARGER_ABSENT);
=20
-	if (gadget_ready) {
-		if (is_active) {
-			pm_runtime_get_sync(&_gadget->dev);
-			hw_device_reset(ci);
-			hw_device_state(ci, ci->ep0out->qh.dma);
-			usb_gadget_set_state(_gadget, USB_STATE_POWERED);
-			usb_udc_vbus_handler(_gadget, true);
-		} else {
-			usb_udc_vbus_handler(_gadget, false);
-			if (ci->driver)
-				ci->driver->disconnect(&ci->gadget);
-			hw_device_state(ci, 0);
-			if (ci->platdata->notify_event)
-				ci->platdata->notify_event(ci,
-				CI_HDRC_CONTROLLER_STOPPED_EVENT);
-			_gadget_stop_activity(&ci->gadget);
-			pm_runtime_put_sync(&_gadget->dev);
-			usb_gadget_set_state(_gadget, USB_STATE_NOTATTACHED);
-		}
-	}
+	if (gadget_ready)
+		ci_hdrc_gadget_connect(_gadget, is_active);
=20
 	return 0;
 }
@@ -1785,18 +1794,10 @@ static int ci_udc_start(struct usb_gadget *gadget,
 		return retval;
 	}
=20
-	pm_runtime_get_sync(&ci->gadget.dev);
-	if (ci->vbus_active) {
-		hw_device_reset(ci);
-	} else {
+	if (ci->vbus_active)
+		ci_hdrc_gadget_connect(gadget, 1);
+	else
 		usb_udc_vbus_handler(&ci->gadget, false);
-		pm_runtime_put_sync(&ci->gadget.dev);
-		return retval;
-	}
-
-	retval =3D hw_device_state(ci, ci->ep0out->qh.dma);
-	if (retval)
-		pm_runtime_put_sync(&ci->gadget.dev);
=20
 	return retval;
 }
--=20
2.17.1

