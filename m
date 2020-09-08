Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3DC2260E4D
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 11:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgIHJHN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 05:07:13 -0400
Received: from mail-eopbgr10069.outbound.protection.outlook.com ([40.107.1.69]:28129
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728490AbgIHJHM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 05:07:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwM2JKChlwPCj7j7NW9dp8+SJvKwYF1isRSj0BTn5FVQXp40aTlYtL/93gomojtUHiE9YLpz3rk69qcFJ7gRuTsmz5rbQcAhxuyA+90mErMxtQp3/e5vDsjREDi1jSDzmKOC210jwf+CS88HXTst5+w/628HFc+ZxNEoL52yK760HBLv5V03BQoA50vg8fZI/7pz6EGvWrFvsnFWVRNRSfR16RfPkbT+fIAUMFTCMKbwkYr0m4v96F4oZ1LPWhv+9nwzkb8zhALXxWtzeC65gb6+0U8JGWc3+F4Rt5UKZjIEWWYbgxPWEoCw1gBy/UOPo3Ijs4Ml86EmqMexQTmMZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhEUnoqfyq26mrE4JzSA+LPfW3B+Ir+um6VFHbCa310=;
 b=Jn2bgZ/+V2jWRLSVjJ4+TOzSnDbU4977j/CZBThxnMzS+Ead839UxLy+A8fsRJZMK/G9VOkjE7hYOx3ZbQ9o0efzTvSMkpK5CbI21xd7GFeGmwgXihrPC9RFrP81kedqMEdcACH2YfV5bzCSxU1rAyqP/c67aon8vSKKLqx6teN6YIe6chd/V70RK5L2bzpwnCMVH+NUBN3XCqG3qizjhdcAmO0WmtO5hoiRKzvcOILtAX7q7rEGLcJgObpD0oM/E+4S4Za9JD0wMJtDH4rKNUTh+do0K4VpKTF6rbnvn8OcQd2QJRqUkxJEmZKXDwLXBE26xVSy2LKTXgwLUbjwgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhEUnoqfyq26mrE4JzSA+LPfW3B+Ir+um6VFHbCa310=;
 b=PzN/7WEqRY8N6+wCOxqf1PCYQUuXeKH3heL7yZgowb6PeA6lC/TZ9Sh6lRF6dnSaFRjvXkfnQay3zntF1mPH+jaY9FN7/veAMrxOeYYd37koYAZlJ6zoLNtFS8cXxcNxiS4aaUhKWAPFGCMuIQLyzE1u2gtqJmgTt1vrBbodvBY=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB6040.eurprd04.prod.outlook.com (2603:10a6:20b:bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.17; Tue, 8 Sep
 2020 09:07:01 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 09:07:01 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH 6/8] usb: cdns3: gadget: need to handle sg case for WA2
 case
Thread-Topic: [PATCH 6/8] usb: cdns3: gadget: need to handle sg case for WA2
 case
Thread-Index: AQHWgDxFgAlyZDFEpkSiWZtFpYgRv6leUnWAgAArxIA=
Date:   Tue, 8 Sep 2020 09:07:01 +0000
Message-ID: <20200908090633.GA18578@b29397-desktop>
References: <20200901084454.28649-1-peter.chen@nxp.com>
 <20200901084454.28649-7-peter.chen@nxp.com> <877dt4n5lo.fsf@kernel.org>
In-Reply-To: <877dt4n5lo.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 62dcca49-f3ed-43d5-b9b6-08d853d68c28
x-ms-traffictypediagnostic: AM6PR04MB6040:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB60406914EAF9852A29CB3D278B290@AM6PR04MB6040.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:265;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q2az0u9FwGbKGHzTStL0h7yP/euJYS5iM5TUrvdOUDrjUQ5cLItgxG2xkjARjdJ+0iJr1Cw5/SrKwKX/l9PC6+1VsVfJhXA7eXvuc8a+SWv48PXXWLEPf1yLJrigJ0A1nYtirjL7E8z6OpfkeyzNhvKVqBzmiHagKqXIk1Cv7TX/3RcH6cUF+BDyv/QDQLexvZ8YDWfs1ENUFVD0FsG3OnhPzDHXyv1x/DBVcUAxm95Dqp0+3xzA29c7bRsNh4DlYiPQ/ahWR35vXTaRv9i7GLC7f5y3m9MfmswPT2tPlPbGufeBy5dqmwhPWWUEzLCZAE2WHh/EVf/L/XmIKBfyHw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(86362001)(6916009)(6486002)(8676002)(186003)(8936002)(478600001)(53546011)(6506007)(33716001)(4326008)(71200400001)(44832011)(54906003)(5660300002)(83380400001)(33656002)(66946007)(316002)(76116006)(9686003)(1076003)(66556008)(6512007)(64756008)(66476007)(91956017)(2906002)(66446008)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: WEpfcL4iKlU4cJga8UXY5gqptA1w62MfrLMBuzda/6pR4nvDZc0Am0/kDfoRbACAs+Bz4nHan3ReDkZXFUtYXcLTzUpBap7LatTl3jTbngpv75HUBNBHN6I8L1aQvgkdj+TmWePioAsAdnaCTTZOZIlgyPqcfCsyslUIXwtpGNGZHtIUSbchW9RPkWdHBRX/EzHClj5eUzikXnTyuv6WOh3bKttxn3NJhAAqmC68l9cmLrf+BRgT7gjF5gtd7b5msxHFtR5y0W3HeS+X2uqL4nk1TLdI9HsM8hPJjnSK5ZzO0JgtJKjTC9xuBsCJlljHnefyczZlq0oVQy5KFTkboMmXduiFMs2ELNcsJFDJg4R8+kpV+PZzETSEwvnpXffL9cCz4UxJx7uHmDTsH2TWiB69lrbcm/rTaPao5XypFwce20Ty89y1713QZQQaASBKlYPgtVfFjtWUdJ11E14FIYrhl2usmXs03SWknwhPuKiHN0oXNZv1eRRhHef0ZsE+uyCLFVlxu2Dj5stW1d3YT2vPT1w4N4MyxFJqQ5XR0dm9H/VHv9u2XZ+Fox8+zGp+fZXk3x+ApWcpC2LSWmB1FaXCO2TWdADALBPY6qiEmkoI1jmCVcNgpycB1xIy8h4FY7+9N4N60p96E2mxJwOZAg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <197E9A9534945B42B30F740ABAC94A38@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62dcca49-f3ed-43d5-b9b6-08d853d68c28
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 09:07:01.1764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pCWd5wl5lVpGAdhfJ0OZc2aFKtR+RibEV3feO6g4fKPQ43aUxRfpxgOQc62A48itHhc4DvaasfFtm4fArYyG7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6040
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-09-08 09:29:55, Felipe Balbi wrote:
>=20
> Hi,
>=20
> Peter Chen <peter.chen@nxp.com> writes:
> > Add sg support for WA2 case.
>=20
> what's WA2? Care to spell it out?

It is the workaround 2, there is a description for it at the beginning
of this file. If you search the file, you may find there are some
functions has "wa2" prefix. I will improve the commit log for it.

>=20
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> >  drivers/usb/cdns3/gadget.c | 44 +++++++++++++++++++++++++++-----------
> >  1 file changed, 31 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
> > index 6cb44c354f40..1fd36bc5c6db 100644
> > --- a/drivers/usb/cdns3/gadget.c
> > +++ b/drivers/usb/cdns3/gadget.c
> > @@ -462,6 +462,36 @@ static int cdns3_start_all_request(struct cdns3_de=
vice *priv_dev,
> >  		(reg) |=3D EP_STS_EN_DESCMISEN; \
> >  	} } while (0)
> > =20
> > +static void __cdns3_descmiss_copy_data(struct usb_request *request,
> > +	struct usb_request *descmiss_req)
> > +{
> > +	int length =3D request->actual + descmiss_req->actual;
> > +	struct scatterlist *s =3D request->sg;
> > +
> > +	if (!s) {
> > +		if (length <=3D request->length) {
> > +			memcpy(&((u8 *)request->buf)[request->actual],
>=20
> 			memcpy(request->buf + request->actual, ... ?
>=20
> > +			       descmiss_req->buf,
> > +			       descmiss_req->actual);
> > +			request->actual =3D length;
> > +		} else {
> > +			/* It should never occures */
>                                            ^^^^^^^
>                                            occur

Will fix.

>=20
> ps: famous last words :-)
>=20
> > +			request->status =3D -ENOMEM;
>=20
> this is not documented as a valid status for usb request
> completion. Who's treating this -ENOMEM case? Which gadgets have you
> tested with this change?
>=20

I just add sg use case for this WA2, do not touch the current design.
The legacy chip has issue that it gets OUT data at FIFO and send
ACK to host even the endpoints are not enabled, it assumes the length
of this data is not longer than the data length the gadget request
later. We use acm + ncm to reproduce it, the pre-load data at FIFO is
several bytes, no more than 1024 bytes.

I have not found the valid status described at gadget.h, it only
describes the usage for "-ESHUTDOWN".

--=20

Thanks,
Peter Chen=
