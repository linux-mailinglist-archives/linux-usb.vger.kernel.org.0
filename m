Return-Path: <linux-usb+bounces-11716-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 465619199CC
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 23:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFC531F2257B
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 21:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF51419309A;
	Wed, 26 Jun 2024 21:34:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542EC16CD02
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 21:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719437646; cv=none; b=lau9JbFL0vV6UQTpm8pd7MhModDklEHzxw7250xjfO0sYsTExlSIFF5c3OK9U/1H9pCeGUx4mrmRUWZpnJcRRgnxyS5KFbeVYnoOkvsKtsSz1RyAedUF6rlH7wFws4QJVYXNXpGcaVXhsgnXb1DFgZBaxdNVTAPWgRnq320BeoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719437646; c=relaxed/simple;
	bh=lxyUyI7Ml7rGG22Ce9B1f+w1Bv/1wiDQpwFGxLAqsg0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kADQHYOjkOaVfGPc+wRo9crAr6N700rBaiwRFu1exF+Wh8tFALOlmFjb6wBXKFHfnlb9LVyF2pQbkPorx1YJMCAagRM72u06dCT4v+Ol44dpRDYetQlJ7L6tTfFtPF5X39kOevi1H+Jq0cLfDFbcN0+moYw490TfJ4kXfcWjA6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-375e45a4110so96755055ab.1
        for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 14:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719437644; x=1720042444;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/wMDiKgLoFg9RcAgb7EI/542G1u2cd8KM50iNDh2t8=;
        b=LSwC+SNy4tiLIixpZx7p4Kt/hYuVH/WGgkpFR5TgEZhkgO6xnuFiY9wax/4RWbRhpT
         PCfOPht5ASqHnyj2m42L9O6mvOxZ4Zz0rOzaI6Q9mtATtUc7j5S35X1ydKaxV8SnbiSt
         e4U0W+yMFFqPHAAauiPMRJUDnNvLvSoDD6kpbxGqCZdFofC+2KhUM0tQelCghPPt2sDZ
         6EabCU40bokoXNcESjbyzZLvyZ/SUZ0E7VODr9+0ZnFyn4GRs+48QMNNb4LRs7RAfh2t
         J3FcL4lM8z7SX0g6+POcwx3S5GujIB+QdD9TsurgzS99qecwQQDu8qMWSLpZ7hDb0GsD
         e8aw==
X-Forwarded-Encrypted: i=1; AJvYcCUtkNjKYD91D5mhQ57czESXAhnQBEKkBjqtzSwb2xl7rkBz9K2jG7rp2aC+h8kVJAQDab94b55cWg5WNrAs1s/1eWK9i7oZu6HM
X-Gm-Message-State: AOJu0YyljLoex0x3m+jXmC1iqPJFFrjQUkhd/XIDs7kOusbbSL18uThz
	cXtOGcnhfIX+yo5JrecH8VGwaHndfaXgJu7UXeUzTuY7DaHsxH+ZELm6a6l/iRSzt0AyhJ9Yi/G
	b2lnLBixwP4fNpF61MXm/3XRgK5kjFdLo2VkjoVc5ByAOaaEJfOPrtH4=
X-Google-Smtp-Source: AGHT+IFfy+Nbjrf2pKL0wh1L3WWKDsM5FXclSrHWOcJREVsHFK3u0Rm90ZSuxk4ROSbHWYVpL3QFeINWnPTJTzRZFDwTRmOfMqbh
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d9c:b0:36c:5520:9597 with SMTP id
 e9e14a558f8ab-3763f70d037mr11866155ab.6.1719437644570; Wed, 26 Jun 2024
 14:34:04 -0700 (PDT)
Date: Wed, 26 Jun 2024 14:34:04 -0700
In-Reply-To: <f3ab10ab-38e0-4856-9d89-3b5409da0e55@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000004b0dc061bd1c6e2@google.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=146c143a980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3f7b9f99610e0e87
dashboard link: https://syzkaller.appspot.com/bug?extid=8693a0bb9c10b554272a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15e096c1980000

Note: testing is done by a robot and is best-effort only.

