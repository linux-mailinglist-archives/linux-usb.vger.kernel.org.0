Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 794E214D8BC
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jan 2020 11:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbgA3KMq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jan 2020 05:12:46 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33214 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbgA3KMq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jan 2020 05:12:46 -0500
Received: by mail-lf1-f66.google.com with SMTP id n25so1926152lfl.0;
        Thu, 30 Jan 2020 02:12:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t34ozib48UgJTKZw3pjG8Zw0StLaVvJ9LaBH/uiswSs=;
        b=o5RZrLs8ZiTD+VcNNyFojhsnVngxuyRzWdV30UX9Xk/mBRF7TbbmhAUFtCCWkhxHrJ
         pYVqyyaUYwUpK/76Wm0iD2pMGtKyqyR30HJk8nbBKWeyFzLhF//wBYHpNujWnhFYt0ec
         OZC3Ob5rQlKyWKbPdWF2jAQCruzbnm61WIMvdpZy9XrajSO7AjIaeETyneg3ERu8X1J6
         iiQNlyFSr74U7P9ZRpZ4grs9ZENvmT2jvbndEuHmcjFXHrg9edl+kHUBX9yxGdYlh+rv
         mKT79qUrf9oiPJKulwY/SPLC47Mr8OlN0Yx64rS4kQXuOAGTKv3b/rXd28FSgynYdQND
         oI5w==
X-Gm-Message-State: APjAAAXuO1Kqqx3ey4yLLcGrMF/ZpDImE2iqFqiubmegYcs4+FfKFulS
        7iHRCB77YvIrxy0vcF8DkZQ=
X-Google-Smtp-Source: APXvYqwdV37BvbKtQUJC8YOIzREL70imDWSEU6rvapJHknci4Jx7KKf3qUcC4cUdW/+mQhl4oAIk1A==
X-Received: by 2002:a19:cc11:: with SMTP id c17mr2156146lfg.161.1580379164267;
        Thu, 30 Jan 2020 02:12:44 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id i5sm2609623ljj.29.2020.01.30.02.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 02:12:43 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1ix6oa-0000Em-0A; Thu, 30 Jan 2020 11:12:48 +0100
Date:   Thu, 30 Jan 2020 11:12:47 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] USB: serial: ir-usb: Silence harmless uninitialized
 variable warning
Message-ID: <20200130101247.GB8871@localhost>
References: <20200129173037.cvrb3lcddsml54h5@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200129173037.cvrb3lcddsml54h5@kili.mountain>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 29, 2020 at 08:30:37PM +0300, Dan Carpenter wrote:
> The "actual_length" variable might be uninitialized on some failure
> paths.  It's harmless but static analysis tools like Smatch complain
> and at runtime the UBSan tool will likely complain as well.
> 
> Fixes: e7542bc382f8 ("USB: serial: ir-usb: make set_termios synchronous")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Nice catch, I'll queue this up for 5.6-rc.

> ---
>  drivers/usb/serial/ir-usb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/ir-usb.c b/drivers/usb/serial/ir-usb.c
> index 79d0586e2b33..172261a908d8 100644
> --- a/drivers/usb/serial/ir-usb.c
> +++ b/drivers/usb/serial/ir-usb.c
> @@ -448,7 +448,7 @@ static void ir_set_termios(struct tty_struct *tty,
>  			usb_sndbulkpipe(udev, port->bulk_out_endpointAddress),
>  			transfer_buffer, 1, &actual_length, 5000);
>  	if (ret || actual_length != 1) {
> -		if (actual_length != 1)
> +		if (!ret)
>  			ret = -EIO;
>  		dev_err(&port->dev, "failed to change line speed: %d\n", ret);
>  	}

Johan
