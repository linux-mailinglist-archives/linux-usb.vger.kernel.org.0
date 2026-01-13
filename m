Return-Path: <linux-usb+bounces-32220-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D07D1701C
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 08:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D4F0301F240
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 07:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D7336A017;
	Tue, 13 Jan 2026 07:28:09 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75349369960
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 07:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768289288; cv=none; b=Tlmye+aoWT+IzErP0z7aqsbLwOCxtOSQW10WOgH9IU2c6TigB3h8fPN3qsUMu4LdTYef9BDsVUGjV6SyHNmJ/jt7Sb1oCty4hjoJqj8JLJANO2hgFGccWAmwkPybCxWj5hnV4FEuJWD+QK4BYKoFhPJ3BgV4H1Krvij4HjqmcIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768289288; c=relaxed/simple;
	bh=/Ux056CZ0FaMR7HHoShFpyBbqOi+bPQtp6Dh3/p8d7Q=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=P4M75+gfLrL2bGjdPzh2w7Q6a67eT78CrtlDK8e2pT0Uv/w8iDz/Oj3KLakRHix9Jb6ahDtz9K5yRTj2fTJzSm7v9fgz6YCSMq0cId/f0u/KypAvbJAphR5aOTetJHHBxg11fH/aSJKmoJIERbPQrq4h1QG+U5qysZG4lKq82cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7c76977192eso34269666a34.3
        for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 23:28:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768289286; x=1768894086;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ycbL0oMl9i40WiR4rER3tsf/nDkOQd+2vK/NCzu2HUw=;
        b=FxI8r63iRDGoPQ/Z+s6fZJ6s0rpMmLbUgN13rkGTyqHhDXVX86CwFTk+GOaO/P58TA
         e61OKPmxiIZFnnFuZ9KUb6N7+zdALBUDeh+1KTbjViRZibKCQtziPoJnennO/UiOdyLe
         tMabaUb29Jea3ZiS9u1fhcotiYjx8zcWpqLREzs402NYN+Wlv/y0a1OQALxs8Jptq8xc
         Y6nUxE6rSnEjVyW48/KIYQLg3f1Yz04SSqFu0YXb4SYbqNHLkR3yLrgFCmKPHm08Lmu7
         o1ZFGs3kP0yF4mj3ZETPYoUwCWrnIZEs8TRTCDU7Q1EeZ3igweuaM4NNGwa8NtypLNrX
         s6RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFVb6Gh+GXRJUAn1srOV/pQQ579y4h3J/xKnDeEY5k5d/jWZD+RS/+2TqSmuCDxwFpmq5lbhqGLPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMPkqRRnCFEn2KIv5wOVH4afcj0I9wa8ufoCZ0agNbU73eAWkc
	1axrn5Zx5MV3oKAk1A4/Bf0P1wf/8rWRsuYIF7LJ7KoUVsku19nBCaE7rdfzh+GLVYhayx8Juxo
	nOlMcEHYb4k+s2aOV2JPonn9c0bTYezUXWq6fxNz9roArfoBB7xtmixDuDdI=
X-Google-Smtp-Source: AGHT+IGz9T7ayMeFSdUTPebFup/akvO5avdj7vr+v4W/0C0fJ1CqxUtFF2s82TkPAdAb6dxCckogqZXO1blHOi5GBZflRfOztxw0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:168e:b0:65f:6601:b368 with SMTP id
 006d021491bc7-65f6601cb39mr7644487eaf.49.1768289286406; Mon, 12 Jan 2026
 23:28:06 -0800 (PST)
Date: Mon, 12 Jan 2026 23:28:06 -0800
In-Reply-To: <20260113062537.4170377-1-coderlogicwei@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6965f406.050a0220.38aacd.0009.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in i2c_tiny_usb_disconnect
From: syzbot <syzbot+30b78308ba7e64647ff8@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, coderlogicwei@gmail.com, frederic@kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/mater: failed to run ["git" "fetch" "--force" "f569e972c8e9057ee9c286220c83a480ebf30cc5" "mater"]: exit status 128


Tested on:

commit:         [unknown 
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mater
kernel config:  https://syzkaller.appspot.com/x/.config?x=a11e0f726bfb6765
dashboard link: https://syzkaller.appspot.com/bug?extid=30b78308ba7e64647ff8
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15e7a99a580000


