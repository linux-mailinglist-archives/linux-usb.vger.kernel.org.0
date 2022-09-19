Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E55775BCA93
	for <lists+linux-usb@lfdr.de>; Mon, 19 Sep 2022 13:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbiISLV3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Sep 2022 07:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbiISLV1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Sep 2022 07:21:27 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA9C6120BD
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 04:21:24 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id j16so19347897lfg.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 04:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=FxPRDn7hmjXTJ7vPPNS0wMBmknet/zg5xwLIphOfBJU=;
        b=UQEENGmPTrKlUqOOzEkByV5qfp5zVPXkRFVUWmCV2HL5ZGps4b6AI97WrWWd7esmqG
         MBWxh6tfkweKSQERe6rNTmPSz1CGcyKBoTmnpFci5uA6bx5VAGsy2yk2e4Ivsa1XkROZ
         8V4o3nmcRlA4nYlFfMFV4y2facoeHRhwWRNjxtF52KE+UnpI2B3UoFsy4EXyedXb6vzi
         7gqW7D78P/8CvZrqGK2NZ/ZYiPYKfIEXfoJ+xCGGBk5r2HR6Bv0g6WTVkNSW+/2/Vgsf
         MAlZ+s8ZXNuapqCahhYlTiTPFBUyMmAf39xtAfObk6i91AIabynYf133eLd98azblG+b
         kO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=FxPRDn7hmjXTJ7vPPNS0wMBmknet/zg5xwLIphOfBJU=;
        b=LxJEb7mvB+RTWkHtNpXLZrNUSe9vm+Q63timq5LPZFOMQd/yiHvQp9p0FzWNE+T2oL
         222m2UzMfcxbbAyI8H7Sz7QWtgkAkYIh0sIsGebnRVfSqf/gQ6I0gxJW6zKTNgoMXVBw
         Cy1SIrP1La7/Tty8N/CTN9H2n8lIkWXQsWJn4R4vyC3M6G4sNS3Y9cB+oylo+CvGirdD
         7EdP0WGMwQv+8yNQJedceuTx5LyQdH8QtOdV1V/uHdXWhStGAGTDBHbc8NYdXbKcyajq
         qzjW4FINUq0OUm3mgwFCxnO+QnrpUH+eZ2/G67jvRO9MTtkvaDAjgk5Vxbb44Vf5zGwG
         JRqA==
X-Gm-Message-State: ACrzQf1lGw635Qf/s/agTVuy7ceyGewAr8l6g5OljOK/IDVJswNtKdTV
        eTtRTX3eMNzBd7EL7HMnrzqxOzC8CgT+LbGKwfmByg==
X-Google-Smtp-Source: AMsMyM4u+P9sdU0VEVQU++PDwQheywkWAM3Vzi17JDyVAiVQtNS7mpU1ssjshcwkVAJaEGShVGCkLxWnp4RTmHX18Yk=
X-Received: by 2002:a05:6512:118b:b0:492:e3c4:a164 with SMTP id
 g11-20020a056512118b00b00492e3c4a164mr6617161lfr.598.1663586482896; Mon, 19
 Sep 2022 04:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220916224741.2269649-1-tadeusz.struk@linaro.org> <20220919042533.2688081-1-dvyukov@google.com>
In-Reply-To: <20220919042533.2688081-1-dvyukov@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 19 Sep 2022 13:21:11 +0200
Message-ID: <CACT4Y+Y5YxAQf=1BJzMYkQyhHaKMCah0Ucq7-Ekfj4xk5bD-sw@mail.gmail.com>
Subject: Re: [PATCH] usb: mon: make mmapped memory read only
To:     tadeusz.struk@linaro.org
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 19 Sept 2022 at 06:25, Dmitry Vyukov <dvyukov@google.com> wrote:
>
> Hi Tadeusz,
>
> Looking at places like these:
> https://elixir.bootlin.com/linux/v6.0-rc5/source/drivers/infiniband/hw/qib/qib_file_ops.c#L736
> https://elixir.bootlin.com/linux/v6.0-rc5/source/drivers/infiniband/hw/mlx5/main.c#L2088
> I think we also need to remove VM_MAYWRITE, otherwise it's still
> possible to turn it into a writable mapping with mprotect.
>
> It's also probably better to return an error if VM_WRITE (or VM_EXEC?) is set
> rather than silently fix it up.


The credit for the VM_MAYWRITE suggestion goes to the PaX Team.

Suggested-by: PaX Team <pageexec@freemail.hu>
