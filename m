Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68ADA1D1045
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 12:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730789AbgEMKvT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 06:51:19 -0400
Received: from mail-eopbgr40079.outbound.protection.outlook.com ([40.107.4.79]:53153
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726907AbgEMKvS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 May 2020 06:51:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzTz6XnPIEJ+gaaHwAJx3kI1pZaQpSQzkAldrbfa71nXQb8O4cxe/0KydKyfAnsaAj+znKVzaQLwfaHhGI5u2sZIWgbjdHGpRmcVudb8L8hD6GCsGraa4MgJZG+gLF5OU/BZNAvrLD+EY6+faXdh5T0/bh7x5aBtkYe8uIhEyxX0xZC/pDxqXxIL++B8r7H9nn0S7SIqB8I4Lzu8X07qpxq+FkaAp+Xyd8+GHL3brxsfkFmjQICfxJJ8glPQ92aicD3fIXC6FKuZW71+6jtucMKDk65XM3NcHNHG6738Kog22a1+4zlia6HklJlkABPpSSZpgHZ0bDiJ6qhPpUY01Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPF/KL7FomRz2B25y6l0cPoHR2LZfQIdN+zu8GQqTk0=;
 b=R9SEaGX8SUrsH4r64v9epGTe/j8omRcN4D/Sc7E03zcdWY2R4m54gIhcOH3tgxAUhaHydlcPrm4z3sDcdCBUKHkwxFUCwXkCQ/jXK3OpomRz67SDiZfS1HKts182rOvnRTC1FRhUqHvmFkES6AATUacAgMhDOEZM8FwgACYPS+DO6KLjprgBTf3SgxxcqQijmSwSMfY9394sg2hNzy5SKj1GPuXF6Wp1QA2myt076G+mxlRZqy24rPFer8E60cYnC8AJrzrYEYDjDoMIp9Ght0RdqD66WzHReCPVs/01B7jWXq8dUVaRPGknxUS3/wHxS1Jd90V7jWC5G3Nlj8uqNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPF/KL7FomRz2B25y6l0cPoHR2LZfQIdN+zu8GQqTk0=;
 b=ahfsjkm2AVx1YwjeJAXcs+KeW19mD72virZ2t9arB+/TiVjKs2jUtobnuHISB1g19c18h5UXSwmozmWCBzrweSkcCDhJH0TrADR1OUIYUWuC+Vh0XHWqdBR4DiRhg9piUIj5s2ILGzZMaBHv1CJJBKXMhMLncOIcHhq5SFBW3EU=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6965.eurprd04.prod.outlook.com (2603:10a6:20b:104::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24; Wed, 13 May
 2020 10:51:16 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792%9]) with mapi id 15.20.2979.033; Wed, 13 May 2020
 10:51:15 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
CC:     "vkoul@kernel.org" <vkoul@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/1] phy: phy-cadence-salvo: add phy .init API
Thread-Topic: [PATCH 1/1] phy: phy-cadence-salvo: add phy .init API
Thread-Index: AQHWJC9ThOji/cLM3EGGm4nAa34ZO6ilXASAgACElYA=
Date:   Wed, 13 May 2020 10:51:15 +0000
Message-ID: <20200513105141.GB3698@b29397-desktop>
References: <20200507052120.27497-1-peter.chen@nxp.com>
 <20200513025709.GB29070@a0393678ub>
In-Reply-To: <20200513025709.GB29070@a0393678ub>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6d6a60e1-e2d1-4577-31d4-08d7f72b8f87
x-ms-traffictypediagnostic: AM7PR04MB6965:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB6965C3725041D57E2FA79A988BBF0@AM7PR04MB6965.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:392;
x-forefront-prvs: 0402872DA1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OxKd3ReW7Ig4ckkUYZ1wxMBG1tocU2GswK04h6rEz/FRSYLCdx1R6pViuCl3MvXSe7MvySGaOoBe2bOXfQQ7ecgHCuL3fP6fJ3VdcA1tnLK8e0FFAmYHHqoO28xIoRJHntYbXjl6m7PPHO7f4dZArUJWeydgvbe3LDw/rguwh9gxE7UvbMVzQbcw27aVqt+A6Pw6I3D5P+NHlkBdj5CsXCBuZCS+lSvPis+01W9fwfhYIXXEfrKhgk88OJT3x1mUee1VXqykj8XkRCZOvkslv9IkMoNhxaBT13IAeHEX70cyAOXAH1rxfSfK2spOEOciWp3YdVAsfg9xq66i68C+dWTNQ3EeXxOs6D92yVXz3egg2HO/a4Y5vv/LsLDGpJc00lTpeukRUWnmTuLDaoz4h+96XA6YA8+SR9piR5ILw/S6MrJoJRufkKZFmmBjsjaW3teC81jkAYiUGZdA4/7vBqEl6tZVJ/5gOATmUFxx8rBkGSyIFdfJr1G6tMsfGNqMDFYaoiSS3UnEcMxBrDsSNv2rrQ+UOvTK0JJr0IQyvMn6e3lOyEmgUlXpkeH6nk4PensIFQElwbPcRSMa6zx9JuFY4fUJ8ths6WW93N9Fd8+W1fhpg+9KPrH3Kmg/eVlC
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(33430700001)(33716001)(71200400001)(2906002)(1076003)(4326008)(6916009)(316002)(5660300002)(54906003)(33440700001)(966005)(8676002)(53546011)(6506007)(33656002)(76116006)(91956017)(6486002)(8936002)(86362001)(478600001)(64756008)(44832011)(66556008)(9686003)(6512007)(26005)(186003)(66476007)(66446008)(66946007)(142923001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 56l/p5LS1fNfcUp3wIM84oIVxMECHBSbaMygHR3JbiTl2pIUmfbifRohL5axqEa8Kee5iHM2ytNbHxOb+HGVbw3eMQgGGptixOZXnbTZ50UF8GBETLW73lfJJRFQm11Y799sMALfyV4itC1WwT5f6kqXy0032ni3rX3rObMvl34gZQlTyPrcp1+Q0Od5EhFSRkyqV0MJuiVsMqZe/jcy36i4dyTjCnRLCuR+TAUGK/Yolh5i3ym0ooAPIayME2Sq2PYNn9Vl0fsSlp3tHTtAfaPNSOl7pg5euajLUhI1ZAfvPVLPVVigvIUWJhBuKsiYB0YbTeaTnJ6vAMYWJ8em64YNfs4aFDQ21IfOIzo4nQBqJFFgzsEHHWamXhx6cFjW1tCdGOfrXLDbZJRrHsqgLMUiIhYdZbHtThjaypbwKGMymFUHuuSbSKfPKyThYcEgpV8M0FTX9miumxYPRXx+Anp4oO8Ye3prJuE1Yd5C5CQ=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <49F2984DEFF20A4982A12D9FB1C9A2DF@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6a60e1-e2d1-4577-31d4-08d7f72b8f87
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2020 10:51:15.8905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vsz2HV7auPNpFMwPq/Xr7PJ5Io2xslBTSSnDhbDAmUqBkxPP7Hljwr7eLiULTh/OUFySy2DIPkuZOn5+PJY9EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6965
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-05-13 08:27:09, Kishon Vijay Abraham I wrote:
> Hi Peter,
>=20
> On Thu, May 07, 2020 at 01:21:20PM +0800, Peter Chen wrote:
> > .init is used for PHY's initialization, and .power_on/power_off are onl=
y
> > used for clock on and off.
> >=20
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
>=20
> This patch doesn't apply cleanly. Can you kindly check phy -next is
> proper since I expected this to merge cleanly?
>=20

Hi Kishon,

I don't see my first salvo PHY at your phy -next tree

https://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git/log/?h=
=3Dnext

But I do see it is on linux-next tree:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
?id=3D50d35aa8c15f7210fe76de64b1940100b588bcae

What happened?

Peter
> Thanks
> Kishon
> > ---
> >  drivers/phy/cadence/phy-cadence-salvo.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/phy/cadence/phy-cadence-salvo.c b/drivers/phy/cade=
nce/phy-cadence-salvo.c
> > index fa666527356d..c2b6ddfe02e0 100644
> > --- a/drivers/phy/cadence/phy-cadence-salvo.c
> > +++ b/drivers/phy/cadence/phy-cadence-salvo.c
> > @@ -206,7 +206,7 @@ static struct cdns_reg_pairs cdns_nxp_sequence_pair=
[] =3D {
> >  };
> > =20
> > =20
> > -static int cdns_salvo_phy_power_on(struct phy *phy)
> > +static int cdns_salvo_phy_init(struct phy *phy)
> >  {
> >  	struct cdns_salvo_phy *salvo_phy =3D phy_get_drvdata(phy);
> >  	struct cdns_salvo_data *data =3D salvo_phy->data;
> > @@ -231,9 +231,18 @@ static int cdns_salvo_phy_power_on(struct phy *phy=
)
> > =20
> >  	udelay(10);
> > =20
> > +	clk_disable_unprepare(salvo_phy->clk);
> > +
> >  	return ret;
> >  }
> > =20
> > +static int cdns_salvo_phy_power_on(struct phy *phy)
> > +{
> > +	struct cdns_salvo_phy *salvo_phy =3D phy_get_drvdata(phy);
> > +
> > +	return clk_prepare_enable(salvo_phy->clk);
> > +}
> > +
> >  static int cdns_salvo_phy_power_off(struct phy *phy)
> >  {
> >  	struct cdns_salvo_phy *salvo_phy =3D phy_get_drvdata(phy);
> > @@ -244,6 +253,7 @@ static int cdns_salvo_phy_power_off(struct phy *phy=
)
> >  }
> > =20
> >  static struct phy_ops cdns_salvo_phy_ops =3D {
> > +	.init		=3D cdns_salvo_phy_init,
> >  	.power_on	=3D cdns_salvo_phy_power_on,
> >  	.power_off	=3D cdns_salvo_phy_power_off,
> >  	.owner		=3D THIS_MODULE,
> > --=20
> > 2.17.1
> >=20

--=20

Thanks,
Peter Chen=
