Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D23C1422E6
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 06:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgATFzb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 00:55:31 -0500
Received: from mail-vi1eur05on2077.outbound.protection.outlook.com ([40.107.21.77]:32801
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725783AbgATFzb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jan 2020 00:55:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMLIBu3VCbzEHpKe4YcoisFynxyI+5FdMZNPA44zkjv1KU4sOAtMNSpdpWJ9bXlT0UnpDJDRB/XNTMfazjN+AMz/CUpt8PsySuh8d/+SN/MH/Y4tmYoCIZrbbOB/zdkjJzTnsVDjAoGbuyQ/pemC4Nlcxeez0Vo81IwCIFBLFPiqJ/6LhOjXCsP2vDT+Zxy4wUygUI/NylCynVyR1uuF8UvsTP/6XoATB6U4U8REtLEWvqL8IydYTBjTf2u88To0DX0LEJcpiKAb/Jpj8ZsVosi8B32tL5QepyFOSRMUiy+GveiECb/OROOBTD1ttWH8UiN4ceJ3ysAyn1mopTJTVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVZADzi9pcjJKxYFSlNWguBpFslrjGu2/kK8yXooDmc=;
 b=N3RfapFQa1uC5zWsuT8jrNwbdTDytMwFv8oFpdGvGxG1v9Xc8LHAh5AE5udTC396SZpXqa5WYvGrbsSDnQS3/CMVxXEUGr8yFX5Q4bQSXhmABA+Zu78xJ/oRCx/3acoB4kz+z/zxWcPEkMnpc8iTykGi71pqCA73qks5483EV89slPpJw/dcVP696khVA8SpQlHK+EKynkQRWP+dKa0RFrfek1CBtdX5RXSN2XMdelzWMrr79b+rGopgWq2Oeundc9gXcUWJAclHu6mX998uXqxnrKoTk/Qww/fYEUIPuJ/KhpHYM5iPz4wKSudQt3yXJ75FoMZprExTPQj6f1B/sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVZADzi9pcjJKxYFSlNWguBpFslrjGu2/kK8yXooDmc=;
 b=nuJgkBrrdhzAhzkFExCybmbM4EGXtlfUmX9BUDELIZ4LG1IY+hOsVdUtJVxOZrR4YhK/tDeXThgC4GwMhhzPOTRDcLhhs0wSn2GPQ2d/NHktAqE9cx4AAM/kv5vICxEq+3Lwb4E3kJE/HXubAhhPlahvq2MVbVWS7hxY35NqrgU=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.235.146) by
 VE1PR04MB6669.eurprd04.prod.outlook.com (20.179.235.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.24; Mon, 20 Jan 2020 05:55:27 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::fc52:45c6:88a1:b5e3]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::fc52:45c6:88a1:b5e3%7]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 05:55:27 +0000
Received: from localhost.localdomain (119.31.174.66) by HK2PR06CA0024.apcprd06.prod.outlook.com (2603:1096:202:2e::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2644.20 via Frontend Transport; Mon, 20 Jan 2020 05:55:24 +0000
From:   Jun Li <jun.li@nxp.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: [PATCH v2] usb: typec: tcpci: mask event interrupts when remove
 driver
Thread-Topic: [PATCH v2] usb: typec: tcpci: mask event interrupts when remove
 driver
Thread-Index: AQHVz1Y2u7sfBLh5k061yelxtRo6wg==
Date:   Mon, 20 Jan 2020 05:55:27 +0000
Message-ID: <1579499461-13076-1-git-send-email-jun.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2PR06CA0024.apcprd06.prod.outlook.com
 (2603:1096:202:2e::36) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c88623c2-279b-4e93-551c-08d79d6d5912
x-ms-traffictypediagnostic: VE1PR04MB6669:|VE1PR04MB6669:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6669D23B8FCB3E0C844888FE89320@VE1PR04MB6669.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:519;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(199004)(189003)(6486002)(86362001)(66476007)(69590400006)(2906002)(66946007)(66556008)(64756008)(66446008)(478600001)(26005)(71200400001)(4744005)(36756003)(6512007)(2616005)(6506007)(956004)(5660300002)(316002)(16526019)(110136005)(8936002)(81166006)(81156014)(8676002)(44832011)(54906003)(52116002)(4326008)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6669;H:VE1PR04MB6528.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qqBQXdb+9/sHBsdDBkzL/FmYOpymoG6eIFtftIDoUBPhlaEi2ryKZIbYj9r3/2EQHV7ROpdasOS5L+XLxIVPq2Aw6Nt0e89JLGgrMBR4oimVur6hNDb64DpCjoBRIp/vdv+JIRInQSK24Q/ZTI0N2zL346kOBuKM3Qfy23XgTaaNu1Dvvc7EMImBxxSyybJF6uPqFT7N5NYWrOYMUQI4klPiaiSvt+z9B/G6u6sbYUutd0BcQl/73yKC7mjtsu+zlCZiFGAx77Cw8FtbMLJdYXfUVGXGut6OGJha1Htb3t3OzDCWLwNxTD5KXOAO98JkEp9ZbP/FB5dnS/Bytc7dyx3eC9KVnEB6Nsg7dGVA7n+Isdtxy28RUGwXdXc0k6341ZWmHkB2fGtn6cM33f446YlMqt2Uy5Fx6LSYYofT5YEje1pzapO0JaboIOymLONGUtT5xNtRF17+exv4xeNrCZi6r1ck5SH2vzbA8DG+eip7EyLlqW8m4SEYVurF4rtn
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c88623c2-279b-4e93-551c-08d79d6d5912
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 05:55:27.1641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bxt4nrD43RbolSw3lBiVo6Jg5AUbHRNbgiD2ISXuMycjDLVAkpr7QAmgv5SVDPni
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6669
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
index c1f7073..fb9f2c1 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -581,6 +581,12 @@ static int tcpci_probe(struct i2c_client *client,
 static int tcpci_remove(struct i2c_client *client)
 {
 	struct tcpci_chip *chip =3D i2c_get_clientdata(client);
+	int err;
+
+	/* Disable chip interrupts before unregistger port */
+	err =3D tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0);
+	if (err < 0)
+		return err;
=20
 	tcpci_unregister_port(chip->tcpci);
=20
--=20
2.7.4

