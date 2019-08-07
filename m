Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9157F852E6
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 20:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389313AbfHGSXB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 14:23:01 -0400
Received: from mail-ot1-f71.google.com ([209.85.210.71]:35935 "EHLO
        mail-ot1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389232AbfHGSXA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Aug 2019 14:23:00 -0400
Received: by mail-ot1-f71.google.com with SMTP id f11so56468875otq.3
        for <linux-usb@vger.kernel.org>; Wed, 07 Aug 2019 11:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=BKZrN8UHWqfJl9RbVEGYooh5RMS//IjsbU72N8zChOk=;
        b=fQa3I5y3etinofJeujeJ34lr2JVBCJXYZGu4xq/M3/dxlhGVDrZRenkiBklyN6AauB
         8tkF9/uQGCDU9FAnaBYerUghU9uBVimHXHsH5wcXqusKWSiszeG4fw+jt9qb+cZ9Z+bm
         xc7LlkRIZpKULLKzwzBx9lbJvye/zdgK+EVORC9yUScF1jcz7aDIX2Ix7CwvyBglfOPm
         w0NYNgfnibkWIfLet7set/FpK4cP1Nf4+hjECAq8IJZivqBjZmzrIXT1r6vexI/IozbY
         zQdyqBedEmv1pl6dglPG0ROkEeiPAo3N/XeuaRWw7hwXyRBurZwKj3iqztyvtjnBd1iU
         OkjQ==
X-Gm-Message-State: APjAAAUkWPn1YhZbFlFkuP49A22ceKtv1WFF3V4AQ3ryc2uyXqPrfLqk
        jbu6QSFS8AWxG6Ahb38ir/uYC859lEWdPV00qu1rZg6av6td
X-Google-Smtp-Source: APXvYqzlO/1fjO7fAy/i44rUl8mH1jIN27N+7wScaoD71Pg9Q4qvka+DRr471Gcojl3BUxTa+jpNIACS3U3IJuzDdu5WJcZppu/t
MIME-Version: 1.0
X-Received: by 2002:a02:9004:: with SMTP id w4mr11668135jaf.111.1565202180169;
 Wed, 07 Aug 2019 11:23:00 -0700 (PDT)
Date:   Wed, 07 Aug 2019 11:23:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1908071402160.1514-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f365b6058f8b07ca@google.com>
Subject: Re: KASAN: use-after-free Read in device_release_driver_internal
From:   syzbot <syzbot+1b2449b7b5dc240d107a@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, oneukum@suse.com,
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
syzbot+1b2449b7b5dc240d107a@syzkaller.appspotmail.com

Tested on:

commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=132eec8c600000

Note: testing is done by a robot and is best-effort only.
