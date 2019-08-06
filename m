Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A16D83366
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 15:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730756AbfHFN4B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 09:56:01 -0400
Received: from mail-ot1-f70.google.com ([209.85.210.70]:51876 "EHLO
        mail-ot1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbfHFN4B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Aug 2019 09:56:01 -0400
Received: by mail-ot1-f70.google.com with SMTP id h12so49336703otn.18
        for <linux-usb@vger.kernel.org>; Tue, 06 Aug 2019 06:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=qijQXaVtPhJ0ULp7HfVEsfqXpyhAuXkccMDhfkyKHL8=;
        b=jJ29ewwv8Fk1DutBDsVEUmBr+PLb8NWXJGMzvwxOQLxAseR86AbYQdn+WQxGEwbRS7
         71gIV0grE6nCf/KipLu0VHCrUENOfgT6aWDj18bnTdVIayqEuJF00lVj2RXPPLVcn/zq
         jEg+gFWDR2OghwjJUuj8e6hUSN6rC3Tlk+aHadEHiN8XMrXQfITJuOJNpVSS2BjmjCEg
         eKKPy5zn5ZooDnDjmud0E/isS1HRs9bpSPPizSUFIuj10IavNambFHPGdc0xg/cE4mMz
         /HyKujVNchEEhriGSDOQLIHsQJhDTXZT6Q8L6kWF7yyJeI1pmNgpBgbYy+0uhp/34UNF
         kuoA==
X-Gm-Message-State: APjAAAU1Pclyh0Be2e18FGW8QbTDGZ1Yd6Rnd+EegitvuIBkFxEn6cnz
        Zpe+noyJGaJwwk5kIk2koPqfYP/40FjWxSgc6iS1nN3NPeNc
X-Google-Smtp-Source: APXvYqwhNuvTgJETVJXzBH+VoSV74VuuZsvzGDgdxSSVeDf/xAVJrHMxocyf4fYvE3Z8zYJ+Jr2+mXL0uH7ny8ea7Au0c4vg9KEm
MIME-Version: 1.0
X-Received: by 2002:a6b:3bc9:: with SMTP id i192mr118197ioa.33.1565099760353;
 Tue, 06 Aug 2019 06:56:00 -0700 (PDT)
Date:   Tue, 06 Aug 2019 06:56:00 -0700
In-Reply-To: <1565098635.8136.25.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004121bd058f732f5d@google.com>
Subject: Re: WARNING in __iforce_usb_xmit/usb_submit_urb
From:   syzbot <syzbot+5efc10c005014d061a74@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, linux-usb@vger.kernel.org,
        oneukum@suse.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+5efc10c005014d061a74@syzkaller.appspotmail.com

Tested on:

commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13554e26600000

Note: testing is done by a robot and is best-effort only.
