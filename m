Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30E9B1DC7BE
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2020 09:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728423AbgEUHd2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 May 2020 03:33:28 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:57299 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728408AbgEUHd2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 May 2020 03:33:28 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 763EBA0B;
        Thu, 21 May 2020 03:33:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 21 May 2020 03:33:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=tq2q+Ln4vL3TniRit7XmR2oQOVq
        CmRlGQR0GStHzfRE=; b=mx+chKqvn+Ua96JaDp770wsfjRCbhuBFbMA6n7tWya0
        PUm0cZvClZfj300YGy52B48UeWJOWrx7s35EYvN8qgBpXcSXr05eIKL6GIhfsIEj
        gc1OBDJGmyh3KuRNekmP2R1DuVMQt1MAxTpdHTCdOn0eRBWEt/fJIEYq3JyGTCeF
        UII864FJrecBq9VBoDjgHyY6/gEatcMIhiAxOy5vD+J47LWwb7hFcp1uavBA/h6x
        DiR+EmMEZgAC5t5h+bqZkrG3W/Jr3uXcEO7iPx6Y3Q0Axq9zG01yfHlKNSa6OEiU
        Csy272dS+En/s6pUMKPp5qzgP++PX9YB+yDLmKo+lYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tq2q+L
        n4vL3TniRit7XmR2oQOVqCmRlGQR0GStHzfRE=; b=ih1LyWBVvphyJXi4YiW38i
        JxGv22D6MmO5nNV634TSZ6HX7R+RYbvbD6gjr7yHPzBbpGtauonuESnwBIQ3oJ+x
        0tzGCu00Oi4hN1ZDDUyRhWTCIXhcR/RkqPVeArMc3Ske85Y40RDvQdlEdrM26HzI
        amAe0Mg1V+8snjy0afsbyBF3asKxvQr2VV2i8Y7MP9iOG3O/TLQMwOmpKKA93Doj
        YMCU9m1zysS7Et/bdZKB9MhnjAKA6NfCsaklKpN9Yu7YR1D6DvRGOLfSHPO0ObMG
        3VWPynmfqG2FisngoaLL+LcyEd4tTHqwYBOFfMCKB4g074IDf4A+x6tMgxsi6YEA
        ==
X-ME-Sender: <xms:xi7GXinCv8HTIWrb23ew5FvGc_QXu6J9MzlfuFUGYeUSsjQeEJn7cA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddutddguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeek
    fedrkeeirdekledruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:xi7GXp2d2JosoQFQcAWvyiqiB2P9mQgiH1GQ7tnwj-zMmXYgCSeIHg>
    <xmx:xi7GXgqC8vUxjUzwd513dg65uX3yC7Yb5O1dvOfNClR8Ner8tIPCNg>
    <xmx:xi7GXmnGMWsdWd5PjQ4EdiCeu_fj7Lm_gKUr5c-swnMbrJfmkjNMjg>
    <xmx:xy7GXt_VKbtn_LLhdmGtUoCruKZkU5N_JF84FWHhQIsUM6joPp6cug>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 399553066479;
        Thu, 21 May 2020 03:33:26 -0400 (EDT)
Date:   Thu, 21 May 2020 09:33:23 +0200
From:   Greg KH <greg@kroah.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Colin Ian King <colin.king@canonical.com>,
        Oliver Neukum <oneukum@suse.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing
 WDM_IN_USE bit.
Message-ID: <20200521073323.GA2579717@kroah.com>
References: <20200520233129.3704-1-penguin-kernel@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520233129.3704-1-penguin-kernel@I-love.SAKURA.ne.jp>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 21, 2020 at 08:31:29AM +0900, Tetsuo Handa wrote:
> Since e.g. wdm_flush() calls wait_event() on WDM_IN_USE bit,
> make sure to call wake_up_all() when clearing WDM_IN_USE bit.

I'm sorry, but I don't understand what this changelog text is trying to
say.  Can you reword this differently?

> 
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

And is this a bugfix?  For what?  Does it need to go to stable kernels?

> ---
>  drivers/usb/class/cdc-wdm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
> index e3db6fbeadef..bf2a6deb7b08 100644
> --- a/drivers/usb/class/cdc-wdm.c
> +++ b/drivers/usb/class/cdc-wdm.c
> @@ -151,7 +151,7 @@ static void wdm_out_callback(struct urb *urb)
>  	kfree(desc->outbuf);
>  	desc->outbuf = NULL;
>  	clear_bit(WDM_IN_USE, &desc->flags);
> -	wake_up(&desc->wait);
> +	wake_up_all(&desc->wait);
>  }
>  
>  static void wdm_in_callback(struct urb *urb)
> @@ -426,6 +426,7 @@ static ssize_t wdm_write
>  		clear_bit(WDM_IN_USE, &desc->flags);
>  		dev_err(&desc->intf->dev, "Tx URB error: %d\n", rv);
>  		rv = usb_translate_errors(rv);
> +		wake_up_all(&desc->wait);

Is this a fix for two different issues?

confused,

greg k-h
