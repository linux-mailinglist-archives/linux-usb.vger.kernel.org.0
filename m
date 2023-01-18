Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C75267153D
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jan 2023 08:42:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjARHml (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Jan 2023 02:42:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbjARHlN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Jan 2023 02:41:13 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06FF546096
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 23:05:02 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id c124so37000119ybb.13
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 23:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RWIUcIYgcQkK0f/sIUCOgX2DuZrEEVB1UO5r6QoL9lw=;
        b=ENzpBFhPlcCihyjjyCNhOyBYcpNs4eQRy9VQCTJjqeAdPU+XuQD15jm8kNXaZs3mVO
         Rs/RYvncah5joqCL8p/hpgG9c6S6W4cgLhbQIw+bEkschv0gt/4mbpWidS+e+KfWOuMs
         nfeUYHCA1NOPmnhFy+BiJf0b495/McVrE0LawulUeUE+j7nE62L29ww5wn2xjpAEFixi
         V2Ymc7Q5+t3vZBa4bOtMNl38atsWdO9ZZXws01LVfnRYGgEUzYiRT7qzi7lNTCmZNmk3
         iQ0hdyp0sUNtFrl98h3gU8nxKzglZ1lmP87NzD/Le4yL911F2GmCtkfuFU0nydPCta6u
         7NEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RWIUcIYgcQkK0f/sIUCOgX2DuZrEEVB1UO5r6QoL9lw=;
        b=pa1ErNPjNiUCGfDgdnpNXR+j6LilSfTcku2FRjwtZRaUnOWp7hCe2De7DyDbTwsn+j
         SD9k0OIhw6Px4dtUayx4Na6M6VoNynUvGe9dMnCr79TTtRGyBkmTQSCkgNYWnLlGDgVZ
         AmBeNVVRnTSwNbPQ0kkNKpbaaBwa5Prhdy3Rn4bGV0Y/cTgT0JEQAYm6VomT34FaHV8O
         /LkDIxxOpQH22s7YWl99LrB1x/dm6bQHlddYGVO4iA1o0W6CUfLuzo/rSsK9ID8ncDGc
         kEOumbuKtGOi4GjNC2X5LDEONjwS4OrU7RiZTpSAOySx1AkIKxUebd9WToWjEzqeD9z3
         GoPQ==
X-Gm-Message-State: AFqh2kp/pW5+v3lNBPjocdixP+zk4vdn5xuFaYYblVb97s9mEaZY1Y4X
        WBT9HICMw60YXZRzeCYvGFx3boaWAaq+lpYGlUfzcA==
X-Google-Smtp-Source: AMrXdXu5Pbi5SOFwW0RWmqObqTSmr+IievVVthez/yxv4Os97jPuhnm0GaAa17j3AJPPgW1V0oaQ8oF8ZqwqXGb8cMY=
X-Received: by 2002:a25:c092:0:b0:7d2:8687:aea5 with SMTP id
 c140-20020a25c092000000b007d28687aea5mr841276ybf.210.1674025501906; Tue, 17
 Jan 2023 23:05:01 -0800 (PST)
MIME-Version: 1.0
References: <20230103-gemini-fotg210-usb-v1-0-f2670cb4a492@linaro.org> <CACRpkdaE+b_=6mecuWe4EUfYP9C3j5cXZXMO0s2t7Bf3eMtV_A@mail.gmail.com>
In-Reply-To: <CACRpkdaE+b_=6mecuWe4EUfYP9C3j5cXZXMO0s2t7Bf3eMtV_A@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 Jan 2023 08:04:50 +0100
Message-ID: <CACRpkdaCUL+met+qvsn6VbFiRgPiHpZs5DfDdjSQ=97HGcBSCw@mail.gmail.com>
Subject: Re: [PATCH 0/7] usb: fotg210: Various improvements
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fabian Vogt <fabian@ritter-vogt.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 18, 2023 at 8:03 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Jan 4, 2023 at 12:35 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > This is some gradual improvements to the FOTG210 dual-mode
> > USB host/gadget driver.
>
> Been two weeks, something I should change or are these good to
> go?

Ah no wait I see it, a small change needed on the DT binding.
I'll respin.

Yours,
Linus Walleij
