Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C50582D501B
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 02:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731975AbgLJBNS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Dec 2020 20:13:18 -0500
Received: from mail-eopbgr130050.outbound.protection.outlook.com ([40.107.13.50]:21781
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731518AbgLJBNL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Dec 2020 20:13:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaAqmAKs+HoJlsbCSusa3KKUGcwWw4xPa4efVNj0OoDeYqUZW5FQzmIB1ES8UthBy6srOLsKHzdZtun83cFd/V65I899M+2ZxZ1Rl+fkr33DEySdQ7gKDzKjkAjxo4JBJqr68AGBiIcM6EVTYxyC9TQC1cQujypEbbK/Kuict5Qmj3wR/OAnaBYJffVvCab5t4mSKMU2FEtrhVK5jsvxU/Gs1P17UAM8Q1vza9UIN6W0xeWKRHFiQE5Sz9WXbIvZP0OzjHcRCngWdsr8y79pebiLAR+ChXo5gaQvK3BuNg6wWJwVb6o266MwRXe4OGJugd6ngGD23UOBGONuiycvqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4N7/gkCaNOTx6vM8eP0w3ywMj9lx+xTaWD3H1Qp/iA=;
 b=IgxGFwHiMYzqcN4Ba3o3rjczkqe9qj6UJj5VWUD57mSMU411P7beQeCs1YeJC781TRY8iVLzIH+EresMSIT8Dt95D98WV7sQ91lQFXMiGb6wmHEfnKWHh0wckI8tuTnYKrZXlums1+Z1iwhiyMABluMECTvDJDYGDs9HXsee2PJ6ghw6nyZJYBgil+NacGDOcAWZ7oxzYBNuwZxnL2CC+VqsExByZHJB4j4az9ZAX62NjQAKMHRKo4079QRl1vZr/gyBI8zz8pg5DRB90ea2wJtuLc8W78C3QdaNNiSwvCBj7qgwAjskshE+8QWFBFq5uxLC0SKJLhBoSq93/+JNoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4N7/gkCaNOTx6vM8eP0w3ywMj9lx+xTaWD3H1Qp/iA=;
 b=KlZBYSYQgVS4UzUDPAWmXn6IC/+XTVzfZgnNuu/G+aerXF0tkoHuKI+5QSBuxLMXhDGY80iuaAysNR8uA3Caxqhcb48owMjoaaoYoNj84yxhsd80dYAiDzUkF/4xLr5Iz37hU3z3quvdmLt4qy62Jp142+qsE681tWH3kBedUAY=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB6PR04MB3014.eurprd04.prod.outlook.com (2603:10a6:6:8::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12; Thu, 10 Dec 2020 01:12:21 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 01:12:21 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [GIT PULL] usb: changes for v5.11-rc1
Thread-Topic: [GIT PULL] usb: changes for v5.11-rc1
Thread-Index: AdbOkJNKdD/GWGK5THaEHNAiUEpgVw==
Date:   Thu, 10 Dec 2020 01:12:21 +0000
Message-ID: <DBBPR04MB79797539F005D75D9717E0D28BCB0@DBBPR04MB7979.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [180.164.155.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8e4d040b-af01-4937-47d8-08d89ca8a561
x-ms-traffictypediagnostic: DB6PR04MB3014:
x-microsoft-antispam-prvs: <DB6PR04MB30141BEE4FC1F55285334BFE8BCB0@DB6PR04MB3014.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:549;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Db+GiN0oxP2aQM6SxQfJ2zGpXaIVGBtZaNULnbyKNPo18sCNxm0NYoKGmayooq3Ynnx/+7G/erpPGCecEGikIPGqy1KNfc0YkShiMovOj8/rGxJtBm4x/VPj2STwnyHHWVL4qiOkMcqWgZMHFQvttjpz0SygyXdJtdrff1Iyc6DigkIkfxPNgHREZjxYmAlBg+US9/tGB6f3gGEhiRPlt9mHITaMGUG+pUCsbFL3yHbGA6HaWfHvWY9nQ+CktJW6SFfv/ZICw4U4/8nJllSMXyoLyxOveeoIHQedQEY3LyOeW79IpbZOaqO1Yp2TilrWKFr0GEBhSY0dD9AKqqhLsQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(9686003)(4001150100001)(5660300002)(8676002)(52536014)(8936002)(83380400001)(71200400001)(508600001)(26005)(86362001)(4326008)(186003)(44832011)(6506007)(6916009)(76116006)(55016002)(7696005)(66946007)(2906002)(64756008)(33656002)(66476007)(66446008)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?abnrPFxtqpYUPQFl4Xn13hDW9IUI7g8m+lL9BY/+VVbIA+nTwmI7Gfs1QuAb?=
 =?us-ascii?Q?0Ry5J1ksoWJ2eW/1iRRA6imP9mVnI9VoAsRXU6QdbRsg5mxJ6PvUZD5zJa42?=
 =?us-ascii?Q?e5EPTcILc1HHENRQ12cM25olxam24W+84IZf9iuoJhWHSFQsgstFjb91m1An?=
 =?us-ascii?Q?a5TyPdyDoXzcJWWp5VXAeuuZDqgOVVrRjOMMjvGWBgBibBedWp/CW291bx80?=
 =?us-ascii?Q?8iZSeTqPNHBqXyCAjhp5k718amMAGQyXGhlX8iw3ftwegWuvAfiWgcGFaE56?=
 =?us-ascii?Q?wdi3RLd4rgH9NRtjTPdbW5ne5s6rdQrgfXFSyjZDk68DDoyit7+WQWOImI4z?=
 =?us-ascii?Q?0JHl0Y788NI3yt5FBB8O7nQ33iDySqpXq1I7rvLghfRWRaZ5N1mzEkw1X+9s?=
 =?us-ascii?Q?aX0tlWfH+aFGylnwUBlGcdZRRnhYqnVWSFCD/FyGxx2RTUjA3W+SxlFg3tMg?=
 =?us-ascii?Q?yuK2VYwaEEEtodjBubGi1k1gY1fvVjcEaxDRlHZlw2En4gEW1A9TUEbxYP7a?=
 =?us-ascii?Q?4ZZj061NZdpUrcxlKoeSjiP/w5XYP4xDiPlg4qI7DpO3vsrTTjx6EMv68MLC?=
 =?us-ascii?Q?uaW5mUF6ALqhw67WUaA3WO2rycwbcUQNZ9hjLGY1h7JwkLB1xZQKtQnJGho8?=
 =?us-ascii?Q?2x7jd3EXJLpsJ+A9A1y7vUGuYclzIyWYiClGYNy5UZEWG0afwXuhLvXuTN3h?=
 =?us-ascii?Q?rOUeMQTXW+K577qauIiLxxYQw/tCoDcu9R+fSkM5UeQZFbJhhrTGyJY7FFzt?=
 =?us-ascii?Q?5t6TUp9fMdzXyR2ccD1BfyJYOVVzHIj3OmO8YMfGu5e2tpBsZwMpCD56DsNI?=
 =?us-ascii?Q?fsQyQG7/gC+usDrpFzDdN7HsamO2GPuf3whIoL/eO8RCkg62pvQ60pZlo5Cj?=
 =?us-ascii?Q?c+S1lispDeuaz3QSQdiKAniWc7hFtJqqr4yuIgPP5syemT1tiKYCXHvLXXZj?=
 =?us-ascii?Q?LBi6vSllM++ckwtwDiA7wXb0dSWAzY2ja6zEmP6T7Fs=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4d040b-af01-4937-47d8-08d89ca8a561
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 01:12:21.3978
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: COX3RuAbUogLIROJLtptKYFbuGpnWuLuMv+TdSt+l3PA9hsGxkN2aEF2q0cnTOiUadttGysfS5fJksN7hzf9bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3014
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit b65054597872ce3aefbc6a666385eabdf9e288da=
:

  Linux 5.10-rc6 (2020-11-29 15:50:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/us=
b-v5.11-rc1

for you to fetch changes up to 5eb7cfbaac4db19a435ec904c2a3a064f1a67f03:

  MAINTAINERS: Add myself as a reviewer for CADENCE USB3 DRD IP DRIVER (202=
0-12-10 08:45:26 +0800)

----------------------------------------------------------------
Below are main changes for v5.11-rc1:

For Chipidea USB2:
- Add tracepoint support for UDC
- Some tiny improvements

For Cadence USB3
- Add some quirks for host mode, and let host work well at more use cases
	* SKIP_PHY_INIT
	* Disable BEI
	* Enable runtime PM default for i.mx platform
- Some tiny improvements

----------------------------------------------------------------
Aswath Govindraju (1):
      MAINTAINERS: Add myself as a reviewer for CADENCE USB3 DRD IP DRIVER

Fabio Estevam (2):
      usb: chipidea: usbmisc_imx: Use of_device_get_match_data()
      usb: chipidea: ci_hdrc_imx: Use of_device_get_match_data()

Pawel Laszczak (2):
      usb: cdns3: Add static to cdns3_gadget_exit function
      usb: cdns3: Rids of duplicate error message

Peter Chen (8):
      usb: cdns3: host: add .suspend_quirk for xhci-plat.c
      usb: cdns3: host: add xhci_plat_priv quirk XHCI_SKIP_PHY_INIT
      usb: cdns3: host: disable BEI support
      usb: cdns3: add quirk for enable runtime pm by default
      usb: cdns3: imx: enable runtime pm by default
      doc: dt-binding: cdns,usb3: add wakeup-irq
      usb: chipidea: add tracepoint support for udc
      usb: chipidea: trace: fix the endian issue

Roger Quadros (1):
      usb: cdns3: fix NULL pointer dereference on no platform data

 Documentation/devicetree/bindings/usb/cdns,usb3.yaml |  5 +++++
 MAINTAINERS                                          |  1 +
 drivers/usb/cdns3/cdns3-imx.c                        |  2 +-
 drivers/usb/cdns3/core.c                             | 15 ++++----------
 drivers/usb/cdns3/core.h                             |  4 ++++
 drivers/usb/cdns3/gadget-export.h                    |  3 ---
 drivers/usb/cdns3/gadget.c                           |  2 +-
 drivers/usb/cdns3/host-export.h                      |  6 ++++++
 drivers/usb/cdns3/host.c                             | 60 ++++++++++++++++=
++++++++++++++++++++++++++++++++++++++-
 drivers/usb/chipidea/Makefile                        |  5 ++++-
 drivers/usb/chipidea/ci_hdrc_imx.c                   |  7 +------
 drivers/usb/chipidea/trace.c                         | 23 ++++++++++++++++=
++++++
 drivers/usb/chipidea/trace.h                         | 92 ++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/chipidea/udc.c                           | 10 ++++++++--
 drivers/usb/chipidea/usbmisc_imx.c                   |  7 +------
 15 files changed, 210 insertions(+), 32 deletions(-)
 create mode 100644 drivers/usb/chipidea/trace.c
 create mode 100644 drivers/usb/chipidea/trace.h
