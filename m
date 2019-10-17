Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBD55DAA34
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2019 12:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408925AbfJQKpB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Oct 2019 06:45:01 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:34780 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727268AbfJQKpB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Oct 2019 06:45:01 -0400
Received: by mail-il1-f199.google.com with SMTP id s17so349802ili.1
        for <linux-usb@vger.kernel.org>; Thu, 17 Oct 2019 03:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=cLtZFzSP9m7R2I1vAMkxi3v/5nEL2ccEzMTJgakEppk=;
        b=hgqwWBvO0SsUoVi312RRSxDY58JMU5miEC9F6+4agSWub3ibYMHIoONvtEf4+FN5MS
         Hb1b0Oo0RZrcSM0fb+x9Ch6f/G7uzQwtSAjWX0vMWDOpSqxmphXNZsbm75x7Pzr/7+Vf
         ZCDcC6vG/tbz6z82WkPGaXrxtnNyg8k18+QluJNUlAYvuPMcl7sKfVriB4eFI7Q/xvCi
         jtgL4aMA+7L8VZJYAtPP8p5SyluVvMhtGNgORtw4lrLH5w3t27S9okem3bxVakLgNPIo
         56YCaaZSOrXkVHwfD7LAJuKUlB4xdnfW9fyRAsqzEWhStlVcQSOD4zwoMJucwBl2QuUd
         dsfw==
X-Gm-Message-State: APjAAAW2NbFH4awN8Txky1vIRTucOrnEZlzWNrzbSTzJa6bLRjf7dG39
        HuI08PEL2iLNuRREj7vY8qfF+XcEohS8IYY6s3wIO5UthKU8
X-Google-Smtp-Source: APXvYqxIpacbM5A9jSQhC7F/ycennX84VVTncbGbhy/C4MRDBmabXa6bs/FUQ8wlYAuZ3GWBbGxfyiMm3XJlQ+mCROX/w2DXO1gg
MIME-Version: 1.0
X-Received: by 2002:a6b:f40c:: with SMTP id i12mr2178740iog.14.1571309100419;
 Thu, 17 Oct 2019 03:45:00 -0700 (PDT)
Date:   Thu, 17 Oct 2019 03:45:00 -0700
In-Reply-To: <20191017102513.GC21827@localhost>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c34ea1059518e885@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in ld_usb_read (3)
From:   syzbot <syzbot+6fe95b826644f7f12b0b@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, enric.balletbo@collabora.com,
        gregkh@linuxfoundation.org, johan@kernel.org, kirr@nexedi.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux@roeck-us.net, logang@deltatee.com,
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
syzbot+6fe95b826644f7f12b0b@syzkaller.appspotmail.com

Tested on:

commit:         22be26f7 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=387eccb7ac68ec5
dashboard link: https://syzkaller.appspot.com/bug?extid=6fe95b826644f7f12b0b
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14745c87600000

Note: testing is done by a robot and is best-effort only.
