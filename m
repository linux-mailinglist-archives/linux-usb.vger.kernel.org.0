Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB98BF6E90
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2019 07:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbfKKGak (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Nov 2019 01:30:40 -0500
Received: from mail-eopbgr50085.outbound.protection.outlook.com ([40.107.5.85]:60644
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726834AbfKKGak (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Nov 2019 01:30:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ad3G5mSl9xpTkv0ycOA6nbvCknXDfASmJfZU89WFXCv6fGbjbIRGKgI4XRUqnd0VOJ5yNrmoq8s1Ytb3S2rUtEn9jT/vT5jTX+9pgW/f68hzn4da3tLi4AZ22vFIYd9yRQx9HjE5ylO5gpffo8NJvu6+9VLOy4vIHdz1ulL55KC0YPOgbl2Wl+Brv3NdxWv7zjg0qagCC0K2H0Ns35Fr1DeZYHKwnfYPAkR/GOlweVxO1+GfaD3iCigwVRWEL6v4OoqjEO/hRb0PtzuYRNUbdIvww2SzpQ1yC+51SaDFStYvlq0PIJOWRboLe4H6dk5UjlttmzGf9B/JiajFHGWcWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfhofLEes/eFMYZArqObfJclC6gw2ExUSwXX1qbSdOE=;
 b=I6HQlVd5hIEqWSy62T/19gxnBjOcrtEeiOADkvFVpb8eKrgY/9rKRhW2WSjh1GUum+1AaGFW2NWpKq8+ImhkxswlrT/6HqrFbyyCFrPRKPUl9O4sWeG7zRBd6EgYq4UuL3/85k8gYvrdEQCM8xtOuiATbDzKJ4ca3pWI9XdhsAnxYccXlg3QuG7+jfBGDpCAG2BCpvXAzrNsbq5FQbnBEiOqYyBvl6Zs4vQfnpr+OGYputZrGt6VMV64HXwz617/zX5VNF1ZpM40/VxjAeUahjMEK0xlYzSjh3GzCrbLfSDpy8Kds1WDSzJQpMqBhp/l6FpjRUXLAyWs3wHdU8kiBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfhofLEes/eFMYZArqObfJclC6gw2ExUSwXX1qbSdOE=;
 b=GNIW5tEuDAZ3FxYwISFRdIqq5OSJg8z+4t4tRC4Z7SzgneI5WA/VKFxzriIwqj2xkvUsgYCT5m72rxyvFzDBw4chLVPIKTMLdP+0Tdrd6zxNCpqmoRDYiJM7oV8/HxqWsKLLZiIdd8i+fGQUuKfDYlfEg6NyiB4nVZSaJIS0TfU=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4640.eurprd04.prod.outlook.com (20.177.54.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Mon, 11 Nov 2019 06:30:37 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::68e3:e1a6:78fd:7133]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::68e3:e1a6:78fd:7133%3]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 06:30:37 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 2/2] Doc: ABI: add usb charger uevent
Thread-Topic: [PATCH v2 2/2] Doc: ABI: add usb charger uevent
Thread-Index: AQHVmFmH0M7QfTANVk+mTGnqeUCRJw==
Date:   Mon, 11 Nov 2019 06:30:37 +0000
Message-ID: <20191111063349.3013-2-peter.chen@nxp.com>
References: <20191111063349.3013-1-peter.chen@nxp.com>
In-Reply-To: <20191111063349.3013-1-peter.chen@nxp.com>
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
x-ms-office365-filtering-correlation-id: fc4fe13e-7193-4abf-51a4-08d76670a9f1
x-ms-traffictypediagnostic: VI1PR04MB4640:|VI1PR04MB4640:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB46402A5A0009BBA157BD46098B740@VI1PR04MB4640.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:439;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(199004)(189003)(316002)(44832011)(76176011)(36756003)(52116002)(476003)(5660300002)(14454004)(2351001)(2616005)(102836004)(446003)(6916009)(11346002)(1076003)(6506007)(386003)(54906003)(6116002)(3846002)(71200400001)(71190400001)(99286004)(86362001)(4326008)(486006)(5640700003)(64756008)(66556008)(66476007)(6486002)(478600001)(6436002)(66946007)(186003)(6512007)(66066001)(8936002)(256004)(66446008)(1730700003)(81156014)(81166006)(4001150100001)(50226002)(8676002)(2906002)(26005)(305945005)(7736002)(2501003)(25786009)(403724002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4640;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qzNuFOAzYv3APBnXHcBlCamXuDOPu+f6zmu+NK33rrmQHynN7Q8FjquymnJ+kntWo4qUpVJhoe6BtXkhsDb2paiwdb7fYMyeutHxD3AEKkXstgOMNNJcymX1YyxvtvEoZZrZq/1fftwyI4baEz/RN12HbaWLl/MnBfyh7vn7RTRKjUJXWuUE/k0vBOsNidx+3tSUyvZJGXBNeJzzlrykPWOeqtiNawzX5n08nPiyHIfBShvwpHYFEQFKjrVxqx/D1f0bbRJy2yJMapNoKK1Tnj/K7M+eb91CNWJDE7yDjfWFJbQ7Sacg8II8PwSjC+QGrE5X+hMl63SS55USL2SConzwMy+cquHYoFynk8ad/U39e4FsRwNJe/XURDnUlRXCzR5z2Z9m/T79QJpHpt/1acTyNtEZkhTqRb7ugLg7XhgiUTDnCwxePZbWUpxqpdLI
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc4fe13e-7193-4abf-51a4-08d76670a9f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 06:30:37.1668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ywCIXSveV1/ImTmYgHpNfZWImcLDc3pQgaYdPuA/3y0PUtpfJxZ9JAoXceBphop2wNYpCy6zC3ZYr5+a/RKIdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4640
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the USB charger is inserted or removed, the users could get
USB charger state and type through the uevent.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 Documentation/ABI/testing/usb-charger-uevent | 45 ++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/ABI/testing/usb-charger-uevent

diff --git a/Documentation/ABI/testing/usb-charger-uevent b/Documentation/A=
BI/testing/usb-charger-uevent
new file mode 100644
index 000000000000..93ffd3a54a7f
--- /dev/null
+++ b/Documentation/ABI/testing/usb-charger-uevent
@@ -0,0 +1,45 @@
+What:		Raise a uevent when a USB charger is inserted or removed
+Date:		2019-11-11
+KernelVersion:	5.5
+Contact:	linux-usb@vger.kernel.org
+Description:	There are two USB charger states:
+		USB_CHARGER_ABSENT
+		USB_CHARGER_PRESENT
+		There are five USB charger types:
+		USB_CHARGER_UNKNOWN_TYPE
+		USB_CHARGER_SDP_TYPE
+		USB_CHARGER_CDP_TYPE
+		USB_CHARGER_DCP_TYPE
+		USB_CHARGER_ACA_TYPE
+
+		Here are two examples taken using udevadm monitor -p when
+		USB charger is online:
+		UDEV  [227.425096] change   /devices/soc0/usbphynop1 (platform)
+		ACTION=3Dchange
+		DEVPATH=3D/devices/soc0/usbphynop1
+		DRIVER=3Dusb_phy_generic
+		MODALIAS=3Dof:Nusbphynop1T(null)Cusb-nop-xceiv
+		OF_COMPATIBLE_0=3Dusb-nop-xceiv
+		OF_COMPATIBLE_N=3D1
+		OF_FULLNAME=3D/usbphynop1
+		OF_NAME=3Dusbphynop1
+		SEQNUM=3D2493
+		SUBSYSTEM=3Dplatform
+		USB_CHARGER_STATE=3DUSB_CHARGER_PRESENT
+		USB_CHARGER_TYPE=3DUSB_CHARGER_SDP_TYPE
+		USEC_INITIALIZED=3D227422826
+
+		USB charger is offline:
+		KERNEL[229.533933] change   /devices/soc0/usbphynop1 (platform)
+		ACTION=3Dchange
+		DEVPATH=3D/devices/soc0/usbphynop1
+		DRIVER=3Dusb_phy_generic
+		MODALIAS=3Dof:Nusbphynop1T(null)Cusb-nop-xceiv
+		OF_COMPATIBLE_0=3Dusb-nop-xceiv
+		OF_COMPATIBLE_N=3D1
+		OF_FULLNAME=3D/usbphynop1
+		OF_NAME=3Dusbphynop1
+		SEQNUM=3D2494
+		SUBSYSTEM=3Dplatform
+		USB_CHARGER_STATE=3DUSB_CHARGER_ABSENT
+		USB_CHARGER_TYPE=3DUSB_CHARGER_UNKNOWN_TYPE
--=20
2.17.1

