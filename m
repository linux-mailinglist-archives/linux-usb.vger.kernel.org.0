Return-Path: <linux-usb+bounces-1217-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F4A7BBFC9
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 21:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D0651C209AA
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 19:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C889B405F6;
	Fri,  6 Oct 2023 19:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J7uxfpAO"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E093FB29
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 19:43:43 +0000 (UTC)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE7CD95
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 12:43:42 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-34f69780037so2937135ab.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Oct 2023 12:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696621422; x=1697226222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N7YYLqQKEBxYGYHN/5uoJBXyuFdtBHM7nG76jzEtpXc=;
        b=J7uxfpAOJSzQp/vQtHYW0xVpSQ1sRSs4Y0yC+ZJPNsPZgGtSXLJMybPbIHzNH5npOL
         kYhJ/JEeWZGMxK/GpIutH2TFVLw3HbDmr3RkqNf8wifhfle6TaUoYWK7d5Ks3srUZO1e
         0YiF7BJQsGux8Do3OdOp7pIo4j1cxBlT3hYw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696621422; x=1697226222;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N7YYLqQKEBxYGYHN/5uoJBXyuFdtBHM7nG76jzEtpXc=;
        b=AFnB5DEkLNLbZEMsOwp8vuUpX0Jr3HSbZpluB4sn3emYEvH+PveC1N7AiL0oAi5NPH
         H7kpDRvUxR5tdfQbLDzN13cOXxk6m2vhrXHFLwiTuHLPrMJS0/aStFQ+jf2OQ74TDmwf
         YdIpX7xUgFRh4AZ7/jzJnoSIha4XPwDIwWh8L+dL4k5eJR44h4oH2kt5y8nzLenb2Wg/
         yr9L4+VYftDGYc6BTyc4w+8nikeZtAlDdAxT1cWIbL6B8xRckrpm/vsQk0uyvDIjP6JY
         0E/nQy/5SUrJM0JfAgEAxe+QQ5vT3uno6QWeC0NjqmOA0lgBMlTaZ4uYQOJB0puysv5z
         R6oQ==
X-Gm-Message-State: AOJu0Yxl2LS4fLrBMG8IOwJ3cjmlmAukXEAYzLqaDd4A5QxySmAh5wlK
	NzGiJcBgMHFnh304iVMei7OBmGj1ydraxQV+qMs=
X-Google-Smtp-Source: AGHT+IH8S+W4GcBgA8b7s2M/grRMn193p8+srz/4y0+Oit8CvMkRb+3GUpCbZJdp3ZEo6R8stxI0wQ==
X-Received: by 2002:a05:6602:368c:b0:792:7c78:55be with SMTP id bf12-20020a056602368c00b007927c7855bemr8827149iob.0.1696621422104;
        Fri, 06 Oct 2023 12:43:42 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id s12-20020a5eaa0c000000b0078754bed499sm749769ioe.37.2023.10.06.12.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 12:43:41 -0700 (PDT)
Message-ID: <d8437b59-552b-4ea5-9400-07535c200560@linuxfoundation.org>
Date: Fri, 6 Oct 2023 13:43:40 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] usbip: Use platform_device_register_full()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20231006164312.3528524-1-andriy.shevchenko@linux.intel.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231006164312.3528524-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 10/6/23 10:43, Andy Shevchenko wrote:
> The code to create the child platform device is essentially the same as
> what platform_device_register_full() does, so change over to use
> that same function to reduce duplication.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: (hopefully) fixed run-time NULL-dereference (LKP)
>   drivers/usb/usbip/vhci_hcd.c | 55 +++++++++++++-----------------------
>   1 file changed, 20 insertions(+), 35 deletions(-)
> 

Looks good to me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah


