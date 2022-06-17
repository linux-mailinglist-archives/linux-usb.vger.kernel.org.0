Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95A7054F544
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jun 2022 12:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381823AbiFQKWL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jun 2022 06:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381815AbiFQKWK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jun 2022 06:22:10 -0400
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E176A41E
        for <linux-usb@vger.kernel.org>; Fri, 17 Jun 2022 03:22:08 -0700 (PDT)
Received: by mail-il1-f199.google.com with SMTP id w7-20020a056e021c8700b002d3bc8e95cbso2428521ill.3
        for <linux-usb@vger.kernel.org>; Fri, 17 Jun 2022 03:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=BHa9+hGQ/IHxpauWdzshJrHjnkYBEraCxfPd/dEUtAU=;
        b=dAXAWw7YQV6yetliBcVYdlZGTAw5auhC8T/b5/za+iPN8qHaBHFU+U6UhOa5FRbiKn
         31gE55Dgwx7/89Ra/8s8TPpAUdlYqF7/icg86RmVKiWXg6gnAtAh35+s9ItA98/iFKpo
         ZyXBDZsOVSFCJWLx0iVd75NzhO8fS+OX9tBNsC58GmD5MU5jx1CbsQj8eP2ijid7Lr1G
         Zx3DH9DBlqnselIMjd5Vi39u4jtQUy/h95puWH5p7nucQHB+MJQrRNY0G/biEYUuqsWI
         rfEtzjX1j87QBGYqMoDYhGY9gRaxmJ+4usNpvPQshBjgB/f+THnnbCLI8rHlS/g2nAyy
         e9Wg==
X-Gm-Message-State: AJIora/qvjWvicExYP6R7Q8PEV+z95vRTMD6Q5XUA0YD3yBESa0apk9T
        uxdo22WGEJOM39I4hcUudIziqijrkDEuoEWCoegczD0PRgTp
X-Google-Smtp-Source: AGRyM1smu9GzM0y0cFoa15FxWOxLa+jhsxFr0WpG+sezBX1jAlHrD+nTa4zPVOTrTRzJ5B+qmpSlN4EFeuSvc4Z59pOMCUWl/qZw
MIME-Version: 1.0
X-Received: by 2002:a05:6638:329e:b0:331:e8ae:7d9d with SMTP id
 f30-20020a056638329e00b00331e8ae7d9dmr5212322jav.274.1655461328084; Fri, 17
 Jun 2022 03:22:08 -0700 (PDT)
Date:   Fri, 17 Jun 2022 03:22:08 -0700
In-Reply-To: <00000000000006b92e05d6ee4fce@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000066643305e1a22061@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in ath9k_hif_usb_reg_in_cb (3)
From:   syzbot <syzbot+b05dabaed0b1f0b0a5e4@syzkaller.appspotmail.com>
To:     ath9k-devel@qca.qualcomm.com, davem@davemloft.net,
        edumazet@google.com, gregkh@linuxfoundation.org,
        john.ogness@linutronix.de, kuba@kernel.org, kvalo@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        pabeni@redhat.com, pmladek@suse.com, rostedt@goodmis.org,
        senozhatsky@chromium.org, syzkaller-bugs@googlegroups.com,
        toke@toke.dk
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

commit 09c5ba0aa2fcfdadb17d045c3ee6f86d69270df7
Author: John Ogness <john.ogness@linutronix.de>
Date:   Thu Apr 21 21:22:48 2022 +0000

    printk: add kthread console printers

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10e88490080000
start commit:   210e04ff7681 Merge tag 'pci-v5.18-fixes-1' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=902c5209311d387c
dashboard link: https://syzkaller.appspot.com/bug?extid=b05dabaed0b1f0b0a5e4
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14f2c009f00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11b20b35f00000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: printk: add kthread console printers

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
