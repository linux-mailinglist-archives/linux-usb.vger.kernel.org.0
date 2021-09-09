Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D41D74046B2
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 10:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbhIIIEZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 04:04:25 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:48725 "EHLO
        esa.hc3962-90.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbhIIIDg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Sep 2021 04:03:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1631174545; x=1631779345;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PmgWdf+PE/ovzfIpOotXr3niO2jAQJcMrsTDFsCVs1k=;
  b=Omitt1vK2DCZIPHtzKHQHGesgBZDbLbEJWToESftyklmyAPkOi7QC35B
   eyjEc3BY2FU6TL4ffef/yHmjF4vEVflc2WBO4g5+w+xYEp1y9Nn4vby2N
   VoTUOCsDSFIygJv1B2I5GUNGhxsdf7660CdkcmtcUfz4ZM+qm/fxGCVrq
   w=;
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2021 08:02:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJKweGsbQcptu2NINfFxXtgUeDgKNDaYCEWvup6Ohr0K9cKtGgKxE5gLpEDvdhbE71ebcE91lJInjlQzfFKLWT+fVUcClwA737/1T1fwgBoj26MCAdKALnzdSQjHrIx8QxV8xNusghDOSsUaV7KQLXFXIk+e3ysGHmFF0nRRZWsZnnpslNkM2PfitWhbZoTmnHF9U7GnARHu2obY+ZbNVsWAauAaA9pynWx0zTQ3LMOnx6h24MJIity99DhAZS5YrQIE6p3u0kfy3dWBrRP6zGjTg4b1aHty1K6e9hlDcrhWUoTZTVaxKVssjd2Ejki0ntxEakvez863rEYLkYNbwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=PmgWdf+PE/ovzfIpOotXr3niO2jAQJcMrsTDFsCVs1k=;
 b=iCYaLEtvV13N049iHC3BLRnf4zWgLENsHs1VME3pH9AN8GSmW/K/6U9U/TyAxyMBD8XeHUfVAHwbRUZAsz5tNxxF9H0tmejoSy07bQ8qt7C5bQUunkZu/HUEqnahmhxoMiR6Utu5ugLJsbiuGHJ6A9FtRSq3OnD2TwrJ2Fk8ZmphTR749bvOS3yIS/ZY044osNvZfivXl/9lp4hCPCR8KBhXrZqHqR98Mn96qASVn1tC0SttX7WkvJzuoN1gZ76TIhcIxHEewy6/QX1658Sh5Ve2KbB+9u9lHMa2qX3jeDQBORSW3hx2W5cNg5ziASlfZGZDES+8sUJXVnqyA5lQkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 DM5PR02MB3260.namprd02.prod.outlook.com (2603:10b6:4:6c::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.25; Thu, 9 Sep 2021 08:02:19 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::19bd:f5d4:bf47:a8ce]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::19bd:f5d4:bf47:a8ce%3]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 08:02:19 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: dwc3: gadget: clear gadget pointer after exit
Thread-Topic: [PATCH] usb: dwc3: gadget: clear gadget pointer after exit
Thread-Index: AQHXpT353plWr6c52Ui+Me9fB9ClQaubrb8A//+b6ACAAHxtAP//kPuw
Date:   Thu, 9 Sep 2021 08:02:19 +0000
Message-ID: <DM8PR02MB8198F1672DD3A8179B5DF097E3D59@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1631166347-25021-1-git-send-email-quic_linyyuan@quicinc.com>
 <YTmlbFw9DufQc6gU@kroah.com>
 <DM8PR02MB819856E1A159D7D3F820555FE3D59@DM8PR02MB8198.namprd02.prod.outlook.com>
 <YTm51tmCXRtKZIcx@kroah.com>
In-Reply-To: <YTm51tmCXRtKZIcx@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d47a7c78-bdb8-48e5-e915-08d9736825c4
x-ms-traffictypediagnostic: DM5PR02MB3260:
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR02MB326048C314442D57225E7DD79FD59@DM5PR02MB3260.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Uh8FNuz0jU1BIrFH3yAaPTkxsvN5aLwENILoJ1kImJtnx53qQrUuUuYnO6e/vk9k/0hLzq18Qd4zq8nQ7FFwke97U2sHgGB7yvdmSPXV0BujVzdQ0aIEY8S3iVM4Vgm38dM+jgN4b+vv/KwtFbupF8KW4zdEAVmvVJUy3N6yfiLNk3f9oKaMjZSAhpBLYPX0mhYUgjUFZPSWKosAI/tZzDduC1idOPg3iLvJV3WfKjmB3Dkey+iyeIUpVEPIPcvPNeNvwOijV5wEQygcfvHEAYSSaib7C11pdQjcPThWmk4ZUKSrOE+HzXd9w41K0BzH04wW2xmCRWu5kKKXDKOTxvQpw1aPJ+NWWV0stl0EYpz6Vw62W4Miy/TKqEgSe3aDLr1KyEYZRTPmn7b2Wda/U5yx6RcPgQZBNC+6TF1Ef6bLrlhi1N57q6t3i8I/vkWgfvZsVXAOzb1pjdYLBFOm31wyNTaWg1EFYmXyuWd5k/LiJtWkSIUcogphc/JEzRMMDZb13F/xcwTn8WgvUANYVlvRwfvhH2dlWLfTC0Jr7ALxQygsHRgTRK7irXX4XBj2jxhe59aqoXZ3IXKvFDdWy9FpLxvaJc2g+GSRw1kCCAK/sccVluOvn7gmNoowkqOfhzskoJk/wJvCt+Dt9yrXmkgC/9yj8gMAa7lQ8FFLNCm5cPFoAfacPIlAPCI0R32eOJb7kChb+e5DNQdubF9lKw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52536014)(508600001)(66556008)(76116006)(122000001)(66476007)(66946007)(38070700005)(2906002)(64756008)(33656002)(38100700002)(54906003)(110136005)(4326008)(71200400001)(8676002)(83380400001)(316002)(55016002)(6506007)(5660300002)(7696005)(66446008)(53546011)(186003)(8936002)(26005)(9686003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oOMc03n5YSCaOGrsdvNiitOsNGG1Thq5JQ3n433Vlmhtso0ULoHh9sOZ1Wt1?=
 =?us-ascii?Q?yevDS96kZS0pX3G3imlEAklJrYHb3+70y2pIwz5xFp0xuUJYHCq9wqKf9UNw?=
 =?us-ascii?Q?2nkkYgYKmFWwsGa/JEjlZuNDJncStOZKY0aQkW2PE+Hm9/duDT8jqh61XGiV?=
 =?us-ascii?Q?eXCIyOFlAV/tr7Kfpxs6f6c+nWsuF2D98fnxmnuEhrPfotnfhwGMjC0GznSl?=
 =?us-ascii?Q?c8m+IFySpuawqjS0K86NaE5jyMxZRCAk69/WRR06rj6my4LFNgtaBYFjxK5b?=
 =?us-ascii?Q?aDWk5UIiEJVEDpX/WjALjU041DgORQ+6VU0NIkSZv3ofS9zV9K9wW5Jw8gdO?=
 =?us-ascii?Q?aIVt5LRJVjBUt5KIvA7J1YwpjWcwvUfIYWcD5V7AQ3rYZRgmiADdfquYFmeX?=
 =?us-ascii?Q?rUQUpOLYl2+mphaKhKi+B3FbkcX5bBWOGDneuUqOiCYFexp1wb+30eQIuJUG?=
 =?us-ascii?Q?+nNfiehBS2t8XylMfIUJq2tfc6jQUIBSmRQtO48oau7UmGvANnePYwXaR6m8?=
 =?us-ascii?Q?Td4RkSv6BWazaKMEyH47lGn8V6b1EFHsZFvY4/zQ1xvQnc4iNCDbbndwO/OG?=
 =?us-ascii?Q?+px3zqawfJPa1z9Fk+8TiMStXDxG7Bd1G59mEUr87DnVTZcT5PnacEdJwi0Q?=
 =?us-ascii?Q?1S0ePlo1JXsClDuBe+5q52H07onrVT598P8vikVUaTOHAMHjBcVNTXRIbdvG?=
 =?us-ascii?Q?MUQpSGnDelHSHaeRgMfIaC9QNNTYblTOXLsuiiKWTziMFGDNxOYDQX3B8Pnt?=
 =?us-ascii?Q?DT8orW6r1PoIHXWHthZYE3vFa5mlsGD6jVHR/D+EwEgklliU7YqjJ3vmoPq3?=
 =?us-ascii?Q?sJGRjrQItrcgI0NYMo1AX0UaehGy2+LIqONX8fcXVYvBKKtGXbmmaB2diY2R?=
 =?us-ascii?Q?oL3CeR7tl2+h+OTndlzEGUugSEkGUBNpVAUIvQfriVHagdvZuPJsTzw9oXNq?=
 =?us-ascii?Q?i3G8Jyf/bBdFMn59TMM/ArTtGDkSX5ied0o5raHuGdJj+bogBXz+I2grM85i?=
 =?us-ascii?Q?Ty2wgCaw+rhxW4qzrZAASquSerZiV+PBz1KmwdH7E9GCldaAiSFa7YO7lQQf?=
 =?us-ascii?Q?eVr/bUYhZTcLfX338r7P84rWoe7Lfo+qBQDd2JQlRdtqiSuzXe8kvyRDFUrP?=
 =?us-ascii?Q?pQaX1Ca4TIXukr1rhp3/fVLuk0FYQSjDhu6Tcdu+/VFDGJcTIgaoI0nxpWcB?=
 =?us-ascii?Q?fA3tsOHkyU78GrLcQNJVXiRTpxg4ovjePr0fqp5iX4b3fJHNvM7uT3SUDtlf?=
 =?us-ascii?Q?jkdtDDdZ6gTTY3I943vrEzF03agrQ42ZbBlI4s9tNW2ju/9f1Ea6rTdL0ip9?=
 =?us-ascii?Q?0cQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d47a7c78-bdb8-48e5-e915-08d9736825c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 08:02:19.6294
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Aa6bGUtxXmdN59mzTrYmST0+H1kZHhfPVvD8FNG+YUMxIkCEiXobqXCEz/4uwz8a0BjgY6FbVm4SCM2cq+h1Fy2U6DFjiIqmDFUqgx9iMSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3260
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Thursday, September 9, 2021 3:38 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> Subject: Re: [PATCH] usb: dwc3: gadget: clear gadget pointer after exit
>=20
> On Thu, Sep 09, 2021 at 07:17:57AM +0000, Linyu Yuan (QUIC) wrote:
> >
> >
> > > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Sent: Thursday, September 9, 2021 2:11 PM
> > > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> > > Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> > > Subject: Re: [PATCH] usb: dwc3: gadget: clear gadget pointer after ex=
it
> > >
> > > On Thu, Sep 09, 2021 at 01:45:47PM +0800, Linyu Yuan wrote:
> > > > change device release function to clear gadget pointer.
> > >
> > > That does not properly describe what and why this change is needed.
> > >
> > > >
> > > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > > > ---
> > > >  drivers/usb/dwc3/gadget.c | 5 +++--
> > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > > > index 804b505..e2ab5f6 100644
> > > > --- a/drivers/usb/dwc3/gadget.c
> > > > +++ b/drivers/usb/dwc3/gadget.c
> > > > @@ -4188,9 +4188,10 @@ static int dwc3_gadget_get_irq(struct dwc3
> > > *dwc)
> > > >
> > > >  static void dwc_gadget_release(struct device *dev)
> > > >  {
> > > > -	struct usb_gadget *gadget =3D container_of(dev, struct usb_gadget=
,
> > > dev);
> > > > +	struct dwc3 *dwc =3D dev_get_platdata(dev);
> > >
> > > Are you sure this is the same?
> > Yes, in dwc3_gadget_init()
> > 	usb_initialize_gadget(dwc->dev, dwc->gadget, dwc_gadget_release);
> > 	dev				=3D &dwc->gadget->dev;
> > 	dev->platform_data		=3D dwc;
> >
> > here original code use follow container_of, it use same dev,
> > container_of(dev, struct usb_gadget, dev);
> > >
> > > >
> > > > -	kfree(gadget);
> > > > +	kfree(dwc->gadget);
> > > > +	dwc->gadget =3D NULL;
> > >
> > > Why set this to NULL?  Who cares about this now?  What changed to
> make
> > > it required?
> > It better to set to NULL for better understanding.
>=20
> Understanding of what?  What issue does this fix?  You need a reason to
> make this, or any, kernel change.
Sorry, let explain, for example, when do role switch, we can check it value=
 to make sure it switch complete,
If we do not set to NULL, it will be invalid.
>=20
> thanks,
>=20
> greg k-h
