Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4E6868AC3E
	for <lists+linux-usb@lfdr.de>; Sat,  4 Feb 2023 21:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232416AbjBDUPQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Feb 2023 15:15:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbjBDUPP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Feb 2023 15:15:15 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E000225E09
        for <linux-usb@vger.kernel.org>; Sat,  4 Feb 2023 12:15:14 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id v10so8175941edi.8
        for <linux-usb@vger.kernel.org>; Sat, 04 Feb 2023 12:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f4ywijtaY02FSmYMelb7donp08M4aMndocGVk6yD46s=;
        b=hOYfD5fYC3t7tC4Fr6BctVAvniUmd0wk4IJsNnlxxBOs+a/xNu85oNtAQvHEs8TbXO
         Mmvvj/Vh/22A+H0DmUQk8+0yGr7bUroC8Ovn5XbIP4itrLpV32+QRQKpKT+V/nIceL+4
         k+AuuoDFi3XIrwKnj9fynXZyLNTOdL4uzwhUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4ywijtaY02FSmYMelb7donp08M4aMndocGVk6yD46s=;
        b=ybD1FGfdhOfeWE+yvjMJ5ztjhzDe/hlC8by9dbiR60h34Cs2lDBZvF7Sx4mccCMRAh
         Cuz5ZN0PEfpU/kf2Gh2pbBNCprB4+TZwo51Ln7YjjOZMoN5BUDpxSnnYeN/CK2m380aP
         WcHZEcPn5AD9s4enxLbUXYfhh8BupduRoai1i4u2VHichEtvEDR3QEHXHgM89Z0czIRp
         5vaIv6mNWKIwJ0HOUAVs0S5N8yDSgzzPgyaKCuiHPJUGM8X4Cxi8lyeieCoGDv5sQyhG
         qAlgypv0kWC8bVuf6dintLA1s7vc1DJEieWRVpf1RMfuLGYaD1me/EOPUJpnXYgxcR0w
         H9AA==
X-Gm-Message-State: AO0yUKXDTXdnhKMfvpv1vhkmbC6Em9UjXFFQl9AUU3oYD/SJV40Y3Vqh
        5+uXcg8sGSQEi/1IKCttsWXkjR/PG1cdkkKfrIo=
X-Google-Smtp-Source: AK7set/vq6mLh8seuhokRAvkPYwFydcJfv62Rz2+8eWuFQ2H0a0bZ5lVQs6Oxi+IniKm9FpWykvVvg==
X-Received: by 2002:a05:6402:1f83:b0:4a2:51db:c7c6 with SMTP id c3-20020a0564021f8300b004a251dbc7c6mr14796935edc.8.1675541712953;
        Sat, 04 Feb 2023 12:15:12 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id m10-20020a056402430a00b0048eb0886b00sm2953404edc.42.2023.02.04.12.15.12
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Feb 2023 12:15:12 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id dr8so24056318ejc.12
        for <linux-usb@vger.kernel.org>; Sat, 04 Feb 2023 12:15:12 -0800 (PST)
X-Received: by 2002:a17:906:892:b0:87a:7098:ca09 with SMTP id
 n18-20020a170906089200b0087a7098ca09mr3773254eje.78.1675541711686; Sat, 04
 Feb 2023 12:15:11 -0800 (PST)
MIME-Version: 1.0
References: <28a82f50-39d5-a45f-7c7a-57a66cec0741@I-love.SAKURA.ne.jp>
 <Y95h7Vop9t5Li0HD@kroah.com> <a236ab6b-d38c-3974-d4cb-5e92d0877abc@I-love.SAKURA.ne.jp>
 <Y957GSFVAQz8v3Xo@rowland.harvard.edu> <cf56ebc3-187a-6ee4-26bc-2d180272b5cf@I-love.SAKURA.ne.jp>
 <Y96HiYcreb8jZIHi@rowland.harvard.edu> <917e1e3b-094f-e594-c1a2-8b97fb5195fd@I-love.SAKURA.ne.jp>
 <Y965qEg0Re2QoQ7Q@rowland.harvard.edu>
In-Reply-To: <Y965qEg0Re2QoQ7Q@rowland.harvard.edu>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 4 Feb 2023 12:14:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjoy=hObTmyRb9ttApjndt0LfqAfv71Cz+hEGrT0cLN+A@mail.gmail.com>
Message-ID: <CAHk-=wjoy=hObTmyRb9ttApjndt0LfqAfv71Cz+hEGrT0cLN+A@mail.gmail.com>
Subject: Re: Converting dev->mutex into dev->spinlock ?
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Hillf Danton <hdanton@sina.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Feb 4, 2023 at 12:01 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> I'm sorry, but that simply is not feasible.  It doesn't matter how much
> you want to do it or feel it is needed; there is no reasonable way to do
> it.  To take just one example, what you are saying implies that when a
> driver is probed for a device, it would not be allowed to register a
> child device.  That's a ridiculous restriction.

Well, we've worked around that in other places by making the lockdep
classes for different locks of the same type be different.

So this *could* possibly be solved by lockdep being smarter about
dev->mutex than just "disable checking entirely".

So maybe the lock_set_novalidate_class() could be something better. It
_is_ kind of disgusting.

That said, maybe people tried to subclass the locks and failed, and
that "no validation" is the best that can be done.

But other areas *do* end up spending extra effort to separate out the
locks (and the different uses of the locks), and I think the
dev->mutex is one of the few cases that just gives up and says "no
validation at all".

The other case seems to be the md bcache code.

                  Linus
