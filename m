Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 031332D5C11
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 14:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389446AbgLJNjA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 08:39:00 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:51695 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389584AbgLJNio (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Dec 2020 08:38:44 -0500
Received: by mail-io1-f72.google.com with SMTP id h206so3898799iof.18
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 05:38:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=kgFGcmgPC8j3KRHWZ4y5Gyk/Fnf8f4ATjgdtBg1RD1A=;
        b=jvxI+cGhoKz999A+09gOdUFpaCc4WZZWQfjXYdZlsczDZPJOWVgoEaBSBq4nXfFceb
         i7fSuootAQJGrXpr5kV0oYPCCsS14Kt6L5w6q+Ra0Y+1QKqWT0oiEN7zESnp3ncxq+wf
         Toq5y7mAQEmJBTNNY/z0AXyX2yxPll+USsVhsN4z8ipsgkXUHFyalOCmzNMWgYuWD0H2
         lqb1UaKgFGX2lBYz4163PmAcDXb5YQDoHzRnqheCd/ZqjGSIfh4lbb1GLOOIclyM3aFk
         N3j8AnTE5mPFJP0Z5o78RiCr2Lu3/MzU1gUZkPP2KUnYqy4EtKGmcTjbSiVWqMGrfq1q
         ckUA==
X-Gm-Message-State: AOAM531dE8MnFI2/SDsl5gQDTzOw6puhGD88Lept+Y8NymkrS5t3F7Sl
        aaXRPWbIoXmnkLvxOF699Recvq5JXNXPhkFRpdyzxrYBn+QI
X-Google-Smtp-Source: ABdhPJzKakhL76WLvBKzOxJhMiSEhpIghvxAoWZtBw/Qc29GbG//xqYBqwgWc4mVrw77xaQMi6jiEciSsZGZBgCigzE046DPqG0C
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1653:: with SMTP id y19mr8510977iow.90.1607607483982;
 Thu, 10 Dec 2020 05:38:03 -0800 (PST)
Date:   Thu, 10 Dec 2020 05:38:03 -0800
In-Reply-To: <X9GiwQsABTa/zC/t@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000056a2905b61c496c@google.com>
Subject: Re: WARNING in cm109_input_ev/usb_submit_urb
From:   syzbot <syzbot+150f793ac5bc18eee150@syzkaller.appspotmail.com>
To:     dmitry.torokhov@gmail.com, eli.billauer@gmail.com,
        gregkh@linuxfoundation.org, gustavoars@kernel.org,
        ingrassia@epigenesys.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com,
        vulab@iscas.ac.cn
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+150f793ac5bc18eee150@syzkaller.appspotmail.com

Tested on:

commit:         f6d088b4 Input: cm109 - do not stomp on control URB
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=af17f186e004b5ef
dashboard link: https://syzkaller.appspot.com/bug?extid=150f793ac5bc18eee150
compiler:       clang version 11.0.0 (https://github.com/llvm/llvm-project.git ca2dcbd030eadbf0aa9b660efe864ff08af6e18b)

Note: testing is done by a robot and is best-effort only.
