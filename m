Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21EC688373
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 21:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbfHITqB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 15:46:01 -0400
Received: from mail-ot1-f71.google.com ([209.85.210.71]:56952 "EHLO
        mail-ot1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfHITqB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Aug 2019 15:46:01 -0400
Received: by mail-ot1-f71.google.com with SMTP id q22so70826204otl.23
        for <linux-usb@vger.kernel.org>; Fri, 09 Aug 2019 12:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=QaIRxMgZLoHZ+y2N+TmUy7bCggB90Z3nYkENvxZIHn8=;
        b=Bnvg6MZsqmGTLrow3wvKuOqbYOJ5X+UeD92FsiwVHwmYCQJVy2GzS5//v90AhPzidT
         akCjPzqR+8q73l+DZKUD2F6TpFpQBTE34Kc9zAnhwvUxhACnGyNjReYZ5u0NPB3sDqKE
         bBCresZdspZ//gJmnv9NMTk3XPs0W6VxzlhoX5aDIBg8zrPyKbp/CmNPtDgxuE+fhJVm
         TvTmtRVfWKv9sFY31+6eqQWUjmutV2lw1KVJLJPfpiWyW0PYq6q6tji4CicSQue74KVA
         NR4kAIP1YXSEnniVz1aw3GoL2q7RW59t1/P6uuvW5+F9VXA5i/5Jc+I7x0y3Rn8wcg+f
         BKVQ==
X-Gm-Message-State: APjAAAX/26CpSAGTkV3Nbb7BIP+ywNDjgvwFM6GZE2ApJXJD0b4y/QKr
        wsH4kHn+jMPkhRcMWtGnxkhV2H3SkGb9vg0DKmkDWKgHv/Qs
X-Google-Smtp-Source: APXvYqyDp70SxxbdCfTkLBNTtqKAlmRBVV/PIX9YPmml1idmPRr9G9uVWwRcJmVMjSyEyQvuSlFbDAZU3eIBOCSXgDKa2yenBlmz
MIME-Version: 1.0
X-Received: by 2002:a5e:9314:: with SMTP id k20mr23444780iom.235.1565379960645;
 Fri, 09 Aug 2019 12:46:00 -0700 (PDT)
Date:   Fri, 09 Aug 2019 12:46:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1908091524250.1630-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007e2e84058fb46c49@google.com>
Subject: Re: KASAN: use-after-free Read in usb_kill_urb
From:   syzbot <syzbot+22ae4e3b9fcc8a5c153a@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, linux-kernel@vger.kernel.org,
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
syzbot+22ae4e3b9fcc8a5c153a@syzkaller.appspotmail.com

Tested on:

commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=173f2d2c600000

Note: testing is done by a robot and is best-effort only.
