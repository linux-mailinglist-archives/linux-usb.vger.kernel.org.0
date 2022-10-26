Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9D5060D96E
	for <lists+linux-usb@lfdr.de>; Wed, 26 Oct 2022 04:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbiJZCu2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Oct 2022 22:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232659AbiJZCuY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Oct 2022 22:50:24 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70083.outbound.protection.outlook.com [40.107.7.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC994B486
        for <linux-usb@vger.kernel.org>; Tue, 25 Oct 2022 19:50:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMwEJ1yNdeDNxiRNWZdkekjSKkZM1QeSPBoJ1dgtxLk+s4M4vrHBtyPh0e0t2geLkZA2ze0nK1JzXrKqJqiOKZCeZshSmTmz2wGT4DOSJZlptUSyPjkB+4gRmsonPiFPfzb0zFHEJajaDyLDsZ10/PhrG5OWDcGZpfaTVQrNzb88+1PUpZUtC6QG6WAhhhSgjzF0O6AYKnGHhacDRluXlwqHAk5C7gJqlsTP/40gImGsSui1FImPZCQdF33f+a8UEaWraq8L0g0xYoDOQElJYFShL2iHdZegkYlFW9UO8t87/VF7kNc8JonUaYjRNUHBt+iB0xSeHkC+vTcbNBsQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvLdhh6EO07BcDOfCpXY8Xp9uFE1KKQOeKtK/IY8oAw=;
 b=IxZEK5HXijhEyZGzUFV5Sib6iL2Vh4Cixh+vIEvJKhvhLWKqh26aDfdqxmvwa/BYaMKuOMbFPFn9pjxM/aB7W/pFJkV3/X06XCho2bVnyXboJVZCorpiJD2aSMEBLh46iz7/rzykFzkcuxvye7tduTexRIsPfU5KfxtPE71/rBvwaqIWD4sz+XA4rSkniuFWpsAIspb9jhCs/6mdeJbBC7gFutO069COWAhDrUW52ISyLhJHxs7Y7NoWjIaQoZ73U98FXXNC28h6LG6KltBT/qjF2yKEeQSy8ynRAvA8alyuWPfUJ8Us2J8gbq37qbOcBE/zU3QISyUw+6LpoFXVuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvLdhh6EO07BcDOfCpXY8Xp9uFE1KKQOeKtK/IY8oAw=;
 b=aA8IPNk1hxIVTLe7ugQeisvSriP0ppax8/a1tTtLAsFmzJ1WspRAVkwYs4PxD76E5nsTZdacWkwuD++bxTWFhpKnMVqlaxDpAWuOXqphyV5YfHOb4UYCGt33vuTUJtJ+byG2+XcjwIdGEPNFbphOezYALDBKUVg0Dh6PAqJDgHM=
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
 by VI1PR04MB6958.eurprd04.prod.outlook.com (2603:10a6:803:137::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 02:50:18 +0000
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8206:7817:a8c0:f3c5]) by PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8206:7817:a8c0:f3c5%7]) with mapi id 15.20.5746.023; Wed, 26 Oct 2022
 02:50:18 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Conor Dooley <conor@kernel.org>
CC:     "peter.chen@kernel.org" <peter.chen@kernel.org>,
        Jun Li <jun.li@nxp.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [EXT] Re: [PATCH v2 1/8] usb: chipidea: core: add controller
 resume support when controller is powered off
Thread-Topic: [EXT] Re: [PATCH v2 1/8] usb: chipidea: core: add controller
 resume support when controller is powered off
Thread-Index: AQHY3tMuERyDDxLuzkeBbYtDzUR7dK4fMvYAgADZZcA=
Date:   Wed, 26 Oct 2022 02:50:18 +0000
Message-ID: <PA4PR04MB95914512FD3735E3F30232B18C309@PA4PR04MB9591.eurprd04.prod.outlook.com>
References: <20221013151442.3262951-1-xu.yang_2@nxp.com>
 <20221013151442.3262951-2-xu.yang_2@nxp.com> <Y1fo6v9Wm0HBdE67@spud>
In-Reply-To: <Y1fo6v9Wm0HBdE67@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9591:EE_|VI1PR04MB6958:EE_
x-ms-office365-filtering-correlation-id: f979b771-d7ac-4cb8-be63-08dab6fcd174
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EBz9z/MCRmRbeyoWT95z0Af8JuVU1Q+R9Y5p3U7R5nq06mMtBIhzIeB/NWt5wyZGVfFDh07NdqJz2IA73ye2IxIRdBB9izZC9OregXmL+FOATJwzCNLAJV0MctHNNyCM6LFPs9DCs8sAg73jeYeQhg7SiypezXRrNtG5m0cbBsjm6PSl31VfYXgFQCxkLgJLRBRWC/k7Lu6RucIvKTA983OwrTOBdk9gy4W7pW0LLb+xe2rOE4ejGrssZqVi/wRWMo+gRT1n6uabd2wbWc+fRotjd0CtF/NiuQlWnv94GzLz1yNPkLMfrkUuaBUQYc2glnliKplxR6BwZxw79hQukhORxy/Qb6Nh1F5x2K7PdRGUmhWCqSZ07fzlvVytWJxhg14LaVbNd8AHmsmTpvpEXBkbZKRi0j15Mr8fTkm2z+gyz7bVwXQvd6xVmZ0M6mHBCl7HwXSneJBsZzpa5Wtcep+rotherELggWkLMkRw9kEnnElwR6jpKPZMyPyMk/IbmC8vqiNXO7S78PGcdgCt+iustcBoYcWY2bn6M3IZt30ulCAmyKskBhjPyqOinj3CVeWHvaHNDZqoP4dZ8G6oXTOIr/RgePGoJnX1VJf6eieyVEyWz5BcJof46XnHHN1Wwhgit/J74OiTozOWKf4Bmu+rOFvGZThZ+kIZaQ0hU9Z4vrAg0JrsOaCq6JOfZsbAWvwFqqxAK+6gx9hGaFdFyYiQnd9GcKrFmpdvqGY62K/9sV/y8Q0h/6OXlCN7ZjHKc+vgLmGmjuaduKXWhyvUYg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9591.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199015)(33656002)(86362001)(38070700005)(38100700002)(122000001)(55016003)(2906002)(6506007)(53546011)(9686003)(7696005)(83380400001)(26005)(478600001)(186003)(41300700001)(66556008)(71200400001)(316002)(66446008)(64756008)(8676002)(4326008)(54906003)(6916009)(66476007)(76116006)(66946007)(8936002)(5660300002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eFnhCFk2ZtfHKuGNxCh1SsnqdQy6AN8LC17itJh8HGCA/4bsmi0x9aLOXpN1?=
 =?us-ascii?Q?VdgSsQR5KK/l0x7V/FEHs/CQA/XA8203+wRz3qYBhe4fCFI1sL+S0cbZH0uq?=
 =?us-ascii?Q?YXL9zfVy06PPKKpKU4fm1aiD+N3A4XBGWzqHmG1dG1Hr/8waUmcd74l0r336?=
 =?us-ascii?Q?jScZLlNq+1Ka/QIkIFKDIhS71PexI1DWIvTXfmNY6IczSDxLK7l3NgaWUgtv?=
 =?us-ascii?Q?6ajVicMWZyhjl9C0kfFPPmq55sWdAEgj4NRrciMUqzahR55QS3ojIT1dfC8s?=
 =?us-ascii?Q?sQenYSxmd0KLkSjKT4XnuW30jjzjc7bzwJ8U6yeEaJQ/0Sht01IHPUXXG82A?=
 =?us-ascii?Q?RUxohnUMz2BzgpgBf6BCy/AT3/LCzh0Yp9QWHaeOgHfVvnjMW4ywZQdpz2kc?=
 =?us-ascii?Q?ttsxFxQW0naFwj2lBsltZUjTtoCJJtSnCY09w5V9UVv/dtKssURH+NPXK+gv?=
 =?us-ascii?Q?llyK9/P2fo0Zkr5nLBRoh4uDvO3cojYGf4qAso/Lodkd0uWSa5VGryWUiYr/?=
 =?us-ascii?Q?D2cEM9Aib9hzWLU9kORwHDQqzgkXRZK274d0ykgVyJ0TYmG9YXqBnlo1iFpL?=
 =?us-ascii?Q?7860cnh8b8DM0xGU1bbQwV2ael/uvIvcbvTRjPgn/grWzfqG/gdRM1G6Z+dj?=
 =?us-ascii?Q?UKEoeGvuNFvfl08G5c4y5oOG+FAYAG7xlP4lvae8cMeXzv8CbpYDC7XDNowz?=
 =?us-ascii?Q?v5IRd4+7n1vhV9AA6rSZckRnvDCZrMxMOCNZxFVVtS2rLi0i/Eg2azXUwKhX?=
 =?us-ascii?Q?RH0VTr4lhIurZaksXrmqmVN8bugmltEJVW2C2B/r/E5PPnETDm0nqjrWYe1n?=
 =?us-ascii?Q?pBMlrtST5kQ5DMyYPxUocCCBq8754SYjk4ZHmBTtOA7F34qgUIoRivZClgKc?=
 =?us-ascii?Q?0NBsIzVB+nD2HOfkXSAI9mex8gDqOGD2eVzBY07hxX42HEnw14WUZjRiDkZd?=
 =?us-ascii?Q?1w32AHRp9yFV2Ndl17N1zE2kK1xkW2TNDOaQc4YovrUr9Z+o4z6mLerO0sp1?=
 =?us-ascii?Q?fpECPeSWJfW0va58wrG2WtSbmWSpoGsh4M1cJgHNg5wsEnnnYaivoFFu6ydn?=
 =?us-ascii?Q?LKqmqfcLEEtom0bQ/1SZRPc2DR7Ujfe1mv4D8DZO8TQns81/D4IRnPCVEzl4?=
 =?us-ascii?Q?s4dCc9Ortc7WxOF650tthvOzYWMmPMnMkxjOtFtb6G1jy5T4NHHCdaFwsFWl?=
 =?us-ascii?Q?ETO2D0tlMCUY+yNPDEm9qdgvRHcxm7OmADKVLuItp1EPytuo4C6G+rTTmb9T?=
 =?us-ascii?Q?LAoYSyxAJPa+tIMPCFkUwPsOhgRx6y3DgKl+s3j469wRm7u7ActAad928sTY?=
 =?us-ascii?Q?2MIGtQcOjG9bq1Hbe0Eecc8f/dpjJDFNAsQR4H/oNL/AYwEmTTgl7nWuuotE?=
 =?us-ascii?Q?z8AAJLvWnG5CnuyVzyo14hr1hcU4FO8BY1mdeRSjdxGF9mFMu773pkBmaEhb?=
 =?us-ascii?Q?Mkr7gOwpyC2ZRC7IT0sKnBQxHRJGcMbGGfHX8tL/4qvpCcgTJiwZpyRuqQhU?=
 =?us-ascii?Q?SufLTXKSP6OZ7ZMW4APxku3jZU76zMWhTqDGKWu2HwKs3tQxeuyYBNJ9PkPc?=
 =?us-ascii?Q?zWGsxCUqmjVwwA9PvTk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9591.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f979b771-d7ac-4cb8-be63-08dab6fcd174
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2022 02:50:18.8136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m8/OUSvAQJcYOfJg0abqgVfQX8PItYGI+a4i9IcoWRH0AXMtI+MKpBTC6igmCWl0oNIlJDtiMapjCMGb3bP6bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6958
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Conor,

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Tuesday, October 25, 2022 9:47 PM
> To: Xu Yang <xu.yang_2@nxp.com>
> Cc: peter.chen@kernel.org; Jun Li <jun.li@nxp.com>; gregkh@linuxfoundatio=
n.org; linux-usb@vger.kernel.org; dl-linux-
> imx <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v2 1/8] usb: chipidea: core: add controller res=
ume support when controller is powered off
>=20
> Caution: EXT Email
>=20
> On Thu, Oct 13, 2022 at 11:14:35PM +0800, Xu Yang wrote:
> > For some SoCs, the controler's power will be off during the system
> > suspend, and it needs some recovery operation to let the system back
> > to workable. We add this support in this patch.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > Changes since v1:
> > - add static modifer for ci_handle_power_lost().
> > ---
> >  drivers/usb/chipidea/core.c | 80 ++++++++++++++++++++++++++++---------
> >  drivers/usb/chipidea/otg.c  |  2 +-
> >  drivers/usb/chipidea/otg.h  |  1 +
> >  3 files changed, 63 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> > index ae90fee75a32..80267b973c26 100644
> > --- a/drivers/usb/chipidea/core.c
> > +++ b/drivers/usb/chipidea/core.c
> > @@ -637,6 +637,49 @@ static int ci_usb_role_switch_set(struct usb_role_=
switch *sw,
> >       return 0;
> >  }
> >
> > +static enum ci_role ci_get_role(struct ci_hdrc *ci)
> > +{
> > +     enum ci_role role;
> > +
> > +     if (ci->roles[CI_ROLE_HOST] && ci->roles[CI_ROLE_GADGET]) {
> > +             if (ci->is_otg) {
> > +                     role =3D ci_otg_role(ci);
> > +                     hw_write_otgsc(ci, OTGSC_IDIE, OTGSC_IDIE);
> > +             } else {
> > +                     /*
> > +                      * If the controller is not OTG capable, but supp=
ort
> > +                      * role switch, the defalt role is gadget, and th=
e
> > +                      * user can switch it through debugfs.
> > +                      */
> > +                     role =3D CI_ROLE_GADGET;
> > +             }
> > +     } else {
> > +             role =3D ci->roles[CI_ROLE_HOST] ? CI_ROLE_HOST
> > +                                     : CI_ROLE_GADGET;
> > +     }
> > +
> > +     return role;
> > +}
> > +
> > +static void ci_handle_power_lost(struct ci_hdrc *ci)
>=20
> Hey,
>=20
> This appears to have landed in -next and is breaking allmodconfig for
> RISC-V:
> ../drivers/usb/chipidea/core.c:664:13: error: 'ci_handle_power_lost' defi=
ned but not used [-Werror=3Dunused-function]
>   664 | static void ci_handle_power_lost(struct ci_hdrc *ci)
>       |             ^~~~~~~~~~~~~~~~~~~~
>   CC [M]  drivers/media/i2c/mt9t001.o
>   CC [M]  drivers/net/ethernet/davicom/dm9051.o
>   CC [M]  drivers/input/touchscreen/ti_am335x_tsc.o
>   CC [M]  drivers/watchdog/wdt_pci.o
> cc1: all warnings being treated as errors
> make[5]: *** [../scripts/Makefile.build:250: drivers/usb/chipidea/core.o]=
 Error 1
> make[4]: *** [../scripts/Makefile.build:500: drivers/usb/chipidea] Error =
2
> make[3]: *** [../scripts/Makefile.build:500: drivers/usb] Error 2
> make[3]: *** Waiting for unfinished jobs....
>=20
> The only user seems to be wrapped in an #ifdef CONFIG_PM_SLEEP, and
> while I haven't had the chance to investigate further yet that's
> probably where I'd start looking.
> Apologies if it's been reported, I had a quick look on lore but didn't
> see anything.

Since only ci_resume() will call ci_handle_power_lost(), so it should also
be wrapped in #ifdef CONFIG_PM_SLEEP. Thanks for your report.

Thanks,
Xu Yang

>=20
> Thanks,
> Conor.
>=20
> > +{
> > +     enum ci_role role;
> > +
> > +     disable_irq_nosync(ci->irq);
> > +     if (!ci_otg_is_fsm_mode(ci)) {
> > +             role =3D ci_get_role(ci);
> > +
> > +             if (ci->role !=3D role) {
> > +                     ci_handle_id_switch(ci);
> > +             } else if (role =3D=3D CI_ROLE_GADGET) {
> > +                     if (ci->is_otg && hw_read_otgsc(ci, OTGSC_BSV))
> > +                             usb_gadget_vbus_connect(&ci->gadget);
> > +             }
> > +     }
> > +
> > +     enable_irq(ci->irq);
> > +}
> > +
> >  static struct usb_role_switch_desc ci_role_switch =3D {
> >       .set =3D ci_usb_role_switch_set,
> >       .get =3D ci_usb_role_switch_get,
> > @@ -1134,25 +1177,7 @@ static int ci_hdrc_probe(struct platform_device =
*pdev)
> >               }
> >       }
> >
> > -     if (ci->roles[CI_ROLE_HOST] && ci->roles[CI_ROLE_GADGET]) {
> > -             if (ci->is_otg) {
> > -                     ci->role =3D ci_otg_role(ci);
> > -                     /* Enable ID change irq */
> > -                     hw_write_otgsc(ci, OTGSC_IDIE, OTGSC_IDIE);
> > -             } else {
> > -                     /*
> > -                      * If the controller is not OTG capable, but supp=
ort
> > -                      * role switch, the defalt role is gadget, and th=
e
> > -                      * user can switch it through debugfs.
> > -                      */
> > -                     ci->role =3D CI_ROLE_GADGET;
> > -             }
> > -     } else {
> > -             ci->role =3D ci->roles[CI_ROLE_HOST]
> > -                     ? CI_ROLE_HOST
> > -                     : CI_ROLE_GADGET;
> > -     }
> > -
> > +     ci->role =3D ci_get_role(ci);
> >       if (!ci_otg_is_fsm_mode(ci)) {
> >               /* only update vbus status for peripheral */
> >               if (ci->role =3D=3D CI_ROLE_GADGET) {
> > @@ -1374,8 +1399,16 @@ static int ci_suspend(struct device *dev)
> >  static int ci_resume(struct device *dev)
> >  {
> >       struct ci_hdrc *ci =3D dev_get_drvdata(dev);
> > +     bool power_lost;
> >       int ret;
> >
> > +     /* Since ASYNCLISTADDR (host mode) and ENDPTLISTADDR (device
> > +      * mode) share the same register address. We can check if
> > +      * controller resume from power lost based on this address
> > +      * due to this register will be reset after power lost.
> > +      */
> > +     power_lost =3D !hw_read(ci, OP_ENDPTLISTADDR, ~0);
> > +
> >       if (device_may_wakeup(dev))
> >               disable_irq_wake(ci->irq);
> >
> > @@ -1383,6 +1416,15 @@ static int ci_resume(struct device *dev)
> >       if (ret)
> >               return ret;
> >
> > +     if (power_lost) {
> > +             /* shutdown and re-init for phy */
> > +             ci_usb_phy_exit(ci);
> > +             ci_usb_phy_init(ci);
> > +     }
> > +
> > +     if (power_lost)
> > +             ci_handle_power_lost(ci);
> > +
> >       if (ci->supports_runtime_pm) {
> >               pm_runtime_disable(dev);
> >               pm_runtime_set_active(dev);
> > diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> > index 7b53274ef966..622c3b68aa1e 100644
> > --- a/drivers/usb/chipidea/otg.c
> > +++ b/drivers/usb/chipidea/otg.c
> > @@ -165,7 +165,7 @@ static int hw_wait_vbus_lower_bsv(struct ci_hdrc *c=
i)
> >       return 0;
> >  }
> >
> > -static void ci_handle_id_switch(struct ci_hdrc *ci)
> > +void ci_handle_id_switch(struct ci_hdrc *ci)
> >  {
> >       enum ci_role role =3D ci_otg_role(ci);
> >
> > diff --git a/drivers/usb/chipidea/otg.h b/drivers/usb/chipidea/otg.h
> > index 5e7a6e571dd2..87629b81e03e 100644
> > --- a/drivers/usb/chipidea/otg.h
> > +++ b/drivers/usb/chipidea/otg.h
> > @@ -14,6 +14,7 @@ int ci_hdrc_otg_init(struct ci_hdrc *ci);
> >  void ci_hdrc_otg_destroy(struct ci_hdrc *ci);
> >  enum ci_role ci_otg_role(struct ci_hdrc *ci);
> >  void ci_handle_vbus_change(struct ci_hdrc *ci);
> > +void ci_handle_id_switch(struct ci_hdrc *ci);
> >  static inline void ci_otg_queue_work(struct ci_hdrc *ci)
> >  {
> >       disable_irq_nosync(ci->irq);
> > --
> > 2.34.1
> >
> >
