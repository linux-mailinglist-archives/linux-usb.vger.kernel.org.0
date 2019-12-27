Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D57B12B405
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2019 11:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbfL0KjX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Dec 2019 05:39:23 -0500
Received: from mail-eopbgr150041.outbound.protection.outlook.com ([40.107.15.41]:14565
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726354AbfL0KjX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Dec 2019 05:39:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDnElXQsRrEMEOUPBYMGSvV/NBQXB7ZRT/6QZjpJmEiYiQSBWRH+tYvNJMRQUZPSVJVwpWFiUkdWK9V7dfOfuGduiov1UMGXhCdaa1pMEuwlonxAabjD54ivZ8+Y7BBoPNkRW6sH6mbraDDAY4vp9SAUVV0VEi+U9n9C9yHMlf3dJYb73KA4K6KW7ewsClDDPt0ElNe6iSBPDLt6BS5gc0lqTJ7NAnEnNx8ZD3TTK1kY8b9bPKs4W5KjklOt5s3tPBJKqargP9l1GXFtIWjHc79uM2LKlggeXkWJOnO+sW5Poho8w2x0EPxTcnuGJDpWhcUsAHDUAHtkRAI5MRxzmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxLLPA8qa4oMaAML9JlMVaJolCckgXAVcbYcyz4+khU=;
 b=AVL6+NXHjfX0WTmQjeNO63pkYT06bjOCxsG0ZrUcrAOV2DTFXXaMfmKVjMIpZmRRUDBf9EAtMDqigiSpXOb6VsZbCteYzUuZteeGvkwwByPFFl+uvnamiI6E3afZfkCyZTmLxyahokRR/PYRQeKIH2E3qtfwl3FRVGxdwQuLWSAUui+zgZ8VJgru4ZTVeD/9O+AS/V3Envd0qi741WIi9W1Bz7110y54XZcZlUrcdOU1DGDgg9iop2c4JCZC/KotKFzk/53V4ZofqD2sMLzwG7f0oKJKXPe9wCLcvdmZY42P38bnOl7+5Ub111ABBOQCgwVWUqxSmOpIhMRx+XkfFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxLLPA8qa4oMaAML9JlMVaJolCckgXAVcbYcyz4+khU=;
 b=PYuxWTp01TtHQA5CBfi2RE0oLLAhfn71QKZq49FR9pYD+d5C/dk9gTL3PidXVjkoamgao8lYEFB/nEEsDP6AKwFUQ47XO4/UzrDcH6px6n7T24i/fetuAIDY7P/Z3isM2FVNyas2Wgu1HXJtw03944BtbCpDnDpG/tJjZLF3Q9w=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.235.146) by
 VE1PR04MB6351.eurprd04.prod.outlook.com (20.179.235.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.12; Fri, 27 Dec 2019 10:39:17 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::fc52:45c6:88a1:b5e3]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::fc52:45c6:88a1:b5e3%7]) with mapi id 15.20.2581.007; Fri, 27 Dec 2019
 10:39:17 +0000
Received: from localhost.localdomain (119.31.174.67) by HK2P15301CA0003.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2602.6 via Frontend Transport; Fri, 27 Dec 2019 10:39:15 +0000
From:   Jun Li <jun.li@nxp.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>, dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH 2/2] usb: typec: tcpm: set correct data role for non-DRD
Thread-Topic: [PATCH 2/2] usb: typec: tcpm: set correct data role for non-DRD
Thread-Index: AQHVvKHjC6zqhzWfdEevqj0S0FBRhw==
Date:   Fri, 27 Dec 2019 10:39:17 +0000
Message-ID: <1577442957-6921-1-git-send-email-jun.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2P15301CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::13) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e13ca2f3-229c-45a0-67fa-08d78ab905f5
x-ms-traffictypediagnostic: VE1PR04MB6351:|VE1PR04MB6351:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB635105B92CCC1CD32145EE9C892A0@VE1PR04MB6351.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-forefront-prvs: 0264FEA5C3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(199004)(189003)(81156014)(66946007)(2616005)(81166006)(8936002)(956004)(26005)(64756008)(66556008)(8676002)(66446008)(6506007)(478600001)(52116002)(66476007)(16526019)(186003)(36756003)(6486002)(5660300002)(2906002)(6512007)(69590400006)(316002)(44832011)(110136005)(54906003)(4326008)(86362001)(71200400001);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6351;H:VE1PR04MB6528.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5o90cBJQ1JccsAx64SJdJQB/llJo7nSWXcnxxsA3gXz3obxKeYJW1RzfTkaO+y97H8Ej24rAK4CiSNSWsU0jf4kqlvnGXVzuIwaIZgb8CVcq8sBeQwKKBFs5O3xiI2Su6JH1VYWYOr7pbQUg0FeBtwjkPGJv8k6eWUzEjMaIBR5048vRFJxQQp6ip15EUuDqyDPYq2vtO0lYY0zEISX6WKJajfw/zrvRQ/h88NTprGHuCIDxAb4PxIYGp9XkpmxYUfO4VQgTw9vxW22h49eecULr++fUNZQW0h4J6RKqB+Z5sRJnTpgw5W7DwthdLLSl/MpJcC3L6YD4//jmuWAwuzPeDTKoZU/tTPuWYDExwSjMrwKySK12i38kIIGjk0ZGREf8nS/e0eVYzODXDMc9McuynGtDMN+zKMHUuuyUmO/Hc9JZ4RGiuiwWdM+yTkPdxUx1X0zKBpZt80EHVqNTj2m8V/xCOR7B+h/TdCXpL3J6yjX814JLk1mV0DIN4E6s
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e13ca2f3-229c-45a0-67fa-08d78ab905f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2019 10:39:17.1825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uB5g5HUwGII9eGq24DhPK8YKF2yYyRdhDPiKDAc2hiRLh0CS4ZpDC0RZJxwhvdga
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6351
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

Since the typec port data role is separated from power role,
so check the port data capability when setting data role.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 56fc356..1f0d82e 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -780,7 +780,7 @@ static int tcpm_set_roles(struct tcpm_port *port, bool =
attached,
 			  enum typec_role role, enum typec_data_role data)
 {
 	enum typec_orientation orientation;
-	enum usb_role usb_role;
+	enum usb_role usb_role =3D USB_ROLE_NONE;
 	int ret;
=20
 	if (port->polarity =3D=3D TYPEC_POLARITY_CC1)
@@ -788,10 +788,20 @@ static int tcpm_set_roles(struct tcpm_port *port, boo=
l attached,
 	else
 		orientation =3D TYPEC_ORIENTATION_REVERSE;
=20
-	if (data =3D=3D TYPEC_HOST)
-		usb_role =3D USB_ROLE_HOST;
-	else
-		usb_role =3D USB_ROLE_DEVICE;
+	if (port->typec_caps.data =3D=3D TYPEC_PORT_DRD) {
+		if (data =3D=3D TYPEC_HOST)
+			usb_role =3D USB_ROLE_HOST;
+		else
+			usb_role =3D USB_ROLE_DEVICE;
+	} else if (port->typec_caps.data =3D=3D TYPEC_PORT_DFP) {
+		if (data =3D=3D TYPEC_HOST)
+			usb_role =3D USB_ROLE_HOST;
+		data =3D TYPEC_HOST;
+	} else {
+		if (data =3D=3D TYPEC_DEVICE)
+			usb_role =3D USB_ROLE_DEVICE;
+		data =3D TYPEC_DEVICE;
+	}
=20
 	ret =3D tcpm_mux_set(port, TYPEC_STATE_USB, usb_role, orientation);
 	if (ret < 0)
@@ -1817,7 +1827,7 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *po=
rt,
 		tcpm_set_state(port, SOFT_RESET, 0);
 		break;
 	case PD_CTRL_DR_SWAP:
-		if (port->port_type !=3D TYPEC_PORT_DRP) {
+		if (port->typec_caps.data !=3D TYPEC_PORT_DRD) {
 			tcpm_queue_message(port, PD_MSG_CTRL_REJECT);
 			break;
 		}
@@ -3969,7 +3979,7 @@ static int tcpm_dr_set(struct typec_port *p, enum typ=
ec_data_role data)
 	mutex_lock(&port->swap_lock);
 	mutex_lock(&port->lock);
=20
-	if (port->port_type !=3D TYPEC_PORT_DRP) {
+	if (port->typec_caps.data !=3D TYPEC_PORT_DRD) {
 		ret =3D -EINVAL;
 		goto port_unlock;
 	}
--=20
2.7.4

