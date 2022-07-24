Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D27A57F527
	for <lists+linux-usb@lfdr.de>; Sun, 24 Jul 2022 15:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbiGXNID (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Jul 2022 09:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiGXNIC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 Jul 2022 09:08:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F056713FA3
        for <linux-usb@vger.kernel.org>; Sun, 24 Jul 2022 06:08:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8F10C60DE5
        for <linux-usb@vger.kernel.org>; Sun, 24 Jul 2022 13:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048ADC3411E;
        Sun, 24 Jul 2022 13:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658668081;
        bh=9zAXwVEGVlmDVpO85OWROPXVGZVU1a5yrmQazjLgIys=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NpddJdO4p/Sx18prWT1kymU91+0Au/5FaumWj7sr3o2Uso6j95GCL72pbt0H9c66M
         CiMji1Xm2XskQVgu+bxijPTOStbhKcYLJMBt+6QTZpNypWG37IA9Au90lzJmeccoqA
         89MN4PBCRGHTnsulL2MOSdBTf4rMbWTRIDchDAm/bGz96gIsIeHk0myutIQqh0hYMg
         KTuRz6D9CntkaS4xfh7qz3tBVN9lpDxDGl+/srESjp5jKiOh5nov0D8omyG8cXzgjb
         vwfRuzXTqEfHULAVL9qmNgxnqRwnfgNqockrV9bg+AteOK4gA/K5opjVG1pN5Gmbxm
         Jkygg6lOfe1Lg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oFbL7-00033u-R2; Sun, 24 Jul 2022 15:08:09 +0200
Date:   Sun, 24 Jul 2022 15:08:09 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 6/7] USB: serial: ftdi_sio: Fix custom_divisor and
 c_*speed for ASYNC_SPD_CUST
Message-ID: <Yt1EOcRWi0LdKqrB@hovoldconsulting.com>
References: <20220712115306.26471-1-kabel@kernel.org>
 <20220712115306.26471-7-kabel@kernel.org>
 <Yt06+wicNYMt/D7f@hovoldconsulting.com>
 <20220724123351.icqqvvfxjm7ogo5u@pali>
 <Yt1BIsPqAVH0ajlf@hovoldconsulting.com>
 <20220724125908.6vu3jveiaisvpocb@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220724125908.6vu3jveiaisvpocb@pali>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jul 24, 2022 at 02:59:08PM +0200, Pali Rohár wrote:
> On Sunday 24 July 2022 14:54:58 Johan Hovold wrote:
> > On Sun, Jul 24, 2022 at 02:33:51PM +0200, Pali Rohár wrote:

> > > What is updated is the real baudrate in c_ispeed and c_ospeed
> > > extensions.
> > > 
> > > It is really wrong? I thought that c_cflag should stay unchanged at
> > > B38400 when ASYNC_SPD_CUST is used.
> > 
> > Yeah, cflags stay unchanged, but you shouldn't touch those fields when
> > using the deprecated ASYNC_SPD_CUST hack.
> 
> Hm... Why? I thought that new extended fields (c_ispeed and c_ospeed)
> should contain current real speed. What is the reason that c_*speed
> fields should have 38400 when ASYNC_SPD_CUST hack is set?

Because we shouldn't go adding new features built around the deprecated
ASYNC_SPD_CUST hack.

User picks 38400, sets that flag and magic happens with some drivers for
a while still while we look the other way.

This is not something that we should need to care about when using the
new interfaces.

> > Note that this currently only works because the ftdi driver uses
> > tty_get_baud_rate() instead of c_ospeed directly which is the
> > recommended (new) way.
> 
> Yes, tty_get_baud_rate() helper function is there for this purpose,
> right?

No.

Johan
