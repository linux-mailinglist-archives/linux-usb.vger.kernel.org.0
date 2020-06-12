Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E05DD1F784D
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jun 2020 15:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgFLNDI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Jun 2020 09:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgFLNC5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Jun 2020 09:02:57 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 049CBC08C5C2
        for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2020 06:02:56 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id i4so3836756pjd.0
        for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2020 06:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OjsEIaoHcea1DhIu7YNdmPx4ZJ9e2ZNfNuCA1LoRcds=;
        b=K747zNJcdGJb+tp3RYMqjqH/Ao63OtUTZXDlO9UTcnZjgCPt1Jl9Fc1V7N8k54fB8u
         lT6hn12iY0Dsm49Roh+DDRyAO56yRDOvLIdtEK6qTsA8qSVi6xaYb0Kc0ie7NVhxZbwT
         sjC1fIGlz0RPDaQpeGHIUn7bQear6WkX/RwE1q7XqdY9LoGg83+m3Wtm9L//kQ8ePi3K
         7X6mrp6ako2Bx5kUrSEQvGL1kaqMUveLHI2Utz2vDmfPFqr69gJgw/9ZK2VP1hCHG4Us
         aUTp2Sjp1iwvmGiPzCmuLB8Cjlty9Pc/IX7Co23x9VEtWCTS9JU/zmdvczrx6wwkspkt
         K2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OjsEIaoHcea1DhIu7YNdmPx4ZJ9e2ZNfNuCA1LoRcds=;
        b=VVdQ56JJnBqkJk/Nr8zW3wuNPpUQMX/qOKjxJWlcMSrTOZ+zAFYm9TNroppRoKRfLi
         P8nFXPdJWh4SjhOaxcvhk3ZIki+rMHaSqT7BnJLBMfMNDM28XmKby5wyiumZnDWoQo44
         uiaU3/a2NsCfakMj1/L8RKicznte25gE8HSXaFzJRcY+1GBCfDsLqfTNDi2e+AhyViB0
         0ulii+T1vs8uuWcWapmXGa58k/gLpzH6bkT4Fcs8kInF67CdY0eaTjrERpQ86Qtu72TV
         IY0BZAKIBHXouE2BNP24ZzqUOSKckL9wjhGeZQYwrEamEkNibWeW+b2UlUujLnUmSzgc
         8hxA==
X-Gm-Message-State: AOAM530g0yOE7lSMIM7CP5QPbK5uOL58tvM7+YHmGUe4n7aAGHp5EPh0
        QEEkJdjYyTGoYwR5NbQ2LXhX2BXPuFeJVzCRomyYyQ==
X-Google-Smtp-Source: ABdhPJwmUwEv6G1EQ6JjUqK3Ahp6e2Ahh0pmfuaWLgfj1MasEqYJmiCevLnNvSFRJHWyrPK8Z7FuiT+jD1wBQAfE0vo=
X-Received: by 2002:a17:902:e9d2:: with SMTP id 18mr11107279plk.336.1591966974929;
 Fri, 12 Jun 2020 06:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000fc837f05a1d619d5@google.com>
In-Reply-To: <000000000000fc837f05a1d619d5@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 12 Jun 2020 15:02:44 +0200
Message-ID: <CAAeHK+xwcnTZu08kikhT6R+cwfFxAE13Wv8eKA-8=O2PHueYKQ@mail.gmail.com>
Subject: Re: INFO: trying to register non-static key in ath9k_htc_rx_msg
To:     syzbot <syzbot+835e7082fea90ddd153f@syzkaller.appspotmail.com>
Cc:     ath9k-devel@qca.qualcomm.com,
        "David S. Miller" <davem@davemloft.net>,
        Kalle Valo <kvalo@codeaurora.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        linux-wireless@vger.kernel.org, netdev <netdev@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 27, 2020 at 2:30 PM syzbot
<syzbot+835e7082fea90ddd153f@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    e17994d1 usb: core: kcov: collect coverage from usb comple..
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=1274cdc5e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5d64370c438bc60
> dashboard link: https://syzkaller.appspot.com/bug?extid=835e7082fea90ddd153f
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1415bba7e00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12c3316be00000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+835e7082fea90ddd153f@syzkaller.appspotmail.com
>
> INFO: trying to register non-static key.
> the code is fine but needs lockdep annotation.
> turning off the locking correctness validator.
> CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.6.0-rc5-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  <IRQ>
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0xef/0x16e lib/dump_stack.c:118
>  assign_lock_key kernel/locking/lockdep.c:880 [inline]
>  register_lock_class+0x1022/0x11d0 kernel/locking/lockdep.c:1189
>  __lock_acquire+0xfc/0x3b60 kernel/locking/lockdep.c:3836
>  lock_acquire+0x130/0x340 kernel/locking/lockdep.c:4484
>  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
>  _raw_spin_lock_irqsave+0x32/0x50 kernel/locking/spinlock.c:159
>  complete+0x13/0x70 kernel/sched/completion.c:32
>  htc_process_conn_rsp drivers/net/wireless/ath/ath9k/htc_hst.c:138 [inline]
>  ath9k_htc_rx_msg+0x7c2/0xaf0 drivers/net/wireless/ath/ath9k/htc_hst.c:443
>  ath9k_hif_usb_reg_in_cb+0x1ba/0x630 drivers/net/wireless/ath/ath9k/hif_usb.c:718
>  __usb_hcd_giveback_urb+0x29a/0x550 drivers/usb/core/hcd.c:1650
>  usb_hcd_giveback_urb+0x368/0x420 drivers/usb/core/hcd.c:1716
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches

#syz dup: KASAN: use-after-free Write in ath9k_htc_rx_msg
