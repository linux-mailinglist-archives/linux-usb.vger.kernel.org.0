Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF7A1DEFC8
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2020 21:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730871AbgEVTOg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 May 2020 15:14:36 -0400
Received: from mail-eopbgr700101.outbound.protection.outlook.com ([40.107.70.101]:40672
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730840AbgEVTOg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 May 2020 15:14:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsKyHjvk0/eAMjZXvUaDhnOMah8+dHdLgCeI6pKe9iJOLCgb1wSBd88P4lRdJsIAr+BrCdCCEHhnANmTS3vhq7eeavh03867f7W7h7dj9MVpP8ZBCp6vVaG67FvWBxfzEdE1Cl4vS/dCsLSVYPWR/3BhlwsfURP/toc6eP63yyi8Alr1gyh0p6VEg4Yo93qwZ9cSn5LGF6Xxo3n1aiI+biY/wntnM/6XEERAKXBIR7QmkCqL9wSBwgjpVFzIhamEHdQHJchWaF7ioFw3f6+UBrbM9oAlOyDevgfUW8sOu93+nQ46TzaWWzzgensdyGtklK4gxd4IntrsQh3PAD/HQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XT06+bIG1UJRnYLSIYOBMvKSiLun1vaJbb9yAqpVLew=;
 b=L/0KiUZtfuRQL4ZJh9d2HAZkLf5Hhp1XeecueZZl4yJNY/tAVBh/suXVHJEkqWOS6h5ZzriUn+WyZ58O6u31hAj5SzchQwSHvCNyHeqv+lfdogrqZTe1z5vqr55vIjJfV/gYDrNtk2n7/vFuOGuJmjH1uAna9fyra6/B017BiREELBehV0qzJTnF+JwTluUiE7gi8iKcmxhvzNNcwgfGASmMACKtSDAOXEEkAJhHvTvAenXB/CQ/JLnyXtKKxhnQ9u6HHsKsIKrtdcRSgFlPbwtIUBLf6KJJ9xtU/u1FjxqGlDj0yfWYy15Nh0nmqcY4z+mHHiPL3khjNgqmuqNFHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XT06+bIG1UJRnYLSIYOBMvKSiLun1vaJbb9yAqpVLew=;
 b=rBN1bCxnFD1ggtWUxPK8YxLA1AMXX0zKjUWb3xZCO5XUWfqem3Dv0ad1uSFHoQh03vAlqWSPA7QJidHClGQ9XqHB6qpPvtIwQYCzdSVPeDYkDSUn0hhm2fbk3SO/bThwp44/7Zik9R58ZzYjkFv7lsQaVQNUdtL0rijlr1zEs3k=
Received: from BL0PR06MB4548.namprd06.prod.outlook.com (2603:10b6:208:56::26)
 by BL0PR06MB4642.namprd06.prod.outlook.com (2603:10b6:208:58::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Fri, 22 May
 2020 19:14:32 +0000
Received: from BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d]) by BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d%3]) with mapi id 15.20.3021.024; Fri, 22 May 2020
 19:14:32 +0000
From:   Changming Liu <liu.changm@northeastern.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "thomas@winischhofer.net" <thomas@winischhofer.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] USB: sisusbvga: Fix left shifting a possible negative
 value
Thread-Topic: [PATCH] USB: sisusbvga: Fix left shifting a possible negative
 value
Thread-Index: AdYu0IANqPvTKmyYS6uxDS+D7m5WgwAcgkiAABNU3kAAHoaTgAAYvU1g
Date:   Fri, 22 May 2020 19:14:32 +0000
Message-ID: <BL0PR06MB4548FDD13144603AFAA92BEAE5B40@BL0PR06MB4548.namprd06.prod.outlook.com>
References: <BL0PR06MB45483EF82A54B8751524A2E7E5B60@BL0PR06MB4548.namprd06.prod.outlook.com>
 <20200521073627.GB2579717@kroah.com>
 <BL0PR06MB45480E2A734DEC31AB3F5CBBE5B70@BL0PR06MB4548.namprd06.prod.outlook.com>
 <20200522072401.GA847030@kroah.com>
In-Reply-To: <20200522072401.GA847030@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=northeastern.edu;
x-originating-ip: [128.227.216.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 709ad92b-f04a-4556-1b5b-08d7fe845ba2
x-ms-traffictypediagnostic: BL0PR06MB4642:
x-microsoft-antispam-prvs: <BL0PR06MB4642B94CB2862CC1866FA277E5B40@BL0PR06MB4642.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 04111BAC64
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q2odWqMVvDod8XS9/+CddF8v/kRz+c61OFZJd0XQw5I8PW+ZglMuY8pbD31H0ZpzllYN89X0IlSzYIsUXTOQuVv37WoHjd9t/sFnq+PyVYDP3GIg1Y6DueDxBAsbmItcK2XVa+dmml3AVhy5jiDu1zen1hAFT3dfTaBqx3XNwHmmLB0SPt9NA2QWSkGIHr0OXqYyRYGczq3Wkkrm2AERSYhT0fedOX9hTgi2rDUf4a0MWiymiNDoEBai0cmkZedzPyCH0nUzNJLJq4PDRdVOWYMPzkrhDQD8LhoLPdsxpjwKDMySMXcBwRHi/MMwJ9IRCAJUp48xCYrSuDxYZ18fPA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR06MB4548.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(186003)(55016002)(86362001)(8936002)(2906002)(8676002)(5660300002)(4326008)(71200400001)(75432002)(6916009)(26005)(478600001)(9686003)(54906003)(33656002)(7696005)(76116006)(786003)(66476007)(316002)(66446008)(52536014)(66556008)(64756008)(53546011)(6506007)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: CVtYLQiCrRrdpG9+gNJggf1eyeULGt5k15L/mc2iiaftIRAt9Bhbe1ughUWTfmdZLf5v0wg5KOBwsmFlBI4iCfScDu2arye7IA+Yuhl2eAg3haIw4brvJqs4pbygDG7ZcMq1+NrXD+oFFsMjZmJm41hv9k4xCbVx42UPFW1Xj3J6KLNA4U7CMMmwdk7P1QvwTZ6Bdc3VzaUAARW15mnekygcOFkPjUKBsClHvHUSmS/Om/K9RhIjb7E1nomNro8YaamJZg+aqsur38sx/jptrbgZYXWel2QqY7t53EPVLDko/UvxXIPfVLbvSudQZc67bh7Hf+pKvvfuNaP6tHEBA6jelZfqnyQXvOfOi/5GqI3Br5XfoajakUre9Dr50iOEygZ/GKvLtM/39QxnCJo57rWMIYdUmCmO4dDdIoi0MdkQdhWsEU8ghrx322ZUxvLhujTN6BlFx4aKgWW33IwfPFFTJaobi6+ejJHw8twdA0D0Hl1/pMFqMwDr/KWGGWNF
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 709ad92b-f04a-4556-1b5b-08d7fe845ba2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2020 19:14:32.2123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7UnG/0seE6TIiPBKzKlrvyHwFbuV+lxu1dm7mlJIxcE/XndYs4cq175JI9IS04tkNJtHR/vGEFZBxMavaL7CUS0mBNCBSDSXk/ZmwEiWhsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR06MB4642
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Friday, May 22, 2020 3:24 AM
> To: Changming Liu <liu.changm@northeastern.edu>
> Cc: thomas@winischhofer.net; linux-usb@vger.kernel.org
> Subject: Re: [PATCH] USB: sisusbvga: Fix left shifting a possible negativ=
e value
>=20
> On Thu, May 21, 2020 at 05:56:44PM +0000, Changming Liu wrote:
> >
> >
> > > -----Original Message-----
> > > From: Greg KH <gregkh@linuxfoundation.org>
> > > Sent: Thursday, May 21, 2020 3:36 AM
> > > To: Changming Liu <liu.changm@northeastern.edu>
> > > Cc: thomas@winischhofer.net; linux-usb@vger.kernel.org
> > > Subject: Re: [PATCH] USB: sisusbvga: Fix left shifting a possible neg=
ative
> value
> > >
> > > On Wed, May 20, 2020 at 06:06:50PM +0000, Changming Liu wrote:
> > > > The char buffer buf, accepts user data which might be negative valu=
e and
> > > > the content is left shifted to form an unsigned integer.
> > > >
> > > > Since left shifting a negative value is undefined behavior, thus ch=
ange
> > > > the char to u8 to fix this
> > > >
> > > > Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
> > > > ---
> > > >  drivers/usb/misc/sisusbvga/sisusb.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/usb/misc/sisusbvga/sisusb.c
> > > b/drivers/usb/misc/sisusbvga/sisusb.c
> > > > index fc8a5da4a07c..0734e6dd9386 100644
> > > > --- a/drivers/usb/misc/sisusbvga/sisusb.c
> > > > +++ b/drivers/usb/misc/sisusbvga/sisusb.c
> > > > @@ -761,7 +761,7 @@ static int sisusb_write_mem_bulk(struct
> > > sisusb_usb_data *sisusb, u32 addr,
> > > >         u8   swap8, fromkern =3D kernbuffer ? 1 : 0;
> > > >         u16  swap16;
> > > >         u32  swap32, flag =3D (length >> 28) & 1;
> > > > -       char buf[4];
> > > > +       u8 buf[4];
> > >
> > > Do we also need to change the kernbuffer variable from char* to be u8=
*
> > > as the same time to solve the same potential issue?
> > >
> >
> > This is a very good point, sorry I didn't notice this.
> > Indeed, according to the caller of sisusb_copy_memory, the wrapper of
> current function
> > there is no guarantee that each char in kernbuffer is positive.
> >
> > However, it seems if we change the function argument type directly from
> char* to u8*,
> > Other parts that call this function e.g. in sisusb_copy_memory
> > or uses this pointer e.g. line 770,line 883 must change accordingly.
> > Looks like many force casts which doesn't look too necessary.
> >
> > I wonder how about just force casting the content of kernbuffer when it=
's
> read in line 823 to line 829
> > from char to u8? This seems explicitly fix this bug.
>=20
> That will work, but how about just changing all instances of char to u8
> throughout this driver to make sure everything is working properly that
> way.  char should not be used as a type when copying around "raw" data
> like this from user-to-device for these reasons.
>=20

This is a clean sweep, from the perspective of security I find no reason ag=
ainst it.
Indeed, u8 is strictly better than char when there is no need for any value=
 to be negative.
I'd be very honored to see this through.=20

I wonder, by this driver, you mean this sisusbvga module or something else?
Forgive me for my limited understanding of the module since I've only read =
the code related to this bug.
Please let me know on what files do you want to apply this change.=20
Or if you feel like doing this yourself please go ahead,=20
I'm still a bit daunted by the scale of changes that need to be made frankl=
y :p

Best,=20
Changming Liu
