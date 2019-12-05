Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD46114600
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2019 18:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730157AbfLERd0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Dec 2019 12:33:26 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41554 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730151AbfLERd0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Dec 2019 12:33:26 -0500
Received: by mail-lj1-f194.google.com with SMTP id h23so4520748ljc.8
        for <linux-usb@vger.kernel.org>; Thu, 05 Dec 2019 09:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=/eKd/FDqrplPYUuvbR0AiU2l8M+m4LPxDGweCaRKq6w=;
        b=M56np70zVr1VfiJPsuEXyT4OG9+Mgq+nZRonIdlMO0qNjSITB1EVwHnE+jM9THnBNz
         3vX00ZNLigUAoH1Qop/bcwkoEis8chlXpTrSREoavAISt/m/5l5mLyPd23rMwP17l/QA
         7M9TY3swoS1z9u0iCZT3it6ySOEzIm2iiZPAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=/eKd/FDqrplPYUuvbR0AiU2l8M+m4LPxDGweCaRKq6w=;
        b=iQSDuuoO/sceJQkicW4LiNkrEIRaqCNhKbD6YY1t/OK7IoTCysrCBvQK5wVtzQspEi
         tkHv0l4Yq3nZ/6MS9F0V5/GIDW2vZYovSlSAebvFnvsXN2TtGzHzg7GLDNW8zaRciBTX
         qSgcNva0g4IdmD6ZK/OqJsDpNHsKyLB2An36TF8IipMhssgChgDIdbzTcCXSpgjaWw4q
         xOUz/uVQuDR/cCHU8ltc4GqH+d9dyyYnSpmPmESpguevbD6kfBndcBFGPkoBVIlXRch+
         bv23eg+5ctEg8UZ+nvmX1BEUq5yYmEn8TaNLgVfxVVmqlDB9HYYS0Bh1YVtN7M1nHFS3
         3MIQ==
X-Gm-Message-State: APjAAAU1wV0Wvf6pxgN5H3yBMnPdvjZ3xCX7BsckrWaa7SVi2FuVKH18
        Jo/7Rf+6zca+vbUKGfah7rDJkeWVRCY=
X-Google-Smtp-Source: APXvYqyqZhsWc4QVlVaXYa5H465/9EH1mq/rldKxYtLniW4w+sKszXyifVgqySubmzNiTxpq27J9JQ==
X-Received: by 2002:a2e:88d6:: with SMTP id a22mr5979461ljk.163.1575567203546;
        Thu, 05 Dec 2019 09:33:23 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id c9sm4319635ljd.28.2019.12.05.09.33.20
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2019 09:33:21 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id b15so3125328lfc.4
        for <linux-usb@vger.kernel.org>; Thu, 05 Dec 2019 09:33:20 -0800 (PST)
X-Received: by 2002:ac2:430e:: with SMTP id l14mr2520386lfh.79.1575567200366;
 Thu, 05 Dec 2019 09:33:20 -0800 (PST)
MIME-Version: 1.0
References: <20191205125826.GK2734@twin.jikos.cz> <31452.1574721589@warthog.procyon.org.uk>
 <1593.1575554217@warthog.procyon.org.uk> <20191205172127.GW2734@suse.cz>
In-Reply-To: <20191205172127.GW2734@suse.cz>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 5 Dec 2019 09:33:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=whw+R5GVQdpV6J_5afQ=76vtBPzBPRj6-zG1tnhT32Pag@mail.gmail.com>
Message-ID: <CAHk-=whw+R5GVQdpV6J_5afQ=76vtBPzBPRj6-zG1tnhT32Pag@mail.gmail.com>
Subject: Re: [GIT PULL] pipe: Notification queue preparation
To:     David Sterba <dsterba@suse.cz>,
        David Howells <dhowells@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>, raven@themaw.net,
        Christian Brauner <christian@brauner.io>,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 5, 2019 at 9:22 AM David Sterba <dsterba@suse.cz> wrote:
>
> I rerun the test again (with a different address where it's stuck), there's
> nothing better I can get from the debug info, it always points to pipe_wait,
> disassembly points to.

Hah. I see another bug.

"pipe_wait()" depends on the fact that all events that wake it up
happen with the pipe lock held.

But we do some of the "do_wakeup()" handling outside the pipe lock now
on the reader side

        __pipe_unlock(pipe);

        /* Signal writers asynchronously that there is more room. */
        if (do_wakeup) {
                wake_up_interruptible_poll(&pipe->wait, EPOLLOUT | EPOLLWRNORM);
                kill_fasync(&pipe->fasync_writers, SIGIO, POLL_OUT);
        }

However, that isn't new to this series _either_, so I don't think
that's it. It does wake up things inside the lock _too_ if it ended up
emptying a whole buffer.

So it could be triggered by timing and behavior changes, but I doubt
this pipe_wait() thing is it either. The fact that it bisects to the
thing that changes things to use head/tail pointers makes me think
there's some other incorrect update or comparison somewhere.

That said, "pipe_wait()" is an abomination. It should use a proper
wait condition and use wait_event(), but the code predates all of
that. I suspect pipe_wait() goes back to the dark ages with the BKL
and no actual races between kernel code.

               Linus
