Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A758E4FE915
	for <lists+linux-usb@lfdr.de>; Tue, 12 Apr 2022 21:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiDLTua (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Apr 2022 15:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235970AbiDLTti (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Apr 2022 15:49:38 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A365132B
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 12:45:26 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id x9so14277701ilc.3
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 12:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lI0DuedsQHcN01LBgrdT+YVmpU3arY8lVii4JFtG1w8=;
        b=CF8ERvasaqRtr6QctYSXMMDaKLWFXxgaIDppF2alKAETk9w596Uva0AQKBrJIlcJYx
         ATa/WwbDL2uvj5V3EqKt0BeoTtRouwsGiiQDHtyEulFW4hyc2YNwtRd9UPx0HKcs25rI
         650ADfAr+YmuAC+/Oxm1yBBOihUAmsIDqlHzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lI0DuedsQHcN01LBgrdT+YVmpU3arY8lVii4JFtG1w8=;
        b=qYpzn5ERsHpCcSbLdjQzVbM8OGEruN1Ustj694K9s5Y5UZ2HuT2pgjHsyqJA0HTYJP
         ixb8gstkMrIuMGP7ahrOhGgtAoiqS7g9MCHM9fO5KdodBgeVTaQS5G2V76ppqMbp8TsR
         l7ZhdHUG0WCwTdOspc/UH/Iqm6HWN2tHYffiEbRNyK9le/FVkgJ8nuugpIKuw7unCHKI
         w45N0Kal8eYVjCe6rx+caMOBjfRnCndvL6P1CoURzAyCRJ9xEs+Q1lAyX5d/SC7iGgpk
         bYRgeuLLJfqdB59B8NQYMkZRa/UV1SM3ZxJziH/Xne3NuI3NmMOzwCZzTMlWqVWvJlwp
         66ig==
X-Gm-Message-State: AOAM53150xomuMSoaOvsDTnJIawq9lMuDLtpqPGpJPU/7WKMkC4FA3zS
        Nw6PlQIpT2ntR26AdMROQCxqNWszHAOJYA==
X-Google-Smtp-Source: ABdhPJz9q8FJRllKE/YAIqAju4CLS0OQAjaDRjLIV4vWlDjFldVOfkz/UDXdZhMC6DC979EmqriS9A==
X-Received: by 2002:a05:6e02:1905:b0:2c9:e728:46f3 with SMTP id w5-20020a056e02190500b002c9e72846f3mr18135225ilu.213.1649792725429;
        Tue, 12 Apr 2022 12:45:25 -0700 (PDT)
Received: from [192.168.1.128] ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id b1-20020a92a041000000b002c8214b2f65sm20828291ilm.61.2022.04.12.12.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 12:45:24 -0700 (PDT)
Subject: Re: [PATCH] usb: usbip: add missing device lock on tweak
 configuration cmd
To:     Niels Dossche <dossche.niels@gmail.com>, linux-usb@vger.kernel.org
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220412165055.257113-1-dossche.niels@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <4cd1d9ab-de37-f596-e0c2-f4042d22eb94@linuxfoundation.org>
Date:   Tue, 12 Apr 2022 13:45:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220412165055.257113-1-dossche.niels@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/12/22 10:50 AM, Niels Dossche wrote:
> The function documentation of usb_set_configuration says that its
> callers should hold the device lock. This lock is held for all
> callsites except tweak_set_configuration_cmd. The code path can be
> executed for example when attaching a remote USB device.
> The solution is to surround the call by the device lock.
> 
> This bug was found using my experimental own-developed static analysis
> tool, which reported the missing lock on v5.17.2. I manually verified
> this bug report by doing code review as well. I runtime checked that
> the required lock is not held. I compiled and runtime tested this on
> x86_64 with a USB mouse. After applying this patch, my analyser no
> longer reports this potential bug.
> 

How did you run-time check that the lock isn't held? Also x86_64 with a
USB mouse - did you test it over loopback?

> Fixes: 2c8c98158946 ("staging: usbip: let client choose device configuration")
> Signed-off-by: Niels Dossche <dossche.niels@gmail.com>
> ---
> 
> I'm developing this tool as part of my master's dissertation in order to
> obtain my master's degree. If you'd like more information about the
> details of the tool, please let me know.
> 
>   drivers/usb/usbip/stub_rx.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
> index 325c22008e53..5dd41e8215e0 100644
> --- a/drivers/usb/usbip/stub_rx.c
> +++ b/drivers/usb/usbip/stub_rx.c
> @@ -138,7 +138,9 @@ static int tweak_set_configuration_cmd(struct urb *urb)
>   	req = (struct usb_ctrlrequest *) urb->setup_packet;
>   	config = le16_to_cpu(req->wValue);
>   
> +	usb_lock_device(sdev->udev);
>   	err = usb_set_configuration(sdev->udev, config);
> +	usb_unlock_device(sdev->udev);
>   	if (err && err != -ENODEV)
>   		dev_err(&sdev->udev->dev, "can't set config #%d, error %d\n",
>   			config, err);
> 

Looks good to me with the above questions answered.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, please pick this patch up.

thanks,
-- Shuah
