Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0E6774B78
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 22:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234970AbjHHUsX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 16:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234976AbjHHUsK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 16:48:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67640157A4
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 09:40:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 038846241A
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 08:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7C3C433C9;
        Tue,  8 Aug 2023 08:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1691482937;
        bh=MP7+JLF4kUnXC3IV6QHYeU5TzicDI3udQET1phMOPVU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l2M78I3NYxX+6hwj1tqHHDFdFC92yxK1gdk6Pwe/CaYTaftEdrR1QZaSkbly7NMlN
         dOqYAbtF7fg6fVegnUMAPt7PKDTxLSSExEHlY4J6WbsK/yWNl2ZbLQsQT9Pgsz56q3
         iqIq1YkGyl796eB7IweDShTnO+RLJpYYgVhUl5HM=
Date:   Tue, 8 Aug 2023 10:22:14 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     hadess@hadess.net, benjamin.tissoires@redhat.com,
        herve.codina@bootlin.com, robh@kernel.org,
        mailhol.vincent@wanadoo.fr, linux-usb@vger.kernel.org
Subject: Re: [PATCH -next] USB: core: Switch to use kmemdup_nul() helper
Message-ID: <2023080822-embark-quaking-074e@gregkh>
References: <20230807124610.2283583-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807124610.2283583-1-ruanjinjie@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 07, 2023 at 08:46:10PM +0800, Ruan Jinjie wrote:
> Use kmemdup_nul() helper instead of open-coding it to simplify the code.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/usb/core/message.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 0d2bfc909019..5762fd04f0d5 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -1029,10 +1029,9 @@ char *usb_cache_string(struct usb_device *udev, int index)
>  	if (buf) {
>  		len = usb_string(udev, index, buf, MAX_USB_STRING_SIZE);
>  		if (len > 0) {
> -			smallbuf = kmalloc(++len, GFP_NOIO);
> +			smallbuf = kmemdup_nul(buf, len, GFP_NOIO);
>  			if (!smallbuf)
>  				return buf;
> -			memcpy(smallbuf, buf, len);

But you changed the logic here, you now added an extra \0 where the
existing code did not.  Are you sure you mean to do this?  If so, why,
and it needs to be documented in the changelog text.

What this could be is a call to kmemdup() if you really want it, but be
careful about the ++len usage...

Also, does this need to be changed at all?  How was it tested?

thanks,

greg k-h
