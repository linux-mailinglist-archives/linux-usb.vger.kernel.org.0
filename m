Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BBE52F56B1
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 02:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbhANBv2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 20:51:28 -0500
Received: from mail-pf1-f198.google.com ([209.85.210.198]:49239 "EHLO
        mail-pf1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729726AbhANAKC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 19:10:02 -0500
Received: by mail-pf1-f198.google.com with SMTP id c70so2241906pfb.16
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 16:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=8vA6KH4yTnBPhCjwbGkm46PU7mMjPjZzD/vxDkOo7Gc=;
        b=uQ+owrksUIfcw/VAHCQAVDMq3OaNM5cZ7f9JAugoopCskBTUKN/3DHCtUvprZzQZy/
         DafQSo8QxBsgDvzTGWeZWalFwKtpq7g1mKAsOOn5fI0ahDy4Ky1HS44s+C0I/CHZRj6+
         5q6gzrqnkumgNF9LI5VLxcZa8kALSXZi0GqU95+iKkVxZU9tKTMKzFBW1J8TRSbYwii7
         ipCnM70wQbBdbxXHUaZswcRTBhv+pRJqGTz6HJHllcp99CCvgFfMgXTRwJ90sxjhVDtO
         KVFYT5cp7N7KTpyNWNAFXdwtLsnYG5DJzktwX4lFziPCrI7GqPfLHgY1TSiZU5DIKP/o
         aY0Q==
X-Gm-Message-State: AOAM530ErUmRmc+acyfLsSjNmB0K/jRRQCU/AcN/Fsl6DmjkIpKPBFp+
        kP2mabOkI23Avts9bNK35dm+24qBwx/245RRi9DNHCfa2iC3
X-Google-Smtp-Source: ABdhPJyhwL31qQQQGIahEokxTy2M35uYNUcO7+u8PL7IugimTmxbyHHSFEY+nHdvbGotyb7u+HkHJ8hr8j+0vf2SMhtXcO2wBbm6
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:11a6:: with SMTP id 6mr2381658ilj.87.1610578871736;
 Wed, 13 Jan 2021 15:01:11 -0800 (PST)
Date:   Wed, 13 Jan 2021 15:01:11 -0800
In-Reply-To: <000000000000c19e7b05b4c35440@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000885f7605b8d01d5e@google.com>
Subject: Re: WARNING in cm109_submit_buzz_toggle/usb_submit_urb
From:   syzbot <syzbot+c7e665956b189738fe5e@syzkaller.appspotmail.com>
To:     eli.billauer@gmail.com, gregkh@linuxfoundation.org,
        gustavoars@kernel.org, ingrassia@epigenesys.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        oneukum@suse.com, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit c318840fb2a42ce25febc95c4c19357acf1ae5ca
Author: Alan Stern <stern@rowland.harvard.edu>
Date:   Wed Dec 30 16:20:44 2020 +0000

    USB: Gadget: dummy-hcd: Fix shift-out-of-bounds bug

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1075dcaf500000
start commit:   fa02fcd9 Merge tag 'media/v5.10-2' of git://git.kernel.org..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb8d1a3819ba4356
dashboard link: https://syzkaller.appspot.com/bug?extid=c7e665956b189738fe5e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14ba912d500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10dfad85500000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: USB: Gadget: dummy-hcd: Fix shift-out-of-bounds bug

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
