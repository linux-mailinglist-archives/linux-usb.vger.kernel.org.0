Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 753811C3EA
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2019 09:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbfENHiE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 May 2019 03:38:04 -0400
Received: from mail-eopbgr70042.outbound.protection.outlook.com ([40.107.7.42]:52420
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726677AbfENHiE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 May 2019 03:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvhjJwPJQAmt6osV58d0ZPm+fi0QlH40uyS1LvKq4OA=;
 b=C/PnVRX7jMcHyY1Sm0kpTzHMbvl3/KZQEoX/NsvbxC39P3FrdEuzT9biNFTLy2mUs0lwZFNMp7OL5NRnde3jTicLv4OUHZD+bdhyrd45K/Y0vMHhFe4ndHzJ3Zg0ze9GBrebn8GNUfS7E+F857p/FWj4xgUCv3jgatBWZBprWGY=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5392.eurprd04.prod.outlook.com (20.178.120.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Tue, 14 May 2019 07:37:59 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61%5]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 07:37:59 +0000
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
Subject: [PATCH v2 1/8] doc: dt-binding: mxs-usb-phy: add compatible for 7ulp
Thread-Topic: [PATCH v2 1/8] doc: dt-binding: mxs-usb-phy: add compatible for
 7ulp
Thread-Index: AQHVCif0oaNedQipEk+Q4CDINsOA4A==
Date:   Tue, 14 May 2019 07:37:59 +0000
Message-ID: <20190514073529.29505-2-peter.chen@nxp.com>
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
x-ms-office365-filtering-correlation-id: f57f3d8a-7a4b-43c1-530f-08d6d83f1689
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5392;
x-ms-traffictypediagnostic: VI1PR04MB5392:
x-microsoft-antispam-prvs: <VI1PR04MB53921E5EF7178F1B594BEF918B080@VI1PR04MB5392.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(136003)(376002)(346002)(39860400002)(189003)(199004)(386003)(6506007)(102836004)(7736002)(305945005)(6436002)(66946007)(26005)(316002)(6512007)(73956011)(6486002)(66446008)(64756008)(66556008)(66476007)(76176011)(11346002)(446003)(2906002)(476003)(2616005)(25786009)(4326008)(3846002)(53936002)(186003)(486006)(44832011)(86362001)(6116002)(71190400001)(71200400001)(50226002)(256004)(66066001)(2501003)(4744005)(1076003)(5660300002)(68736007)(8676002)(52116002)(99286004)(14454004)(36756003)(478600001)(8936002)(81156014)(81166006)(110136005)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5392;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /Luzuwk5IGfW+xv5JTKPYSmAw5rPkZOQi59PCeFJr3Vw/r8y/5fUz/+KSR9QnDQDDlDuhXLuKm+JUfDdXDhfn3VCGAVUWfgIkPt5qnwhpcGOXnMRm0kOSDCPWhPFcdcEJkuC1vvbVPv/stRq/bhYI1KxH0EhzltCpJ7hW+2JR72fAgTHOTYBv8/5WlDPV/STrUPZO2Nxdx887AIzBulwbg2wsJJZOIX8uf8YLvT6ZX+r3W109fDvoq1ySlBP8XQNwyN6F2HTaSIdeJ8qQSp4EVYY5V7cMiWeD6rcF4hiKo47vDRjduVuEMiXgYJ7ZF38s9T0AXeXEbxjJjGBFDI+wfWmXR6CbVEpOYDULnFSEz3hbUQvQO4a1/MmCINFg7SytMkEYDO+bYHSjYCfgYd+OX37oFWNAf1uUtJOztE0FaA=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E46D016D49C7C94F816436B461741B6D@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f57f3d8a-7a4b-43c1-530f-08d6d83f1689
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 07:37:59.7385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5392
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add compatible for 7ulp USB PHY.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 Documentation/devicetree/bindings/phy/mxs-usb-phy.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt b/Docume=
ntation/devicetree/bindings/phy/mxs-usb-phy.txt
index 6ac98b3b5f57..32da8d17759a 100644
--- a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
+++ b/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
@@ -7,6 +7,7 @@ Required properties:
 	* "fsl,imx6sl-usbphy" for imx6sl
 	* "fsl,vf610-usbphy" for Vybrid vf610
 	* "fsl,imx6sx-usbphy" for imx6sx
+	* "fsl,imx7ulp-usbphy" for imx7ulp
   "fsl,imx23-usbphy" is still a fallback for other strings
 - reg: Should contain registers location and length
 - interrupts: Should contain phy interrupt
--=20
2.14.1

