Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D711791381
	for <lists+linux-usb@lfdr.de>; Mon,  4 Sep 2023 10:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352023AbjIDIdZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Sep 2023 04:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351688AbjIDIdX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Sep 2023 04:33:23 -0400
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F0C180
        for <linux-usb@vger.kernel.org>; Mon,  4 Sep 2023 01:33:18 -0700 (PDT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-56f75ec7ca9so1579322a12.3
        for <linux-usb@vger.kernel.org>; Mon, 04 Sep 2023 01:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693816398; x=1694421198;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8QNC8apqVr27sTnpnQCWFYWqdFdd3NZrHTcQGqhiYI=;
        b=Htf8iN/VlvMYn5dSrU9OBx0ih7ilJwS0ubYeplrSsLwS1TieOGmXWChQE3dOSSKGS2
         pra8Lic70iRiTC6zEUHKwZngs05MdpPRgjrS+jQ4Diheh9F9Y5JYskpjFrGm8zQsDuAW
         eiCiVksWPov/NIQFBdWSyJbIiomxklfEB95stD9qKFsB3dTJb+wFrO3Z+f1USPZOu/KD
         nA1XAQpT4u5NnEDKXTqQd4YFxVlTY3FIu+KfjRnfZjWVhP7p8P67sN+RjTLPj7bItD/1
         fjCX2gkHYK4Eq/v0+9n9CjTxjLjZCx07yFiMZaT0MCIfxqx4udO6OIv45bBzwy3IuO6e
         HOgg==
X-Gm-Message-State: AOJu0Yx7a5LzKubcaWAOUxmJ12CcJ2DiodWnAVI5PeANiiTZhacyGS0l
        RZCTUIHnRJdJ5mPMFfiPvwCJz0eaUtTqWHutNEOT3DuZJNEw
X-Google-Smtp-Source: AGHT+IHaJm56W/oIEqIyP71HjBHOyDE1wV7TihNY81Hf6ob/1sR0jLMffbJ84afN0OybLjexyrdUUe6G7XnnIu8wCQgileFq+DoG
MIME-Version: 1.0
X-Received: by 2002:a17:90a:8f03:b0:271:df39:2332 with SMTP id
 g3-20020a17090a8f0300b00271df392332mr2221137pjo.9.1693816398336; Mon, 04 Sep
 2023 01:33:18 -0700 (PDT)
Date:   Mon, 04 Sep 2023 01:33:18 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000bcd7ce0604845c2c@google.com>
Subject: [syzbot] Monthly usb report (Sep 2023)
From:   syzbot <syzbot+listd3a4aa4b7f78fcbb5735@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 5 new issues were detected and 2 were fixed.
In total, 70 issues are still open and 324 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  2665    Yes   KMSAN: uninit-value in dib3000mb_attach (2)
                   https://syzkaller.appspot.com/bug?extid=c88fc0ebe0d5935c70da
<2>  2371    Yes   KMSAN: uninit-value in mii_nway_restart
                   https://syzkaller.appspot.com/bug?extid=1f53a30781af65d2c955
<3>  2242    Yes   WARNING in firmware_fallback_sysfs
                   https://syzkaller.appspot.com/bug?extid=95f2e2439b97575ec3c0
<4>  938     Yes   WARNING in implement
                   https://syzkaller.appspot.com/bug?extid=38e7237add3712479d65
<5>  860     Yes   INFO: task hung in usb_get_descriptor (2)
                   https://syzkaller.appspot.com/bug?extid=e8db9d9e65feff8fa471
<6>  514     Yes   INFO: task hung in hub_port_init (3)
                   https://syzkaller.appspot.com/bug?extid=b6f11035e572f08bc20f
<7>  513     Yes   general protection fault in ir_raw_event_store_with_filter
                   https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
<8>  378     Yes   KMSAN: uninit-value in smsc95xx_eeprom_confirm_not_busy
                   https://syzkaller.appspot.com/bug?extid=2c97a98a5ba9ea9c23bd
<9>  360     Yes   INFO: task hung in r871xu_dev_remove
                   https://syzkaller.appspot.com/bug?extid=f39c1dad0b7db49ca4a8
<10> 337     Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
