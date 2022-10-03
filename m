Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E38B15F346C
	for <lists+linux-usb@lfdr.de>; Mon,  3 Oct 2022 19:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbiJCRZl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Oct 2022 13:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbiJCRZf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Oct 2022 13:25:35 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9EC21903C
        for <linux-usb@vger.kernel.org>; Mon,  3 Oct 2022 10:25:23 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id g8so8640148iob.0
        for <linux-usb@vger.kernel.org>; Mon, 03 Oct 2022 10:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=uHhy6Jg3zMfJGE1Aiq68C50cMelSnMbHfiQZVPiv3lM=;
        b=aAoE1gQAM5DuoOhZoI/mgXg4+r6L6Nd2lolLxTNjNlENJXj7XivtBqYyJ4X+V1nUXS
         uk4FHBan3ij7H9s9UqjVGxhZ4b/SIALEwK8J37TsGuCDsdv9Eq1K1RD4rIKBr6gYTMol
         SHUndQ5hC2sswN2D4hbqxOurBp8oJFCI5Vllg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=uHhy6Jg3zMfJGE1Aiq68C50cMelSnMbHfiQZVPiv3lM=;
        b=d1/ffIaJ3FXt+xZkQjRDV/ZyLf6gcFECxCRKPlCWMW/chbIQI0yuK45V8Arnx7ikLP
         85VEdO3c+wLJL1FrxjlDBkg0kdq6YoyiUSimVqWKrSpA8g3mk2DKOdSgUQvB+jpSLs89
         DD5E697ZZp6y76ah57q16wSOvBPoCxa7BBsDLPkXR+hQnrdCYVX5jJxzMpoNKktSfilS
         Ts0X63VVqavcHgSX11QeUgw7EwkNF0L+duxu5YbzJNZqHBdmq6VYBviy/TIxdDlCxbuU
         DXncnynbFMY+z4uPmjl68h0lFh/tt/3lu1iQfts9P5/sP6UU7I5RmPZql2nQ91/EenIR
         Lvdg==
X-Gm-Message-State: ACrzQf0Ua2vsRxOIR2hIoo8PxyAjaR7W9GlChqoiTJmHT9LGuLXTDR/g
        VeIHiOYQu6RTJBeQkcP05Dk4Qg==
X-Google-Smtp-Source: AMsMyM5z04d7SH8W3EkWIX1r1t4XHuhQ448rQNNUKtZmkcn2ZYt8s0fDl8VQ0XCNQuNbzeZl5BtH+Q==
X-Received: by 2002:a05:6638:2105:b0:363:3105:9199 with SMTP id n5-20020a056638210500b0036331059199mr3160904jaj.117.1664817923101;
        Mon, 03 Oct 2022 10:25:23 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id g21-20020a05663810f500b003634653f1bbsm264203jae.106.2022.10.03.10.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 10:25:22 -0700 (PDT)
Message-ID: <de1c3a1a-4884-fc92-96ec-f8a06a8a5647@linuxfoundation.org>
Date:   Mon, 3 Oct 2022 11:25:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] USB: usbip: missing lock in stub down
Content-Language: en-US
To:     Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
        valentina.manea.m@gmail.com, shuah@kernel.org,
        linux-usb@vger.kernel.org
References: <20221003091016.641900-1-jtornosm@redhat.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20221003091016.641900-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/3/22 03:10, Jose Ignacio Tornos Martinez wrote:
> Missing lock in sysfs operation when we want to close the connection in order
> to check the status and send the down event in a safe way.
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
>   drivers/usb/usbip/stub_dev.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/usbip/stub_dev.c b/drivers/usb/usbip/stub_dev.c
> index 3c6d452e3bf4..b4b452ce7120 100644
> --- a/drivers/usb/usbip/stub_dev.c
> +++ b/drivers/usb/usbip/stub_dev.c
> @@ -118,6 +118,8 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
>   	} else {
>   		dev_info(dev, "stub down\n");
>   
> +		mutex_lock(&sdev->ud.sysfs_lock);
> +
>   		spin_lock_irq(&sdev->ud.lock);
>   		if (sdev->ud.status != SDEV_ST_USED)
>   			goto err;

The change looks good to me. Please run get_miantainers.pl
to include all the maintainers in the future.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, Please pick this up.

thanks,
-- Shuah
