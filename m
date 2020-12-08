Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2871A2D2667
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 09:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbgLHIkY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 03:40:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727116AbgLHIkX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Dec 2020 03:40:23 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9595DC061749
        for <linux-usb@vger.kernel.org>; Tue,  8 Dec 2020 00:39:37 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id o24so18177041ljj.6
        for <linux-usb@vger.kernel.org>; Tue, 08 Dec 2020 00:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FYBwFHT6ts6d3LdzizBGqaEaTsORMxx0cJ3cfAGnO9c=;
        b=ANCVXpuBBPQ4mC+84CyJrMFrFtUU4Eme+DK4hJeEL79S2MBCGunI8SAGfZJVdy3EeC
         gMePR90XboaEz6JiXYdCdXqqORmnd9QFfGCtFjUEjGcxFUQYP6Q+vwVCIEKeAKpF04Tl
         8LhltuQAooKVQYp5GV52KK/dnaNvbTh6c8z4Oa93XpnwI0ScRJuiLNTHP0sKJvNmFn3j
         2KpURNkByL8RTTR156UUj3ES1BGnFaW/sTcpn4he5BAw21S8segSyKNg3MmqaMCDZ+SR
         7yDNN40c4lO1FFqEXK1HSMjalmiK/v/GHdg+szkiFEX80eAPserOFLHg+P1b/eK8iJBm
         ZrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FYBwFHT6ts6d3LdzizBGqaEaTsORMxx0cJ3cfAGnO9c=;
        b=pgNL4+gdx+Scy2eh9FMKCIYuRUjmt73oN4o3U8UIEtvQuIhR1zI52Ydo33D81M2WvG
         jmROIFUQP1DZ0i8nH61gcMbLFaCY/19PioIFxIps+dmmJ0mk2atN+r2TdrZuuNlba3ag
         9DlW7oyxKFfbxV9/e75rU1cXwQSmw7jcdNscTZ2naE+FGSR9bH7ymOEYT0rRqf1L9BY3
         KOLC6nrkRDV0b7rvHYN1XhSGrAbIbnA+hfeY/FLKxS1jhibyp/aUlirFmAITvRHTDwPy
         rVsY689bLno7AXXUZYN1S5VPiYaKOmiSsF73sbC5oqCgY9e4AxdoqRip8hYNI/2QxFW8
         O4Qg==
X-Gm-Message-State: AOAM532TI8MMNVHMODclwPdAEQR8xRVGpGlu1grrwufAiIx5Z/M9Dg/L
        W02k5x7kt6RLAGy8O7TRijt/HZ8crWr3ZNVcc7kMVA==
X-Google-Smtp-Source: ABdhPJwLO5cFqYaS6ENF1jIA6XJG84glIjQzoyFkVit2cz0NV7Pt/iU0osBHpi348QqWOhCaQsejmcOluwGJxRgIbIM=
X-Received: by 2002:a2e:b1c9:: with SMTP id e9mr10511552lja.283.1607416776163;
 Tue, 08 Dec 2020 00:39:36 -0800 (PST)
MIME-Version: 1.0
References: <20201201141048.1461042-1-linus.walleij@linaro.org>
 <43d788c69a0f4fe3caf578b98ae72395@kernel.org> <76a8c528f98df0797c79d870bb6587a4@kernel.org>
In-Reply-To: <76a8c528f98df0797c79d870bb6587a4@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Dec 2020 09:39:25 +0100
Message-ID: <CACRpkdaNQ_JgHX=1aEDBR5dpF-1b2Zwx-z8qG5F6VhRW_Au_Qg@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: ftdi_sio: Helpful error on GPIO attempt
To:     Marc Zyngier <maz@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 2, 2020 at 7:13 PM Marc Zyngier <maz@kernel.org> wrote:

> And to clarify what I mean, here's a patchlet that does the trick.
>
> maz@tiger-roach:~$ sudo gpioinfo gpiochip3
> gpiochip3 - 4 lines:
>         line   0:      unnamed       unused  output  active-high
>         line   1:      "AltFunc"     kernel  input   active-high [used]
>         line   2:      "AltFunc"     kernel  input   active-high [used]
>         line   3:      "AltFunc"     kernel  input   active-high [used]
>
> It at least make clear that you can't grab the GPIO. Of course, you
> don't get the message that you just added...

I think this looks good.

> +#include "../../gpio/gpiolib.h"

I suppose I can live with this because it's for a noble cause.

> Thoughts?

Could you combine it with a patch similar to min giving some probe() time
information that some GPIO lines are altfunc and where to get the tool
and send a proper patch?

Yours,
Linus Walleij
