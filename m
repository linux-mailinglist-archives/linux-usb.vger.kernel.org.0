Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9C215A5744
	for <lists+linux-usb@lfdr.de>; Tue, 30 Aug 2022 00:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbiH2WuI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Aug 2022 18:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiH2WuH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Aug 2022 18:50:07 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA3912604
        for <linux-usb@vger.kernel.org>; Mon, 29 Aug 2022 15:50:04 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id z2so11983158edc.1
        for <linux-usb@vger.kernel.org>; Mon, 29 Aug 2022 15:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=BdK6wFzGAjAWXTvHTiu/Q0qZEI64G9YTiM4Y/8WjD6k=;
        b=p69IAoQeGDoqnLVXpl/x2o8SFwhNMcMzOGY9mElkAAfh9Gk/YzswoUnYRIrBVuZENs
         LLpHcnrFhMY9IVuFlsy8oxk6P+WF+PTyaOUZLw5qTwyP8jD97mPttwi7gte3lswgTQ2B
         5OXGdsUxpmDgVnV+9MVy9D6UqUVjQ/nT8fdSUO0iMa25KfNn3k6Of/4tY5CdPxwRnI7t
         eGWZjv6hfhbJX1HeATEluXpJqCE+9MbQMq2kV6TqIzpuyEzq6NBKRiikTyT8yqBFhYeL
         3e3uEbOS9pkHWcLaM6UvVKhrJIwvTR4gLu3lDjatiNR01GVqDuBML7jbvmcBiFI63iPV
         WT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=BdK6wFzGAjAWXTvHTiu/Q0qZEI64G9YTiM4Y/8WjD6k=;
        b=gzme0kif3RnvwVF3awy+SZWoK1WmIzzm90f+hZXpFIdHNY2wXop9/Sy71Y2or/izFT
         KSCuWGiLtmfVlh4PYJ9lfh6ldRqVls6Lv7x160ltm3hk7OCnPwX8zUK3wTvQybUIOjz+
         yC4QxGtEjC5Uq2YsaMp+cwy2Wi8LzPhTgyilcfnF9vtjbWlnvd79OFSWRdTKU6wyYpQr
         EMvVFR2Afo9QClkuPIOoDT+aTHWUZ5yV4yQxMHcTFBQT9VqJsuojqtG024nYuhKpIGhO
         2iiSNS0cBUaDmqOYhyuoLzJ6bgnDheRsEez/lQm1pMIfEyNv7U8ZfWmCOFOpQDeVLNxs
         TiPQ==
X-Gm-Message-State: ACgBeo1PqmkpTsTtaV4ZjrSzNKV5k0EllGVfwGJ4v9YLLeaFHe66/nfd
        dP/hVU8AepYivAMuUTgD6XsFYLk1vx95g/1AuR6uuw==
X-Google-Smtp-Source: AA6agR7OG4e5zZDY58ZsZNG6O8PjNDpVwMESbUm6NkLMPzH7GilF7Y3CTKcrJewEMHz/sEsTvHHWM7rVdK39sFUtu5s=
X-Received: by 2002:a05:6402:2b8d:b0:43a:5410:a9fc with SMTP id
 fj13-20020a0564022b8d00b0043a5410a9fcmr18122157edb.99.1661813402834; Mon, 29
 Aug 2022 15:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220810234056.2494993-1-npache@redhat.com>
In-Reply-To: <20220810234056.2494993-1-npache@redhat.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 29 Aug 2022 15:49:51 -0700
Message-ID: <CAFd5g456Xjk7E9GdO_CXNKitzGha76qOK5R6gKSE9-8+s6-ucA@mail.gmail.com>
Subject: Re: [PATCH] kunit: fix Kconfig for build-in tests USB4 and Nitro Enclaves
To:     Nico Pache <npache@redhat.com>
Cc:     kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, davidgow@google.com,
        skhan@linuxfoundation.org, dlatypov@google.com,
        brendan.higgins@linux.dev, alcioa@amazon.com, lexnv@amazon.com,
        andraprs@amazon.com, YehezkelShB@gmail.com,
        mika.westerberg@linux.intel.com, michael.jamet@intel.com,
        andreas.noever@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 10, 2022 at 4:41 PM Nico Pache <npache@redhat.com> wrote:
>
> Both the USB4 and Nitro Enclaves KUNIT tests are now able to be compiled
> if KUNIT is compiled as a module. This leads to issues if KUNIT is being
> packaged separately from the core kernel and when KUNIT is run baremetal
> without the required driver compiled into the kernel.
>
> Fixes: 635dcd16844b ("thunderbolt: test: Use kunit_test_suite() macro")
> Fixes: fe5be808fa6c ("nitro_enclaves: test: Use kunit_test_suite() macro")
> Signed-off-by: Nico Pache <npache@redhat.com>

Acked-by: Brendan Higgins <brendanhiggins@google.com>
