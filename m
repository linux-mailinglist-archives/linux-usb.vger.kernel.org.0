Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D589A1001F3
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 11:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbfKRKAZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 05:00:25 -0500
Received: from mail-eopbgr60067.outbound.protection.outlook.com ([40.107.6.67]:53127
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726460AbfKRKAZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Nov 2019 05:00:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gt+TlL/lr0ZZiEY84UgSNbWhXtDE0zO6FdDjOI6aR+1JMtv0rsk+4u957ZpWknKnaGHbMuhUmy6KwhdrpmUKzu8KPl7uXrasAwZe2w1qT6LtGkuO+7yXXIEZgOEkVf29ksw+ptSZRTHX1fmqMNkVAIA7GKum7ZEmTkSGPqutoI+a8+TLuvZjYbeAucWYGvaNEIDytXfYtq1FNOoX1d5QDmO1cm4U8S8ZzrNblufJDQ+z1iAS/Pz8FVHbQPBzfcWq3g+m2e2cKTSceYoIHA4RmnkwIbgHpLyLUOWZCOtWnjhkDyCMKWoBcisC658uPGl879HMI4iO3T+TdZQfX1sicQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1FfBiejN+QWrxdUIMiYeJ/QS1kbEb09/kJdeEhOF1w=;
 b=VhPJbQ8xnlvOJsQX+nnhFfUaLDk9smed1pMy6VPTGxdG1EMiCCVjb7pRSemE2sMag2q/WzSsOZzzRnj8tgfiScQJnhmG0g7oFAw2Gx+M+mNcBF2oLmVVuslfO6puO2FoizK6nlLuCJjiWdvXHbyxDjW239vsFZIuveuePX6VNCeRF+aNo7LVzhM7NNSWvyPR6wtkLhfDrng9gvthx5tkoRXaNJuS2nlPn23OaM3TIR2N2TsoLQ6PGI7OmuXX/MMojqkfoZZa+olqCy7kGzVOzRVPHh8wKlMZFKsp4zeN+KSaiSwrlvzW9Bu93fXja/9ur8BwXn9U3ra79MATWYBkBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1FfBiejN+QWrxdUIMiYeJ/QS1kbEb09/kJdeEhOF1w=;
 b=ft0/UgMuQw+b8vSPaChoLefBbpU70M6td0UuS400SDTx173B/sZYZU7kxV0A4cg38XhoCWIgil5E/3XllJmEz5RMYgo/gn0URm5nhqLbTf/MQNfGlD9YDzTdUcMdxQKQ87Mu/K/iSyFJr38APQXKh5xxmF6bjnxILbsDiOmSk3g=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB6061.eurprd04.prod.outlook.com (20.179.24.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Mon, 18 Nov 2019 10:00:22 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::cd33:501f:b25:51a9]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::cd33:501f:b25:51a9%7]) with mapi id 15.20.2451.029; Mon, 18 Nov 2019
 10:00:22 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [GIT PULL] usb: chipidea: changes for v5.5-rc1
Thread-Topic: [GIT PULL] usb: chipidea: changes for v5.5-rc1
Thread-Index: AQHVnfb9Luprz7d6a0KGtp28dSEHJA==
Date:   Mon, 18 Nov 2019 10:00:22 +0000
Message-ID: <20191118100020.GA10641@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [101.84.12.122]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 44558e06-4eeb-4fca-d005-08d76c0e204b
x-ms-traffictypediagnostic: VI1PR04MB6061:
x-microsoft-antispam-prvs: <VI1PR04MB6061F6583D104FF965C46D548B4D0@VI1PR04MB6061.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:549;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(346002)(366004)(396003)(376002)(39860400002)(136003)(189003)(199004)(25786009)(1076003)(7736002)(71200400001)(86362001)(316002)(4001150100001)(102836004)(6116002)(3846002)(6916009)(2501003)(4326008)(76116006)(91956017)(66066001)(5660300002)(66446008)(64756008)(66556008)(66946007)(9686003)(6512007)(66476007)(8936002)(305945005)(1730700003)(33656002)(81156014)(81166006)(8676002)(2351001)(476003)(33716001)(186003)(99286004)(44832011)(256004)(14444005)(6486002)(5640700003)(71190400001)(486006)(2906002)(6436002)(26005)(478600001)(14454004)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6061;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RNvzJrKxTr5olshwz59IY4roXbIrUWkKe0CGLhwhfs19xO2ivg/is9z3L4R74L2+cv7jZVP0OryWgytqwVmez/8wi2z8Vb0EIngQeN4xsNyN9V5W7NbJGlKK34bjrvYjCU8bA99/LWj9oaCg+MhPxObctITD1f5zisJNivOpGhyFbsMTAQYic5ny8i8zlo2kHDNohc4Jpg19yu5nXpro26lnuePcoE3EVprspe0mLSHHy0JBaFt3Zti6aFdZgCfIgwJBJbGTsR1a2M16UIt9WlIUGiQnXH4SbWPusMXeST9DZl7poVmZHZ6VrxLAzrl+9loKsSITPKh4IY2phAllIcYBHcfOKsoHc+IYxjpbcSQ7UXaMVubxyDwD19i/FysVRtrHv7N87NiSMTg1Wmoih9n/JPrIjZXboY03kT3WxXq0eo/v4od3JQWOJ7dPpZ3C
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <502889B6E55F6A4CA6F7A2C2AE10327E@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44558e06-4eeb-4fca-d005-08d76c0e204b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 10:00:22.2466
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GGSwdFk7doWtgC1luYoLYQpGyzUrCJX/wA6gezovCP8+bDGqi+mTNuiVx0U30TdnlUPtzH6ZpzADLqqgHZEkWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6061
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit a079973f462a3d506c6a7f00c770a55b167ed094=
:

  usb: typec: tcpm: Remove tcpc_config configuration mechanism (2019-11-16 =
14:45:31 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/us=
b-ci-v5.5-rc1

for you to fetch changes up to 4d6141288c33b73027260e73df262464cbe1fd0d:

  usb: chipidea: imx: pinctrl for HSIC is optional (2019-11-18 17:40:27 +08=
00)

----------------------------------------------------------------
- Improve the Vbus handler
- Improve the HSIC handler for i.mx serial SoC
- Some other tiny changes

----------------------------------------------------------------
Jun Li (1):
      usb: chipidea: udc: protect usb interrupt enable

Li Jun (2):
      usb: chipidea: imx: enable vbus and id wakeup only for OTG events
      usb: chipidea: imx: check data->usbmisc_data against NULL before acce=
ss

Peter Chen (5):
      usb: chipidea: udc: add new API ci_hdrc_gadget_connect
      usb: chipidea: core: change vbus-regulator as optional
      usb: chipidea: imx: change hsic power regulator as optional
      usb: chipidea: imx: refine the error handling for hsic
      usb: chipidea: imx: pinctrl for HSIC is optional

 drivers/usb/chipidea/ci_hdrc_imx.c | 79 ++++++++++++++++++++++++----------=
----
 drivers/usb/chipidea/ci_hdrc_imx.h |  2 +
 drivers/usb/chipidea/core.c        |  2 +-
 drivers/usb/chipidea/udc.c         | 73 ++++++++++++++++++----------------=
-
 drivers/usb/chipidea/usbmisc_imx.c | 31 +++++++++++----
 5 files changed, 114 insertions(+), 73 deletions(-)

--=20

Thanks,
Peter Chen=
