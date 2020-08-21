Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 336CC24CFDC
	for <lists+linux-usb@lfdr.de>; Fri, 21 Aug 2020 09:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbgHUHrE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Aug 2020 03:47:04 -0400
Received: from mail-eopbgr10068.outbound.protection.outlook.com ([40.107.1.68]:54904
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725908AbgHUHrB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 Aug 2020 03:47:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONmgW/xo5NBzZggOPlK+GB30XekKDoeK9Rb5tzRq1IFJGOB0FNXCLsV889KLov8DGkFIHk1xXjUdX8ti8PiIEzahGbdFFcH5keTXzPaS1+jPmumX9FCfeKf7q+0yID51Txku9NOjTlxbNKZWHgpxQcr5Sqr7Vbs3WVho14TXebh8NNEz1zPVyfesivRHAqcngevelA53hWzzWzRRaoTfN+ZZ/M+zt9JorrKswSgeRw/Cehbh5cF/lvseVaejitZiDfMMmQVSUWzWMBQN4NULbdNezWZRsULX+agYSbN8FlZZgQ9D5gzE94G7/BmSrXg0hrfyLb8whoGh/+an7Y6Lqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vo9N+0+/lQ52kW4F0D6JaI1skMXniN8q3hRdCIhbHEc=;
 b=Sw0WW+5fZbQKfRbaw9HAPDrJQcFwZHsjakh99ZjTd6bQvX+rSK2AZ7UFPITqIHLZVe+hkvUPhTaslBRQthh+JKk6aZhPlUXpQLFo0whrXPw0TpUj0r0jLYTKZoiOMwJCSZ9zdvLUCaPB2DASyHZgbm+7unQ03E2gOHqpOM+KStBCTpqzBAirSTrv+C9gZHoDzmL60BLSEVaPf6HVWnDAxu6wMLKKFhRNJXiavRBPLy8aUay6IU2V6CTh+Iom4/TCSicMyFb61Rp6AnTLDyOv/71i5zHB9vXr2AZpZcRZSqixeB6UZIJkkOAM1nvuWUBxrfbzs9N28UCVq3GnDdWq8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vo9N+0+/lQ52kW4F0D6JaI1skMXniN8q3hRdCIhbHEc=;
 b=oZsyMOn7r5Y/LFqwPFZG58JO0vcAaommiLXMs7sacViAD0DZlFGBS8dT0K0jnpUVxVGhlgNJ5aE9nXGWaeAjOkQ+dOWcVl+GmL/bbasyEsPJui9KEDbXN4Hf4s1La6xqsi3EwSfMC2xuwfsqxW+m3xBRfEHxce1GSdnWCHS4FEs=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 21 Aug
 2020 07:46:57 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3305.026; Fri, 21 Aug 2020
 07:46:56 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH v6 2/3] usb: cdns3: add runtime PM support
Thread-Topic: [PATCH v6 2/3] usb: cdns3: add runtime PM support
Thread-Index: AQHWd2XEEgpm6etnqkujz3EJ0f/8pKlCFkKAgAAZIYA=
Date:   Fri, 21 Aug 2020 07:46:56 +0000
Message-ID: <20200821074551.GP24960@b29397-desktop>
References: <20200821024836.4472-1-peter.chen@nxp.com>
 <20200821024836.4472-3-peter.chen@nxp.com>
 <1597990555.21253.9.camel@mhfsdcap03>
In-Reply-To: <1597990555.21253.9.camel@mhfsdcap03>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cc9df4a7-b1af-4b5d-39ba-08d845a6612a
x-ms-traffictypediagnostic: AM7PR04MB7157:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB71576F00933920D6299DF64B8B5B0@AM7PR04MB7157.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N8hQQLUI/Ax9NZjIgsl4El9dm/d4ryZuQH7T/ujO4i8OWxHKGRWI9FFXHimxy8B6ldMOqQpnLV9xcwohrcbCTZeD0DnfZKm+nkacbkoUXvRIn5d17SCGsGJoVxia6JGOdiU+0fKGdY79asc3Bpj+joaaikkyqVM8rQQin+E6QRxcl2Ac74tlv1Q/ke1prK2q32NDvXTRB4cqTxlJVxmReRYkrtD3ShbgUaNf+vPW6r174PJyTKn5G07P7aZz/lHHm7ixzkw0KAxeNymZ6EpZsZ6R8VwaPBRTp4BN43M2EIiUGJVmZgkZK7H1bLqcUBgLTsXG1bJXHlVRhSG6YqoTPQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(186003)(8936002)(26005)(478600001)(5660300002)(66476007)(64756008)(66446008)(6486002)(1076003)(8676002)(66556008)(91956017)(76116006)(66946007)(54906003)(6512007)(9686003)(33656002)(4326008)(83380400001)(2906002)(6916009)(6506007)(33716001)(71200400001)(53546011)(316002)(86362001)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: HwC/YpWVVPyEBQ5hEivdxvzIl+bMeAEDG8bxIbku2NybFvgg67Js6bSB+fi4BGmYWr82Kl896LMW7BJnsl9qw2OC4tdGqTmVGoshloPustXXKNEYmSLJyqYZqqridV5Y3GNcgboLE71Nc6kwI8/pK40w7IWEjELXatiW5qGXCs5IpZHUiAT++5Fbe6Ra24F+3S5NfcW1d6Uoe5Jo4/pOJgBeh3/8HNtzfh+hv6k+YE3kuhCrJYTU2tC0vyqDRM3VzgwziIVpJSsf5a+Rt3sVQfTTg/BmduWMt83r8AkA3zYy/fOdVKXOkTmbXcrp4vgso930ondm9bLVlOTaaM5yhVRQHn+uycK4zjqYeP00TteHg8cOxBUgqtQ8IYClAceyCYisMq0xZks7gBZ7Qu5ELjUPdxP7etIt31Md8UOWMn8lGy3POuV7wR1tyD6x0vRjLOqN2CcxGgqVBJilRUWmIY1h2ljPdeM8zhQjM6zR8XfxXfunmopJ8HyJbMsQflcirEaYyDBL7O39+W4owpqFfmOQ/FhdxyBExH/QywVr62KykmcJ258KRig+Ebts7yaxheJ7EurbNJ41CsyNTaKhaCFVkinG3nQFYXv/7b0SCoqKoBe83MPPr2Qs/PKcy6MMJ9290J2HcSIqxA58d+NLEw==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5FAFFA2786C4F54CA3492E8F5AC2EA75@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9df4a7-b1af-4b5d-39ba-08d845a6612a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2020 07:46:56.9263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cOeiwdoSWWZ+XuUvcScS0ZZ0gD47+89Bb0njFfwDLOrr973F4yz/93SoDJf2qMV72fjzTKsKRp8qNwlamXurlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7157
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-08-21 14:15:55, Chunfeng Yun wrote:
> On Fri, 2020-08-21 at 10:48 +0800, Peter Chen wrote:
> > Introduce runtime PM and wakeup interrupt handler for cdns3,
> > the runtime PM is default off since other cdns3 may not
> > implement glue layer support for runtime PM.
> >=20
> > One typical wakeup event use case is xHCI runtime suspend will clear
> > USBCMD.RS bit, after that the xHCI will not trigger any interrupts,
> > so its parent (cdns core device) needs to resume xHCI device when
> > any (wakeup) events occurs at host port.
> >=20
> > When the controller is in low power mode, the lpm flag will be set.
> > The interrupt triggered later than lpm flag is set considers as
> > wakeup interrupt and handled at cdns_wakeup_irq. Once the wakeup
> > occurs, it first disables interrupt to avoid later interrupt
> > occurrence since the controller is in low power mode at that
> > time, and access registers may be invalid at that time. At wakeup
> > handler, it will call pm_request_resume to wakeup xHCI device, and
> > at runtime resume handler, it will enable interrupt again.
> >=20
> > The API platform_suspend is introduced for glue layer to implement
> > platform specific PM sequence.
> >=20
> > Reviewed-by: Pawel Laszczak <pawell@cadence.com>
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> >  drivers/usb/cdns3/core.c   | 153 ++++++++++++++++++++++++++++++++-----
> >  drivers/usb/cdns3/core.h   |  16 ++++
> >  drivers/usb/cdns3/drd.c    |   3 +
> >  drivers/usb/cdns3/gadget.c |   4 +
> >  drivers/usb/cdns3/host.c   |   7 ++
> >  5 files changed, 166 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> > index e56dbb6a898c..8e588eef38df 100644
> > --- a/drivers/usb/cdns3/core.c
> > +++ b/drivers/usb/cdns3/core.c
> > @@ -392,6 +392,30 @@ static void set_phy_power_off(struct cdns3 *cdns)
> >  	phy_power_off(cdns->usb2_phy);
> >  }
> > =20
> > +/**
> > + * cdns3_wakeup_irq - interrupt handler for wakeup events
> > + *
> remove blank line?
> "Do not leave a blank line between the function description and the
> arguments, nor between the arguments"
> see kernel-doc.rst, Function parameters

Thanks, will change.

> >  	/*
> >  	 * The controller needs less time between bus and controller suspend,
> > @@ -559,52 +608,122 @@ static int cdns3_remove(struct platform_device *=
pdev)
> >  	return 0;
> >  }
> > =20
> > -#ifdef CONFIG_PM_SLEEP
> > +#ifdef CONFIG_PM
> What about using __maybe_unused instead of #ifdef ?

It may be suitable for the number of function in power management scope
is less, say 4 functions for both runtime pm and system pm.

But for cdns3, it includes more functions at pm scope (will be more in
future after supporting more features), it may needs to add __maybe_unused
for all these functions if using your suggestion, so I prefer using MACRO.

--=20

Thanks,
Peter Chen=
