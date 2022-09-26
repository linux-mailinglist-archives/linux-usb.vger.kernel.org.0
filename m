Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFD315EB0FE
	for <lists+linux-usb@lfdr.de>; Mon, 26 Sep 2022 21:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbiIZTMs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Sep 2022 15:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbiIZTMq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Sep 2022 15:12:46 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D730A95532
        for <linux-usb@vger.kernel.org>; Mon, 26 Sep 2022 12:12:44 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 10so12423725lfy.5
        for <linux-usb@vger.kernel.org>; Mon, 26 Sep 2022 12:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date;
        bh=EthUwzlxYLsQqKUG3IVFYjIYXHSaYda4GC4W4WwVo4M=;
        b=MNi6dEdRnVa2/Kqn+n0vMumJRuHaDs3znjHr1DBtDk2Kbxmjybuchzqkihg5GEzl+i
         vsm0bqm3SrrcwCAbiNPIYoiI8T4ixRLXcRdvm2WjXZbl5/qE6w7eS+7NbHOGQKUspble
         E0DcnihmwP5E36565zogogyBMqfFJE/0QIxXfaVIZ0HrocF3SiEHPEDPxotfMPYHLjQ+
         zHbioL73w+Gq/i+u6IuOdHmBjPzPCOXbMvIVmdYE8Rq05+XS1KwJ0GgKw0IRW2Uy78hV
         UxqWWrueKwMUsLuuG6LVnvytuBfCE61fJTfd4hDI77Ss+7jKxW37DQVbj7+fe+Dn1s7G
         VngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date;
        bh=EthUwzlxYLsQqKUG3IVFYjIYXHSaYda4GC4W4WwVo4M=;
        b=cxBoLG4dQAL+z7ayxASzRkBcaYn65A9ToorOG1B2duLalcAZZNkLVcxadytIORVX1j
         Wts1ybktKhQ15b/gcLd3te3TxM0w7wRFi7adtux5h/C0MRnB/VCuOKFpgyvkt9ug6Rju
         1mjQ6X0RmdshGLDtOPLnWykcgX9ZzpPH97XpBld4mVtcUlg5Y/a0pNS95ywex+wRzjC8
         dWnUXHTdVAjG6UyNNbVFxEQwWlH4ZEBkktZVEclNQvTIuPyk0IBjCKW3beuX2lzWQGZR
         6S0nSjQO+iskwJfU1mKdgGmzmMqKMtI3zj5oti5sNf/KH9y7UdkWa9SjcPahsaFyky8w
         EXjA==
X-Gm-Message-State: ACrzQf2jkWnRhZV5dMPhzSx2A79oZ97yi0JT8kmgvfUxIA5frqNdjwjq
        DoW9i6vimCuNeldsFcEKLd8=
X-Google-Smtp-Source: AMsMyM48O1H2brYUk9uJMYy0QHn8GmNKF6jMflGkY8c6+h46zEkEEWbz2c+YGz/BQzcXi2vYwigCyQ==
X-Received: by 2002:a05:6512:3187:b0:49e:6607:3a75 with SMTP id i7-20020a056512318700b0049e66073a75mr9023147lfe.28.1664219563042;
        Mon, 26 Sep 2022 12:12:43 -0700 (PDT)
Received: from [192.168.1.103] ([178.176.72.166])
        by smtp.gmail.com with ESMTPSA id j2-20020ac25502000000b0049c29292250sm2603806lfk.149.2022.09.26.12.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 12:12:42 -0700 (PDT)
Subject: Re: [PATCH -next resend 1/5] usb: musb: core: Switch to use
 dev_err_probe() helper
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, b-liu@ti.com
References: <20220926141510.2265523-1-yangyingliang@huawei.com>
 <20220926141510.2265523-2-yangyingliang@huawei.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <6d8b99a0-f12b-caaa-5fcd-a7a4a7d6e219@gmail.com>
Date:   Mon, 26 Sep 2022 22:12:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220926141510.2265523-2-yangyingliang@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 9/26/22 5:15 PM, Yang Yingliang wrote:

> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs. It's more simple in error path.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/usb/musb/musb_core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
> index bbbcfd49fb35..37ef9d8cb8ea 100644
> --- a/drivers/usb/musb/musb_core.c
> +++ b/drivers/usb/musb/musb_core.c
> @@ -2595,9 +2595,8 @@ musb_init_controller(struct device *dev, int nIrq, void __iomem *ctrl)
>  	musb_platform_exit(musb);
>  
>  fail1:
> -	if (status != -EPROBE_DEFER)
> -		dev_err(musb->controller,
> -			"%s failed with status %d\n", __func__, status);
> +	dev_err_probe(musb->controller, status,
> +		      "%s failed with status\n", __func__);

   Printing "with status" when you no longer print the status itself has no sense.

[...]

MBR, Sergey
