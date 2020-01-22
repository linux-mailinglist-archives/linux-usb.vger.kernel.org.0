Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A598144989
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 02:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbgAVBrE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jan 2020 20:47:04 -0500
Received: from mail-eopbgr20050.outbound.protection.outlook.com ([40.107.2.50]:8523
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726605AbgAVBrD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Jan 2020 20:47:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQRpZOv7Jgqv0HigMb49nm4fc/eatGA/4rkcuuJX6cSNxzR8x/eh1c8GUTRmRC1o8WMpnFL3AQPc+OgYwljj8kFG1YPLoyKDmeuFv2DHEkzDkFjaFFzQv+myvYPKbHix7+VwLhh9piA5YRpfa0XkiuaPbzjx/ZETUG2LFFtO0MqOr25PLux7EE8tFpf9U7tuXA0qq70gyFQsqzjQk6MbsGyvKKnoFVzPgTB6L0HjWXIHVrsli5yP5+sz/CAVBqvoxtSL10wg4Y+MdH23DfFTm/mjSS3fcaFlSDAQft6p7gpzaHhV6V8xWPoZdVxkktqSjL4+p5ZfISVsqnTO0hAucA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsH4P0to2KVuW0DrYV41UwW6PpAhyUlAcL+hAX50AwA=;
 b=S7knoJ7ytHRBAcRH8tT1/KyUzQJvI6hSNd0Ni8aalxXrM6Bb4U+l6wLG5+1Y6R0WjniSK5dA+eddRyP/AhvwRBUTvGvnd1Wiw94A0sxcT7qzLH2YQvggcYA1JLAtKX1qSQOhpjKmNzCeAWPzODGNZcvs4NunIh0sWvm/YexVCZ6zNRoRlcaJGTaBUE6iOTqvIcjVnwLkDes9NND44Ns8pUm7naesZJw9El5AQ0MoRUVRftqp13NFFD6uzoqxqovfz1F7Kh5C6zdHdG5/pc2VeIEZbFP7u5HPd+rX7HuFELuHgstg/fKlXdjmZlcpyO5f1adbXjelz/0dWEWNKFz/cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsH4P0to2KVuW0DrYV41UwW6PpAhyUlAcL+hAX50AwA=;
 b=jrHkn4hJsIwM+2LKodqDcIivHZ+gKFwU7KfcgFqXYnz5UTbH+tGj0nfzpMQLdTx2XQkMaryPSDJq/g9TMX8WHQx/v0dvNLy0lzajg9ZoVoayOKG/tx+aEoxFBLgUecdWposh3/5RX8xSpHn9/w3QMaD55Xvc+R9UEjgTQ1IEGAM=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB5997.eurprd04.prod.outlook.com (20.178.122.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19; Wed, 22 Jan 2020 01:47:00 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2644.027; Wed, 22 Jan 2020
 01:47:00 +0000
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by HK2PR04CA0087.apcprd04.prod.outlook.com (2603:1096:202:15::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18 via Frontend Transport; Wed, 22 Jan 2020 01:46:57 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/2] usb: chipidea: handle single role for usb role class
Thread-Topic: [PATCH 1/2] usb: chipidea: handle single role for usb role class
Thread-Index: AQHV0MXVAa0xmTWM50SXVAa/K/XUBg==
Date:   Wed, 22 Jan 2020 01:46:59 +0000
Message-ID: <20200122014639.22667-2-peter.chen@nxp.com>
References: <20200122014639.22667-1-peter.chen@nxp.com>
In-Reply-To: <20200122014639.22667-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-clientproxiedby: HK2PR04CA0087.apcprd04.prod.outlook.com
 (2603:1096:202:15::31) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:5c::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e4338abb-0851-4dc4-5232-08d79edcf811
x-ms-traffictypediagnostic: VI1PR04MB5997:|VI1PR04MB5997:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB59976376EF650500C4951C2D8B0C0@VI1PR04MB5997.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 029097202E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(199004)(189003)(86362001)(1076003)(52116002)(26005)(66476007)(66446008)(66946007)(66556008)(6512007)(64756008)(5660300002)(8676002)(71200400001)(2616005)(316002)(6916009)(956004)(2906002)(4326008)(54906003)(6506007)(478600001)(6486002)(8936002)(81166006)(81156014)(44832011)(186003)(16526019)(36756003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5997;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bDIjaa4NZS+hhc+vHRigbv23Jy9KewKAq7Z+O62n7XuwJbJlOcBdb6FVdDG78AkdMTUgHuitayAXYbs5WKnRb6NWAESl2tHKskro1N9zT+/oKtVNqNBsVc/cBJwKrUDIC4JW78iKpAdjU9OEp6EyS+38+BYOY/gmzp/52W5rUoMwxMcKuhOU3QfMGPqNxJFb0XfVKncBQwLnAVkCtcMgnIUJDLtQhNyjWzUHJZz3Lu/NWGElEpVwyGLpW77MBPnmR90AqHCWHGWMQIpNxUr0PDG7Xisd/iLnIMY3m+p/qckai1ChIl8H+qHPBGyrYzRv+wGt1/xk8PCIjTix73YVtvf/BQd+tiTEdHVxB1eABqOLL0fx2SKViE0hnKfTHgpqML/B0NmS4g3XNjzCHmQ0vBs3iCoiKqiShGkrVzJq1Z7uD4e2C0TbmqY76PGnQNah
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4338abb-0851-4dc4-5232-08d79edcf811
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2020 01:47:00.1125
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vcSvcfU3/jSp2NcCbJaOu/L1vqW8rRBdsu/7F51+f9YCQavKspXht+CmIza9a/t0UqtxgLDpNn/+v7wqVmSX+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5997
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Jun Li <jun.li@nxp.com>

If usb port is configed to be single role, but usb role class
is trying to set unavailable role, don't try to do role change.

Signed-off-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/ci.h   | 10 ++++++++++
 drivers/usb/chipidea/core.c |  4 +++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index 6911aef500e9..d49d5e1235d0 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -302,6 +302,16 @@ static inline enum usb_role ci_role_to_usb_role(struct=
 ci_hdrc *ci)
 		return USB_ROLE_NONE;
 }
=20
+static inline enum ci_role usb_role_to_ci_role(enum usb_role role)
+{
+	if (role =3D=3D USB_ROLE_HOST)
+		return CI_ROLE_HOST;
+	else if (role =3D=3D USB_ROLE_DEVICE)
+		return CI_ROLE_GADGET;
+	else
+		return CI_ROLE_END;
+}
+
 /**
  * hw_read_id_reg: reads from a identification register
  * @ci: the controller
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index dce5db41501c..52139c2a9924 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -618,9 +618,11 @@ static int ci_usb_role_switch_set(struct device *dev, =
enum usb_role role)
 	struct ci_hdrc *ci =3D dev_get_drvdata(dev);
 	struct ci_hdrc_cable *cable =3D NULL;
 	enum usb_role current_role =3D ci_role_to_usb_role(ci);
+	enum ci_role ci_role =3D usb_role_to_ci_role(role);
 	unsigned long flags;
=20
-	if (current_role =3D=3D role)
+	if ((ci_role !=3D CI_ROLE_END && !ci->roles[ci_role]) ||
+	    (current_role =3D=3D role))
 		return 0;
=20
 	pm_runtime_get_sync(ci->dev);
--=20
2.17.1

