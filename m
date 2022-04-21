Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD5A50973A
	for <lists+linux-usb@lfdr.de>; Thu, 21 Apr 2022 08:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384678AbiDUGNm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Apr 2022 02:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232573AbiDUGNm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Apr 2022 02:13:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C59CD13CDF
        for <linux-usb@vger.kernel.org>; Wed, 20 Apr 2022 23:10:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 34E2561733
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 06:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF19C385A1;
        Thu, 21 Apr 2022 06:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650521449;
        bh=QLsNFQ4xM5/AkErCSSEUoAreJjanQtibM1TiBR3jXvI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n6z5CECVL7MWZ/MmC9wWPVZu2Rl3hl6tNAYBE25o6ybeiz5NjpKPI1wVmziqTo7jU
         LJKWsMH4cToOy96UBff9i3+B6/U/vtvITsbuCFkFjVnYRL5/fDajRvmM+P17EeyBZr
         XRQZD46uZ+27MouqyAl8/mIV9y0diW10cWoYxntw=
Date:   Thu, 21 Apr 2022 08:10:46 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: devices: use scnprintf() instead of sprintf()
Message-ID: <YmD1ZoPmVm6uDRr4@kroah.com>
References: <ebfd7a94-34d2-6259-fa0c-4a5dcc649d2b@omp.ru>
 <Yl+q1QL2vkuKYPDx@kroah.com>
 <aab4aece-2a18-7caa-e735-a41ab26dff83@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aab4aece-2a18-7caa-e735-a41ab26dff83@omp.ru>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 20, 2022 at 11:04:00PM +0300, Sergey Shtylyov wrote:
> Hello!
> 
> On 4/20/22 9:40 AM, Greg Kroah-Hartman wrote:
> 
>    Thanks for the (unusually?) prompt reply! :-)
> 
> >> The USB device dump code uses the sprintf() calls with a 2-page buffer,
> >> leaving 256 bytes at the end of that buffer to prevent buffer overflow.
> >> Using scnprntf() instead eliminates the very possibility of the buffer
> >> overflow, while also simplifying the code. This however is achieved at
> >> the expense of not printing the "(truncated)" line anymore when the end
> >> of that buffer is actually reached; instead a possible partial line at
> >> the end of buffer (not ending with '\n') is now not printed.
> > 
> > So you just changed a user-visable abi :(
> 
>     debugfs is an ABI too? :-)

When we have tools that we know parse it, yes it can be.

But here you are just changing the existing format for no good reason,
which is generally considered a bad thing.

thanks,

greg k-h
