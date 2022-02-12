Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3024B386A
	for <lists+linux-usb@lfdr.de>; Sat, 12 Feb 2022 23:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232194AbiBLWnU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 12 Feb 2022 17:43:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbiBLWnT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Feb 2022 17:43:19 -0500
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1255F23BD7
        for <linux-usb@vger.kernel.org>; Sat, 12 Feb 2022 14:43:16 -0800 (PST)
Received: by mail-io1-f70.google.com with SMTP id n13-20020a056602340d00b006361f2312deso8628273ioz.9
        for <linux-usb@vger.kernel.org>; Sat, 12 Feb 2022 14:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=Qndx5/xlMDuMFsAiyXYtZiMwVkwJVHOfIbITY7SRWJQ=;
        b=6tDeAzQWxSnjhyGzQyg6KoR6OsYA6RCc+Cx36tiTS8dYkpyA7Ia4IlavMQ0YbiaD6P
         +ewjsRneSNAmXE7yNoumQCQPeg3jtdcPtRjRX1LKGz98pWcndpLiVT09Cq57GCoa5eMq
         Oy0pQq+ptRXcDu1Q9xhcFXDr9dMYhAamSpV16Zms8l3gLEhQtUHPeG3lccAocCtHJ/9y
         KC4nyLxNr/YNnmJ++lP7Fhx9iHyDLADDl+1IYf8NbqyOS1oOe6GGwRGA8oNyc0TdlNjA
         TXfb+NHw10b4sDx42NgI+rXSybPllx8APwHl5h0dICUWlCA1FXEwTp7h08ES1wL0q9lL
         10CA==
X-Gm-Message-State: AOAM5308d1usKHj/VPc3WvA1J6rkWRzxZkZSc5btcxUfideX6JlBgSco
        ceG+flrAzOaqiD4L3KQkJwg+RvOBaGPWA3apjdbJYyZhqEpa
X-Google-Smtp-Source: ABdhPJyYJiru2zx+c/KVjgt1xGFubXKCnNkIk4JRjg/rcylmahzVP9hbqgP6bfAIgw0MItzt6bpF6kOvtY69glToznfqQq+iuQ/5
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1806:: with SMTP id a6mr3393462ilv.272.1644705795363;
 Sat, 12 Feb 2022 14:43:15 -0800 (PST)
Date:   Sat, 12 Feb 2022 14:43:15 -0800
In-Reply-To: <0000000000004c57c005b0fc4114@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b15b3505d7d9e8ca@google.com>
Subject: Re: [syzbot] INFO: task hung in usb_get_descriptor
From:   syzbot <syzbot+31ae6d17d115e980fd14@syzkaller.appspotmail.com>
To:     brouer@redhat.com, coreteam@netfilter.org, davem@davemloft.net,
        edumazet@google.com, eman.mohamed@rofaidarealestate.com,
        gregkh@linuxfoundation.org, gustavoars@kernel.org,
        hdanton@sina.com, ingrassia@epigenesys.com, johan@kernel.org,
        kaber@trash.net, kadlec@blackhole.kfki.hu,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mathias.nyman@linux.intel.com, netdev@vger.kernel.org,
        netfilter-devel@vger.kernel.org, pablo@netfilter.org,
        skhan@linuxfoundation.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit 363eaa3a450abb4e63bd6e3ad79d1f7a0f717814
Author: Shuah Khan <skhan@linuxfoundation.org>
Date:   Tue Mar 30 01:36:51 2021 +0000

    usbip: synchronize event handler with sysfs code paths

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1616e872700000
start commit:   4fa56ad0d12e Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=144ecdb0be3abc07
dashboard link: https://syzkaller.appspot.com/bug?extid=31ae6d17d115e980fd14
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12548d11d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13ec77e9d00000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: usbip: synchronize event handler with sysfs code paths

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
