Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B62729FC52
	for <lists+linux-usb@lfdr.de>; Fri, 30 Oct 2020 04:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgJ3DwW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 23:52:22 -0400
Received: from mail-eopbgr60045.outbound.protection.outlook.com ([40.107.6.45]:41088
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725780AbgJ3DwV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Oct 2020 23:52:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdRcWjHYj40sC+UCB0eR85+i/hJ0IJG1YwoCAnfOCJ15lfjZRKUXsWDJqUqtfhNPQhugRfm00BA56wc0D0Wqkzf6KHsGzLRKOo+vdH3PibmaCVdQ2/YKOr/8qlzDLYkIT+6SlE34cj8LmdLAQUbQaoHCJikbtj3eLts7cmm9+1BoigD/VpSQWmRCVq14gZd3kNgmjjBPV9tzDDJuqt/DajmllxRWLXxAfBHf5t0r9KK140Kp4gjZ9ipnhv4YZc0I0Il9/0C+/Nm4OXaHcY/6RJEEEYzJ05KYqp/bDaiXfV4Nuo3yvLeITOQjuZI48FXyn4KrOsuMYfi2e7WLS1Lr8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJCqm+jy6UVfSdYjb77qpDJfNu5dnKRPcPhfAiI0g3s=;
 b=Bb1OLo+9CgR6dYrcfgThmuj+wkrjxJgtpMq3QqkTapX8s2fWp3yRbWNHXcn35+FvjmHsFjHsd9uW6oKFZq6Q49fQHju158JtRhF9hppVynZrHFJOI7secpG8DrezUp1BGWske6ZTFFbJptdC0XM0vtPVQoyynDBXxuMU8xrIx6kRtWzUuSWVT8evsKUJd2nqWIjet2eV0FvIdzFQwG7dj1YFCBM0Hm4MDv8M2LYenwMb4Z2N2dpvIbQ6RBNh25cUfmDwUABaOIVkblHVPw5oxdXQs9t1igm0cI1fZ2oCVqQCi/2m1hOmCeStflYYkTkWLQGoiyqaxrsnukGe3MGs6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJCqm+jy6UVfSdYjb77qpDJfNu5dnKRPcPhfAiI0g3s=;
 b=TxwRiUx3bvyEVuPdrqiDQ/CGo+pZAWiG/1edGjPNZ51D1j9tLCtjFYcbk9NQxfMHKQcQSoJAWhONPChQYdYinPfBhUVZk5muM7qmUf71/mIwif1E9/gT29SHYjSF1wZ4AwuXGHULIC6PfGIkauEXK0JYxKHonhcNU4hUemDNKX4=
Received: from VE1PR04MB7310.eurprd04.prod.outlook.com (2603:10a6:800:1a2::9)
 by VE1PR04MB7214.eurprd04.prod.outlook.com (2603:10a6:800:1a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 03:52:14 +0000
Received: from VE1PR04MB7310.eurprd04.prod.outlook.com
 ([fe80::4167:2a14:b445:9a7]) by VE1PR04MB7310.eurprd04.prod.outlook.com
 ([fe80::4167:2a14:b445:9a7%2]) with mapi id 15.20.3499.028; Fri, 30 Oct 2020
 03:52:14 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [GIT PULL] usb: fixes for cdns3 driver
Thread-Topic: [GIT PULL] usb: fixes for cdns3 driver
Thread-Index: Adaub/el1C0keb9rRdGJHBI92kL0zQ==
Date:   Fri, 30 Oct 2020 03:52:14 +0000
Message-ID: <VE1PR04MB73105F9B65F5546DF46BAAC48B150@VE1PR04MB7310.eurprd04.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 42a54a73-9efc-449f-f267-08d87c873054
x-ms-traffictypediagnostic: VE1PR04MB7214:
x-microsoft-antispam-prvs: <VE1PR04MB721478D8E8E100A7D8A488AE8B150@VE1PR04MB7214.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:849;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jGMdK1/h47UzLvzGukMnboQpftdOKr/iy0zUpha6SRJs9UiusIMZ5c/lxCeWgo+XpFnPG0vJhL/e60kq5tz6SnIK9w3Dq/1ZtTiNZXkb+1lo5f9FycB6YVYAYpwdXMiL9Tz3lNSpAzZyAdqoWN5rwZpOuWOq+uzhRWnwc9OcoMx27nil01IRHqrswvcEfmwYQhgbQaejyE5sq2On4ZGKBd6EtTwzuR39q1Ua8sQc+GiZ39PAZmbtclXpFkvHIvy7XQ+7Zak6xZcNU1MlThW9IPHgNuKyHY2VBmr8mR3te+FcyJIQZEyDHi9ep1ng8rGy
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7310.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(9686003)(6916009)(66446008)(44832011)(66946007)(66476007)(76116006)(33656002)(4326008)(66556008)(64756008)(7696005)(316002)(86362001)(55016002)(186003)(26005)(4001150100001)(83380400001)(8676002)(478600001)(5660300002)(2906002)(71200400001)(8936002)(52536014)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 5vU7mFVkEE22fNaw/M1elI6gjKUyoPmRWyovv5pCYpWW4+UlRtWnZoJ0/8YNjWxTwL0+UlyO16zFpv6f4AgC+UeZYr/B5z2RLmeS+SiZXyXitM5Mkt+IhZ9wjL8PI7KFPTNbmQHcKQRUZ+bPPQOFwoVegp3mLp5rman7t57JTXLRDcALJkRxx85od4VEDAralHIeHIJJ2bcbqM+djwC+wzv77xxSPL/zzMzXXxDbjniwN0OU5JEtuOGicI+klnTVbjLBCrHQqK4MOomwgUgPLJHzn/bXlcEcvfh0x5oEfyXwBOVaZHP1qQ0TD9oKOdeEQtpIIZjnZvyICveus7s2ALjHSNR3Hg1TUmqP/Ptf/qIP7OIoCYD44hmKKUaF2RYaiD0RwjGmilMdrvvo2/Myh31iZoJWRJm9H8yywaHRdQfR9j3s0TRvfK7DdzQ0KZyPHxOqHBR0MPrieyoki1IaZ+2YfR2iOtc9LkIb+wmVkjAwFuUZ7jQg74682GwLotrnzgqwDXu+VCWioyejlI3R4q4NOvh2xINwZ1bOcb3J2TFjfQvg2dw7lelA1Cu9zSL+cG7CI2aVqqTNAcxySITdS4MxAYdwCx+v9IqqoiBdGbwJ1EJeLPORXkfWps2aC+xQX055M0m8YVEhJqJbZKNU4A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7310.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a54a73-9efc-449f-f267-08d87c873054
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 03:52:14.4545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ur4nI6JhyElkcImpnXoX2K4H5/I3tFLSfGxpyo6AWgp202IhnVGk12IylxW5HJHyJT5xW9sccpk+Fd/1lOIakg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7214
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec=
:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/us=
b-v5.10-rc2

for you to fetch changes up to e11d2bf271589e70ea80a2ee3e116c40fcac62c2:

  usb: cdns3: gadget: own the lock wrongly at the suspend routine (2020-10-=
30 11:40:54 +0800)

----------------------------------------------------------------
4 bug fixes for Cadence 3 driver.
The biggest fix is changing endpoint configuration method to
avoid FIFO overflow at multiple endpoints situation.

----------------------------------------------------------------
Pawel Laszczak (2):
      usb: cdns3: Variable 'length' set but not used
      usb: cdns3: Fix on-chip memory overflow issue

Peter Chen (2):
      usb: cdns3: gadget: suspicious implicit sign extension
      usb: cdns3: gadget: own the lock wrongly at the suspend routine

 drivers/usb/cdns3/ep0.c    |  65 +++++++++++++++++++++++++++++++++--------=
---------------------
 drivers/usb/cdns3/gadget.c | 115 +++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++-------------------------------------------------
 drivers/usb/cdns3/gadget.h |   5 +++--
 3 files changed, 102 insertions(+), 83 deletions(-)
