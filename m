Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C644B4193
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2019 22:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391215AbfIPUNC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Sep 2019 16:13:02 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:35893 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730467AbfIPUNC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Sep 2019 16:13:02 -0400
Received: by mail-io1-f70.google.com with SMTP id g126so1684955iof.3
        for <linux-usb@vger.kernel.org>; Mon, 16 Sep 2019 13:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=l4OIlRI8e5kXyN9A1IopcKJhkWlrZc3Q+7bfrloPlRE=;
        b=ONiE/HK6lat3RzhKS+TX+/0j0OnEzK2FUjTPRobXnsG7gKzz7qf5HVV6ZdvZBYo6pX
         r0UwUOFT7IHh3zuex4ZURMHCUpcvSQbEMAoG55/QVeWn7e1HDkzDc0Zrp5T9aaspzgU1
         1BomOvOvXmVWxTxS03+J3P8Hzex/kRaWA+Q3GeounUkfVfiI0VwqnSBpZ+ixmC0XfiEj
         yJmh4AflxaI+aialKzaJhIeh6GO4SNq5vHs7J7oOsDVFm6BaXNYcTdxTYtNvEdPeHpgZ
         zniFmU63lFXlf6+11DiSwDJFmRtpikLM2MXIMbn/eC67RausmEa24291gw/Vjuy35zUt
         3xWw==
X-Gm-Message-State: APjAAAUnba2Wse4p3wx6iqbpXX/srkFiHcCaU1fswLmZPRwMiowSxKDB
        ojtXRJ++m7RKb+B7A5v3ypIB7nZf2JD0aR0yoSVjlo4GLKgn
X-Google-Smtp-Source: APXvYqwNlxokkyAMkxB+4hKfQugswka9/Tcy86ADgSBZzkYjrylB+j85zyyS+Rtk51JblDxjgrWrwY5Chk6LVXKx4r/sERNM42uc
MIME-Version: 1.0
X-Received: by 2002:a02:7113:: with SMTP id n19mr1961225jac.82.1568664781716;
 Mon, 16 Sep 2019 13:13:01 -0700 (PDT)
Date:   Mon, 16 Sep 2019 13:13:01 -0700
In-Reply-To: <Pine.LNX.4.44L0.1909161551020.1489-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001603470592b13bfc@google.com>
Subject: Re: INFO: rcu detected stall in dummy_timer
From:   syzbot <syzbot+b24d736f18a1541ad550@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, balbi@kernel.org, chunfeng.yun@mediatek.com,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
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
syzbot+b24d736f18a1541ad550@syzkaller.appspotmail.com

Tested on:

commit:         f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
dashboard link: https://syzkaller.appspot.com/bug?extid=b24d736f18a1541ad550
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1267f9c3600000

Note: testing is done by a robot and is best-effort only.
