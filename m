Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F07C93E577E
	for <lists+linux-usb@lfdr.de>; Tue, 10 Aug 2021 11:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238396AbhHJJva (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Aug 2021 05:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237886AbhHJJva (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Aug 2021 05:51:30 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0AEC0613D3
        for <linux-usb@vger.kernel.org>; Tue, 10 Aug 2021 02:51:08 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id w13-20020a17090aea0db029017897a5f7bcso4434537pjy.5
        for <linux-usb@vger.kernel.org>; Tue, 10 Aug 2021 02:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QEHvN1zcj1TQAVQvDetqFetq2oF9ehQREWid/OrB3DA=;
        b=U0MeDLyIai2YmzbzicqGh2ePhEZpahJYbBbWmG0KXYQw6K24B826JuCPqbTNkp38S7
         WmnvxAdpxf2x4aWVMsQb4VaIDyxGYfq0vJkCQHsMSWYywjh3OkLpxcizGsEiM3VlPZxf
         rgmmBKkEPHZnWv+JrxP5WKQ2JdGWeDQZhaW331G9MtgRnI6u6CjTd+8LZztrvdNp1fQM
         gJZKITI23RTme+HMc/u2kkwIv7nl55Ioo3Znul+RxrV4Xe6J8T0b4/yxmTAfph4+QnRP
         zZdtrNyElrXZ/GPsptgvdfBt0X0l3BB2ftAEOY2BKlpugEc67VAJwCQ7QK2pAklx0Gb3
         xwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QEHvN1zcj1TQAVQvDetqFetq2oF9ehQREWid/OrB3DA=;
        b=lJ+WGWUAftLpC+JsK/SVh5FMC75yjvMqqjydgTvThBtoEy/owGo1SMH5h7exR4Cfe7
         M//fMFQ1a8oHkyzsI4Q77NbyOh2Of+7bFjR4cnxEfO+VXpwBbMQWSXWuehCZEl+W3Qeg
         8yeZ+iLrgnFVCDxjGBv+ZVehKcnFK8NiSwbiJFBdlLkBPVMa1DQ6vaFLOjY93MT+/EFS
         nhh/SShUU+vp43vXc3d0ivGVGQp42b/bC86hoXfdin7SIDcTu/fB9cS8rBRod1hBIDt0
         mVxAdHQpPb7S9TORExt6PyC6FXddWSaU8l4Wmtklxhg9AK7cwk8vaJXOJFT/oMHwvXtB
         mYfg==
X-Gm-Message-State: AOAM5322cWfRzu6Na1fofar8nl2gtwaLddFK6xdcCiMhpGlxRMYDgPnl
        L62juZ8bq/Y30P3+LArRNVs=
X-Google-Smtp-Source: ABdhPJzr5SbYElMbnvRnHN3W8VwV6mq/HBMV7GxIejK0erNJjnZX8WyRUKsquvCRG8LCacSglTtBcA==
X-Received: by 2002:a17:90b:3ecd:: with SMTP id rm13mr30102445pjb.109.1628589068295;
        Tue, 10 Aug 2021 02:51:08 -0700 (PDT)
Received: from [192.168.1.22] (amarseille-551-1-7-65.w92-145.abo.wanadoo.fr. [92.145.152.65])
        by smtp.gmail.com with ESMTPSA id w130sm20299928pfd.118.2021.08.10.02.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 02:51:06 -0700 (PDT)
Subject: Re: [PATCH v2 6/9] usb: misc: brcmstb-usb-pinmap: add IRQ check
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Al Cooper <alcooperx@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org
References: <47bacc02-4e34-3208-779c-7072a6261782@omp.ru>
 <806d0b1a-365b-93d9-3fc1-922105ca5e61@omp.ru>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <56cc78f2-c082-0c92-cba6-175500d6b0cf@gmail.com>
Date:   Tue, 10 Aug 2021 02:51:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <806d0b1a-365b-93d9-3fc1-922105ca5e61@omp.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 8/9/2021 1:45 PM, Sergey Shtylyov wrote:
> The driver neglects to check the result of platform_get_irq()'s call and
> blithely passes the negative error codes to devm_request_irq() (which takes
> *unsigned* IRQ #), causing it to fail with -EINVAL, overriding an original
> error code.  Stop calling devm_request_irq() with the invalid IRQ #s.
> 
> Fixes: 517c4c44b323 ("usb: Add driver to allow any GPIO to be used for 7211 USB signals")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
--
Florian
