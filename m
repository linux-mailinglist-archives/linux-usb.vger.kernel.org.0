Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29DCDFB99
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 16:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbfD3OgI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 10:36:08 -0400
Received: from mail-it1-f200.google.com ([209.85.166.200]:35208 "EHLO
        mail-it1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfD3OgH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 10:36:07 -0400
Received: by mail-it1-f200.google.com with SMTP id a64so2508208ith.0
        for <linux-usb@vger.kernel.org>; Tue, 30 Apr 2019 07:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=VMgx+6iCouIm6T5SwvF74+0r6jbRUy69gSjvtJBIKSQ=;
        b=N4iLCfafGZK6zy/11qzGa1UWRbL7wEtGDWULZRufaKeCSvIGE3oC/MmqlQvbGQA4E7
         u1dFLkhcDhLNnSWvqoyakQo0ttmxF43oLMlwwEF1jOvAjR9DCMDGFuCH7/amtMKqqCtZ
         BH8+zKqgSlRhDYhNeZplLgSN717F3bj+SiFCnjj/rEwTMstz+9V9zjkrRKr73im8k3jm
         kTNJxEmSYu0ubbu70JAEd+X63DlMB8NqpA0aTJnaDyvhOrxWJ36N9vCZSSdwmAUyHBlg
         cfyHtJ9M6Y7v4/RjKAmyE7hMSxwvMkhRhPa3OteVg0Xe9gdVhqzUVp4ggHTis5CNKwQU
         6OxQ==
X-Gm-Message-State: APjAAAWBWxNDqGxyJK8z2P2yTK6hEiKTBDcD5qBHrDpHiWvrlVT/96F7
        5TJLHV8cBeEEerhBnSam3whv7Ku/4sspARnnwhGHhbvoKD83
X-Google-Smtp-Source: APXvYqww/ewYXb9i3zqf03E6NoKS0d1c1UmjiyQxO4HoOQO7SuLXd192xFmZI/8UqdLnSUPSIFEXRwaZjXMr0X+UDcLq/KkO++/U
MIME-Version: 1.0
X-Received: by 2002:a05:660c:9c2:: with SMTP id i2mr3941634itl.80.1556634967014;
 Tue, 30 Apr 2019 07:36:07 -0700 (PDT)
Date:   Tue, 30 Apr 2019 07:36:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004101370587c052fb@google.com>
Subject: WARNING: Support for this device (Terratec Grabster AV400) is experimental.
From:   syzbot <syzbot+af8f8d2ac0d39b0ed3a0@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    9a33b369 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=141ca62d200000
kernel config:  https://syzkaller.appspot.com/x/.config?x=23e37f59d94ddd15
dashboard link: https://syzkaller.appspot.com/bug?extid=af8f8d2ac0d39b0ed3a0
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1405bedd200000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13ce3bbb200000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+af8f8d2ac0d39b0ed3a0@syzkaller.appspotmail.com

usb 1-1: New USB device found, idVendor=0ccd, idProduct=0039, bcdDevice=  
d.3c
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
pvrusb2: Hardware description: Terratec Grabster AV400
pvrusb2: **********
pvrusb2: WARNING: Support for this device (Terratec Grabster AV400) is  
experimental.
pvrusb2: Important functionality might not be entirely working.
pvrusb2: Please consider contacting the driver author to help with further  
stabilization of the driver.
pvrusb2: **********


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
