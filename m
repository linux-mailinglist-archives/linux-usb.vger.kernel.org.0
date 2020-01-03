Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C986512FAF0
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2020 17:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbgACQ5D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jan 2020 11:57:03 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:52901 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727963AbgACQ5D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jan 2020 11:57:03 -0500
Received: by mail-il1-f198.google.com with SMTP id n9so36559972ilm.19
        for <linux-usb@vger.kernel.org>; Fri, 03 Jan 2020 08:57:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=CV8CkChElFjf0jDvkRmO/Avuy2yoeDOeDMEHSWAyFO8=;
        b=fWYv73KXBPjF0Oz4XVUAA2oJakqHphh9+ublKr7nrB5XYGrMIJ7bzIyMH+kswRFxnX
         wHUzefzCioiVjkQSrbtDx5Skc2kzKs8QT/RirFrr5ySpdRXFyjmZu9PduMAn9Wgif0/b
         gpxx9r8/H5wkEqQktEWFU/tDBJs11zqA7i4aMGeD3LUNNMQSOqQ7vbz0dSA/RsaWH29h
         qIihbvmLVsE5RQi/MX9GQabeQyTHhUyDkhezLjYJKH2vVc83K4G/mnFbioQY5fSLWNto
         6tuIM92ZlEpAvALrE/yt52puGu0qux6Gg+i/q1YjzYqMfauj3kkuyoJenZj2+N21AlNy
         P0XQ==
X-Gm-Message-State: APjAAAWXvPiU5SyDpBjuD/A40kcqS2XzhI/HllGdImE5rMzFZANWDoMv
        WM1mF1yubPt8TWQikB8Xm1PfdN1XK96vuIHETgdUezxEHhlK
X-Google-Smtp-Source: APXvYqx7P/ms+QWeGK7fF3ZjlJWamv6WKPaEzHR2v2UJEcHFQ/rUZIhA4hcdyh1xvvPjmodbWjlUXFEMQuyp8rnVj9u0+67bUzE8
MIME-Version: 1.0
X-Received: by 2002:a92:9c48:: with SMTP id h69mr68019925ili.222.1578070621457;
 Fri, 03 Jan 2020 08:57:01 -0800 (PST)
Date:   Fri, 03 Jan 2020 08:57:01 -0800
In-Reply-To: <Pine.LNX.4.44L0.2001031133050.1560-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d29687059b3f32aa@google.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb (2)
From:   syzbot <syzbot+10e5f68920f13587ab12@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, ingrassia@epigenesys.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+10e5f68920f13587ab12@syzkaller.appspotmail.com

Tested on:

commit:         ecdf2214 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=b06a019075333661
dashboard link: https://syzkaller.appspot.com/bug?extid=10e5f68920f13587ab12
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=177f06e1e00000

Note: testing is done by a robot and is best-effort only.
