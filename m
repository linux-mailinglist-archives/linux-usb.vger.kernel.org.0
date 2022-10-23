Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60D886094DC
	for <lists+linux-usb@lfdr.de>; Sun, 23 Oct 2022 18:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbiJWQqk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Oct 2022 12:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbiJWQqi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Oct 2022 12:46:38 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA0657248
        for <linux-usb@vger.kernel.org>; Sun, 23 Oct 2022 09:46:37 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id j6so778675qvn.12
        for <linux-usb@vger.kernel.org>; Sun, 23 Oct 2022 09:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vyuixz7FtK5XW5CZmBbyCIN1cJYtJoIWuEPQgd8UQk8=;
        b=Ar2qvKdq3KASst+JAnLN4i3PBzt/KTrS4k4cU7mIoDLH8DUYQtr46t5+ZnanGN0xRL
         djudYLAKPcmeN70dLbgtNxqsQHpn7WfyvVK26d65TV56W7o/IXAKyj3P92etth7qIvd/
         BCXKa0eR75PsXxeNNdPIjyBDL5B1U5svAQg0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vyuixz7FtK5XW5CZmBbyCIN1cJYtJoIWuEPQgd8UQk8=;
        b=3/jKxucrKDHB9fOKnQSgaKOxAWNdAOF7dT0jcJnheOsyfnYHSHqSdSynZt5gtzvGl3
         4wpwSkeuvj25tmEqi24Gvil4OYrZWAAlmYBP2OqorCQzxstLpfRM7n4GDY1m1RYbyJ1R
         3ELiiCuUGmg5caBg2UlBeQHhYkA475d8rfiIkAdqy0f/7otsNB+Rm6fcTJQNl1UL1bd3
         7xwqGtGHrWTdkRNfNRQDphNg74JZ8tDgHYeEVyj39aXyjShivMjVDLUEoMudv1p83Shn
         Cuz5aBQwlumBSiIdwIDWpcXK1UXzdkDqbO3gAILDTWKcuMsBPGiM8o9kqNrHc1JFWC/R
         v/zw==
X-Gm-Message-State: ACrzQf3uhDWvKUQd3Jx50OhipI2fF/99Ge+qDJQdodwQcyANCLPywmK6
        zCIPeMhpFiaOHk7ToH2zN0niozhXOgjcpA==
X-Google-Smtp-Source: AMsMyM6X+h6fgJTto8PntQcBoKffWCAk6I9xZHijTbsqEjb5673QxBT9EBydTmOm2MDI0DysWnPPLg==
X-Received: by 2002:a05:6214:acb:b0:4bb:6e76:d4af with SMTP id g11-20020a0562140acb00b004bb6e76d4afmr1537165qvi.119.1666543596434;
        Sun, 23 Oct 2022 09:46:36 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id k23-20020ac84757000000b0039cde2cd510sm11558970qtp.28.2022.10.23.09.46.34
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 09:46:35 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-36a4b86a0abso51299907b3.7
        for <linux-usb@vger.kernel.org>; Sun, 23 Oct 2022 09:46:34 -0700 (PDT)
X-Received: by 2002:a81:1902:0:b0:36b:2578:f6e2 with SMTP id
 2-20020a811902000000b0036b2578f6e2mr6530111ywz.352.1666543594506; Sun, 23 Oct
 2022 09:46:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221021064453.3341050-1-gregkh@linuxfoundation.org>
 <CAHk-=wggc19mf+WR=eg7h7MfVVNbE1c8b5vcOc6wmDASNTMddg@mail.gmail.com>
 <Y1Vjb9v2ggSjhRbc@kroah.com> <Y1VmBuVrkL7MSzjY@kroah.com>
In-Reply-To: <Y1VmBuVrkL7MSzjY@kroah.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 23 Oct 2022 09:46:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=whLgudbtXKbnTzGnqP7E2rY=BNSWayMbcZmPUHr3j8y5A@mail.gmail.com>
Message-ID: <CAHk-=whLgudbtXKbnTzGnqP7E2rY=BNSWayMbcZmPUHr3j8y5A@mail.gmail.com>
Subject: Re: [PATCH] USB: gadget: dummy_hcd: switch char * to u8 *
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Jakob Koschel <jakobkoschel@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ira Weiny <ira.weiny@intel.com>
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

On Sun, Oct 23, 2022 at 9:04 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> Along these lines, do we really not have a predefined macro/inline
> function that does:
>         (value >> 8)
> to give you the "high byte" of a 16bit value?

No macros like that. And honestly, why would you want a macro that is
more complicated than the operation itself?

But it sounds like what you actually want is just

     put_unaligned_le16(dum->devstatus, buf);

which does both bytes correctly (and turns into a plain 16-bit store
on sane architectures)..

               Linus
