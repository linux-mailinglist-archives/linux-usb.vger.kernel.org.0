Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA1AF4CE688
	for <lists+linux-usb@lfdr.de>; Sat,  5 Mar 2022 20:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbiCETP7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Mar 2022 14:15:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232230AbiCETP6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Mar 2022 14:15:58 -0500
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C32210C1
        for <linux-usb@vger.kernel.org>; Sat,  5 Mar 2022 11:15:08 -0800 (PST)
Received: by mail-io1-f71.google.com with SMTP id g16-20020a05660203d000b005f7b3b0642eso7619362iov.16
        for <linux-usb@vger.kernel.org>; Sat, 05 Mar 2022 11:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=MFp71uvE1kzcpDrO8W1MJNamHxDiZYCfMH53Qkq64S8=;
        b=n3XzFvuzZJvQV24On9/YBpjzDFF0BkgJNWai4BBv6UnZGQFzz9LCS3ToQRhudNbimp
         nIoM+tMNJW0HPuHgr4fhBcJov9DQW5S1LqswHl7oolCL67NTiCYHNN2n9V+E6mMtI+Wp
         Y1RnFf5PDpLITuOwIy8Q+/eSr9LlnGCLqJF/uK/zqeDsbsdqsg9XC/1LMnNilaiMnBKP
         dr4OryT0HDMk8XnLF8zxliY6sOW0M7m5wDkD3FL3gRMy5OMsbVmvRJhmuU5BTZD4nJez
         feENBRDnM8FRla2QsGp5KxB1F7AOe9UJgSrjar+eYb1se1nCuz+Vdc0NLDg/Rwciyjyq
         zBNg==
X-Gm-Message-State: AOAM533KoMM79SjEaC6cZbASHOzAT3hyI4s8LCXIQt5VZk0sylKM4OnK
        L+5ntmTXjfQ7fvDdyG7o/LDZ6XTXNN11gBJA+9ZphUELZC5M
X-Google-Smtp-Source: ABdhPJxCGAeOn66CHdR6xTynzAd5yZOsJbvm0MKnAScFwXWLfhRywgpKvpUVSrZaJ48s0/wWH9abU/afxl/u8+V+n2K+1hq7VroG
MIME-Version: 1.0
X-Received: by 2002:a6b:1495:0:b0:645:b115:611c with SMTP id
 143-20020a6b1495000000b00645b115611cmr1603632iou.199.1646507707401; Sat, 05
 Mar 2022 11:15:07 -0800 (PST)
Date:   Sat, 05 Mar 2022 11:15:07 -0800
In-Reply-To: <YiOy73F0J31b8uPj@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000050b5705d97d731e@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in dev_uevent
From:   syzbot <syzbot+348b571beb5eeb70a582@syzkaller.appspotmail.com>
To:     linux-usb@vger.kernel.org, qiang1.zhang@intel.com,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+348b571beb5eeb70a582@syzkaller.appspotmail.com

Tested on:

commit:         754e0b0e Linux 5.17-rc4
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ v5.17-rc4
kernel config:  https://syzkaller.appspot.com/x/.config?x=f6a069ed94a1ed1d
dashboard link: https://syzkaller.appspot.com/bug?extid=348b571beb5eeb70a582
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12191281700000

Note: testing is done by a robot and is best-effort only.
