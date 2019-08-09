Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB9BA88211
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 20:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436696AbfHISMB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 14:12:01 -0400
Received: from mail-ot1-f71.google.com ([209.85.210.71]:38258 "EHLO
        mail-ot1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726601AbfHISMB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Aug 2019 14:12:01 -0400
Received: by mail-ot1-f71.google.com with SMTP id j4so70454994otc.5
        for <linux-usb@vger.kernel.org>; Fri, 09 Aug 2019 11:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=juvNBN/n24mlNNUWzWS/M6ifWN4KA2DR9+5YTUt7YfI=;
        b=ZOGERjQBg4DBEZHabHR+Sw6BWZMadb3mvRaDjXApy4gnQ/apI9jA5Awn2ShI+kxWUV
         H5UEWgLBPg51T/VYB6x2UlDpQONqXdeET4gnCLiMaeiZmJqhnRAlshOtbWBvmjRv4UJO
         0Ppi1yAJNd0H7066h9SYYptsiS5PJnJvxOwFMyFvwxNf8juft+vu5B077T7YD85woAF9
         G6BuFiRnQ65vJG4uoJNJ6s2nPnVSLKVgRlLr10d4lTPbAy1+Md5jrkt2mZI97ZNm939c
         cQWH7+KkwNJYMVyq5NFyEYBByr9P4qOcjs7mZEvJYwZisdW94jpuKoipM2O89rqkcQgA
         1gpQ==
X-Gm-Message-State: APjAAAV8Xbe4g9HIpNrhaHMIow9fEBlQhqgxDOCuTI/TXJ9Kqrg2d1zs
        cLAThZ/mu82NXlGzdqrjK+FD/unVAudiuJCMZDVhsdwnzeCx
X-Google-Smtp-Source: APXvYqxq8b+5+hYkQ4lMni74rmrRyi7Er9ZtYObqZ3XCZ0rzaKQYP6TEsTAdi644kHaKiDB1RTA3Am7wCQpLZ4qyqzHlXTETV8Nu
MIME-Version: 1.0
X-Received: by 2002:a6b:e511:: with SMTP id y17mr8271947ioc.228.1565374320336;
 Fri, 09 Aug 2019 11:12:00 -0700 (PDT)
Date:   Fri, 09 Aug 2019 11:12:00 -0700
In-Reply-To: <CAAeHK+yWhR2bwknCA9pTjy8qFE3-xCcEEZ5Skm5=sYCuypvo_A@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004de4e2058fb31c2b@google.com>
Subject: Re: KASAN: use-after-free Read in usbhid_power
From:   syzbot <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, hdanton@sina.com, linux-usb@vger.kernel.org,
        oneukum@suse.com, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com

Tested on:

commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17fcd52c600000

Note: testing is done by a robot and is best-effort only.
