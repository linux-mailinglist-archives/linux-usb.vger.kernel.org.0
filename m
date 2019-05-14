Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD8A1C3E6
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2019 09:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbfENHiA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 May 2019 03:38:00 -0400
Received: from mail-eopbgr10052.outbound.protection.outlook.com ([40.107.1.52]:12431
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726335AbfENHiA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 May 2019 03:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvq2TFR85utQEG+69MB357yelCSgp/xfao7wGoP3n+M=;
 b=ImHHby4+8/11atKq1NWN3vtf03n07thxz4EMa+T0IC9zd3GhzwFtgp3N/+3ncBRqY7wuXVbg0YtIw+v1FLysDiOD/osVaW2Q5bwVCZdv0y4LQxm8KFD3sO4MOkB9CwJHUlR0l6NR/KYaC3h1vBY5ruFHpzX1H8E/QMqyruqArM4=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB6175.eurprd04.prod.outlook.com (20.179.27.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Tue, 14 May 2019 07:37:55 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::4923:8ad8:62c1:3e61%5]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 07:37:55 +0000
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
Subject: [PATCH v2 0/8] Add imx7ulp USBOTG1 support
Thread-Topic: [PATCH v2 0/8] Add imx7ulp USBOTG1 support
Thread-Index: AQHVCifx0TKqr8yYC0ySFoHZ6w0yuA==
Date:   Tue, 14 May 2019 07:37:55 +0000
Message-ID: <20190514073529.29505-1-peter.chen@nxp.com>
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
x-ms-office365-filtering-correlation-id: 61aec09b-a52f-4e96-5090-08d6d83f13fd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB6175;
x-ms-traffictypediagnostic: VI1PR04MB6175:
x-microsoft-antispam-prvs: <VI1PR04MB61754C3AC4E3D28E567DCE4C8B080@VI1PR04MB6175.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(136003)(396003)(366004)(199004)(189003)(5660300002)(68736007)(99286004)(52116002)(8676002)(66066001)(2501003)(50226002)(256004)(1076003)(110136005)(54906003)(36756003)(14454004)(478600001)(81166006)(81156014)(8936002)(66556008)(66476007)(6486002)(64756008)(66446008)(2906002)(73956011)(6506007)(305945005)(7736002)(102836004)(386003)(6436002)(6512007)(26005)(66946007)(316002)(86362001)(44832011)(486006)(71200400001)(71190400001)(6116002)(4326008)(25786009)(476003)(2616005)(3846002)(186003)(53936002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6175;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: to3ONCWZ0qcY+apsfxbWkf5j+gbvT3wQXrObFdvBgrriOYFFgK1xodHRB5Dpd0vQE0PPYk+w9yHnQqmfCuTGOENHj6sB/2ZGvkz7ihzD9PvUP1KR9tr/HZd3ZdhnrzbvF9W/dV6PpUsroOpGgAPrJ+cp3Vh0YiEBsTUWeZK4D00RJFlf/2frQ5qassb+mG7nQIEHuJEWpDM1UxdaF6HTPbeTm3hrzBlgot6sBQHr1BAJI4wYFe5pWcNAhoFi7srQ0Ht9SrWa4b8YF9U+laUWarhbKzZd7QEo2TycbOdMnQ9iutWOd8y4I6cgvlGQVShkTE5/1aorO24ZBvFbqx7uG8QPhI4Y6KOigOlMtLTph9N1xqBES/KbqJBE4nBh8zsrP6yIlFia0O3+RSFye3s29kIFM34zLriB2FlmaENTu7w=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3B08FC2360D3334EA24FCE0F10B21354@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61aec09b-a52f-4e96-5090-08d6d83f13fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 07:37:55.2033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6175
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Changes for v2:
- Use common 'phys' property [Patch 6/8]
- Add the last patch that "fsl,usbphy" phandle is not mandatory now
[Patch 8/8]
- Add Reviewed-by from Rob.

There is a dual-role USB controller at imx7ulp, we add support for it
in this patch set, and the dual-role function is tested at imx7ulp-evk
board.

Thanks.

Peter Chen (8):
  doc: dt-binding: mxs-usb-phy: add compatible for 7ulp
  usb: phy: phy-mxs-usb: add imx7ulp support
  doc: dt-binding: ci-hdrc-usb2: add compatible string for imx7ulp
  doc: dt-binding: usbmisc-imx: add compatible string for imx7ulp
  usb: chipidea: imx: add imx7ulp support
  ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
  ARM: dts: imx7ulp-evk: enable USBOTG1 support
  usb: chipidea: imx: "fsl,usbphy" phandle is not mandatory now

 .../devicetree/bindings/phy/mxs-usb-phy.txt        |  1 +
 .../devicetree/bindings/usb/ci-hdrc-usb2.txt       |  1 +
 .../devicetree/bindings/usb/usbmisc-imx.txt        |  1 +
 arch/arm/boot/dts/imx7ulp-evk.dts                  | 35 ++++++++++
 arch/arm/boot/dts/imx7ulp.dtsi                     | 31 +++++++++
 drivers/usb/chipidea/ci_hdrc_imx.c                 | 33 +++++++++-
 drivers/usb/chipidea/usbmisc_imx.c                 |  4 ++
 drivers/usb/phy/phy-mxs-usb.c                      | 76 ++++++++++++++++++=
+++-
 include/linux/usb/chipidea.h                       |  1 +
 9 files changed, 179 insertions(+), 4 deletions(-)

--=20
2.14.1

