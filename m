Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE161108B09
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2019 10:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbfKYJiE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Nov 2019 04:38:04 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:57112 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727052AbfKYJiD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Nov 2019 04:38:03 -0500
Received: by mail-il1-f197.google.com with SMTP id e5so13077408ile.23
        for <linux-usb@vger.kernel.org>; Mon, 25 Nov 2019 01:38:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=fG9KqHLE4B6rJrt8WSTq/ExbnesyYPEwEQQKonf+qKA=;
        b=ltwuUjIm30trQvyT6jkDyCP13FIuCVVXLG6M8atmnxxkxdh44JND1xkPFk7aVcNsaq
         JFjm8rv92xHCT+Z5YBYhXCs6YndBA/RiyPr28GnuVvM4ZwsRevLHKT5SZd3kE9Jnfro1
         M7Z14lLBjp9mBl/b4scCC+c1ML5Y3DyjstEXvZ12CIv1XBZ/SbWYs5tUT5vnnmm40B9e
         Kbn6r/0QvPBpQAK2+qP+UO+k3HCw1yhbD62LfEkc/tz77sH1kiQWx89Qa3+LsIAlmBPU
         Ql9ZVVcOfg9IMyh8P1i/RjbS+VUexZqfaOiVbkrYQRZTJN0aY5OvTsZkMaVVF/Y/Qhkg
         F1Xg==
X-Gm-Message-State: APjAAAUQWN/800Sh9cGXVhRaidvT5+hRTsj7MYegiBg/ZO0iVMpg0wLA
        HGxQCkAkRDtldUC4ftusCcylqECovFd/B5X6Fr8jW5zL0/SG
X-Google-Smtp-Source: APXvYqysEvhOU3FlrlkG6Qh8WLdk+WWWUZxt5N0WYkzf9xitUfAL1POuHUf1iCWn+W/dqDUNFjaqX/5F5jsOHUTMFd++GfEmClFL
MIME-Version: 1.0
X-Received: by 2002:a5d:9909:: with SMTP id x9mr9533544iol.93.1574674681278;
 Mon, 25 Nov 2019 01:38:01 -0800 (PST)
Date:   Mon, 25 Nov 2019 01:38:01 -0800
In-Reply-To: <Pine.LNX.4.44L0.1911241115410.26037-100000@netrider.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000003b7c305982885e3@google.com>
Subject: Re: INFO: rcu detected stall in hub_event
From:   syzbot <syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
BUG: found invalid parent_idx

microsoft 0003:045E:07DA.0001: Field 0 ffff8881c0e00000 maxusage 4899
microsoft 0003:045E:07DA.0001: Usage 72 ffff8881c0e00730
microsoft 0003:045E:07DA.0001: collection 0 ffff8881d91be200 type 0 parent 0
microsoft 0003:045E:07DA.0001: BUG: found invalid parent_idx
microsoft 0003:045E:07DA.0001: Start report ffff8881cb82e000 maxfield 1
microsoft 0003:045E:07DA.0001: Field 0 ffff8881c0e00000 maxusage 4899
microsoft 0003:045E:07DA.0001: Usage 72 ffff8881c0e00730
microsoft 0003:045E:07DA.0001: collection 0 ffff8881d91be200 type 0 parent 0
microsoft 0003:045E:07DA.0001: BUG: found invalid parent_idx
microsoft 0003:045E:07DA.0001: No inputs registered, leaving
microsoft 0003:045E:07DA.0001: hidraw0: USB HID v0.00 Device [HID  
045e:07da] on usb-dummy_hcd.5-1/input0
microsoft 0003:045E:07DA.0001: no inputs found
microsoft 0003:045E:07DA.0001: could not initialize ff, continuing anyway
usb 6-1: USB disconnect, device number 3


Tested on:

commit:         46178223 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=14bb93cee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=99c88c44660624e7
dashboard link: https://syzkaller.appspot.com/bug?extid=ec5f884c4a135aa0dbb9
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11c28d5ee00000

