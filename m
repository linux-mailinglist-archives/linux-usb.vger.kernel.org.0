Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C85F6348361
	for <lists+linux-usb@lfdr.de>; Wed, 24 Mar 2021 22:06:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238199AbhCXVFW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 17:05:22 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:36754 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238179AbhCXVFE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 17:05:04 -0400
Received: by mail-il1-f197.google.com with SMTP id s13so2645337ilp.3
        for <linux-usb@vger.kernel.org>; Wed, 24 Mar 2021 14:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=mROZGZumZQMQOnoXlCDQGKmXabY17Zv1cEv6eXCZ7B0=;
        b=R668Zz9vYeTJiS0o9YYbOEmotGSnCxCwu/PpMJRBRXY6PHlbkG47hEmFG5CSJjIR20
         a8glCoCWVkAJCMTQ+9nzPmiVFfFqF41EGuFKS219A2Ib+y42TcDNcGUyEC6kGkqOJNjB
         Q+21oBpdVn1VCDFjm4Yg3OlNR40/WIv7sOaT/VUhTH24NRbFxmD9P/0SdXbp8ekLmk/5
         WKrAYHcErMep8mTD6o62WeG/La154dbuqMgdQpyIM6ggl4/XtRNxnX+7F5WVXSY5zOt3
         hf7sLD9h+AgIt4MZr35eGATay8VRGhXw4HNDUgKb5gTozooneUx0yVC6qlD8QYSAZfze
         Ba6A==
X-Gm-Message-State: AOAM530dWCyd8UuV3Sl/7MYn5rhnX0olG2xkDMwvRRdWIqlhizaVpeoe
        E/Xd6bprif6oAB1j3yeDhPtjYfn3mTAYdog9M0WVQUrFMvEZ
X-Google-Smtp-Source: ABdhPJxSQCYWCzJpObAUcnvHHXPhUoZV/3wVmPom/l/7dIKev7tSKi/BGuOV4CxSH82tmIoAzqZDTyCoOH8IYSWW3GGqEgqhMaRl
MIME-Version: 1.0
X-Received: by 2002:a05:6638:218f:: with SMTP id s15mr4724845jaj.58.1616619904161;
 Wed, 24 Mar 2021 14:05:04 -0700 (PDT)
Date:   Wed, 24 Mar 2021 14:05:04 -0700
In-Reply-To: <34e31fabb228da3cca292e6496dfa8a79c25c7d8.camel@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001fdd8305be4ea7a9@google.com>
Subject: Re: [syzbot] UBSAN: shift-out-of-bounds in vhci_hub_control (2)
From:   syzbot <syzbot+3dea30b047f41084de66@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, musamaanjum@gmail.com, shuah@kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com,
        valentina.manea.m@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+3dea30b047f41084de66@syzkaller.appspotmail.com

Tested on:

commit:         84196390 Merge tag 'selinux-pr-20210322' of git://git.kern..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=4b6433fa3370faed
dashboard link: https://syzkaller.appspot.com/bug?extid=3dea30b047f41084de66
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1702d621d00000

Note: testing is done by a robot and is best-effort only.
