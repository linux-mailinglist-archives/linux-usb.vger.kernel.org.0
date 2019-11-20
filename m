Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D41BC1046AC
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2019 23:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfKTWkD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Nov 2019 17:40:03 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:56694 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbfKTWkD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Nov 2019 17:40:03 -0500
Received: by mail-io1-f70.google.com with SMTP id u6so691717ion.23
        for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2019 14:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=TNGq4S5KwP/7sHt+hvFUBeVEHK1kVFfzs68hMvNqFa4=;
        b=Zp1bfJsaUOQeixiexecCYoaMHO89YIj8zD6d2X+MTIwuptiye632SnhIyRaUFlZSaL
         xpt3GUZ0Ugq25U/33cM4qe/cgm8d4i51eB0LIiQRfbOyr/Pak8zWrFVv693uf2r//Rkz
         I/xQpHno1LZPQVJky6+FiDNkAPkrZBoDogNtBI1EjgEj6aoddzip1Y2Q7cWgYuZKPZNX
         gJChKiOM02Z+L3lfwJINLxcZEMdpH7/30IN4+ymgzEKxa6rfD79yB0KTS9Sv58YOul3t
         Jrngo+kznHqMLacVr1hiE226oVrOpl4EehHQ2QQvzhq9M4eJ75ogkfJ1ivPTvhWKblX0
         8M1Q==
X-Gm-Message-State: APjAAAV7mFfatVjWqTEUgZoWP27XtrvBUBgw3C6lKXozFjxzZxk7/tt+
        CKDQQJcY2HgY7ynONu/CSejl68SvohgCWPCr4qKw2g/xN1U6
X-Google-Smtp-Source: APXvYqzCSScjzWZXDy0EOWnZzsQBk9L6IYOj/OvO/b+j/CGB+bGHVFEsRc8JsCnUldoEU+3XVMWNcgNgD9lP25t9SctyFLkDw5q7
MIME-Version: 1.0
X-Received: by 2002:a92:5d88:: with SMTP id e8mr6004485ilg.95.1574289601331;
 Wed, 20 Nov 2019 14:40:01 -0800 (PST)
Date:   Wed, 20 Nov 2019 14:40:01 -0800
In-Reply-To: <1574169714.28617.7.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000076092b0597cedce2@google.com>
Subject: Re: INFO: task hung in wdm_flush
From:   syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>
To:     bjorn@mork.no, linux-usb@vger.kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot tried to test the proposed patch but build/boot failed:

failed to apply patch:
checking file drivers/usb/class/cdc-wdm.c
Hunk #1 FAILED at 587.
Hunk #2 FAILED at 596.
2 out of 2 hunks FAILED



Tested on:

commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
dashboard link: https://syzkaller.appspot.com/bug?extid=854768b99f19e89d7f81
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1779956ae00000

