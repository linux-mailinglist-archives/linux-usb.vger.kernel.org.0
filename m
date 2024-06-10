Return-Path: <linux-usb+bounces-11069-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DED9020F6
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 13:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 373701C2332A
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 11:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC37F81740;
	Mon, 10 Jun 2024 11:56:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC297F483
	for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2024 11:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718020588; cv=none; b=WhuWoUdEl5a80stsAHW2bgiIJpW+txb5hWz4Ne1NIIpUn8mvZ6DBKuESQvVYPzTau0yieTCQRfj7KpyndSR4wCjz1o66GHb+PWjDTqHsaUoowBKvESNWER8bfgravnIfbutCDljjJ/XEUyWrElzFrzc4z9jkKUwq6Gez3LZn6bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718020588; c=relaxed/simple;
	bh=K52nylIbtVGwpoFEvp+klLGscHlbN8NzK5pbrvNYjiQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=hDUPoLnthrJSjJAkGtIvr/rYe4SMl/MIoGi5CawSS/+SrHHLUV4qNHNr+zcO20njmYpwRTJPsDEKPGbQCSxLe2OEXgCxKpEmiJOnlcZHvoNefvk76AFm1/9O5GhyUmPAoxRKnjVrXnpIGXEAtXZ5cWhN5P6PDTwnsdcNxGLG8Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7e91ad684e4so535256339f.2
        for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2024 04:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718020586; x=1718625386;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xA4ca/H7Pmgrnbw/NchvsBd76PXlaIQBXBo41MMl9Ww=;
        b=mZtqZUU2XgQBcVhu5kI7x1tihoSTHIHi6n93TJkDbWBDOX+8k/SqcbkA47ty/dXml/
         /cHr7xs+sSksv2j3/y/pK4uUTNowiDOEGiy7O61ZuUlTaqd8SAUKiFV5r3JBDUJoOtx4
         8V5xwTH3Qg5oSZKb3FtBNwy4Nz85d+IG7hlczwh0BvZSgEo3rakjmcA0pOZnvno4aFVx
         pARCE77NHE0eRUq96fEf21mqUYZzafgtKtX0MPXyBPOfMNBnFC6GQ7Gy6aFAlKncXaMN
         IJ6eXmgZlxFEafRgDoxdOpPRoyUfB7yzvEB1RqYvJMceD2orhI5+1r9B1DZ7nZGeQg3Z
         CnJg==
X-Forwarded-Encrypted: i=1; AJvYcCU20GsUum5L1paMIODJcLVud1JH4HXDigUxFqv9yD9GgHC8UXQAFJfD5mP0QKgfOpHT2MOWhnKcodb2VZDGMnW8bX0TFSNrWxq9
X-Gm-Message-State: AOJu0YxGFycvHtVrZkKy7v9BGweD/1E9Izb5WBNIfTYBxdAbM7giAIR5
	3kYTorMYXUGd1BNrZTUF2ouAUUfy6cv2jtIUOTeu15jLFoMwSlcOKvIC+ZLBQyvxGEVD0GDC1KZ
	DbKwJ6AdI7HmFAo/ayU2IQxwhTOWEmMRcVVCRp83OzTs/2SiH2d5b2ds=
X-Google-Smtp-Source: AGHT+IGPa80KdKvehD4oNyzcwIRHfqGRmK9BKMuArSUhjJxQ0xIFiu1fkY07+hDKwslQz+7kc0jlHFUmpwgOIyO9kHTQ72HMMpUl
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1642:b0:4b4:cf36:c09f with SMTP id
 8926c6da1cb9f-4b7b167393cmr401481173.5.1718020586232; Mon, 10 Jun 2024
 04:56:26 -0700 (PDT)
Date: Mon, 10 Jun 2024 04:56:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c26f45061a87d6e1@google.com>
Subject: [syzbot] Monthly usb report (Jun 2024)
From: syzbot <syzbot+listb516818c4565cc7c4df6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 7 new issues were detected and 2 were fixed.
In total, 76 issues are still open and 338 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  3414    Yes   KMSAN: uninit-value in dib3000mb_attach (2)
                   https://syzkaller.appspot.com/bug?extid=c88fc0ebe0d5935c70da
<2>  883     Yes   WARNING in ar5523_submit_rx_cmd/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=6101b0c732dea13ea55b
<3>  870     Yes   general protection fault in ir_raw_event_store_with_filter
                   https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
<4>  651     Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<5>  646     Yes   INFO: task hung in hub_port_init (3)
                   https://syzkaller.appspot.com/bug?extid=b6f11035e572f08bc20f
<6>  406     Yes   INFO: task hung in r871xu_dev_remove
                   https://syzkaller.appspot.com/bug?extid=f39c1dad0b7db49ca4a8
<7>  363     Yes   INFO: rcu detected stall in hub_event
                   https://syzkaller.appspot.com/bug?extid=ec5f884c4a135aa0dbb9
<8>  304     Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<9>  302     Yes   INFO: rcu detected stall in syscall_exit_to_user_mode (2)
                   https://syzkaller.appspot.com/bug?extid=a68ef3b1f46bc3aced5c
<10> 277     No    INFO: task hung in hub_event (3)
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

