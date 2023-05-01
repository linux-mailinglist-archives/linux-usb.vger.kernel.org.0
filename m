Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97C366F2FC3
	for <lists+linux-usb@lfdr.de>; Mon,  1 May 2023 11:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbjEAJGV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 May 2023 05:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232496AbjEAJGD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 May 2023 05:06:03 -0400
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A039410C
        for <linux-usb@vger.kernel.org>; Mon,  1 May 2023 02:05:52 -0700 (PDT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-32cb1ba941fso13442255ab.3
        for <linux-usb@vger.kernel.org>; Mon, 01 May 2023 02:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682931951; x=1685523951;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KhoeRD70on/oigp93ouNpP+4MhwmnlaB7dvFyQVtaVA=;
        b=K/H+Gy8p6qfqZyH9K6uJduoYKSs/gJas8VROMYVmARFJWTq4IDgyeX+X9KlQSWCOeC
         6gHgFKBYXj20SEM8OADaDBxjL2LLd0ZQ6PbKfla9043SNb/zzoatrtZOZCM9zSMsdoHy
         Wq8EbmRSKx2PmDUYNr/wT1Aue5Fj+2K1apgyySvBYZHXltg4Howi9T/iz93ubb1Wjtbc
         sL7PGJDdk3a2ZLt2IcVSYgl/cTiiPFdNVDf8ydfHdg8AGQFLSm2Ee2qHM/nthSdUws52
         /k94ewFWYglbavIf0gzfyeAy+5WUXtrsOO8Xdd2CQro4UZht3MPLLwmthA5jSQv8UFvh
         iRaA==
X-Gm-Message-State: AC+VfDxd2A6SOWqFd5BBom0/AHNztMIrflLOMizzeC3qV4cBduvN+YPK
        3JUX/M8LjLaI77EMW7hKpekoV+V+bHT5twTDrpsOrXMmoZcp
X-Google-Smtp-Source: ACHHUZ6lkXYSSop/rfC6wIAmaqxSYHh1CutB+tEupm397xSb9q97wbZSIr7Uh6hoJ97gwb8udkZylLr2Kk2zhIJrgqN3GjO8p+mM
MIME-Version: 1.0
X-Received: by 2002:a92:ccc8:0:b0:32b:13ad:3e3f with SMTP id
 u8-20020a92ccc8000000b0032b13ad3e3fmr6690335ilq.3.1682931951513; Mon, 01 May
 2023 02:05:51 -0700 (PDT)
Date:   Mon, 01 May 2023 02:05:51 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000026b5f505fa9e21f1@google.com>
Subject: [syzbot] Monthly usb report (Apr 2023)
From:   syzbot <syzbot+list7915d07c2502675e2a16@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 2 new issues were detected and 4 were fixed.
In total, 63 issues are still open and 313 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  2277    Yes   KMSAN: uninit-value in dib3000mb_attach (2)
                   https://syzkaller.appspot.com/bug?extid=c88fc0ebe0d5935c70da
<2>  1758    Yes   WARNING in firmware_fallback_sysfs
                   https://syzkaller.appspot.com/bug?extid=95f2e2439b97575ec3c0
<3>  1526    Yes   KMSAN: uninit-value in mii_nway_restart
                   https://syzkaller.appspot.com/bug?extid=1f53a30781af65d2c955
<4>  801     Yes   WARNING in ar5523_submit_rx_cmd/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=6101b0c732dea13ea55b
<5>  645     No    INFO: task hung in usb_get_descriptor (2)
                   https://syzkaller.appspot.com/bug?extid=e8db9d9e65feff8fa471
<6>  472     Yes   INFO: task hung in usb_register_dev
                   https://syzkaller.appspot.com/bug?extid=e761775e8f4a28711f19
<7>  397     Yes   WARNING in smsusb_term_device
                   https://syzkaller.appspot.com/bug?extid=40ac6e73326e79ee8ecb
<8>  279     Yes   INFO: task hung in r871xu_dev_remove
                   https://syzkaller.appspot.com/bug?extid=f39c1dad0b7db49ca4a8
<9>  258     No    INFO: task hung in usb_deregister_dev
                   https://syzkaller.appspot.com/bug?extid=4189d5cde8630463053f
<10> 252     Yes   INFO: task hung in usbdev_open (2)
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
