Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85F84141D6F
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jan 2020 11:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgASK7m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jan 2020 05:59:42 -0500
Received: from mail-eopbgr80054.outbound.protection.outlook.com ([40.107.8.54]:39334
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726744AbgASK7m (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 19 Jan 2020 05:59:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSBGDdN2+c9vI2gJHfDtTj7mEwOnShXb9aJe3i85XT/tYMuX7Bo4g6Sxax3j287TXqi4kwZuKc3HnpbkyuPBiS1LQfOHBDJZSUADUUg8n878zjaRc//UJaYC/rWUjGlQ1L0i9iRHmMx+yd8EQTi2XD0Sk2gvrDHcfZv1YGQm48XN6N0O02ezbuvSBnIYtOq2mSei+ekCZlT9rUIWpXFpMSEjmHVWeC2TQ9RxfMHwG4VQvregRdgZMEb+qjHuJ0AwccRFwNoObGLc3garRsR+Kv5FNEnVPvDmO+sEqK1HpxBzfqncRi/gPorM0ORY4miy43T5BGtoQGlvgFFJrDX9ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p7IeVdaoXMvYjzHQwwR+YMzlgyQ2I4WTwGp/iUu5Ec=;
 b=RNPIL6tqUk3fs0SulJrD7c+AiAe5NEHDIMsHECPHBUm/EkiHL7jZ+btRC5QXjeBj9dwtfq01VOcCKkrle396g3NJgrX1NtynO4i4x91c7qA+7qcGPgvtRC1AEipKMQ/SgNQ1Z8TdHVOPiaHn3Jp+7KDodXZjVlhwZ5/ZFPn851ZoTWOjCJd2zSh5k4brcWp6KRHDshcyUU4yKAg6SIkH57iV3hgR875xA7Zi6v7iiMXEBjgbip70xJ7a5IYXm14agZjSU56tFFLVBBYCpMOVmajadb3VkugnKcauGmMhy4kRlcBXErR1pn4QY4P6Ei0bpXWEGJohUMvn1HkTmTsG4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p7IeVdaoXMvYjzHQwwR+YMzlgyQ2I4WTwGp/iUu5Ec=;
 b=gpSNyw1ynEntCDiugBUvvEboKpLdPRdsW5yNFy8RQFkqVJ5FxHO6HmVAamVv2gFcEg59wC0hDminKQ9syr8Iptfha4dtuyde3JK9VmHt9DdWM/I/N4ByHMSV6VgRIVgVUC/v4AM3w+MntjCVvOiL2Y338bHvGvnabHpSxi3+ZZk=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.235.146) by
 VE1PR04MB6542.eurprd04.prod.outlook.com (20.179.234.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19; Sun, 19 Jan 2020 10:59:38 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::fc52:45c6:88a1:b5e3]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::fc52:45c6:88a1:b5e3%7]) with mapi id 15.20.2644.024; Sun, 19 Jan 2020
 10:59:37 +0000
Received: from localhost.localdomain (119.31.174.66) by HKAPR04CA0008.apcprd04.prod.outlook.com (2603:1096:203:d0::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2644.20 via Frontend Transport; Sun, 19 Jan 2020 10:59:35 +0000
From:   Jun Li <jun.li@nxp.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: [PATCH] usb: typec: tcpci: mask event interrupts when remove driver
Thread-Topic: [PATCH] usb: typec: tcpci: mask event interrupts when remove
 driver
Thread-Index: AQHVzreK9AEzUagS3kq1GZTDoGwG9w==
Date:   Sun, 19 Jan 2020 10:59:37 +0000
Message-ID: <1579431309-10265-1-git-send-email-jun.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HKAPR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:203:d0::18) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3a2d2dd3-2209-44f8-3ccb-08d79cceacf0
x-ms-traffictypediagnostic: VE1PR04MB6542:|VE1PR04MB6542:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB654293B1C9F9503D1D2FAF4D89330@VE1PR04MB6542.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:519;
x-forefront-prvs: 0287BBA78D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(189003)(199004)(2616005)(52116002)(16526019)(478600001)(956004)(8936002)(6512007)(4326008)(86362001)(81166006)(110136005)(2906002)(44832011)(54906003)(66446008)(81156014)(186003)(66556008)(66476007)(64756008)(316002)(66946007)(8676002)(71200400001)(69590400006)(4744005)(26005)(36756003)(6506007)(6486002)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6542;H:VE1PR04MB6528.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Am9MVJojsrcTvaMFav95z63ciWS23rXfrYljOcmtRXzJBNp6HK6AgYx+Q8iQObS5NUI5ZK2y9BqXfx8x1z8hzivnvy49jUKlAAKFZiJyjFvrpHNkMoJXEoLmj7b9vWxtG1uJB74hdkrQ+8M7O/21tP2Xy6HW931Jc4rU/xn2R+x9SoMOopSinawWrStNIK69868PQ/nEUq4cMFb4R0EqYfY3vU+OSsgWu4l/ARlpeaihFVUxmrkAdDWImyqNZXjTe6xZsOC2GMvd5sMybxwv0wY1K8GaAiKEir9hV5EyP5Qh65rRajN+jak5/8bl30nY/Ia+eS05yEBZ+tr1sb3NZMipD0m7Y0T+DfIFw5R/GPZ5CJ/8uAk8CppboR6vjRrnGMlJxaN9dpPXo8l/vZiVvZFX48xW11IbkHXF4XjZDqNuIiHLEFAKhYNXZaII5RE1H/ELGRvl8xiFLW8DTRlZlOkEr8TRZETIvtRgUsdx18AN2DhdQzzfKe23Ac9oZij
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2d2dd3-2209-44f8-3ccb-08d79cceacf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2020 10:59:37.8703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X14z7bvpsDoRj67EzbWIWtC6PC8BaMuJlu1770j7PzC5nvPB6wQCe2qymqwuQfxQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6542
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is to prevent any possible events generated while unregister
tpcm port.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.=
c
index c1f7073..3b42ef8 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -581,6 +581,14 @@ static int tcpci_probe(struct i2c_client *client,
 static int tcpci_remove(struct i2c_client *client)
 {
 	struct tcpci_chip *chip =3D i2c_get_clientdata(client);
+	u16 val =3D 0;
+	int err;
+
+	/* Disable chip interrupts before unregistger port */
+	err =3D regmap_raw_write(chip->data.regmap, TCPC_ALERT_MASK, &val,
+			       sizeof(u16));
+	if (err < 0)
+		return err;
=20
 	tcpci_unregister_port(chip->tcpci);
=20
--=20
2.7.4

