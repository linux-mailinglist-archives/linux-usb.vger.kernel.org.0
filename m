Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326BA273A57
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 07:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728599AbgIVFon (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 01:44:43 -0400
Received: from mail-db8eur05on2079.outbound.protection.outlook.com ([40.107.20.79]:48897
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727522AbgIVFom (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 01:44:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/Ff/N/u3RopGfc7eLwM0RwluJyy8Q7b8GwM+fSvoPMt90V4+DRCZdZMUauYmgZ3OPrCgeoCiCLgtm5jySkw3+gcxdXe/G7yyDNqBQl/p4XImWTaRdDfXMSncX4h4rivMcBRe9RHA3pQYRbtVcJfvtNcHU2zW97ktl04iR2Xh+pFBLttGBd/snce95v8vtEWHfAKplVSnSCgDA8yXGValpEh0eDbGAhWKtQC1d5XOBsOkm6BInERSh4FYdAfcvZRkfmz3j/DlGarIngE1u/90sZ15Tk+uBT8lTqu5KK+2FUN8rleRbqvSDschDkS7qjDsh8AofdoDpYMmj2B195efg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKfEog+qbggQqbryfcX/aPOWnlG2cj0+q3pJ+lY+8is=;
 b=n9p7AMSEHBf2VSMIO80Ro7pOjoyTrrdGAo5SdooP6r/OgWkZBpaPXxX9w065eZMuIfKEYpWpxyBUlFjt9hc2AuOzVOq3djlWXJoBXNQFldrv7Niw5q4ngjj3qESl5AY4twLbYOSY3uOVRQwsIWGZEIBlIkbpjEq7OjuqY0CSagJp6n029vaMeRK3vJQf1S+bYA0YunC7I+mhKnb8AbgBTnRcpw8DvZxZwVwfjqwe4/KrBsDA2U1vKDIrbvy6hBsvtgLwcwPIfyolsN5qzuN1cNaWD980mCNw4AI45JKHS66wxUHc52hlFIAjV4MKnA++ETV/UXtNv1jwAipFyb+I/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKfEog+qbggQqbryfcX/aPOWnlG2cj0+q3pJ+lY+8is=;
 b=Jv6tcmARIWkZ8xaNDRmUQx1FRo0XFoRT6dvk8BEPbHvjM3WBdUZhK1e34oYCuaMOkzuesl3yYsCxVZcV2zISOP/SbT2Kjp8RavTZAVtIcY6aBSdaUm7wuEHzOhf28NqgTM8D1DORWeOuL5fFyZV3+Fy/qFu9e7+adnfVjwkoeJ4=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR0402MB3656.eurprd04.prod.outlook.com (2603:10a6:209:19::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.22; Tue, 22 Sep
 2020 05:44:39 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3391.026; Tue, 22 Sep 2020
 05:44:39 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [GIT PULL] usb: chipidea: changes for v5.10-rc1
Thread-Topic: [GIT PULL] usb: chipidea: changes for v5.10-rc1
Thread-Index: AdaQox/4IejyYL4hSCinwbY0wGrRhg==
Date:   Tue, 22 Sep 2020 05:44:39 +0000
Message-ID: <AM7PR04MB7157233EB3BA56F78ACAF2B38B3B0@AM7PR04MB7157.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d8e4b87b-d25a-4bf5-921d-08d85eba98d6
x-ms-traffictypediagnostic: AM6PR0402MB3656:
x-microsoft-antispam-prvs: <AM6PR0402MB36560268A2FEA190F6304ED58B3B0@AM6PR0402MB3656.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:330;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZX8MrrvqNwU1qL0OPodytIkTu73K/QLdtCDHGA5pBRP3WbNiC9IaDCZL4lwbt0BTNR1+4qKx4h0EPEqIcjVxDtGIS7i6EgI+X+U5r70+neL6zzgtz3sCEHYvcKPQsabb8FbNXdPqrGtWHYU88+jCgVPLO+aG5TmfsZeryOOPiV2VKCX5dthkFadI47IMvcMhLREjHGMhKpDkU77J0hCxyxYQdluboHrQhD5QH8AiyGvZY/hK2uh+RnUIKBZGTrJMtu5ll8JscG7Tlco++oy60iSzbNfNjAfCXPm0FvJl8dLeMRn0v0fK5fEq7Lyrqf4T
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(83380400001)(7696005)(66946007)(76116006)(6506007)(52536014)(316002)(478600001)(5660300002)(186003)(86362001)(33656002)(9686003)(66446008)(64756008)(26005)(71200400001)(4326008)(66556008)(2906002)(8676002)(44832011)(66476007)(6916009)(8936002)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ju1uY+m9To3S8bZ/0B0y0ByiARdirAcFrIafpxi60v0ZYm8n8hceCmjaCacO93/0S2VoUbbRLvK21JkR/T9Ya1dONGM80Cv4F0nTAVZO2nMTSA9RAhGBTcsoS8cDAcgOQIh4B9r0Vbs2mvWakLDRhUVA3up9Moy2ZWtR5flOq5SrRyuMIBOCN42IT6jVyVFgtdCfeilmt4fmGlPgib9/C4lktsP+FjbYlwleRsscE5EI6pO3bPg3aJXDKDBJHJCXGQFmKumirNXVvxHmbYrs0qxus81l0TZ5Kq1pvRkWBeDeblgX2kmeZUUiZ2HiV2dNaq596TQcd2R4r/za7scQ1k/MeTl652U6v3v7wmFfPldeSG2JicR9o1fy1rWA9AzjxE9F60alSmGoZ/zAmudJGzsM+m1Ueb+ZGeleenZRbDT9dFRX/1NVt5aIRqK+fq6CsHdMEIqXpl9gF26UJ3fSZ4qAxh50Tb9y9vgelHB/kpQt3tP6jvmlS0EViT6vHJxKgqZstEVGcdIPtjJ9qtRlB8SM70SPv/++iBxVy5Z7Ac7/02jZ5e8yHYJEK00m5o9zW9H1KeUtEUwqyXPXjyyOPkBl6uIjqdqr+gywk0O5TT/2KCnZHUGGIaPb8HQx1eQ3wjLGmnlAk6Sobp/1DysyQQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e4b87b-d25a-4bf5-921d-08d85eba98d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 05:44:39.3136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1qAq2fJm491BSajosEwxLoIrr8YZcMKuqypjxPQLKTXQUeCd4TOJUdLuoK9CYAIS5B8EvEBKGI73yUwzFz4L0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3656
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 28157b8c7d9a9c92d1da31af486fe4ad39862edd=
:

  USB: Better name for __check_usb_generic() (2020-08-18 13:10:40 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/us=
b-ci-v5.10-rc1

for you to fetch changes up to 71ac680e6339e744d87647a1ca27b2e87dba2eac:

  usb: chipidea: ci_hdrc_imx: restore pinctrl (2020-09-03 16:32:07 +0800)

----------------------------------------------------------------
Two changes for chipidea imx driver:
- Add picophy parameter tuning interface
- Restore pinctrl for system suspend/resume

----------------------------------------------------------------
Peter Chen (3):
      doc: dt-binding: ci-hdrc-usb2: add property for samsung picophy
      usb: chipidea: imx: add two samsung picophy parameters tuning impleme=
ntation
      usb: chipidea: ci_hdrc_imx: restore pinctrl

 .../devicetree/bindings/usb/ci-hdrc-usb2.txt        |  9 +++++++++
 drivers/usb/chipidea/ci_hdrc_imx.c                  | 13 ++++++++++++-
 drivers/usb/chipidea/ci_hdrc_imx.h                  |  2 ++
 drivers/usb/chipidea/usbmisc_imx.c                  | 21 +++++++++++++++++=
++++
 4 files changed, 44 insertions(+), 1 deletion(-)

Best regards,
Peter
