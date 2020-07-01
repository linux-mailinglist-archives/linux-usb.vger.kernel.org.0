Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8028C2106A0
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 10:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgGAIpY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 04:45:24 -0400
Received: from mail-am6eur05on2044.outbound.protection.outlook.com ([40.107.22.44]:8798
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726670AbgGAIpY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jul 2020 04:45:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4XCcgrtJK1RKPsLb21ytDxahJ5bb1OYtF8iwgeGMtjKJYlRCY1aAhZXvFILJrkD5N+/9gRtGO2+LTjQXsQ0VEdo1DIGNyb7ikfxaBJ5+y71t3ej4dJpx1K93DXCaZxSa2h9Em9X5qkmFp5W5wGwBTll5PTh3X57CkaJg3UJGv4vbRa99g9dsZEqNFj+1qeau0oOrb4NJm+yqOOybxibsGW31z0JHRiIo/Z0wPex4tBPXL+noUfIJ+mLP/tqrEF4qAKjM4PUQ+w0h24NwSrPEny1BVyRr+TZPWNQqLgnx64uhPXS3CKCDaZqYhBN+C3DsciGGtAv9giv0PU4iuTX9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYduv22NjdiMgf/ka9Adq74Hlk6K7jnSrdpuIfYYUMo=;
 b=JmUrCNC9PcEer1eHmZikntXoGqYd9bJNjSOPDvSMEOPnFZIVRk/zMM0jMMVjjmev4aajVJ/ZK6wUqktJaYEBgGHxmItMAI6tg321WIcaFSJX5i3/Ssh2HLuhei0ZCSEwiuRNOxT8BEZC5GcfLR+dySQIAFvtDZ07JfYkCJIVSICd1oNVqmAXHORQZwx/Xw0oCDaf9Ktcikxi4iOsukZCqEkfNuyuOvg8eH9Lfvj4K7NIDO7KukdpaKq2A8t53/SV0q6u9bAzul++phCQ5o0cpHw/k4r/6+Kt0zpDedFKCXxTnUmX0TFMGjRjK1Qd08U5Gxh7oFMS4KiJ67lssty4wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYduv22NjdiMgf/ka9Adq74Hlk6K7jnSrdpuIfYYUMo=;
 b=d6c9hWa8a2ZI9df3c2T31FSnxVpXgT53MlDNOUZIYWjKXzBVHYRvzrvYH7fcozu7qsGEP+NxDaMMbv/CoIdKJCFlXLZ8i5JLeEBBUuJG4nlOX+m0Ynd3ayzWnjZlMwGJFb7z1agtSKCzM8cDv3cMVxYZ8n2ejDXhu8KBQ82somo=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5621.eurprd04.prod.outlook.com (2603:10a6:20b:a6::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Wed, 1 Jul
 2020 08:45:20 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.023; Wed, 1 Jul 2020
 08:45:19 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Michael Grzeschik <mgr@pengutronix.de>,
        Peter Chen <hzpeterchen@gmail.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Michael Olbrich <m.olbrich@pengutronix.de>
Subject: RE: [PATCH v3 1/2] usb: dwc3: gadget: make starting isoc transfers
 more robust
Thread-Topic: [PATCH v3 1/2] usb: dwc3: gadget: make starting isoc transfers
 more robust
Thread-Index: AQHWTkoJI8UlZltj2Eahfb2K9K2n8ajwGYUAgACl2YCAAUI7AIAAQU4AgAAmHRA=
Date:   Wed, 1 Jul 2020 08:45:19 +0000
Message-ID: <AM7PR04MB71571C8D0C89FB998AB431928B6C0@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200629132206.3914-1-m.grzeschik@pengutronix.de>
 <20200629132206.3914-2-m.grzeschik@pengutronix.de>
 <20d3ff88-b4df-91e7-aaa6-ec05917c32ab@synopsys.com>
 <20200630071337.GJ21325@pengutronix.de>
 <CAL411-p19PX+utRb=x-pfBqXPjpHz54BO5OzdZVAuLQKjKxH5A@mail.gmail.com>
 <20200701062040.GM21325@pengutronix.de>
In-Reply-To: <20200701062040.GM21325@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ba267550-44dc-4a7f-c563-08d81d9b160a
x-ms-traffictypediagnostic: AM6PR04MB5621:
x-microsoft-antispam-prvs: <AM6PR04MB562110627AAD81F62D6DF5808B6C0@AM6PR04MB5621.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T1KusjVYM/wL6LCyqq8gpPfw/UjwtgpR2jsO0Zco7lbQgF/G6G0DTZV9eeSG0L9lngvWL/Lh2sbJY+8CJnkqRQXW/7fk0hMuflzqEtseiT507LSEZAorz/UNY7vjiqLdrySNVTAD+OcgamyA+Ae+A6x9TZrZuhB0ncUAoP29ashkQXjW0novX/VbzFq9S0Jawf0xMeRHWLeZibny4EOMTZpS9ggJNSp1F6QQ2dcxWte3fh1VqPOfacom1rRCEk6C/5NFMA3gUY9jBsFWCKaXD3Xq1pwEbzJ0DdzLieUjA38EupP2zZaKG8CeFPKx89SQKZXbP9/jCVm+lWmPmghLNP+HuFCeKYMW9MsSarPMofyKdQ3poCytcg40YBw0i+hiNfMjiOR9BdNX2h8hupTGsg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(4326008)(7696005)(8676002)(71200400001)(8936002)(9686003)(55016002)(33656002)(83080400001)(66946007)(966005)(5660300002)(83380400001)(2906002)(6506007)(110136005)(316002)(86362001)(26005)(478600001)(52536014)(76116006)(66556008)(54906003)(44832011)(66476007)(186003)(64756008)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: HCfAAkvKUlL//DCJj5bMidULbvXJsCi0xD39PTfobiaGPgQvUrxoEWTA7eCWLFMa0GEvNZMqbP05RdN12bgyMFRP6awoox18JXjdbtLy5l4HUmw3V7Z0ivMCRUxw8gnuTzMVGam4+3LBf78nYWV11GpspW9oJmK+v97pxMSBWVG4EqhX0xKf1gcYkbkJd+kSyqaNjY3VrVO51VukoQfvmoGxc2jKcI1jmpY8+X7SskIfEueTI5M9iNltJgXf0Mlp9iJtl6LrMia3YyF66RLZrkYFjilSg9kToF9kTF/m/uKVqwpEcd0n5+VN9lyEk5PRUZjYNO8nMkB+Bm/u380JXW2ulR0aQLtOVC91DCPv/MK0ruprX3zC9L9Ucth6OtHUhVUq/CS7Nijh9/XXJSA0WEEH3p54QcinRruHYhIbiVgGbmIeTRi/jmKLUaBdTiBJVqSFa09daAcU8IUC0WGGRRu0/6Z3TMXs96pCz33enPI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba267550-44dc-4a7f-c563-08d81d9b160a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 08:45:19.9258
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rFpbdgqgFEGBZpYzMYH2cXpsDqMci04VALsOfJ9U8ADy545aqONk06sidNDLKcsdSTR0Vl+V1IlhQka6orqPUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5621
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

 =20
> >> drivers/usb/chipidea/udc.c
> >> 1634:   ret =3D hw_read(ci, OP_FRINDEX, 0x3fff);
> >
> >Hi Michael,
> >
> >I can't find the above code for chipidea, where did you get?
>=20
> I was greping my usb-wip stack where I have an extra Patch for the get_fr=
ame
> callback implementation of the chipidea/udc.c. I think I will have to pos=
t it.
>=20

Welcome to that.

> >The frame index value register is a standard EHCI register, but for
> >UDC, it is not a common register. UDC design is varied for vendors.
>=20
> Good to know. Is there any measure to find out if it is there? I would ad=
d that
> limitation to the above mentioned patch.
>=20

Sorry, I can't get your point. My point was 0x3fff is the mask for Frame In=
dex Register
for standard EHCI controller, but this value may not the same meaning
for other controllers.  So, I suggest only defining for dwc3 in your patch.

Peter

> Thanks,
> Michael
>=20
> >>
> >> drivers/usb/dwc3/gadget.c
> >> 1406:           test_frame_number =3D dep->frame_number & 0x3fff;
> >> 1453:   dep->frame_number &=3D 0x3fff;
> >>
> >> drivers/usb/host/ohci-hcd.c
> >> 557:            ohci->fminterval =3D val & 0x3fff;
> >>
> >> drivers/usb/host/xhci-ring.c
> >> 3980:   start_frame &=3D 0x3fff;
> >>
> >> drivers/usb/host/ohci-dbg.c
> >> 635:                    rdata & 0x3fff);
> >> 641:                    rdata & 0x3fff);
> >> 647:                    rdata & 0x3fff);
> >>
> >> drivers/usb/host/u132-hcd.c
> >> 1535:          ((9 * fi) / 10) & 0x3fff);
> >> 1605:           u132->hc_fminterval =3D temp & 0x3fff;
> >>
> >> drivers/usb/host/ohci.h
> >> 701:    ohci_writel (ohci, ((9 * fi) / 10) & 0x3fff,
> >>
> >> I could write a patch changing them all or at least make a common
> >> gadget define.
> >>
> >> What could be a common place for that?
> >>
> >> On device level only it could be include/linux/usb/gadget.h On whole
> >> usb level this could be include/uapi/linux/usb/ch9.h
> >>
> >> Ideas?
> >>
> >> >For both patches in this series:
> >> >Reviewed-by: Thinh Nguyen <thinhn@synopsys.com>
> >> >
> >> >Thanks,
> >> >Thinh
> >>
> >> Thanks!
> >> Michael
> >>
> >> --
> >> Pengutronix e.K.                           |                          =
   |
> >> Steuerwalder Str. 21                       | http://www.pengutronix.de=
/  |
> >> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0 =
   |
> >> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-55=
55 |
> >
>=20
> --
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
