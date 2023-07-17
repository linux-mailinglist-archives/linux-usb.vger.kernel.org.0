Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA91755DA5
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jul 2023 09:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbjGQH7n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jul 2023 03:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbjGQH7e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jul 2023 03:59:34 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 489E310F
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 00:59:33 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbc12181b6so44058655e9.2
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 00:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689580772; x=1692172772;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f65L06gbFrKHxS83TTCwRU9AqV0nAbAPQwTAVUkVeVo=;
        b=uw6ye23Rqfp3pCqe6MyHbosc/p/RzSBMaSxQ9ewY5hf6BXEScK8uIcJx+AW94HfeQU
         nYxFkQsLJ/loxj7IZwmxFHvQLwD34mob7wOprHNiznQ7eqGXub98q11OiMSGnB/yExCE
         G147PhwhGeHc1auckNTATsWmffu4m3uHcWwskKgDsnFkF7nWZ/xONheRmGpB4yR+iMX8
         Obk83TLRMMlgq25yV/Z11dIJXpPQbraGxSEy743BlPyHIn+n69otB7OMjNM/3/zwKudf
         kKaLE0wkYlKeXj/PU5fZ/QX7bGzRZpWXtqf2vxURDYurW5tkl9FfBDDfD6mxhQxy5ZHc
         HC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689580772; x=1692172772;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f65L06gbFrKHxS83TTCwRU9AqV0nAbAPQwTAVUkVeVo=;
        b=YLxMjAyg8X0R7hHpuR7xMT3q1HvXTJD1J3XWuSmA+Rg4cEOtf/lh7YHmqkcppI6JjF
         tROmKwqdFQ9NceM6Vbx0772wTETnpy9chstsuujXN/LC4v+w2pwpwJvkeQnA1mTa3UFb
         Zl3rAs6dEInCc0Kx7slTVSLa063B2Ynz8Wjz1sAGqrUTZFH2IXLDqsr+34CTxU+MQr+Q
         EkwOlcIUZFpZUB61DcvVMMmqKnkItXd7XKq4kFPys077W13yf84wue55ycPRBniXtU10
         x7QcKkq9BrRKAcps8FQEsZIEQ36QbXSu2XETdkS1+2ozKa0v/mroZh7aXx43S/homiW4
         w4rA==
X-Gm-Message-State: ABy/qLZNQYP3h+vqgjIvoCjJrICyIF17ABIq34myMPFJjgKVUpujf6ae
        T9K3PJHOfymGWkLdY7uVFPGPiQ==
X-Google-Smtp-Source: APBJJlFQlfYBTUFmTBJsxAfm6tlv+4JE29IQG0DVo4gcJYb8veRdJfETc1pWPi57sjh6sN+U7Z5X+A==
X-Received: by 2002:a1c:7502:0:b0:3fb:d81a:8b4 with SMTP id o2-20020a1c7502000000b003fbd81a08b4mr10383228wmc.16.1689580771726;
        Mon, 17 Jul 2023 00:59:31 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.144.39])
        by smtp.gmail.com with ESMTPSA id c22-20020a05600c0ad600b003fc01495383sm7303733wmr.6.2023.07.17.00.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 00:59:31 -0700 (PDT)
Message-ID: <004bd252-ea93-fcb4-84d9-7c58c5417ce4@linaro.org>
Date:   Mon, 17 Jul 2023 09:59:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v4 5/6] usb: dwc3: dwc3-octeon: Dump control register on
 clock init failure
Content-Language: en-US
To:     Ladislav Michl <oss-lists@triops.cz>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
References: <ZLP7CSUm095ADtdw@lenoch> <ZLP73wvnW8Ke+7RB@lenoch>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZLP73wvnW8Ke+7RB@lenoch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 16/7/23 16:17, Ladislav Michl wrote:
> From: Ladislav Michl <ladis@linux-mips.org>
> 
> It might be interesting to know control register value in case
> clock fails to enable.
> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> ---
>   CHANGES:
>   - v4: new patch
> 
>   drivers/usb/dwc3/dwc3-octeon.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

