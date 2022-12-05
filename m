Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63B22642847
	for <lists+linux-usb@lfdr.de>; Mon,  5 Dec 2022 13:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbiLEMU5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Dec 2022 07:20:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbiLEMU4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Dec 2022 07:20:56 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A423F024
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 04:20:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BE4F2B80F6F
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 12:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24703C433D6;
        Mon,  5 Dec 2022 12:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1670242852;
        bh=ezEbp6KTu6st4/cilRZDmpaDk7JqKdb22EviAQL4g7w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q9Py5LfYUOL7fiHq0o3H+YB4x9J34SAjZMbMcOD2Wm3wnIZHIHVxh6OFObKxZveui
         iMXHAXl+aWtTa9wPgSB9pk9Lsk8IlO8mqKse2yXZI74TqVWxc9m2nJ1Lu0Dco/Ld/g
         HQZSGWnG6EnVksYaTB1sxh0pNx4R1LqN3Jrv3J+Y=
Date:   Mon, 5 Dec 2022 13:20:49 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RFC] Unify messaging in gadget functions
Message-ID: <Y43iISitEERfteOt@kroah.com>
References: <266f2df3-75cf-5dcf-1e59-8a8da5dd001e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <266f2df3-75cf-5dcf-1e59-8a8da5dd001e@collabora.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 05, 2022 at 01:14:21PM +0100, Andrzej Pietrasiewicz wrote:
> Hi All,
> 
> include/linux/usb/composite.h contains:
> 
> /* messaging utils */
> #define DBG(d, fmt, args...) \
> 	dev_dbg(&(d)->gadget->dev , fmt , ## args)
> #define VDBG(d, fmt, args...) \
> 	dev_vdbg(&(d)->gadget->dev , fmt , ## args)
> #define ERROR(d, fmt, args...) \
> 	dev_err(&(d)->gadget->dev , fmt , ## args)
> #define WARNING(d, fmt, args...) \
> 	dev_warn(&(d)->gadget->dev , fmt , ## args)
> #define INFO(d, fmt, args...) \
> 	dev_info(&(d)->gadget->dev , fmt , ## args)
> 
> Gadget functions do use these, but not consistently:
> 
> => DBG() vs dev_dbg():
> $ git grep DBG\( drivers/usb/gadget/function | grep -v VDBG | grep -v LDBG | wc
>     138     871   11619
> 
> $ git grep dev_dbg\( drivers/usb/gadget/function | grep -v "##args" | wc
>      33     151    2831
> 
> => VDBG() vs dev_vdbg():
>  git grep VDBG\( drivers/usb/gadget/function | grep -v "#define" | wc
>      49     269    3954
> 
> $ git grep dev_vdbg\( drivers/usb/gadget/function | wc
>       2       4     135
> 
> => ERROR() vs dev_err():
> $ git grep ERROR\( drivers/usb/gadget/function | grep -v LERROR | wc
>      72     508    6560
> 
> $ git grep dev_err\( drivers/usb/gadget/function | grep -v "##args" | wc
>      65     309    5527
> 
> => WARNING() vs dev_warn():
> $ git grep WARNING\( drivers/usb/gadget/function | wc
>       4      28     383
> 
> $ git grep dev_warn\( drivers/usb/gadget/function | grep -v "##args" | wc
>       3       6     169
> 
> => INFO() vs dev_info():
> $ git grep INFO\( drivers/usb/gadget/function  | grep -v LINFO | grep -v
> u_ether | wc
>      14      64    1167
> 
> $ git grep dev_info\( drivers/usb/gadget/function | grep -v "##args" | wc
>       0       0       0

Drivers that work properly should be quiet, so no INFO() usage should
probably be needed anyway.

> 
> Questions:
> 
> 1) Should we make them use the messaging utils consitently?

Yes, converting to use the dev_*() calls is good to do.

> 2) How consistent should we become, given that some functions in the relevant
> files, for example u_audio_start_capture(), sometimes (but not always) have:
> 
> 	struct usb_gadget *gadget = audio_dev->gadget;
> 	struct device *dev = &gadget->dev;
> 
> and then they use dev_dbg(dev, ....);

dev_dbg() is fine, what's worng with that?

> If we were to use DBG(audio_dev, ....); instead, then we effectively get
> dev_dbg(&audio_dev->gadget->dev, ....); after macro expansion, which means two
> pointer dereferences and taking an address of the result (I'm wondering how
> smart the compiler can get if such a pattern repeats several times in a
> function).

The compiler can get very smart, but this isn't really an issue overall
as USB drivers are very slow due to slow hardware.

> 3) Maybe the amount of various messages is too large in the first place
> and should be reduced before any unifications?

Possibly, many might be able to be removed, look and see!

thanks,

greg k-h
