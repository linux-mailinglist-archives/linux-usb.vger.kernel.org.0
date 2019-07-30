Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D32F7AACA
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2019 16:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730959AbfG3OUP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jul 2019 10:20:15 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44882 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbfG3OUP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Jul 2019 10:20:15 -0400
Received: by mail-pg1-f196.google.com with SMTP id i18so30140640pgl.11
        for <linux-usb@vger.kernel.org>; Tue, 30 Jul 2019 07:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VxDw0/AhSqBc+UFZUyCqEn82uv1wGE11yVcaX4Q0n6o=;
        b=dyrBL+wPYhegsmZBAGBP2FqAXypY3hXlWpWfsF+mgCyBUA0/oMiPQvycFXN3A1WD6J
         +p+u3fsrMWUaxUiUcxPnAs5SCfDBt+ULGVIV6tyT2heZPE/D/ZSTK7yWZ1liHqzaBCeI
         GqOCLj9pi0x6QeBwfFWNB98qCgd+OKBwTzrNBkt4M4H7/CKhRQN0o2AAMiBz01SL2OgA
         JggS6g7grF/FxS9rPQmJSJdGrkcVDLjHDHfgRkq3gUZGpR8l9ZQIsECyJBV9LVbSQyQs
         dljp8qX7VRXub5gq5qdPbxIxvuvHMDhuSsQZUy0ci+TpaaLJ+55tcy03sueidlVCczJi
         Iv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VxDw0/AhSqBc+UFZUyCqEn82uv1wGE11yVcaX4Q0n6o=;
        b=CAX1wWNm7axP9x3S7G86PgK4RS6KG1h+7jSbAX6kNLVSe6MFecDNLCxtdqExOyvb8I
         UAm5V9E5a0F35NASFgwbAZNvKQVmB1Sb+QGnqyYnrJ8l8cc4bDycywHSQv8baFFk2t7K
         rcgs//PcvWK8IBRILq0UEc58Oh0Z2MeQ8rgXFxi3GyvkMRB0t4SFOaAzeqIVf7wyXt8n
         hjlc0Kw8RBGnjBV3BHKFObfPgMrn0bokFwx33tG0uUtcBvIhG+kjAqbUqK88PuzNzCWa
         JJB1Im7t8QJJ+MqJ2utwOPXKgNylDsNbPIZMtwMFWSvLUOmHS0B49BTD1Wc3XrZ9Rom2
         eEBQ==
X-Gm-Message-State: APjAAAXtFAWg8hXYx04oTVct9uTcNOCjWTFig3GZNY3Jv7zo0YdKqXk5
        QWTy6zeYXLhNGKj1mzQrmfvlcqNolAzcf/zX+9McOg==
X-Google-Smtp-Source: APXvYqyvBs8WO4qGUlFCXZ9vDpUjAUxiMdKSUdDNg2hJRew4ETs8qJMLqcasMg/Komef7BsJUXiDvqfz3domfp3/OGQ=
X-Received: by 2002:a17:90a:a116:: with SMTP id s22mr116488183pjp.47.1564496413927;
 Tue, 30 Jul 2019 07:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000014c877058ee2c4a6@google.com> <Pine.LNX.4.44L0.1907301011100.1507-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1907301011100.1507-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 30 Jul 2019 16:20:02 +0200
Message-ID: <CAAeHK+wnhfMvoMbuv3Oco1eH35BL5tdR9-X5erEJmKLS1finAg@mail.gmail.com>
Subject: Re: KMSAN: kernel-usb-infoleak in pcan_usb_pro_send_req
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+513e4d0985298538bf9b@syzkaller.appspotmail.com>,
        Alexander Potapenko <glider@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 30, 2019 at 4:17 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, 30 Jul 2019, syzbot wrote:
>
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    41550654 [UPSTREAM] KVM: x86: degrade WARN to pr_warn_rate..
> > git tree:       kmsan
> > console output: https://syzkaller.appspot.com/x/log.txt?x=13e95183a00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=40511ad0c5945201
> > dashboard link: https://syzkaller.appspot.com/bug?extid=513e4d0985298538bf9b
> > compiler:       clang version 9.0.0 (/home/glider/llvm/clang
> > 80fee25776c2fb61e74c1ecb1a523375c2500b69)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17eafa1ba00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17b87983a00000
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+513e4d0985298538bf9b@syzkaller.appspotmail.com
> >
> > usb 1-1: config 0 has no interface number 0
> > usb 1-1: New USB device found, idVendor=0c72, idProduct=0014,
> > bcdDevice=8b.53
> > usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> > usb 1-1: config 0 descriptor??
> > peak_usb 1-1:0.146: PEAK-System PCAN-USB X6 v0 fw v0.0.0 (2 channels)
> > ==================================================================
> > BUG: KMSAN: kernel-usb-infoleak in usb_submit_urb+0x7ef/0x1f50
> > drivers/usb/core/urb.c:405
>
> What does "kernel-usb-infoleak" mean?

That means that the kernel put some uninitialized data into a request
that was sent to a USB device.

>
> Alan Stern
>
