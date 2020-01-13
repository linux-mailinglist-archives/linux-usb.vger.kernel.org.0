Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C342138D94
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 10:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbgAMJUJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 04:20:09 -0500
Received: from mail-eopbgr150071.outbound.protection.outlook.com ([40.107.15.71]:18311
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726236AbgAMJUI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Jan 2020 04:20:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGcOlq/tqOOp+4l5A/UGpjXHH7uF9Ct+y2dDta3b3QOc7Fmk2tEPkdjO3aJRbovCFG1vY4pXKoQ4KwrHE+vYw5B1MRN8j/KVUgDojlKOaVVHNLU+1iIpO/gFQ0vzcv40BIyNUqYZet/NdtSLbTFhKK/VStL25zOrRYn4eQNeR1Z5SVdvXiLiXjmkc+3GfS1zDUobX1UJPzXXmUo3HmQMQdqTc6cbuuXEDOG0ioexTmP8qmyjrynhUb/re8GafNtjJCLScC/yZkhSciZlg0R6i7ZIdaMQqNuVzsvjocisOgOINhjKsI7pt3aQgsuy1VEVHm/0jNPG+zDrdD5C/8AFOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psDxgWcPxTb0LllhuHb2KeGt/jRPAnF7E06DRu+OPTw=;
 b=c+g0tK6IXSZETjVZq8WcQY+GB0+TrxmkpNyzl4zCCbvCswXyheeFfoQ1TgEG0j8TMPCy2sffWPRr4MDqzBbmBrPwjSjyxepK5MLGY+oGKNMMIUlMIR0jHdEsi6ZsGMHZ6djv4SlXzjEv0UraNj2hjdnGjiEfScR+rC0JNyhow2umJx6SjmwsD/95fIImwNbMsQtj5KDKyopBUjx8lH7IYSX/G/DqguecE4RSNapQFonIcDoQeq3LhCO7dzzklVcmnb/DSavrjQkeoWAzRDbQm8avplyevKC5bfdtwNCZUB38eeoJ27Sp85duZiOcyZJPEUKZsIojp7n9+KXo9uv/BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psDxgWcPxTb0LllhuHb2KeGt/jRPAnF7E06DRu+OPTw=;
 b=h+CAqapDhwsohEx5vZtQifSk8KiyRaV/QJ0auPJc7gLbFlTKI54bK1CRZUVa1TjyqtrzME7mxuWoWY52TbY1res7dACURPYmHdXrdNAG5tbwrHzJ6JEhfn2/onURH0E4WFQqU1jnhXPCLpFb06HvzRdRJ03EvMyRVnLI+6lynPo=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB6222.eurprd04.prod.outlook.com (20.179.24.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Mon, 13 Jan 2020 09:20:05 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 09:20:05 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>, Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH v2 1/1] usb: cdns3: add NXP imx8qm glue layer
Thread-Topic: [PATCH v2 1/1] usb: cdns3: add NXP imx8qm glue layer
Thread-Index: AQHVxtDDYQC8DMUxY0O1pFYdKmO/zqfl3EaAgAJ7XQA=
Date:   Mon, 13 Jan 2020 09:20:04 +0000
Message-ID: <20200113092001.GJ17599@b29397-desktop>
References: <1578562558-32462-1-git-send-email-peter.chen@nxp.com>
 <20200111192559.GB435222@kroah.com>
In-Reply-To: <20200111192559.GB435222@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e5601260-7756-4409-7f65-08d79809c6ba
x-ms-traffictypediagnostic: VI1PR04MB6222:|VI1PR04MB6222:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB62225C73AB455054EC4484128B350@VI1PR04MB6222.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(346002)(39860400002)(366004)(376002)(136003)(396003)(189003)(199004)(54906003)(2906002)(8936002)(9686003)(6512007)(53546011)(66476007)(4326008)(26005)(66446008)(64756008)(6506007)(1076003)(44832011)(66556008)(91956017)(76116006)(6486002)(8676002)(6916009)(33716001)(86362001)(478600001)(316002)(186003)(33656002)(81166006)(81156014)(66946007)(5660300002)(71200400001)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6222;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gZcFT13PNC/ElsHY/dP21YhZbO8Rfe+iQbGTbtRJlAVTksBZStXCjUIKPxtaoe5N2SEULDyTFOjOMDByDtIubjYo/Y2e5pk9kL37s4ChLi9Jt7MeDLzx45bs0nXh/OBR3PQwM58YwJKkiyxdKNIQA6YC8lePtvGnbgxQPZjxbvRUBQ7g7q1OWBal6uYwCVwnAAEsiPHESjY01WbQ0pZoJxM52Ioc72UFUaFWuX7Nj4R6ZzrhruznaTCHltEONBftAywTH3l553ERjMFIFlxtJXG3jiRXBX9Y+UYnCQmi+IWIWCMCe8R13xAPsRHn494GgDCJFtGVW0JJVMm0tzJaKXckFaitVgV1t272BDIY/jOqowqBvUNyukaCTi3GX5NLmtFL1LVet/3slYRmmjNmRW+yCypHYeqGv3OffUw81mMCLBR7DAN28P0BPFwA3g67A3vLqhYG+lO5HPy6h9qUfotXkQLCK3E1rxyfN0SgTyJ0jRYxfLq2xFi1TjuCejjY
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A4180431AA484B4F94FFEBB0641FADEC@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5601260-7756-4409-7f65-08d79809c6ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 09:20:05.0744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 651Y4ei7xOTWo7xeMJctfuVqeVvWVxutBx41ZJxLiOlZTLTTXHH5zhqWWMQU4c5gQ56fPjJ6jsS1tSiYRK40iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6222
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-01-11 20:25:59, Greg KH wrote:
> On Thu, Jan 09, 2020 at 05:35:58PM +0800, Peter Chen wrote:
> > There is a Cadence USB3 core for imx8qm and imx8qxp SoCs, the cdns
> > core is the child for this glue layer device.
> >=20
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> > Changes for v2:
> > - Add COMPILE_TEST Kconfig option
> > - Using BIT Macro for definition
> > - Delete runtime pm operation
> >=20
> >  drivers/usb/cdns3/Kconfig     |  10 ++
> >  drivers/usb/cdns3/Makefile    |   1 +
> >  drivers/usb/cdns3/cdns3-imx.c | 216 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 227 insertions(+)
> >  create mode 100644 drivers/usb/cdns3/cdns3-imx.c
> >=20
> > diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
> > index 2a1e89d12ed9..84716d216ae5 100644
> > --- a/drivers/usb/cdns3/Kconfig
> > +++ b/drivers/usb/cdns3/Kconfig
> > @@ -53,4 +53,14 @@ config USB_CDNS3_TI
> > =20
> >  	  e.g. J721e.
> > =20
> > +config USB_CDNS3_IMX
> > +	tristate "Cadence USB3 support on NXP i.MX platforms"
> > +	depends on ARCH_MXC || COMPILE_TEST
> > +	default USB_CDNS3
> > +	help
> > +	  Say 'Y' or 'M' here if you are building for NXP i.MX
> > +	  platforms that contain Cadence USB3 controller core.
> > +
> > +	  For example, imx8qm and imx8qxp.
>=20
> What will the module name be?
>=20

I will add module name at Kconfig, thanks.

--=20

Thanks,
Peter Chen=
