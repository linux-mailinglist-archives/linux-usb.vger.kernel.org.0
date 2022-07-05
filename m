Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2305676EA
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jul 2022 20:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232564AbiGESy7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jul 2022 14:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbiGESy6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Jul 2022 14:54:58 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 288441B7AE
        for <linux-usb@vger.kernel.org>; Tue,  5 Jul 2022 11:54:56 -0700 (PDT)
Received: (qmail 371446 invoked by uid 1000); 5 Jul 2022 14:54:55 -0400
Date:   Tue, 5 Jul 2022 14:54:55 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>
Cc:     Darren Stevens <darren@stevens-zone.net>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Scott Wood <oss@buserror.net>,
        Christian Zigotzky <chzigotzky@xenosoft.de>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Yang-Leo Li <leoyang.li@nxp.com>
Subject: Re: [PATCH v3] drivers/usb/host/ehci-fsl: Fix interrupt setup in
 host mode.
Message-ID: <YsSI/7uGfRWHps9A@rowland.harvard.edu>
References: <20220702220355.63b36fb8@Cyrus.lan>
 <CAL_Jsq+K7MN6kzMshNtBXYsM=1AKyJFL7OQpsevba2xmKz0=sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+K7MN6kzMshNtBXYsM=1AKyJFL7OQpsevba2xmKz0=sg@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 05, 2022 at 10:29:53AM -0600, Rob Herring wrote:
> On Sat, Jul 2, 2022 at 3:04 PM Darren Stevens <darren@stevens-zone.net> wrote:
> >
> > In patch a1a2b7125e10 (Drop static setup of IRQ resource from DT
> > core) we stopped platform_get_resource() from returning the IRQ, as all
> > drivers were supposed to have switched to platform_get_irq()
> > Unfortunately the Freescale EHCI driver in host mode got missed. Fix
> > it.
> >
> > Fixes: a1a2b7125e10 (Drop static setup of IRQ resource from DT core)
> > Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> > Suggested-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Darren Stevens <darren@stevens-zone.net>
> > ---
> >  v3 - Corrected resource allocation in fsl-mph-dr-of.c
> >
> >  v2 - Fixed coding style, removed a couple of unneeded initializations,
> >       cc'd Layerscape maintainers.
> >
> > Tested on AmigaOne X5000/20 and X5000/40 Contains code by Rob Herring
> > (in fsl-mph-dr-of.c)
> 
> Thanks for fixing.
> 
> Acked-by: Rob Herring <robh@kernel.org>

Okay for me too.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

