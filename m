Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 940BDB8399
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2019 23:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393071AbfISVoB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Sep 2019 17:44:01 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:49843 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393063AbfISVoB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Sep 2019 17:44:01 -0400
Received: by mail-io1-f72.google.com with SMTP id j23so7207072iog.16
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2019 14:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=yEs1UwveOrP6VjU/fAh6wyu6LjB9vVuyXL6rSiyP6zU=;
        b=h+tLQzQr96x1J3FfkSyt3FIJieq1l3Uue5w039l7IwggPt6UBK4DhBj+HI1356jF7V
         ZB5CrD9cjuLPc2TIEwIsfNCnRqW8wECx1ZHlE2HE4AEn8HjXka9YErlth7xEwX3i8AF8
         okzoq9wkjtMo1XSUfNk2rh2/JqWtf0OLYi+lRN8fvTfzvs0ekm5AsGfWBEIxFa2/pbYw
         tzcRI3Q0oj56xVXhfRXtzv16sBqqUSjsYoPD1A1zhOkYocMK0ovMFr1w6VSYHc6UM1+F
         azYIvAbs1ms9yjqTAkNkNi1uU+bbBX10kxCTQ6rP1ij1BpLKd7dnYV5BXLrvKJxocP4P
         tutA==
X-Gm-Message-State: APjAAAV07N3dY1JYM7gacMqGke++yKTMQ6CT+QyM6yeQsvMLXFACq1aT
        0IpbZ9pE4s6mdL1oaES8u1xDFvDAT6HBSD6MRb+SKgb/4uGG
X-Google-Smtp-Source: APXvYqw2hQR/pwi5ryAv1HCXJiPZ/O5hVSBudpO5gICFlcpzbBz0L/f2WlJxvYj/ovoUgk6kpcJ2496qwtfpyUxDTFo4PT8xFsS0
MIME-Version: 1.0
X-Received: by 2002:a6b:c409:: with SMTP id y9mr13734939ioa.155.1568929440387;
 Thu, 19 Sep 2019 14:44:00 -0700 (PDT)
Date:   Thu, 19 Sep 2019 14:44:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1909191639240.6904-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f8d8a10592eed95f@google.com>
Subject: Re: KASAN: invalid-free in disconnect_rio (2)
From:   syzbot <syzbot+745b0dff8028f9488eba@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        miquel@df.uba.ar, rio500-users@lists.sourceforge.net,
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
syzbot+745b0dff8028f9488eba@syzkaller.appspotmail.com

Tested on:

commit:         e0bd8d79 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=8847e5384a16f66a
dashboard link: https://syzkaller.appspot.com/bug?extid=745b0dff8028f9488eba
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15b3efc3600000

Note: testing is done by a robot and is best-effort only.
