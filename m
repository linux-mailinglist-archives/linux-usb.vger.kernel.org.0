Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5C74237C1
	for <lists+linux-usb@lfdr.de>; Wed,  6 Oct 2021 08:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233356AbhJFGD0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Oct 2021 02:03:26 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:48910 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbhJFGDX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Oct 2021 02:03:23 -0400
Received: by mail-io1-f69.google.com with SMTP id m19-20020a6bea13000000b005d751644a6eso1261746ioc.15
        for <linux-usb@vger.kernel.org>; Tue, 05 Oct 2021 23:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=O/5CjV2AH7vg5AIq9xdJFYcJdW6Ii/C83GcdKIJ0m6c=;
        b=I8p87X2gBTO/w1bRFGOMavVkq/ag7ChKkMmlS+EMS+yjxHBKhQyaUPeIgJjfV7FrCQ
         fINpWoYOqs8zD8V2BbPIW/N7hbuZpBLXAxTzzLcbCEYhYQiTOh7ZU5CoEStz//yxO0dd
         LHNAm8p524goHXC1/50TgVdDBQ85Z/q2Ve5cPcc9ZZFnzR+iz6N35nomLrF1nJhsXq8a
         t+fF7VcFCcb2VqsgX4yFVeD8CzjT3XBdUGuBmgrFmQzh7NIRJyDosr7FkQomChYC5I3w
         1tXT3BQduDFejm7Z6bPcxeVpqwL6u3qajBEEzT5FIa86eNK0PEaoFDPzIjaxyk7MLJNN
         RJKA==
X-Gm-Message-State: AOAM532V4ttpUuiciKZgHdeYB+KbHr/TcZivFITRxe7dFAqNMxh764pw
        YJ4W+MZCAWxd2HVg4+AH/ZZzts5P0/Hd7ZeDjPrxVZ6cXTkq
X-Google-Smtp-Source: ABdhPJyivA7cBFp1gEQ6dDt69J2B7mIIV1FU/oL0iUwQ92Hj6dxyo/yVzF57By4QQkmgJHxvcONvTxmALW398N5Cd9MdpNvDgWqB
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:15c6:: with SMTP id q6mr5953491ilu.221.1633500091389;
 Tue, 05 Oct 2021 23:01:31 -0700 (PDT)
Date:   Tue, 05 Oct 2021 23:01:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b01f1505cda8e03c@google.com>
Subject: [syzbot] usb-testing build error (2)
From:   syzbot <syzbot+7af597ce2b38596c16ea@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, hminas@synopsys.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    dea971290a03 usb: core: config: Change sizeof(struct ...) ..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=150e8a3f300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cd8a1eadba1e4ce4
dashboard link: https://syzkaller.appspot.com/bug?extid=7af597ce2b38596c16ea
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.1

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7af597ce2b38596c16ea@syzkaller.appspotmail.com

drivers/usb/dwc2/params.c:252:8: error: 'struct dwc2_hsotg' has no member named 'dw_otg_caps'
drivers/usb/dwc2/params.c:253:8: error: 'struct dwc2_hsotg' has no member named 'dw_otg_caps'
drivers/usb/dwc2/params.c:259:8: error: 'struct dwc2_hsotg' has no member named 'dw_otg_caps'
drivers/usb/dwc2/params.c:260:8: error: 'struct dwc2_hsotg' has no member named 'dw_otg_caps'
drivers/usb/dwc2/params.c:264:8: error: 'struct dwc2_hsotg' has no member named 'dw_otg_caps'
drivers/usb/dwc2/params.c:265:8: error: 'struct dwc2_hsotg' has no member named 'dw_otg_caps'
drivers/usb/dwc2/params.c:270:7: error: 'struct dwc2_hsotg' has no member named 'dw_otg_caps'
drivers/usb/dwc2/params.c:479:53: error: 'struct dwc2_hsotg' has no member named 'dw_otg_caps'
drivers/usb/dwc2/params.c:500:9: error: 'struct dwc2_hsotg' has no member named 'dw_otg_caps'
drivers/usb/dwc2/params.c:509:8: error: 'struct dwc2_hsotg' has no member named 'dw_otg_caps'
drivers/usb/dwc2/params.c:510:8: error: 'struct dwc2_hsotg' has no member named 'dw_otg_caps'

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
