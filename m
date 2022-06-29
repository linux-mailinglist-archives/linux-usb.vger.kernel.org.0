Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57C0F55FD0E
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jun 2022 12:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233329AbiF2KWm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jun 2022 06:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233326AbiF2KWm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jun 2022 06:22:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 560CF3BA5F
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 03:22:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA72560E33
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 10:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DA1C34114;
        Wed, 29 Jun 2022 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1656498160;
        bh=Nhr8coyi2sWavxuJtuttlu+qQbvUb4AavW/PlugHUZ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FIY3TeLb3Xh/sualnXPLQwqAz1ws2rDVJ9PokTnaVyO/61b/UX6GZqnSmQtUNWtL3
         v3qYzY+RzT8K7SGobkFhFh4A08kK/6YKqAkCjLWrP4fNlnx2rW3y8NKSugEv6/yixG
         HszVtn7gtOL1RIoCDwrpBtuqk9pDTGSoKTv4XL3U=
Date:   Wed, 29 Jun 2022 12:22:33 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: support USB 3.2 function remote wake
Message-ID: <Yrwn6Y7OMdPtN+g/@kroah.com>
References: <cd7169df640fe6dab85f6d94cb8f40c181e08d2b.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd7169df640fe6dab85f6d94cb8f40c181e08d2b.camel@mediatek.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 29, 2022 at 05:02:54PM +0800, Chunfeng Yun wrote:
> Hi,
> 
> I plan to support function remote wakeup on our usb3 device controller
> driver.

Is this based on dwc3 or some new silicon?

> A function may signal that it wants to exit from Function Suspend by
> sending a Function Wake Notification to the host, and the notification
> need knows the first interface number in this function.
> But the current gadget ops:
>     int (*wakeup)(struct usb_gadget *);
> does not provide information about interface number;

Why would the interface matter as you need to do this for the whole
device, not just one interface, right?

> There seems to be two ways:
> 1. add a new parameter as below,
>     int (*wakeup)(struct usb_gadget *, u8 intf);
> 2. add a new ops, such as,
>     int (*function_wakeup)(struct usb_gadget *, u8 intf);
> 
> Do you have any suggestions?

Look at what the existing ones do, I do not think you have different
suspend levels per USB interface, but rather the whole device.  Try it
and see.

thanks,

greg k-h
