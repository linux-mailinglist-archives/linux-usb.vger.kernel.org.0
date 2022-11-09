Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35186622AB4
	for <lists+linux-usb@lfdr.de>; Wed,  9 Nov 2022 12:38:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbiKILiW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Nov 2022 06:38:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiKILiV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Nov 2022 06:38:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F2B2A26E
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 03:38:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 51BF961990
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 11:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64384C433D6;
        Wed,  9 Nov 2022 11:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1667993899;
        bh=4XK2tKkTaS/vWaPZEeZA/ctCMbIHsm0XmRJCA7xy2MY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hx7m+DR6Pb9HuG9XmD+sCBZT5u79nxkW1dVZGEfMBhuHz7NVxLkSS5pZI4XbFKvRx
         TyV7N6MaKRvn2RdziprEPkun133L+RGY0sj/++TtqkDH10qBUpVadUHFdWoavaC/TH
         1+vhiw04qjEjdpy76dKnYOU2306dmbqMDN2t7UMo=
Date:   Wed, 9 Nov 2022 12:38:17 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-usb@vger.kernel.org, Fabian Vogt <fabian@ritter-vogt.de>,
        Yuan-Hsin Chen <yhchen@faraday-tech.com>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 1/3 v1] usb: fotg210: Collect pieces of dual mode
 controller
Message-ID: <Y2uRKeTSOc2ofy4e@kroah.com>
References: <20221023144708.3596563-1-linus.walleij@linaro.org>
 <CACRpkda=nbOcXSMNjnJjhL6KaCk_yYD42tSZ3qcxD2bBDWQ2Ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkda=nbOcXSMNjnJjhL6KaCk_yYD42tSZ3qcxD2bBDWQ2Ag@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 07, 2022 at 12:20:14AM +0100, Linus Walleij wrote:
> On Sun, Oct 23, 2022 at 4:49 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > The Faraday FOTG210 is a dual-mode OTG USB controller that can
> > act as host, peripheral or both. To be able to probe from one
> > hardware description and to follow the pattern of other dual-
> > mode controllers such as MUSB or MTU3 we need to collect the
> > two, currently completely separate drivers in the same
> > directory.
> >
> > After this, users need to select the main symbol USB_FOTG210
> > and then each respective subdriver. We pave the road to
> > compile both drivers into the same kernel and select the
> > one we want to use at probe() time, and possibly add OTG
> > support in the end.
> >
> > This patch doesn't do much more than create the new symbol
> > and collect the drivers in one place. We also add a comment
> > for the section of dual-mode controllers in the Kconfig
> > file so people can see what these selections are about.
> >
> > Also add myself as maintainer as there has been little
> > response on my patches to these drivers.
> >
> > Cc: Fabian Vogt <fabian@ritter-vogt.de>
> > Cc: Yuan-Hsin Chen <yhchen@faraday-tech.com>
> > Cc: Felipe Balbi <balbi@kernel.org>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Greg are these fine to merge? I have some more patches coming
> so I would like to establish these as a base.

Now queued up, sorry for the delay.

greg k-h
