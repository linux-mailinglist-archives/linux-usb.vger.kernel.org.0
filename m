Return-Path: <linux-usb+bounces-28530-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B358AB95B7C
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 13:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D7DA4819C7
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 11:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F970212D7C;
	Tue, 23 Sep 2025 11:44:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98AD279794
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758627845; cv=none; b=M4e4rygf2KYSoQD3+90q2CDNfnjJWB0DD7jL9DRokikoAJdyiOUObZbmfTmIizYBIYiEUn1KXYW1UfEa7wa3s9TcSUlKcsW40HdiuwE48/5ix1INarUWf72Zv0H+XNrBwYTAWFONXBprA4O5SZnvZLscHtwWyHa3ZyuYIshMWug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758627845; c=relaxed/simple;
	bh=MjgUiv1hiBVmGYAWbKukWHwYzxXC3U5WUKEUQFe8mHw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Lb1VGSOsolRLamNV+Oo12eSfPNvQB3DRTkLm2iBTYO8qnWcYPF8wEh7ji9EXBogaFU9jTOeb4lWfUorD5SxkIraLJmEMjhnDdRVi3ecoF8Iio6ZBymYNMGNGpgpMjzQ+lLeDyy6zERNbDxfS8hU9WfBXIxvo0snHX7jU2/vRtGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-4248b59ea91so92387765ab.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 04:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758627843; x=1759232643;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WQVvBj5uZq6uuQ1nu4UWRVsR/gDk+9EG2enfLEYGBRo=;
        b=vHperkMdGbp6e7YdlB9zy2VY+piZnuARXc4VnqbQNO3sOplOhSg2jx/fg8yUOAZ7Nj
         akI2snJnu/cmphzd6p/UGGXIk1b6Sdv+hmmhlZRf9B6CAt6VAzSNjVPE8vHGcsT5a8qO
         YNzZvf4Ud9USAW+6Bx5ZldvI44ZLGBjdJn711KwxPf+CHHC3MYYbfb4a0OqaHz8isTtC
         NLcY6lfVQjsNnfabFlEULb7LMZFPi6+miZ+aGWvbCej2VuFtQwvw88ZP9EC9nxkKy7Fj
         Sv+ivuXvdfrmMBmXNLHZTF2a5LryCQw6VY6fSroFhTnu1YuFDZERDNdr3LR1SHXCzmv4
         C+zA==
X-Forwarded-Encrypted: i=1; AJvYcCWTvF85XZWQ7PWsiunuMlyF6WHSfpLYBl8MEI2oBPA4gYlzSNywiVVCSTpY4AKWPNwJIaBupKa0FTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFrqRMkTi/nc7NmQaTAM5uGaoQ45GPhgUwhcyit+EiRFBRlofD
	QX72+uFnTJ8wsl6ldqdW6QEWLdfi7dlSIBHW5kUKf90sXCXlqL15cKRjrb2bX5ES5nlddEmidUt
	jXCILRk4F6WmWin4/NHbkSnP+/9UZHq7F7k4shUyXdFKqHly2yHV6bzKbvvY=
X-Google-Smtp-Source: AGHT+IFvOJRcG5WosHB0HMKe1uFAe6PQYbdY3i4QCDRSAtKAc7Sh8RXeNxUbnOUCvmi0umdlPKZnG7LEi2yQoCd/aYVeiM8/3Lnq
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c23:b0:424:7d35:bce8 with SMTP id
 e9e14a558f8ab-42581eae244mr39857525ab.25.1758627843063; Tue, 23 Sep 2025
 04:44:03 -0700 (PDT)
Date: Tue, 23 Sep 2025 04:44:03 -0700
In-Reply-To: <67d30ef2.050a0220.14e108.003a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68d28803.a70a0220.4f78.0006.GAE@google.com>
Subject: Re: [syzbot] [usb?] [input?] WARNING in hanwang_open/usb_submit_urb
From: syzbot <syzbot+9fe8f6caeb5661802ca2@syzkaller.appspotmail.com>
To: dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, oneukum@suse.com, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 503bbde34cc3dd2acd231f277ba70c3f9ed22e59
Author: Oliver Neukum <oneukum@suse.com>
Date:   Thu Jun 12 12:20:25 2025 +0000

    usb: core: usb_submit_urb: downgrade type check

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1066627c580000
start commit:   038d61fd6422 Linux 6.16
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=515ec0b49771bcd1
dashboard link: https://syzkaller.appspot.com/bug?extid=9fe8f6caeb5661802ca2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=109ab1a2580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=136cf2f0580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: usb: core: usb_submit_urb: downgrade type check

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

