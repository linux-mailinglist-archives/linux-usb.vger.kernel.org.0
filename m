Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB3CD1423BD
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 07:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbgATGnW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 01:43:22 -0500
Received: from mail-db8eur05on2060.outbound.protection.outlook.com ([40.107.20.60]:6051
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725851AbgATGnW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jan 2020 01:43:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FY5An/Jni61qJl+sfKL3Pw029BDJE+pR+qq8c/cEEzpzVcd5tUcJ/FfqslWr+AWo1KDMk+F2OxiWy1Y3qkLPqjAyPz2X1oN95lYyoA8b1/lFN7nj66S1NyHZID16MxZHSbFtzSXvzMQ1ZWgPIV42m47qvljAdyhVGPaJ2dm8t4w9KrFTGgFNNPbCkAwZFaWCAW1XNGH+v1S3rysJxmXYvT2cxtNfiF+pns6URTICsuSm1+h/wibA2/+352yPGwSrnuBmfO1Ixu50jAay32kE+YMYe8eVHZbse06f1pjf9rBJN0RLMtAjbpwRLtMRuk/HwHTzFmRqlCfbrgy/eFSkTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IISox83PDWAibq5v1k/GvcjX6HwfbMc7Xc5NzD+bfjY=;
 b=aBrbjOIinRcNJ6uo/Z6nz1I8iSOxSbKh8OfvJlryUru3BSVzPxkvd2aXze8rJm4FFYMRBok4MPXBPW42UZLm5C6LxIirUQKyyZ3fPwtMESqd+VEYqeU6zmVppOonJwvA41IlG3vG1r6dj3ktuG/mYRzsI0AbUnXQWueUEC8Q0OrYcUePGNGPILfRFVKt25jfp6N6u+ikewVEs3iUxeu6hN5NsowMOqLYoqq59AhWW5W6ZPQO0/ANjAZRehbTu8QJqaBkGWWN8QiBkb+EDYxPRwclAi6+iCYsYlDZfhHvhp/DZbBLllWQgCHiez/2leUajaGFPNLQxXSR5zrNzwW92Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IISox83PDWAibq5v1k/GvcjX6HwfbMc7Xc5NzD+bfjY=;
 b=HORC6XWnG41j3er8ZqmRdFCVrWfQ8xy0eqrIzYWDZuTWBdoXaXjX+iydHytKuAY4dNjToIBCSP47fLnJAFiJgrWTiK4eJ9Ci07uj9t+CTh7SRsQl2Jopg0qL7Pkso3SCgpUNoSX7aGko8aP5h0sFkos/bXi3zad+nadfzEz0RO4=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.235.146) by
 VE1PR04MB6541.eurprd04.prod.outlook.com (20.179.234.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19; Mon, 20 Jan 2020 06:43:19 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::fc52:45c6:88a1:b5e3]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::fc52:45c6:88a1:b5e3%7]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 06:43:19 +0000
Received: from localhost.localdomain (119.31.174.66) by HK2PR06CA0002.apcprd06.prod.outlook.com (2603:1096:202:2e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2644.20 via Frontend Transport; Mon, 20 Jan 2020 06:43:17 +0000
From:   Jun Li <jun.li@nxp.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: [PATCH v3] usb: typec: tcpci: mask event interrupts when remove
 driver
Thread-Topic: [PATCH v3] usb: typec: tcpci: mask event interrupts when remove
 driver
Thread-Index: AQHVz1zmtDK7zP6V60mVDiTi2K4ODQ==
Date:   Mon, 20 Jan 2020 06:43:19 +0000
Message-ID: <1579502333-4145-1-git-send-email-jun.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:202:2e::14) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 864aa2d7-6f07-4cbd-bb40-08d79d740932
x-ms-traffictypediagnostic: VE1PR04MB6541:|VE1PR04MB6541:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB654160CD27CD90E811EC4E1589320@VE1PR04MB6541.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:519;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(199004)(189003)(26005)(86362001)(66556008)(5660300002)(64756008)(186003)(110136005)(66446008)(2616005)(16526019)(4744005)(54906003)(44832011)(956004)(81166006)(81156014)(2906002)(66476007)(8676002)(8936002)(6486002)(66946007)(6512007)(6506007)(316002)(71200400001)(69590400006)(52116002)(36756003)(478600001)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6541;H:VE1PR04MB6528.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iXLmyWqOHMrhUedhP+xYKP+tmM7YsVfhqzWRPEB8f7QewnjiJJPCTDUv5C3ODXcBjqKlGd0to0B1J+CodV+RE3dAkec4crBDV+WsxWrbLXzSGOGAoOTY/QwosQw5oEvt7CrzI+8sae5LTbWRgjI4COE9C6M2OEnDgePxcWn5OiJ8owXTRG2yY90E8Z4avzCFoVoilmDy5wG1Jlg4c4ftKp74zQOGbAhDyy00VBoCL7D670SrAl5hxKUJqfSqht3j55tuxbgPoeg/YBPUB+dMTYrKdK/WTOQHUSDZ/MJQS0g6N8kQ/vZcHBJH5XsTjz3vVIItD8XFmYBe+VY2ZhN7H9bL6wSCIMv1pv8BDN5Fk5sez5eJzTnTLfvzuDJM33Tt/QvfMHjMc8YKVs8S982V1ioJqsxCZIGTz+BMBRIbx8fZPzzNvrJCjWTIq/VI++3barsXy74Th9M0vsqPLUYLIf8XfdUrB9l+SV4xmokQvIy50sLhJBYb4BBZ8ftNNTvx
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 864aa2d7-6f07-4cbd-bb40-08d79d740932
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 06:43:19.6009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h3wPBwr6j03yMvFKu1xwY2Kx/1MOuwTMsdo8Bhxc2edynQLt6iAp3YiexMYYGReB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6541
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is to prevent any possible events generated while unregister
tpcm port.

Fixes: 74e656d6b0551 ("staging: typec: Type-C Port Controller Interface dri=
ver (tcpci)")
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.=
c
index c1f7073..dfae41f 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -581,6 +581,12 @@ static int tcpci_probe(struct i2c_client *client,
 static int tcpci_remove(struct i2c_client *client)
 {
 	struct tcpci_chip *chip =3D i2c_get_clientdata(client);
+	int err;
+
+	/* Disable chip interrupts before unregistering port */
+	err =3D tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0);
+	if (err < 0)
+		return err;
=20
 	tcpci_unregister_port(chip->tcpci);
=20
--=20
2.7.4

