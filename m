Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D039C585A1D
	for <lists+linux-usb@lfdr.de>; Sat, 30 Jul 2022 12:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233771AbiG3K1N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 30 Jul 2022 06:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233419AbiG3K1M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 30 Jul 2022 06:27:12 -0400
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62AC7167CF
        for <linux-usb@vger.kernel.org>; Sat, 30 Jul 2022 03:27:11 -0700 (PDT)
Received: by mail-io1-f70.google.com with SMTP id y8-20020a056602200800b0067c008bfdfeso1978589iod.2
        for <linux-usb@vger.kernel.org>; Sat, 30 Jul 2022 03:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc;
        bh=mNXc9U3IpQ/oCpk7EwLAV42C9rdtmhFCDfYRU7xuwsg=;
        b=D1rxOkwzCa0gk9eXA1IMB11EXH5tk8Jg2oeTUbmZVzX7cCp1T1fS3oiq24luQf8vZ/
         MGPobogkh2rfJ5GEX3RuRsGkgqR/78GNeGDc+22jGfxfEiVO+KnMSuxvBwmU9aJWLkq7
         o8Wk/aL04ORksEmUZVhnteo15L48b9ZKv88dmkgQKRIVG9KhDNpF1YD46EjYxb6R4FVW
         JB+D2bB4kxMp1hR+s18wvblyEwYJVqsoWPs4VVzvPRJPlXSgVGdYGG7FcEWeUfki9J6q
         9o0J+ZpxV/ereDysJKvAQcEDMowHrqEFud1gXEALhLGgEbkRPUwRoXttzwNXrhq3khTp
         7obg==
X-Gm-Message-State: AJIora8o+xAyAW9BW5KanoiNhnoEums9usD4yox06OFm+nfUSZI/dsXg
        oTLflDW+eHEzeRsRUNbr63EDNUIMx4VwcCiorMw97DPVAZT0
X-Google-Smtp-Source: AGRyM1tD/Co71uWMmElhO8YQYnXgHSc+IQXq6qB2ByLb4ASbs0n0XTlcO3FruxUQROFhUMrb06lKvwPRtaCZ5Jqae5S5j/KV1fsa
MIME-Version: 1.0
X-Received: by 2002:a92:b750:0:b0:2dd:9194:3ea8 with SMTP id
 c16-20020a92b750000000b002dd91943ea8mr2750644ilm.197.1659176830619; Sat, 30
 Jul 2022 03:27:10 -0700 (PDT)
Date:   Sat, 30 Jul 2022 03:27:10 -0700
In-Reply-To: <000000000000109c040597dc5843@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009bd74d05e5033509@google.com>
Subject: Re: [syzbot] INFO: rcu detected stall in hub_event
From:   syzbot <syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, balbi@kernel.org,
        benjamin.tissoires@redhat.com, fweisbec@gmail.com,
        gregkh@linuxfoundation.org, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, mingo@kernel.org,
        quic_mrana@quicinc.com, rafael@kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot has bisected this issue to:

commit 859bdc359567f5fa8e8dc780d7b5e53ea43d9ce9
Author: Mayank Rana <quic_mrana@quicinc.com>
Date:   Wed May 18 18:12:52 2022 +0000

    usb: dwc3: core: Add error log when core soft reset failed

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=144812f2080000
start commit:   6e2c0490769e Merge tag 'drm-fixes-2022-07-29' of git://ano..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=164812f2080000
console output: https://syzkaller.appspot.com/x/log.txt?x=124812f2080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=26034e6fe0075dad
dashboard link: https://syzkaller.appspot.com/bug?extid=ec5f884c4a135aa0dbb9
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=119bc436080000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16c3c0f2080000

Reported-by: syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com
Fixes: 859bdc359567 ("usb: dwc3: core: Add error log when core soft reset failed")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
