Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8747FF1607
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2019 13:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731558AbfKFM0D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Nov 2019 07:26:03 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:48840 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731539AbfKFM0D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Nov 2019 07:26:03 -0500
Received: by mail-il1-f198.google.com with SMTP id j68so21515744ili.15
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2019 04:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=TuDU4N7KBIuKg05wOeBVNp8aWXiMZEYdUf0Wu4Ikdgg=;
        b=Xb7ZGde4JsXfMxeiM0lK7XI8m3tb/A3C6NS6XG5jTGZrqEG6M+f896hcNne9+8pRTs
         4wSl8LtJQ9E3v+WUQLjhndqc4lt1Lu/D+H44kphyzbZK/HUh5KeCLdZ1kKpfKDiSUbjF
         9nHb0p8uOKLsdRHKlyZokFKVzGsrCSDDEz4FQNp0FW8iJAbKMMzBIvzGkJvDFWW7ZF/s
         CHbF0t5uIr/YJUcBDct5AucYSjUGrZ+gZ6eR3e5s2QQo7CXxwKXYY5kEqJqCIYyz1Y3z
         5E3xsF93B26XebPz4J9r01o2s2TFASHKzGbi7LweJvcbF04R1ZhJ9X3d8JCShxgm3ljN
         XB/w==
X-Gm-Message-State: APjAAAXsseFdd15fHa+X4AtAiaTU9k5u+TMK7YXa9+wZNVuv/tlZslZu
        T1d5B7DGtcr+sb00dYIaNt6dVT5ZswDnoW206opdEpoGeFkP
X-Google-Smtp-Source: APXvYqyqNmFWaPRN4zNU+bC77MAPWIqH8BFH6dmLMx4fBBLupHK5Ar+vM701NhR+mDHy+ptQJbA58+bJgVH9AFZmD9yfP0LTsyLP
MIME-Version: 1.0
X-Received: by 2002:a5d:8156:: with SMTP id f22mr31826636ioo.234.1573043160641;
 Wed, 06 Nov 2019 04:26:00 -0800 (PST)
Date:   Wed, 06 Nov 2019 04:26:00 -0800
In-Reply-To: <1573040577.3090.22.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ce75df0596aca681@google.com>
Subject: Re: KASAN: use-after-free Read in appledisplay_bl_get_brightness
From:   syzbot <syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com>
To:     2pi@mok.nu, alex.theissen@me.com, andreyknvl@google.com,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        oneukum@suse.com, syzkaller-bugs@googlegroups.com,
        tranmanphong@gmail.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com

Tested on:

commit:         e0bd8d79 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=8847e5384a16f66a
dashboard link: https://syzkaller.appspot.com/bug?extid=495dab1f175edc9c2f13
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14d463b2e00000

Note: testing is done by a robot and is best-effort only.
