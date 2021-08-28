Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0B023FA77B
	for <lists+linux-usb@lfdr.de>; Sat, 28 Aug 2021 22:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231888AbhH1UGC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Aug 2021 16:06:02 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:45928 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbhH1UGC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Aug 2021 16:06:02 -0400
Received: by mail-io1-f69.google.com with SMTP id d23-20020a056602281700b005b5b34670c7so1589584ioe.12
        for <linux-usb@vger.kernel.org>; Sat, 28 Aug 2021 13:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=F3lnrFhJJI9jjY2l9iXzYnttpQ+V2txwHoUaiy15Azg=;
        b=ms26n2CCeBdk4l4krTXOA6cHuz22LOo6j1xR05Y/1fZY0adE77c0mx/oqixcDoFCyV
         JithLgtzQ7R82FesD/bECXscWvP/OzOu9YCp/ZQ9KvPbH+eLnNTO+oNnzYA9Qi0OSTW6
         av3XZ4CJC5C508mpyVcBchs9tFQ7yx/SX0T8PKFEOE9Ydqh9gtMDed4wHPTbdyaJXz2l
         2VI9cr0Q6pQO3v1qYcuCC8fxnapnV+5z/5ePSpSsdYN0eFH4zj+SoJEbrZ8V7M7J5JOo
         qENU4XsBkrgDXTOE7pK9zSuPmsnGiWTtyCgxgKcAk0ijnK6aaEnN5GS5iAVl+Y60P/VI
         Fe8Q==
X-Gm-Message-State: AOAM533+JBq6pQ/9HPifnptHzT7wttlbmxIabF2r+iBE0mGCK5VARhvT
        escrIvDi3Mgs6O9MTyas/dw+FScLnwFqOtZ9SkUhVRkqXuRZ
X-Google-Smtp-Source: ABdhPJzHStHr46SCKuO25wOHU94CBgaQa0P1z5qBGKQRRah2nWHjLg3YkzMkQt6Pz6IO+rZsgDqLS+lRh8wqJzQoaZeu4lLfXEHy
MIME-Version: 1.0
X-Received: by 2002:a92:d3cf:: with SMTP id c15mr10793586ilh.131.1630181111312;
 Sat, 28 Aug 2021 13:05:11 -0700 (PDT)
Date:   Sat, 28 Aug 2021 13:05:11 -0700
In-Reply-To: <20210828180358.GA291431@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000f37f405caa41e79@google.com>
Subject: Re: [syzbot] INFO: task hung in do_proc_bulk
From:   syzbot <syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mathias.nyman@linux.intel.com, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com

Tested on:

commit:         d5ae8d7f Revert "media: dvb header files: move some he..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=2fd902af77ff1e56
dashboard link: https://syzkaller.appspot.com/bug?extid=ada0f7d3d9fd2016d927
compiler:       Debian clang version 11.0.1-2, GNU ld (GNU Binutils for Debian) 2.35.1
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16c2799d300000

Note: testing is done by a robot and is best-effort only.
