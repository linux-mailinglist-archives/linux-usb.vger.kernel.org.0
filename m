Return-Path: <linux-usb+bounces-32887-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMMtLiAmemlk3QEAu9opvQ
	(envelope-from <linux-usb+bounces-32887-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 16:07:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F0DA3843
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 16:07:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A63DA30B8A6F
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 15:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E7F368288;
	Wed, 28 Jan 2026 15:01:14 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944EF3644BB
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 15:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769612468; cv=none; b=WV8tZkWdR93s3NYFmP26iMb0TWloCwIPVMmGpoQEPJgdDzgsFXvrgeIZWIwtTuh5MQhEMK+LSllJNjsx6JKXouGHgO8AwjQboXVZQhuDmQb05xi2zQfq9sitjlsUgQ/6rC3iquzTWN1sElK+Xui9HUUvBX933FZiwsTEHh10nRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769612468; c=relaxed/simple;
	bh=pt2x1rWKVPsb0/jroDJAiAp3ONjHZBk4AfXGqEePj98=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kYAHqe1WeaUAYlI4hcmsgZx4EO6txaBNpUgQuM44/AtKoiLp9LHpQ1dH+8TBaF9BrZiqI50M+IsmTi1zifFIhIPtmXzAUwrhcPk5Ma+Q1FPPuOVk52TM7bEwW02cB4qCVbHOanCgUEdyPe2mbPuSErOrHTGTrCA6ASR869Ko30Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-662c90deacbso19285838eaf.0
        for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 07:01:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769612463; x=1770217263;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/uUOCtuqsgCKmafh1B6/0sbIPP7gEdd2fHvqU+2xOY=;
        b=rlfKGwGcaQpuGpC0VX5zhd/5iVfO3pBmuhRJxXzWaqMM0EclnlH5rbqmh/QfkAdv3j
         Fb/klIb0xTj0LjJizFdH8JHeb6uPu42rNn/wj7755XfI9bSXqRzeFxVlXmXPYSKVdM3G
         93+8bxUbkSLA9IU3B9Fo2XK/LeMZC0quRAcRnaPp2kwnjh2e0fqik0rT/lo8Zto3cNHS
         edPMYj3Y4Tnr9j0wr9s0Uy+UHW1drAsLWHIf/6qkfRn8B+8gnsvih4rl9FmCfTMiAI44
         g/qaWpJFSMf1g2l+GM2Dya3mDosnVlmQBwFlCQCEsDyv/xrc9uN2KErad9AgqrW9X/RU
         uxEA==
X-Forwarded-Encrypted: i=1; AJvYcCV3zyFR+fm3kQJbcGvB4JXYHcNQgZ2rsPq0y1JIUAm2uEdkMl4aM+pbR/QvOQuSvxXzp8seujJYWfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMuxze9+18RPwuuzGb//D63DMmRZm6Atp14VYc7WwBG+opcp3Q
	u7Q62SUOYCGKDF0XABdR3mNCR1eqf7iHj1dmF2dw2mwB6wJkodSsFsjg972+8J1hns7I7U+IkjA
	WFJcFs4hI4HJFI4qR9/GXBwHx31qDxfRtrfpNzI2opKIE3H4yaUnL38yMWE0=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4588:b0:65f:1012:69c5 with SMTP id
 006d021491bc7-662f20f917fmr2496135eaf.76.1769612462862; Wed, 28 Jan 2026
 07:01:02 -0800 (PST)
Date: Wed, 28 Jan 2026 07:01:02 -0800
In-Reply-To: <20260128141841.50281-1-aha310510@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <697a24ae.a70a0220.8545c.0003.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in qt2_read_bulk_callback
 (2)
From: syzbot <syzbot+c63f59479d561970dc2b@syzkaller.appspotmail.com>
To: aha310510@gmail.com, gregkh@linuxfoundation.org, johan@kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=d966fd19b1ce0534];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32887-lists,linux-usb=lfdr.de,c63f59479d561970dc2b];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,googlegroups.com];
	MISSING_XM_UA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: 09F0DA3843
X-Rspamd-Action: no action

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c63f59479d561970dc2b@syzkaller.appspotmail.com
Tested-by: syzbot+c63f59479d561970dc2b@syzkaller.appspotmail.com

Tested on:

commit:         0a15f43b Revert "tty: tty_port: add workqueue to flip ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12ea4c52580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d966fd19b1ce0534
dashboard link: https://syzkaller.appspot.com/bug?extid=c63f59479d561970dc2b
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.

