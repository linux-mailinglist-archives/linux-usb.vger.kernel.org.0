Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDB89375338
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 13:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbhEFLwS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 07:52:18 -0400
Received: from mail-vi1eur05on2041.outbound.protection.outlook.com ([40.107.21.41]:52025
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229836AbhEFLwR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 May 2021 07:52:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkG14d+wSfi6z0Oh72JX0mAmYb/rlgjGIJ7nqJePJaeGPZgWuJZQmjOTRmY53Wox/Xa2dILZbxw/NbPmhD5CmKyH/1nHdO8d0lP3iNutL4K8QwEp3l/TmwEU5oC6NInbFQ9oDgI37AE/OIsfb9wa7c1baajmxWVopFdWUooMvid3lo0jdgRTlAAqSkG+8C7dfiJQrWM8uXKIYXVsdR+uB540I7WJ1tCTQCGzNLDmPEmRs802TGf+EYyv+b/kn4r5OC6dSanCrW0mMnvTKxi4Jg78PvUYWn2sHEjfaAIvMlTOGesB9OmbQY1T0Y8oH4ysoGVtJ08el/oK7+B5TkXssg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TyKro1UIhi08zbFpHjPA4OZk01ylMUqvVS0tJHqjk0=;
 b=YjrEHG81+1Yg0az70Nly/mfeqxtQ8ISLU1bBebXZeCMBqvEPM68AQEdiyHMWwot4n9K5EPwwFYr0P3i1mEAEXrvzK6tasgKtyavjKS3P0v1FWMYONwBxduLsGnHfxjmp9tMiw1CEArZRmBJLDX7k4kL6Eouh9g587gkpwwGsMJK+QE2ZpOb4wgNcOpxFblF3iLNuFtWGbJ3xUPgIF02uPfNIXysfR2K5/aT9+4zlV5QJfiBNhkvCUY2vmuA09Jk5Yxfk8T+RgIBvTptKfmMSwbBU8V2u34ZMiGzaXkzpi5ANEOhAd03312XLKaKx9I/2j0EAM7cgjaELzcx+vRDUsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TyKro1UIhi08zbFpHjPA4OZk01ylMUqvVS0tJHqjk0=;
 b=cnkD5Vsa4S+MnOFzLTVJW9uif42ytuYu2kxZ8+HtMTMJC7MQH3n4kgKZdrjVBiOM24jPkQLDkeG1r4pQrNmSYSj6c+L/U6uztFinLpl72Uzcz+DT8KSzjvBEHvUX5uTrctxKrDl5h+p8vme6UidAPfIbuAe6WMtwcsWXPXCtVXM=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR0402MB2925.eurprd04.prod.outlook.com (2603:10a6:800:b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Thu, 6 May
 2021 11:51:16 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4087.044; Thu, 6 May 2021
 11:51:16 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "peter.chen@kernel.org" <peter.chen@kernel.org>,
        "jackp@codeaurora.org" <jackp@codeaurora.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH v2 3/3] usb: core: hcd: use map_urb_for_dma for single
 step set feature urb
Thread-Topic: [PATCH v2 3/3] usb: core: hcd: use map_urb_for_dma for single
 step set feature urb
Thread-Index: AQHXPYqXmmJiQ6Bd/UWNriVAkzKNRKrNJNeAgAk7FpA=
Date:   Thu, 6 May 2021 11:51:16 +0000
Message-ID: <VI1PR04MB5935DC194F67873089D4D82689589@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1619763393-20029-1-git-send-email-jun.li@nxp.com>
 <1619763393-20029-3-git-send-email-jun.li@nxp.com>
 <20210430144903.GC526617@rowland.harvard.edu>
In-Reply-To: <20210430144903.GC526617@rowland.harvard.edu>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 069bcc2e-6e8f-437a-e01a-08d910854198
x-ms-traffictypediagnostic: VI1PR0402MB2925:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB292576BD61C4D53B1C18AD2A89589@VI1PR0402MB2925.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cyOH1WaGIFrC/lCkTKD3NHl2cCOda3TaNCJTwhHMRXQgTHlI+8ITzrGdODkg3pM+RK0jEuD0YSrOzttLaj1xt/HcWjRyBki5XWRUfmcRUwdXIRTtlVBR1Z8og6/xTM3g0+YNiVby0M0ViNRoBHq7S7Yfq44vEHOnpGyMV2LimgjoIKtdcms4ptR2zsCVY9HbJS7Hok+irqljjViCpQBjZrYKsT9qPj8LuR6HPfGW8xq0GeMS6h5ZHn2rHQiMVUxIyiWm6x2c7OncwiQfuA9cIJNgqOgVdYbVc/Rd4WdRIOs5WBhqMmVpJBa8zooYfA65spCZdUs9psSYNdjfme4sDNQn90SY84GnsX9Rda9VyR8DfEXZZ3tLwY128ttDo+87zSNgKlBiWm97vUiiUJvOnoi38SHmaVyR4bQI1xvVEe3Ha/8btjBk7jKy2FXSageCF8dxeEdgFPFSayQBvuEniFf1tYjO2ehlaJpMgh991jT213R84X/2tapEzG4NGvJGot83VXf+1cfg4BBtHHWXo/W40t2w6lsjzJbuOvPeDCOooObUSF7kB0Pmb+z3rGjfKST1Zp9lO9Bkgh6ym7eA8q1aFqzuvvmtU5TVnGyuM3U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39850400004)(376002)(396003)(366004)(8936002)(7696005)(54906003)(2906002)(9686003)(38100700002)(8676002)(55016002)(5660300002)(33656002)(6506007)(53546011)(52536014)(83380400001)(44832011)(71200400001)(4326008)(122000001)(6916009)(186003)(76116006)(26005)(66476007)(66556008)(66446008)(64756008)(66946007)(316002)(478600001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?FW2zthY/uuA5uBlAPOU46cVqOwJwl3WrtTR4i8aqIzJ49IL+GAvLgWulk+IN?=
 =?us-ascii?Q?kQyLBpshqTGAHNEVYQed1abhguSeyPQ3w3cOjUzbQgQ6syhbLTtY4Y9I+/uz?=
 =?us-ascii?Q?1RBq59FR9gDphpGSOJTo8ZyGBrWCODMrR9U/4GWqJu2A18F8SnNFV9g1uVNI?=
 =?us-ascii?Q?qcMaASDGoS///N2dwZEwGuNf+19fefqWdd3bEC5sIvWL/PfkO/vqav+GMZ0F?=
 =?us-ascii?Q?xle586wb+rvR44NLD2iPSUIl/8/iTBpF/zoJziN+wU/XgHr7teFKcgQQJeNt?=
 =?us-ascii?Q?MzehhHcxQl2oTHWpF6pBO4J5+fWfbOAv4Nl6dXdOQrbwr950hZir1/Txe/vk?=
 =?us-ascii?Q?2K4V8HaHf5H9iZNKriXuCk0URor0HKsUFU3bP+TIGvUf/PLuXkOm21bm1j70?=
 =?us-ascii?Q?d2i+cWRWjTxWn0y9NEePqQYbs7ZPornxC6D3jgbbKw1Fi+j7nkgukO+HjwLP?=
 =?us-ascii?Q?k/enp1BWMJ4gAEYgaHONj+gfGo8avGehTPRNSQ/H0ellRHChPSNOkDsfe3e6?=
 =?us-ascii?Q?oM5BSC/VPyZNgvxbQTr7rNaF6aDkeaeulyzKzQ4UU6m7tkSGPVMFcaXxfB1o?=
 =?us-ascii?Q?XO+FgjVUSNUFnN6hrGI3CPi1nfrfBPdz20JuUqt32jeLVvM6of9M6X8uKkng?=
 =?us-ascii?Q?/2sjBycQF2XLrKA+vf97WptU1/Ia40vUiHRA82p3SRzOfHcoIElPlevlKJmP?=
 =?us-ascii?Q?hAVv9CyP/7P4yK5bcrGmrSjJIREbmxXAoaxS+B7+q6YUpN535XFqYWVvOr4P?=
 =?us-ascii?Q?yHHlC9YR+Fkmumt2n4/T5qc/NnCBx6rJDyA9VtpHm19yPKFTGdnqb1G0S2YL?=
 =?us-ascii?Q?Fq1HEWNXBDigYBKDiDqNtgRlgKtvPB8ybuMjnJAILM4SV3Y1DzZHARpWaINn?=
 =?us-ascii?Q?iUAja4qUsX1Yn0BBZVy9rH6irtGIA5WqluXmpO4QiLZLBdaS8OhFDhK46EAp?=
 =?us-ascii?Q?e1vyxGyNAG312otQ53p2+dNKYUVm0sVduJiv2GWTr0eHrlXUtxahWC2tdVlF?=
 =?us-ascii?Q?yM7lFxDoKR9vLVR2fOfDyB2/o4g+XOfhtlU/+l30RTVDL3cBAv2mHH8gFIBm?=
 =?us-ascii?Q?JINTp3k8nPNdIZRygisqEcyYcmjbTwZIOCCZDYht9BcPt+ZUEYauBuwlwDAu?=
 =?us-ascii?Q?mrPO4baqejitgrbEpg7aYIYY6HPLE3EEphRx6cbF9lYSQKSs/2SgfmyWA5HL?=
 =?us-ascii?Q?ZUQ4SlBXiAO32u0m6VVkYEos6ZPt9DK5wM0IGwEnfRS9jsoix4N75QMxWyKJ?=
 =?us-ascii?Q?zmouwTdojpxPsFOOaOe6IYW7Ko0WQQ1XvPnsO2r5ZOEe0qT1cPc91kaXMnIe?=
 =?us-ascii?Q?Ly5iHROwcG1BFWJPUvstzRn7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 069bcc2e-6e8f-437a-e01a-08d910854198
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2021 11:51:16.5369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9sd7SJxuMK8GjMlV1NBsU8L/JLunXJwhxmcRsREyocX4UULZ8/li4usHBWoCsfuU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2925
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Alan Stern <stern@rowland.harvard.edu>
> Sent: Friday, April 30, 2021 10:49 PM
> To: Jun Li <jun.li@nxp.com>
> Cc: gregkh@linuxfoundation.org; mathias.nyman@intel.com;
> peter.chen@kernel.org; jackp@codeaurora.org; linux-usb@vger.kernel.org;
> dl-linux-imx <linux-imx@nxp.com>
> Subject: Re: [PATCH v2 3/3] usb: core: hcd: use map_urb_for_dma for singl=
e
> step set feature urb
>=20
> On Fri, Apr 30, 2021 at 02:16:33PM +0800, Li Jun wrote:
> > Use map_urb_for_dma() to improve the dma map code for single step set
> > feature request urb in test mode.
> >
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > ---
> > change for v2:
> > - Add this new patch to use map_urb_for_dma API to
> >   replace both of dma_map_single() calls, suggested by
> >   Jack Pham.
> >
> >  drivers/usb/core/hcd.c | 12 ++----------
> >  1 file changed, 2 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c index
> > d7eb9f179ca6..0b89a3dc99a3 100644
> > --- a/drivers/usb/core/hcd.c
> > +++ b/drivers/usb/core/hcd.c
> > @@ -2159,16 +2159,8 @@ static struct urb
> *request_single_step_set_feature_urb(
> >  	usb_get_urb(urb);
> >  	atomic_inc(&urb->use_count);
> >  	atomic_inc(&urb->dev->urbnum);
> > -	urb->setup_dma =3D dma_map_single(
> > -			hcd->self.sysdev,
> > -			urb->setup_packet,
> > -			sizeof(struct usb_ctrlrequest),
> > -			DMA_TO_DEVICE);
> > -	urb->transfer_dma =3D dma_map_single(
> > -			hcd->self.sysdev,
> > -			urb->transfer_buffer,
> > -			urb->transfer_buffer_length,
> > -			DMA_FROM_DEVICE);
> > +	if (map_urb_for_dma(hcd, urb, GFP_KERNEL))
> > +		unmap_urb_for_dma(hcd, urb);
>=20
> That looks awfully weird.  Are you sure about it?

Oops, will update the "awfully weird" error handling in v3.

Thanks
Li Jun=20

>=20
> Alan Stern
>=20
> >  	urb->context =3D done;
> >  	return urb;
> >  }
> > --
> > 2.25.1
> >
