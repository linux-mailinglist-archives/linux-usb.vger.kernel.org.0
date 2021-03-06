Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C01E232FBC4
	for <lists+linux-usb@lfdr.de>; Sat,  6 Mar 2021 17:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbhCFQQ7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Mar 2021 11:16:59 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:59191 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbhCFQQn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Mar 2021 11:16:43 -0500
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lIZbe-0004kS-Ik
        for linux-usb@vger.kernel.org; Sat, 06 Mar 2021 16:16:42 +0000
Received: by mail-ed1-f70.google.com with SMTP id p12so2628209edw.9
        for <linux-usb@vger.kernel.org>; Sat, 06 Mar 2021 08:16:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zs2DsRzkX8tT8l/nIzy+fjRZiW0RahwNShoX9pnJ+yo=;
        b=mW/PGfqVYLeezfBiiLlqUSwbFk1yItOgwlD5tE6g2JIOzANrUnnkZa+RaGmg82KFk/
         KrWU6Y4TlMVpyBLVDbZsVvrrMIOg1QSHGgxBXE9KlV6i5p1h8xdE1027m5+nBDxi3Hsy
         VxIRgy0PK0rr8sogSHhOQGISmESj9D0hvCEPFj2iGXOo9nygSQ3vYmDZ3r7e4lSBTx4T
         ivEifgDohtgsflqzN7DAj+c21Q4HuBjvesuzES7S5iI9dodzjs+/pMiOF3Uh9QZdXFTJ
         oeTk1OxzyTMntdGJ1T4JN9ZL5W/tdOBbXNshbN8nfZVCQlzDVVmppDKjBFkxgLol76sX
         GYkw==
X-Gm-Message-State: AOAM533RaFZ5nf2f1e2NkemhXZwbGCEXeNmIKQttpFDIuZzJJLaXxxc3
        VrDJ1drOibQmz60CLrCJwFaWife+866uz22UngMXgBgsaWXSdDcKilJOI/MmGA3WcsQke9WiUUo
        iSIkna+EhjYeTnHyToFBR5NmTaYhkyDzc8T/u1Q==
X-Received: by 2002:a17:906:f0d0:: with SMTP id dk16mr7545019ejb.48.1615047402264;
        Sat, 06 Mar 2021 08:16:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPWbiOXwIA7NfjdpkKMCrGW3Leo2IzuIBlWgonJHx7ep3pWh8GAJ7OaqjMH9aWvpe63p3XqA==
X-Received: by 2002:a17:906:f0d0:: with SMTP id dk16mr7545010ejb.48.1615047402155;
        Sat, 06 Mar 2021 08:16:42 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id b6sm3356219ejb.8.2021.03.06.08.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Mar 2021 08:16:41 -0800 (PST)
Subject: Re: [PATCH 2/2 v2] usb: gadget: s3c: Fix the error handling path in
 's3c2410_udc_probe()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        balbi@kernel.org, gregkh@linuxfoundation.org, nathan@kernel.org,
        gustavoars@kernel.org, arnd@arndb.de, ben-linux@fluff.org
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20210306142145.3490-1-christophe.jaillet@wanadoo.fr>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <64c3ca58-639f-95af-35e1-7d5ba240a7c9@canonical.com>
Date:   Sat, 6 Mar 2021 17:16:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210306142145.3490-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 06/03/2021 15:21, Christophe JAILLET wrote:
> Some 'clk_prepare_enable()' and 'clk_get()' must be undone in the error
> handling path of the probe function, as already done in the remove
> function.
> 
> Fixes: 3fc154b6b813 ("USB Gadget driver for Samsung s3c2410 ARM SoC")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> v2: Fix a stupid error in the hash in Fixes:
> ---
>  drivers/usb/gadget/udc/s3c2410_udc.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 

Do not ignore received tags but add them before sending a new version of patch.
https://lore.kernel.org/linux-samsung-soc/36ef897b-aedc-fcc3-89c8-c602d9733a9b@canonical.com/T/#t

Also somehow your 2nd patch is not in-reply to first one. Don't change
the settings of sending patches. git format-patch and
git send-email default settings are correct. Look here:
https://lore.kernel.org/linux-samsung-soc/
Only your patches are not threaded.

Best regards,
Krzysztof
