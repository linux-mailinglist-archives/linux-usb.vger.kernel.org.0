Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAE6B1F02C4
	for <lists+linux-usb@lfdr.de>; Sat,  6 Jun 2020 00:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728331AbgFEWNS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jun 2020 18:13:18 -0400
Received: from mail-eopbgr690094.outbound.protection.outlook.com ([40.107.69.94]:8141
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728306AbgFEWNR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jun 2020 18:13:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZgKNK+AeE2i1J2EaOsboDNWR3bLiiZIO1tXx/IaCB/onl/Jh/1XD9UR3OU/24eztt7OrmgmfS6XCXVMppB2tWA3EgdXy8plK/64uBWYAVgiKGBK+pEfcyCaRdGixRBw7QiDwcTha/SipZV6Rb9PMvgh6HCiJeyj4Q3c6HoycsOXd77JlkZBXsAI/iTnNQuNZFkS3owmcU0/3VzZ7QK4WFTzZm0rh8LHLtrXBO5Z0g9hqB0+2l/ARQTYft3RAY+n8OgBt/e1K689tLHI4QQMCRwpaziBKFtcQ7K+9clu3gEEPxWcUxM2PBxM4c4vuO95JnwmF5YtZiUUWh0YYkvJeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxl3Gu9T/n2UMogf578+jFc/e9ekIwU3cGr4jTCb88Q=;
 b=oMX6CB3YdNP+xU6Nb7HeS2vYnD+5LecRezx9L191SC2sP6TxSRMG4+wBiajAqlrk09t9sYABFw9Y4YPmoJ+o5tG7/KQ4hKLommt2qxGYttIUI3pzu6FPSDNSMtAXGkcigdpLq5VnWYKc+uiguOiYYaV+rPQXhcppBc+XWQImMrNjovqyxaFknSVsSbl7DYkLvQGh5ZADF1gdmcli7evqFb57Q9SQ9Bl0ky+KuE+uVnClEQSp6thNl02CSCjxP5qneW+e4B7692QwV03tKePpzF9+ph1Vu9AVcWtEfKCh29VbSHLxjANVlHW0oa9OvC/ewh3wLgjM7MUW8OTuGFaItw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxl3Gu9T/n2UMogf578+jFc/e9ekIwU3cGr4jTCb88Q=;
 b=YPVl4OK5yk20iGITL6ae4nfgrTL61togJd5XwJo01pbM/4uJuzlTy43EeIFP/tX3fMRHs3AuSssnL/QxBT+1CKMh0BKCTc8QN9TWezrkpgKQK9VnDgt/N3SH4d8w5Qhuo7scY8xRnz9od7sxPplI1sMN66okA5q+kKnlQSUKdNw=
Received: from BN6PR06MB2532.namprd06.prod.outlook.com (2603:10b6:404:2a::10)
 by BN6PR06MB3236.namprd06.prod.outlook.com (2603:10b6:405:42::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 22:13:14 +0000
Received: from BN6PR06MB2532.namprd06.prod.outlook.com
 ([fe80::e802:ad07:3832:e440]) by BN6PR06MB2532.namprd06.prod.outlook.com
 ([fe80::e802:ad07:3832:e440%11]) with mapi id 15.20.3066.022; Fri, 5 Jun 2020
 22:13:14 +0000
From:   Changming Liu <liu.changm@northeastern.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "thomas@winischhofer.net" <thomas@winischhofer.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] USB: sisusbvga: Fix left shifting a possible negative
 value
Thread-Topic: [PATCH] USB: sisusbvga: Fix left shifting a possible negative
 value
Thread-Index: AdYu0IANqPvTKmyYS6uxDS+D7m5WgwAcgkiAABNU3kAAHoaTgAAYvU1gABcYxoACryq8EA==
Date:   Fri, 5 Jun 2020 22:13:13 +0000
Message-ID: <BN6PR06MB25321BBE3DE153B8D7D424A5E5860@BN6PR06MB2532.namprd06.prod.outlook.com>
References: <BL0PR06MB45483EF82A54B8751524A2E7E5B60@BL0PR06MB4548.namprd06.prod.outlook.com>
 <20200521073627.GB2579717@kroah.com>
 <BL0PR06MB45480E2A734DEC31AB3F5CBBE5B70@BL0PR06MB4548.namprd06.prod.outlook.com>
 <20200522072401.GA847030@kroah.com>
 <BL0PR06MB4548FDD13144603AFAA92BEAE5B40@BL0PR06MB4548.namprd06.prod.outlook.com>
 <20200523061343.GA3156699@kroah.com>
In-Reply-To: <20200523061343.GA3156699@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=northeastern.edu;
x-originating-ip: [155.33.134.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85ad9186-0ab6-42af-8499-08d8099da434
x-ms-traffictypediagnostic: BN6PR06MB3236:
x-microsoft-antispam-prvs: <BN6PR06MB323602358258948E6E3843EBE5860@BN6PR06MB3236.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0425A67DEF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KeASs179mmWYEkDtb49kpuWQiAWMIxXBY56lYrajkkmaj6ztAlsgjyuei6uXeOMgcB4Ju/stzHuUxQrRfCM3kGYrfIsz2kA+2l3ASgDG/S3MvhwAvXhO+GHaaNs6QkQ4T0PijobmrMKwf3vsnXnuvTuSBmI6nYEitFTwPqZ0u8fQ7pLQsQb4vWU0XWP6da/3I0Bk/HggUHQMyOXICQxbdQNsr0Kv1CCGaYX/vMhVV9MV4LHSQRjDz2P17kwcN3aEs1bsJ46GZbBlBRsVyb/F20X04qcsvJKgT/SuILSIgwsYez481evewgk1AhEEPDikXY1NGv7kKp6FYN4goseS3Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR06MB2532.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(5660300002)(33656002)(86362001)(53546011)(8676002)(54906003)(83380400001)(8936002)(786003)(4326008)(316002)(7696005)(6506007)(71200400001)(66476007)(66446008)(478600001)(76116006)(9686003)(26005)(66946007)(66556008)(55016002)(64756008)(75432002)(2906002)(52536014)(186003)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 3H0UgPYyowXbN8ND4jb1HXpL9kJZfzY6UbpS1Pct5SWlMunfbDElY9Qe+hYJWo4X/KlGzUuJZ79vEPDjB9izM/gd3XHxY5y8ja+y+tTxT9g7x+fRGIoA+oM3WeDGObLuh59z/v7OY3T0SX7178N1NByQV9oibAHhOEPq8iJtNsQAWYD/acMB5gMu5wcyV3i14IQghywmiEQUphnlWUvn72G+eMs4T67Y/U7e1vX6QpQ35esg1IIgxeB2QkS8jfFZzefNXLThd9B+rr6HFVS8hJfNpowQ83JiGVq+dC84xNIXE0mdnxI4WK6N70/Z9BW3xDUGWfKGL7+W6RimOBK13rvb8/4yHAc8vyuJ7X1TCmoaRucR7oMxXGMKFXioaM0MrP3GzsHjSNQiVYxnaSCFei0fq89wkY01lzQIOjt6FnidZ+ujdiGHQ26+m75OvFFVLfkRVp6qBzLQsy+LVNP+12D9UOg+SipZERwZsbc+Nno=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 85ad9186-0ab6-42af-8499-08d8099da434
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2020 22:13:14.0246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8+bLhPJgLQTpVHSFu54Oxk6lnElwkOgxDWUPSGrMEoEFq2Xm80mEiBrAjF0cXgmcgjmLsH9XJWlzbuGZki96UenHZGlVmgod5WkbSSldLG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR06MB3236
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Saturday, May 23, 2020 2:14 AM
> To: Changming Liu <liu.changm@northeastern.edu>
> Cc: thomas@winischhofer.net; linux-usb@vger.kernel.org
> Subject: Re: [PATCH] USB: sisusbvga: Fix left shifting a possible negativ=
e value
>=20
> On Fri, May 22, 2020 at 07:14:32PM +0000, Changming Liu wrote:
> >
> >
> > > -----Original Message-----
> > > From: Greg KH <gregkh@linuxfoundation.org>
> > > Sent: Friday, May 22, 2020 3:24 AM
> > > To: Changming Liu <liu.changm@northeastern.edu>
> > > Cc: thomas@winischhofer.net; linux-usb@vger.kernel.org
> > > Subject: Re: [PATCH] USB: sisusbvga: Fix left shifting a possible neg=
ative
> value
> > >
> > > On Thu, May 21, 2020 at 05:56:44PM +0000, Changming Liu wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Greg KH <gregkh@linuxfoundation.org>
> > > > > Sent: Thursday, May 21, 2020 3:36 AM
> > > > > To: Changming Liu <liu.changm@northeastern.edu>
> > > > > Cc: thomas@winischhofer.net; linux-usb@vger.kernel.org
> > > > > Subject: Re: [PATCH] USB: sisusbvga: Fix left shifting a possible=
 negative
> > > value
> > > > >
> > > > > On Wed, May 20, 2020 at 06:06:50PM +0000, Changming Liu wrote:
> > > > > > The char buffer buf, accepts user data which might be negative =
value
> and
> > > > > > the content is left shifted to form an unsigned integer.
> > > > > >
> > > > > > Since left shifting a negative value is undefined behavior, thu=
s change
> > > > > > the char to u8 to fix this
> > > > > >
> > > > > > Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
> > > > > > ---
> > > > > >  drivers/usb/misc/sisusbvga/sisusb.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/usb/misc/sisusbvga/sisusb.c
> > > > > b/drivers/usb/misc/sisusbvga/sisusb.c
> > > > > > index fc8a5da4a07c..0734e6dd9386 100644
> > > > > > --- a/drivers/usb/misc/sisusbvga/sisusb.c
> > > > > > +++ b/drivers/usb/misc/sisusbvga/sisusb.c
> > > > > > @@ -761,7 +761,7 @@ static int sisusb_write_mem_bulk(struct
> > > > > sisusb_usb_data *sisusb, u32 addr,
> > > > > >         u8   swap8, fromkern =3D kernbuffer ? 1 : 0;
> > > > > >         u16  swap16;
> > > > > >         u32  swap32, flag =3D (length >> 28) & 1;
> > > > > > -       char buf[4];
> > > > > > +       u8 buf[4];
> > > > >
> > > > > Do we also need to change the kernbuffer variable from char* to b=
e u8*
> > > > > as the same time to solve the same potential issue?
> > > > >
> > > >
> > > > This is a very good point, sorry I didn't notice this.
> > > > Indeed, according to the caller of sisusb_copy_memory, the wrapper =
of
> > > current function
> > > > there is no guarantee that each char in kernbuffer is positive.
> > > >
> > > > However, it seems if we change the function argument type directly =
from
> > > char* to u8*,
> > > > Other parts that call this function e.g. in sisusb_copy_memory
> > > > or uses this pointer e.g. line 770,line 883 must change accordingly=
.
> > > > Looks like many force casts which doesn't look too necessary.
> > > >
> > > > I wonder how about just force casting the content of kernbuffer whe=
n it's
> > > read in line 823 to line 829
> > > > from char to u8? This seems explicitly fix this bug.
> > >
> > > That will work, but how about just changing all instances of char to =
u8
> > > throughout this driver to make sure everything is working properly th=
at
> > > way.  char should not be used as a type when copying around "raw" dat=
a
> > > like this from user-to-device for these reasons.
> > >
> >
> > This is a clean sweep, from the perspective of security I find no reaso=
n against
> it.
> > Indeed, u8 is strictly better than char when there is no need for any v=
alue to
> be negative.
> > I'd be very honored to see this through.
> >
> > I wonder, by this driver, you mean this sisusbvga module or something e=
lse?
> > Forgive me for my limited understanding of the module since I've only r=
ead
> the code related to this bug.
> > Please let me know on what files do you want to apply this change.
>=20
> The sisusbvga module, all of the files that make it up, in
> drivers/usb/misc/sisusbvga/ are what I am referring to here.
>=20
> > Or if you feel like doing this yourself please go ahead,
> > I'm still a bit daunted by the scale of changes that need to be made fr=
ankly :p
>=20
> Nope, you can do this, it shouldn't be that hard.  Might take a few
> patches, do it as a patch series, doing one logical change per patch.
>=20
> If you have specific questions, please let us know!
>=20
Hi Greg,
Sorry for following up so late, I have been traveling for the past
 a few days.

I've received the emails from kbuild test robot about the=20
sisbus_write and sisbus_read's declaration being incompilable
 with struct file_operations because I changed the buffer
from char* to u8* in my last patch.

Sorry I didn't know this would fail the test. Is there anything I=20
could do to fix this? Should I submit another patch?

Best,
Changming
