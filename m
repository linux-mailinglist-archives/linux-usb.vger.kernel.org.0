Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE258E3BED
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 21:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437176AbfJXTQE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Oct 2019 15:16:04 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:40849 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390636AbfJXTQD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Oct 2019 15:16:03 -0400
Received: by mail-io1-f71.google.com with SMTP id 125so11732065iou.7
        for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2019 12:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=oWvayPa8/qITxDBwdBc/3IWa6QYEf1QCLunKd9Be+j0=;
        b=B6TjoKPOLxAbkdAuKeY38yRwJia6HRS4oz6uaxuh7NGnOnYFqey6YJZn0uLC6s+qvG
         vi5SorpI03tYWBXWRhWSRLuKFlLJcSKXzW1OW6YOoNokFSLRstMvOCMWVQc40e9duUxd
         FVKQrSYv5pqU5hE/mt2+P6WbFc9H2chLh/YKwl5VZih3OO8v7s9Olmrj0q+SDS0kY82T
         hmHHXO25Px0BpoBQJ8F+IEGhLDw6ocFzQsRICvfiGDu5Zh6klAVb/BlwmU6/skn+cBgS
         lhV7xppp0BeZsiuny8kaJ/N0oRArubtiGeF5ZeTfzU+3YZNaWb0HRLdsDI8jPgvwowE6
         0TJA==
X-Gm-Message-State: APjAAAWfGUpgHV68Rx8sWU9glgg1xfLm1dGiSHeiP05IKy8l/9SwqTnz
        t1Ap9X60UZrvLj157NASY0i+iK0NYRYFWvEcJE0EiT6VbkD+
X-Google-Smtp-Source: APXvYqwe8GT6GAjZs6JEFcWMgn/Q7D3kSdYBY7PBs66z7ClA63d8QJwXcvJHy94nUGaZ4jACfdU6/DHtdIbwE739i+P9yBfsp6or
MIME-Version: 1.0
X-Received: by 2002:a02:8585:: with SMTP id d5mr3599919jai.128.1571944561419;
 Thu, 24 Oct 2019 12:16:01 -0700 (PDT)
Date:   Thu, 24 Oct 2019 12:16:01 -0700
In-Reply-To: <Pine.LNX.4.44L0.1910241419210.1318-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000030af530595acdd8b@google.com>
Subject: Re: divide error in dummy_timer
From:   syzbot <syzbot+8ab8bf161038a8768553@syzkaller.appspotmail.com>
To:     Jacky.Cao@sony.com, andreyknvl@google.com, balbi@kernel.org,
        chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org,
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
syzbot+8ab8bf161038a8768553@syzkaller.appspotmail.com

Tested on:

commit:         22be26f7 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=5fe29bc39eff9627
dashboard link: https://syzkaller.appspot.com/bug?extid=8ab8bf161038a8768553
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17f50728e00000

Note: testing is done by a robot and is best-effort only.
