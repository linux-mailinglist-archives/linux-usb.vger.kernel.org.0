Return-Path: <linux-usb+bounces-4805-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2F782545B
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jan 2024 14:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CDD8283831
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jan 2024 13:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D2E2D7A7;
	Fri,  5 Jan 2024 13:17:27 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DE92D602
	for <linux-usb@vger.kernel.org>; Fri,  5 Jan 2024 13:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-360671f08a3so9419885ab.1
        for <linux-usb@vger.kernel.org>; Fri, 05 Jan 2024 05:17:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704460644; x=1705065444;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xcaKQn4ZrzJMyg8IlqVO++Y6AG8+CZXSU/axxuPlUpI=;
        b=p279igMYxMMUsK4FGvc1q3BuLVz601q1Rd+tifUqnvbl3ynsv05x6Psyjrefzn1vO8
         TgjF41kbqi/MASlp0g6B1a2G2EBtBk+CKJp+pqa0hq/uUV9+jxkA5iENnkgq0ESl1o/E
         z+iQ/l8kfvetNribQI3eY4bz6F20INwn5YGNey78sebgaESDcYNJ3XdrmZ019SX9GUUK
         XgThU5mWkbbuF6s0ZGG+Ns1q4d7mjbVlr9Tg60RjyVN9AOizvxKSEWva1l4FpwNwqHgZ
         2/vE/mPW8wHdHDmqQbanjmSvSaKkfF61jBMrNRpuWWfm0kLdpxl3ueDw9LhC9RsIAOCR
         c0jQ==
X-Gm-Message-State: AOJu0YzTTSbxxB7R+m/TGYZVoB4ePokPENnaW/oNdjgoWmDzc9TonPLN
	/w+9vpuVrLWpplz4mYL5G0zPIPfFkjwai3cvARV+50pgnex4
X-Google-Smtp-Source: AGHT+IE5L/US2FP5ty+hAS6bRkslPj1vqmG/tWftM+xH0aPLpDc6MkbpLYSBz6gkLY8LBd7UERrdMjrJk75WbhTm5VPJTJnH3G3y
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aad:b0:360:6649:29da with SMTP id
 l13-20020a056e021aad00b00360664929damr332479ilv.3.1704460644715; Fri, 05 Jan
 2024 05:17:24 -0800 (PST)
Date: Fri, 05 Jan 2024 05:17:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000043127b060e32ab2a@google.com>
Subject: [syzbot] Monthly usb report (Jan 2024)
From: syzbot <syzbot+listd2a1ebc22715cc638b5a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 0 new issues were detected and 0 were fixed.
In total, 62 issues are still open and 331 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  2979    Yes   WARNING in firmware_fallback_sysfs
                   https://syzkaller.appspot.com/bug?extid=95f2e2439b97575ec3c0
<2>  2797    Yes   KMSAN: uninit-value in dib3000mb_attach (2)
                   https://syzkaller.appspot.com/bug?extid=c88fc0ebe0d5935c70da
<3>  832     Yes   general protection fault in ir_raw_event_store_with_filter
                   https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
<4>  548     Yes   INFO: task hung in hub_port_init (3)
                   https://syzkaller.appspot.com/bug?extid=b6f11035e572f08bc20f
<5>  429     Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<6>  385     Yes   INFO: task hung in r871xu_dev_remove
                   https://syzkaller.appspot.com/bug?extid=f39c1dad0b7db49ca4a8
<7>  304     Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<8>  240     No    INFO: task hung in hub_event (3)
                   https://syzkaller.appspot.com/bug?extid=a7edecbf389d11a369d4
<9>  239     Yes   INFO: task hung in netdev_run_todo (2)
                   https://syzkaller.appspot.com/bug?extid=9d77543f47951a63d5c1
<10> 216     Yes   INFO: rcu detected stall in hub_event
                   https://syzkaller.appspot.com/bug?extid=ec5f884c4a135aa0dbb9

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

