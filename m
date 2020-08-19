Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C22924925B
	for <lists+linux-usb@lfdr.de>; Wed, 19 Aug 2020 03:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbgHSBbT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 21:31:19 -0400
Received: from mail-eopbgr60074.outbound.protection.outlook.com ([40.107.6.74]:26990
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726840AbgHSBbR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Aug 2020 21:31:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSg5lOGCtjQ6eKbX6epKNxzQFM3i5p72rK4Bm+d5L+6Pj15qLBb4q57UulYHelFR/2DNkuB/d0P5cnGygY5I1NDxnXVii8qkvX/E84nUWzdvF9Xe2L8Z2NdvAWCtRfv8GAvQJCYeMXZNZpcNhO99Ex0xBZxgbl9eiYUhDq3GO75FVrolmBaJbwnbFnxJ7fjc8qtyGA/tYJT8IiPkoWZ3ehDqBB1FkJjB9hPqAQbYUv7z0Pe7FCzsBLpElReP0wwoqHI4G+blbhOHGv0Hyi12LUxLOXuumcxZu2VidRbyLDyZfJmd4i1PklN79MX7Wb/eg153bbBkc2uCmk/nd9dgOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+py7+B/Yer19brp2U9c9y+oPQCeYVFYL2TBhtR+LyNQ=;
 b=J6sXZxDrPP26cm4askznvLAYwZkDbdtH+bSXNJ5oHx6DOFAe+qW6CuumrbUHuojQLgwtAPvVeYXO/t1nTLwJAIl2PEAUC2YMclaLa0LC+IbERhKro9b4HApKi68iJO6rPo//YhsDLajy/myi4Pe0X1JSS9v6y1JumfHiFLmp19AZV067iVZq6nSuxsAsS8ZVeFUGzc/PZvd2vmQQloZqV2OYgNDfuZTPADudmSbf+a8ws6QsyNP1t47JyLtSRkDHSHlhYwjGrLyLqpf8P0l+dSfmtuqCJIov49wYpxLrxZWl8SGmqGLUxGoZWjUkeVPnswQHRz+s4xDViK65j/h+gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+py7+B/Yer19brp2U9c9y+oPQCeYVFYL2TBhtR+LyNQ=;
 b=b+sDywe7nb01USz8JQauMzhbVZfGoo4C+sShAcWTi8EIFg6NoOjXj7z8PBvWhgoELl5a37vUwHfP6I2JAW+YlviwYAOs3RDzhHfHroMP0+EL+CBa50mLkXRlpCS4fdC02/yRkkUr3e9FjxgvoFw6q6moLIG8AuGyPJg69/oCjFQ=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR04MB3139.eurprd04.prod.outlook.com (2603:10a6:206:8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.27; Wed, 19 Aug
 2020 01:31:14 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3283.028; Wed, 19 Aug 2020
 01:31:14 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v2 6/6] Revert "usb: udc: allow adding and removing the
 same gadget device"
Thread-Topic: [PATCH v2 6/6] Revert "usb: udc: allow adding and removing the
 same gadget device"
Thread-Index: AQHWbr2o/fJ02AbWoEyqinkW1JML5ak9p6qAgAAIBWCAAE+qgIAAs74A
Date:   Wed, 19 Aug 2020 01:31:14 +0000
Message-ID: <20200819013014.GA16614@b29397-desktop>
References: <20200810022510.6516-1-peter.chen@nxp.com>
 <20200810022510.6516-7-peter.chen@nxp.com> <20200818093305.GA34785@kroah.com>
 <AM7PR04MB7157182367D7EEE2BDAD53318B5C0@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <20200818144655.GA144306@rowland.harvard.edu>
In-Reply-To: <20200818144655.GA144306@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ca6b420c-17de-4b6f-e846-08d843df9030
x-ms-traffictypediagnostic: AM5PR04MB3139:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB3139B04CCEAC4823EDE7A42E8B5D0@AM5PR04MB3139.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xEvKldkVAdn+rBr5kP4xBkl9U1lLPHHH7BXic7hMm69qNDgVeNxVNG8G8O3jEW74fuigKFYe5QKoKcfNblGwKsJwxk6zIoerPu1LZdScc8HmZ5xbV1wPtSSSE74nvae6q+P07UznXZyvkZ07ZeYI2NnhFYPgLZK+SGMmyuRpRV1BQ2Y1ZmLbYOOTBS03L9rUs17DkmUKAWSNNdcb0Lve4eDOsVqnqaTvVGx0Oa5OQVQFmt2TzgiIROi8DltaV9CDakD4mD0SLx29tRwQvM36hIdOX5vj8S9CR1X4ttrPlCKbkJjKIDmH30wlBnkJN6X7Hm1joFUeNr2FZBK52atbnwVNV+JcwaJm0VpC7kbyFEsRNJDtCMreOqx7gJ7mCiN3xw6SMUO/1F4DN6ERDb2O0g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(39860400002)(136003)(376002)(346002)(366004)(54906003)(1076003)(86362001)(316002)(33716001)(44832011)(83380400001)(45080400002)(8936002)(966005)(6506007)(53546011)(6916009)(6486002)(2906002)(8676002)(66476007)(66446008)(66556008)(91956017)(6512007)(26005)(66946007)(9686003)(71200400001)(478600001)(4326008)(64756008)(76116006)(33656002)(186003)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: sKVffJm+4wbUEr4yRxOFMyrwzg9pKCBfcW9mV2Zakj+cDyB6lg1pAaQly8Uthcz2qE1bV5gtS1J7AFraZB7luygIeEP6pbR2cdsGpY53a000xAMKyUjKZ6PT0mCyJ1WWlAwTrVViPwspEvq9Kh9gPx5qkLcD+23Getgj3fKa6SIQyQhv1kSmyKrqivO63x4hYFXgy+FNrKfnBN3u+9hNrfDtve4zxsffGl/S6BcmXIDJ1FRVHAy/X6gxscdDqeJijl8uBqo8Vm1Z/0EGnTb5DAB6x4Mg20LbctjQjA+nlcz5SzQ+3ZjpXpT9nB2jQ/97/ZGqkqiG4Et7IMI5B6ehUqVS1L8x0Id1wwdZjcX6HMVyDBy67yfP7WNeLAho9Xr8N2vYjTT4IOMB09s/FyydA20LkrsxpB33nUt1wf2flX3U7T7xqSw5ZSiYOfN9GJclVWfZHPHccO4EkPGviVUkaSvL6HEQqcxXEpD0RScfr2mKTuTbNphBsQVZ+7z9bjgvjzIAi8hKMiOQ6SNrghqSNyf+5BfzGaPEeTL0qA2ZFzp8DhEiGumVflr7ZPgetjkG73zjzBDek7rYF67ZOrJexxTrXNHbLFkvMeqPSVraoHL1xsRB0gyHozY4tDX4nvSr0U5OUNlE7eXKDbqOcmJjsA==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C8F1B13C1F22D84399AD12D00C322CDE@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6b420c-17de-4b6f-e846-08d843df9030
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2020 01:31:14.8150
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5rNa9hxDQKGnuGIMcSWr3jb6bU9tQ8u3rP2A43/Q5D66APk2FoRCPpGFScUq9cT8X+GVHIqQP73SIM3PAyZopw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3139
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-08-18 10:46:55, stern@rowland.harvard.edu wrote:
> On Tue, Aug 18, 2020 at 10:05:51AM +0000, Peter Chen wrote:
> > =20
> > > >
> > > > diff --git a/drivers/usb/gadget/udc/core.c
> > > > b/drivers/usb/gadget/udc/core.c index 473e74088b1f..43351b0af569
> > > > 100644
> > > > --- a/drivers/usb/gadget/udc/core.c
> > > > +++ b/drivers/usb/gadget/udc/core.c
> > > > @@ -1386,7 +1386,6 @@ void usb_del_gadget_udc(struct usb_gadget
> > > > *gadget)  {
> > > >  	usb_del_gadget(gadget);
> > > >  	usb_put_gadget(gadget);
> > > > -	memset(&gadget->dev, 0x00, sizeof(gadget->dev));
> > >=20
> > > Shouldn't you do this patch earlier in the series, as the
> > > usb_put_gadget() call could have freed the memory that is being clear=
ed here?
> > >=20
> >=20
> > If I did it earlier, it would cause dwc3 break if people do 'git bisect=
', dwc3 issue is
> > fixed at patch 5.
>=20
> If you use the patch I posted earlier:
>=20
> 	https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fmarc=
.info%2F%3Fl%3Dlinux-usb%26m%3D159605415210351%26w%3D2&amp;data=3D02%7C01%7=
Cpeter.chen%40nxp.com%7C84c12532be684ba94c1708d843858e86%7C686ea1d3bc2b4c6f=
a92cd99c5c301635%7C0%7C0%7C637333588196922016&amp;sdata=3DgOe5kecj38gR9qIbk=
fjVkNO%2FICp0bHis30Yi2tomrc8%3D&amp;reserved=3D0
>=20
> instead of this one then dwc3 would continue to work correctly during=20
> the intermediate stages of the series.
>=20

But at last, we don't want below at .release function

	memset(dev, 0, sizeof(*dev));

It still needs another patch to delete it after dwc3 changes,
and it changes .release function name to usb_udc_zero_release,
this change may also not be needed.

Or I only do move memory clear operation at the first patch, and
delete it at the last patch, it could let the reader not see
the memory clear operation at the usb_del_gadget during the patch
series.

--=20

Thanks,
Peter Chen=
