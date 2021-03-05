Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1C5D32E5D9
	for <lists+linux-usb@lfdr.de>; Fri,  5 Mar 2021 11:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhCEKK7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Mar 2021 05:10:59 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:49541 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhCEKKy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Mar 2021 05:10:54 -0500
Received: from mail-wm1-f72.google.com ([209.85.128.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lI7Q5-0005wN-E9
        for linux-usb@vger.kernel.org; Fri, 05 Mar 2021 10:10:53 +0000
Received: by mail-wm1-f72.google.com with SMTP id n25so572826wmk.1
        for <linux-usb@vger.kernel.org>; Fri, 05 Mar 2021 02:10:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dc1X7XD8sIPk/f9CtULIHpjeF451ceoNr0To1nwZ7Rk=;
        b=pS9liM68g5l16WKR1R0AEQjnsMgGp0QT6WUbWeLi7D84Hhmk7fnLuMuON3XH2g4AKy
         wdWHoTAjCs9H05gRr36JfynQ1+q587Grb+FJD5PBOmKM5j5fed+ocjrRz5EkHjBjnudR
         oxvCsjdD9mbONadVAivUTYkzrpQeOxHkcb+sEjVnumLIVf1TJTHDb1vIa1SGjWYkxh2m
         QSIk2H+7KOFtRHxArSWjF8NnrYgZR98aBCSFbNIgo9dff9LeykfSIcWiqSInMObT1VxC
         06Xgjik/JhbxoLxFn1xxo3pItvurhZuASRdWybjCVotN2StHOvDGT6hzhT7u9iw5Vkds
         JjIQ==
X-Gm-Message-State: AOAM531gsz4BzKj1ZcdGrPoBos2u/9CF44AgVjKcwjI29aF9+f9ELiy8
        j144fAzUSFgL9+POxfhnXtA3Tk066RrYXmHApcj8Z2OGyr1RR6yjXeX+CHTozKMB6NNRDua68bQ
        ReMG4GA7dJiE1IxuAyG3+S6BgoDYW0jqcXd7wCA==
X-Received: by 2002:a1c:7312:: with SMTP id d18mr8029196wmb.155.1614939053067;
        Fri, 05 Mar 2021 02:10:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJTFUqM4RWURTdZMPFSaLPGO6A85/2AN+p8IFVvZ8Jnf1yZlTvGqR63lFecZvTKp5HVZ2Rlg==
X-Received: by 2002:a1c:7312:: with SMTP id d18mr8029170wmb.155.1614939052859;
        Fri, 05 Mar 2021 02:10:52 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id o14sm3527991wri.48.2021.03.05.02.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 02:10:52 -0800 (PST)
Subject: Re: [PATCH -next] USB: gadget: udc: s3c2410_udc: fix return value
 check in s3c2410_udc_probe()
To:     'Wei Yongjun <weiyongjun1@huawei.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
References: <20210305034927.3232386-1-weiyongjun1@huawei.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3cf7abbf-0dc8-495f-4737-2d84bbea8158@canonical.com>
Date:   Fri, 5 Mar 2021 11:10:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210305034927.3232386-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 05/03/2021 04:49, 'Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> In case of error, the function devm_platform_ioremap_resource()
> returns ERR_PTR() and never returns NULL. The NULL test in the
> return value check should be replaced with IS_ERR().
> 
> Fixes: 188db4435ac6 ("usb: gadget: s3c: use platform resources")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
