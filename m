Return-Path: <linux-usb+bounces-1065-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C207B78B5
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 09:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id EC836281595
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 07:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EB079F2;
	Wed,  4 Oct 2023 07:28:48 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168C663C3
	for <linux-usb@vger.kernel.org>; Wed,  4 Oct 2023 07:28:46 +0000 (UTC)
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3313DAB
	for <linux-usb@vger.kernel.org>; Wed,  4 Oct 2023 00:28:43 -0700 (PDT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3af7219c67fso2614911b6e.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Oct 2023 00:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696404522; x=1697009322;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BgKrvAHPPnFbgL/jHnrLa+rBLBl2K8FRSAuVolVvCxs=;
        b=vpCMuppMXCJkuPWGiWjTtcbByDAoOf1T/KwdyhRfr2csiMzU9I7W17QouMVhhfYasR
         xAEF3rYPigFYKQc4IDsMG3n8HUnzQYkAIyf4yn+zg2SxNvd0MnPm0h/+QNQLnZJtDCdq
         ykOsxFM/8ZH7O/Q+fdxYE9AJVh5UbGS3jkfssxsK2+jo8aBaGgo8lhBOoAAVA06JnRd5
         tzVKzmQ5NbnjVKOO5H2y+GVy8kTXu0y+s+6w5k1HKqSm0cQcqC8+5Sm5JDD4tfw7RRZH
         KZBsJH9dlFf14ENTiLD88pRty9gBqvLXdgY9Dox7g7y33N2bnx2D/qqnvt+vW+Z/4Dr4
         v4CA==
X-Gm-Message-State: AOJu0YxaRjVXtAinjsU6hHnCMuh/SHs7ye+2RJiGtuDbX61JNdGbONW8
	ginCTfjzB50tqG3jRdwqTGVLz8pnHtyXk24cl6pWeO6U2Nr2
X-Google-Smtp-Source: AGHT+IEKnqwUXjDT8KGKajjXUfZjvk7G8CMKOZZO7VzMAYCqELb908xqmZ4AvW9TdfulGPOKu8qSHC7o440QZlbPCnodhzgzRm/G
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:30a7:b0:3af:6c87:144c with SMTP id
 bl39-20020a05680830a700b003af6c87144cmr921058oib.2.1696404522572; Wed, 04 Oct
 2023 00:28:42 -0700 (PDT)
Date: Wed, 04 Oct 2023 00:28:42 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f6a4630606def4cd@google.com>
Subject: [syzbot] Monthly usb report (Oct 2023)
From: syzbot <syzbot+listfa0313a2fe512dcdce74@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 3 new issues were detected and 0 were fixed.
In total, 67 issues are still open and 325 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  2705    Yes   KMSAN: uninit-value in dib3000mb_attach (2)
                   https://syzkaller.appspot.com/bug?extid=c88fc0ebe0d5935c70da
<2>  2437    Yes   KMSAN: uninit-value in mii_nway_restart
                   https://syzkaller.appspot.com/bug?extid=1f53a30781af65d2c955
<3>  2367    Yes   WARNING in firmware_fallback_sysfs
                   https://syzkaller.appspot.com/bug?extid=95f2e2439b97575ec3c0
<4>  816     Yes   general protection fault in ir_raw_event_store_with_filter
                   https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
<5>  519     Yes   INFO: task hung in hub_port_init (3)
                   https://syzkaller.appspot.com/bug?extid=b6f11035e572f08bc20f
<6>  468     Yes   KMSAN: uninit-value in smsc95xx_eeprom_confirm_not_busy
                   https://syzkaller.appspot.com/bug?extid=2c97a98a5ba9ea9c23bd
<7>  363     Yes   INFO: task hung in r871xu_dev_remove
                   https://syzkaller.appspot.com/bug?extid=f39c1dad0b7db49ca4a8
<8>  361     Yes   KMSAN: uninit-value in smsc95xx_reset
                   https://syzkaller.appspot.com/bug?extid=c74c24b43c9ae534f0e0
<9>  350     Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<10> 304     Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

