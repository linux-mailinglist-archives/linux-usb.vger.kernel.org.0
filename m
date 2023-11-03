Return-Path: <linux-usb+bounces-2522-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ADA7E0A7D
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 21:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3A5CB21480
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 20:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90032208CC;
	Fri,  3 Nov 2023 20:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9644A1D695
	for <linux-usb@vger.kernel.org>; Fri,  3 Nov 2023 20:48:26 +0000 (UTC)
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56E1D55
	for <linux-usb@vger.kernel.org>; Fri,  3 Nov 2023 13:48:24 -0700 (PDT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6d3251109ebso3092509a34.3
        for <linux-usb@vger.kernel.org>; Fri, 03 Nov 2023 13:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699044504; x=1699649304;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JYI7n3mLYM40cy95YfSnPmk+FiWhPpVvFYPVeIDOOxo=;
        b=CID2nZ1aFG4YShkR5/m+LpSPzqvyB7oL83OXgzJLMxeRhe91E8pyqEV13ovuIQnqip
         eECx8Y1syAyqKAJ89sM06y0MVVY37L0HpC5qOtculDFPhltW0/b5WMjb+pR1kLA20nqX
         pqj7DVfXzYXG/PQl233xzm8t1knc4QN5Vp7GzJ4qUL/Kz+15Aay2cyyHdjEdZ91f6JZD
         lV89wzRWiEf3TmrEi1D6xz+nE7+yV6vANsX08H0aKSMtQgpPJ8Y7CbXP+CmZJiiVr8DI
         dEuI4bCOk+rEHM3OoNXFYEpgvipCRKBAWXOtW/a4Exkmo5XGKZb3X01hqh5DAq4q5a60
         OuUQ==
X-Gm-Message-State: AOJu0YypbZoiVCvVqJe5NCpFmPdU7Vc1mKGcRUD8sDb6Ptc9Bjte5V9c
	GDPTUzW3A3ywSmayUrjcuRshsjS2BMrWFlZy9HpcL/0C3cqX
X-Google-Smtp-Source: AGHT+IGyIWMHQ/zphzXyDcZk+20Zoe4Op6VCSDwF0dOdH62NQphlgHA+dNlSlM98pmJm55H3wmWvGlyyDlkXcPcti/mf4ktGFXDF
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a9d:6c93:0:b0:6b8:6f61:5f61 with SMTP id
 c19-20020a9d6c93000000b006b86f615f61mr6098580otr.6.1699044504280; Fri, 03 Nov
 2023 13:48:24 -0700 (PDT)
Date: Fri, 03 Nov 2023 13:48:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000022a5d8060945a0fd@google.com>
Subject: [syzbot] Monthly usb report (Nov 2023)
From: syzbot <syzbot+listbdb465433a25244527e1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 2 new issues were detected and 3 were fixed.
In total, 65 issues are still open and 331 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  2721    Yes   KMSAN: uninit-value in dib3000mb_attach (2)
                   https://syzkaller.appspot.com/bug?extid=c88fc0ebe0d5935c70da
<2>  2144    Yes   KASAN: slab-use-after-free Read in pvr2_context_set_notify
                   https://syzkaller.appspot.com/bug?extid=621409285c4156a009b3
<3>  944     Yes   WARNING in implement
                   https://syzkaller.appspot.com/bug?extid=38e7237add3712479d65
<4>  819     Yes   general protection fault in ir_raw_event_store_with_filter
                   https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
<5>  368     Yes   INFO: task hung in r871xu_dev_remove
                   https://syzkaller.appspot.com/bug?extid=f39c1dad0b7db49ca4a8
<6>  364     Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<7>  304     Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<8>  239     Yes   INFO: task hung in netdev_run_todo (2)
                   https://syzkaller.appspot.com/bug?extid=9d77543f47951a63d5c1
<9>  222     No    INFO: task hung in hub_event (3)
                   https://syzkaller.appspot.com/bug?extid=a7edecbf389d11a369d4
<10> 138     Yes   INFO: rcu detected stall in hub_event
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

