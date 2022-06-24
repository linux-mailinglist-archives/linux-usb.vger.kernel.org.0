Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68A0E559F3C
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jun 2022 19:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231910AbiFXRKK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jun 2022 13:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231892AbiFXRKJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jun 2022 13:10:09 -0400
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392905D108
        for <linux-usb@vger.kernel.org>; Fri, 24 Jun 2022 10:10:09 -0700 (PDT)
Received: by mail-il1-f199.google.com with SMTP id l2-20020a056e0212e200b002d9258029c4so1749831iln.22
        for <linux-usb@vger.kernel.org>; Fri, 24 Jun 2022 10:10:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=HjdbkPhwZOSgjSTqBCfPksHKCWoZqNFbd8Z/G+uV0aE=;
        b=7n54pA2zwFo7B1te0+MtTFTl+5Jdanhc8nHwcjWzEZLU2FRznpqj9Oy1cogHAsco2l
         rlPW2hvEYFeBDJvDw+OXTuVEYwmmfAl2QPc+YR+Tvwk1LjRA7eTNUEgDcPvGtVPhBNts
         Ho5qJNHD5JBaMJl982TWcIEZQVrmTUMouM3kJImB4UG0py1cf2NzUH4iyxMNRkGl0bcz
         4Sr0xONZ57h9KhaRAkd6gzKv0ElCD0oKBOH0HsiTrsM71qe94zthjqeMrtSpf32l5gMN
         +rzXKL9TTxwVJSf/uT+bb79NRUQL4aDiQ0OAMIzXHlOO9nU1+7G4a0E/lWS9cmZKw63T
         IJgw==
X-Gm-Message-State: AJIora9PQAV/crViqfHgBFfc8nGby4n14mLR/wzDCNOOuiuQPUJtYYJT
        HsAhl72GrhJxSHtj5hXc9JXQl7CJHZk3WM13LXm6T8WZQ2Uf
X-Google-Smtp-Source: AGRyM1srH3KT+XQ/btwSJLikREunXBEHi2XBpCWOly1/wTfR+ogUNIukOKGik56oSOVV0OAtR++d6H796G7NWYo8gak06sU8p0Qr
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2cc6:b0:66a:2ab:ef35 with SMTP id
 j6-20020a0566022cc600b0066a02abef35mr8217221iow.115.1656090608526; Fri, 24
 Jun 2022 10:10:08 -0700 (PDT)
Date:   Fri, 24 Jun 2022 10:10:08 -0700
In-Reply-To: <YrXLgOCf4e4kmIzH@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006fecd605e234a41f@google.com>
Subject: Re: [syzbot] KASAN: null-ptr-deref Read in ida_free (2)
From:   syzbot <syzbot+aa620fb1ece874a3f34c@syzkaller.appspotmail.com>
To:     Julia.Lawall@inria.fr, andreyknvl@gmail.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, hdanton@sina.com, jannh@google.com,
        jj251510319013@gmail.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, schspa@gmail.com,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
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

Reported-and-tested-by: syzbot+aa620fb1ece874a3f34c@syzkaller.appspotmail.com

Tested on:

commit:         90bc2af2 USB: gadget: Fix double-free bug in raw_gadge..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
console output: https://syzkaller.appspot.com/x/log.txt?x=102c524c080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=34c24e9249d527bb
dashboard link: https://syzkaller.appspot.com/bug?extid=aa620fb1ece874a3f34c
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
