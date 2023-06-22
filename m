Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91C5473A50D
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jun 2023 17:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbjFVPcL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jun 2023 11:32:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231650AbjFVPbx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Jun 2023 11:31:53 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2DBC2D62
        for <linux-usb@vger.kernel.org>; Thu, 22 Jun 2023 08:30:38 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-7747cc8bea0so66934239f.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Jun 2023 08:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687447834; x=1690039834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=it9RfQZoHvlt4i7NjPP7j9e/je2l7GBneNbO1SZ/LaE=;
        b=U5QSUgYjwQQ92kt5FvG2tHnBkSv+41vonZTo2+NgsxvSzPMREYwFv0DYVpKWYIpaL8
         hQ/HAFNBnaXvk6X/CyCoiUHw5gjsRRxY50FmAlTKZ/emXYrpEVf7uLYBROR566vmxy+A
         QgidH1OlYIsWAkj+9lIjD34UBJASmPJGNLLwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687447834; x=1690039834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=it9RfQZoHvlt4i7NjPP7j9e/je2l7GBneNbO1SZ/LaE=;
        b=c/aZfEZtnHBp4efSeOLkNkcw3YEwnXvx1YSBRS1mcV6GnQFbp8Slhyq7Q3Lxj5Tf3w
         pg7n5RTGmhPEWPGGDPQB0SDFMBqY73Ssi2PhCZIvKUccBXX/V0lR4jnHVdYgqu3gM0DD
         LCtGcKdYYsaxvpHvqDa8VNtxQHSx4RDQNgJGnvAeITCFGC+R+6Tgn/05hxaZ9+t+8ajY
         f8uFseJqwKWLTUlEGLaaQeDEp9uXtJ8V2z5GBv1qagJk2U+rcGqF3f6uuRtrdNjHlltO
         oLoDZ7TF6GmTp/c0W8+39Qn4aFVbiBCRVqJpJDXmByMYwfqiCXE5MatqbgRbWRM4eaMF
         BX5g==
X-Gm-Message-State: AC+VfDwXW46yGAyFDnqAj2uFEWwdNp+jsvKJSSiotVFaGMRKk6z11YGe
        W20NwUpKh0oWJ6JKd65vAr9taQ==
X-Google-Smtp-Source: ACHHUZ6WQHNu9IShb1qUDx2kQeEQ8/k/YbNklzp5Wi6heL7ES6u5LaL8TuaW9FctaeBl1FnOkIDpvA==
X-Received: by 2002:a05:6602:3f04:b0:780:d557:1984 with SMTP id em4-20020a0566023f0400b00780d5571984mr655337iob.2.1687447834010;
        Thu, 22 Jun 2023 08:30:34 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id x4-20020a02ac84000000b0042690648930sm1746926jan.106.2023.06.22.08.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 08:30:33 -0700 (PDT)
Message-ID: <d206311e-4fe6-54b6-f591-e2c11194aed2@linuxfoundation.org>
Date:   Thu, 22 Jun 2023 09:30:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] usbip: usbip_host: Replace strlcpy with strscpy
Content-Language: en-US
To:     Kees Cook <keescook@chromium.org>,
        Azeem Shaikh <azeemshaikh38@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-hardening@vger.kernel.org,
        Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230615180504.401169-1-azeemshaikh38@gmail.com>
 <202306212010.E6CBCE23E@keescook>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <202306212010.E6CBCE23E@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 6/21/23 21:10, Kees Cook wrote:
> On Thu, Jun 15, 2023 at 06:05:04PM +0000, Azeem Shaikh wrote:
>> strlcpy() reads the entire source buffer first.
>> This read may exceed the destination size limit.
>> This is both inefficient and can lead to linear read
>> overflows if a source string is not NUL-terminated [1].
>> In an effort to remove strlcpy() completely [2], replace
>> strlcpy() here with strscpy().
>>
>> Direct replacement is safe here since return value of -errno
>> is used to check for truncation instead of sizeof(dest).
>>
>> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
>> [2] https://github.com/KSPP/linux/issues/89
>>
>> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> 

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
