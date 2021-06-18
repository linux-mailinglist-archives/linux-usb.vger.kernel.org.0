Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77C343AC3C8
	for <lists+linux-usb@lfdr.de>; Fri, 18 Jun 2021 08:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232467AbhFRGZM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Jun 2021 02:25:12 -0400
Received: from mail-eopbgr80087.outbound.protection.outlook.com ([40.107.8.87]:54849
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232870AbhFRGY7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Jun 2021 02:24:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6eV2FhOuWpVc6fqKEVF2v6FP5HPQc94BeSSKLvBHDXTioUvKhy3378s61caVbyAGXV10X9n5Qw5kWo+J+qCaMDsUb+OJKVTjm4spXbcbEw2pQvFhpX/BEZQgYS3blWwnyODh0Tr1aw115PsvVGS/h+modljYHt92kCVVKiNUrQJhkXhzghfO6mN/NxUvxsu6sFkEliCuQOva5mqDnYVo0Fp4Q8ikw443dSPp00s0iTdCs9A+DsXNrfDUxvjQIV3d20Im0MmShqfvUWKGVFnqN/UF3tfjy3qB80QEVJCkyAuV9sDFd+cAssDFRUfW0WGFVCVKNMjkvt2j5GPMKX6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3l7Ww1IhUYJWbxxdUxmjeu/QEbr/kxNrSnsumikaSzM=;
 b=cJmbJ+VYvDxu2bPZUNVwocIJ2FBnZ7jFyszekHekxgGbnmYn5f1BFsJZsLExSFueMgWNLO7YdxAxXO3wCl9dAgPBtkmBQUrfoUDGz4mZP1p87csTViKE5l1tOEk4XkMd/VXvo0xOhlYeWVvy7OE0fjE/I8/VYhbCuQ7cNLvANfTgizTRLOjdEOaGB/JLjhi6/XrBUcKiMB4VhaAn/UqGDWa+fqKsfP2gDVNOg57fOVV850RMzb3WTLZj/SEA4V6DIOV1U+O8sN3wjRDkbTmbUBcHH3LnvNr39zN4TBp0etqxz2/KGUQ2FM5T8lTLc+aj7EC6AsjxPpsAWk5PS1pp4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3l7Ww1IhUYJWbxxdUxmjeu/QEbr/kxNrSnsumikaSzM=;
 b=MarUQcDHofXnRFSEajfhcU50DxLoacJqzsJJZThoNV347YkPj5RnNc4aKxPoAiY62VkRzvxT2JM/Q9ak+SwofX7dTwn7Hr8tq7VPa+940OrJBrUmq+N27rFLtZWYAHprA0hDgkW1JPyUgnzPdLSD36ub1Vovpsalr0Oev7T636g=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB3998.eurprd04.prod.outlook.com (2603:10a6:803:49::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Fri, 18 Jun
 2021 06:22:48 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::79b2:6f7:b5ef:ed81]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::79b2:6f7:b5ef:ed81%5]) with mapi id 15.20.4242.019; Fri, 18 Jun 2021
 06:22:48 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "peter.chen@kernel.org" <peter.chen@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Zhipeng Wang <zhipeng.wang_1@nxp.com>
Subject: RE: [PATCH] usb: chipidea: host: fix port index underflow and UBSAN
 complains
Thread-Topic: [PATCH] usb: chipidea: host: fix port index underflow and UBSAN
 complains
Thread-Index: AQHXYllejn8/r3APiEKeAYiLkq9KVqsWy1CAgAKDgwA=
Date:   Fri, 18 Jun 2021 06:22:48 +0000
Message-ID: <VI1PR04MB593586478C811695DE02CF7F890D9@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1623810298-32001-1-git-send-email-jun.li@nxp.com>
 <20210616155519.GB221112@rowland.harvard.edu>
In-Reply-To: <20210616155519.GB221112@rowland.harvard.edu>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03fe579b-1185-49eb-3eb4-08d932217e79
x-ms-traffictypediagnostic: VI1PR04MB3998:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB39985A37C2C85B091FEA8FF6890D9@VI1PR04MB3998.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:345;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y949yDWIMEuq7eCpTsnBy2DCK8ESJsoNqxPyU5qR9c7CP9cfyNH39nVNO7v+swJbDuAsFYJcwE5jlf8rxwHZk0Caw+zWWgVsJ8bc5f01riK4T0B7nNAGufzarVOQGzUXyjC3dFAYCSQQdP8sPcBlw4+8czZMgCorpdUiKx/45kIto47hucyW2H0VFEca5bWwvolJv7KkE5iWXcaFD7kCQ+rxlfNs2yVyjpHYeHYM4Ek3FjS1c8gb8BWJEFMy3iXFaqiNzKF0KchEIZL9pmHxA4g5vIOxI3w4figFbsf1ZKFSABfKO/gv3S9mN6qH4RIN5VdBmAtfC6L6rPV1JX0v2dxPhNBfVEa5B8wnJzaYmO0j81h7fs74mldSarBU953kvr5M1QcCGgYFwk2Fa+U3qTBB2+9vV1YOPB2jMomna0zZGAXdL1iUNSvb/W8kR/XIdh0ngKYQ1xGvVUsQ3MWteQr8D01bVUr7lQzGttAL8JptA1J4jnOzoZXBrkzQDtZ/iJfzEdj+0j8aEV7s7a3IzhpVW4v7EbbEbkujJs3cCLK9YhYDVPSvCGyAmuwA+uemz/oDzIEoLpM3XU62VjbbZSawR6bnPDh2dSXe5NjZHKc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(122000001)(2906002)(86362001)(316002)(54906003)(26005)(186003)(7696005)(6916009)(38100700002)(478600001)(76116006)(8936002)(8676002)(53546011)(6506007)(5660300002)(55016002)(66476007)(9686003)(66446008)(66556008)(64756008)(44832011)(71200400001)(33656002)(83380400001)(66946007)(4326008)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ioSypbUnoESQrs79Gj+6/kT/MeH1l63TlHfiDAKwb6d+WnOX63ZY4ed82nf/?=
 =?us-ascii?Q?h19YgZoM5rdhJ40PDgstoiiWve9D84WWFDm7OQ3IB6Nb131k4WBrNEWz+U6C?=
 =?us-ascii?Q?XvJEi3A39muI3NN2XTWUIWZrJJE5tP5hl5zwrVkIwttdlXuNMEHxVlGoVi8x?=
 =?us-ascii?Q?kk1UM51aBo14H0rxiYXKnrJGhM0+NsHJMgCTEzlbqzWvCEpv7baS1QPBotzC?=
 =?us-ascii?Q?SFlLjJRbCIgQ8A1Axk8z4clhTCS60F+M5svUfuYaKlXKjUbA7LjC4j56n3qS?=
 =?us-ascii?Q?70bFCpGI4zhrFdDD0iEjogLJnYqeD6WJoZomF8bFpHJr+rM8M7DwnCnTUq9a?=
 =?us-ascii?Q?6XVttEfSBZHFESmwMwOr9NG9XqaCEuLMJHmXpqJzvVWNH0KK/aUBvuLS5oSW?=
 =?us-ascii?Q?/4zo1X3+afg9VGhGMOOMuilvbwjGT2fRaZZBB0UAPvgZwN1eKAzy6H3aupVP?=
 =?us-ascii?Q?plcFWJBkXAxWjEH1bz4nnEYw1xuZLuEZuXy6S2Z8enUvv4tn+CEX4+NW9sBR?=
 =?us-ascii?Q?SmFftRKPe8CRgvrnYSX4NoYytGG4PXF02Nf3OVp0OiQa/35YoVLfVmWq2OZY?=
 =?us-ascii?Q?fHKQ2p8VyjGJKkYkQXkwUVWW4u2OsL5TEopUxAyZ3SV/iZOBtV6KJtVx6V73?=
 =?us-ascii?Q?0QkB1y3IEqRLW49bOsrGBidDo5HJJainq12kyN1t0t0xs/89XMdu69JWGDpR?=
 =?us-ascii?Q?/+RpNOYnutbzc2QxYJ1o6lEpPjuAkVsw4tCzafvgB0/u0lf7VuJ/z7giceej?=
 =?us-ascii?Q?vdMpcBkGLUXIAx9Utm1qa+yZ7b+TVS017XUWrGXlL0Vrna3w6g851emGByXF?=
 =?us-ascii?Q?HEv5SQMYdBUweDkxl/OFVM8Oq5homJrAtDU0E0LbcBDYwtgTq2vAcex2VDUg?=
 =?us-ascii?Q?K1gcWFCAhZJkC8D+NEY2OWsJ4PRgYl2x/okbRmdjvWy2Gb/t0P2eLZQJJUoT?=
 =?us-ascii?Q?Z1jPEMni8407NZ0Pib1KttV3rf2Wy1qLnPvAR6Dh7tm+bflnDTXCQjnX6GoL?=
 =?us-ascii?Q?E4kS+04vnHEZOXJKeqgJ0CQvQk3WEEhUKPUF90S3uy6HONNzy0Pybo1tYN06?=
 =?us-ascii?Q?4CouPF3Mj8FLnh4O80j1nVSCL3f0BJR90ZOWRJkH+h8LOTXZnfAbIkZsdlFG?=
 =?us-ascii?Q?IGtwDIC9RBY2IOUxpTUQ5ziuE/+4i7lEm4O2Lml9NePrwLPt2YGCmqOqQnDa?=
 =?us-ascii?Q?pECNTKph1CFEeIe8simjR59FCiA7DQ3LLow1PDoyJ62pV8MpT3piOPyJ9XQ0?=
 =?us-ascii?Q?tTZQHL57wxx/BF6HfszOzzGfylq+3MPFCJGPWGqa3HofsXWqUNumR6Icpm1e?=
 =?us-ascii?Q?pm5PQPLs879xD4TY2ezz0P2u?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03fe579b-1185-49eb-3eb4-08d932217e79
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 06:22:48.4801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0rJ3Wax7QdiMbk7aG052SiNWZR+Ie+/dXtxw80bjkC0oMviOWpA6Cy5Dds2OCTS6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3998
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Alan Stern <stern@rowland.harvard.edu>
> Sent: Wednesday, June 16, 2021 11:55 PM
> To: Jun Li <jun.li@nxp.com>
> Cc: peter.chen@kernel.org; gregkh@linuxfoundation.org;
> linux-usb@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Zhipeng Wang
> <zhipeng.wang_1@nxp.com>
> Subject: Re: [PATCH] usb: chipidea: host: fix port index underflow and UB=
SAN
> complains
>=20
> On Wed, Jun 16, 2021 at 10:24:58AM +0800, Li Jun wrote:
> > If wIndex is 0 (and it often is), these calculations underflow and
> > UBSAN complains, here resolve this by not decrementing the index when
> > it is equal to 0, this copies the solution from commit 85e3990bea49
> > ("USB: EHCI: avoid undefined pointer arithmetic and placate UBSAN")
> >
> > Reported-by: zhipeng.wang <zhipeng.wang_1@nxp.com>
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > ---
> >  drivers/usb/chipidea/host.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> > index e86d13c04bdb..25327b1b49b7 100644
> > --- a/drivers/usb/chipidea/host.c
> > +++ b/drivers/usb/chipidea/host.c
> > @@ -241,14 +241,16 @@ static int ci_ehci_hub_control(  {
> >  	struct ehci_hcd	*ehci =3D hcd_to_ehci(hcd);
> >  	u32 __iomem	*status_reg;
> > -	u32		temp;
> > +	u32		temp, port_index;
> >  	unsigned long	flags;
> >  	int		retval =3D 0;
> >  	bool		done =3D false;
> >  	struct device *dev =3D hcd->self.controller;
> >  	struct ci_hdrc *ci =3D dev_get_drvdata(dev);
> >
> > -	status_reg =3D &ehci->regs->port_status[(wIndex & 0xff) - 1];
> > +	port_index =3D wIndex & 0xff;
> > +	port_index -=3D (port_index > 0);
> > +	status_reg =3D &ehci->regs->port_status[port_index];
> >
> >  	spin_lock_irqsave(&ehci->lock, flags);
> >
> > @@ -288,7 +290,7 @@ static int ci_ehci_hub_control(
> >  			ehci_writel(ehci, temp, status_reg);
> >  		}
> >
> > -		set_bit((wIndex & 0xff) - 1, &ehci->suspended_ports);
> > +		set_bit(port_index, &ehci->suspended_ports);
> >  		goto done;
> >  	}
>=20
> Does this code test anywhere to ensure that wIndex > 0 and wIndex <=3D nu=
mber
> of ports?

Missed that, thanks for pointing it out, will add it in v2.

Li Jun

>=20
> Alan Stern
