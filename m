Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF6D605EEF
	for <lists+linux-usb@lfdr.de>; Thu, 20 Oct 2022 13:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbiJTLer (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Oct 2022 07:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbiJTLem (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Oct 2022 07:34:42 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B9439BA6
        for <linux-usb@vger.kernel.org>; Thu, 20 Oct 2022 04:34:35 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id i16so8774807uak.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Oct 2022 04:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LDhV67G3yIU5nmxmqmZ9xL0xYos7YPVrGgeDtE3Ev1w=;
        b=Q6lOl205MId5F7DEZxzDQXACD6sCSMVIlVvrPoyEOMYDm/D+4a/soXq7ZCHCgVqEwc
         2qmaM02wjy20BeHTrxSxmR9UOzU17VE9f8i4EwGjI7knyjbm6Ak056laTsVLXz4hL3/U
         +iHaXsJZP5Sj7bWNHTUZN2j57ZYyZ06xTZILALdms6bFuUTj1hklxZGLo/oewrOQzvHJ
         zcNJpjqUWQx1fcUy6o6ZWxot30vQ9DbVEg5Js3fxo1EnL4+dY7dDbZnzban4t/ifYacv
         Q3h2QqHXkv7DaXq1fo1KwfG//R4nhBpztx+FQy12ZcwZjQQEG+5zR5G8t6h0VU78MdLN
         L1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDhV67G3yIU5nmxmqmZ9xL0xYos7YPVrGgeDtE3Ev1w=;
        b=1kaQt6t37WiafIK9Y4/ARrR/lCV/+MWwAMVlEX8C+HvYlwlRYunPvgFCnHscKxr5vx
         OH3BUC19E+V+nKN9HB/Yq10WrePh0Rdxa+Iw6uG5+kKZajgIPhh2qArUmnudUJhVxmmX
         /UhGYgUXetYC1X8A+MG3aZSsVfg3R0ThBLV6mz4hCRuWJeKLBerOAii6SV3J6gs40Yn8
         DruQHuEedjfhvzm2jLaRC48w+bZtM4CyIK+j2+RH3BYALmKX62d+4WHv0Q0YFpG46zxO
         s4Ljg+/uK2FMjsfD257mxytIebPzE4LaMgpcre0u6dN5E6CEgcVH/LnbdDUFatx88xqK
         OCCw==
X-Gm-Message-State: ACrzQf22biMH/O00guUkoJCEKi8o8+A5BqxXVmJYGH03dF2k9gQrt2/5
        oMcvO0net1r6xxplbvVko/15FhbVJC9DwwRF3EO3Fg==
X-Google-Smtp-Source: AMsMyM4WwYXAIJoDmrCGYZ9TonZSFrG5it0MdGqExwa7IuYZKAhf7DtBeFJHWXBmjhRTl8t2JCIj8GiQJ8f3LkG2ifc=
X-Received: by 2002:a67:ab02:0:b0:3a9:9953:6471 with SMTP id
 u2-20020a67ab02000000b003a999536471mr4334447vse.47.1666265674577; Thu, 20 Oct
 2022 04:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221019152947.3857217-1-arnd@kernel.org> <20221019152947.3857217-6-arnd@kernel.org>
In-Reply-To: <20221019152947.3857217-6-arnd@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 Oct 2022 13:34:23 +0200
Message-ID: <CAMRc=McmBvOh5OV9Z-7ohjfFixBJUW1AAXb2XxFc_u-N1rYHQw@mail.gmail.com>
Subject: Re: [PATCH 05/14] usb: musb: remove unused davinci support
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Sekhar Nori <nsekhar@ti.com>, linux-arm-kernel@lists.infradead.org,
        Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 19, 2022 at 5:34 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The musb-davinci driver was only used on dm644x, which got removed
> in linux-6.0. The only remaining davinci machines are da8xx
> devicetree based and do not use this hardware.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
