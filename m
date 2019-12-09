Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD738117BB9
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 00:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbfLIXqF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Dec 2019 18:46:05 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:40263 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbfLIXqB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Dec 2019 18:46:01 -0500
Received: by mail-il1-f199.google.com with SMTP id s10so12949345ilh.7
        for <linux-usb@vger.kernel.org>; Mon, 09 Dec 2019 15:46:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=hWaIex+koh6jdBsw/jvRJQ3HQOaL7kSrdmI8OfB4npk=;
        b=Q9657R7XTBpylHWGa0tlYm1ezcP/f25YdObd1+SwtHz1nkkccOS3e1887fZ20DkSa7
         6r9m98W/ZLusTDDNy2McJxXdjsuS8ugYx3tWoUpaCMh4+KkW6hlOrym3PjjgQWOw+A1r
         gRUysOHALPqaKBgPnWlLcCs27BHNFkqTi3w4X1yLPhQAHO8GIdYTZsRmS7mWZmMwG29/
         /93VIAEAGjI7sMzQpy+A+Jg0yDQQLJTYbGGlyOKxHCAPe8bCeoQgG7zHG/nfXRjPdwlr
         3HdPcYZfMg3GKkrNHt/FlaNF5V/3bxzQwvsyu1OdkVaydAYTEnMnNLSA2noG9YC6u4YC
         qA7Q==
X-Gm-Message-State: APjAAAXtSJg7MS6r3xOffKg7r/FgtwNlKVR6gw7oZxiFYbUCmPCm5H2z
        tsIeOSI+2xVymp3HwR0Z4qk5NEISojmt43eqruq2DT80n52G
X-Google-Smtp-Source: APXvYqycbY+HQGkGdjQbePP8cr8ECSXGxrDkL3BMEEnHcpRL29CgV9t9BGQj2mNNgZ2EV+ADomhx9vWT9AVPvaH1ZJgv29P59Yt5
MIME-Version: 1.0
X-Received: by 2002:a5d:96c6:: with SMTP id r6mr9224856iol.236.1575935160916;
 Mon, 09 Dec 2019 15:46:00 -0800 (PST)
Date:   Mon, 09 Dec 2019 15:46:00 -0800
In-Reply-To: <Pine.LNX.4.44L0.1912091448420.1462-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000074a59505994dfff0@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hid_field_extract
From:   syzbot <syzbot+09ef48aa58261464b621@syzkaller.appspotmail.com>
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

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+09ef48aa58261464b621@syzkaller.appspotmail.com

Tested on:

commit:         1f22d15c usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=8ccee2968018adcb
dashboard link: https://syzkaller.appspot.com/bug?extid=09ef48aa58261464b621
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=146cae41e00000

Note: testing is done by a robot and is best-effort only.
