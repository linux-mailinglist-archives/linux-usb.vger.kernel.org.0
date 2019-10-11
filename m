Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05B4BD38BD
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 07:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbfJKFm3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 01:42:29 -0400
Received: from mail-eopbgr60062.outbound.protection.outlook.com ([40.107.6.62]:35510
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726116AbfJKFm3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Oct 2019 01:42:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bL+2PNtBZXCRPDVe3qAmXnnaFzWTn0YHVzIBF+dIxqgLUEsndjspKtA0TMVCfFzb9SgIwHxgIlxrcGmibSP0fXr9Bwe4U2lSAegIWgdUU/utA9wW1Ieo3WubuiL+12y3Hc6fVNdA4jO4xkCXeCkyMp6PdsNzm/FHXlCCAjoVi3QFR6BqwEP5kSuc1HIQC7qe2fZARbIpIUPGDmSNtP0NH/qRIs46/WRPswrUxr4RkQUmh2BSfz0hy4ddsOiRulEPu7PAyuyM4xw5KHbb31oykTaJM5Khkw5NR3jW5TFMKxfGQn819M5C6Pkppw3akLOQ24oPd/ZQALH21qe4puhCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5W3xgHYF1T8WBlQn92j0FEqMy0bsddlU/fcBqbBJpgo=;
 b=eryHpW+79k+3iVSaKGndf6d92qgO3Vy3VxrqDqKrosHc5TLXyX0RVxSmjhyoupe4oNO4URX5Lx4+vETdthO7raIKoSj7HKfM9SRVutTocnXt1yN0SuFbftwNTdZILJgJDZCpzlJhVqqRhDNmq7f9sJF13mOuUiOsV6kfBzwljIUkLaB3JcqxGPXfXZJCCeUlhkjPcgP6S+oIkvzh0KLYa5gCOWR2bBM7x8DHkQiIMdOmmYXP8l4U8k6267euoM2WQLWHOMP8arf8+jd8q/mQNUnuOYv2InaXafHHfeZO3yYs9FFR/rt+HZGwJqlLN3fxX6vXi/cVhswaioRan+an5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5W3xgHYF1T8WBlQn92j0FEqMy0bsddlU/fcBqbBJpgo=;
 b=YMfMKboIUBX+qKKA7KWE/JZG6caqscsZDoA5kHKpJVMUh2QGvqGCLsnb1FpdUB1J2eMi/Tu7ZtA/pzcZPoKHvyhAGBnJ6c2rP3xv+GevNv/sLY+E5VEgqdnlCVkA2Ebdpb6lZSnt51aZnQrXIynq7rhvKw9KIkG3wKRz9C73YII=
Received: from AM0PR04MB5314.eurprd04.prod.outlook.com (20.177.41.157) by
 AM0PR04MB4915.eurprd04.prod.outlook.com (20.176.215.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 05:42:25 +0000
Received: from AM0PR04MB5314.eurprd04.prod.outlook.com
 ([fe80::99b0:3cb8:e409:1798]) by AM0PR04MB5314.eurprd04.prod.outlook.com
 ([fe80::99b0:3cb8:e409:1798%6]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 05:42:25 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "git@andred.net" <git@andred.net>, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/3] usb: chipidea: imx: change hsic power regulator as
 optional
Thread-Topic: [PATCH 1/3] usb: chipidea: imx: change hsic power regulator as
 optional
Thread-Index: AQHVf/apXptcQx3r70GtQVZl7qMxQw==
Date:   Fri, 11 Oct 2019 05:42:25 +0000
Message-ID: <20191011054129.20502-1-peter.chen@nxp.com>
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
x-ms-office365-filtering-correlation-id: e5388757-f3f8-4cd8-75ba-08d74e0dcb50
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: AM0PR04MB4915:|AM0PR04MB4915:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB4915CE881DAC4218B2B18C1A8B970@AM0PR04MB4915.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:390;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(189003)(199004)(6436002)(2501003)(2351001)(2616005)(14444005)(256004)(6512007)(8936002)(5640700003)(50226002)(6916009)(486006)(8676002)(476003)(186003)(81166006)(81156014)(44832011)(1076003)(26005)(386003)(305945005)(54906003)(52116002)(66946007)(102836004)(316002)(5660300002)(86362001)(36756003)(71190400001)(64756008)(66556008)(66446008)(6506007)(6486002)(66476007)(3846002)(6116002)(25786009)(478600001)(14454004)(71200400001)(4326008)(7736002)(2906002)(4744005)(99286004)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4915;H:AM0PR04MB5314.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8WwBd+6gXqtkAElP8vvqd8uYanmwZ/RgsFxvyb/peRHLyrQqahERw949Ca//WNGSWVCIas/vxMjKEsOahZ/RlJr+A2JQsnIkVsYg+ToLiAh5jAQ0A7JG74KLFKvTXkIliBoMHiazs8bllA6hLAluAtMBchI70uWxZPZQZV5sNbybL1RPKSSEEgQqiWwRS8s9PXKfM/Ieulq1NKtHIJeasRc47ZHX60OXqpjxx148AGOwBDy/0NX3tjFL+ADlb4PZRXqHY4avoxJ96YhvhV9gW9NkAv6ZlzDbZQi/a9Ynz/leSfwDMfJX7paoFv5krSVdUgyKwWKCdrvbWX+3q37MIvhkKOwahnShTjlS1KWRhQKAEFmH58DpmUFjrF1fKDBgD3tKtgpk+aFiui/XMLqqN37b+FCidNAjST4KwvDwftk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5388757-f3f8-4cd8-75ba-08d74e0dcb50
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 05:42:25.3611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lMfnhoq6ScM3d0QX895hwaUSPCeglQtf/4ncCutM7brPXAbziCTsGObq+muspl6md4alr3PO6vwDxLT+yNvXaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4915
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Not every platform needs this regulator.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_h=
drc_imx.c
index 16700170bc34..25a38ed27aa8 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -359,7 +359,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pd=
ev)
 			return PTR_ERR(data->pinctrl_hsic_active);
 		}
=20
-		data->hsic_pad_regulator =3D devm_regulator_get(dev, "hsic");
+		data->hsic_pad_regulator =3D
+				devm_regulator_get_optional(dev, "hsic");
 		if (PTR_ERR(data->hsic_pad_regulator) =3D=3D -EPROBE_DEFER) {
 			return -EPROBE_DEFER;
 		} else if (PTR_ERR(data->hsic_pad_regulator) =3D=3D -ENODEV) {
--=20
2.17.1

