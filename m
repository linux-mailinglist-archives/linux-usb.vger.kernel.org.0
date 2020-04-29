Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1E951BE88C
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 22:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726914AbgD2UaI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 16:30:08 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:35456 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgD2UaF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 16:30:05 -0400
Received: by mail-io1-f71.google.com with SMTP id s26so3823633ioj.2
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2020 13:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=P36ux4kpJA4yJ0M9w1keQlA8L7/Ku3ikNPWzORzqPpQ=;
        b=O9vEC+2ew6cF8SX55X7XVlSvEgAcSpuvgkwBxyrRXSlBv/U3UwAnPFaKNg38ZiOryE
         l+ZVU/1LtOYrDPxopaTdgzNB7GdIl/iu/FzKPKCJgo5UY8pm2OnRFvqn7xhhuEPbpHga
         f5mY0xYalq5BJnFhvIOv5chD7+FKOyY2FIjFv7hY3EOD3xZ00nROYgbXbV4OgawohEja
         zCbEGsi6Jh9r3iOIsFx4fhy/s29oXuJhIenoI+YOXJmSWOw2wDqBgQIvEmjSRv784WQi
         dLfMvZjonLu6f5AMPP8FCImpf+HSei/HdBCtgnMGsDeBXvyYyrYIn9nd8LVTHrvtyJaq
         5DAA==
X-Gm-Message-State: AGi0Pua5TJTEI4t2xdH0Hcyn2U9hbyTx+3kFuiwlwixJCFXORj4a9rFK
        UA57vMDz7cBxTKOn6N7lq/nPI2IvREdx8NULiRVVPCCeh+SQ
X-Google-Smtp-Source: APiQypJtO21lrjpHALiSJyG1R7XX5MYRsAvJuVRMEvqi38U8bebrgP09swd00jLT9r90N3751dAGaeiGZhTX2GTT/KujJwiW1QaN
MIME-Version: 1.0
X-Received: by 2002:a02:6a4e:: with SMTP id m14mr32417870jaf.17.1588192203152;
 Wed, 29 Apr 2020 13:30:03 -0700 (PDT)
Date:   Wed, 29 Apr 2020 13:30:03 -0700
In-Reply-To: <Pine.LNX.4.44L0.2004291608270.24784-100000@netrider.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001aa0e705a473d05c@google.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb (3)
From:   syzbot <syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        ingrassia@epigenesys.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger crash:

Reported-and-tested-by: syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com

Tested on:

commit:         0fa84af8 Merge tag 'usb-serial-5.7-rc1' of https://git.ker..
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=6b9c154b0c23aecf
dashboard link: https://syzkaller.appspot.com/bug?extid=db339689b2101f6f6071
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14a84ac4100000

Note: testing is done by a robot and is best-effort only.
