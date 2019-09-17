Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13832B4E13
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 14:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728315AbfIQMmD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 08:42:03 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:36599 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727930AbfIQMmD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Sep 2019 08:42:03 -0400
Received: by mail-io1-f72.google.com with SMTP id g126so5592748iof.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2019 05:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=EOWzZyfbf2PsTOR2XuGeTftz+ncATtL0MNUCtRnpmSE=;
        b=eIW3cpMmS+Z0sqJDOEm4rGvBgfB7Jfz5pwTYZm7+mdlHXL1qSVEgVPihQMfTGKZopW
         Bwe3yL6WzRgnUzGKpmRsrt53OG7VSeuqCl78hFYZCDvCLMLASZoZ0ZLsqW5EmWxHl60X
         XozFd25UYanoJl9vKJuE8zpndkZcWSIhaAZuNLUhMPxkVpaFy6UJVzawHKr2nb2OgyXc
         S1Dz/ji/NNQlM111l6XX6DBPh6tDTp73JrFrW4wHq9MkZzBA6EZlFIUGS8tkJwtBrdU3
         oSyEKGl7lgijakdcyw9W7DMlqjCP8dKXrrVc5H6cplCSuPTz6cxqR0RCYEU7q7HyLjsa
         YC7A==
X-Gm-Message-State: APjAAAVwBsV2epHcx+L4tz4TM08bn6HYiE/Y25JfJBByA6LU/QQ3q0q1
        Nu+LlfzRnhyGjR8TgbBaddcmFFKja432cR+nf9q4W1At9Duu
X-Google-Smtp-Source: APXvYqzfRJsy4y4ZMCY6Mkee25knrYvCZLxgAfloFJDI8xdlPzlKgTLAQ5ybhad6fxJZizScV+KNKJwvEqz8clvlRI56Mwn4rm3U
MIME-Version: 1.0
X-Received: by 2002:a02:a617:: with SMTP id c23mr3095128jam.14.1568724121126;
 Tue, 17 Sep 2019 05:42:01 -0700 (PDT)
Date:   Tue, 17 Sep 2019 05:42:01 -0700
In-Reply-To: <20190917122404.GA29364@localhost>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fda29f0592bf0b95@google.com>
Subject: Re: possible deadlock in usb_deregister_dev (2)
From:   syzbot <syzbot+f9549f5ee8a5416f0b95@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        johan@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, oneukum@suse.com,
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
syzbot+f9549f5ee8a5416f0b95@syzkaller.appspotmail.com

Tested on:

commit:         f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
dashboard link: https://syzkaller.appspot.com/bug?extid=f9549f5ee8a5416f0b95
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16753b2d600000

Note: testing is done by a robot and is best-effort only.
