Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 464CF97FC2
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 18:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729019AbfHUQNB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 12:13:01 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:55440 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728485AbfHUQNB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 12:13:01 -0400
Received: by mail-io1-f71.google.com with SMTP id g23so3056114ioh.22
        for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2019 09:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=Yd53F92BJf3zn8wGZ0U/s186p5/9JYi4U18PT1EI33k=;
        b=iBmN5Q7+bll7UEldWGvqq+gy0eLVJBYUmnOgbGM9WL5R/i+ADIDjU2ssf3nGOKQCwQ
         qcnb22Ax8LNs8YM35csAMsEjhp11KOfwVmo9WU1hkj0LAobMN2DDfiV6i7bbFLQ/rQFd
         Iy6VvNHIDXB+Mg+DghTr+L6Mvl/0pC+IY65QVsVt2Nr8xvH4Iqg0zaL/i9tJMTt1jHjt
         SSO5g26ent+LrH5N/tnCQ0u6u6CAw6elEdpz999eGvsWDr/KqOmygz0MO97rADRYLv7H
         OsXbeEbQb2SLk0zs2WAj1sPACBLFHMCX73Al0q5Ap/0JrfZ5FWtKcJT1Uik1HXaLZhCf
         EQRA==
X-Gm-Message-State: APjAAAW46i8Zs8hc22jaLkF6EbtvJezNs1lUql9FkpIOlfS174ESVd1T
        o51yOjl4ZPtELw+/9CSmZMdtFGqP7Mdqp9T1eGta90tdEXax
X-Google-Smtp-Source: APXvYqxcWw4L/Vqh6e7csZoUh1Wfmtb8A9sqnIV6jLU54MAVbBAkuO9AjSyCECyy2tXi/H0bOGqXzMrcgTX9GXvsiDZcYJ+jvrY/
MIME-Version: 1.0
X-Received: by 2002:a5d:9681:: with SMTP id m1mr6432416ion.291.1566403980448;
 Wed, 21 Aug 2019 09:13:00 -0700 (PDT)
Date:   Wed, 21 Aug 2019 09:13:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1908211152230.1816-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d45a4c0590a2d8bd@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hidraw_ioctl
From:   syzbot <syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com>
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
syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com

Tested on:

commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13dca42e600000

Note: testing is done by a robot and is best-effort only.
