Return-Path: <linux-usb+bounces-11045-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 148F490146B
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jun 2024 06:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88FE8B21363
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jun 2024 04:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB00DF6C;
	Sun,  9 Jun 2024 04:41:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F27256D
	for <linux-usb@vger.kernel.org>; Sun,  9 Jun 2024 04:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717908066; cv=none; b=LXpP2AOuWlGq/N2hVKVdD2zjLnycdOGYB4SAzDXYkTifyV9uPv1v/4X7nMj3d6pFSXaBHIfCTSBTajHwwMomAilxIiuuOImVi8kphSQ31LM0XQs9FCS7MsV9IZwpaTk8EVv2EVLgPVfG1JT2tvdEu0dskSl20qQzf6Ip2lt1qiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717908066; c=relaxed/simple;
	bh=oMo5GobQXzGdap9s+jyI+tRHo0yyTgD5Mqiv8yRX4LI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MKf/A0sRztnRQBO3fN9qn+SyzI9UY++LjtEPiHe//FoUn0rArzXQ1SgA4SpYwRG39Swya2i5czx50/XuIhBPqb0Et3qsjpwAoiWm8BjwMrF/j1Uet22d7sjsx/AckvPzk3/VjuvSyDJI1iS4c4kwNpzB+qcQ0iB0xjrrxmufyZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7eb21854dcdso274378939f.0
        for <linux-usb@vger.kernel.org>; Sat, 08 Jun 2024 21:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717908064; x=1718512864;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=udHkC7tr/aEH2dvdw6F58Ka3OHsdXxA0DzrpTvQWMH8=;
        b=nE7UF7sO1+P+NQ1TF2nyYkfaKUkvmAjrX+ABB/WSTMXbYWW8FuuP4uShJjM39ajQAZ
         N5CymLkNHCmfEH6ZUWk7MnTzRM+UPyObT0rUgVFSAMh32ZvmUob83/Jc9uEBpT/hVjMZ
         E2uhqhALcXQnGZ9xL0pAVuGE8py5VdYB3a/UPD8dj0Aeiin0PgPYkFJ99DYILhBZqS6u
         IAqs0IaP2YLXujySsW2Eq2HT+7S40TB3TMgehKY9N7f38iylKhRgPZIg/fBPXFCjKB6m
         MTrBZ9u3dgLZPrRtnxRHj/0FgojsltqGn1Oo7yl+f38xV0cCvvYyF59vkFUlMJKabPay
         E0XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzs4yFKQ6NHsDylh+70nfyMgkBTaWf5tjQnzQKVsMJOxgn05jpPCiydlHM30rOb0EtfFT0X+tUdY8kWjm4Buw+SstzIcKoI49K
X-Gm-Message-State: AOJu0YyBBPlgokRismhY+mvnsCjVjRnRP4Ye73H++f2dP6vNt4xuNMLs
	PXZZjaixLVK2Yzvn06DUBOOMRwfvC7Dj1j4zd+4PiTmqQr8CYXWwEesyXGbmNTAjav5RKG1Pt/8
	rHD28Jp993O8oGxx+/D6UqAq6fVYlc/L1V9dRu7bFLFOlsFUv11h9vGU=
X-Google-Smtp-Source: AGHT+IGyT5s9AiaNS7J51UeSS7beO4rjaGEKCRuoUfxLu/b/X13e6VfFcMxBwr93nQLkqFoU/yClQLCvfq1VxBeHspq4dYiaTFkI
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:8524:b0:4b0:d2b1:1add with SMTP id
 8926c6da1cb9f-4b7afec77e1mr280382173.3.1717908064573; Sat, 08 Jun 2024
 21:41:04 -0700 (PDT)
Date: Sat, 08 Jun 2024 21:41:04 -0700
In-Reply-To: <8177975b-7eff-45db-9b4b-4a6d321ac7ab@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f225de061a6da393@google.com>
Subject: Re: [syzbot] [usb?] INFO: rcu detected stall in raw_ioctl
From: syzbot <syzbot+5f996b83575ef4058638@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+5f996b83575ef4058638@syzkaller.appspotmail.com

Tested on:

commit:         8867bbd4 mm: arm64: Fix the out-of-bounds issue in con..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=11f0680a980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3b4350cf56c61c80
dashboard link: https://syzkaller.appspot.com/bug?extid=5f996b83575ef4058638
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=118743fc980000

Note: testing is done by a robot and is best-effort only.

