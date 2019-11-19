Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 173A7101EE0
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2019 09:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbfKSI7B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Nov 2019 03:59:01 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:39313 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbfKSI7B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Nov 2019 03:59:01 -0500
Received: by mail-io1-f71.google.com with SMTP id e17so15456701ioc.6
        for <linux-usb@vger.kernel.org>; Tue, 19 Nov 2019 00:59:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=7Ey6k68fRk8i277W1opBlM1DpeGxHzE1IZsvWtP7j+4=;
        b=a8HE566WheOzR76Fx/lHOLERj6AL3pav5K04XG85wyx+OdvwsGILaKtQd05Ymijtgd
         GPDYhTCdYic3uo6y0b30qU/U8c1XXJrWqOOiaHEEGaBO9MTdY4Ld03b/HA1/YKB+9xGG
         EIO8HHuovBqNFz822+/7Z3ALihEQID8GpQ3v4jXTFa8Hy3/Ov1ZKcXstkk2zNlx/RMXG
         pcg1D2v3GB6EZaKP6NlxDHgnYCrbewTzQ1VNF665g6Go1cIEv/Z5YfeMnwUNFx4j/uPA
         AQTFM3eZq1O+TFPKquBK+G1E6QgPyWXyyhJU0wsLrye7KvPydQG6dbRy+MyoVUdnlAYm
         M6Kg==
X-Gm-Message-State: APjAAAUYPrE70FQNVtJx2PYg03BOrSQJSNOqRP/L3NgxYm3lM6Mq/KhA
        1Ld2kuc7V8J8rz2SV0sG2zBaze8/1W6rZ56oWpFp4rEhcb5V
X-Google-Smtp-Source: APXvYqzZlMaepoyo2qBCkzW0AGF5A4jYbsKzvTJkWhxz/c/oB3d3ySLs0Ga22LVJvwHrOlkgJIUk8q9croLqL16epUDwri9JqRnb
MIME-Version: 1.0
X-Received: by 2002:a92:405d:: with SMTP id n90mr21514097ila.101.1574153940492;
 Tue, 19 Nov 2019 00:59:00 -0800 (PST)
Date:   Tue, 19 Nov 2019 00:59:00 -0800
In-Reply-To: <1574081930.2698.5.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000071e8be0597af4696@google.com>
Subject: Re: KASAN: use-after-free Read in chaoskey_disconnect
From:   syzbot <syzbot+6d8505fcdf25f00ac276@syzkaller.appspotmail.com>
To:     linux-usb@vger.kernel.org, oneukum@suse.com,
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
syzbot+6d8505fcdf25f00ac276@syzkaller.appspotmail.com

Tested on:

commit:         ff6409a6 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=3230c37d442895b7
dashboard link: https://syzkaller.appspot.com/bug?extid=6d8505fcdf25f00ac276
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1660128ce00000

Note: testing is done by a robot and is best-effort only.
