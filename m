Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7864A23178A
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jul 2020 04:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731030AbgG2CMl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 22:12:41 -0400
Received: from mail-eopbgr70089.outbound.protection.outlook.com ([40.107.7.89]:41806
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728401AbgG2CMk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Jul 2020 22:12:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaa+4i3r04VS53J3p1JhudGGZZyiLdwC7thWmTB+HXu8AGoyvHRoposB5b/csPlU+Bxs9AKPcvIgwGsVllyMKIaCqwphKHhHjnqiziMzkgmqG6kFq8SqKPpRTSRt7MI++JrtHdRrPp+xGV1P8UZfzk8uYQEp61spae1cC1ekavmxv6wX7OtmiMlLTsw9npFSDPbp83r18iRBGSA5b/0zrT9j4lAjMFOJAKJxZ6r6fLM4QlAeBqUJVq2QhID2u11Gpf1x6Nz63GxA1MluP9dswvy6Gdg3PeSkGYpz35IsCW5sBPxbUPNfwOeyx2jl2HJ2LaCo5XG8zA0R/PPIpkxA5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztojFcLrNG+/9qObfit7TccTJCN2TxKQ11Ge3xeLxoQ=;
 b=Dg4CztGq+1IMt1tG6VDuLOzenFwSnnM47TA8lhIBWff1YbDD3muD/Prl7XTkty5KBU+IFZL6ORBIJUZzMSdpThZ/16N5Cljb443AMSWYOfVCK1J5j9PtA+rQbdRzeLomTSgBPer+5LK+phw6KOjPQLM+tHe5itJ84yv2NMyZfkW5DbczWm1xgiI+xC/rihn3/A8bs9SOv0hb4NZmM95IXEWg6alx4quBfPGE86t30q4UF58eVRGJIxrZ7diBrtRHvigavhtK2D3zVtSxWSzM/OjWMDXnNMf5ezgmAbTeWADFl/IH2BSmjYfL+zNkYgoNA1bWUGyrfyuuQRnj78/n/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztojFcLrNG+/9qObfit7TccTJCN2TxKQ11Ge3xeLxoQ=;
 b=AP+9Zk/cZWUMN3WtTcW/99gYAtxnTtQl4N6saW6MEZ3eH1d8zSfvlQlh3tCEXnnRMZft8Jg+g8cAzExerb/C4c8EY1WGos3uKgMrW52rROpqvixhSg/9e3s0bQBzgEJbgavRs1VUiGvJMpC8/xmSlzmgegEHqTdhNwjoZO2/n7Y=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR0401MB2483.eurprd04.prod.outlook.com (2603:10a6:203:35::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Wed, 29 Jul
 2020 02:12:37 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::539:3d00:4c6:c4a0]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::539:3d00:4c6:c4a0%3]) with mapi id 15.20.3216.034; Wed, 29 Jul 2020
 02:12:37 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [GIT PULL] usb: chipidea changes for v5.9-rc1
Thread-Topic: [GIT PULL] usb: chipidea changes for v5.9-rc1
Thread-Index: AdZlTbkWYn50r544STiJPG47Vm8gZQ==
Date:   Wed, 29 Jul 2020 02:12:37 +0000
Message-ID: <AM7PR04MB7157A59D46B7E843DF7645018B700@AM7PR04MB7157.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [218.82.62.103]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dda4c15b-73d1-4928-3cfc-08d83364dd48
x-ms-traffictypediagnostic: AM5PR0401MB2483:
x-microsoft-antispam-prvs: <AM5PR0401MB2483BF75C4650CFB218CC2918B700@AM5PR0401MB2483.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:541;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DY+U238Xff5/K+xxSjoVEScABbCwIHzeceaYTcUfTtt9Y1s5D3xivQekScVa6QNs+VoZMW76Ib5rDREBIuTWFZuVvhylSChmgWW12DqHhTBMvW6EKHQmLz7tIlSntE2CBkWa3FaQOpnvpSuRfA0soy1LYLcbEfhfPsKbnXR7e9u0yqx5ZsXCQkVxThJNquoWnZD6PJwem4yP0uag70qqLCRRcYmwJWKaOJht++EQCNoEd/Vaxwzl06Kv7YxbSuu9GJ7wt8vPkepmE0irP1rQCAE4IU7epKmLaxlYtrVGgvX8ZCJifzK1HaJZeoaF5QHkVph0pnYVZzRzrN7xv5NmmQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(8936002)(316002)(6916009)(8676002)(9686003)(55016002)(71200400001)(44832011)(83380400001)(4326008)(26005)(6506007)(7696005)(5660300002)(86362001)(66946007)(478600001)(76116006)(52536014)(33656002)(64756008)(66446008)(186003)(66556008)(2906002)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: FlflcBkbc9U5x0zrew5VqEZvfGJIrNX+Nfsu8YhXL++M8iU5F4/5aI5+DCTyacTo/zDKwLaUBJnnCaTwuvQmSaRU8FD2U7CVgZqfBf8viKDbResSq+7ZBJ/sY5CwETs8Jpy8DOTdRwwgwv0Lb3okaNPIUbN+qI6kW69+vvArbu0h2W1Ttz+rf/Klq9QB7vWRA4M+cUvEZ2mIGc4EPX1YhpMVoaML08kbqVBC1ulriyfpwsGk5C+XMFCT/AfayS/79rvsMvapvWbVWJ48DbbwYlGmkyUph4u9skThaSlycvNz52C6ZjdvKQ4V3h0XnbLavbX+O860kgTeNXwQnW9PdwixWiotK4kysgtaza0z7o7k1HXyNrbZOyH3cS1sIBEkolFuwgiMxMYEEDhy9Naf7abOJreCyZU7/er819lCAGdiTasP1TL8eKcszGEwNm60aPGFTkLXMTEGQV2XD4lJjsExZrB9aEV+wqKJ+HrD8S4=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda4c15b-73d1-4928-3cfc-08d83364dd48
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2020 02:12:37.4413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AUTjgI9JmDbuOriPz9h8OywmjhZ/OBsRyPRrlHrfnc16wIl21ASGa47XD2AMxe4iK+jKUEvKvnw5MthiWOs7PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2483
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit af7b4801030c07637840191c69eb666917e4135d=
:

  Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2020-06-0=
7 17:27:45 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/us=
b-ci-v5.9-rc1

for you to fetch changes up to d6f93d21001e4388a25b0b922e02e64bc6004d2f:

  usb: chipidea: imx: get available runtime dr mode for wakeup setting (202=
0-07-28 14:12:11 +0800)

----------------------------------------------------------------
ENDIAN issue fix and one query controller role API is introduced.

----------------------------------------------------------------
Fabio Estevam (1):
      Documentation: ABI: usb: chipidea: Update Li Jun's e-mail

Peter Chen (3):
      usb: chipidea: udc: fix the ENDIAN issue
      usb: chipidea: add query_available_role interface
      usb: chipidea: imx: get available runtime dr mode for wakeup setting

 Documentation/ABI/testing/sysfs-platform-chipidea-usb-otg |  8 ++++----
 drivers/usb/chipidea/ci_hdrc_imx.c                        |  4 ++++
 drivers/usb/chipidea/ci_hdrc_imx.h                        |  1 +
 drivers/usb/chipidea/core.c                               | 27 +++++++++++=
++++++++++++++++
 drivers/usb/chipidea/udc.c                                |  5 +++--
 drivers/usb/chipidea/usbmisc_imx.c                        |  4 ++--
 include/linux/usb/chipidea.h                              |  2 ++
 7 files changed, 43 insertions(+), 8 deletions(-)
