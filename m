Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1BD2D2F6B
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 17:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729948AbgLHQYo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 11:24:44 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:41944 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgLHQYn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Dec 2020 11:24:43 -0500
Received: by mail-il1-f199.google.com with SMTP id f19so16323050ilk.8
        for <linux-usb@vger.kernel.org>; Tue, 08 Dec 2020 08:24:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=HSyExJl7cd4xIkyp8toEOPl4ozCtm+NQv2BdcFpoEZc=;
        b=HOUFuToEEzDgJK+SYv0P3b62tvyLLn8x3EnW1FYKY3y8RjOcJNWc5yJx0Xvwcb5ff8
         AWLh9W3K1aAtU9jglOTUZtLQFN11lc4dANc86WCSXSOMFfDV9UIF5JHNQIJJcoFaHAr5
         CtQMGVBjiRAdS9nQSbd0OeYXhyLMWClw0wE6ylyD8FpasE28xD512KVesfG5aN/bBUqS
         /C1EmHpW1pjI/KUVVh6UfhFYgoG05RGNdGoUBdJmsLtyYdl+peMzSJHFhUcL7+HkLfSE
         avkZX6NJ6Ffk8EyHzC6Viskz3H700cHmx3KZS7u8lfNbaHdVYSjQXAfvlLUaIaRVbXYE
         qnvQ==
X-Gm-Message-State: AOAM533qdp9JIQ/Kqu9M0b76TuWxKja2/i5ARilXmzdtoS/tAH9ReyOG
        kuQnKKmRqkZcT6tG7eN/000LM5NYaOoqNVn6QXi1wWVyHx5D
X-Google-Smtp-Source: ABdhPJxHYoyiUqUwwYS9+jZI0SJfT9+SzZyPXCYnkfWgYNGZwBVj7ggFtyKt4Au1zc2qCeZTaib8l2L8pQvOMKodUzTGs2Vl/kQM
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2b01:: with SMTP id p1mr17378546iov.156.1607444642985;
 Tue, 08 Dec 2020 08:24:02 -0800 (PST)
Date:   Tue, 08 Dec 2020 08:24:02 -0800
In-Reply-To: <20201208160703.GB1298255@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f0fb0d05b5f65e64@google.com>
Subject: Re: general protection fault in tower_disconnect
From:   syzbot <syzbot+9be25235b7a69b24d117@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        legousb-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, starblue@users.sourceforge.net,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+9be25235b7a69b24d117@syzkaller.appspotmail.com

Tested on:

commit:         08a02f95 USB: add RESET_RESUME quirk for Snapscan 1212
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=d24ee9ecd7ce968e
dashboard link: https://syzkaller.appspot.com/bug?extid=9be25235b7a69b24d117
compiler:       gcc (GCC) 10.1.0-syz 20200507
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1406a80f500000

Note: testing is done by a robot and is best-effort only.
