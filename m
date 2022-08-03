Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAA26588AB4
	for <lists+linux-usb@lfdr.de>; Wed,  3 Aug 2022 12:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235108AbiHCKl5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Aug 2022 06:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233781AbiHCKlz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Aug 2022 06:41:55 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E00581EC4A
        for <linux-usb@vger.kernel.org>; Wed,  3 Aug 2022 03:41:53 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id y13so16707997ejp.13
        for <linux-usb@vger.kernel.org>; Wed, 03 Aug 2022 03:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RjU4yAS+BExqGy0cxisBPQai2bWZW7lsWwkwR/xx4Ok=;
        b=LNFhshLcmyVFiYJtSKjQySmQFKXQu4VUMf/shxP+ZmJ/XGsBWjZiYartayNt59Hzu0
         HnoFJpbycYCvlrupHuAoab8EtihXGFY3kc+o013nngD4w+3JWToMYEC3oUnmpf5X+IXr
         swspbSPr18p9Baw7OyzsXAv7sVxO3dfB9L6BWuxRdhCLNRAY/z2O2KNyPzACGI1ARvEF
         KeUgm014ix8eu3aEDyjD4OjELtz6ihRsVRBg4t+m1tP5Y8a5KN6MbeLucBYv9h+rg+y1
         j9qg5/NMalblSsxosDCSRjJJCERzqNdM4bvEMiyGa38X6nhhxcZf1zVm2KkQ6drN5CuN
         13+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RjU4yAS+BExqGy0cxisBPQai2bWZW7lsWwkwR/xx4Ok=;
        b=Ssg+pHEccGS+x5+4pt6ff2S8X9i3Yy5n76gr9jhWNp7PzfrJ42YhXfXT5MZBie+DnG
         OB3TGW4Pbz9FKuMzR0+VxxZKqpZuqk2dt6AnCmPgCa2lEZP50mnB3jMaiMgmtSbABpoe
         uaGasaJoP3gu+5+8pe/Eh8v5wBhHETR5uP09vfzWHlgmKQdg4m1c5H8yOjzTA4MZ+h2P
         9O9snj5grfEQW9AVOSx7tSJdImcVR16LcM0DJVdG+DS9fOOjGKU7BURSGRMcyrV4zm2j
         crFeIf4NblJeSIJ0/sV8wHbstjuHILsf4ZU2hfLWAmuTB3zpDlsjg1C4Mc93jPQt+xD2
         HGoQ==
X-Gm-Message-State: ACgBeo0uX3wYpDLq8V//rCczVHRL+zRg9msq05rP56n+NdzKyaA15YLW
        2jdAs5/MFEADQXtWOfPWYNXRMCkU9l1eKPZabdzS
X-Google-Smtp-Source: AA6agR5UQjX34udj7b0nV+mYuW4BZiwhSgyziSJLCSCeL+QQLCdrnlrHX3cpOkluixKd1QePkq9imq0ezeeYJfydLno=
X-Received: by 2002:a17:906:9be1:b0:730:957f:34a3 with SMTP id
 de33-20020a1709069be100b00730957f34a3mr8589991ejc.47.1659523312479; Wed, 03
 Aug 2022 03:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220729094022.186496-1-lb@semihalf.com> <Yuep3lpI02gWiJY9@lahna>
 <CAK8ByeL4AJoXndO02Os0UPYZRiMeLmBjB-00VaEe-8KJF0tWzQ@mail.gmail.com>
 <YukhjOo4CteuM8q9@lahna> <CAK8ByeJ0=rbGr5+GZ_dDhMRnHjYxuCO9_cZONuXSz2tyL+QLzw@mail.gmail.com>
 <YuoyBf20gNLNqYdC@lahna> <CAK8ByeK=xOGshi9Yk2C3eVVNYprYFejX53OQzAztuxrKNK7F9A@mail.gmail.com>
 <YupD+YoRc4pYTdaQ@lahna>
In-Reply-To: <YupD+YoRc4pYTdaQ@lahna>
From:   =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>
Date:   Wed, 3 Aug 2022 12:41:41 +0200
Message-ID: <CAK8Bye+SJzx9UujSteti75J1TbiQBVtrWG5jw2vEAAArM6Sktg@mail.gmail.com>
Subject: Re: [PATCH v2] thunderbolt: fix PCI device class after powering up
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>
> On Wed, Aug 03, 2022 at 11:30:09AM +0200, =C5=81ukasz Bartosik wrote:
> > >
> > > Hi,
> > >
> > > On Tue, Aug 02, 2022 at 05:06:40PM +0200, =C5=81ukasz Bartosik wrote:
> > > > > Is this something available for purchase? I'm asking because I ha=
ve Acer
> > > > > Tiger Lake based Chromebook (740 spin or something) here and the =
TBT
> > > > > controller class is "USB controller" all the time, and this is wh=
at is
> > > > > expected. It should not change the class at any point.
> > > >
> > > > Sorry this platform is not available on the market.
> > >
> > > I don't think the mainline Linux needs to have this kind of a quirk f=
or
> > > a device that is not available for general public.
> > >
> >
> > The reference Chromebook platform is not available on the market now
> > however there will be Chromebooks based on that platform available for
> > purchase in the future.
>
> Right, and do you know if those have this issue? Like I said my
> Chromebook, that is also based on the reference Chromebook, does not
> have this problem so probably something firmware/hardware related that
> does not appear when the production systems are ready. And this really
> should not happen at all. I also suggest to contact the Intel TBT folks
> (assuming your company is making these Chromebooks to make sure you have
> the latest silicon/firmwares).

Ok. Thanks for the hint.

Regards,
Lukasz
