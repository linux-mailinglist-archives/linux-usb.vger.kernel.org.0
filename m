Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5C3E5EF583
	for <lists+linux-usb@lfdr.de>; Thu, 29 Sep 2022 14:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234939AbiI2Me2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 29 Sep 2022 08:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235147AbiI2MeY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Sep 2022 08:34:24 -0400
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B1C4156266
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 05:34:23 -0700 (PDT)
Received: by mail-il1-f199.google.com with SMTP id q3-20020a056e0220e300b002f5e648e02eso996197ilv.3
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 05:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=LVBz8QdrMtq7hJWvjtUQAgZi+dotITm0ou0hgJEwLQU=;
        b=e048XDMaC9F41CETADoptKswkDc74xRWg2r9SeV8damMx8d+ydyENFxU/nvD/9uXSf
         LMptbQlykRxiBtlV9FAR/sdc2IQK3cxI2ZQE4fEodS6GkzuaWt8ISDAqaubFJEwm78yo
         tS8UnLZzqBriYO8vi1mxKnXgjSKdBKUUFIuGn/8SiLKTDanVYFbCHHu+11oO+8r6GTXm
         7Spq8EB+Ct+myxJ6+T+UT0i77eO0CkH0FeBbuG14L4LtWSO+FiIILo4FVGs67kRelx/A
         t61lG4+qLVznYe7jFsaUjgkvLSCYRyaJ/Y6HiwM7ud2gOE28/9mkK08v9dxrMnSLVCCz
         dLlw==
X-Gm-Message-State: ACrzQf3B/zIKcwy4mRwr+nf/v0wKzhXBAcGu53HhxK65aNTrY/jo3Gey
        Btx5W7nD2TVKLv2LoO6UQqpkl6dkvaLfcdWUS42hhcUMPPP/
X-Google-Smtp-Source: AMsMyM7pawte8qFV3C1XBJO5aCu2Ucinf3KHcwJR2KHfHnokgttgQaRIuBqFU6JfTA1sKFmVtjAPuwR+tHiJiZeJkzsJk40Lut55
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:17cf:b0:2f3:6ffc:af with SMTP id
 z15-20020a056e0217cf00b002f36ffc00afmr1532770ilu.97.1664454862852; Thu, 29
 Sep 2022 05:34:22 -0700 (PDT)
Date:   Thu, 29 Sep 2022 05:34:22 -0700
In-Reply-To: <CAG_fn=WXcwFZ58ChAMkToG5FQe6sDTMGfs1TS8ZmW8BGUr2xfw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d858a505e9d01851@google.com>
Subject: Re: [syzbot] KMSAN: uninit-value in idmouse_open
From:   syzbot <syzbot+79832d33eb89fb3cd092@syzkaller.appspotmail.com>
To:     glider@google.com, linux-usb@vger.kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
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

In file included from ./include/linux/module.harch/x86/kernel/module.c:230:49: error: call to undeclared library function 'memcpy' with type 'void *(void *, const void *, unsigned long)'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]


Tested on:

commit:         968c2729 x86: kmsan: fix comment in kmsan_shadow.c
git tree:       https://github.com/google/kmsan.git master
dashboard link: https://syzkaller.appspot.com/bug?extid=79832d33eb89fb3cd092
compiler:       clang version 15.0.0 (https://github.com/llvm/llvm-project.git 610139d2d9ce6746b3c617fb3e2f7886272d26ff), GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17f0b59c880000

