Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF93652341
	for <lists+linux-usb@lfdr.de>; Tue, 20 Dec 2022 15:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233724AbiLTO6v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Dec 2022 09:58:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233829AbiLTO6t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Dec 2022 09:58:49 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C11D51
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 06:58:48 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id m2so11975789vsv.9
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 06:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T9or8qu6JKMppO0BjvG4KREN0TsiXIo9VR7tBdWz3E0=;
        b=sPle1K98siElwEnQSiMSRFrbgOEdMk7AXUbhOqXsaSV3Bw7f1zRzWc5v5zL8E23TQ8
         v5FzdF6/flsDvwdOac02sbokPlxi3AZpf2hFVMMQo43etJX5x5oleEEQXg0EBhvajE13
         pmfNGb8J0qWPH9LONzY4jRebTvPmrFuBQ2yKb7Ij16b63ccVWYUut/1XRE4P59a9bWew
         mkkAOXCkbggcQTKhc0yZy1zTXmxMuSmW8um8sjLOtGw7kZkvr/rQPsBq2Pb1weUVL2Xn
         j3Vxeo7Pm2E1o0Fyb8/fph9Jv1o8UaRuy8NtnjUzcFqVMZhLJVkxkazImisksnSpjstq
         PADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9or8qu6JKMppO0BjvG4KREN0TsiXIo9VR7tBdWz3E0=;
        b=wV/T9oD38+6L1cPC36ACt2pLl6tZjTeCiVJkfxQjy8KmFs/2zpjDBkgbmoNbic//Ak
         1ic2lt8AKC451qX32+8Vp/Jz3tz6aLmOyhX2fWQ7JEa8SHnYo3PZZjyEByJRn9u8nkiy
         AQ/boMEP423OByuJKgJwfLYz6QuM7ng5NxWhjAixt+7ec14IDxZDuCvPdd+wNLbL/6yq
         U5oStdZrrAjVFj7GCQ324Hwp1Pq83ovVHZIiYIrv8XiDgheatvmkyvwhZ8B2ckUz8/uw
         oti0vGlUy2rU+/Qs7AO3LMNTPD/H2RFGxOHo9rrmQlaEMqjVXzYw2u0QQY781pckoXyJ
         XgUw==
X-Gm-Message-State: ANoB5plA4BXhaRM53qKLm8e4xi7NQEfUtGUc2cgXRAnVkCVEtfEFkmJv
        UgnF1CLFfPZkKSbVSMCyW+TdqyDvVc9bR7dDzf7jSA==
X-Google-Smtp-Source: AA0mqf5fv+7lxM44X5zQadpbNX4thXysP7TTw1cJN8453k0zXr+e2ecNZCtvPFF7CSoZc8hzKCodtgJ5Kzs6Mo72Y6M=
X-Received: by 2002:a67:f04e:0:b0:3b1:1713:ba11 with SMTP id
 q14-20020a67f04e000000b003b11713ba11mr21573437vsm.76.1671548327302; Tue, 20
 Dec 2022 06:58:47 -0800 (PST)
MIME-Version: 1.0
References: <20221219191855.2010466-1-allenwebb@google.com>
 <20221219204619.2205248-1-allenwebb@google.com> <20221219204619.2205248-3-allenwebb@google.com>
 <Y6FaUynXTrYD6OYT@kroah.com>
In-Reply-To: <Y6FaUynXTrYD6OYT@kroah.com>
From:   Allen Webb <allenwebb@google.com>
Date:   Tue, 20 Dec 2022 08:58:36 -0600
Message-ID: <CAJzde04Hbd2+s-Bqog2V81dBEeZD7WWaFCf2BkesQS4yUAKiNA@mail.gmail.com>
Subject: Re: [PATCH v9 02/10] rockchip-mailbox: Fix typo
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, stable@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 20, 2022 at 12:46 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Dec 19, 2022 at 02:46:10PM -0600, Allen Webb wrote:
> > A one character difference in the name supplied to MODULE_DEVICE_TABLE
> > breaks a future patch set, so fix the typo.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: f70ed3b5dc8b ("mailbox: rockchip: Add Rockchip mailbox driver")
>
> How has this been an issue since the 4.6 kernel and no one has noticed
> it?  Can this code not be built as a module?  If not, then please
> explain this.

As mentioned in a different sub-thread this cannot be built as a
module so I updated the commit message to:

imx: Fix typo

A one character difference in the name supplied to MODULE_DEVICE_TABLE
breaks compilation for SOC_IMX8M after built-in modules can generate
match-id based module aliases, so fix the typo.

This was not caught earlier because SOC_IMX8M can not be built as a
module and MODULE_DEVICE_TABLE is a no-op for built-in modules.

Fixes: 556f5cf9568a ("soc: imx: add i.MX8MP HSIO blk-ctrl")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Allen Webb <allenwebb@google.com>

>
> thanks,
>
> greg k-h
