Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1098012F2F3
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2020 03:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbgACCbY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jan 2020 21:31:24 -0500
Received: from mail-eopbgr130070.outbound.protection.outlook.com ([40.107.13.70]:48366
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726089AbgACCbY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Jan 2020 21:31:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLivXOJ2IhIsLHZsNAZ8AZ9mWRMgncqsCItpylqGB4rt+bO1iYezqI8xxZCwk8NXtdI0ofjrZBo7QxQ2KIxNNVfy9Gl7IviOtHgzMbZvfXxzNrofrJIehkXg3rkqjBm+hddqS/GMIAh5lxP1e7wx6LJTo15G+CVbe7FvQUr8GPmhL0hgVIIrXKL5tZWi66W0WO7mA7srdOl8YwuJDZ6rpvLaugJDxjJiFFGX7RZZWW6n6AL+Kti1c+bWQoJSjU3A09xi1VaPPRtEEGXqrm+7nzT+S0ve0hCelpcCH4BuS30TtBAIbh9keb0IDeontQ0AwmUAqdK/M6FsqBUUaOqvyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yB230d9PDpCkeiTsuIuXxPAS38CURcGZSpkeH4HoyQs=;
 b=TtW7gzFP6dp5mjY3Sgrli0E0Tgmv41zNxFiQ/Lnt5Fwg8f3wpk3EU1XeGsbXygo7j1YwMdqN37MkWcWdZRlAibLBmeau7RH++rqhs4Ij9Lrv1rPKEW7H/VljgTb1+k99sX3jDMmVkkumJvKdOoha8tykNxmToUoxGo8G1y/ZVTPlOwsHvDLeNua8iR3kgzJtUBQA1YkXCiKiU0RMYCb6JTib1C+JEJt9egxuOYja4FSX5X4w7+VaMfxtvEmrvp09yK8p1DoyWUjkXK9fyFX/NC2RC8kHUhKeGRfTQjjzCK+Gi9PlP/8M1iwRBJ0YL5spwc48aQz/GkhPpq5iqs/zvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yB230d9PDpCkeiTsuIuXxPAS38CURcGZSpkeH4HoyQs=;
 b=X/8L7wDN9SEZOnf+3MTatsy7lN1XTrxW/iBCbKgLOXXqmE3SXv2YSHO4kObi89oMnNL7Hj96DL14QsfdcDCVQcaB4FaUNTjiDEeeW6JF0bvlYe+opij2MvAZuZXHrCupwjleMAd8aYULcSVr284T4LbHbkA8bDPH4ef8P7YItnc=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4142.eurprd04.prod.outlook.com (52.134.31.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.12; Fri, 3 Jan 2020 02:31:20 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2602.010; Fri, 3 Jan 2020
 02:31:20 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: RE: [PATCH 1/1] usb: cdns3: add NXP imx8qm glue layer
Thread-Topic: [PATCH 1/1] usb: cdns3: add NXP imx8qm glue layer
Thread-Index: AQHVvHs151j0fHhAcE+5mb4ylkF2s6fXRheAgAD8RMA=
Date:   Fri, 3 Jan 2020 02:31:20 +0000
Message-ID: <VI1PR04MB532770282A2C0701BD2A0EBA8B230@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <1577426348-31227-1-git-send-email-peter.chen@nxp.com>
 <878smqksjo.fsf@kernel.org>
In-Reply-To: <878smqksjo.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ae077936-e6bc-4ada-8499-08d78ff504b1
x-ms-traffictypediagnostic: VI1PR04MB4142:|VI1PR04MB4142:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB414206561D1C343F0EC195C98B230@VI1PR04MB4142.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0271483E06
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(199004)(189003)(71200400001)(54906003)(6506007)(8676002)(4744005)(66946007)(26005)(186003)(66556008)(66476007)(66446008)(64756008)(86362001)(81156014)(478600001)(316002)(81166006)(52536014)(7696005)(4326008)(5660300002)(2906002)(33656002)(6916009)(8936002)(9686003)(55016002)(44832011)(76116006)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4142;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lbaGG8v1NcTOCnciGpsYGPZ80woR3IvvldtiZpj7D0onb/HADU3KWXhit2kjtooW68iEvQSW6kc/H1T7Y5Gb7gxBm42AsWzARWnURQkyaTa4WDBAYZMDQ5UES+pXrRCGylnDrMEkGY7AoseJvU4qeyIRAy8o58XwRJyDHt7ZUGLUsSL8npyC3fHGJWCIJR2wIz3bzv2/0JN8Rt8Cw3eiEXy5daa70mthoIWmuKfxcrKbZMFuz2TO5SL5RHzE1i3GMKVtJsmN8Fds8f2webt8Ks/++5TcOlEN/hZskhxd7oAMVqFT3BPQdp83vXRTm67mV0j4y+P0VLJWwvtuEC8twuOCIoUWpm/XvwhO7lyXB0kC/ofsVM6P7th7PiMhhRNpyqp0p6876w/hWIT7121Ywm3aWTyBUqFn+fdMLbDwdPntj13HrkjVfTTboPFbVoc/cKUCxp/D0ZInw3lTsgLaaA9S5IOduRXPcflhWNlNg7E=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae077936-e6bc-4ada-8499-08d78ff504b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2020 02:31:20.3667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kLN0pKvupgL/91Ghoxqup1e9JpqGg+32ZzFiINhEpDYmpPQ7bULdeTZ5asbi1v7C/gLaQ6mo5Ckiu8CCskfxsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4142
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> > ++++++++++++++++++++++++++++++++++
> >  3 files changed, 231 insertions(+)
> >  create mode 100644 drivers/usb/cdns3/cdns3-imx.c
> >
> > diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
> > index 2a1e89d12ed9..b1f526d20f03 100644
> > --- a/drivers/usb/cdns3/Kconfig
> > +++ b/drivers/usb/cdns3/Kconfig
> > @@ -53,4 +53,14 @@ config USB_CDNS3_TI
> >
> >  	  e.g. J721e.
> >
> > +config USB_CDNS3_IMX
> > +	tristate "Cadence USB3 support on NXP i.MX platforms"
> > +	depends on ARCH_MXC
>=20
> I want to be able to compile this in any arch. Please add COMPILE_TEST an=
d
> make sure it works
>=20

Hi Felipe,

How to make sure it works? Except for enabling CONFIG_COMPLIE_TEST, what el=
se
I need to do? Thanks.

Peter
