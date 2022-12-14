Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D86864C248
	for <lists+linux-usb@lfdr.de>; Wed, 14 Dec 2022 03:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236949AbiLNChU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Dec 2022 21:37:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236691AbiLNChT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Dec 2022 21:37:19 -0500
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F8726AD2
        for <linux-usb@vger.kernel.org>; Tue, 13 Dec 2022 18:37:17 -0800 (PST)
Received: by mail-il1-f200.google.com with SMTP id i7-20020a056e021b0700b003033a763270so8787005ilv.19
        for <linux-usb@vger.kernel.org>; Tue, 13 Dec 2022 18:37:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0V8K4P+odUhFzrMPlgU7XI9XjkyUPNFDXnhnOg+jYUs=;
        b=2lwUqnFsLfrupLc4En29cPlm6RJzg51Sc8lxZMt/RIKiRlGqOSyWGHBWtoez7Q0s2i
         IuB35L4QPKgMs8/Qm4W619510MsGm86Uea4AYBRUYNyge3D0kRWAOwua9UoJzEiFc4Zg
         XjBKFLDkojsyiq8QBwfbLHhZNhaWW5ehcLqdRbkuLuG0oictoy2GqrJETTraQYlZn1i1
         Wk8K0/5isF56xTIF/FdSCu7sI+jAoWRkh5HxIAKHqInNBUDX6Dt3eUWpgcSCTfloOOd1
         tjir58hizEHo42O5lP6uo7Friu3hOTegChp4Ze+WnvuSBVZhJ58gyM5tGWKDRbwwAqvY
         +9pw==
X-Gm-Message-State: ANoB5plwpePEOzfSdjZhedg2h9hXIkfdvNiunVavURn9JyI4+47cAHR6
        ABk/Bmjg1X6mZrSd4ax3RiW6nb4apO0TtIFWpTnvvqm0YSL4
X-Google-Smtp-Source: AA0mqf7u0eTswsmCa8LdNrGaamA5+mp4gNGUxGfLY2Eb+hqaukHdk7zxDNLOiCVwyu4aK3b6ZvvsyWg+r3SXppaMj/L4Cache0Sm
MIME-Version: 1.0
X-Received: by 2002:a92:cccd:0:b0:302:58d0:2510 with SMTP id
 u13-20020a92cccd000000b0030258d02510mr39789401ilq.27.1670985437082; Tue, 13
 Dec 2022 18:37:17 -0800 (PST)
Date:   Tue, 13 Dec 2022 18:37:17 -0800
In-Reply-To: <Y5kgHgl2dU6fkr3p@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000066fb0905efc09dd1@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Write in gadgetfs_kill_sb
From:   syzbot <syzbot+33d7ad66d65044b93f16@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, hbh25y@gmail.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mingo@kernel.org, rdunlap@infradead.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
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

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+33d7ad66d65044b93f16@syzkaller.appspotmail.com

Tested on:

commit:         830b3c68 Linux 6.1
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
console output: https://syzkaller.appspot.com/x/log.txt?x=10f5988b880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5a194ed4fc682723
dashboard link: https://syzkaller.appspot.com/bug?extid=33d7ad66d65044b93f16
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12208bc0480000

Note: testing is done by a robot and is best-effort only.
