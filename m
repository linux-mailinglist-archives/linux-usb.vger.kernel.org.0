Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A3E486D3D
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jan 2022 23:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245122AbiAFWdK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jan 2022 17:33:10 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:41621 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbiAFWdJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jan 2022 17:33:09 -0500
Received: by mail-io1-f69.google.com with SMTP id k6-20020a0566022d8600b005e6ff1b6bbaso2805821iow.8
        for <linux-usb@vger.kernel.org>; Thu, 06 Jan 2022 14:33:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=Gt9eD7PwKSOXgXvc7qjCtq/BCtwFiuR9TKZmMih6Bic=;
        b=EqZRrCJrmnUFLvkukyd3sHp46SEuRkWx7s5bjmZoOeMsKZgYzQu9ABzFNWwKeZFP/X
         k6m0tqqSulDkxEXDbj1/CulaZqzC/j1EUkBRif+pOtkq03mQUPuekxV8KCmDHNVws8jq
         PQASJC/jJ7Un32zPfiE/8+q/PWB8DtktSKzYcia+i+z3eh1+0pE4xK19lP1pajzpYSjF
         MSRiAif1CGrO5k4JkUK6yOokywyjmWzGmjHrzEq4LgH2AFDwP0jf+VXuMowBeAx7w45V
         Jjukvuq7H0s5lkSMtudUyMl4Ej544Ub0NgpKtKzo3OD90/7rAADaG3gp3aPdNT4siFTJ
         LWzQ==
X-Gm-Message-State: AOAM533Vjg20kotl6v/T9x9w06UwyHkpAklOKpzTaKjM7BE8zlam9K2L
        kvJ6FlQ8p8nSpY8YLUQ3rAily+kRzahSBsU9Dbv5FsMvJULY
X-Google-Smtp-Source: ABdhPJw5fVYRytZ2MPpMi+5KevebaJQc2UNL6L9g9FQPtrrJ2bgITaL8izgm6Q3TrJw/KZhiL9SMs0yx//vpyG9q6RtHfkDlEbFW
MIME-Version: 1.0
X-Received: by 2002:a02:c6ab:: with SMTP id o11mr28395658jan.303.1641508389398;
 Thu, 06 Jan 2022 14:33:09 -0800 (PST)
Date:   Thu, 06 Jan 2022 14:33:09 -0800
In-Reply-To: <60e9caf1-7b9f-c5a4-a3e8-ff9135e16197@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000722d9705d4f17431@google.com>
Subject: Re: [syzbot] KMSAN: kernel-usb-infoleak in usbnet_write_cmd (3)
From:   syzbot <syzbot+003c0a286b9af5412510@syzkaller.appspotmail.com>
To:     glider@google.com, gregkh@linuxfoundation.org, johan@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        paskripkin@gmail.com, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+003c0a286b9af5412510@syzkaller.appspotmail.com

Tested on:

commit:         81c325bb kmsan: hooks: do not check memory in kmsan_in..
git tree:       https://github.com/google/kmsan.git master
kernel config:  https://syzkaller.appspot.com/x/.config?x=2d8b9a11641dc9aa
dashboard link: https://syzkaller.appspot.com/bug?extid=003c0a286b9af5412510
compiler:       clang version 14.0.0 (/usr/local/google/src/llvm-git-monorepo 2b554920f11c8b763cd9ed9003f4e19b919b8e1f), GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11dd4b71b00000

Note: testing is done by a robot and is best-effort only.
