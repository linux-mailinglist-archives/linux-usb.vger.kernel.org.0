Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC4276E69B
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 13:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233863AbjHCLRj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 07:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbjHCLRj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 07:17:39 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA0F9B
        for <linux-usb@vger.kernel.org>; Thu,  3 Aug 2023 04:17:38 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fe2de785e7so1498242e87.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Aug 2023 04:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691061456; x=1691666256;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVjMF7PfPtizRQd6rkfzqu42tZXuqWZLkpcfDTZS8Wk=;
        b=clh6NCrJ0SDLNJN0c+CGxS4EeF6q2QDfxmshUY3cJqV2Ln8s1wKC63To4pwSAwT+95
         v4mXRbnQQ2SQyM8GTltcr0IAZvrssmM6gxogd7An8oNSIziayE5G8sRQXuHEeGK7msuj
         1R4E9ILRuAH7cNYFX7OztsBXdurb4HImCSKmggpif2/2miO+RM6KI94lihtnl1hTNoRj
         d5Hcz3159pbONZSb/kq9QE8pXoC/JJm4VnFqkTaILGUvp5xC92uZkRF+7tADSyZSownM
         NFMLsi53zBY+v5ntu475MxI9lahy80aNIQEXCymDu5RPUXkv+e3t1uAzWpWTqZAknhMP
         oSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691061456; x=1691666256;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KVjMF7PfPtizRQd6rkfzqu42tZXuqWZLkpcfDTZS8Wk=;
        b=QDuev1CMXEwmwcFjD6wu79Ly7WyWV9BB76kK0gQxVfUllHjFfQ9TQelvsR+QLpE7fw
         1Q+jcBdpvK8vDkpL+yp+tmjYUdfZqMIYUIpOlZUVSyvD/5tFSmn9jysLc5pNPn9Z3k0B
         U3PwUwQBLnQrpOg8eDgiIF629vzc8Inh8WVuBMvskbaMEc1TPkKJPfdl3uRzkJu/WKs2
         Yp0RY4zaBxetTEwKmvKsvIOR4GlveqtqCzDpfTh9GXx+gnUA5zx6Rp/z8MQlvCPfTl2a
         2YVHYtZBEBn+LfYFWiirPKcPMcJfXjb4GwRr+SP/u/xbMwVrdctGlB9hiXssR6jv1l5+
         ZFgQ==
X-Gm-Message-State: ABy/qLb/Gh3HUY/v4xqbvfAP3W1c7mBG3YMWQlv1MBjC+wkUHpW349Y+
        WQkej4uGMqZDZ7Ekx7CidGSFRm2conw=
X-Google-Smtp-Source: APBJJlGKFLIANPWkXt3B+httdryX8TcnmT1Z9D4EHWTaN9A/i0O2qTZl8cRi+x75DQZb+OWeXOIxfg==
X-Received: by 2002:a19:4401:0:b0:4f8:5e49:c610 with SMTP id r1-20020a194401000000b004f85e49c610mr6214037lfa.35.1691061455633;
        Thu, 03 Aug 2023 04:17:35 -0700 (PDT)
Received: from [192.168.1.103] ([178.176.75.73])
        by smtp.gmail.com with ESMTPSA id x6-20020ac24886000000b004f8555f7aa1sm3339502lfc.52.2023.08.03.04.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 04:17:35 -0700 (PDT)
Subject: Re: [PATCH -next] usb: gadget: udc: gr_udc: Do not check 0 for
 platform_get_irq()
To:     Zhu Wang <wangzhu9@huawei.com>, gregkh@linuxfoundation.org,
        robh@kernel.org, stern@rowland.harvard.edu, aaro.koskinen@iki.fi,
        linux-usb@vger.kernel.org
References: <20230803064129.74313-1-wangzhu9@huawei.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <6d53b741-2d20-92f8-e024-c91a4754e459@gmail.com>
Date:   Thu, 3 Aug 2023 14:17:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20230803064129.74313-1-wangzhu9@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/3/23 9:41 AM, Zhu Wang wrote:

> Since platform_get_irq() never returned zero, so it need not to check
> whether it returned zero, and we use the return error code of
> platform_get_irq() to replace the current return error code.
> 
> Please refer to the commit a85a6c86c25b ("driver core: platform: Clarify
> that IRQ 0 is invalid") to get that platform_get_irq() never returned
> zero.
> 
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
[...]

   Same comments as to the MUSB driver...

MBR, Sergey
