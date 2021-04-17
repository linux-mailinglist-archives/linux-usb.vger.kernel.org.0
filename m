Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 580C6362F4D
	for <lists+linux-usb@lfdr.de>; Sat, 17 Apr 2021 12:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235947AbhDQKld (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Apr 2021 06:41:33 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:49953 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbhDQKlc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 17 Apr 2021 06:41:32 -0400
Received: by mail-io1-f70.google.com with SMTP id o9-20020a5e8a490000b02903e6e5e5c905so6065422iom.16
        for <linux-usb@vger.kernel.org>; Sat, 17 Apr 2021 03:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=ZMFTNQeCTle+JOxNQUUj2Qa6vRxCvq28DqbicLlCP58=;
        b=cU5Ug66POllz2xYVmJgdGQRXzgA9I/swNsR/Yi2SQDOzCcLFT9GwASZ4RlPCjOZ0nJ
         gRbQtkdEYu2kOsHjxWIUWuTYOtfjVv8A+l1aOVnlJRudmNElrM+Fno3N421e7SwkaJzT
         McILZjB/5hn6XT2I3HDytjvIUJBwpo6hPp7Smp3bl2F0j6xWutEQe9nlFIXiS08SrLIV
         xewqnlY94EOftvj5dqEIYixDfoDpChDeJus8XxFhGObU4zL4QVdy9p0Rh/9WLNxZyQfW
         50fMFyEQX3KPF6SV0DfxMOlA884/DvYihaf03Fd7kbhRtzLYRwWcOfFyPEhUX/ZbWVUP
         oIZQ==
X-Gm-Message-State: AOAM533dpBRUUDR9sRdBkeNSwqSbgMZi7zFgY/7iHzWEwUEYVQYFp6+x
        foKQSyToQuf5IEXeCmpeO5YJMYRSA4P7crWdAG8qswWjlZWp
X-Google-Smtp-Source: ABdhPJxhZRVACpoCVgt19B30+9dhxa73OLcofAwjzl/FYerzWVhf6U6gXPuMEo77zDC2iyDSdn4lPzPcKlU8vbfYfw4tw8GiZzMa
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2bc7:: with SMTP id s7mr7317978iov.52.1618656066344;
 Sat, 17 Apr 2021 03:41:06 -0700 (PDT)
Date:   Sat, 17 Apr 2021 03:41:06 -0700
In-Reply-To: <00000000000082554705ba5fe454@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d91f7905c028bbf4@google.com>
Subject: Re: [syzbot] INFO: task hung in usb_remote_wakeup (2)
From:   syzbot <syzbot+85439002c78b774488d8@syzkaller.appspotmail.com>
To:     erosca@de.adit-jv.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        oneukum@suse.com, skhan@linuxfoundation.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com,
        zakia@firesystem.co.nz
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit 363eaa3a450abb4e63bd6e3ad79d1f7a0f717814
Author: Shuah Khan <skhan@linuxfoundation.org>
Date:   Tue Mar 30 01:36:51 2021 +0000

    usbip: synchronize event handler with sysfs code paths

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16c89e91d00000
start commit:   bec4c296 Merge tag 'ecryptfs-5.11-rc6-setxattr-fix' of git..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=9408d1770a50819c
dashboard link: https://syzkaller.appspot.com/bug?extid=85439002c78b774488d8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=138d0264d00000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: usbip: synchronize event handler with sysfs code paths

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
