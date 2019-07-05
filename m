Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC89D5FFBF
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2019 05:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbfGEDco (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 23:32:44 -0400
Received: from mail-eopbgr60083.outbound.protection.outlook.com ([40.107.6.83]:22350
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726404AbfGEDcn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Jul 2019 23:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xq0K2AtwpLWKsSI2TCUM7q80YJEZ9o8otXsKZrFBDNY=;
 b=HE3tZ3Ifw/4RW+Xq+vkS2UmU7e5+MH3wTjvSxOoXNYYRxHXKDwerRzt/2r526k9o7+aPBvNnrqvs5xyMRdRveaDIoA4S+gC/H0qIg1AIgRaCGsyHHE/cFADqcukqEn+cux9VE+isnuhZbdfkWA5PjRFTO5Rbqw7ZGDFirjMlDv0=
Received: from AM0PR04MB5314.eurprd04.prod.outlook.com (20.177.41.157) by
 AM0PR04MB4418.eurprd04.prod.outlook.com (52.135.145.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Fri, 5 Jul 2019 03:32:41 +0000
Received: from AM0PR04MB5314.eurprd04.prod.outlook.com
 ([fe80::209c:a881:ebf1:657b]) by AM0PR04MB5314.eurprd04.prod.outlook.com
 ([fe80::209c:a881:ebf1:657b%7]) with mapi id 15.20.2032.019; Fri, 5 Jul 2019
 03:32:40 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [GIT PULL] usb: chipidea: changes for v5.3-rc1
Thread-Topic: [GIT PULL] usb: chipidea: changes for v5.3-rc1
Thread-Index: AdUy4hBrtrHz20/8QjavDnRCDkoQXQ==
Date:   Fri, 5 Jul 2019 03:32:40 +0000
Message-ID: <AM0PR04MB5314EF9667220C996B5860378BF50@AM0PR04MB5314.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6943cd36-66fe-4f28-90ff-08d700f96f41
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4418;
x-ms-traffictypediagnostic: AM0PR04MB4418:
x-microsoft-antispam-prvs: <AM0PR04MB44188D72CE1965BBD0DB864B8BF50@AM0PR04MB4418.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:403;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(199004)(189003)(14454004)(7736002)(71200400001)(71190400001)(74316002)(305945005)(478600001)(6436002)(3846002)(2501003)(6116002)(2351001)(8936002)(8676002)(81166006)(6916009)(33656002)(81156014)(1730700003)(66066001)(5660300002)(66946007)(86362001)(6506007)(68736007)(99286004)(102836004)(52536014)(7696005)(26005)(25786009)(2906002)(9686003)(256004)(186003)(76116006)(4326008)(73956011)(55016002)(66476007)(5640700003)(486006)(476003)(316002)(44832011)(53936002)(66446008)(66556008)(64756008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4418;H:AM0PR04MB5314.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xg2GVimCtavud+bOZv7OsdIGkDggko6cRJ/ARkmxfqmu6MUGWdqQVdnpPjXr33TKOkIR3JB/AD1cDl6BWH+1OjeVXcK3fM0xTF6NUHUV/c9CoFLzEMLxOx5/OUSJfGemGo8TSZPKOa/5SO8F8/CV5jntXO0IIvo8W3eJlI2k+bk3Ig2fJzf6kA/NcbI0NC5qnC4lOIU3g6zIoEEM8qoltWd1Ot1A9eudV6TNbmvG/wyud2hgxhzP3uDlA4JUSHmnVHBdKmQYuzY6flp/1t3yMDIE+GTBfwmnoLZM8euhIEOdtSTebuhqykE1Fw0ixnl0HZKpRbuQf5MeXm+9rGICEOwyCsitb9pP0RuouyLy39QE7SeaqL/QcShSZaKp7d+Cs9oM4TX+lz8rxDqTLSd6EvwgS26+PTWPNlQKGKMESAI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6943cd36-66fe-4f28-90ff-08d700f96f41
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 03:32:40.8899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peter.chen@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4418
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 8ea5b2abd07e2280a332bd9c1a7f4dd15b9b6c13=
:

  Merge branch 'fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/vir=
o/vfs (2019-05-09 19:35:41 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/us=
b-ci-v5.3-rc1

for you to fetch changes up to 034252e37b313083002e1cb13b4b5d0b6d926b4c:

  usb: chipidea: msm: Use devm_platform_ioremap_resource() (2019-06-14 17:4=
0:28 +0800)

----------------------------------------------------------------
- Add imx7ulp support.
- Some tiny improvements, no function change.

----------------------------------------------------------------
Fabio Estevam (3):
      usb: chipidea: Use dev_err() instead of pr_err()
      usb: chipidea: imx: Use devm_platform_ioremap_resource()
      usb: chipidea: msm: Use devm_platform_ioremap_resource()

Peter Chen (2):
      usb: chipidea: imx: add imx7ulp support
      usb: chipidea: imx: "fsl,usbphy" phandle is not mandatory now

 drivers/usb/chipidea/ci_hdrc_imx.c | 33 ++++++++++++++++++++++++++++++---
 drivers/usb/chipidea/ci_hdrc_msm.c |  4 +---
 drivers/usb/chipidea/core.c        |  5 +++--
 drivers/usb/chipidea/usbmisc_imx.c |  8 +++++---
 include/linux/usb/chipidea.h       |  1 +
 5 files changed, 40 insertions(+), 11 deletions(-)
