Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49A8440460A
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 09:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351006AbhIIHTL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 03:19:11 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:33045 "EHLO
        esa.hc3962-90.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236180AbhIIHTK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Sep 2021 03:19:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1631171881; x=1631776681;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8UM73RILBJsR13nJa6LoXGqq/pGYlWmpbNqvnEK5qwI=;
  b=VAuW50WDYuq3tb6XyHEp6K5IoL7LyffgCHr/jHsMecKMmjPLhQObCGz2
   4wo1HvlaE5TfL9Nwtf4J5CaWTNZJgJXGJyufYdFZ0cmpN8uA4pP59lSFx
   MVCpF9o3sW6FWoF6JJ5O0lBqY1gCldCYFUEjGq8FYR0hLmfNbOr4rcF0e
   0=;
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2021 07:17:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBRmjwH7og/cTKNBBCNaJWcqqgt4Al1Q9Ph/eXCY5hX69Vgflllcd6w/+NgonrxQT1ffP9qqJZfqNI0YvpBg7hFieocjyK9tT7JLWKdjR+WzSCekItZ+u+1ZipPtCyDkpTOu4dtJYUGahSSB7lmS1dce+pDvnOs1sLpd/ssX+kfdST3kpakYztNxJElHR6RPZNzSxV0eEA0fw4osah4NAW39/9mcaGpJVEEn3QXku1SxTSgrwQphT5ovcaMhVDo7bWWdR6Ah/6ZHyfZ7WP4uMmCmVlpFMAgiP659Qcjyrl3la4o0au7uq5drxMlDl67r61MPxJiBh+loCsy5USllew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=8UM73RILBJsR13nJa6LoXGqq/pGYlWmpbNqvnEK5qwI=;
 b=OiMP+L1VinhZjGg/zQ+b5mrvam8/unt37yo6+9TwIYvg00OYmHWxclZhxIeQvWJvP7Ejz/sPkqIUPrcZrqExkUnVdbgjBKL3Ol7ghTGoSg9kEI4QtSCipDmw9BiZzW1nqekp+nScYAjC4aYFaXxtz0CNqtnB9KWspnRO8FxAAYWIbuSb3J1Sh9qdBenXvvupazci4p494NWjvuDgxKXokXe9clUh7LrD6y4xW844A/WNM2SR46Bn8CWUKLyYWPAebOhMmmQEhst29Myj7rE7Hhcu84K7wXFP7F1z7fRmizDovr58XDFlTImfG5gm2hAmOBIyJ4LzF9vGtkFxdharqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 DM8PR02MB8246.namprd02.prod.outlook.com (2603:10b6:8:1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.16; Thu, 9 Sep 2021 07:17:57 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::19bd:f5d4:bf47:a8ce]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::19bd:f5d4:bf47:a8ce%3]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 07:17:57 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: dwc3: gadget: clear gadget pointer after exit
Thread-Topic: [PATCH] usb: dwc3: gadget: clear gadget pointer after exit
Thread-Index: AQHXpT353plWr6c52Ui+Me9fB9ClQaubrb8A//+b6AA=
Date:   Thu, 9 Sep 2021 07:17:57 +0000
Message-ID: <DM8PR02MB819856E1A159D7D3F820555FE3D59@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1631166347-25021-1-git-send-email-quic_linyyuan@quicinc.com>
 <YTmlbFw9DufQc6gU@kroah.com>
In-Reply-To: <YTmlbFw9DufQc6gU@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d864c63-bf96-4152-22e6-08d97361f2f7
x-ms-traffictypediagnostic: DM8PR02MB8246:
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM8PR02MB82468D9B5BC66DF87EC1292F9FD59@DM8PR02MB8246.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qOK7wr/+Add5KJ9HA1VrKA30GRHb3h1BDjQSHpv6DUOm6+bqzsHeETB6mgX9tmssKiytAK9Gy620Nx77wL6obVrANHTvGCjhzKPaekncwZ089JIsEbsRCCAXwoRs+2uO0YWXHhv2oP6DuDRF5IYVlR/dyvneqmKk/Hq1TWVUR/qEbllw9mfOA03pwWFfFRnv4znMp1V/XFslI1Mbf9X5aBLx25cds5ipaP/JPPtPlA9bMfbmCFeUn34ZtvnbUKFsMvp6DeYPdWjByg6CwhEONVlyHaK8Gv/OtbprJWfhV27T+2nUKC6ZHk+843oDsNXvFn7q1sTXTDVBFJiLfe6WEtYvA4mhvf4xdXoCy5dRGydEwHuUqU6IGW4SYqq08NjEZ075ovWCaKJX5Iken3ddoQbcPkJTmdrnD1QHFkdD5TBEoNqXAJXmLOI3bXZfusGE55GDknqG6615mucalOBS6JhBqKLSccIm/+piLHJSYBpIecevNiRA/c8J9dZzdKdUWWPeixvyO4ZuAU1oawMxpwIsgRbTgpQFGOWJypT98ZLpHZHvOMRW7/FGwgtf7+gZEBpVBCIaR6+k2K9FEGM8wgJp6JNqSUR90IQn7c3k2bQQpX/+0Wh07XQCIYiIi36WIo+lat1yryKihIq+qsga6brbyfDnxNnzMOsZ2rm5vh38WcVrcZBe4ZoDZ1z/xX9QERchcSld0tnLd85YusRrJg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(26005)(186003)(6506007)(38070700005)(54906003)(53546011)(7696005)(83380400001)(71200400001)(316002)(110136005)(2906002)(9686003)(76116006)(478600001)(66556008)(55016002)(5660300002)(52536014)(8676002)(4326008)(33656002)(66446008)(64756008)(66476007)(66946007)(8936002)(122000001)(86362001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pMPN6D7eBIc+VXGgLKceTRl7L11gKKdUN72ffOaOMmaynEi8552VT8+0KhEI?=
 =?us-ascii?Q?eE6DlHpTV0a974ibxqNXA5eYzbymtZM3fxw5ctt/LmlHv2JQYAmW40cKrYtB?=
 =?us-ascii?Q?wd8ZRJpXgqIpFnq0lgfULz2Q1s8wBTqAmw03AfzAp+LHnNpEBi6ceA3emV1Z?=
 =?us-ascii?Q?HvFg7otWMkJFE6y4L/O6smUPWT++OEyz4Njh0C3p0sazl9y0oC5CEcxcyKGO?=
 =?us-ascii?Q?ZD0QsjN2ZWhxf80SeeC2RANqmEg7wZ4UQXLC+mW703KSIXE73a/76Of2t+yu?=
 =?us-ascii?Q?yiLVVeY7Hqtx7r25jrXN3g1K04JiRGmfKz3bM0HEqO9ioYLNpeWhVIM3QHIo?=
 =?us-ascii?Q?nYcYDZCuFdrMFrC6jkVyrTcuBX6cvN3FamEJlPSqmAbN6VO8WhSXYy99x56r?=
 =?us-ascii?Q?LxHkWlSxERCKgCECIFJsZXtTgNzGphbnoA9eQkl+bn25UxCzfKTBpC0aJnEO?=
 =?us-ascii?Q?MGBDZq3BYOEbUHWgKpv2lkkrf02FBnpWuS6C9AdoriFld69MBD3HaroNETWZ?=
 =?us-ascii?Q?ZYaHzHGVD1bW6fwS76A8LbmAIFWJC9lQurCr/ZhhSGeRVgxoTnGBUHQdcoaR?=
 =?us-ascii?Q?+BVjvqdoEWCRVDHuZWtsF4lz0zQPKNH/onk/P+9flleoh/jiWofXJgscCOZv?=
 =?us-ascii?Q?WkvQtRoK9U+vPmdfN5of3rOTpRN3c2jpG1Cky40KSlS26YTKuCT745IFd7th?=
 =?us-ascii?Q?YUCjvLRYNBN8+8/5Et9+TT8J+15ovXDGpgGWjJ/7xv71O3wdi3Tjqls+CysZ?=
 =?us-ascii?Q?5xd+KYfzF7PKNkI8EM2cCSa9ZI4hY7FJK/T6wMh62Fw/qW5CBDFLcjopGQ8X?=
 =?us-ascii?Q?UhJ+BkV08oJWCOvLBdGVxdbpfK6HFYo1FX5sWMXfslg1B0sCYc+/DYqlH4lG?=
 =?us-ascii?Q?Qxd13C29jACHX9ibfR8YM/+pE5gQlfiomD3lHvi0kBq/KYLYLRTSMNFOLCUS?=
 =?us-ascii?Q?RgL+iaigqV43M3Hrg2CJs+Yt7Zd31gmV91XIs4ZgXVqBwGBfGiHV/sAV94T+?=
 =?us-ascii?Q?nt3Cp2g3xobkUrXk4nRBnzKACsNCT5EyBB4o/3wa+S5vEf6YwPrYecwKNPJ3?=
 =?us-ascii?Q?QnBxPFrs7U86j2XDaKOhHCZS+TSMyYtrfAIRYuhfCRnBuqehYL0zAnTPvD+H?=
 =?us-ascii?Q?MrMMI4dTAYvjkp31dOxiN1b9g0giJx0mE/IslcD7tlFs1R/MiLvzTnRbHUC2?=
 =?us-ascii?Q?pFp0UfPWQv9B9kOef+Jh5jVkk8aDG2ipNC/hzVY2lKpZwFRXx8QgEF3GXQqT?=
 =?us-ascii?Q?ITwvd7TLN97Yn6+A4FuMmxCe3TdYxwg9HblFfTiLmSjQk89tj2AHOmi48PRe?=
 =?us-ascii?Q?3iY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d864c63-bf96-4152-22e6-08d97361f2f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 07:17:57.3576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: awBNXkO+H2+5ivUSpMwmx8SxLYJD2qtwPrpNIhv39uACHHqV9A8DWVuozRio4xkIiv7kGEfCJ65LHVL1mmXjTsYmkO4cvaEmwhzR9LWgmZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8246
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Thursday, September 9, 2021 2:11 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> Subject: Re: [PATCH] usb: dwc3: gadget: clear gadget pointer after exit
>=20
> On Thu, Sep 09, 2021 at 01:45:47PM +0800, Linyu Yuan wrote:
> > change device release function to clear gadget pointer.
>=20
> That does not properly describe what and why this change is needed.
>=20
> >
> > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > ---
> >  drivers/usb/dwc3/gadget.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > index 804b505..e2ab5f6 100644
> > --- a/drivers/usb/dwc3/gadget.c
> > +++ b/drivers/usb/dwc3/gadget.c
> > @@ -4188,9 +4188,10 @@ static int dwc3_gadget_get_irq(struct dwc3
> *dwc)
> >
> >  static void dwc_gadget_release(struct device *dev)
> >  {
> > -	struct usb_gadget *gadget =3D container_of(dev, struct usb_gadget,
> dev);
> > +	struct dwc3 *dwc =3D dev_get_platdata(dev);
>=20
> Are you sure this is the same?
Yes, in dwc3_gadget_init()
	usb_initialize_gadget(dwc->dev, dwc->gadget, dwc_gadget_release);
	dev				=3D &dwc->gadget->dev;
	dev->platform_data		=3D dwc;

here original code use follow container_of, it use same dev,
container_of(dev, struct usb_gadget, dev);
>=20
> >
> > -	kfree(gadget);
> > +	kfree(dwc->gadget);
> > +	dwc->gadget =3D NULL;
>=20
> Why set this to NULL?  Who cares about this now?  What changed to make
> it required?
It better to set to NULL for better understanding.
>=20
> thanks,
>=20
> greg k-h
