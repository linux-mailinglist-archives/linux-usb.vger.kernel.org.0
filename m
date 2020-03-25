Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84BD41921D6
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2020 08:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgCYHoE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Mar 2020 03:44:04 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:36658 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgCYHoE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Mar 2020 03:44:04 -0400
Received: by mail-il1-f197.google.com with SMTP id e5so1255836ilg.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2020 00:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=gNDY/4UDpTVqa+EmUfktT2GdNAoB4MqoMT+n2q2xnEA=;
        b=LUc0+3hIVpRsnMjNVr/Iu1xQVrmpv+Uj1M7vAbqfcDL8Wk2qF5uhdHopdZH8mtoQdv
         IyndLjphn9s39hfnwUnKSiOrRSTy0UsLyUQrCc7uKJA/dvJdhyJyfq9wmfiGoGwC2rmt
         nRrCE/g+KfgPWkjFj9ax+8oMQe170E/TooC348766wUm6dMQe8m8NvRa5LgOoKqsvP/p
         P5K85xzxHjju3IcfYMkjyQ/z+DWG+DvUWlMNTagIQuD3AX3o8eUOEkzsBLc/GJRkL9Ed
         6hs2fhekhgoVDy+NJKAzlbK5ZlzHZLDu8u/ur3pHKGOOf+GrwXhPIAm6bOyA1KV5LQDr
         XdTA==
X-Gm-Message-State: ANhLgQ256ZUbRpT+sMMNfixBGRzD9RKCZ+zRk7OPR2tivT/E4rlFuDG/
        EgE9VhcqnImDyV/J9FI5I7T0cQyszZgk4rvWL1PB1/AkNKiS
X-Google-Smtp-Source: ADFU+vuBr+EZqBTQ32wJc4atYKAMwj4v+Mqkla7YUlAYoGt0z26bZnT9J44rCUzLh4uY869UZtxGAlKJiiioaHFFRlgh9dhzUR27
MIME-Version: 1.0
X-Received: by 2002:a02:6016:: with SMTP id i22mr1794989jac.87.1585122243625;
 Wed, 25 Mar 2020 00:44:03 -0700 (PDT)
Date:   Wed, 25 Mar 2020 00:44:03 -0700
In-Reply-To: <CADG63jBvx_NarKZT-+QmMAgdHKoYSQwtd9KO0c6rxkgtF_JnyA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000041cce505a1a9087d@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in edge_interrupt_callback
From:   syzbot <syzbot+37ba33391ad5f3935bbd@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, anenbupt@gmail.com,
        gregkh@linuxfoundation.org, johan@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger crash:

Reported-and-tested-by: syzbot+37ba33391ad5f3935bbd@syzkaller.appspotmail.com

Tested on:

commit:         e17994d1 usb: core: kcov: collect coverage from usb comple..
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=5d64370c438bc60
dashboard link: https://syzkaller.appspot.com/bug?extid=37ba33391ad5f3935bbd
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=165cc813e00000

Note: testing is done by a robot and is best-effort only.
