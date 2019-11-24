Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD497108587
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2019 00:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbfKXXYD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Nov 2019 18:24:03 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:56055 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbfKXXYC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 Nov 2019 18:24:02 -0500
Received: by mail-il1-f200.google.com with SMTP id p21so4723812ilk.22
        for <linux-usb@vger.kernel.org>; Sun, 24 Nov 2019 15:24:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=lvmYFxQ4tMpUppOKxWLXexXQSrq67jjHmSMnYwsK918=;
        b=C+t/qQdVXz5YIoZTgyM+iVw4/F74B45/ihw/gANzWPzVHe10BQIJ+rOP18mGvmAa7R
         qVjqi6XqSKjP3MG5b1w6jaMBdeqAs0ymgsqzLVKRhqjiCZ1iBXIIqtj9g+Rl0VJryg6M
         j9o36wCSKOdnWRYYILYzaVNUJHUNk+GNm/Eme7bxB9TA/+97cuO+Dz3oh8Qy3FhchAyS
         S0WxGE+bAmkTSkG0vhKCrDgL8s8G4I8nSLOpRGajvwe/VPzFGDv/BY+eZCftSiXzyKeC
         ds+obwxybkgxA1eL7o3dr1Laye+LNxsx4XC5iX4xpCPTYEQS2Abixpm91QPHCPePdqo/
         YFGQ==
X-Gm-Message-State: APjAAAXgxYmWWWVIcgRaW566WqgnPl/5H2BRsW2v08pvkECu6K0jxEgb
        GhJrkWIqO+1De8SSe5GgQ4UVX1t6XQxuoRqKoeSAe8kLAVdX
X-Google-Smtp-Source: APXvYqzybgh35xlc8OCAZI+HDDxRXvIzbywSitZ5fmZRerPy++yQAdBkreUmqiN9FAW1Gh+w6H3FG23oukUmVPMMPPcj1XreIAIA
MIME-Version: 1.0
X-Received: by 2002:a92:7405:: with SMTP id p5mr31061111ilc.261.1574637840449;
 Sun, 24 Nov 2019 15:24:00 -0800 (PST)
Date:   Sun, 24 Nov 2019 15:24:00 -0800
In-Reply-To: <Pine.LNX.4.44L0.1911241553390.4632-100000@netrider.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000214afd05981ff1a8@google.com>
Subject: Re: possible deadlock in mon_bin_vma_fault
From:   syzbot <syzbot+56f9673bb4cdcbeb0e92@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, arnd@arndb.de, gregkh@linuxfoundation.org,
        jrdr.linux@gmail.com, keescook@chromium.org,
        kstewart@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de,
        viro@zeniv.linux.org.uk, zaitcev@redhat.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+56f9673bb4cdcbeb0e92@syzkaller.appspotmail.com

Tested on:

commit:         4d856f72 Linux 5.3
git tree:        
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git v5.3
kernel config:  https://syzkaller.appspot.com/x/.config?x=86071634b2594991
dashboard link: https://syzkaller.appspot.com/bug?extid=56f9673bb4cdcbeb0e92
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11ff3eeee00000

Note: testing is done by a robot and is best-effort only.
