Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE14A7457ED
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jul 2023 11:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbjGCJDz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jul 2023 05:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbjGCJDy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Jul 2023 05:03:54 -0400
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A34FE44
        for <linux-usb@vger.kernel.org>; Mon,  3 Jul 2023 02:03:53 -0700 (PDT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-55b82f399f9so2235948a12.1
        for <linux-usb@vger.kernel.org>; Mon, 03 Jul 2023 02:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688375033; x=1690967033;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pr2YYSau5+sS5zPL955ngAYOK38V5aHd/DpAKHsOdNA=;
        b=g1W9cBXbHQNp6juHUUhh1aH7+OrHNwQknZM2EoAZ6a8d9++mboCqAciegR4CQEsXjp
         uEls+wOAUi2sXb/vIfs0iVT+FXDuJaRkqK8WmevqVkfwh+s0gJnlmVLdzzr3siJ9TUCU
         4Jqo4ioaOCPURgbi9vs9KoYDGUXisZlMji8YduzSGyMLJuSUxYdlx+04Xl+l80JplZon
         +eiAG9lKduHx44MGhm7UVVkLEFsPyZYou40Ls1SPbKSMBaHzeX5zPLTqnDjgya5DGj7u
         Kkr4/yi0XyLcuXGMFdcBtZt04DakoFwrGYSfrku3xw6MPO3x/KQY4hRIEo9vOou9KRQI
         BjCg==
X-Gm-Message-State: ABy/qLZ1JLEN0G9WiONtKWkpg7fN9BvLtZsI6fOc74S3du/WldLNNr3Y
        UYHQpVAbSXjvFGA/9kgbVZObVLJHzHoCq/tPTgZp+VfS04a4
X-Google-Smtp-Source: APBJJlG1MAn5wCF85HcW3p0LKjtMhjAgq81fy5sFStaCmCTurHN3TyQP9ju9OKWgbNVu9u6AQwpQgJKvqJFuyk3baRRkdQB176UX
MIME-Version: 1.0
X-Received: by 2002:a63:4d07:0:b0:557:6227:bf47 with SMTP id
 a7-20020a634d07000000b005576227bf47mr5573066pgb.9.1688375032824; Mon, 03 Jul
 2023 02:03:52 -0700 (PDT)
Date:   Mon, 03 Jul 2023 02:03:52 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000144a6a05ff9172de@google.com>
Subject: [syzbot] Monthly usb report (Jul 2023)
From:   syzbot <syzbot+list718c99de842d1c123c28@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 4 new issues were detected and 0 were fixed.
In total, 71 issues are still open and 319 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  2469    Yes   KMSAN: uninit-value in dib3000mb_attach (2)
                   https://syzkaller.appspot.com/bug?extid=c88fc0ebe0d5935c70da
<2>  1978    Yes   KMSAN: uninit-value in mii_nway_restart
                   https://syzkaller.appspot.com/bug?extid=1f53a30781af65d2c955
<3>  1931    Yes   WARNING in firmware_fallback_sysfs
                   https://syzkaller.appspot.com/bug?extid=95f2e2439b97575ec3c0
<4>  963     Yes   WARNING in smsusb_term_device
                   https://syzkaller.appspot.com/bug?extid=40ac6e73326e79ee8ecb
<5>  844     Yes   INFO: task hung in usb_get_descriptor (2)
                   https://syzkaller.appspot.com/bug?extid=e8db9d9e65feff8fa471
<6>  415     Yes   INFO: task hung in hub_port_init (3)
                   https://syzkaller.appspot.com/bug?extid=b6f11035e572f08bc20f
<7>  316     Yes   INFO: task hung in r871xu_dev_remove
                   https://syzkaller.appspot.com/bug?extid=f39c1dad0b7db49ca4a8
<8>  314     Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<9>  238     Yes   INFO: task hung in netdev_run_todo (2)
                   https://syzkaller.appspot.com/bug?extid=9d77543f47951a63d5c1
<10> 200     No    INFO: task hung in hub_event (3)
                   https://syzkaller.appspot.com/bug?extid=a7edecbf389d11a369d4

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
