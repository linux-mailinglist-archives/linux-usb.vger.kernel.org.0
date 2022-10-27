Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36E546103A9
	for <lists+linux-usb@lfdr.de>; Thu, 27 Oct 2022 23:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236840AbiJ0VC4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Oct 2022 17:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236685AbiJ0VCb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Oct 2022 17:02:31 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFCA9E2C
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 13:54:28 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id f8so2068946qkg.3
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 13:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oSQGNRMEvUKfx6go8ULfblA0p1pLNMVNwBSwzmOAVIQ=;
        b=KiOYl6oYgVWmVt5yfOwXFbg2uqh6VMRSaNrvgwmuxSGJROVhF0gOA1n6rrYx8VRW6R
         VVZ63rmL9pY6OoKE9oUm6undU4L2Zw1Drahl+CZCyz+M4M06l6JRo9sMPUn+pAaD9PiI
         Dk7dgLCKUTOIMkWDgv7w/+2Fdi4C07XO5WJgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSQGNRMEvUKfx6go8ULfblA0p1pLNMVNwBSwzmOAVIQ=;
        b=OrokNSOndUJPoRUEpiHSu8iwTvSD4JMtW1i/u5Xn7BzDkqUgYPioyUpalY+4eMGDtC
         DanyET9315t5KjQEEIohCd/6/QRheFlzlkbtKxAaxh0EXPUL0Yb0lCDKdMaASF+WYarK
         p6TrUtq3y+YZqYh5Jw3fGGTqFFunsP6nAzaujMGkqlXBKGSNkmFwzIBxXaOT83wUIT2n
         c8nZ77CsrmdtJq+JS6oQSEWhC0FFLOzobrYlPR8+7ZuKk86ma6RbHntf6BfO8bHjZyqU
         3C6oZoBPPPJdnimrOZKLP6w0p6monf15Rw7P1Z6368GuzdvVAR4Q96W4JgPG7wu16iys
         fyiQ==
X-Gm-Message-State: ACrzQf3bASpvLdAAZLRx0IbvmccWX9/+3GungjGcl079H+zu0K4hH/cj
        5qlXjP17BACEWwMROig09axTv3PnPv9uGw==
X-Google-Smtp-Source: AMsMyM6gLM3vH/v16vRoOPYOcGWwgPBHYJ01GQn1WKWNpt3fF3NMAUgPZq/sKfS+I/WJSquC8UqEkQ==
X-Received: by 2002:a05:620a:2a09:b0:6ee:7d3e:687f with SMTP id o9-20020a05620a2a0900b006ee7d3e687fmr36536118qkp.572.1666904067842;
        Thu, 27 Oct 2022 13:54:27 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id x10-20020a05620a258a00b006ceb933a9fesm1668500qko.81.2022.10.27.13.54.27
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 13:54:27 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 63so3807260ybq.4
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 13:54:27 -0700 (PDT)
X-Received: by 2002:a05:6902:124f:b0:66e:e3da:487e with SMTP id
 t15-20020a056902124f00b0066ee3da487emr49547816ybu.310.1666903751005; Thu, 27
 Oct 2022 13:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221027150525.753064657@goodmis.org> <20221027150928.780676863@goodmis.org>
 <20221027155513.60b211e2@gandalf.local.home> <CAHk-=wjAjW2P5To82+CAM0Rx8RexQBHPTVZBWBPHyEPGm37oFA@mail.gmail.com>
 <20221027163453.383bbf8e@gandalf.local.home>
In-Reply-To: <20221027163453.383bbf8e@gandalf.local.home>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 27 Oct 2022 13:48:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=whoS+krLU7JNe=hMp2VOcwdcCdTXhdV8qqKoViwzzJWfA@mail.gmail.com>
Message-ID: <CAHk-=whoS+krLU7JNe=hMp2VOcwdcCdTXhdV8qqKoViwzzJWfA@mail.gmail.com>
Subject: Re: [RFC][PATCH v2 19/31] timers: net: Use del_timer_shutdown()
 before freeing timer
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Mirko Lindner <mlindner@marvell.com>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Martin KaFai Lau <martin.lau@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Kuniyuki Iwashima <kuniyu@amazon.com>,
        Pavel Begunkov <asml.silence@gmail.com>,
        Menglong Dong <imagedong@tencent.com>,
        linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
        bridge@lists.linux-foundation.org, netfilter-devel@vger.kernel.org,
        coreteam@netfilter.org, lvs-devel@vger.kernel.org,
        linux-afs@lists.infradead.org, linux-nfs@vger.kernel.org,
        tipc-discussion@lists.sourceforge.net
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

On Thu, Oct 27, 2022 at 1:34 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> What about del_timer_try_shutdown(), that if it removes the timer, it sets
> the function to NULL (making it equivalent to a successful shutdown),
> otherwise it does nothing. Allowing the the timer to be rearmed.

Sounds sane to me and should work, but as mentioned, I think the
networking people need to say "yeah" too.

And maybe that function can also disallow any future re-arming even
for the case where the timer couldn't be actively removed.

So any *currently* active timer wouldn't be waited for (either because
locking may make that a deadlock situation, or simply due to
performance issues), but at least it would guarantee that no new timer
activations can happen.

Because I do like the whole notion of "timer has been shutdown and
cannot be used as a timer any more without re-initializing it" being a
real state - even for a timer that may be "currently in flight".

So this all sounds very worthwhile to me, but I'm not surprised that
we have code that then knows about all the subtleties of "del_timer()
might still have a running timer" and actually take advantage of it
(where "advantage" is likely more of a "deal with the complexities"
rather than anything really positive ;)

And those existing subtle users might want particular semantics to at
least make said complexities easier.

               Linus
