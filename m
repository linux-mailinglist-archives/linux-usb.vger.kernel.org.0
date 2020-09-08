Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0503E260E51
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 11:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728810AbgIHJII (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 05:08:08 -0400
Received: from mail-eopbgr80087.outbound.protection.outlook.com ([40.107.8.87]:59879
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728925AbgIHJIG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 05:08:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQXA8uHzGtkH3gd4Grxh22lJRBxtiOO64lxaV+Ep45pjppI7EOesvIGU7JTHEx3tRR8VoeNbPgxEUU2VYzSIpwItu2lRBGuzLuk2ZXFW1yE2Isqy4F5goZfBkwQz/vHrcQk73wtQKYPLnlAVXbqc94mFJMpLchntWrizoxj4EVGE8NT3muALqz+Piv5YJbQXq7lP5CcPr5vJSED8aCSKY+EYUqyoJCsZgMsqKf5JQRiNMgD6LI/TWinN4RuIRN++fCQPyh5z8v/Rw17Ufla6cRHJlKVshjO71jxZKJowoNTXt2FKQ25yd2za57zh3YUsOdfAE5YNxTpDiMZTNMvX5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHwbbHbWGaNwjmu+9LG6Kg84FSs/KFeTIlSZmY2196g=;
 b=YxbpbHx3mmuiWXi2wyGmAaYaaBRPDl5Ogdv6VSzNg8C4GlF1FUrpoF3mwTYEwLsXS+sS7XQOpZDrIIa4Oln3OYloXNv+WurABpa3HUWIoFsigwYcKTIR1RSW4mD8MDWZ8qCr+fyNfOAjDfsij/6m+1LaYKG6VVOn6SVkJl/kU4P9YmnjOLtlfsoOprBbgUSJ2fZviZqmjBFs48P2xiD7WDUYxk0xNu7OQTL6YGc/BItZRCrmP3GddtjJQ8Li9WJ8YFDWxbGtUoq0JCIXfmfZqqerhOnAdiKipxH+YuOIA9f9N2zJdt6ZE2gJ9aRAlFNty1RsqbvsgYQzjAPOWcz7ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHwbbHbWGaNwjmu+9LG6Kg84FSs/KFeTIlSZmY2196g=;
 b=YG30GH9ZOveLKPTThzae1Oj+y294dnf14Tw+ON9RplaWpi0hUnyrb8U+4uC93EnkGyRtUcuw8pqh4KfA8Qqwh9QSydXStD4CtP1RXW5xBK7vU0RokatEVmOkwyJRnVH+7r/Q8qFvWgKwwy7xsYRO5OwegLWYv7LpicN2TSLNwcA=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4166.eurprd04.prod.outlook.com (2603:10a6:209:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Tue, 8 Sep
 2020 09:08:02 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 09:08:02 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH 7/8] usb: cdns3: gadget: sg_support is only for DEV_VER_V2
 or above
Thread-Topic: [PATCH 7/8] usb: cdns3: gadget: sg_support is only for
 DEV_VER_V2 or above
Thread-Index: AQHWgDxHfyd8uEgd80qfK7gl1WkV46leUsKAgAArwYA=
Date:   Tue, 8 Sep 2020 09:08:02 +0000
Message-ID: <20200908090734.GB18578@b29397-desktop>
References: <20200901084454.28649-1-peter.chen@nxp.com>
 <20200901084454.28649-8-peter.chen@nxp.com> <874ko8n5jw.fsf@kernel.org>
In-Reply-To: <874ko8n5jw.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 31ea2adb-2209-4e8a-eb1b-08d853d6b0ae
x-ms-traffictypediagnostic: AM6PR04MB4166:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB416680C54CB193D0DB4BDEA08B290@AM6PR04MB4166.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oukI5AmRjqx4N7UeG78hjF/VpVt8bHxD5H7vkrSqm5TrWn8o19L5olnUyrPKFPuZS166fOPcfDnoQbOj3AnGjcVTaQJ3V6/OzatQhRniD4AHPaREEs3gWEK9cwvux045hYM53TAWSayb1QoSMbH3JmORr1qc7E+HdgF29FkH/1yEG7QrPljgILd0MXdPNa5N7PfJz93LpHC+p1FZYTmymBfaV1DmfHuo0CKuw/ImPj/Mua2IMfEK1uA3ySLPYNp9flbE23J1hsbiJM+Y1heaMInP9U+8+nyNG3ia0sRBu38R9qqd2c3WT5ePuQ31iT166QycuUH0za7fPSmpIJ1qDw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(346002)(39860400002)(366004)(136003)(396003)(8936002)(33656002)(66946007)(76116006)(66476007)(91956017)(64756008)(66556008)(66446008)(6512007)(83380400001)(9686003)(2906002)(8676002)(6916009)(44832011)(6486002)(478600001)(4326008)(33716001)(316002)(1076003)(86362001)(26005)(186003)(54906003)(5660300002)(71200400001)(53546011)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: QDRD8UtusuCLRR1+zKDjnEdmeuaUHu8AS6xKVSgMcHzwCHfwEu1Rk7dlHe+ZFMIup1+9daV4HgkOoicPbrqlmwcrp7sQnPENZGy7UVaaE5GD4w8tRVCMFp4Trte/IvsIHnJmVBVkPDDTW/Omu4NTWpoaXtrtYg/d2Dk7h5ewrYM7nEEJs6F04mPv1Sgx2FqsAsJ9P+YhJj/IIcLvUT0ZQKWPioDngoNdcsCyMxrTxJ0j1UI2oKmZHuByU6MondAL9SSRYkpg9RfE1D6Z7LGP/pBIaLFWl+/nN39F7fcj9Yo6u4QxCxj+pWbdFx9VsDb9izeXJZt/Lj8jyF+acrOCkqEGWEQN3Vgww39fADxXCrMPBApUXCWwdkJ9cvf4cOnhAAK3hfBv/l0goJpvDCM9T4byXaSnGclrN8y8EwbPstDerFeeT2KcMVFcFxxPQPa7QRBJnarSx9RA2IDXpRV/5qBggSteBMcdtF/NSqgUNFyHfcLkMdYD9AK1ZdWwoVtuklEyXj98GJVf1hHlx0wrOhG+GRDlH3mVftXyMyyIhV+U0GWINKw4ZFHV1AMdG1ZO5JiITg9tT4jlddxmWPeqUicaepDcfb9GzwKrhZq56NrGubEUyl4RAL755/cdLv224g4hbXF6EyBGRmEdaxXGKA==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0985334CCAA8A4428186AF99E3DD20E9@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ea2adb-2209-4e8a-eb1b-08d853d6b0ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 09:08:02.4140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NfDMQMjaPC8NU//K6Jx/LoonUp0cVXOOzvpxXpXiEHeYbIm/fQ+JJOtQtfWjx/4QkBmjwXNfJHHFK+/BP5xmvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4166
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-09-08 09:30:59, Felipe Balbi wrote:
> Peter Chen <peter.chen@nxp.com> writes:
>=20
> > The scatter buffer list support earlier than DEV_VER_V2 is not
> > good enough, software can't know well about short transfer for it.
> >
> > Cc: Pawel Laszczak <pawell@cadence.com>
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> >  drivers/usb/cdns3/gadget.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
> > index 1fd36bc5c6db..82dc362550bf 100644
> > --- a/drivers/usb/cdns3/gadget.c
> > +++ b/drivers/usb/cdns3/gadget.c
> > @@ -3161,7 +3161,6 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
> >  	priv_dev->gadget.speed =3D USB_SPEED_UNKNOWN;
> >  	priv_dev->gadget.ops =3D &cdns3_gadget_ops;
> >  	priv_dev->gadget.name =3D "usb-ss-gadget";
> > -	priv_dev->gadget.sg_supported =3D 1;
> >  	priv_dev->gadget.quirk_avoids_skb_reserve =3D 1;
> >  	priv_dev->gadget.irq =3D cdns->dev_irq;
> > =20
> > @@ -3200,6 +3199,8 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
> >  		readl(&priv_dev->regs->usb_cap2));
> > =20
> >  	priv_dev->dev_ver =3D GET_DEV_BASE_VERSION(priv_dev->dev_ver);
> > +	if (priv_dev->dev_ver >=3D DEV_VER_V2)
> > +		priv_dev->gadget.sg_supported =3D 1;
>=20
> is this a bug fix?
>=20

Like answered at Patch 4, it is better to keep the whole patch series as
the improvement for sg use case.

--=20

Thanks,
Peter Chen=
