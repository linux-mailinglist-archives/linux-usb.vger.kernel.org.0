Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E46EE76CB9C
	for <lists+linux-usb@lfdr.de>; Wed,  2 Aug 2023 13:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbjHBLTB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Aug 2023 07:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232920AbjHBLTA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Aug 2023 07:19:00 -0400
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F2A2130
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 04:18:59 -0700 (PDT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3a71ea1f049so1076599b6e.1
        for <linux-usb@vger.kernel.org>; Wed, 02 Aug 2023 04:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690975138; x=1691579938;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RWvXpxCuJYpjEFo/W4sG+AcmV8aTSmJ5ToLMiyxysts=;
        b=JnFV2Nx899uNeGgBt/aKDVwyKYK61rv3Ed2Xuw1vBxLM6dG2++KcCa5voN2yZheq9J
         2FhxvltQPO3z7hbK0PXfo1NxOrCIavVw9k94SNUTSTuG0ZPuekN9YJxC4LR8dSVyx/N4
         nuYYjr730UkPZaGh3EaQYdkAfSueVZyhgDAe8Qu7ioSHFLr5mYPBolUrpHo9sHH6MoPH
         kfbIc5A91M1+a65rwCY1nLLQqSIua9R5G5z/+w2srd8fDYp5967LGDIQtCuokcBTk2DG
         yFHGCAFwlEeAzr1gKTudoie7tDm3XRFleiBflxzKpfPyVmmdzPq+JZAAvfLMftfh/1qp
         15Mg==
X-Gm-Message-State: ABy/qLYe0YZZMQLiGPiGLIYCw/3oBxzJgMyirLOQVfU0l3TidovYpj5v
        405znzcSHJMVp48YZYm7K0wvea/euidT6bwqdErCuCjpNUIH
X-Google-Smtp-Source: APBJJlFKRFyHPxPxPL0fIDfAh0MQOBXDXYHiOQoOgsYkNHrzRIU3fEVEh4ewUG1IAqV4g19Bng8BMMHXERb3gK6buSXLI6Lv+XLH
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1819:b0:3a0:9db4:a575 with SMTP id
 bh25-20020a056808181900b003a09db4a575mr30719794oib.1.1690975138674; Wed, 02
 Aug 2023 04:18:58 -0700 (PDT)
Date:   Wed, 02 Aug 2023 04:18:58 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000076ffa30601eed47b@google.com>
Subject: [syzbot] Monthly usb report (Aug 2023)
From:   syzbot <syzbot+list7326d21fc77552823fb4@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
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

During the period, 4 new issues were detected and 3 were fixed.
In total, 73 issues are still open and 322 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  2254    Yes   KMSAN: uninit-value in mii_nway_restart
                   https://syzkaller.appspot.com/bug?extid=1f53a30781af65d2c955
<2>  2098    Yes   WARNING in firmware_fallback_sysfs
                   https://syzkaller.appspot.com/bug?extid=95f2e2439b97575ec3c0
<3>  1059    Yes   KMSAN: uninit-value in alauda_check_media
                   https://syzkaller.appspot.com/bug?extid=e7d46eb426883fb97efd
<4>  983     Yes   WARNING in smsusb_term_device
                   https://syzkaller.appspot.com/bug?extid=40ac6e73326e79ee8ecb
<5>  851     Yes   INFO: task hung in usb_get_descriptor (2)
                   https://syzkaller.appspot.com/bug?extid=e8db9d9e65feff8fa471
<6>  485     Yes   INFO: task hung in hub_port_init (3)
                   https://syzkaller.appspot.com/bug?extid=b6f11035e572f08bc20f
<7>  355     Yes   KASAN: slab-use-after-free Read in pvr2_context_set_notify
                   https://syzkaller.appspot.com/bug?extid=621409285c4156a009b3
<8>  340     Yes   INFO: task hung in r871xu_dev_remove
                   https://syzkaller.appspot.com/bug?extid=f39c1dad0b7db49ca4a8
<9>  325     Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<10> 238     Yes   INFO: task hung in netdev_run_todo (2)
                   https://syzkaller.appspot.com/bug?extid=9d77543f47951a63d5c1

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
