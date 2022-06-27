Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8032155C34D
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 14:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238601AbiF0PxI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jun 2022 11:53:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238916AbiF0Pww (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jun 2022 11:52:52 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 353231AF2B
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 08:52:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 8BE57CE1B98
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 15:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2588C341CA
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 15:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656345154;
        bh=gQ/8rpTLJoHf5hQ/J7Tim5kyblxVTDM3oOXl5+ou4X8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IbsyGbkPTtqeePxaq5vuQk6Ht9AerYj0BNdaIJeaP2yIG4mWUvLkdgXT8Edp2ohY7
         nzPSwVaENUOq3xv4oKUyhKgAs0ak4sniH6vMOI9UqqfMKtPYoltLcJBkRkvNWugATA
         WpHq+crwQUruG8rRlTTZaRkJIo0F2SXec9xqPCwZPZYnPpY1iRRrfvaPHQ0vfaGL6P
         KnEFJ2a8LKiPE5L1X7ryDbtrE09FJuwK4pLr8fEvvAj/g+IBAWr/HUQOCRZPHs1S23
         d8QvdDm0CVWq8Tno6vdGnev1gtzAOPuqy05cd2fo/wNcAbR3jB1bH3PQLRLdynNkkg
         2obC0cGmD2mOA==
Received: by mail-vs1-f51.google.com with SMTP id h38so9377965vsv.7
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 08:52:34 -0700 (PDT)
X-Gm-Message-State: AJIora9mPeR3ILzhCoFy7Ak6mk8D+6U4IxpKzwJVJEBkRcjWcqC4ho94
        s0G2JGM8DAraEVOLMmh+ro+RykW4frGpdyWiSQ==
X-Google-Smtp-Source: AGRyM1spI4V2i5L3miuavcwk5M71oji9JvRZrCj9WaP3J+qZiNMHshh0zQhnC3gDnlZgRs+sJkzpms/ovm9XpOnk2fk=
X-Received: by 2002:a67:1787:0:b0:354:6490:437f with SMTP id
 129-20020a671787000000b003546490437fmr4876195vsx.26.1656345153833; Mon, 27
 Jun 2022 08:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220625214151.547b3570@Cyrus.lan> <947e4583-fe0b-b8af-61b3-2d120357727c@gmail.com>
 <53ac873c23e.3ae9df00@auth.smtp.1and1.co.uk>
In-Reply-To: <53ac873c23e.3ae9df00@auth.smtp.1and1.co.uk>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 27 Jun 2022 09:52:22 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKd2QaoPH16JqKrx0_XNmyUgKqsiOD56QHO1C0r1rCp7g@mail.gmail.com>
Message-ID: <CAL_JsqKd2QaoPH16JqKrx0_XNmyUgKqsiOD56QHO1C0r1rCp7g@mail.gmail.com>
Subject: Re: drivers/usb/host/ehci-fsl: Fix interrupt setup in host mode.
To:     Darren Stevens <darren@stevens-zone.net>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Scott Wood <oss@buserror.net>,
        Christian Zigotzky <chzigotzky@xenosoft.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Yang-Leo Li <leoyang.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 26, 2022 at 2:03 PM Darren Stevens <darren@stevens-zone.net> wr=
ote:
>
> Hello Sergei
>
> On 26/06/2022, Sergei Shtylyov wrote:
> > Hello!
> >
> > On 6/25/22 11:41 PM, Darren Stevens wrote:
> >
> >> In patch a1a2b7125e10 (Drop static setup of IRQ resource from DT
> >> core) we stopped platform_get_resource() from returning the IRQ, as al=
l
> >
> > In commit a1a2b7125e10 ("Drop static setup of IRQ resource from DT core=
")
> >
> >> drivers were supposed to have switched to platform_get_irq()
> >> Unfortunately the Freescale EHCI driver in host mode got missed. Fix
> >> it. Also fix allocation of resources to work with current kernel.
> >
> >    The basic rule (especially for the fixes) is "do one thing per patch=
".
>
> I thought I'd done that, this is the minimum amount of changes that fix w=
hat changed in the specified commit.
>
> > [...]
> >> @@ -92,15 +89,18 @@ static int fsl_ehci_drv_probe(struct platform_devi=
ce *pdev)
> >>          goto err1;
> >>      }
> >>
> >> -    res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >> -    hcd->regs =3D devm_ioremap_resource(&pdev->dev, res);
> >> +    tmp =3D of_address_to_resource(dn, 0, &res);
> >
> >    Hm, why? What does this fix?
>
> With baseline the mouse and keyboard on our machines don't work - dmesg r=
eports no interrupt. Fixing the interrupt detection throws a 'invalid resou=
re' error instead (No idea why), which these lines fix. Both problems disap=
pear if we revert the 'fixes' patch.
>

I see the problem. You need to keep the
platform_device_add_resources() call in fsl-mph-dr-of.c so that the
memory resource is copied from the parent to the child device.

Rob
