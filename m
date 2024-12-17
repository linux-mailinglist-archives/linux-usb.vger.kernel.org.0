Return-Path: <linux-usb+bounces-18579-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 029509F47F4
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 10:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80AF6188F858
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA601E0DD8;
	Tue, 17 Dec 2024 09:47:27 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7381DED7B
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 09:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734428847; cv=none; b=n2W3F9BRNMHKzN6PSNnw/H1TjYMjSY9R99QwvYbKaAJZeEUT7NoBZWu8SxFW7SK6mDiMeaxHDXigqYks67MuRGQnNYLfSfpSXkOLga6gN4YcPdP9cSpBq7zaW/pEu5AOMSpaAeFwJ4UuHZvVa5Y42HNwuyplpAaPsvPJwo1XXFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734428847; c=relaxed/simple;
	bh=yMOynOmGlEzrJ3tGyPHlnpYCP7nvDB8xmB4PMbtHQuA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=MsPG/0An5Ac8JCd5eKERe471fgXmjWtiEj1XhtfEDFb429Tbp+gb9y+cMsUvbOMPeXLdSn2CnNIzu5YGcFAAUYJ6zA+2eWJinylc9lXZo4lcaRpByOZeZD/HrE1OYdljrr9//9Nxsaq16CzQYKQgaS3CzegVty3ebuYz8YRsu40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a7cf41b54eso87028395ab.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 01:47:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734428845; x=1735033645;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8NniguLOEVteCvNXzlckkOEnDVjSHE/QG1QlwVmzpkY=;
        b=G7CBC2UxBQwLYs9fH5HLbsbvFRU3Y+C26QNo4xKu9bokQ8dyRYuGwexEHWor2PJMZW
         dqS7Cq4+xR31WEHWS3yyGMMLgJeaivYGeMyx5QADkJuEprZItlICZZCf/EYQWSrMa2WF
         VXTQxAKPsLIxaP6f1Sb7h2UqeE1KlIr7DvX/prXVna7LdC4N3xFsKT31yJOzZNBJhz56
         O10IAFAVXSfCzTiuLRznsGVcInfg9Ke4tZOL7Qew79I5mL+u+4hHvVQIPqWBDQXHwxV/
         vGhHyi9UN93gJjI549DPAxvsQgAQAJvljp1F2NCy9clyYmCtgL9pAa8xrICgeWGX93Qe
         KlOA==
X-Forwarded-Encrypted: i=1; AJvYcCUU8sasWEas3eFeNV4RqMfDarY9/79PIUDkH/16MzHeFcjxvpBtlz5wZqt9upV9YFVtTLFpqje6yGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbbP9gGOft8Jk2+aC3ChLRD9eamDa848Nce5bFQaq+mBlgksdL
	vRt76pf+fwkQkcd0dpS1wHtobz0iZy18SjfyqA5dxjH95JBeBj9hsP5oaOcBZ0DvAJlmF5eeL7t
	D3VadOQbn1n3o0th09q72bDkxPLAXJzjUeU7S2FB/QQJNR+oZ7XmUKfE=
X-Google-Smtp-Source: AGHT+IHRUZZUUqogXDRMcw0lst1lGtqW8tk+9yGLp7n2tyZIJ5sVoYt60q22anoZZvA/7cPx9k999AzS0onnztWYdejzMML00GXT
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cdaa:0:b0:3a7:9670:7abb with SMTP id
 e9e14a558f8ab-3bad59f4686mr29187555ab.15.1734428845183; Tue, 17 Dec 2024
 01:47:25 -0800 (PST)
Date: Tue, 17 Dec 2024 01:47:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <676148ad.050a0220.37aaf.0157.GAE@google.com>
Subject: [syzbot] Monthly usb report (Dec 2024)
From: syzbot <syzbot+listed4c6d2dd7d8184007da@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 1 new issues were detected and 1 were fixed.
In total, 96 issues are still open and 365 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  25194   Yes   WARNING in uvc_status_unregister
                   https://syzkaller.appspot.com/bug?extid=9446d5e0d25571e6a212
<2>  10156   Yes   KASAN: slab-use-after-free Read in hdm_disconnect
                   https://syzkaller.appspot.com/bug?extid=916742d5d24f6c254761
<3>  4839    Yes   KMSAN: uninit-value in dib3000mb_attach (2)
                   https://syzkaller.appspot.com/bug?extid=c88fc0ebe0d5935c70da
<4>  1754    Yes   INFO: task hung in jbd2_journal_commit_transaction (5)
                   https://syzkaller.appspot.com/bug?extid=3071bdd0a9953bc0d177
<5>  1573    Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<6>  1352    Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<7>  1209    Yes   INFO: rcu detected stall in hub_event
                   https://syzkaller.appspot.com/bug?extid=ec5f884c4a135aa0dbb9
<8>  1011    Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<9>  879     Yes   general protection fault in ir_raw_event_store_with_filter
                   https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
<10> 862     Yes   INFO: task hung in usb_get_descriptor (2)
                   https://syzkaller.appspot.com/bug?extid=e8db9d9e65feff8fa471

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

