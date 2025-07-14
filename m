Return-Path: <linux-usb+bounces-25739-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB878B03424
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 03:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 051F11896880
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 01:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3031A1891A9;
	Mon, 14 Jul 2025 01:17:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EB2BA3F
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 01:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752455825; cv=none; b=LCrKYX+l01Z3PRzfWjxud3m4fOwKn+SHJJ0ZUpbfcZ0rk57JoDZPDq00GQgi/2Gr2CUpWRd2fC5E9H30PLro40SIHwb6hJ/FaXukwEOSNM2VJz80Yt7zLeHf0W6Vc1Khnpgdo24rLhhvxTePEHUrBWggijE0EIUY8mI+B8x35o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752455825; c=relaxed/simple;
	bh=JxwukT9viBrgYB877CKwk7yaZR1dcr/A9TcLbp9ZBJU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=AAjclE1BaOpQ4DYAFmVm2vfANPYKC1DX6/bK+UzmE1O90cOzMZ8ikM7MTe8cADjezwlaRb3WKRwR/75sdi9hU7WrfenWP6XHIF2v8zdFQiNXyMBJIw/6YzRru7WqknEj4iZEjujFbt+ihkTvoGlkJK1LQYC+MPP9WvVjhiuoxkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-876a8bb06b0so724064139f.1
        for <linux-usb@vger.kernel.org>; Sun, 13 Jul 2025 18:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752455823; x=1753060623;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJtH1dfcPTgli92z0MSxdE2N7i2flmlAatjHD0iAHwE=;
        b=kJsWcTyWZkCZdcFHXQXY7KCvGhieAa0WxpNNVYvEely/tZ9xJrTzWkSMNP3DJ4iD4Y
         H3l7yyEs1QA2ElwnskvPBgqEi3lUV6TkFCsIG80NuNk7Ak5huiG+WcVmaqqTvvm8R+2v
         oUsoBK2fIWvIpVEb0APU0MQyrJrLVVNnmkguvXSwFKGqfBS3/q9Um44HYgr1Eg2DL67s
         jytOSzMbM0LptdCpsq+kcMQL0igoRPryr4FwYrQSYLdXAK2dGAAuNvTUSiIi6bnzEBMr
         XNct7Tg5Ap2im/o4eCVe5i1i7XvXM3U8VEQJzBSUyNMSj0h7hQtShMG8Zlrx/iZobK6N
         0iQw==
X-Forwarded-Encrypted: i=1; AJvYcCXE56563N3u/dZL62BinlY11O2ehIkxTT/6KxJllgMBTPVJWBr9JR3mCqOKNU81mLvcucj5I/sqcQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC+oB7v0xDVarX787+BxrXu6nn6uehBwA0U0USpr95GyrVcNOm
	dSVuvsQ/+BLTXH4D8dhHRU16nH5Ppa5n6//6pYivCChGi2VlUs5KcczFzAbScjiM7IET3ux/xJ0
	A9SewM6lf4K8zeQ3fLZtpmaUhyLHNAaCse1wrYMdJT/qYVaKydwatFC6hHs8=
X-Google-Smtp-Source: AGHT+IHRJrHlMOOlm6vfZ43x/qEwrpSqikTdDwU1gMTPLP71eUduZytt7EXg73SHWTGgioy/I1DfK7TonSag8gw1sJ1OWPfzLf/V
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2c95:b0:861:d8ca:3587 with SMTP id
 ca18e2360f4ac-87977f7198dmr1385241639f.4.1752455823637; Sun, 13 Jul 2025
 18:17:03 -0700 (PDT)
Date: Sun, 13 Jul 2025 18:17:03 -0700
In-Reply-To: <56cd61d5-b821-4481-9f67-1cfff01abfb2@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68745a8f.a70a0220.3b380f.0040.GAE@google.com>
Subject: Re: [syzbot] [usb?] KMSAN: kernel-usb-infoleak in usbhid_raw_request
From: syzbot <syzbot+fbe9fff1374eefadffb9@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo https://git.kernel.org/pub/scm/linux/kernel/git/hid on commit c2ca42f190b6: failed to run ["git" "fetch" "--force" "--tags" "aadfd0d36b9bffe7aa2ac681e0723ea26b0aa18a"]: exit status 128
fatal: repository 'https://git.kernel.org/pub/scm/linux/kernel/git/hid/' not found



Tested on:

commit:         [unknown 
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/hid c2ca42f190b6
kernel config:  https://syzkaller.appspot.com/x/.config?x=76c2fb9aa0954fb8
dashboard link: https://syzkaller.appspot.com/bug?extid=fbe9fff1374eefadffb9
compiler:       

Note: no patches were applied.

