Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB76B6813D3
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 15:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237427AbjA3OyP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 09:54:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235737AbjA3OyO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 09:54:14 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 449BD13DCB
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 06:54:14 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id e15so14276376ybn.10
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 06:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TdXODNxkN1w9hhgiZS3x7BNLth/6SKmxoP4hNLxjHEg=;
        b=Bdm4+M/fJC+ho+HGRjpdlcnpKJ9ogEOA026a3Yle393/j4bfame5B4iReHD6Lo1VNY
         MnU/YpXk2xZELdhp4+775SZkcbtPK4KeNvTjLVe2lIvDc27O6ey992Lr5RN66AxmChAJ
         nH587qhsy0FGpgTEfx9vCYT8XylhuENEOEw7EeA1Q6ywdPX9o9eCGSed3ltBrwhmJBB3
         8LxVkcJtmZRZwEVd97ATU/O+wVGxC4zdnZCjMxli5p7VIzlmbmXWukWGkSBGW8iD6fme
         jo+6Ug0DBaLd4AzqHdmMjmHa3MjZOsWeUbKXGM1qS8DP9PpQSQDFounyPj8bPiGBH6VN
         nvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdXODNxkN1w9hhgiZS3x7BNLth/6SKmxoP4hNLxjHEg=;
        b=mf5jU313HkDacztLYaisMM1bF1qBEF+LXjWQkFaCeBP5lTvCg1ho2eyGVHcBvZMngd
         TxksnlfgnrJHkKiSGBOiusWnBtQ9sk0NLVxDQTyTvK5Yi/TgtqdfkSwDZr3PfkezVG9W
         Xaog33wL9V2alQlR6veTJUO6oeIxwzirlK62RkSmT0sIlAcWr84O5yPg2jGjRbWknS1V
         uT2KJQqCre0SEt/4LP8bnUlQ9d1/C+bpSNU8ziLqg5q6xm77dbuAMPcIEZ9COPHqQ1OS
         1QNyr504aLw+enIfoLUOWSi394dtVj6mW9pwf9Cddqc6t3GxCTIW9vrf+hpG3pfnVP8c
         xjrA==
X-Gm-Message-State: AO0yUKW64v7KLRu0fnmGbOk8NEXkBk/VSEyFZsAYIBEpaNPxqEbt+XH3
        L46xaqz7JppTlra6kzs3kiLr+C4pHX75AxuOCjKtCHC5JyztLA==
X-Google-Smtp-Source: AK7set+9mZwcPlharG/OC7a+e/sov/5H0VLFnuhZzePWDlICIXT/MGzOXvwCoZAW5K0rQsVtjvVsNJvasT6+FYk8pOg=
X-Received: by 2002:a25:f81b:0:b0:80b:821f:b621 with SMTP id
 u27-20020a25f81b000000b0080b821fb621mr1863045ybd.24.1675090453520; Mon, 30
 Jan 2023 06:54:13 -0800 (PST)
MIME-Version: 1.0
References: <20230129075204.297725-1-yangyingliang@huawei.com>
In-Reply-To: <20230129075204.297725-1-yangyingliang@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 30 Jan 2023 15:54:02 +0100
Message-ID: <CACRpkdbnKxEJRUHNnQ96fdGGxsKrNpz-ayKXv_-xREN=yUGmMw@mail.gmail.com>
Subject: Re: [PATCH -next] usb: fotg210: fix return value check in fotg210_probe()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 29, 2023 at 8:34 AM Yang Yingliang <yangyingliang@huawei.com> wrote:

> devm_platform_get_and_ioremap_resource() never returns NULL pointer,
> it will return ERR_PTR() when it fails, so replace the check with
> IS_ERR().
>
> Fixes: baef5330d35b ("usb: fotg210: Acquire memory resource in core")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Good catch!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
