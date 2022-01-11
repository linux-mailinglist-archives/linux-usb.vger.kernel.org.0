Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43EBF48A6E0
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jan 2022 05:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347914AbiAKEnt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 23:43:49 -0500
Received: from mail-eopbgr20066.outbound.protection.outlook.com ([40.107.2.66]:32135
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1346578AbiAKEns (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jan 2022 23:43:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0eLRBP4Y4Fy5ZdVfmYsQZ08IbVfllld8ZblxlI677iqO/aLyIiQQQP/mZDJEtT/CAytLwmfpvsEwbP07ajLLYKg25CjcAPnlLeFzIzp8ad6mcQZfvafW9aymg7DSSTxuNZbowcjS5V/NKWz5iHLW/ULHoI2tGNByomXeNGtjIlhuZEdCaquqSLV2Mi9ua1ERUcgq4wGBNpsSAMWHg4pKPNqyHtLYrMi5fQpzLb2v5TnQXhb2j7PHPjK7JPPLYD5m+6IoMenPS73vdoTYCt9QDJaAFYssd7J8c+sHFRKxV6BnyWGWuIr6X3LNmlHp97iX5nBvNQ5INf+u1RZVrZkww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7pePvfMlwTFUiRCn74T9aXqx9Vc4fvJYMoCu7o3PEE=;
 b=YiPC27MXr6dcUNm77guZ6epiM50ukhuyRCxaBDOB1wTJvbmg8aGNF63VOKB/6dJdoQgO8DTpQGvTiwiHfUZpmFHkv1HvLAdLYX7AufLlK1AZZ1scKygB++OctuTL6xhph61o7cAJfTy8oqtvoNYEhsPoHgvwkfo4FS34nN3CE+gOD0ujUKjutR9gTt9frdsPQoZaZK20iCdpgLFFOmGewCs8jqQHWqG4OAT8eI5gw8cX3iOH+/Kvn7CSrh8zCsgCWRo75mri6tZHAK2PIjzvV9zqJUJPsYrtMXAkEUsnAES0VFyd8IEajDTpUDr0RK44a+eMnfAnJQRxN0obGjiK1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7pePvfMlwTFUiRCn74T9aXqx9Vc4fvJYMoCu7o3PEE=;
 b=Qk+Tv+YTIqX8rDH//g35mbqsO9lNiqwc8F/rxXrZ9Mr4sa8bcjeZwEPvKw7x7HKI0KRUMe/3aR3aiaTfvv3x5ZIUubYDebVoP1tyD2fB3putNjrVRyRRPHT7coAFBsYn6TlsCIVn9CWp12x/hvQ7DA+Ne+fqWcP+NBGO9MvmwBI=
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14)
 by DB7PR04MB5226.eurprd04.prod.outlook.com (2603:10a6:10:21::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Tue, 11 Jan
 2022 04:43:42 +0000
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::9934:6146:9a64:1e51]) by DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::9934:6146:9a64:1e51%7]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 04:43:42 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: typec: tcpci: don't touch CC line which
 source Vconn
Thread-Topic: [EXT] Re: [PATCH] usb: typec: tcpci: don't touch CC line which
 source Vconn
Thread-Index: AQHYAtsEUEQcni7BgESQTaxATURzt6xcNIOAgAD0iNA=
Date:   Tue, 11 Jan 2022 04:43:42 +0000
Message-ID: <DB8PR04MB6843B12B11964DCFA68F7B518C519@DB8PR04MB6843.eurprd04.prod.outlook.com>
References: <20220106085325.1353591-1-xu.yang_2@nxp.com>
 <YdwlpzR+9+EFyguz@kuha.fi.intel.com>
In-Reply-To: <YdwlpzR+9+EFyguz@kuha.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 207068e9-fce6-41a9-de90-08d9d4bcf1cc
x-ms-traffictypediagnostic: DB7PR04MB5226:EE_
x-microsoft-antispam-prvs: <DB7PR04MB5226EB3693741D309671C4F28C519@DB7PR04MB5226.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I+nGIeu3VJkZRAWcE3WrC6hCMMX4ChLSD5emY61ADv6OIdCPClKk9muGxCfrD9z8nQKLpEmbKBoSeV9PQEI3OEYzabTlURYTjvwTWYBUePzF3+S1y9KX7ELP/uMJX2xy079DK8zuEU1UsKG/bhzbd4NcTpcb141gxV3JjtuR6+gefe+C7IRM4fzW2o2EiYeh0J0P8qDzYLwbTXCFrM+HaizK9rBW18AnaTjKfS3M9yMzzrpXiTsPjMJdjEyFK/BcNqIgp9Bn9ybg7GtSLJWnTI++7dCGG9NY6CFC9PtnhwIyDBh1LFzKZDDJt/ri3vW1lUKdAukPcIElYtJ6EHhfG9w8yA0OTpjQP7LpKPy5k0u+CX0hT1+xPRJzQrKSJr9g8EE961SQZWT0xhUde67Czv18cbl75Evwl5+x3z9QCYlH2NFXg0bvvWfvZCW8xGNABVs8axjkiG2VaoSSVXOC/3otK+umlh6bUIyLQ+tMy2Hr8ZCFIBovAeCzfZdCnq0XJPf7lCZC/zc+DW4AeSBNyEHE54aNt+RePdT9Xv/ue+OVqq1EjnZCKiSAfiZwA2RElmtoOUZJ+PGKBKtlFEakNLCShc9Y+UwkV3HJH4yaMbLs5wQZRC1aSco2XmCr7vQTP+dxulXUepDT5whUupLhEn/j0ZX6wkJuVnSgBl0NiAaEvXOEx2KzXs0CtHkEb+amPBbBeAUJZihVlAdpMQOEYw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6843.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(186003)(6506007)(83380400001)(316002)(6916009)(71200400001)(66946007)(8936002)(64756008)(76116006)(66556008)(33656002)(66446008)(122000001)(38100700002)(66476007)(2906002)(508600001)(7696005)(9686003)(86362001)(38070700005)(4326008)(8676002)(54906003)(55016003)(5660300002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/5ao1m5X0GMLde68lyBn/DyiJNOSN6jojZajyumMI58IvATKFlpNfRwbbZyf?=
 =?us-ascii?Q?xvUC5ppTiym43p2FgAbexmRY6Pmu1aWTJZDRsYl2fkcfghezabmVMe1s1n4Z?=
 =?us-ascii?Q?kDZHu6cN2dY4HgFjFGRdXgr9VLhM2VrjO2qrLmaoXrRbnFOBRs5TKkmcCMJI?=
 =?us-ascii?Q?0kf/wGoUyDqnWDRVF3PzxndEB14hhDv540+j7xWbFL+GonAFW19VeEbCZPe9?=
 =?us-ascii?Q?K/LTROSKdrC/Q0Xa5FC2nD9489wRRmEpv7H2kFYqDg2IDyxK7a4GfN/dx5FB?=
 =?us-ascii?Q?BxVLmqrxeoo2GmSzpzGbepQrcvvT9mj878YY3HJpMCdRlrNSTEvLMxL2Pta7?=
 =?us-ascii?Q?uoWeRVJfgWZJ/hKFeKlkUUVMU3PwQFr5A0p1XRUTK9agUVBUbfH54tBbplwP?=
 =?us-ascii?Q?3/koQqIqQJlKNGqtwlLIiu1UwlbinXl4W/MYr8seP+0P3BnK1BHR9m4kQ7oF?=
 =?us-ascii?Q?802jGFGHBZO9uyHPfp6L/jalEVvl90XNYOMuKl8ThV16KdCDrRm+q3ROdG8u?=
 =?us-ascii?Q?q/CRppSVuh3omy6gk7dEjSDUihVVA7I3ZclSCRZdAAbFevK8UCsdby19aDsP?=
 =?us-ascii?Q?a0k8MGvtXeO0wcNB7++hgFBSSD/74AEZFaBORLDErOSK5uKs5zopHTCwntHS?=
 =?us-ascii?Q?/YJePjVKmzRAyci7Z/ynVyoSdVKnmUCCehZHvj0pPAsFWzLjI8+55CqAmgAQ?=
 =?us-ascii?Q?qR/43NmXSfmP/qQtonaHzTJXq05Hih+8WQVkUCevgi3iNgWzndEvCt2GRhg7?=
 =?us-ascii?Q?rnVCdf3/ifl+a9qkMWNQdFowKgHjdgayfV7U8G+6nJ26KIKmRsK8dOb5hpK5?=
 =?us-ascii?Q?NFV2vzZ/2UI9CwSOb8XADLNChwfzG5pgcwINosp6PMGI+I1aEpooPcLdf/Mn?=
 =?us-ascii?Q?Kxp0liNNrh+icP9NBdN8pa0IXwqDBl7t3dxs1W6nia23xH8AJUoFMCjDLdKR?=
 =?us-ascii?Q?v3vLmFJBcnwHCTXgu+ARPK+eDnX13UvDAaXaM6rhYXjPoK+0p4J3WICx5xlf?=
 =?us-ascii?Q?xJa0mmguHGpShwRcRgGoUNXfuWawzxqMgJmPG0qcOCN/HSUIQy6qncgpBQFc?=
 =?us-ascii?Q?5mQJ6HRG6iDeAhZIVMaLZfk1t5Xe79lhNG1hm1EU5mNja6DAngSH6MIzA2yG?=
 =?us-ascii?Q?xHON6mCIozH5So3NR1qF3PULbReVCqz51Jtlk7WUIrMEsambMEZabDcbb5tS?=
 =?us-ascii?Q?mRFz3RvTBuEJYHgjlebom1WNrDTd9NsN1h3ezeQn7+KGFf+dp0J53kncDtGd?=
 =?us-ascii?Q?KqFrJNdSa0+g4tZdiM5HemzvZH8cNpm/E0oxrHt4W2uZ+kiPJa5872RBHQtq?=
 =?us-ascii?Q?+oQ14KfdBstP6RZPpN9DONvHNqMNNo0E30XleKUUE8q8yiyRI4hxg9qulOZB?=
 =?us-ascii?Q?Ngh6tWs5WgXD3Fn9iTDeGUDD9Id+drSIaOEbSdwYGqAtyH977Y1Mt4gAps2r?=
 =?us-ascii?Q?4kZKcsywi3Ps37QF9sS9CHTJR3zzy7/u3QJ+aGR8FD3UY35yFG8GwSDZuFth?=
 =?us-ascii?Q?0kWLdH68iXAq90xYC3Ksne/t5nDcghIEWTzBcf5PFLROkB/GI4I4/KnpP7gY?=
 =?us-ascii?Q?zYpsM879PvBs3Dh6IinyGixKNfLnVpPla+Sn2nFkLdsGGx73GJldmedJVfa9?=
 =?us-ascii?Q?oA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6843.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 207068e9-fce6-41a9-de90-08d9d4bcf1cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 04:43:42.3905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P6LgwnEX62eKXQUSMLYl0PSlscnIprRZdBuxvRKl9LXfC2X5CCXv8augJRpfl3gKj1oN7FV18TuYovsbRcpVhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5226
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

>=20
> I'm sorry, but I did not understand the subject line?
>=20
> On Thu, Jan 06, 2022 at 04:53:25PM +0800, Xu Yang wrote:
> > With the AMS and Collision Avoidance, tcpm often needs to change the
> CC's
> > termination. When one CC line is souring Vconn, if we still change its
> > termination, the voltage of the another CC line is likely to be fluctua=
nt
> > and unstable.
> >
> > Therefore, we should verify whether a CC line is soucing Vconn before
> > changing its termination. And only changing the termination that is
> > not a Vconn line. This can be done by reading the VCONN Present bit of
> > POWER_ STATUS register. To determinate the polarity, we can read the
> > Plug Orientation bit of TCPC_CONTROL register. Since only if Plug
> > Orientation is set, Vconn can be sourced.
> >
> > Fixes: 0908c5aca31e ("usb: typec: tcpm: AMS and Collision Avoidance")
> > cc: <stable@vger.kernel.org>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>=20
> Okay, the commit message does explain what's this about, but could you
> still change the subject to "..don't touch the CC line if it's VCONN
> source" or something like that?

Sorry for the puzzling title, I will change it in the next formal patch.

>=20
> > ---
> >  drivers/usb/typec/tcpm/tcpci.c | 27 +++++++++++++++++++++++++++
> >  drivers/usb/typec/tcpm/tcpci.h |  1 +
> >  2 files changed, 28 insertions(+)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpci.c
> b/drivers/usb/typec/tcpm/tcpci.c
> > index 35a1307349a2..0bf4cbfaa21c 100644
> > --- a/drivers/usb/typec/tcpm/tcpci.c
> > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > @@ -75,9 +75,26 @@ static int tcpci_write16(struct tcpci *tcpci, unsign=
ed
> int reg, u16 val)
> >  static int tcpci_set_cc(struct tcpc_dev *tcpc, enum typec_cc_status cc=
)
> >  {
> >       struct tcpci *tcpci =3D tcpc_to_tcpci(tcpc);
> > +     bool vconn_pres =3D false;
> > +     enum typec_cc_polarity polarity =3D TYPEC_POLARITY_CC1;
> >       unsigned int reg;
> >       int ret;
> >
> > +     ret =3D regmap_read(tcpci->regmap, TCPC_POWER_STATUS, &reg);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (reg & TCPC_POWER_STATUS_VCONN_PRES) {
>=20
> Isn't that bit optional? tcpm.c already knows the vconn status, right?
> If it does, then maybe it would be safer to change the API so that you
> pass also the information about the vconn status to the .set_cc
> callback? So in this case:
>=20
> static int tcpci_set_cc(struct tpcp_dev *tcpc, enum typec_cc_status cc, e=
num
> typec_role vconn)
>=20
> That way the support would also be for all the other drivers too, so
> not just for tcpci.c.

Yeah, it's better to change the API in the tcpm.c. But from to my observati=
on,
other drivers already have their own implementation to set CC's termination=
.=20

For fusb302:=20
It use chip->cc_polarity to choose which CC line to be changed.

For wcove:
It only changes one CC's termination at one time.

So, there is no such a problem for them with the AMS and Collision Avoidanc=
e. =20
In tcpci, this problem appears because two CC's termination are changed at =
the=20
same time even though Vconn enabled.

Therefore, I'm not sure the API in tcpm should be changed or only tcpci dri=
ver
should be changed at this case. Any suggestion for this?

>=20
> > +             vconn_pres =3D true;
> > +
> > +             ret =3D regmap_read(tcpci->regmap, TCPC_TCPC_CTRL, &reg);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             if (reg & TCPC_TCPC_CTRL_ORIENTATION)
> > +                     polarity =3D TYPEC_POLARITY_CC2;
> > +     }
> > +
> >       switch (cc) {
> >       case TYPEC_CC_RA:
> >               reg =3D (TCPC_ROLE_CTRL_CC_RA << TCPC_ROLE_CTRL_CC1_SHIFT=
) |
> > @@ -112,6 +129,16 @@ static int tcpci_set_cc(struct tcpc_dev *tcpc, enu=
m
> typec_cc_status cc)
> >               break;
> >       }
> >
> > +     if (vconn_pres) {
> > +             if (polarity =3D=3D TYPEC_POLARITY_CC2) {
> > +                     reg &=3D ~(TCPC_ROLE_CTRL_CC1_MASK <<
> TCPC_ROLE_CTRL_CC1_SHIFT);
> > +                     reg |=3D (TCPC_ROLE_CTRL_CC_OPEN <<
> TCPC_ROLE_CTRL_CC1_SHIFT);
> > +             } else {
> > +                     reg &=3D ~(TCPC_ROLE_CTRL_CC2_MASK <<
> TCPC_ROLE_CTRL_CC2_SHIFT);
> > +                     reg |=3D (TCPC_ROLE_CTRL_CC_OPEN <<
> TCPC_ROLE_CTRL_CC2_SHIFT);
> > +             }
> > +     }
> > +
> >       ret =3D regmap_write(tcpci->regmap, TCPC_ROLE_CTRL, reg);
> >       if (ret < 0)
> >               return ret;
> > diff --git a/drivers/usb/typec/tcpm/tcpci.h
> b/drivers/usb/typec/tcpm/tcpci.h
> > index 2be7a77d400e..b2edd45f13c6 100644
> > --- a/drivers/usb/typec/tcpm/tcpci.h
> > +++ b/drivers/usb/typec/tcpm/tcpci.h
> > @@ -98,6 +98,7 @@
> >  #define TCPC_POWER_STATUS_SOURCING_VBUS      BIT(4)
> >  #define TCPC_POWER_STATUS_VBUS_DET   BIT(3)
> >  #define TCPC_POWER_STATUS_VBUS_PRES  BIT(2)
> > +#define TCPC_POWER_STATUS_VCONN_PRES BIT(1)
> >  #define TCPC_POWER_STATUS_SINKING_VBUS       BIT(0)
> >
> >  #define TCPC_FAULT_STATUS            0x1f
> > --
> > 2.25.1
>=20
> --
> Heikki

Xu Yang
