Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92AB2A985B
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2019 04:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbfIECbT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 22:31:19 -0400
Received: from mail-eopbgr60046.outbound.protection.outlook.com ([40.107.6.46]:52547
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727156AbfIECbS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Sep 2019 22:31:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QY7Y0YlAsbXzfQBguVer/0OAZ6SPCd8A2DqeiFlZ+/bAhmz3JF+WcnOhSn4Gfqyq43BkiCNF5vOWMkax1D8LXvQRUTs+LyWSEhNleJ21I1p1LNvTv13d5/uhQLNxm6CinDH5MVvhYEp3tJ8wDFRsMVBwIToSd0MozBzXK2XqflvYestUVvBKytU6zAghLd45SM7xnEKz2qotru+m2sel1k4u76clTtoCaqdzlfK5Xe3O0R+NM4obuBgDF+lAsmqjS2B9UHv18qRyvoK0ceLWF0z4as4nC5/oelqUU0NBqNZJmxRzlyYkh68Y7sJtEKmBgS9OK7V51sKU/XKpnoRFtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjCMpgAQPo5fgTCO6+MH4gahefxjG0yFVrl3V5XsO8I=;
 b=Cfi5MZafzvIIUXY7VOsNg+9dp2ZZ4zLLQlkFMakcDNoIbTEjFM/PgKklzsiPQyVKEZ7wqYgeSC/z1OKyrjbDbdqA0UOHfEiQdwN83Fws8ccgIP8u3NBdvEXyqoKrJRjKrl/kisJrNl0BirDrmWZzHe+4I5cYVXtzwyfK55+zbXp45bBR3TfXaek+jhXVNE8pH6gesnJ0EDHEwS1fLkKLimDH3N9boJlNnsih/pnp2IASnvUn4h6TNTBQEFfKfZyuxkSFj8vl9AjyjB0UtwxjQI90O5aYEyQoJpKDjScVGQjOEZQUOVClLR+z5EYZeUiRO+9C+42gQIr/RjtdgWMmwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjCMpgAQPo5fgTCO6+MH4gahefxjG0yFVrl3V5XsO8I=;
 b=GUGcJ4Rao1rzgiMJApN9+fDUyWf/AAfwpoJAmrcf/rB2t9AQRMenLM5aSxQE+cF4If56u3fnAQpAU80j6vbfvlndfYdCHyboLLWI3zXGtqnhAWfBj76lMaNTDSNjnaWzESHTSSW3UTMn9SY5R2315pytFLGOlTFHReFo8khtDQI=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB4782.eurprd04.prod.outlook.com (20.177.48.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Thu, 5 Sep 2019 02:31:14 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::e039:172d:fe77:320a%4]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 02:31:14 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [GIT PULL] usb: chipidea: changes for v5.4-rc1
Thread-Topic: [GIT PULL] usb: chipidea: changes for v5.4-rc1
Thread-Index: AQHVY5H87f5dCneKR0O5pEb5EchoUw==
Date:   Thu, 5 Sep 2019 02:31:14 +0000
Message-ID: <20190905023123.GA13573@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9533e992-9ff4-417f-690d-08d731a91f8e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB4782;
x-ms-traffictypediagnostic: VI1PR04MB4782:
x-microsoft-antispam-prvs: <VI1PR04MB4782282B731AB7CD0D2E23098BBB0@VI1PR04MB4782.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:397;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(189003)(199004)(256004)(6436002)(99286004)(2501003)(71200400001)(71190400001)(316002)(33716001)(2351001)(33656002)(8936002)(478600001)(7736002)(305945005)(86362001)(14454004)(2906002)(8676002)(1730700003)(81166006)(476003)(3846002)(6116002)(6506007)(66476007)(6916009)(486006)(76116006)(1076003)(66066001)(91956017)(4326008)(186003)(5660300002)(66946007)(66446008)(44832011)(6512007)(9686003)(64756008)(53936002)(102836004)(26005)(66556008)(5640700003)(6486002)(81156014)(25786009);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4782;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: x9hDyTqTostvVo3uJcojmbCe9NsK6dJjwM1p9Ng8s8YHHoc6FRkjSXCwEjoQITsiEfKo2YaQigtL4pOIlUYRscMBHq+htJsBks3s6w2M+m5OLYiY31cS4Ksl6tsN+zk6F6o8AewKIdP4bfLlR5fwovNFNYNTD9H/TcZXdaZYp4DfttTas7BBsG5lDwiJA3vzf0JksOwcbnUMVUYkwQ7mDLIjziQok84hRmv4ihTV1AGGHl5mh/Ezoepg2/UCjcNPtzOsrMepkH75fE1ErhKNH+3V1SFiFILf+vOtMQaruBQ+JvONBoKCOrtMHLE2gkTchh8BaexExONDuDSiEHSam/51RYxSMpkGVYavuXzzomiXBdx49yu0XyPthk5/Sl0CHlUD/U4IOqb/8vjBkXubME2tedoXFCBqK0H2CQFBhJc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2D19273DB0A6A443A924F89A96721CAD@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9533e992-9ff4-417f-690d-08d731a91f8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 02:31:14.3408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W8usANtPWIe1kH442oLHliSO+s7EbM0TmNfGiypHHBDMLoguKaiZMKXN4e7H74NtZPOGvpnyCpnUkkbx6bjWWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4782
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit cdfee5623290bc893f595636b44fa28e8207c5b3=
:

  driver core: initialize a default DMA mask for platform device (2019-08-2=
2 09:41:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/us=
b-ci-v5.4-rc1

for you to fetch changes up to ecd55e367f3d706788632e176ec6b94e1a72a07c:

  usb: chipidea: msm: Use device-managed registration API (2019-09-03 14:16=
:40 +0800)

----------------------------------------------------------------
Add role switch class support for chipidea

----------------------------------------------------------------
Chuhong Yuan (1):
      usb: chipidea: msm: Use device-managed registration API

Li Jun (1):
      usb: chipidea: add role switch class support

Peter Chen (2):
      dt-binding: usb: ci-hdrc-usb2: add imx7ulp compatible
      dt-binding: usb: usbmisc-imx: add imx7ulp compatible

 .../devicetree/bindings/usb/ci-hdrc-usb2.txt       |  1 +
 .../devicetree/bindings/usb/usbmisc-imx.txt        |  1 +
 drivers/usb/chipidea/Kconfig                       |  1 +
 drivers/usb/chipidea/ci.h                          | 12 ++++
 drivers/usb/chipidea/ci_hdrc_msm.c                 |  9 +--
 drivers/usb/chipidea/core.c                        | 83 ++++++++++++++++++=
++++
 drivers/usb/chipidea/otg.c                         |  8 +--
 7 files changed, 105 insertions(+), 10 deletions(-)

--=20

Thanks,
Peter Chen=
