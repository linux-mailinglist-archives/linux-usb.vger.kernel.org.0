Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD1A33F3816
	for <lists+linux-usb@lfdr.de>; Sat, 21 Aug 2021 04:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236628AbhHUC3p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Aug 2021 22:29:45 -0400
Received: from mail-il1-f198.google.com ([209.85.166.198]:42901 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231620AbhHUC3p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Aug 2021 22:29:45 -0400
Received: by mail-il1-f198.google.com with SMTP id z14-20020a92d18e0000b029022418b34bc9so6455991ilz.9
        for <linux-usb@vger.kernel.org>; Fri, 20 Aug 2021 19:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=iHf8LUR6Ovn1Eydbqz2P3rlkkwnXm6QsDeIBC7GD3Qg=;
        b=c+bH4n3YhHbkN72q0JxUvFiAJnsz2Zii1qBFxD6yMewBIUg6K+Yi2xY7AGaSWMKpEc
         JZhA1v4nmUotLX060HkIx5qzVtxRguCwPZuD6PZ1Dw0UQR3ZeaUesqbfnzBx7iyubgX+
         d2v4poujhRFiXr74gRl9c+tqEHCyP+rGrzUoxo6MtvUnFDYKR56QH8P/XXcs39IpMQeB
         AdlPCBh1ZBk2PUJW6EhukMn45b02ohvjxmdRawDQ2gHgneGGRuN3UeGcGvBFbkocEMjc
         SPC7nrcmBUoNg/nZ2PP3R+uG8VdGEEAgL58leloo6stYrbOUN0I4wVb9oHBuVUgv1w6g
         Tjgw==
X-Gm-Message-State: AOAM531yl+5rEZsxoSILT0pr5opHTib0Uw3g5QYU+BbsQGrTInJwPiJA
        THFkkTEl2/0L/Oy8VLlCG4I6lD3XdmI7Z+wq50vP0eWmT+++
X-Google-Smtp-Source: ABdhPJzK0a8DAE41lfsQEjn583iPFBrbzLkXnZnYep9X4S+LuDPXekPfSUKswjhPhf9qYgtRx0WLpEqRtx7gWnRPEARQrCKJT9xa
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:5c8:: with SMTP id l8mr16040022ils.282.1629512946491;
 Fri, 20 Aug 2021 19:29:06 -0700 (PDT)
Date:   Fri, 20 Aug 2021 19:29:06 -0700
In-Reply-To: <00000000000000410c05c8e29289@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000552aaf05ca088c20@google.com>
Subject: Re: [syzbot] KASAN: invalid-free in bdev_free_inode (2)
From:   syzbot <syzbot+5fa698422954b6b9307b@syzkaller.appspotmail.com>
To:     axboe@kernel.dk, balbi@kernel.org, corbet@lwn.net,
        gregkh@linuxfoundation.org, linux-block@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        lorenzo@google.com, manish.narani@xilinx.com, maze@google.com,
        netdev@vger.kernel.org, phind.uet@gmail.com,
        syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot has bisected this issue to:

commit 63d152149b2d0860ccf8c4e6596b6175b2b7ace6
Author: Lorenzo Colitti <lorenzo@google.com>
Date:   Wed Jan 13 23:42:22 2021 +0000

    usb: gadget: u_ether: support configuring interface names.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=155abcc1300000
start commit:   d3432bf10f17 net: Support filtering interfaces on no master
git tree:       net-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=175abcc1300000
console output: https://syzkaller.appspot.com/x/log.txt?x=135abcc1300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8075b2614f3db143
dashboard link: https://syzkaller.appspot.com/bug?extid=5fa698422954b6b9307b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=174ebaf6300000

Reported-by: syzbot+5fa698422954b6b9307b@syzkaller.appspotmail.com
Fixes: 63d152149b2d ("usb: gadget: u_ether: support configuring interface names.")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
