Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C060E97A5F
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 15:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbfHUNJB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 09:09:01 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:39385 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728750AbfHUNJB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 09:09:01 -0400
Received: by mail-io1-f71.google.com with SMTP id g12so2590783iok.6
        for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2019 06:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=MRdtoTfzHIwJVxhX35Sc59foQp09KDcPOWTOEZaO7x8=;
        b=PnWJdhnseewgIGMPWOgf2n80CUCuegfOBguS9avMQW1mTINuHZZ47p24NRFHN3DDDN
         B6C15hcXtn9WIow3d6x7cBR28LE7PZz0bKm2+cr5l3dxcXc5la7unBjf/i6ZtlYDX2JU
         YkajOIN06Ue82VfoVEelqUPoBlFLXAKXXVTStQ5ZSPillwHB7uCHN73GctAZ0PLRLAkf
         O3M10nJLEHcB6lv0NM25Huz7/A1+CC2zTsZ3HKe28EBCj4mbk1nIJcXhS439GAgofdmI
         1nJDldVl9qzNjHk7l210UcDQMUyj+av/hybwxba83t3mzsd5Vhl0nceHKGuiPKhNb1BY
         2aCA==
X-Gm-Message-State: APjAAAXdDpUBNOc9GA+AnoFUvCuo4X7SHxt8BE4VoMhoNx42WsU8VEhZ
        NInuQO648XEFa49WUldIdYEylrJ398PbR08X6tz864As20M2
X-Google-Smtp-Source: APXvYqzS78T/uhx6IUoEGdP0SfpaPU+rACUgLTB7aYQf7Q031U2NMTj0nJSIiooWOU5phAbHo/88+lym2ff9FXmSeqFbDw8yV1ST
MIME-Version: 1.0
X-Received: by 2002:a05:6638:310:: with SMTP id w16mr9829024jap.136.1566392940385;
 Wed, 21 Aug 2019 06:09:00 -0700 (PDT)
Date:   Wed, 21 Aug 2019 06:09:00 -0700
In-Reply-To: <CAAeHK+wkV7zpAHURRzdY_TMRkCv=P5=yfJqLf9tAoYJA35779A@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ca63880590a046e2@google.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb
From:   syzbot <syzbot+a7a6b9c609b9457c62c6@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, hdanton@sina.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        oneukum@suse.com, stern@rowland.harvard.edu,
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
syzbot+a7a6b9c609b9457c62c6@syzkaller.appspotmail.com

Tested on:

commit:         7f7867ff usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=140148ca600000

Note: testing is done by a robot and is best-effort only.
