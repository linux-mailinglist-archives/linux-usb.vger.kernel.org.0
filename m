Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 267DE5EF1EE
	for <lists+linux-usb@lfdr.de>; Thu, 29 Sep 2022 11:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234420AbiI2J1r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Sep 2022 05:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234861AbiI2J1q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Sep 2022 05:27:46 -0400
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C6C14597D
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 02:27:44 -0700 (PDT)
Received: by mail-io1-f70.google.com with SMTP id e9-20020a6b7309000000b006a27af93e45so369083ioh.9
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 02:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=3rnofjxYuMLNQKQGEXkSsKh61oqRxR3JYXNg07PZbaA=;
        b=rkJ/VG5uLke4J+TRnFSgwTmTLlRrHoMDBtDnogjCFkooyk41c/4F+78w2VooOkc+se
         Z+8W1n3Qq8ys+RuLiP6pqwZcORfEGveGChQqZH4gERsE+UuHSQd2hxW6IYUYQ/SfVF0w
         ecVSi3a0Cq+vtEErx2jxpsUUmtJHOQWCXHs2R3CxLn3g7EPvqDaMN32e7Twh0inEosjp
         zq8cA8NDjTz06cMnhlTWMNaOXDsqwOdjxXHxNorV3lzr3E57ngDTn8w4EcgBZnU2Ajpi
         iP+JSab5UqUFldDDiulOjKdhkjbjQYzEZjli4/hx7AZxR2O9+Ae53vS7vRXM0B8E423y
         l2Jw==
X-Gm-Message-State: ACrzQf1qAbw+gTJIjRfWpjfeIfIg9IJNlJEAlOcYQYfUkewhxTzdc9YT
        3+LVuQLxUFkjJughc7bm06w70l/oBQnC32GtGeb1NoaUiKQX
X-Google-Smtp-Source: AMsMyM4PS2lcOPagpguHu9CFdnAr3H91sKtWgWyWh5qqkW5219kt3wrG0A7LaRnG2GHbKpLPeDc42bSI+vDDp2LnGaEyEAqtJKaB
MIME-Version: 1.0
X-Received: by 2002:a02:6d4b:0:b0:35a:40a6:5730 with SMTP id
 e11-20020a026d4b000000b0035a40a65730mr1299771jaf.198.1664443663854; Thu, 29
 Sep 2022 02:27:43 -0700 (PDT)
Date:   Thu, 29 Sep 2022 02:27:43 -0700
In-Reply-To: <673033a0-de29-f05f-b7c0-abf3d108b9e6@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000055321905e9cd7db5@google.com>
Subject: Re: [syzbot] KMSAN: uninit-value in idmouse_open
From:   syzbot <syzbot+79832d33eb89fb3cd092@syzkaller.appspotmail.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>
>
> On 19.09.22 10:21, syzbot wrote:
>> Hello,
>> 
>> syzbot found the following issue on:
>> 
>> HEAD commit:    ce8056d1f79e wip: changed copy_from_user where instrumented
>> git tree:       https://github.com/google/kmsan.git master
>> console output: https://syzkaller.appspot.com/x/log.txt?x=16a02941900000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=3afe005fb99591f
>> dashboard link: https://syzkaller.appspot.com/bug?extid=79832d33eb89fb3cd092
>> compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=165e850e900000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=123a8c96900000
>> 
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+79832d33eb89fb3cd092@syzkaller.appspotmail.com
>
> #syz test   https://git.kernel.org/pub/scm/linux/kernel/git/greg/usb.git 

KMSAN bugs can only be tested on https://github.com/google/kmsan.git tree
because KMSAN tool is not upstreamed yet.
See https://goo.gl/tpsmEJ#kmsan-bugs for details.

> ce8056d1f79e
