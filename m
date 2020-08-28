Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB3C255210
	for <lists+linux-usb@lfdr.de>; Fri, 28 Aug 2020 03:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbgH1BBg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 21:01:36 -0400
Received: from mail-am6eur05on2045.outbound.protection.outlook.com ([40.107.22.45]:37984
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726147AbgH1BBg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Aug 2020 21:01:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGaRXK8jyKgXPdpFymPcJKSCsDLlyi3KYH3qK7X3fOslvlBOLfXOt9jZ1QzCGNtpIo2yL79wK9d9k7+RnJOfyQKxjALijZ40o/iBwpLUuVI5gb8cC+6j2DadCoLgJXp+e/UaEQmt80cetJExqCBvXSktlr9OwdvP+bE7CLWN6VNfp+GCVk6KpSQoRRNvkA5wOrimOjkKl2hg/Vt0Q/yPLOc/t46usEP0bROcd5XraB0BURZUNE1/qG7/p8R5EHa2+tqSx+wLcCLWhKr9LJrI+5yf4gkxqVxmDSecdoe6iRsaMbSjB7jGjSAmkXApVpOQZbtFvKA/oabwd7sguslOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHFOKFHIin6j4EhJDzKRpfZeRKFZod7Iyif4rwkFL1I=;
 b=UnK5WYYR1EMvqRhSAvJMz2EK8wLuuojt8Acu1YR45SpAwPxDNivhxtSjraITNPxbiZThfLKgzRNBiXZmIP7Vy1x3/bw8WL8vxIQjGh4sB0bT5u6VhxkiMtlgCbPDx04E1bKp/RwPzohmTXvXuvPhhT2tO3F0OvogIHPoyTyS3DkHuo1t5FpwMWn2S6C3pBGQ8qSRo6Bxm0TxSuBgg5jHZ92mBNefWm4tk7Vw5hgznn9hECyx1j+8Qikj9TXLEF/uihePtnuiTEY1D9hzxw5fmWxoTFdhjjkra/vyajTZTJrbOdYbGRIT2TU9Kcd8dzL2eYUl3/r7bpIp4EFJ6LqTrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHFOKFHIin6j4EhJDzKRpfZeRKFZod7Iyif4rwkFL1I=;
 b=Yyr/LnufjRK/W+dVGJupaKCARRyoHy6/damHz6DAZqPblXVyFCUGVjanofncXDObSjHMdbWELbn56fyQOkPmddSg0Az1eMqbfJxl/isiFTd+v2oVBNaFKbLgwa1u6X6QDtufCpxzpLVAXtjkHPk7BfZyiPZ6f/VKF670IY9Q1ls=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB6437.eurprd04.prod.outlook.com (2603:10a6:20b:f3::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Fri, 28 Aug
 2020 01:01:31 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.023; Fri, 28 Aug 2020
 01:01:31 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH v7 2/3] usb: cdns3: add runtime PM support
Thread-Topic: [PATCH v7 2/3] usb: cdns3: add runtime PM support
Thread-Index: AQHWeoU9l5cxnpkdf0yW9wmWeoLzb6lL82KAgADEwAA=
Date:   Fri, 28 Aug 2020 01:01:31 +0000
Message-ID: <20200828010014.GB13910@b29397-desktop>
References: <20200825021120.4926-1-peter.chen@nxp.com>
 <20200825021120.4926-3-peter.chen@nxp.com> <87h7soi60c.fsf@kernel.org>
In-Reply-To: <87h7soi60c.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7262e9a7-0a91-4964-2db3-08d84aede730
x-ms-traffictypediagnostic: AM6PR04MB6437:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB64375B556E2DD8C61225DD4C8B520@AM6PR04MB6437.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9ThoXlwJPpIGk0TgQWH7Wr5cujz64MUc1zfgYRhsQXTeUmdZ9RxA3zAuqjCgCEMYKKhpQTx6HC7ilHiyxiQM/jZ4RCFwMWCYL8g/DkfELDGk+HEeoWooVmUSpp4VtUAQiapoKsafUHrwj9TBhZjjM1XrOtU9cRtGLB7EAPTRgcogwhmJ2S9GWtdYdI47hyt0KTTNjnkp2CbUJm+EBjd9OB7riKsEy8KVoWzlWhOOrMfGpsddmxZLwzv83NLU9WYFnmEhP9tRAEEFowPOyPhTqLtmdCSdP6KPvvGuN+Jnx5/GUm181Lt39rdE7001JFH9LjX/3hye+xcer4XEQOIYKQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(346002)(39860400002)(366004)(136003)(376002)(8676002)(44832011)(2906002)(4326008)(71200400001)(83380400001)(8936002)(33716001)(6486002)(478600001)(26005)(1076003)(9686003)(86362001)(66446008)(5660300002)(66556008)(64756008)(91956017)(6916009)(66946007)(186003)(66476007)(316002)(33656002)(54906003)(53546011)(6506007)(6512007)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: SFdOU59c0/wlalDT6fEHYRQKV4kcm0W866kl1KPc49ZZMqg7Vf9bRaVY6GlRGki0hdrF9HDCMzwXbf8eTa8ND/0GQNNg2Cc86cybuo4giSgCNv/trSNbvGGLmX2t9c2Qood4sHotT45bRmmrA+ETDdUyX251twk90Ecb7j8DzJsdWf2gQxy23GHhX1XUARgJW4VCzazkkmtAbksrv5ruyt02pgk4EcXZz4YrdofKWLzIbruVTcf/PdKSi1J3mNV5IQha2VECxMhcOERJawy5PCjfn+9jgBIbPSRExuDXwj9qeqgamKPH8AfDAtyc6EbafMxVbtnMd8KgVCSFxbKrTdtJxPC7OKZcGZ/eivA77fQAcCV0DkUpIQzpeb6xkSkg0UDF46m0twuoVzPX/STFCPko5izmE2vs+IZGKDH2ef2hawzRmxDREgXlVHxRReq358amW2Df5XUO3t1lYffZVBiwv+KoRrdW/4y6zieedFhscNSxICmxbrRsJakcK7vDG5F6BIMDoN+PN9cfwTp6MRZk/zQwXMVcQVmQrNpZdPn2uyWvHUKwUCXb+1EC56mLC/Zpx83zv80xuyfzQsKNMXXfXXyYZWsZmfa+mf0w4liqkrwm2SCqPmp2oGDcDb597AL3fkGdLb3ete50TTijzg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8B733178B7F78444A1E2B36598A14C62@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7262e9a7-0a91-4964-2db3-08d84aede730
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 01:01:31.8119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CblhACfP0ngzXiRweUZ9yp8M+nt6lhox5Px+zB+INswNeaNWudXVsza46We4TnPq3GCn9UOM7YG14+5MykoaIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6437
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-08-27 16:16:03, Felipe Balbi wrote:
>=20
> Hi,
>=20
> Peter Chen <peter.chen@nxp.com> writes:
> > Introduce runtime PM and wakeup interrupt handler for cdns3,
> > the runtime PM is default off since other cdns3 may not
> > implement glue layer support for runtime PM.
> >
> > One typical wakeup event use case is xHCI runtime suspend will clear
> > USBCMD.RS bit, after that the xHCI will not trigger any interrupts,
> > so its parent (cdns core device) needs to resume xHCI device when
> > any (wakeup) events occurs at host port.
> >
> > When the controller is in low power mode, the lpm flag will be set.
> > The interrupt triggered later than lpm flag is set considers as
> > wakeup interrupt and handled at cdns_wakeup_irq. Once the wakeup
> > occurs, it first disables interrupt to avoid later interrupt
> > occurrence since the controller is in low power mode at that
> > time, and access registers may be invalid at that time. At wakeup
> > handler, it will call pm_request_resume to wakeup xHCI device, and
> > at runtime resume handler, it will enable interrupt again.
> >
> > The API platform_suspend is introduced for glue layer to implement
> > platform specific PM sequence.
>=20
> can't you rely on parent->child relationship here?

Sorry, what do you mean? It is the glue layer needed API for power
management, and pass through the platform_data when create the core
device.

>=20
> > diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> > index e56dbb6a898c..faee5ec5fc20 100644
> > --- a/drivers/usb/cdns3/core.c
> > +++ b/drivers/usb/cdns3/core.c
> > @@ -392,6 +392,29 @@ static void set_phy_power_off(struct cdns3 *cdns)
> >  	phy_power_off(cdns->usb2_phy);
> >  }
> > =20
> > +/**
> > + * cdns3_wakeup_irq - interrupt handler for wakeup events
> > + * @irq: irq number for cdns3 core device
> > + * @data: structure of cdns3
> > + *
> > + * Returns IRQ_HANDLED or IRQ_NONE
> > + */
> > +static irqreturn_t cdns3_wakeup_irq(int irq, void *data)
> > +{
> > +	struct cdns3 *cdns =3D data;
> > +
> > +	if (cdns->in_lpm) {
> > +		disable_irq_nosync(irq);
>=20
> why do you need to call disable_irq_nosync()? interrupts are already
> disabled.

The interrupt is pending if it is not cleared, but clear the interrupt
status needs clock which will be done at .runtime_pm_resume and will
be scheduled later. Disable it could avoid the pending'ed interrupt
entering interrupt handler again.

We have similar design at: dwc3/gadget.c and chipidea/core.c

>=20
> > +		cdns->wakeup_pending =3D true;
> > +		if ((cdns->role =3D=3D USB_ROLE_HOST) && cdns->host_dev)
> > +			pm_request_resume(&cdns->host_dev->dev);
>=20
> nothing for peripheral mode?

CDNS3 device is only at device mode when the connection is there, and if
the connection is there, it will not enter low power mode.

>=20
> > +		return IRQ_HANDLED;
> > +	}
> > +
> > +	return IRQ_NONE;
> > +}
> > +
> >  /**
> >   * cdns3_probe - probe for cdns3 core device
> >   * @pdev: Pointer to cdns3 core platform device
> > @@ -418,6 +441,7 @@ static int cdns3_probe(struct platform_device *pdev=
)
> >  		return -ENOMEM;
> > =20
> >  	cdns->dev =3D dev;
> > +	cdns->pdata =3D dev_get_platdata(dev);
> > =20
> >  	platform_set_drvdata(pdev, cdns);
> > =20
> > @@ -466,6 +490,15 @@ static int cdns3_probe(struct platform_device *pde=
v)
> > =20
> >  	cdns->otg_res =3D *res;
> > =20
> > +	cdns->wakeup_irq =3D platform_get_irq_byname_optional(pdev, "wakeup")=
;
> > +	if (cdns->wakeup_irq =3D=3D -EPROBE_DEFER)
> > +		return cdns->wakeup_irq;
> > +
> > +	if (cdns->wakeup_irq < 0) {
>=20
> should be <=3D 0, no?

Good catch, will change.

>=20
> > @@ -502,6 +535,19 @@ static int cdns3_probe(struct platform_device *pde=
v)
> >  		goto err3;
> >  	}
> > =20
> > +	if (cdns->wakeup_irq) {
> > +		ret =3D devm_request_threaded_irq(cdns->dev, cdns->wakeup_irq,
> > +						cdns3_wakeup_irq,
> > +						NULL,
>=20
> if the thread handler is NULL, why don't you use devm_request_irq()?

Good catch, will change.

--=20

Thanks,
Peter Chen=
