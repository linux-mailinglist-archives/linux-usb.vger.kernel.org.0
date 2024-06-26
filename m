Return-Path: <linux-usb+bounces-11709-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 513CC918E7F
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 20:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 079F81F26546
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 18:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDDB191482;
	Wed, 26 Jun 2024 18:29:09 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A8519066F
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 18:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719426549; cv=none; b=uxj/GyRThFiX82Eq4nrOu2pXfQNRyLjopN3e1sIyPF0OgMgdrpoIX9Ft7nBs4ihuPazB/ySoE0StFu7D0JD/K41K02s35zr0xxLDkr1ALgtDEIuXgFswOjiyNqwANaDpyWpi/VGoubQbh6wj4rWZKwy/PW2oeu+zNaR46bllQC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719426549; c=relaxed/simple;
	bh=4/7baJuhh/lT7Cd2eMzZakIwFC/4OqwUDvhcrIGu7/A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=B2cb8ySrBQhvi1o5nvAgWgZkmE1LMIX/y+qmVZuMpGdrivLjAavz7a9uYYD3ecIha/JIKauj069EatIcKuc7fkKjUiJNe9UOTKpp2r6Q4YC6cVmQONHCKMInpJPr+8VtzZ9ibOwKx/bpY7ruooRF/UUdXk6bKLy4fwWLeef8Ta0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7f3cb65d1bbso67987539f.1
        for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 11:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719426546; x=1720031346;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dwpjXibG3egVpLU/Cz4ZzBYRJ9ct/ttM3sVTBx+12MI=;
        b=if5eTYI0Brm2teZCaroNUIktBLDdNeb6BRax0YQxvpgOQDDx2q5Cf6FF1uhkBbfOp5
         9163XLuIuUPDH/dHAjUnFHQP4+upG03742AaYrnxvLErNuEUm6rK/tJF7XXAglqUosFb
         IfGtGGfecYja5YNOswp8b4b+QAmwhrWRz0dRgk0PQmhBjJqC7/LVRf8JN/W6rb9nR72W
         dIVtTcPUm5jcCMWWgXUnTRfneNy3/HyBSxVKDw2UYlPDpCodMVzRnTkGB/V0VFJbBjLB
         d2fhDxqnGrE6FK17mkFbv+TRySfgrCIQG4mlhEC5e8+vjCcjlO9BJyh/nPNjCZt5owg9
         FEpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXToABzl6BY1U6n7KpcrW4khETRSLJb17B/erYSH7btvs99lQF7p66esT8fm8UoY76044BV4CPB4PGItXb3ORbHi8TU+tjhHudX
X-Gm-Message-State: AOJu0YzTlwcImthcX3APMfWFvrbvgqBGwH96xGd4FMK0SmXOV32CStf1
	QOb7eOL8oQ6wQ95l/gtvzsdyhLF1ZkDPYCaEJmbDY7uaQcM5x9o/yag+JgXcvvw7H6dtuhAUpS8
	WfiCrA9/1GWUkiRKr5tCiS3qIZr6i2sqYrXl/2DRuJtOAKAMfPcO2GAw=
X-Google-Smtp-Source: AGHT+IFBXRm+dBGPSfZSWjNzhRkHktbN8nPeJbAzSA80x+ytjT+oDOAM5vlPE9zKuN/nMl/oYxFLwa990b7qwYmKL4y2QBFbf+L8
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6410:b0:7f1:3a4b:27ea with SMTP id
 ca18e2360f4ac-7f3d75a761amr2557839f.2.1719426545598; Wed, 26 Jun 2024
 11:29:05 -0700 (PDT)
Date: Wed, 26 Jun 2024 11:29:05 -0700
In-Reply-To: <6d1f6bcc-2918-48cd-bbb3-e8cca46622a1@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000077d198061bcf30f1@google.com>
Subject: Re: [syzbot] [usb?] [bluetooth?] WARNING in btusb_submit_intr_urb/usb_submit_urb
From: syzbot <syzbot+8693a0bb9c10b554272a@syzkaller.appspotmail.com>
To: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, luiz.dentz@gmail.com, marcel@holtmann.org, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+8693a0bb9c10b554272a@syzkaller.appspotmail.com

Tested on:

commit:         66cc544f Merge tag 'dmaengine-fix-6.10' of git://git.k..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15a59299980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3f7b9f99610e0e87
dashboard link: https://syzkaller.appspot.com/bug?extid=8693a0bb9c10b554272a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=169b3789980000

Note: testing is done by a robot and is best-effort only.

