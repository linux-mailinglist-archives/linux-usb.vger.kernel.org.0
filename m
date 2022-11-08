Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C542621888
	for <lists+linux-usb@lfdr.de>; Tue,  8 Nov 2022 16:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233974AbiKHPki (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Nov 2022 10:40:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233615AbiKHPke (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Nov 2022 10:40:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46DD140E9
        for <linux-usb@vger.kernel.org>; Tue,  8 Nov 2022 07:40:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 76B03B81B40
        for <linux-usb@vger.kernel.org>; Tue,  8 Nov 2022 15:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92281C433D6;
        Tue,  8 Nov 2022 15:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1667922031;
        bh=tkKBfiV56sB9QCVwMYwwinzQ9LXzekwK3iSBtzQSlPU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZJ5jQHhRJ+g8ACt+CvIwLJ+rZNS4rI9YV1natUWnDTbnk90qNI8zhPkEx+AUNWGR6
         aMkyaRiORTX3k1yVcuO/iiTQdDBVkE69g7g+3KofjhlkAcHmpiCqRNugO9lqCv1XHF
         AjZ3gEZU+ZnVG7+UkdfZjjPsV9NxHkyYfdKvl6Sc=
Date:   Tue, 8 Nov 2022 16:40:27 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-usb@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Chuhong Yuan <hslester96@gmail.com>
Subject: Re: [PATCH] USB: bcma: Make GPIO explicitly optional
Message-ID: <Y2p4a45q20Do/pdH@kroah.com>
References: <20221107090753.1404679-1-linus.walleij@linaro.org>
 <CACRpkdasVj1j6Jyik_fRp8_0TydhCXmB+edzG6kYsxacDgq3eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdasVj1j6Jyik_fRp8_0TydhCXmB+edzG6kYsxacDgq3eg@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 07, 2022 at 02:38:35PM +0100, Linus Walleij wrote:
> On Mon, Nov 7, 2022 at 10:07 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > What the code does is to not check the return value from
> > devm_gpiod_get() and then avoid using an erroneous GPIO descriptor
> > with IS_ERR_OR_NULL().
> >
> > This will miss real errors from the GPIO core that should not be
> > ignored, such as probe deferral.
> >
> > Instead request the GPIO as explicitly optional, which means that
> > if it doesn't exist, the descriptor returned will be NULL.
> >
> > Then we can add error handling and also avoid just doing this on
> > the device tree path, and simplify the site where the optional
> > GPIO descriptor is used.
> >
> > There were some problems with cleaning up this GPIO descriptor
> > use in the past, but this is the proper way to deal with it.
> >
> > Cc: Rafał Miłecki <rafal@milecki.pl>
> > Cc: Chuhong Yuan <hslester96@gmail.com>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Actually I think this is something of a regression that needs
> a Cc: stable tag.
> 
> On my router (DIR-890L) this is needed for the USB ports to probe
> and work, I think due to recent refactorings involving device links
> and whatnot, i.e. probe deferral happens all the time and the
> deferral error has to be handled. I think many BCM systems are
> affected.

Now queued up for the next -rc release, thanks.

greg k-h
