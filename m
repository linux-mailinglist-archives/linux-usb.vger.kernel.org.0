Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15DCA4AF09D
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 13:04:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232221AbiBIMDb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 07:03:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231633AbiBIMDK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 07:03:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D662DF28AC4
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 03:34:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1C5C5615E9
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 11:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D405BC340EF;
        Wed,  9 Feb 2022 11:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1644406489;
        bh=yiqqfPw1afhRq58HfOuOcCHtgUdiNu8TjPayL2BNNkY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pY6/oeYb59psMyqTs7rj1W5cv0OEN3EZqFDnuVLjgDO3RVJRYityCWnDNe56fs4c7
         UWTglFh1fHcqH/ZyoNwNI1pWNzns1ocAVTFeoRPvGp8A4qFkhPOiitqwjAHvMLBup3
         g02HGvNUOWyJ27QAmkdY80S53txs791HUNTSZBCA=
Date:   Wed, 9 Feb 2022 12:34:46 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: devices: drop unreachable code in
 usb_dump_endpoint_descriptor()
Message-ID: <YgOm1iLfhx0ij+dL@kroah.com>
References: <558d5094-64b5-f870-9b18-3451c0b44337@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <558d5094-64b5-f870-9b18-3451c0b44337@omp.ru>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 09, 2022 at 01:45:15PM +0300, Sergey Shtylyov wrote:
> The *switch* statement in usb_dump_endpoint_descriptor() does handle
> all possible endpoint types expilicitly, so the *default* label is
> unreachable...
> 
> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
> analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
> This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.
> 
> Changes in version 2:
> - fixed typos in the patch description;
> - reformatted the patch description.
> 
>  drivers/usb/core/devices.c |    2 --
>  1 file changed, 2 deletions(-)
> 
> Index: usb/drivers/usb/core/devices.c
> ===================================================================
> --- usb.orig/drivers/usb/core/devices.c
> +++ usb/drivers/usb/core/devices.c
> @@ -168,8 +168,6 @@ static char *usb_dump_endpoint_descripto
>  	case USB_ENDPOINT_XFER_INT:
>  		type = "Int.";
>  		break;
> -	default:	/* "can't happen" */
> -		return start;
>  	}

We write code for humans first, compiler/cpu second.  These two lines
provide a huge hint to a human, and the compiler/cpu does not care at
all as it is optimized away.

So this makes no real change except make it harder for humans to
understand and read the code, which is not a change anyone should make.

sorry,

greg k-h
