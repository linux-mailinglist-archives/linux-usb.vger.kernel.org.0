Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E50B47923A
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2019 19:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728424AbfG2ReB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Jul 2019 13:34:01 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:52489 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbfG2ReB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Jul 2019 13:34:01 -0400
Received: by mail-io1-f69.google.com with SMTP id p12so68229896iog.19
        for <linux-usb@vger.kernel.org>; Mon, 29 Jul 2019 10:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=syvtJEG7USwiD/3Hl7rGPBe7rMf4IwYj1Akgur62+14=;
        b=ssV03qJTh14p3N3wM0wMlmkrVtXfKDXO4FpidO7vULeuvk6ISfSFL89Q70xRwNCQ4R
         46e9082CV4IOHuz3MKRa8FKLk0kTMZEzp5H3GaU2kfjTs+Ik/F07RV7vfu0pqumfxwU3
         LhZUWd3cugFvs8kJ25B/EGS+gIQfCDKTC2mUh7e9Zf+sZne02HJOZC+LBp78AEWE0/1p
         YQvsGnWQDm36Mt+6Bvk/ht6QhASMtWNOchCjHBJBWtpQY6DMDkiHFXKCnL1juHM9RW6z
         lUhvC4siAeDnQ4gNoJi4N6fc9IypFmiNCvIar4qCDf1V2D9HOeI7vNqkHTnxyLFbhBQb
         kugA==
X-Gm-Message-State: APjAAAWiyDgEPh9eMJQuZawDjnXlct3OKVu9PrRduNUneMP0O3JEVhS5
        Z5s+BcsOLl600rkoYXKLXh1HJwFrunSsg/gA1u8tioHbXeO5
X-Google-Smtp-Source: APXvYqzBpic4jveIaJHaymS7PGeJjXNGUXe/2V3f3+gCrnwDqmqFEB8RN3soewFR+0pvvH6Hm6Us3vIRWDdXigm2rmw3KmoU542w
MIME-Version: 1.0
X-Received: by 2002:a02:90c8:: with SMTP id c8mr20066537jag.22.1564421640620;
 Mon, 29 Jul 2019 10:34:00 -0700 (PDT)
Date:   Mon, 29 Jul 2019 10:34:00 -0700
In-Reply-To: <CAAeHK+yY3JWAj+EZ5wzqUOMbN+cdddCoRn7Nxn759-7zR-J7BQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002b0f41058ed54cf4@google.com>
Subject: Re: general protection fault in flexcop_usb_probe
From:   syzbot <syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com

Tested on:

commit:         9a33b369 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=23e37f59d94ddd15
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11cc12d8600000

Note: testing is done by a robot and is best-effort only.
