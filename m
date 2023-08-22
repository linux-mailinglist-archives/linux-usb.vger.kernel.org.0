Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E774F78438E
	for <lists+linux-usb@lfdr.de>; Tue, 22 Aug 2023 16:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234138AbjHVOM3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Aug 2023 10:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233736AbjHVOM3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Aug 2023 10:12:29 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC415CEA
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 07:12:06 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-34bbc394fa0so3539095ab.1
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 07:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692713480; x=1693318280;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Piq4CTFv3/2l5DYXV82BcfdrtNzCa4B29gmNS+2kLWg=;
        b=ZnwCmqxUac088QnipW6j0/H3ma7gEDW8+bbgSNmFUDGMrnBGoBtVfHjT7EGY0VTYvn
         0E12AZcUl4n4lfVQCWeIEQswCHn038kW26JIszFzVDuJcgdUwLBbg2QWFLnKN3Tdos5d
         27K/yU5Te3cownFAePv/yb7BwFhHRawT6m+ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692713480; x=1693318280;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Piq4CTFv3/2l5DYXV82BcfdrtNzCa4B29gmNS+2kLWg=;
        b=SoVQyv8Hmc+cHR1PgXuq5i+pmnsWv19lpZ5nLi6IF41yb+U0Pecbd0HwV+ERe10MHw
         up/EhzXp28pLomz5Wky429Jn224R+y+AS64l3AjYDFBDb/iA/Oq9JYtqqrm6pm1accOO
         o88gwPgOOkn/DDM5+hniBOdtvXFnHPh/kMP4tPb6EtuJI4k5lv06q2jAMagYzjBfCQX0
         U6APD83BMFX08o8qJv9RNR/C+t9Q5ghYjwKhX8J9Zjo3+9HxZNhYXHidIy2USDJd3KDm
         izB/81UdaiA/AjaHoeT70x3aKAnaATUKP6Mi/jVomLYN8hYUhuPIDRhZeWelSRTGhQg0
         /YCw==
X-Gm-Message-State: AOJu0YzXnNLvX+Kn0AxKwS/w6gqpDDbftIRl+zITcP6tBgJ3zOlz0Rhc
        rTDPg6NWtNZAWgNsxtkNmu6xLPTVNC1VQD9Tcl0=
X-Google-Smtp-Source: AGHT+IEgq15GgeptdMExZwjdFEYUdtTxFyJsq2MnSgd7HH7I+omh/vIqFnyncagokmv/bDXGjfukMg==
X-Received: by 2002:a92:c6c4:0:b0:349:983c:4940 with SMTP id v4-20020a92c6c4000000b00349983c4940mr9120270ilm.1.1692713480732;
        Tue, 22 Aug 2023 07:11:20 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id fw7-20020a0566381d8700b0042b1c02d17csm3037148jab.2.2023.08.22.07.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 07:11:20 -0700 (PDT)
Message-ID: <2726b488-5cca-50c0-ea09-92fb38ba2356@linuxfoundation.org>
Date:   Tue, 22 Aug 2023 08:11:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 1/1] usbip: Use platform_device_register_full()
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230817121300.501637-1-andriy.shevchenko@linux.intel.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230817121300.501637-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/17/23 06:13, Andy Shevchenko wrote:
> The code to create the child platform device is essentially the same as
> what platform_device_register_full() does, so change over to use
> that same function to reduce duplication.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/usb/usbip/vhci_hcd.c | 42 +++++++++++-------------------------
>   1 file changed, 13 insertions(+), 29 deletions(-)
> 

Please address the following problem and send v2.

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

thanks,
-- Shuah
