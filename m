Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0CA52134FD
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 09:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgGCHbR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 03:31:17 -0400
Received: from mail-eopbgr130057.outbound.protection.outlook.com ([40.107.13.57]:25478
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725648AbgGCHbR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 03:31:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6O4Nwk5R/+tdQgotvKkDppfqvkF2sm8z7Vqh6JKzkHEG8KmXw49ON59ZSO7o9yntmXHNhl565zFBt6yA4LSEoHxApCoHnp2EW7+euXRHajFBPpynPp4jpbpT9PRZx6Ep6lAbURB9QFTbCkkDaI1wYKeKeUQTZAJ2tEaIgtZaNQS5DFWbtcWueX49fYW9H7ZAXZNO6zKm4KCoIGrNWQtOM/90wDyj+sZ4kTb/rjwdIffUGI4R5hxVyPUJbnFTL3jDxtZU4DsEtVfK7tgGVHIRPZuFWXKzQWDQBbGkQt6ICISzQ56qSOWj2dKhnK40uqtp4qurg1Rdv7f2ETDksKZPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tED+YSXa+tZAtoffxaFBxvY20Vyj9cHGhFikOF7pNrk=;
 b=BADPXI/FKABHG7rHEFtFAMK8Sq0NpRzTnM3OguGWY0kwqiSwHkNwPOm+xDJcba3d7KkPAbqonIbHMp9EPDgQWOTqqwi2fbRDpU0JVoi1TmuZHZMzqZVZxfs71OsoB3PI2hwpOfaU0GAFqBn/GTenaqlPVCUP9IC4JFmPcT0XryxoSWFSpYc8lbzNBrmXX8MOxTebmVaXAIB3ufaE+QE4YPcXKc2n4jReAoTsmc/3eeIk7shCV2KGtghn0s1ZxV1ucZChpzNkCc46sm/FyMEI6Na0HlfbN9CuEXn7gz9i6bF0RKd3DscbbmJJX5r6P6mzkgEkWXS2qnC8Nx5D99vd5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tED+YSXa+tZAtoffxaFBxvY20Vyj9cHGhFikOF7pNrk=;
 b=THI6xtg9CcaCCfYB5Zx3qgtkTt61strggmQm4LzJ1HwmoRSRSAXocll0tghgCAY4yAgZPOf4y99bxUHPcScj0ocznyIzH7S0ZbMDGyYgUne0+R/uUHoEI8LujC1g9/35+D48QZ9YAaeyOlFXUFeCoCuBdGY2B5NWNshh0FK+t2k=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5910.eurprd04.prod.outlook.com (2603:10a6:20b:af::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22; Fri, 3 Jul
 2020 07:31:13 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 07:31:13 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>, Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH v4 1/9] usb: cdns3: introduce cdns3_set_phy_power API
Thread-Topic: [PATCH v4 1/9] usb: cdns3: introduce cdns3_set_phy_power API
Thread-Index: AQHWUQL0PtcjUE4mgku3gXRs+JvfiKj1bVEAgAAEZQCAAAH+AIAAAiwA
Date:   Fri, 3 Jul 2020 07:31:13 +0000
Message-ID: <20200703073122.GB14348@b29397-desktop>
References: <20200703062653.29159-1-peter.chen@nxp.com>
 <20200703062653.29159-2-peter.chen@nxp.com>
 <20200703070044.GB2220026@kroah.com> <20200703071628.GA14348@b29397-desktop>
 <20200703072336.GA2225285@kroah.com>
In-Reply-To: <20200703072336.GA2225285@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 81bc6b38-f1ae-4e18-26db-08d81f23106a
x-ms-traffictypediagnostic: AM6PR04MB5910:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5910D05A126FCE03FCA0E76B8B6A0@AM6PR04MB5910.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xDF4VNZJGbQb7sZ1gyeu638uFCWidKMM83ZJLCFzCrNuocmk4/HaLwTbP74JLWURzph12ceG5+inQ7xhu2sVjZcgFQiVyU4RbsWxDwZOwsWEMEc/gB0b2VvCpkWGOpgsxQh8bf07/B/cZH52HVTQwdIDECtMqjgoPJrLaGr3WOtnucSMw6LegcS85i9DY2US5lLE9mR0huSULNcwg5R8N2xk3SmZ3bVUvbokX/l/lG04UyCprc9ivJL9gK/Qc8AMQ/qpldNO4J3X6eWueoTSumOTP3ZAx7pL1emoigNKdB+yr604c1sy8U39aS40l7+NefgdJiM04MRBX34IA0czZA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(346002)(376002)(136003)(39860400002)(396003)(366004)(71200400001)(186003)(54906003)(33716001)(44832011)(86362001)(6486002)(8936002)(8676002)(6916009)(1076003)(316002)(9686003)(6512007)(26005)(6506007)(4326008)(5660300002)(2906002)(76116006)(53546011)(91956017)(66446008)(66556008)(66476007)(64756008)(478600001)(66946007)(33656002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: yOqXqSLec/7PmdCs6uZ3OKnTQk4flmw89TILVp5M8qYlTR20t1Kt3uCsJl+TEf1SwKAwO3tb08U79wmiF6Tm/fqHGTZqkWbP4fDZfV5YjOD6vvZqKo5WA5WDWzIAFSYIf+ujKWb+2Z7sgUTIvzBdL1g+4a0awKe3iM/aS28Pt4YwF68FKzMykRQKC+Piu2lRMVnrqodUqy7N541Vt0s1LD/93F+wUvV924aDRoFJ1a5hXf72DLkKgpeY34+2hPaPVF3N3RYaDlpKrl7sRqsBMk4Eay4D2iml72zEFDzRDFOgp1gT5KG5hM3GcGmd3s/Ka22VKT+8f9KbBBlbW55ksm+jB4aJ2gEeIkwpCV0RiL7PO0GkspE1JWN0HtlO36PKWCHlEX7x3ycASSbTGsk3Xjl4AQvFslyvWTuaF2EsrMZJl5mysAdGZZA3+hOYLfSpA66tSt7eIk7h9thKQL6Wb2Hx/8aWlsBw0+Yl9v3rNZSNNhySnLlNxGM+1zZZKWLS
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7ADD982BA5537C438BB7B49310258829@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81bc6b38-f1ae-4e18-26db-08d81f23106a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 07:31:13.2295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f0adrz5+3+7uOXghRHVccB4Tx0nVUve9NToPDGYhkgnxPFU0jEx/Dq6HbBrOxPV0JSL7Ebi9gC73obMyhrHQEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5910
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-07-03 09:23:36, Greg KH wrote:
> On Fri, Jul 03, 2020 at 07:16:19AM +0000, Peter Chen wrote:
> > On 20-07-03 09:00:44, Greg KH wrote:
> > > On Fri, Jul 03, 2020 at 02:26:45PM +0800, Peter Chen wrote:
> > > > Since we have both USB2 and USB3 PHYs for cdns3 controller, it is
> > > > better we have a unity API to handle both USB2 and USB3's power, it
> > > > could simplify code for error handling and further power management
> > > > implementation.
> > > >=20
> > > > Reviewed-by: Jun Li <jun.li@nxp.com>
> > > > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > > > ---
> > > >  drivers/usb/cdns3/core.c | 44 ++++++++++++++++++++++++++----------=
----
> > > >  1 file changed, 29 insertions(+), 15 deletions(-)
> > > >=20
> > > > diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> > > > index 19bbb5b7e6b6..bfd09aa98c12 100644
> > > > --- a/drivers/usb/cdns3/core.c
> > > > +++ b/drivers/usb/cdns3/core.c
> > > > @@ -384,6 +384,28 @@ static int cdns3_role_set(struct usb_role_swit=
ch *sw, enum usb_role role)
> > > >  	return ret;
> > > >  }
> > > > =20
> > > > +static int cdns3_set_phy_power(struct cdns3 *cdns, bool on)
> > >=20
> > > Please just make function calls self-describing, instead of having to
> > > try to remember what a specific flag means.  This isn't as bad as som=
e
> > > functions, but the general idea remains, this should be 2 functions:
> > > 	set_phy_power_off()
> > > 	set_phy_power_on()
> > >=20
> > > no need for the cdns3_ prefix, it's a static function.
> > >=20
> > > Then have those two functions call a helper if you really want to, bu=
t
> > > that means that reading where those functions are called is obvious a=
nd
> > > no need to backtrack to where this was declared to determine that the
> > > second parameter meant on/off and not is_disabled/not_disabled or
> > > something crazy like that.
> > >=20
> > >=20
> > >=20
> > > > +{
> > > > +	int ret =3D 0;
> > > > +
> > > > +	if (on) {
> > > > +		ret =3D phy_power_on(cdns->usb2_phy);
> > >=20
> > > See, phy gets it right.
> > >=20
> > > > +		if (ret)
> > > > +			return ret;
> > > > +
> > > > +		ret =3D phy_power_on(cdns->usb3_phy);
> > > > +		if (ret) {
> > > > +			phy_power_off(cdns->usb2_phy);
> > > > +			return ret;
> > > > +		}
> > > > +	} else {
> > > > +		phy_power_off(cdns->usb3_phy);
> > > > +		phy_power_off(cdns->usb2_phy);
> > >=20
> > > Ick, even worse, this needs to be 2 separate functions as there is NO
> > > common code path here at all.
> > >=20
> >=20
> > The purpose of this API is adding two PHY (USB2 and USB3) APIs into one
> > private APIs since two PHYs power operation are always called together
> > and we will have more than one places to call them.
>=20
> That's fine, just make 2 separate functions that do this, don't combine
> it into one that does two totally separate code paths based on a flag
> that is passed into it.
>=20

Thanks, will change.

--=20

Thanks,
Peter Chen=
