Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0DD95EF5A3
	for <lists+linux-usb@lfdr.de>; Thu, 29 Sep 2022 14:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235189AbiI2MmV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Sep 2022 08:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234985AbiI2MmU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Sep 2022 08:42:20 -0400
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5962815E4DB
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 05:42:19 -0700 (PDT)
Received: by mail-il1-f198.google.com with SMTP id r12-20020a92cd8c000000b002f32d0d9fceso1003320ilb.11
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 05:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=F23y/I71lSXyCtcdA3sc2bL2IvYu0p+7k+BS+0+yrpM=;
        b=khQ0RJahgjiJg4YR3W7QRDV68mFbBZwjCk6SctqbGO+HBuI5BNmHjVnDBjKyKuQn5h
         fQO2CxlZN0Zc8Z1pzqZYqtjCxcDIxb1loKNrSAzaWVQL7fnrsFhvwl19dt02wfPtuFWP
         cJmm6ung69xHb1yYmKPOMrcIxOInQvoRYvZEUshQqyEQ69mKejClBF8OEY8jH1qv1a89
         lUPNQ59bx13otQbawLgpNZSMNEn2vCG97bgI33pdlNQuKX1TNClTJLRtdNWhjqn9gWA3
         uOG4Ux8gizJntP51Tb+5bOh6AhIyqE/9Ghct5GMV0ntIAanui928N6hzStW9FpekgDbn
         BOFQ==
X-Gm-Message-State: ACrzQf3QsLCe2TJXNc/J6Cr7aoMTg+COoC7QZ06AaYuHmocwe9IQG/s5
        EeAzrSPjmAnr2F4iUovX1PzWFQySVk0/ELU1pM1bMn4629+n
X-Google-Smtp-Source: AMsMyM5dRcpPTi5sKFmQsUQJDjUpRzuXMay8r1GtxJo8Q/O+zLICv+E10qQzF8xjnWJOmnHr7Rd1Nryp10nCmVx/2qO+ixiEqtnl
MIME-Version: 1.0
X-Received: by 2002:a05:6638:16cf:b0:35a:576b:6e33 with SMTP id
 g15-20020a05663816cf00b0035a576b6e33mr1681734jat.159.1664455338693; Thu, 29
 Sep 2022 05:42:18 -0700 (PDT)
Date:   Thu, 29 Sep 2022 05:42:18 -0700
In-Reply-To: <09f1f632-57ea-93e7-46c7-2065744c768f@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000351ee705e9d03592@google.com>
Subject: Re: [syzbot] KMSAN: uninit-value in idmouse_open
From:   syzbot <syzbot+79832d33eb89fb3cd092@syzkaller.appspotmail.com>
To:     glider@google.com, linux-usb@vger.kernel.org, oneukum@suse.com,
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

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

arch/x86/kernel/module.c:230:49: error: call to undeclared library function 'memcpy' with type 'void *(void *, const void *, unsigned long)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]


Tested on:

commit:         968c2729 x86: kmsan: fix comment in kmsan_shadow.c
git tree:       https://github.com/google/kmsan.git master
dashboard link: https://syzkaller.appspot.com/bug?extid=79832d33eb89fb3cd092
compiler:       clang version 15.0.0 (https://github.com/llvm/llvm-project.git 610139d2d9ce6746b3c617fb3e2f7886272d26ff), GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10f3519c880000

