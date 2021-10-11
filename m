Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54DEE428D7E
	for <lists+linux-usb@lfdr.de>; Mon, 11 Oct 2021 15:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236757AbhJKNFf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Oct 2021 09:05:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:43494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232277AbhJKNFe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Oct 2021 09:05:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B80160F21;
        Mon, 11 Oct 2021 13:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633957415;
        bh=xqc/dgS9Mue8lkjNkvFBMU9rsl1LMtxv2lgVVxxzjFY=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=g0kuVmX6fE6IEYFgD+ms/Jf6o55G3zPkVjX1IdwegIHrAV/LSSlHhImx3tS13Oznb
         ZCsd9HOqctG+ehhBY3fKcf0QwlcPQF6ykfRfL6sTD6RI5hWPTyyXjYzPbLhXu2U0My
         HAKyCPX7F2L6ZZm8ZIoBEc1MJV2D1wGjZhmZRH/ZktrTJ9HygQHEizZ61rX8k1aFKL
         PokGnwzLc9U2ckkOpJjZtuaJ+yZySHXJVnQ8w49Y7bx0crM2fGSzfFSnmPrnzYVFVP
         40BWpUKAcKisgiwSPq1yWIWDABn7bOaDqRvWaCtDav+hD7m4Q5Gq+uG0azGc82PT4f
         UFhWuoz6GTIow==
References: <20211011123739.GC15188@kili>
User-agent: mu4e 1.6.6; emacs 28.0.60
From:   Felipe Balbi <balbi@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andrzej Pietrasiewicz <andrzej.p@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: hid: fix error code in do_config()
Date:   Mon, 11 Oct 2021 16:03:02 +0300
In-reply-to: <20211011123739.GC15188@kili>
Message-ID: <87lf2z3e8x.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Dan Carpenter <dan.carpenter@oracle.com> writes:

> Return an error code if usb_get_function() fails.  Don't return success.
>
> Fixes: 4bc8a33f2407 ("usb: gadget: hid: convert to new interface of f_hid")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/usb/gadget/legacy/hid.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/legacy/hid.c b/drivers/usb/gadget/legacy/hid.c
> index 5b27d289443f..3912cc805f3a 100644
> --- a/drivers/usb/gadget/legacy/hid.c
> +++ b/drivers/usb/gadget/legacy/hid.c
> @@ -99,8 +99,10 @@ static int do_config(struct usb_configuration *c)
>  
>  	list_for_each_entry(e, &hidg_func_list, node) {
>  		e->f = usb_get_function(e->fi);
> -		if (IS_ERR(e->f))
> +		if (IS_ERR(e->f)) {
> +			status = PTR_ERR(e->f);

nice catch! :-)

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
