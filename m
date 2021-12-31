Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3264825CA
	for <lists+linux-usb@lfdr.de>; Fri, 31 Dec 2021 21:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbhLaUoG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Dec 2021 15:44:06 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:52841 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231691AbhLaUoG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Dec 2021 15:44:06 -0500
Received: by mail-io1-f72.google.com with SMTP id k12-20020a0566022a4c00b005ebe737d989so13116870iov.19
        for <linux-usb@vger.kernel.org>; Fri, 31 Dec 2021 12:44:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=Of3gUYtQNOdGN0VCHZ9V9d8Ng0GEU6SSLufzFHaw2CE=;
        b=G0xm0iBM+MF8J/W6LMX0mXI8GUvgwjy3G4v+lWCzYI/AhqtqKPg850COOoxJDk8pfS
         juh+vK+ob2nMx9zhsb2Qiw5G1SmcQb+WcANgfLr7HKSmdSncFcjcEir2el/mLNXEIc4n
         jUZMPYxQLggFI7chH+pPSdF7jd+5ch8AW3cJ6xvfwx+vRPrT5QTFVt/miUptvOVEVe/U
         tlksqB5Z7G0hb3DFClFL8MzpX8lOyXJqHX+ZAqa3WuVakbCXTgw5/GxfLag0cs08FxL1
         A/TOVPwrKJgtfwrJvaH1Q0nPShMHxNbG6XW2kMCr/EAuwKgDDQ3hy7mMFpBxXQyg2Ds3
         Cx7A==
X-Gm-Message-State: AOAM530QyBdXJ3Ur4L0b4hYbJdAcd+alNx+sVu4PcOqt23L6TT5XfZgD
        VmkCtYHCnV1wYRzsVcrSWhawUAJAHqSHPkt1G7WZBvSwagSc
X-Google-Smtp-Source: ABdhPJxQWiMF5hhNnlmcGcPjirBvBWo3QMc5mLxUHrNzczChFwXxfTMdBa3z+KDIG9Ly8dHMGltuWtoKVX3GmRE2pSoGKqZaQ+Gp
MIME-Version: 1.0
X-Received: by 2002:a6b:7602:: with SMTP id g2mr16215397iom.37.1640983445917;
 Fri, 31 Dec 2021 12:44:05 -0800 (PST)
Date:   Fri, 31 Dec 2021 12:44:05 -0800
In-Reply-To: <Yc9odypVqqB2uMm/@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000060560805d4773ba0@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Write in usb_hcd_poll_rh_status
 (2)
From:   syzbot <syzbot+3ae6a2b06f131ab9849f@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, dvyukov@google.com,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+3ae6a2b06f131ab9849f@syzkaller.appspotmail.com

Tested on:

commit:         eec4df26 Merge tag 's390-5.16-6' of git://git.kernel.o..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
kernel config:  https://syzkaller.appspot.com/x/.config?x=1a86c22260afac2f
dashboard link: https://syzkaller.appspot.com/bug?extid=3ae6a2b06f131ab9849f
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=148e8e35b00000

Note: testing is done by a robot and is best-effort only.
