Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1017E6095DD
	for <lists+linux-usb@lfdr.de>; Sun, 23 Oct 2022 21:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbiJWTl7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Oct 2022 15:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiJWTl5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Oct 2022 15:41:57 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D457B6D57E
        for <linux-usb@vger.kernel.org>; Sun, 23 Oct 2022 12:41:56 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id y69so5209931ede.5
        for <linux-usb@vger.kernel.org>; Sun, 23 Oct 2022 12:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NuCOJBg1impGUfm2S7vnGWbP9PF3qSOTU1k32z2Jwm0=;
        b=MVujCkpNan6Kj2IZYDkAW+7m3f7wWn9qG857aeEYtEuasVWldzY4Rw0XWxZLZmjWQs
         CPatmhIzLxCQ2dJLLYyPMO+TtNQMeSdpmNOaZW26Ybbr+y1B9IWwpnhU/4C8Se64V7B+
         6+ULFTvMjHys+kpHcqiE1yDRgycmK9+Dfvwet8jgoYm85731l/1gJD3UKYlD6t+17639
         XZ8Rye+7Jyq7FmXnTQIcB5pRKiYxCNbE67Rsn5huouQI+91Dreofq6AXAAG3s8pzQwtx
         8uTCTaf57B8bDmjsGhcjCq/WqZeJpDWDu2n6gNKhZY4NgMG0/1/wcLCCEGgR0QJWqHe9
         3Qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NuCOJBg1impGUfm2S7vnGWbP9PF3qSOTU1k32z2Jwm0=;
        b=mc9YxbXJ2m2BCEv26p55HyCcyT23xq8TL2fr5/oJk06yrBqLHx9B5ERMUmgGoznSlS
         /3KWJzhp87LqdIUdcaKtjnDRZFmYhwPu6osboYJZ5Cc5Zp9m1a+x49DRSeLZuy0I62T2
         SvZ1B239yUMCTIp/X0M5/rbwytHRXv1zaDGacbR1eow+vpVE3qM26dGHJ4cRIUDf6Dcy
         NAV52Oh0QuM+H0bZ0j1nhBI+fJM/6XULn2PSGjdRiE3TD8+f9Z7Wl2BO6zGpJtvn9mox
         ReJJC3gQf1moHZNBhTH6PDHl1H7fSqrbfry0smmB+CIj8qeixGzM0nyxwqGcN6YrcsuI
         lQmA==
X-Gm-Message-State: ACrzQf3asi9TFkSHke1AOjY7a39bEPyr74sjmEluw2D68PKaMx1zOMC1
        GuLmDV6eYXfCbUp57hgLtximI7m+syBamzdhQM+szw6eizQ=
X-Google-Smtp-Source: AMsMyM6vAhJpCg7ho3bYNPJuNwTXMAkqP/CCzwNmU5tp1N9U1/XF4PTLrPykWp302Ip+trZJ166LiuVcx5IP8bpDwjk=
X-Received: by 2002:a05:6402:1d55:b0:45f:c87f:c753 with SMTP id
 dz21-20020a0564021d5500b0045fc87fc753mr19712795edb.32.1666554115428; Sun, 23
 Oct 2022 12:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221023144708.3596563-1-linus.walleij@linaro.org> <Y1VeuNSYZOpq1lXy@kroah.com>
In-Reply-To: <Y1VeuNSYZOpq1lXy@kroah.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 23 Oct 2022 21:41:44 +0200
Message-ID: <CACRpkdZRdt7KrFJo6DE1NJJQnw+OD9OovGjka-KaH4-Dwh-_+A@mail.gmail.com>
Subject: Re: [PATCH 1/3 v1] usb: fotg210: Collect pieces of dual mode controller
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Fabian Vogt <fabian@ritter-vogt.de>,
        Yuan-Hsin Chen <yhchen@faraday-tech.com>,
        Felipe Balbi <balbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Oct 23, 2022 at 5:33 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:

> Is this IP block still showing up on new devices?

Don't think so.

>  It is really old, and
> OTG is long dead from what I remember.  Does any real device actually
> support that type of mode?

What is supports is dual role. In the Gemini devices that I work on
it is either host or peripheral never role switching.

> I have no objection to taking these, and I'm glad to see you maintain
> them, I just don't want you to have to maintain dead code for devices
> that are not around anymore.

Oh, I use it, others use it (new devices were added recently by
Corentin Labbe) and it has full support in the OpenWrt distribution.

I also have a few more patches cooking, but figured collecting the
stuff in one place would be the first step.

Yours,
Linus Walleij
