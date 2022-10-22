Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1956084B0
	for <lists+linux-usb@lfdr.de>; Sat, 22 Oct 2022 07:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbiJVFpr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Oct 2022 01:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiJVFpp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Oct 2022 01:45:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A18BA15A8DD
        for <linux-usb@vger.kernel.org>; Fri, 21 Oct 2022 22:45:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3F22360A72
        for <linux-usb@vger.kernel.org>; Sat, 22 Oct 2022 05:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC0FC433B5;
        Sat, 22 Oct 2022 05:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666417543;
        bh=DK+hmKix2Vp0vsc9CLmaRLC/tOV3zAqh2yhDu1pq5jA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WtVkSN8PWEdt78wk46yPANvvc/lyPadwJZfjb4I5TczrP4T/lpXsaAsn1TRjg6L89
         flX1JfEnFPWsubWM/EJmO4Gx5A1OdwI9g1e7zzuWAUiHWqGcS3LC7xaUqwdUTzGiGA
         D8oqVDR55fSmpPIskNc1KkP1fu1Q3QBJ8s8682Mg=
Date:   Sat, 22 Oct 2022 07:46:33 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Chuck Evans <crtigermoth@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Hp A10 has broken [AMD] FCH USB XHCI controller, UAS errors,
 please blacklist
Message-ID: <Y1ODuVfQrqrzW0Qb@kroah.com>
References: <CAGedn0=nwQwmzTJqY8KXVQ_AGCGE9Dm8vjgoX_7JAKyaoCUzdQ@mail.gmail.com>
 <Y1IjByxvuX3Nx0Et@kroah.com>
 <CAGedn0==W+NukFPPd5Ff-U-nMXjz-_wsQKcMNaA3ONJHE3zr6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGedn0==W+NukFPPd5Ff-U-nMXjz-_wsQKcMNaA3ONJHE3zr6Q@mail.gmail.com>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Fri, Oct 21, 2022 at 03:47:53PM -0400, Chuck Evans wrote:
> Lsusb gave nothing useful:
> Linux foundation 3.0 root hub

That is not the storage device at all.

And you only have 1 root hub in your system?

> Uas driver takes no options.

It takes lots of options, please see the usb-storage.quirks line in the
Documentation/admin-guide/kernel-parameters.txt file.  Please try the
quirks listed there.

thanks,

greg k-h
