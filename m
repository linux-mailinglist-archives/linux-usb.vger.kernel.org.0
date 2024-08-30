Return-Path: <linux-usb+bounces-14403-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F04B96661D
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 17:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 622AD1C23646
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 15:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534F81B790D;
	Fri, 30 Aug 2024 15:53:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36A71B4C49
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 15:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725033185; cv=none; b=vGL4ylewDTBII6GYG0OEOlhf6o6tWNejnmu6kbixaJf+bNDv3aZBidyEG6ifdJkJlRx2rmWzpgHwPzqyQRftxTpASWxRjqm9D6NLQikB/rLt7/OcvneM8rLo1+1/1kqTtnwqrZkHISf12DiQ470HCDbi0RIbyO76bMTPf3aG91A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725033185; c=relaxed/simple;
	bh=RueS7JnGk0i21951pS8Z1lfcC7Kbynif6BpXcfUivBw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=asty2uGNOqG3eWVjZ2eaB37RiqrT0zlypj0k1c/TDH0N6IeBpf9WHdlONaL4OpIvuZTdsQAT/RB9yoxkI/EZJe4uimmup/L6HXFHtLzCTM95v2rMXlYVZoxmcKIG5smri7QsRwhwbDM9BuGWCFpCLJhOdC1ewh1ZxS8QPzzNvFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-39d2c44422eso19008385ab.2
        for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 08:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725033182; x=1725637982;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rJXna8UgM/TDpAaQDndMkHe5nsCGxVc7RnSON73+sAg=;
        b=W71htu1istjiZng8XSRjD/Rd0ioUp+8rEdr4H88Sitsg+MwOPnGMh7N6eFL2jmL/o5
         G48dAMt85cgA8jltlDw3F8OVJ2KcuOrXiYJxYNIc//nT/ZHMpe8g3FOW8s12/9WnT4vz
         JzNwzSk5vCyMRXd1+jcfoiFT6wN0Y/LUdZtd3RBKL/oPzDv5uzZSgXzHOANlFr6U+NUI
         PpWCPWrrrTkMAueFs1Ee6rSHd6TsrDueHPjUkM9dSGvEOV/UTiXQY4qqC6kPb/+eRwDm
         hwsz1dwzMV7Vnb0HmLpP+CorIPMt0KJtiewQE8XDL+TEVRuRdYo2LagzVG3aw8Ji1GBa
         /Uqg==
X-Forwarded-Encrypted: i=1; AJvYcCU2yA26dFH+Qjuh4ASK4GQ2xSDl7DLKgEY9K2MdHwTk2RLsP/gL4rPshaezsdStU3RwKGkvo30A73I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEpYP5AKssX/2c2yEUkj3MfoV9v/AHdwgjC2TbEr2AW65foENP
	RdDBhvd4khnz64NyR6N1WIVk5o2cnFu6+Py3TMTXiJQqRu4S+RFGpOa7U+3T+vY1Zn7SbTnP/vF
	8/c/dpW33pDiN6T6W6Irxu7LqjoiBYCtw4UdmSxjcfqjk31W27l9MAaM=
X-Google-Smtp-Source: AGHT+IGPpVlc3Cxm6Tux+LHq6e+MRTFLxLn/5DXrJAeoqCb32DWphMPOMPxIk8n+X7k27SklSmmZR3EaWfZ2PeBC8hU238on18Dk
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1986:b0:398:b1d3:7c9d with SMTP id
 e9e14a558f8ab-39f4108d9c3mr786575ab.3.1725033181727; Fri, 30 Aug 2024
 08:53:01 -0700 (PDT)
Date: Fri, 30 Aug 2024 08:53:01 -0700
In-Reply-To: <00000000000040b643061ca951fe@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000005da6a0620e8961e@google.com>
Subject: Re: [syzbot] [usb?] possible deadlock in assign_fw
From: syzbot <syzbot+e70e4c6f6eee43357ba7@syzkaller.appspotmail.com>
To: akinobu.mita@gmail.com, akpm@linux-foundation.org, alinde@google.com, 
	dakr@redhat.com, glider@google.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, mcgrof@kernel.org, 
	rafael@kernel.org, russ.weight@linux.dev, syzkaller-bugs@googlegroups.com, 
	torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 4d0e9df5e43dba52d38b251e3b909df8fa1110be
Author: Albert van der Linde <alinde@google.com>
Date:   Fri Oct 16 03:13:50 2020 +0000

    lib, uaccess: add failure injection to usercopy functions

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=132abd2b980000
start commit:   d5d547aa7b51 Merge tag 'random-6.11-rc6-for-linus' of git:..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10aabd2b980000
console output: https://syzkaller.appspot.com/x/log.txt?x=172abd2b980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d76559f775f44ba6
dashboard link: https://syzkaller.appspot.com/bug?extid=e70e4c6f6eee43357ba7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14ee2b7b980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=177c7b7b980000

Reported-by: syzbot+e70e4c6f6eee43357ba7@syzkaller.appspotmail.com
Fixes: 4d0e9df5e43d ("lib, uaccess: add failure injection to usercopy functions")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

