Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6658232FBBC
	for <lists+linux-usb@lfdr.de>; Sat,  6 Mar 2021 17:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbhCFQNp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Mar 2021 11:13:45 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:59156 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbhCFQNl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Mar 2021 11:13:41 -0500
Received: from mail-ej1-f72.google.com ([209.85.218.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lIZYi-0004an-0x
        for linux-usb@vger.kernel.org; Sat, 06 Mar 2021 16:13:40 +0000
Received: by mail-ej1-f72.google.com with SMTP id v19so2428375ejc.12
        for <linux-usb@vger.kernel.org>; Sat, 06 Mar 2021 08:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kSOpPvwteB7OgdggMYlflHqoFNnAak/wbdk3zQ46jYs=;
        b=WkaBnVgbz9l0ICfzjnY4FepwPfrRN3jKMy7o209p423fS2+WqGPr6/QsvSy1E2OChu
         yyAf9G48hIH4RK4UYpYa35MQqbw/f1ebx4jmSzozpVlanqewSSg0IBMlJJyZHceS1sty
         eNZd5teB5ri/P2w3sBH+eqz/U8e4Oq9/UYkfKR7VDKXolYMzGifuauigxkdBvPMy3N78
         igU5x4Vh+ZLtx5DYlBtaqTgsaBmbN7FDkpL6vcoXBGgvRBRa2GxJfRauRvfW1ST1tFQ9
         cfETmVBSFzt0xGslGoruxLKZDYaUlND5eBEiSG4BA7McME5Xw1GYwgw3DKrcBspV9W7K
         0hJw==
X-Gm-Message-State: AOAM530SH1vmxdrtHBsWr12J27bftgwIcjZ1XMZf5Pw2diw2d5w7VGTd
        aGbwuE/ZdDd82YHL9BhFWihYY20jruaZ23SRheCt0P6gRzmpjwNda7ESszdwEewZlW0a0mIyrbJ
        jYKroXmWv8zeQQDuioCI22XKJ7LmuEw/NSuZgHg==
X-Received: by 2002:a05:6402:704:: with SMTP id w4mr15006219edx.175.1615047219680;
        Sat, 06 Mar 2021 08:13:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdAGCIq65lZYlyAxqCZzWAm3VpQnb3VqeFecUkSHeg10URY0/jp2c3aXPC8lt9nQB63KGrWg==
X-Received: by 2002:a05:6402:704:: with SMTP id w4mr15006200edx.175.1615047219456;
        Sat, 06 Mar 2021 08:13:39 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id k5sm3487412eja.70.2021.03.06.08.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Mar 2021 08:13:39 -0800 (PST)
Subject: Re: [PATCH 1/2 V2] usb: gadget: s3c: Fix incorrect resources
 releasing
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        balbi@kernel.org, gregkh@linuxfoundation.org, nathan@kernel.org,
        gustavoars@kernel.org, arnd@arndb.de, ben-linux@fluff.org
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20210306142108.3429-1-christophe.jaillet@wanadoo.fr>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <4ef30769-91c2-031e-8e19-af25d26c848c@canonical.com>
Date:   Sat, 6 Mar 2021 17:13:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210306142108.3429-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 06/03/2021 15:21, Christophe JAILLET wrote:
> Since commit 188db4435ac6 ("usb: gadget: s3c: use platform resources"),
> 'request_mem_region()' and 'ioremap()' are no more used, so they don't need
> to be undone in the error handling path of the probe and in the removre

You ignored my comment about typo here and did not add my review tags.
Did my emails missed you? The made to the mailing list...

https://lore.kernel.org/linux-samsung-soc/f63496f6-f894-2a86-0328-0f8dadbd28cc@canonical.com/

Best regards,
Krzysztof
