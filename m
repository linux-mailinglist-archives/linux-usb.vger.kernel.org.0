Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 058D7677764
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jan 2023 10:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbjAWJ25 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Jan 2023 04:28:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjAWJ24 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Jan 2023 04:28:56 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2753D193DC
        for <linux-usb@vger.kernel.org>; Mon, 23 Jan 2023 01:28:55 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id d30so17203542lfv.8
        for <linux-usb@vger.kernel.org>; Mon, 23 Jan 2023 01:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riwGohdwIs67nJHMrftdXiKlM6Mmg+3JXhbTt0YvsJk=;
        b=iC48eqlMArvLDXLFAD/gbIp1sczYv36emFZKs+9/KjVpImZWn6yUt4TuCH85NON7GA
         JHmbYrlqrL8gmthUwYCFIU2squ/3fzTct3hYY9kKV85fBpZpJDHKPe5VO57Sp+2x87RP
         5vDeh+fPVi4VvGd0eVFKIYCrVP0A+6HzZhIeMl9RgF83bMa2GebnUFH0Yt07+BZv8KOU
         30+k0ySp46ZhpXsUt2g16pkDCVDlUhuYtoitA0SFbAtj9/5r+eEz0ETjhc2eaKn41h13
         k7T04PUWJVFQaA1ey2V0IjSG450/+kxo94cFVVmYk4IM8XYulvH0mevpxz/l82Bltea2
         GFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=riwGohdwIs67nJHMrftdXiKlM6Mmg+3JXhbTt0YvsJk=;
        b=te/cVIyUasiENxtfSCd1FCUhNgdKn2OZIQWtySoFGhEDaQybKnDIMyTKiBmGxJy1pM
         4I3Vg7KK6XkdHKYpkGgiqMR7RDsQUbbtwmi2G4wexAyT1NEbuByXlWvSdTaVBGF2F6wD
         Nh/p/tYGyaJAcECQL2GDiysPzxnmi0HoOowukTpnafuANE4GAI3vfxTloGRbjmf7evxs
         Wuf0RMRfd6lOZp5HXoRccU+4qDgYKz2Iw9fcgr4cvgXQhDyZeRRwT+PDjsK4Ai0wsl7L
         Mrboas4dAFmM3HQEt8BfGKxA7S5u53QgC1QtSQ2bKkRkbDfbg1lYaf/C8ZjzhJetCT94
         vrPg==
X-Gm-Message-State: AFqh2kr7snNnyZscS9ob/Zi046E+aIn0SqWm9b8sQ+WZxyfmxeocq5RT
        oBZV07RL9RzLvZSS/yuPb+4=
X-Google-Smtp-Source: AMrXdXtUB88vEhL2Fz3KO/T0iXLCo7GxcuVn76qVFOQpCXGeopzxV5rwMXrQBTbn+LQmj3h/fLqqIw==
X-Received: by 2002:ac2:5f04:0:b0:4cc:7b49:a2f6 with SMTP id 4-20020ac25f04000000b004cc7b49a2f6mr5005728lfq.19.1674466133312;
        Mon, 23 Jan 2023 01:28:53 -0800 (PST)
Received: from [192.168.1.103] ([178.176.75.56])
        by smtp.gmail.com with ESMTPSA id i6-20020ac25b46000000b004cb1b4634edsm6454546lfp.194.2023.01.23.01.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 01:28:52 -0800 (PST)
Subject: Re: [PATCH 1/3] fotg210-udc: Add missing completion handler
To:     Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Fabian Vogt <fabian@ritter-vogt.de>
References: <20230123073508.2350402-1-linus.walleij@linaro.org>
 <20230123073508.2350402-2-linus.walleij@linaro.org>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <18225c0c-de37-7e01-2176-1c8e653ffb6c@gmail.com>
Date:   Mon, 23 Jan 2023 12:28:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20230123073508.2350402-2-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 1/23/23 10:35 AM, Linus Walleij wrote:

> From: Fabian Vogt <fabian@ritter-vogt.de>
> 
> This is used when responding to GET_STATUS requests. Without this, it
> crashes on completion.
> 
> Fixes: b84a8dee23fd ("usb: gadget: add Faraday fotg210_udc driver")
> Signed-off-by: Fabian Vogt <fabian@ritter-vogt.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/usb/fotg210/fotg210-udc.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/fotg210/fotg210-udc.c b/drivers/usb/fotg210/fotg210-udc.c
> index 754429553f61..029b31c3107b 100644
> --- a/drivers/usb/fotg210/fotg210-udc.c
> +++ b/drivers/usb/fotg210/fotg210-udc.c
> @@ -709,6 +709,20 @@ static int fotg210_is_epnstall(struct fotg210_ep *ep)
>  	return value & INOUTEPMPSR_STL_EP ? 1 : 0;
>  }
>  
> +/* For EP0 requests triggered by this driver (currently GET_STATUS response) */
> +static void fotg210_ep0_complete(struct usb_ep *_ep, struct usb_request *req)
> +{
> +	struct fotg210_ep *ep;
> +	struct fotg210_udc *fotg210;
> +
> +	ep = container_of(_ep, struct fotg210_ep, ep);
> +	fotg210 = ep->fotg210;
> +
> +	if (req->status || req->actual != req->length) {
> +		dev_warn(&fotg210->gadget.dev, "EP0 request failed: %d\n", req->status);
> +	}

   Why {} here?

> +}
> +
>  static void fotg210_get_status(struct fotg210_udc *fotg210,
>  				struct usb_ctrlrequest *ctrl)
>  {
[...]

MBR, Sergey
