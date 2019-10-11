Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE6BBD41CF
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 15:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbfJKNve (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 09:51:34 -0400
Received: from mx01-fr.bfs.de ([193.174.231.67]:18002 "EHLO mx01-fr.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728027AbfJKNvd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Oct 2019 09:51:33 -0400
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
        by mx01-fr.bfs.de (Postfix) with ESMTPS id 38B8120345;
        Fri, 11 Oct 2019 15:51:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1570801887; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dBPwyrLZ6ynWgdIN1/EoRSAZNcdAcNFjCEE4a11LTSk=;
        b=i4tiEkK/QbVddoZFA3tXOP7m+D+6aMgKz8kUZAYgBnnOWKjXZrwOJfldAGoybCKm9lKbgf
        uk+U7MEPhPL5NDxL/qI8EaZX0Ji5dVnwqPLBPEl5oZ3SmClICnxRi7rBg/18WFbaN/SqIU
        eGKDov3DoPujBJk3m9yFtFrMm6V+/Z3NY/fYMVlf9yC80m2mEF1T/CLDJuIvAZVxqb2pHd
        +PffSeQXvrRE43m38hyCzW64FPfUI3J62up/40XyLcFXtAw01ZnxT/pwV5AZjjh0e3tVZR
        oUgy5XX9HXy1qjWSqmpheEz1fI31GANpU+soI4TBIv0WJq2VjWxwl+HwO9fJPw==
Received: from [134.92.181.33] (unknown [134.92.181.33])
        by mail-fr.bfs.de (Postfix) with ESMTPS id E8F6ABEEBD;
        Fri, 11 Oct 2019 15:51:26 +0200 (CEST)
Message-ID: <5DA088DE.5040902@bfs.de>
Date:   Fri, 11 Oct 2019 15:51:26 +0200
From:   walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Juergen Stuber <starblue@users.sourceforge.net>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] USB: legousbtower: fix a signedness bug in tower_probe()
References: <20191011133525.GB22905@mwanda>
In-Reply-To: <20191011133525.GB22905@mwanda>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.10
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.10 / 7.00];
         ARC_NA(0.00)[];
         HAS_REPLYTO(0.00)[wharms@bfs.de];
         BAYES_HAM(-3.00)[100.00%];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         REPLYTO_ADDR_EQ_FROM(0.00)[];
         DKIM_SIGNED(0.00)[];
         RCPT_COUNT_SEVEN(0.00)[7];
         NEURAL_HAM(-0.00)[-0.999,0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         RCVD_TLS_ALL(0.00)[]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Am 11.10.2019 15:35, schrieb Dan Carpenter:
> The problem is that sizeof() is unsigned long so negative error codes
> are type promoted to high positive values and the condition becomes
> false.
> 
> Fixes: 1d427be4a39d ("USB: legousbtower: fix slab info leak at probe")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/usb/misc/legousbtower.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
> index 9d4c52a7ebe0..835908fe1e65 100644
> --- a/drivers/usb/misc/legousbtower.c
> +++ b/drivers/usb/misc/legousbtower.c
> @@ -881,7 +881,7 @@ static int tower_probe (struct usb_interface *interface, const struct usb_device
>  				  get_version_reply,
>  				  sizeof(*get_version_reply),
>  				  1000);
> -	if (result < sizeof(*get_version_reply)) {
> +	if (result < 0 || result < sizeof(*get_version_reply)) {
>  		if (result >= 0)
>  			result = -EIO;
>  		dev_err(idev, "get version request failed: %d\n", result);

i am not an USB expert but it seems that this is a complicated way
to check for result != sizeof(*get_version_reply).

re,
 wh
