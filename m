Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69ED81C3FB
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2019 09:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbfENHif (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 May 2019 03:38:35 -0400
Received: from mail-eopbgr40049.outbound.protection.outlook.com ([40.107.4.49]:57634
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726736AbfENHif (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 May 2019 03:38:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xA/t+DwhmQgDigCyEDt8f8oU3FMvV/PpHa8ySzP5MSw=;
 b=AtxIr8BpUpboXtlR5Rb0lv6dsL+uY+SDt8UMANpD6Li0RDnTlDO/Ejnobh5EacvHE8yDH3Nu+oQNk3x1oObN3LLpiXReS17R5Gllkyzpysp8jitWtdCY27mkAHyGiYXvdELUp9Y3ww2lsD05sW7azA9EBAd0Q14R2k6WtGTavLM=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5392.eurprd04.prod.outlook.com (20.178.120.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Tue, 14 May 2019 07:38:31 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61%5]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 07:38:31 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 8/8] usb: chipidea: imx: "fsl,usbphy" phandle is not
 mandatory now
Thread-Topic: [PATCH v2 8/8] usb: chipidea: imx: "fsl,usbphy" phandle is not
 mandatory now
Thread-Index: AQHVCigGOp2NOmuYaEKjpdSq44w//w==
Date:   Tue, 14 May 2019 07:38:30 +0000
Message-ID: <20190514073529.29505-9-peter.chen@nxp.com>
References: <20190514073529.29505-1-peter.chen@nxp.com>
In-Reply-To: <20190514073529.29505-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.14.1
x-clientproxiedby: HK0PR03CA0086.apcprd03.prod.outlook.com
 (2603:1096:203:72::26) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:60::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb695de6-55ab-4f7a-bd8e-08d6d83f290f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5392;
x-ms-traffictypediagnostic: VI1PR04MB5392:
x-microsoft-antispam-prvs: <VI1PR04MB5392D081D1B4BDCAE9F123F78B080@VI1PR04MB5392.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(136003)(376002)(346002)(39860400002)(189003)(199004)(386003)(6506007)(102836004)(7736002)(305945005)(6436002)(66946007)(26005)(316002)(6512007)(73956011)(6486002)(66446008)(64756008)(66556008)(66476007)(76176011)(11346002)(446003)(2906002)(476003)(2616005)(25786009)(4326008)(3846002)(53936002)(186003)(486006)(44832011)(86362001)(6116002)(71190400001)(71200400001)(50226002)(256004)(66066001)(2501003)(4744005)(1076003)(5660300002)(68736007)(8676002)(52116002)(99286004)(14454004)(36756003)(478600001)(8936002)(81156014)(81166006)(110136005)(54906003)(142933001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5392;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: obRvkYZvuyudxmJ9iFH+DVDIeZe7vs2WF7lzSwvWz3gNCSZEu63AX4bFLu/iQmqbRUy6n4FXLZ3ZOsB4wOru7bG3LJKvp4Mrm0au+IblTGuWiJcnY7HV01PRyo8aQfzcWKJUC9lwHYDxwoW6rOUB/KH/6w5jWXuPaB2TDFRSpQgA4m2YR3e28lT0xlj2ZBCEs+SfeOjgSFSz4b3SsS0WDgxUrLW8PktxpOFf4AZJ0nANFCQULf7ZppfwfuCeSjdksqs1SOoFOrEIazYfh2Zd4LLubpuXZC3cXl49UZYEGHoSWJ1Q5zbs6sGO3fID5bUNAn2c23Aoev6bMKVTQanxorL1DUxyRii2GbRVEXh9KXhQrqM0n+df+DwS//nuruyHjJYKceMobRoX+HYFO39Bhd9TjENQz2oeMX1kbMsVRfg=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <72F16C411CA5A34AB2DD1235DDE3DE59@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb695de6-55ab-4f7a-bd8e-08d6d83f290f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 07:38:31.2337
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5392
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since the chipidea common code support get the USB PHY phandle from
"phys", the glue layer is not mandatory to get the "fsl,usbphy" phandle
any more.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_h=
drc_imx.c
index a76708501236..b5abfe89190c 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -398,8 +398,9 @@ static int ci_hdrc_imx_probe(struct platform_device *pd=
ev)
 		ret =3D PTR_ERR(data->phy);
 		/* Return -EINVAL if no usbphy is available */
 		if (ret =3D=3D -ENODEV)
-			ret =3D -EINVAL;
-		goto err_clk;
+			data->phy =3D NULL;
+		else
+			goto err_clk;
 	}
=20
 	pdata.usb_phy =3D data->phy;
--=20
2.14.1

