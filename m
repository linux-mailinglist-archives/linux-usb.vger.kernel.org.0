Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53315609468
	for <lists+linux-usb@lfdr.de>; Sun, 23 Oct 2022 17:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbiJWPdS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Oct 2022 11:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbiJWPdS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Oct 2022 11:33:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE3376448
        for <linux-usb@vger.kernel.org>; Sun, 23 Oct 2022 08:33:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AE63560EEB
        for <linux-usb@vger.kernel.org>; Sun, 23 Oct 2022 15:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7706BC433C1;
        Sun, 23 Oct 2022 15:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666539196;
        bh=NJqOh7tbhSJkIovIz+yh50U/W1dVqQJUwRfqyj0FFHk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g8z8m/dZTVtEXwRNN5S65JtfJ7E0t1GCgFpQ7/yBvq6DZLYk2OiRyqVZZVkndjlO0
         ZNAkMR5f8AFrDqq7BX8li1SqsviaXgYhCsL8wb2PMjTKgJkMiJaLBZlvzjauWA5V1x
         +u1SqjlrytRmST6OMrWvgZFa9os5CxOZ50+c50f4=
Date:   Sun, 23 Oct 2022 17:33:12 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-usb@vger.kernel.org, Fabian Vogt <fabian@ritter-vogt.de>,
        Yuan-Hsin Chen <yhchen@faraday-tech.com>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 1/3 v1] usb: fotg210: Collect pieces of dual mode
 controller
Message-ID: <Y1VeuNSYZOpq1lXy@kroah.com>
References: <20221023144708.3596563-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221023144708.3596563-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Oct 23, 2022 at 04:47:06PM +0200, Linus Walleij wrote:
> The Faraday FOTG210 is a dual-mode OTG USB controller that can
> act as host, peripheral or both. To be able to probe from one
> hardware description and to follow the pattern of other dual-
> mode controllers such as MUSB or MTU3 we need to collect the
> two, currently completely separate drivers in the same
> directory.
> 
> After this, users need to select the main symbol USB_FOTG210
> and then each respective subdriver. We pave the road to
> compile both drivers into the same kernel and select the
> one we want to use at probe() time, and possibly add OTG
> support in the end.
> 
> This patch doesn't do much more than create the new symbol
> and collect the drivers in one place. We also add a comment
> for the section of dual-mode controllers in the Kconfig
> file so people can see what these selections are about.
> 
> Also add myself as maintainer as there has been little
> response on my patches to these drivers.

Is this IP block still showing up on new devices?  It is really old, and
OTG is long dead from what I remember.  Does any real device actually
support that type of mode?

I have no objection to taking these, and I'm glad to see you maintain
them, I just don't want you to have to maintain dead code for devices
that are not around anymore.

thanks,

greg k-h
