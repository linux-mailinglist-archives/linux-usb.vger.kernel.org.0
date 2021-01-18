Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 480C02F9C5D
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 11:34:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388160AbhARJDh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 04:03:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388255AbhARJD0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Jan 2021 04:03:26 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC20C061573
        for <linux-usb@vger.kernel.org>; Mon, 18 Jan 2021 01:02:26 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id o13so22984926lfr.3
        for <linux-usb@vger.kernel.org>; Mon, 18 Jan 2021 01:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7wbELFIpfPOA7MKqTZEd+cvB8+gvwyBUzmNJvfGsXHc=;
        b=CUbIiWFQaOO7uJaYDX5DxjuPidkz+JhAwhJU3mEMXmE6bysduHg9qj8kEOAmrcohA+
         tIrXT4qzQ49hWrYTRtS40gMZvg5nr65frqLXliibs/30de0b/5uXPB7X70Z7jA8XgRUB
         6mwQ0VVt05Cj0RjhEs1eGl5N2PPKF5v1Af7Z3RdVswshy983W4mrWHB6KGVKuUGHVxub
         4Wdz33w01tH+CvbusBmfC0Gh0l6crBWiy0vJ+QsXkCWZafkLrPWR4xXvt3ScO+xZ/KeY
         skw4pNwvAQS39E9f7pyFLaNmQTy2itZpSmnnwz53LQczFMNCPLhqkXKRe0P+KhLXOy/h
         u0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7wbELFIpfPOA7MKqTZEd+cvB8+gvwyBUzmNJvfGsXHc=;
        b=h65Et8V+JP5eahaGO07oBUzOiCFvsFeSeUaCYB84Wv4qoo1RYwj8C349TBDPHMlQrp
         M6rTjtNss689tQn5828jeNts9sOCaJ6LOGDgnzdUIZM29Pwu/qxtk7RtGDLCCyCcP8OO
         lPq04eQwgOy/d8bVE8qzAJuvIUieqFEtImOodqEWtCmu2WRmDDezXk5douthYznFa7cV
         3Tn5MqaWegux/fEnCZzcgoRpFIlNglWZZA1IcLYtHBAp6glwEko2kgicujXOTBI+XaKI
         WNnHQdHB5Vz6E75ad7ECNma3TMSF9TDqDddLGxSA9yS5mKznTfPNr1lZJPWRBo3DulZX
         i/kA==
X-Gm-Message-State: AOAM531q+Nu8egx5cQ912on7hFecUMzQUBjBAdCgyC1HOTuQF8GtZ4zN
        Gz7E2IuctPtMZZnJORs0+34hQDso2iQ=
X-Google-Smtp-Source: ABdhPJxFWb2bo216JfrOeDzeLApewxIQiNR2hSqIqXm8eXIfF2HMJyms1VwtI+An60lIfKBKOMHQAw==
X-Received: by 2002:a19:7e89:: with SMTP id z131mr10446259lfc.2.1610960544361;
        Mon, 18 Jan 2021 01:02:24 -0800 (PST)
Received: from [192.168.1.100] ([178.176.74.112])
        by smtp.gmail.com with ESMTPSA id k11sm1821707lfd.3.2021.01.18.01.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 01:02:23 -0800 (PST)
Subject: Re: [PATCH] USB: usblp: add USBLP_QUIRK_NO_SET_INTF flag
To:     Jeremy Figgins <kernel@jeremyfiggins.com>, zaitcev@redhat.com,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <YASt5wgOCkXhH2Dv@watson>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <b86d1b77-602f-b365-533c-f6fc398fb717@gmail.com>
Date:   Mon, 18 Jan 2021 12:02:19 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YASt5wgOCkXhH2Dv@watson>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 18.01.2021 0:36, Jeremy Figgins wrote:

> Certain devices such as Winbond Virtual Com Port,
> which is used in some usb printers, will stop
> responding after the usb_control_msg_send()

    Hm, not usblp_set_protocol()?

> calls in usb_set_interface(). These devices work
> fine without having usb_set_interface() called, so
> this flag prevents that call.
> 
> The naming is designed to mirror the existing
> USB_QUIRK_NO_SET_INTF flag, but that flag is
> not sufficient to make these devices work.

    Perhaps the handling of that flag should just be extended to yuor case?

>  Signed-off-by: Jeremy Figgins <kernel@jeremyfiggins.com>
> ---
>   drivers/usb/class/usblp.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
> index 134dc2005ce9..6e2d58813d7d 100644
> --- a/drivers/usb/class/usblp.c
> +++ b/drivers/usb/class/usblp.c
[...]
> @@ -1332,7 +1334,11 @@ static int usblp_set_protocol(struct usblp *usblp, int protocol)
>   	alts = usblp->protocol[protocol].alt_setting;
>   	if (alts < 0)
>   		return -EINVAL;
> -	r = usb_set_interface(usblp->dev, usblp->ifnum, alts);
> +	if (usblp->quirks & USBLP_QUIRK_NO_SET_INTF) {
> +		r = 0;
> +	} else {
> +		r = usb_set_interface(usblp->dev, usblp->ifnum, alts);
> +	}

    The braces above not needed at all.

[...]

MBR, Sergei
