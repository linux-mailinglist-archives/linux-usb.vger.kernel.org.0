Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5EA424AD64
	for <lists+linux-usb@lfdr.de>; Thu, 20 Aug 2020 05:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbgHTDkL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Aug 2020 23:40:11 -0400
Received: from mail-eopbgr80042.outbound.protection.outlook.com ([40.107.8.42]:12165
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726698AbgHTDkL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Aug 2020 23:40:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGOGOmxxZJMUi6P9/ThlRUOxYPIAAbpcs1Ovz1Is7jGADUuzpwX0mJMIIoKk4IWz1uGb1GdWNpSZuFHD8rsj8w8tyesUuzqkxT6mFroHHVGM/EikCwrnOtged+7xnoZGLlvclspg3CfFQUJrrbNM0Ql6dLTDtAMrgcNyU7jkq6aEBMsn6VFDTuBMNhXftwkb3GqQWYHqvqimJXXscPiL8tE5ZvKvnDqn6l/Lf8fYv3lpblblNxlVg5Ei6trgLYrLmDBKsvwmLmrrNvW8bULDBtNNKWlAC2nrmxPpOlwm1TAqBIL6UQypPSZc7Q2WFCzlYb2r5ibzwwNc1yAi85x/Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0VEOiV+3xD/YApBwkb+7h4/XebERIVij1GpYIf9vgQ=;
 b=nFmzFQ7uCKDGjRfQ6HnFlde07id3kChjWuyPSIkX2rEeFM95n3YQS1EYtNY1v16QnajdNK9DB2FHk0Gbl4leCEn7ap5yjEqPglf6JFj9pBM7AaYa9Rn2sRy9RvSwQ5tAWRkLaPsnvIGihN01vHspu/znoRvLJyincyvIMEIDoSLHEl1qIXfMVsQ4x8/BfAxXjm1KBBfVlIr9yUY9SshaMDIaDYQfJRUIN7S8Qfv+Jt/bV2lSI5YtKfEOS8y/CvNGFhoemxImwAJVrpWuGtZUPkB6Ilj/znbyGzZdriluD8HioJBgR3FwCjb20GFdRYXvWLGN/5ij8H8qfWIXbrin8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0VEOiV+3xD/YApBwkb+7h4/XebERIVij1GpYIf9vgQ=;
 b=lUT+gxqzih2poADgzipweYOrIV32whyizSiTzgNATL1gql1VzzmCbiH4nRBDbdOvFvEs8Lv7gGemVzt2hgl7ffTDydjj6/V2PkaStDV4K/uEHEHn6fYP0/LpN5bnIAQP4EEMPKJWOXi3OovvlM/89SwZF9K18gjX5iBAK0M4bP4=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4758.eurprd04.prod.outlook.com (2603:10a6:20b:f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Thu, 20 Aug
 2020 03:40:06 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3283.028; Thu, 20 Aug 2020
 03:40:06 +0000
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
Thread-Index: AQHWbr2o/fJ02AbWoEyqinkW1JML5ak9p6qAgAAIBWCAAE+qgIAAs74AgADgLgCAANYlgA==
Date:   Thu, 20 Aug 2020 03:40:06 +0000
Message-ID: <20200820033903.GA24349@b29397-desktop>
References: <20200810022510.6516-1-peter.chen@nxp.com>
 <20200810022510.6516-7-peter.chen@nxp.com> <20200818093305.GA34785@kroah.com>
 <AM7PR04MB7157182367D7EEE2BDAD53318B5C0@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <20200818144655.GA144306@rowland.harvard.edu>
 <20200819013014.GA16614@b29397-desktop>
 <20200819145236.GA181847@rowland.harvard.edu>
In-Reply-To: <20200819145236.GA181847@rowland.harvard.edu>
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
x-ms-office365-filtering-correlation-id: d7788f53-a138-4dd6-86aa-08d844babb10
x-ms-traffictypediagnostic: AM6PR04MB4758:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB47588A306A2E192BCA9847DC8B5A0@AM6PR04MB4758.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MclG3/datIr2MFeIL/BnR4ZvJxGeZp+331TnyQ3vNsmMVXtYZ9tfFJYhqmPbzx/qHa4lm7m++hd4OPBeLcAir/EGq8teDsU8AjbJQ11RjSfxdDI2q8SM1V8BAC6cTX9HcviCOfCuiqXjHK9YESRdvulNP+K8rN9A7phvk2+b0k1AMhMYQkXJ8AxPwgcUYZKhD/Q5OAupdBgny3P+ostrWqYT5iFDiCCGlkG4UmRLWHv/b9pu7cfULrFnWmRLxoUh/s3UG8gAM3C3HC3erNO9kNFB3IknyfmrvzremGd4/bZ3umIHTFg0htNdNdkPGYO8sdoisEIJy8i3McClNmLXIWuJiJ2sk5zw3FvSQyK7k/Y7hWiP87Z8yi7UwGAS1fgtS9xMxVX36ZOXpwkhN99O9A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(366004)(136003)(396003)(376002)(346002)(86362001)(6916009)(8676002)(478600001)(1076003)(64756008)(8936002)(44832011)(76116006)(71200400001)(4326008)(45080400002)(966005)(33656002)(66946007)(83380400001)(91956017)(5660300002)(66476007)(66446008)(66556008)(2906002)(33716001)(26005)(316002)(6506007)(53546011)(186003)(6512007)(54906003)(9686003)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: sFB9hpaLueyiLVRNiXxqWFjfDZQ/BTCfs/XBwc2IYSpB9t+ZaLKuHqdhxeODpyB6eYvTSqxomTV+IX84k0ruBtDMkfGcLghhUQD+0al5UrZ35RZV25hXa3i3ojuKDa+IKBsvvvYABPDDvUZiP1QDeDZyZsv1FNPWL08va14pVX5PYDtanj5z86jeLZAUL44itgXmULrHoQqlRzuS4nyPCiynONaB5U2wDmZoiS1ELB+9qWADOOIwcKs5tHEhFEXFWvU94cavP2jQYXIAakdeMtl4r8AeA/lXsZMZEaNc19mBNND2cHpLac95S1k0n7hv6aPG/tmFmhs6fQt1uX7IFrtrkrhTr1l75nYTTePRDaE1K6be1I2n4e+Qmb2ip5BiMAPUnbZcBaqUo9IZwSAkXcjbc5q2cQSD3OU8LYw2ZhDfxJyGr1upU0CJ74qGAkAMpz4vXLXeyl/kCJAI50aBROriEpKy2n5t4IOzn/EFzWCwlGoFdrKug0ywBb6J9Z7uWsUEu3FICkoWuTYs/VbXsxdfqi95NN0fFqxf7VeUtsm/doxeYpBPMUVrXzX0QbcqxZVjdoBLoNaQYg+GrMf4ROukAqAhejW3rid0mzHaR13qe+hShrlfJuPu3IfFTaqxLGbTabMwUgGrqpk76LMvbw==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <67AB65846C59F34980D57B96AD0E83C6@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7788f53-a138-4dd6-86aa-08d844babb10
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2020 03:40:06.4599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +73RCBHVi3o2VKoZu4HQmnHJY4MALGMod/8GC2ZvXzdEoozSqWm7wE/wBXjGjeHp6Ixpc7GI1cTvwyHjw0NYbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4758
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-08-19 10:52:36, stern@rowland.harvard.edu wrote:
> On Wed, Aug 19, 2020 at 01:31:14AM +0000, Peter Chen wrote:
> > On 20-08-18 10:46:55, stern@rowland.harvard.edu wrote:
> > > On Tue, Aug 18, 2020 at 10:05:51AM +0000, Peter Chen wrote:
> > > > =20
> > > > > >
> > > > > > diff --git a/drivers/usb/gadget/udc/core.c
> > > > > > b/drivers/usb/gadget/udc/core.c index 473e74088b1f..43351b0af56=
9
> > > > > > 100644
> > > > > > --- a/drivers/usb/gadget/udc/core.c
> > > > > > +++ b/drivers/usb/gadget/udc/core.c
> > > > > > @@ -1386,7 +1386,6 @@ void usb_del_gadget_udc(struct usb_gadget
> > > > > > *gadget)  {
> > > > > >  	usb_del_gadget(gadget);
> > > > > >  	usb_put_gadget(gadget);
> > > > > > -	memset(&gadget->dev, 0x00, sizeof(gadget->dev));
> > > > >=20
> > > > > Shouldn't you do this patch earlier in the series, as the
> > > > > usb_put_gadget() call could have freed the memory that is being c=
leared here?
> > > > >=20
> > > >=20
> > > > If I did it earlier, it would cause dwc3 break if people do 'git bi=
sect', dwc3 issue is
> > > > fixed at patch 5.
> > >=20
> > > If you use the patch I posted earlier:
> > >=20
> > > 	https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
marc.info%2F%3Fl%3Dlinux-usb%26m%3D159605415210351%26w%3D2&amp;data=3D02%7C=
01%7Cpeter.chen%40nxp.com%7Cac0a92404ea34c230dd208d8444f83d3%7C686ea1d3bc2b=
4c6fa92cd99c5c301635%7C0%7C0%7C637334455595715503&amp;sdata=3DwhweZozRiWD%2=
B4iRFz7zvEahWAqQYkQQ8tHlRSiU%2Fj7I%3D&amp;reserved=3D0
> > >=20
> > > instead of this one then dwc3 would continue to work correctly during=
=20
> > > the intermediate stages of the series.
> > >=20
> >=20
> > But at last, we don't want below at .release function
> >=20
> > 	memset(dev, 0, sizeof(*dev));
> >=20
> > It still needs another patch to delete it after dwc3 changes,
> > and it changes .release function name to usb_udc_zero_release,
> > this change may also not be needed.
> >=20
> > Or I only do move memory clear operation at the first patch, and
> > delete it at the last patch, it could let the reader not see
> > the memory clear operation at the usb_del_gadget during the patch
> > series.
>=20
> One way or another, the existing code is wrong.  I guess the best we can=
=20
> do for now is to let it remain wrong during the patch series, rather=20
> than changing it to be wrong in a different way.
>=20
> To put it another way, we already run the risk of clearing memory that=20
> has been freed.  The series does not make that risk any worse, and it=20
> eventually fixes the problem.
>=20
> This means your patch should remain in its position at the end of the=20
> series.
>=20

Thank.

If you think my sequence during the patch series is OK, would you
please add your reviewed-by below?

https://www.spinics.net/lists/linux-usb/msg199291.html

--=20

Thanks,
Peter Chen=
