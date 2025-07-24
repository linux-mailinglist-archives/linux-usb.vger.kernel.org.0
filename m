Return-Path: <linux-usb+bounces-26142-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 921BEB106AE
	for <lists+linux-usb@lfdr.de>; Thu, 24 Jul 2025 11:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A7141891680
	for <lists+linux-usb@lfdr.de>; Thu, 24 Jul 2025 09:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC7624677A;
	Thu, 24 Jul 2025 09:33:39 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE01F246760
	for <linux-usb@vger.kernel.org>; Thu, 24 Jul 2025 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349619; cv=none; b=U/G1L4kZUeHEWdTaOJf730xtzr8o35IPkOUkimBDR/roPrF3t+D+CWS0wPqoLQjeWvUvIywTlTWtd2LT+wCuK1yHQrUe7zGFpvxdRYlqFgsJHB/B7EY82ueKfKODEiOJmaMCDafiXA+q6KU6AlD0dOYYN3DJJH6sQ0ITMZyuqao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349619; c=relaxed/simple;
	bh=UKfesOOuPIA9GubBSTVMN9w7lPGvn3aLc4Yz9mOsMeQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=bexA7hetMPM4IAoftpDnrEBLnBaKwrGSzP1ymwwVGiDf+CvdFAwGS7eITUBXgRdh9W/T/2wqxT2L91nDAEugvb7ZtUgnfaj+iwqw/n07E4PKLtfEroOw3bvI/opGDSMeHfuyELzpe9F+5Q7jU9f9gIKOZJ3fgoUatcWCeXfOjTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-8760733a107so94020639f.3
        for <linux-usb@vger.kernel.org>; Thu, 24 Jul 2025 02:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349616; x=1753954416;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z4U4+eilWZLIR/OsjXgrfitjbR/KaezG5rbYq36k1P8=;
        b=LaMXw1m2Pgl3wq6dr7hAACajwv9Q65hivkCcZTTBK2ORFZtQN49SaapScvB3rjYKvF
         WFemRqk1qSQPvcsuq0lhykUAAOHEKiCtByr19TEVejyKikt7nr0lqbrfLdhSJxYCRXvm
         aK2Lki02GjEjte5nj5Dfrskr2wEbdMM5iog4jre/Q9HYfCf+3YYoHtqHCfzwyXs2TbRL
         hYNCDlW7X56au+yKLKYuF6g4eCwwSgXSeRkK2qKTcmWCmBqTxJAt64Q48/oP3KTla166
         xRxs0V8fvEDfABU5oVa8hEuEHzPUtgl+dgYNexxzkszRQllQBu8iC4FpKdDS3eB2xt2d
         Qr+g==
X-Forwarded-Encrypted: i=1; AJvYcCXSkXiGGLxXZglKcpaFo02JOOLxVjuy+m39APMPVvsPzBY28rCLXQzkxC83UQPPBPdeYXma75L9KrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPmQmZ7Wt8bcTSpxeOoYNQ/csLZOiuM4nLR8RhfFIFpttSHjlj
	RY3BsMP2xNyJpjU8iX6lk9OpwmEks/LrYFUU8zPgyyUXIdB2AYedrOt2nsgdMewvuWaSuiUUlpj
	XiZvSIFsom99agxQT+pegesoIg1ouJx9e5PMA87fqEtV6mNYqXED7tVKXIR4=
X-Google-Smtp-Source: AGHT+IFn/iELO/wJ42ZJ+FViGnhUhifqhQo4UMwm1d0U9rUADIxmjymDxiPzGoLaCrVWfZLDrrKmbNQYX3XUd/0POC/wdURIBMl8
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:a00f:b0:864:9cc7:b847 with SMTP id
 ca18e2360f4ac-87c6506b6e0mr1125814639f.14.1753349615772; Thu, 24 Jul 2025
 02:33:35 -0700 (PDT)
Date: Thu, 24 Jul 2025 02:33:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6881fdef.a00a0220.2f88df.001d.GAE@google.com>
Subject: [syzbot] Monthly usb report (Jul 2025)
From: syzbot <syzbot+list8a1228a332b7af6e1f80@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 6 new issues were detected and 4 were fixed.
In total, 87 issues are still open and 387 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  16230   Yes   KASAN: slab-use-after-free Read in hdm_disconnect
                   https://syzkaller.appspot.com/bug?extid=916742d5d24f6c254761
<2>  4773    Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<3>  2313    Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<4>  1822    Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<5>  1393    Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<6>  1304    Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<7>  1196    Yes   possible deadlock in input_inject_event
                   https://syzkaller.appspot.com/bug?extid=79c403850e6816dc39cf
<8>  859     Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<9>  804     Yes   KASAN: slab-out-of-bounds Read in mcp2221_raw_event
                   https://syzkaller.appspot.com/bug?extid=52c1a7d3e5b361ccd346
<10> 730     Yes   INFO: task hung in hub_port_init (3)
                   https://syzkaller.appspot.com/bug?extid=b6f11035e572f08bc20f

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

