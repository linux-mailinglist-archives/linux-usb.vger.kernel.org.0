Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 033604FA60F
	for <lists+linux-usb@lfdr.de>; Sat,  9 Apr 2022 10:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240843AbiDIImU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Apr 2022 04:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240539AbiDIImR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 Apr 2022 04:42:17 -0400
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8A641D0F6
        for <linux-usb@vger.kernel.org>; Sat,  9 Apr 2022 01:40:09 -0700 (PDT)
Received: by mail-il1-f197.google.com with SMTP id d13-20020a056e02214d00b002ca4d440f73so7044104ilv.15
        for <linux-usb@vger.kernel.org>; Sat, 09 Apr 2022 01:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=/bp4t45uO/UCmdMLVdMnZLdvzrBnqeP3SYAoylwRLZw=;
        b=ebnNMPFTX7rNn2MWF9dP8F9gb9zAZOlB88LqR7+/EaG0Xq6jkkLzsICp3ns4LpOR3a
         btzL6hV1RkNGeCW1yTD/NZYT304am3MsSjN3lGSianp7m6GUlS/MIljERUCb68tCDycI
         gG0BsvIVrzBfj/NX1im8Z6JdawLWecHUSceVq1QminM03ePV9O6bbcADqxTE01NNU3lU
         YmEGYmvoPkZjF4dzn9GwAk+QxRsKsA6EOU/O/7VlnYvGNDAhngvTMqDefIl5Fj/BV51S
         YVGxWex1XlKmhnXD/LShh0TVpis5DKYGI5LexrxHE8E4xqg1HM36gQ7kFqcWIZXlTPik
         55xA==
X-Gm-Message-State: AOAM530/D1JY9Lm5L8ekOUeFIIdBXjZsRnEAJxyiBXU5/lVh1yc6ESSc
        WnxWqSB9DlPA1s/K+CxH3B2qi4ilCCekWwQe/lPBCndn1K5g
X-Google-Smtp-Source: ABdhPJzB6NiIE7KBeN2Oe8GaKT0m96EIF/Jc3tq+liSM/KmPVddhh3Dnq+nJRuq2czTw/4Inb1Br7SmGvpipzV8FgXLpqa2tPv0w
MIME-Version: 1.0
X-Received: by 2002:a05:6638:22c5:b0:321:32af:3191 with SMTP id
 j5-20020a05663822c500b0032132af3191mr11229623jat.116.1649493609172; Sat, 09
 Apr 2022 01:40:09 -0700 (PDT)
Date:   Sat, 09 Apr 2022 01:40:09 -0700
In-Reply-To: <CAAZOf24aXhyYd1pv0J63+2oLJ7K=yFFTXm_sE022-spCMMz6QQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a2518505dc34a817@google.com>
Subject: Re: [syzbot] KMSAN: uninit-value in ax88179_led_setting
From:   syzbot <syzbot+d3dbdf31fbe9d8f5f311@syzkaller.appspotmail.com>
To:     arnd@arndb.de, dan.carpenter@oracle.com, davem@davemloft.net,
        glider@google.com, jackychou@asix.com.tw, jannh@google.com,
        jgg@ziepe.ca, k.kahurani@gmail.com, kbuild-all@lists.01.org,
        kuba@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, lkp@intel.com, netdev@vger.kernel.org,
        pabeni@redhat.com, paskripkin@gmail.com, phil@philpotter.co.uk,
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

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+d3dbdf31fbe9d8f5f311@syzkaller.appspotmail.com

Tested on:

commit:         33d9269e Revert "kernel: kmsan: don't instrument stack..
git tree:       https://github.com/google/kmsan.git master
kernel config:  https://syzkaller.appspot.com/x/.config?x=d830111cc3be873
dashboard link: https://syzkaller.appspot.com/bug?extid=d3dbdf31fbe9d8f5f311
compiler:       clang version 14.0.0 (/usr/local/google/src/llvm-git-monorepo 2b554920f11c8b763cd9ed9003f4e19b919b8e1f), GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1130ceb7700000

Note: testing is done by a robot and is best-effort only.
