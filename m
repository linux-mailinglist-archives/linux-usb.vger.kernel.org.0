Return-Path: <linux-usb+bounces-17736-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7057E9D365A
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2024 10:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E41D8B269BA
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2024 09:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEC31991BE;
	Wed, 20 Nov 2024 09:05:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A3C2557A
	for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2024 09:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732093506; cv=none; b=V4xkd6ekAzRqWGKr7o6Whfn1JQBHIRn9Ju6ii+T0lnHtoCbH9zcROl43TWqNiTNpYxCkWi7DQ/FJ7fS1dEey6SVuOMKHmNN09DTUOowKyCwWLa5gmG2G4wfoM+UbYcFv2lOnSxJqsYgwiAEGwTbP1pCd5g/3SI4i99+eGfNlhKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732093506; c=relaxed/simple;
	bh=LTsfuqobwOuYJTWSmPS2Is+RGXAY3qeHoSjZoR9SpVc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=h7LNAbyUEBzOuWnh/M0+ATWDgJE+4BLD79UIRatyJBciarJrNlcjznRrqfvQPAHk+zhuQV25tAJ5ZHyMQKhIRD4MlGfv3N4e/+v355sOVIgafmE7kTgwTqXTVkpfiqEatX890sjrHRbxz2D1zR8CTaewroyHEAki3bs7oEmAqwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a76ee0008cso26648455ab.0
        for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2024 01:05:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732093503; x=1732698303;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uvk3oMrAGU4iCjocAkLYzWcFnA6WrART8sfIGJYHVaI=;
        b=DyRZpVP2yE3pVz0HuSjtBCJkzh4fUV0SMkxLxnzfQZFxIWtnZbEzDNvbdKbVhcUp25
         M6VfmL31IcEjqf85emiagEmGhEv3tdTKc2Pu8GdQuPxuSOlFhyhAKtKhMZQ+h5B7v1kb
         x3/LSRULh/WBcFrEb3Jd2shzTaNVi1zP6wBp0LUKSsYXGPuIM29wohbR8b60JkJ7WE7Q
         SEHlWvQsNxP7dkX+wV3sBucznfrm2X0Q7hDSBOP4RjBrD8e7FdYap0U/yREyVDBhJ/GX
         /Z7uWH82wdUKAcILN0l3+KduVzTxlkQxulSMrPiAMmLKvULPF8Vk4XfWmuB9HBNw4PCO
         Hibg==
X-Forwarded-Encrypted: i=1; AJvYcCXI9wTE6K0UMFg1+0DNe5v7SQtfAoj7P14Nyp4F1FmPp9PgWWIIVo5iVEexxf25KWm6EDcovf0QmbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSrtcfJOEXHRDvMiCeV37bP2EtvVkFuvCKJ5CJGYowjk9zvXnm
	IyXVQBJRJESHGCutIooyQ8DF5vYJW4wC4T28QRXj0IEAZWvuZZUMX9t1wTrXLRL5npii1snoMGQ
	ihR8TydmwA5addDtXJC+2VbBIqH5wAr1Sc2b4lq+veOqk9PzJt67a548=
X-Google-Smtp-Source: AGHT+IEiej89K/rL0pcqhadvsesMvYT0TZ6b2o8M1aBONEBQbpwXedWa6E+KeekSxx1bGhATHKktxe8x4hG6k51KxydDnMIi3fjI
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cd86:0:b0:3a3:4175:79da with SMTP id
 e9e14a558f8ab-3a7865019fcmr18847425ab.13.1732093503157; Wed, 20 Nov 2024
 01:05:03 -0800 (PST)
Date: Wed, 20 Nov 2024 01:05:03 -0800
In-Reply-To: <CAHiZj8hBjro1gqmVt7L8La2vBBNTa0VUY1kdb1i1kNJ-x_Dazg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <673da63f.050a0220.363a1b.0008.GAE@google.com>
Subject: Re: [syzbot] [scsi?] [usb?] KASAN: slab-use-after-free Read in sg_release
From: syzbot <syzbot+7efb5850a17ba6ce098b@syzkaller.appspotmail.com>
To: dgilbert@interlog.com, james.bottomley@hansenpartnership.com, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-usb@vger.kernel.org, martin.petersen@oracle.com, 
	surajsonawane0215@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+7efb5850a17ba6ce098b@syzkaller.appspotmail.com
Tested-by: syzbot+7efb5850a17ba6ce098b@syzkaller.appspotmail.com

Tested on:

commit:         bf9aa14f Merge tag 'timers-core-2024-11-18' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11373bf7980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=48190c1cdf985419
dashboard link: https://syzkaller.appspot.com/bug?extid=7efb5850a17ba6ce098b
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=106b3bf7980000

Note: testing is done by a robot and is best-effort only.

