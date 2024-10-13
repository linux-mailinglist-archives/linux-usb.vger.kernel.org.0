Return-Path: <linux-usb+bounces-16158-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F6199BADC
	for <lists+linux-usb@lfdr.de>; Sun, 13 Oct 2024 20:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C68471C209F5
	for <lists+linux-usb@lfdr.de>; Sun, 13 Oct 2024 18:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C2B1494DC;
	Sun, 13 Oct 2024 18:38:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F96D143871
	for <linux-usb@vger.kernel.org>; Sun, 13 Oct 2024 18:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728844686; cv=none; b=S99aM46vi0Zeop2zF9hPB3V2bYqWf36byAr0dtdE7B3LaxY7j2iZaRjHUAmMJvXJSEcB3IrmFAs3qWQM6s1fUR4PKMdMtuHJw5ocIkmPTbcgtMd3FMZthDVeGsMc+gK/hscKxzwmzM+d+5+Wm9pwkrbCfneaD/LhkgCgrt7NvRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728844686; c=relaxed/simple;
	bh=T8Bs+Bag2nEMUGUiVHg5Gm9qqfkwmSc1T7fZDcTY5b8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sUIlr6T5v5r53+Qrbkig5OfTp784hwR8UtDDzelnxjrnKq3jMjNeWwIs6PXM2zFVh6DDRhpjx+GH7z/xk5BhX8hKUGFapIPCC03s49M59Y9sIQK6c6670Z2FosEqIttb/xiy21yCVXzNqoHdcrIwmDfff4oJKUYEWuWsxaMt2HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a3c90919a2so9236035ab.0
        for <linux-usb@vger.kernel.org>; Sun, 13 Oct 2024 11:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728844683; x=1729449483;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VrbusO5Daiqr1INnkr6Gs/RfMr+LxK+TDXJ/iIrimnU=;
        b=pF1hMHoYR7JjV1SNT8oud5R43CPvXaGu17sCLOB6aDahOC1yCCfSlL0yYcYZDDBUUB
         9C2G/G+TWeO4gG7wV3V9ANUccngRbZ0pydisEX7GyEoMZ5+L4PBnjXDPvZv9jfsyb71X
         i+k2er/+0si3B+AKg3/KVhN/JNYOesXDUz0rzimTFsYjFp7J9BVfW2hgPOS7KcUF2zL/
         fkf9cgD0qu8L48x7I05uHoNSVJ5k+Z3POawa/v/plMV6ui4mPXgRywOeccXX5Vx7+1AE
         zLQ6SXXkNMUCYnEbv66AiUfLKhS5D6SKZlqHd+k0GxqQVlRk/owe3f2P6nMC5uIJh1aS
         PM/g==
X-Forwarded-Encrypted: i=1; AJvYcCWSHC/Xc7MHCDclI1OTA9B1zvSOHTeQ0n/saysfsJ7BtprTAzwF608RVSSwlT/pBBe9cVzuL22utf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDfosDpralt9RQuIZn92IEuX52PsGMI4H3B84lj0JUXPyEW/ci
	eRkoPR0U5ihpnpx+sGOG+fiM1GcpOcO7a5Onfd33qYdBFsQDvH/iOFlPd5l80qweChjnakacvpt
	AL4e7LPxYhqGF82ZQrGbAJFr8od5r8MZRLWTFckk8lMlf3QURkRIURsQ=
X-Google-Smtp-Source: AGHT+IGuv5ERMM9UiN2NSUstxnHlUzZClLL7/j5ZVwNyFsuZVuwRaviZFlWLE8PBc31MAH5Vnt657grivTmuZhWLettXC28tHpcF
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:138d:b0:39b:3894:9298 with SMTP id
 e9e14a558f8ab-3a3b5c73f8bmr66589675ab.0.1728844683220; Sun, 13 Oct 2024
 11:38:03 -0700 (PDT)
Date: Sun, 13 Oct 2024 11:38:03 -0700
In-Reply-To: <2329dfa9-ef76-491a-a4aa-277230a0a96a@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <670c138b.050a0220.4cbc0.0038.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_port_suspend
From: syzbot <syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, sylv@sylv.io, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com
Tested-by: syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com

Tested on:

commit:         d73dc7b1 USB: chaoskey: Fix possible deadlock chaoskey..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=1150ffd0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4510af5d637450fb
dashboard link: https://syzkaller.appspot.com/bug?extid=f342ea16c9d06d80b585
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15df7fd0580000

Note: testing is done by a robot and is best-effort only.

