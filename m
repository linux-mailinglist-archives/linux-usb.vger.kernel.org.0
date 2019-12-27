Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8209712B3EB
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2019 11:35:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfL0KfJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Dec 2019 05:35:09 -0500
Received: from mail-eopbgr80075.outbound.protection.outlook.com ([40.107.8.75]:41662
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726354AbfL0KfJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Dec 2019 05:35:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNZv0oxxlU2mvUzw/YoBTtKpGih1+YLvFPdqdRVnBNYlJWm52vSxOiqU/132rUYNp+QohdjemTy8TvvmTResTmFVhtGg7CeEIyvRFYrNS9PUIdCKTyCJH1K1TYWn4w2wN8kuxZQNhZNSBNCXVs1UnftdsntWrqrZqIPo8YTr78bIQEpffIahw/HgWHr9nAMRaaFtvsp1aOpSotbPgFe/ovcUzBywjwrACMrah9E1X0t8AXGcQkE5CJUjLMX12dhQ+zTmJ278n6khuAO9pxVwDs1FrgAO6dnEGWKDkTJVVD1mh6kiAQW8nXNr5h/Fc/czhB471oN4pmuNfIUDefReOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60SE79mXJjs3uqIOksUTlV0qyWdszjfGCpTRJDMcY0I=;
 b=MthV0c9kaqxM4/jZjTYlsYVWpxv7H0liEoKBBjfQR38NwVq/+DYMjcceol0BKeHEF0cv+Nl0LO5Ulm9NX/4PhRlRpA1z+eB3/UFkg2JZAUh9o1wqssLVrBRMDWGYOZ/l2NfVo03fDTg1KFy9aNGun8/uVjojWiMJwIgg0W6+oATKKSK84UdpUo8+eyvhD7TyxLjMDggmUxM2ga7GCwTqYnfV6NGsRRdDhDWtwhZfF7OChjLo0YqpmY9RnbBHHqqq+t3Ut6FOxhWVbn5j7MLC4HDHP8LSdrp6O0Uzs7PZEywejvSnb5Y0CMmuRMPjDHtHKFma80qp3l/R0TyO3GtTyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60SE79mXJjs3uqIOksUTlV0qyWdszjfGCpTRJDMcY0I=;
 b=AVgmHuuQB3yLCAVF0he2ySwE6TR1s5ZxMgX9G3cbS3jVSoxyG2XlMEz58tbwS1fuzdTUzqhXuj761Kr1Z8kqzPrpz+Md3NcGBZJx7xMESpKXYyggWq1ag9j1nJe8m9D38BD8zzcvT5Y/cAAJUITL6ESgahg/Cf7NF0f8WfKiQhc=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.235.146) by
 VE1PR04MB6432.eurprd04.prod.outlook.com (20.179.234.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.12; Fri, 27 Dec 2019 10:35:05 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::fc52:45c6:88a1:b5e3]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::fc52:45c6:88a1:b5e3%7]) with mapi id 15.20.2581.007; Fri, 27 Dec 2019
 10:35:05 +0000
Received: from localhost.localdomain (119.31.174.67) by HK2P15301CA0016.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2602.6 via Frontend Transport; Fri, 27 Dec 2019 10:35:03 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Peter Chen <peter.chen@nxp.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>, dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH 1/2] usb: chipidea: handle single role for usb role class
Thread-Topic: [PATCH 1/2] usb: chipidea: handle single role for usb role class
Thread-Index: AQHVvKFNRg8RkjFKY0+13/boonDL9w==
Date:   Fri, 27 Dec 2019 10:35:05 +0000
Message-ID: <1577442705-6873-1-git-send-email-jun.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2P15301CA0016.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::26) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0ceddcb4-3ee8-4673-c1ac-08d78ab8700d
x-ms-traffictypediagnostic: VE1PR04MB6432:|VE1PR04MB6432:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB643286600D0FC9DF5FEB5EF7892A0@VE1PR04MB6432.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0264FEA5C3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(199004)(189003)(71200400001)(6512007)(5660300002)(81156014)(6862004)(6486002)(36756003)(316002)(37006003)(4326008)(478600001)(54906003)(81166006)(8676002)(8936002)(69590400006)(64756008)(66476007)(66446008)(66946007)(66556008)(186003)(6506007)(26005)(86362001)(44832011)(2906002)(6636002)(2616005)(956004)(16526019)(52116002);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6432;H:VE1PR04MB6528.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vNE+cuFWl455TL7gTnNGZIqFKZjd+Nad4Lu10Bukg5aKYCm83VE2VjXTNMpCgvF7HzMTpQjl/JEliT57YM1AuHcHDTZ8XqQ7G3cEnfw2iHd2BeDUs6OB8Bcfm1AlrG4Xpa+cJ5IoDvskL4upPNvByEPXfh4Deq/G5oQ8vShjRlFHTRftTJ6rdcUAXDYlVdGXyUmzGIZ6sKFcbDWhy9T4Pu/OazdmE4i3HePK36itQXuBS2TDbYqgCz3mozBIMFkqO0sqCJoouaZ3LofdadsnEF7Mm+jOBODhHhaJAkIr/wU7u7n50kuI4WpfJH/cRDDXSlN3Kq6slo79B6seowopIrQY2aAcEtuDPkVxLnN3HBj5vDvV1oi39RveK8al4t0HYBaZu73g0fCnAOLSO1tGn2c+22M4cZHi4un0xj7dQfAPFrXDk+dGCUD2RCrHDRPNcW8syTcd0KySBfIgRJ8Acv60jmIrdPXgb9MXhW+xdiif2zf0fYuzeZX/eQGqybZH
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ceddcb4-3ee8-4673-c1ac-08d78ab8700d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2019 10:35:05.6658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hojaK7BAtDkXX6wk2/wAV8n7OjlvEeLIAXY7REy12UvNpLemVetXa6M3pwnFZGs2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6432
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

If usb port is configed to be single role, but usb role class
is trying to set unavailable role, don't try to do role change.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/chipidea/ci.h   | 10 ++++++++++
 drivers/usb/chipidea/core.c |  4 +++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index 6911aef..d49d5e1 100644
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
index dce5db4..52139c2 100644
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
2.7.4

