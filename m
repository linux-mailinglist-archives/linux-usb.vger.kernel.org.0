Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEF3375E031
	for <lists+linux-usb@lfdr.de>; Sun, 23 Jul 2023 09:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjGWHD4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Jul 2023 03:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjGWHDz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Jul 2023 03:03:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC89E1BCE
        for <linux-usb@vger.kernel.org>; Sun, 23 Jul 2023 00:03:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6085660C1F
        for <linux-usb@vger.kernel.org>; Sun, 23 Jul 2023 07:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B30C433C7;
        Sun, 23 Jul 2023 07:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1690095832;
        bh=vSr/5ciwX192W3dLVDpb+xCCu49iJ+al2zy7cD3yKNI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JRjHHrcQp9go9w0ewg3M1IzEm7IOvYJh6sR5Ykt/MVLMliiYS0rEj238n8GVY+ztD
         WmR1L13Lz/rawR7od17hsxv2JwuCakl6VC0b1o2ipInV7HYZrcXk5/uWWP8EfCn+DI
         ou0fxL8m5/lHEN7sBNwQBK7pl340hT2ldRp3+1Ys=
Date:   Sun, 23 Jul 2023 09:03:49 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Kernel support for wireless USB
Message-ID: <2023072350-brethren-unclasp-528f@gregkh>
References: <2a21cefa-99a7-497c-901f-3ea097361a80@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a21cefa-99a7-497c-901f-3ea097361a80@rowland.harvard.edu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 22, 2023 at 03:29:35PM -0400, Alan Stern wrote:
> Greg:
> 
> To what extent does the kernel still support Wireless USB?  Is it 
> supposed to be completely gone?

It should be completely gone.

> I ask because there's still a bunch of code in the hub.c for it, and the 
> logic doesn't all look right.  Removing it would be easier than trying 
> to fix it.

I didn't do a lot of surgery in removing the wireless code, just dropped
the obvious files and config options, so yes, there might be old stuff
lurking around that can be removed like this.

thanks,

greg k-h
