Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7261DF2D7
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2020 01:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731327AbgEVXSH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 May 2020 19:18:07 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:44131 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731243AbgEVXSF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 May 2020 19:18:05 -0400
Received: by mail-io1-f69.google.com with SMTP id a2so3603699iok.11
        for <linux-usb@vger.kernel.org>; Fri, 22 May 2020 16:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=hY+OQTAuY6M9q+ZlmlR3e05EdcbrRXkCCbneZ37ciSs=;
        b=CcNTQyLpM/1jwuf8twiDLD5fmiHZCSXrXxILa7D7CBj515LxYlHh8NSDDgg0YiCaLH
         U7i5LB+I42xl5/mDdeIu4Puz+riuUpPbcvAUmvE/LmFmuStscApVxLFzezhKxxbwAcDM
         lhXSC0eUM436mQfC5e+iud7FqOfNk+fvj5aWFT8IVD5WfGHI0m7oYAsuAL4r5aRl7x3w
         cLl/pvQ2SDGfRenLttg7JgXztmW1T+jQ+RdHbb5NqilmYh65ja0gAZp19YOemY8tu+rD
         fv9SzHCzQB3a8oR/q1+nPESo2ImQVmNbdNK3KGdEcXrFFEAi4hPGbp4A1O3v2ES8/el7
         2qhQ==
X-Gm-Message-State: AOAM530s2h+vBhA4QTJyuvOYbp6zjPTqa9NpvVAGUk/jP8Z61ECZvjLX
        oxDZx+90Cvi7ZbGlOAsSFVS0PJo2R0MCfJ88xIrLQjG/KaqU
X-Google-Smtp-Source: ABdhPJwgYqS05aE4+oBbSGGIRzX2fn9OewAC8LgxkJqcCKZPII9tPeLQBXsUSEDvz5Roj7zFdf6zjg2Dj5BNDCyhUjhu5gkgsAJs
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:68d:: with SMTP id o13mr15946835ils.230.1590189483733;
 Fri, 22 May 2020 16:18:03 -0700 (PDT)
Date:   Fri, 22 May 2020 16:18:03 -0700
In-Reply-To: <000000000000fc0c1c05a0ffc2b8@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004db88405a644d75e@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in dlfb_usb_probe
From:   syzbot <syzbot+ed94135f896a14d75284@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, rafael@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot has bisected this bug to:

commit f2c2e717642c66f7fe7e5dd69b2e8ff5849f4d10
Author: Andrey Konovalov <andreyknvl@google.com>
Date:   Mon Feb 24 16:13:03 2020 +0000

    usb: gadget: add raw-gadget interface

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10510cba100000
start commit:   051143e1 Merge tag 'apparmor-pr-2020-05-21' of git://git.k..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=12510cba100000
console output: https://syzkaller.appspot.com/x/log.txt?x=14510cba100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b3368ce0cc5f5ace
dashboard link: https://syzkaller.appspot.com/bug?extid=ed94135f896a14d75284
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=103d795e100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=143d795e100000

Reported-by: syzbot+ed94135f896a14d75284@syzkaller.appspotmail.com
Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
