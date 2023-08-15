Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3834F77D55A
	for <lists+linux-usb@lfdr.de>; Tue, 15 Aug 2023 23:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235699AbjHOVrF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Aug 2023 17:47:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240270AbjHOVqy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Aug 2023 17:46:54 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC7A1FC3
        for <linux-usb@vger.kernel.org>; Tue, 15 Aug 2023 14:46:54 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-790b6761117so47803639f.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Aug 2023 14:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692136013; x=1692740813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=du1E7cAve/Q4zB0LIF3jRqBwzrZpF69Tr2scqLkgRRw=;
        b=acENcSQCgcpVwiHrl4Jra4hfhOgNUFMFWrIeTr4++HQWSqq++h3OHVBQqgCuznkQOZ
         i+7R3+AnTw+yXQRsVBh4Coi/mRTsy1SF2m+VXCYS8OdtRcr8i14niMGAH3kzAvBeWV8u
         4CaWksX2krLRFts321AWtqLTcQUcGQJFYSWJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692136013; x=1692740813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=du1E7cAve/Q4zB0LIF3jRqBwzrZpF69Tr2scqLkgRRw=;
        b=EWPwocE5e05PNsj+Hxp6wc4IvL8iF5pPtt14GTjz4RT56OHj0Q0MtThBfVBrtZJLAs
         CatdqxR62CfXXU/sdF8lHVB27sBhmn3bM00ysO/Bn1jh9aESqrUcy3VD5hRchZ7mh4cZ
         T9KIQySSQzQxDmIfwpoRPHBeL7vuvtVV6FeWc3uVEJGHuIUZwXmJjXG+OJZz6AS9LJt3
         OOvfd8+gYGWkfwgqglOxwC+w7jCrWYQF18qz0+g8Xpx/JflX7hHstBJUgP85DKne7XTy
         zjl/L5S/IGjJR6V0p6/Dqy0VzVP2n9Dn/JYhEy4+2g8fY9+9xrobYvqX5PFd+Caeieb1
         3Zzg==
X-Gm-Message-State: AOJu0YxBEQj+9oHVfBELmnh8XFXs6njNkY5M6knpLM8+pXlnkeeLOU9D
        dIH940uPCu1MXfdWm/fueWYUoQ==
X-Google-Smtp-Source: AGHT+IEowuuOaVE7iD+wTF5ydeHS/7XRzJj/oQd28ez0/q3KrXGeJeWq+uTxF0CK75JNAwQ0AXemBg==
X-Received: by 2002:a92:c951:0:b0:349:1d60:7250 with SMTP id i17-20020a92c951000000b003491d607250mr237159ilq.0.1692136013302;
        Tue, 15 Aug 2023 14:46:53 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id g6-20020a02b706000000b0041d73d0a412sm3899053jam.19.2023.08.15.14.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 14:46:52 -0700 (PDT)
Message-ID: <c17d4caf-df00-ba58-cc7c-8845c48ad646@linuxfoundation.org>
Date:   Tue, 15 Aug 2023 15:46:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] usb: usbip: fix use-after-free race
Content-Language: en-US
To:     Sam Edwards <cfsworks@gmail.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230811230723.59234-1-CFSworks@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230811230723.59234-1-CFSworks@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/11/23 17:07, Sam Edwards wrote:
> stub_recv_cmd_submit() allocates a `priv` structure, which is freed by
> the TX thread after all URBs in the `priv` complete and are handled.
> This means that stub_recv_cmd_submit() effectively loses ownership of
> `priv` once the final URB is submitted: in the worst case, the RX
> thread will be preempted before usb_submit_urb() returns, and the TX
> thread will do all handling and cleanup before the RX thread resumes.
> 

How did you find this problem? Please add the details in the change
log and also please describe the fix in detail.

This patch changes for loop from looping on priv->num_urbs to
num_urbs. Change looks okay to me. I do want to know how you found
the problem.

> We don't lose ownership if usb_submit_urb() returns an error value,
> since that means it won't eventually call stub_complete(), so the
> error-handling `usbip_dump_urb(priv->urbs[i])` is still safe.
> 

Did you happen to track down where this urb gets free'd after
usbip_dump_urb(priv->urbs[i])
  
> Signed-off-by: Sam Edwards <CFSworks@gmail.com>
> ---
>   drivers/usb/usbip/stub_rx.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
> index fc01b31bbb87..dba9a64830e6 100644
> --- a/drivers/usb/usbip/stub_rx.c
> +++ b/drivers/usb/usbip/stub_rx.c
> @@ -592,8 +592,11 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
>   	if (usbip_recv_iso(ud, priv->urbs[0]) < 0)
>   		return;
>   
> -	/* urb is now ready to submit */
> -	for (i = 0; i < priv->num_urbs; i++) {
> +	/*
> +	 * URB(s) are now ready to submit.
> +	 * Note: priv is freed after the last URB is (successfully) submitted.
> +	 */
> +	for (i = 0; i < num_urbs; i++) {
>   		ret = usb_submit_urb(priv->urbs[i], GFP_KERNEL);
>   
>   		if (ret == 0)

thanks,
-- Shuah
