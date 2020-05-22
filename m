Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 346DB1DE2A1
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2020 11:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729353AbgEVJKq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 May 2020 05:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728368AbgEVJKq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 May 2020 05:10:46 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B3AC061A0E
        for <linux-usb@vger.kernel.org>; Fri, 22 May 2020 02:10:45 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id z18so11711528lji.12
        for <linux-usb@vger.kernel.org>; Fri, 22 May 2020 02:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9ofTQmEmfXkUcuVidw/3/uTdX1nNZlN27Kc/a5adlBE=;
        b=xos9xnl9YZMdIx1d5mCEq3WAxSwvc5UCDqkmUO2+7x7I2+vGVPF21hwGBtxoXZCbzN
         BfTzYnkM3jf1GNsGMpQwEhZJU19G76BgsR6WIkEl8q8ipZmtiT3LJZ5dylbF6sPZvy/g
         iPD32Jwa+lXfjf9Z+JcRgthh+JjV/VaPn5w8qYW4qmZxbnjKhEaS6EVD1kwklB7PIOrU
         VVV3ngvcL9YBwXPHqqtmnNfpJC+FTzpzuGe4RsqkkeXWDTqNFR6M3t10HoO2emoGSdv8
         tR623mcE5V6xS7Em0K0KHrKx8XzwmkbnL6Aek+bllgxrfNKJZ7HYyZyZ/80/A7wWMmJx
         UXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9ofTQmEmfXkUcuVidw/3/uTdX1nNZlN27Kc/a5adlBE=;
        b=rVgDz8c4j8A+NjbiB1T65TZ7RQeJQoj/GnJv7xW5FnSKgA8SrKF31EKtWjvwHdnxjV
         4XzY8wu/7gbRZHULu5TFBR6LnvaSrkBIxBbq8/+4Swioe8njzCDgp0+4kECk6DdC2Zyd
         qLcS7curBTzIMwzxHnqmy0yUM2dkPLTxvLvUo+Xe6mmrLlBv/t8BimbejfQUOKWgn8BD
         3Ph6s/GupkZ0+96RNACtqtqzCJMHhz4Lyq0sDV6anuoFqXgRzi5mmPz1sCAU3pJMwoWv
         Wu8fNirDwEi2oFrIeRaNv9AIjBohsse6tdOpzybl1HiRko5fvCVh94t3bPvYDSeVDOQ+
         2ARw==
X-Gm-Message-State: AOAM530vZQGL66sjI7suE0fWahfHe3ev+tGJbe0nnsimqrFNlf87NA1/
        WUuS2VCZCphXEivoFYjmNRsHqw==
X-Google-Smtp-Source: ABdhPJwx2PlbH43Qr+B81OY6kvWskKdV/Ban2ix6W7cw/0cV2HmXGusEjLn7mThOr7LFWA4sajYdwA==
X-Received: by 2002:a2e:851a:: with SMTP id j26mr6763722lji.287.1590138644148;
        Fri, 22 May 2020 02:10:44 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:469e:f842:7427:5f3b:8fe0:cf58? ([2a00:1fa0:469e:f842:7427:5f3b:8fe0:cf58])
        by smtp.gmail.com with ESMTPSA id u3sm2297273lfq.59.2020.05.22.02.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 02:10:43 -0700 (PDT)
Subject: Re: [PATCH] usb: bdc: Fix return value of bdc_probe()
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
References: <1590135456-11176-1-git-send-email-yangtiezhu@loongson.cn>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <94e58d73-0691-ddbc-3c75-1c7ee87d1216@cogentembedded.com>
Date:   Fri, 22 May 2020 12:10:29 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1590135456-11176-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 22.05.2020 11:17, Tiezhu Yang wrote:

> When call function devm_platform_ioremap_resource(), we should use IS_ERR()
> to check the return value

    Already done.

> and return PTR_ERR() if failed.

   Yes, else the deferred probing doesn't work.

> Fixes: 893a66d34298 ("usb: bdc: use devm_platform_ioremap_resource() to simplify code")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
[...]

MBR, Sergei
