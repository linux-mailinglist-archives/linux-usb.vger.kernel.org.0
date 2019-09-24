Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1BDBC404
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2019 10:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436651AbfIXIXL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Sep 2019 04:23:11 -0400
Received: from mail-eopbgr80052.outbound.protection.outlook.com ([40.107.8.52]:10467
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2409448AbfIXIXL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Sep 2019 04:23:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4JBxgrUhjSdJxkB2mYDyjbIBr0gp0jx4KvkehAqUF/zH1fN2iuMLr9KRlcykwdxfCWSBPaPUP62Su/EclVIg8vOTimk7VVaRSzfUGDBt2rDNchQetLBLXx5Xii1dEbm8aiF5W0h7EmcUSv8OP93WhkUXOGrbhKlF/XOWXe6fCqpw2A5sDIkwjuO6vpXQWAi1MfvMwv2K2fFtu99Gh58QxEf+A5EqVlcsjF6gsJOjShZvI+ThyRhBGK5xPkgL0lAyE1D8uWkQTUSm0JNzIHak16isFO0WOuyAifS/PnYubjB4ihhIQVIEaLbHYNEmocEGyW7YrgGq3r+OraPsMoRAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KU5ZonBS+EGcK4pIcl0cF0GdHwioOfjsDrgY4ltbJxg=;
 b=ZWlCEPat3uMegkBF4choJmvS2gDaWx/V2A2SP9ERB9W9xNoYIH+9bxONsVFQU37NV396Xvmq5nrybiF69sWAJE8Ydiarj8dV6L4DBquGvJH/cht6iL+ju4LOd+k6R/lMPOC95EWp2CRFnXKO/Zjo1EMD8VdSm8nbaIj0Rb5HnHnmswWzj5P1KYuY7W/khbwprZgqs5jRQv1SCjZIU4KCyGo0K5a/N4BvarCg0ltS42DESu0uKXuEAWpRSfTGfKHVSnkMuyDPOlxURNqJveVl9MIBPK/WMTZeGwpJyYPR23HAl/T88C7D/ohGSEJcnE5EQ2ccBz9gJp37lRdtl2qp2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KU5ZonBS+EGcK4pIcl0cF0GdHwioOfjsDrgY4ltbJxg=;
 b=sgCngwEpyT2f3UIQlELqEsc52qYlN4pM/sZbaF1PSECBKT1REmG/XSelqfxmmHqNNGh3sLwiGQKbcFf6PiQi61Irq+J49zH3XiKKu6biAcwYwgeI/4pho+6+W8uyV4MeIxfZM3uBEB7auKq4qC3LSmZgnrFturKgdItrfuYHLRg=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5789.eurprd04.prod.outlook.com (20.178.127.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Tue, 24 Sep 2019 08:23:08 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 08:23:07 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] usb: chipidea: core: change vbus-regulator as optional
Thread-Topic: [PATCH 1/1] usb: chipidea: core: change vbus-regulator as
 optional
Thread-Index: AQHVcrFLn8fOc2LSw06+KjIdFPDwnQ==
Date:   Tue, 24 Sep 2019 08:23:07 +0000
Message-ID: <20190924082455.32472-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-clientproxiedby: HK2P15301CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::12) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:60::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55fd7915-330e-4a59-587f-08d740c86db0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VI1PR04MB5789;
x-ms-traffictypediagnostic: VI1PR04MB5789:|VI1PR04MB5789:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB57893171D41AC5ECB88C4E3A8B840@VI1PR04MB5789.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:854;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(189003)(199004)(2501003)(4326008)(66446008)(54906003)(6916009)(305945005)(7736002)(14444005)(64756008)(66476007)(66556008)(316002)(6116002)(66946007)(71200400001)(86362001)(256004)(71190400001)(6512007)(8936002)(1076003)(50226002)(99286004)(52116002)(5640700003)(25786009)(6436002)(3846002)(66066001)(36756003)(6506007)(386003)(26005)(81166006)(81156014)(8676002)(102836004)(2906002)(186003)(478600001)(5660300002)(14454004)(476003)(2616005)(44832011)(486006)(6486002)(4744005)(2351001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5789;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: U0diBt9zERxZNCniOeckXJSQK8KOf+lrV/NriqA6l1yk8XPu0Ey+q7/AUEeOmLwo47Hd9UXZ3XKbVDJ3PXdLP5l6M0H21boZpf4hc8sUEezwG6Jrq3qopq9G5eS+Tf7SSyN6tw2V6VI8LIdV/kedx7ROpADllY1jrLS0xoKZEqLrGVX+RxLmOrUSnhrGf9wkXEuSA46uxkqQ3NiS/ocuYL37xhzAZlzJYduTaqziXSfDJni2R96hwSta1TCKq3hvNxBRhrDFYG5FKOAw4X4YIErPfbWtpgtB/i7h3Pz+llJBrDgYhKEXMc+E+sF7vFc7RK4glthQ0aQTJK9RqRS5UEjeawnP31kObDLIktBZZsK2X9vfSNGSGJtfQF2M3Ld3tC4J/MKu9ME2UqUK5Swe+cxDVtNWjBK5+wkh3DsHlis=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55fd7915-330e-4a59-587f-08d740c86db0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 08:23:07.8942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LuDQraWNG5nxmIVHIBLB7QD52Kk0BwvQ+5/tXi5zjIOcE3FGZFSOKgvOU5FSLingxlZOtYYv1gfy20rb4SJ9tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5789
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Vbus regualtor is an optional regulator, for platforms, which
doesn't have this regulator, it will get a dummy regulator and
show warning message.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 8cb2ed3dabfe..38b01a334d8f 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -676,7 +676,7 @@ static int ci_get_platdata(struct device *dev,
=20
 	if (platdata->dr_mode !=3D USB_DR_MODE_PERIPHERAL) {
 		/* Get the vbus regulator */
-		platdata->reg_vbus =3D devm_regulator_get(dev, "vbus");
+		platdata->reg_vbus =3D devm_regulator_get_optional(dev, "vbus");
 		if (PTR_ERR(platdata->reg_vbus) =3D=3D -EPROBE_DEFER) {
 			return -EPROBE_DEFER;
 		} else if (PTR_ERR(platdata->reg_vbus) =3D=3D -ENODEV) {
--=20
2.17.1

