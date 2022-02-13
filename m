Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39A054B3BCF
	for <lists+linux-usb@lfdr.de>; Sun, 13 Feb 2022 15:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233724AbiBMO3Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Feb 2022 09:29:16 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232801AbiBMO3Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Feb 2022 09:29:16 -0500
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F045F8C1
        for <linux-usb@vger.kernel.org>; Sun, 13 Feb 2022 06:29:09 -0800 (PST)
Received: by mail-il1-f198.google.com with SMTP id g15-20020a92520f000000b002bec6a02012so4395969ilb.18
        for <linux-usb@vger.kernel.org>; Sun, 13 Feb 2022 06:29:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=Dv9Zi+PX8etQ+L08jB/rCP1HZFg1/MknHt1yKnbgbN0=;
        b=ZXlOvKZNXyPCxc2bqFH/pt+c8Y5y/KudUrVNPeL2hd4QJ0YrtJUOvKxnJXEmTXnXWC
         /LMdJYDyTpPJMvEZ9iSEt5ka/oWSdUgd0c9E38+V+Wk3rhbL2UXBP3YAdA2vDUthE/Op
         pu9MXIk8a9xFyxHHn0EBXYYjzTYsyn/+UKk2JTG3KtEWLafkxBMdSNLEBBD76YtLhncs
         obbBEeZSF12fdIZxVzTPpOKV0DS1ZeZYhPXKcygl2kzwkTP8cnKMhEf1fLATmFiUsPLa
         5UDewVKtX165JBUzgVFnRnTaNleM33pvvdWBmp27CVjWzI7G+NmPeeM9ZLOWnwc52a5p
         fMbw==
X-Gm-Message-State: AOAM5330yRReCYIimz6kcTTudMqlJ0gGfNjp7bITbswPC6Xtu+pYRcCW
        6oysmFYQk3qpUW2TopKwJQTnbNvCirgggilJMOLONquRLTNC
X-Google-Smtp-Source: ABdhPJzzEhKco3w4LZcBUiyVqndZPZxC89klYJbKjD3vKb7taOsTe8y7FmnS78bfkXqXi0vqAP2QZTmIwBGOZLSaxzCUnUfMv4Gh
MIME-Version: 1.0
X-Received: by 2002:a05:6638:13d1:: with SMTP id i17mr5796558jaj.182.1644762548816;
 Sun, 13 Feb 2022 06:29:08 -0800 (PST)
Date:   Sun, 13 Feb 2022 06:29:08 -0800
In-Reply-To: <20220213103641.1247-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000764f1f05d7e71f64@google.com>
Subject: Re: [syzbot] INFO: task hung in usb_get_descriptor
From:   syzbot <syzbot+31ae6d17d115e980fd14@syzkaller.appspotmail.com>
To:     brouer@redhat.com, gregkh@linuxfoundation.org, hdanton@sina.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
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

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+31ae6d17d115e980fd14@syzkaller.appspotmail.com

Tested on:

commit:         b81b1829 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=d94e196c4f68081d
dashboard link: https://syzkaller.appspot.com/bug?extid=31ae6d17d115e980fd14
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Note: testing is done by a robot and is best-effort only.
