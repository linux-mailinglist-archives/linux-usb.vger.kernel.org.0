Return-Path: <linux-usb+bounces-25557-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1324DAFBBDE
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 21:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61D87166518
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 19:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E9425A320;
	Mon,  7 Jul 2025 19:48:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71E31CBA02
	for <linux-usb@vger.kernel.org>; Mon,  7 Jul 2025 19:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751917685; cv=none; b=UlDd/3O7Wv9XdM9UQnFCHmZHT05EsOgaNp4rDGzPiSAlciFO3i4hB//2dWvxq0HGngSt+5DjdnquPbzxvLUpvXdfRVLVNc3LuElA/l9HIsd11YjlQfhMMKvJEvxUw1x6eTvB6vF5aD7AjYBCd4hlkICcK4PnESKdW+yUFcYksoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751917685; c=relaxed/simple;
	bh=TuWmJzXscKf3ZHtljDfhNIF0AVhdGCIkXNPZJPrGjeA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=nHDrcHuNK7VpsGTp9H7dZcHr2Mtbn+03jfgZK8BduzVPs9kknCQrNLCMsEFMg/aSSj02qdaPeC8YyFAoLtOcY9tdQOxgbUFc1JxWaMtYW8QEvKCEwCLDAwmRssvNd/Qj7cxzC1Tk3o943xJwTOBwTSzUIYXaPrduexshI7wC5Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86f4e2434b6so406966939f.2
        for <linux-usb@vger.kernel.org>; Mon, 07 Jul 2025 12:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751917683; x=1752522483;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1hoWMOP+KagcUR6OfQbc7kG/bxEdCmumdthhOD57rYs=;
        b=FOcNPIKNTCogCyKdEYjVcWvwE8ad/jkA8vsAUrWtu0/oGpRE3G/PnAakUBKK+qwH9x
         52rT/wd5NSGOa5w2AlwzN4IoKGUxJ/v414V098xN09vwfms9CUZn93IVYK8AaDG52tDY
         1fRuVy9Ge9IUJnIJvig8JjJNVp/YoVZbXUg6aGRRsZNwH+4J6TI47sncqrOizR/JbB4m
         BfAgzlgzdn6lZD99qNp9JV/l9XOmo9ayjF6C010FKRs0D52byBtFx2Tb+8J6hiZd110R
         WIWsnvPJFj1wEefQIsHtdp0p3K47AOPAwLB/8HZN1nGmyNOh2NTOHTf8S5xIdFhVd/GS
         JikQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXO1+nz9W5AVEihgWYAprLU0DKXr8aioiCCxL6UTJuAO8b59TU/mAijD9tIPYBwWo29O8G1So0iQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+if0y02J2sLMHh/pg7n/S4GqD1G92UlR3rMitf5GL3ZXBDNkG
	T0eAgwSuHiV5wrp+1yVPCwDUrDm0t7QNT8i8VttZwokideoYUrYUMoHCgu5ZZ7wLwEucES3HRMo
	TNUH4jXtdZzkFcqcpDgOJVRhbSyBIJ/1uGK6hCB48wbmjZHfDgIWnCQEKQOQ=
X-Google-Smtp-Source: AGHT+IGnNDtAp7BDNfzZPfiGJkUe1l1lIbuZMFhDCSKX5R4/PBHEIi/mHZOlZcFOgVDRnHaFxUGrJR5H9tfnPb+bqxnsyiYSsjL/
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6d0f:b0:85b:538e:1fad with SMTP id
 ca18e2360f4ac-876e15ada4dmr1462372439f.6.1751917683076; Mon, 07 Jul 2025
 12:48:03 -0700 (PDT)
Date: Mon, 07 Jul 2025 12:48:03 -0700
In-Reply-To: <72fea4f2-40d7-4f9f-a08d-b1ada781256e@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686c2473.a00a0220.6237c.0003.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-out-of-bounds Read in mon_copy_to_buff
From: syzbot <syzbot+8258d5439c49d4c35f43@syzkaller.appspotmail.com>
To: contact@arnaud-lcm.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	manas18244@iiitd.ac.in, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+8258d5439c49d4c35f43@syzkaller.appspotmail.com
Tested-by: syzbot+8258d5439c49d4c35f43@syzkaller.appspotmail.com

Tested on:

commit:         d7b8f8e2 Linux 6.16-rc5
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
console output: https://syzkaller.appspot.com/x/log.txt?x=1517428c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f51185bd4f40ad44
dashboard link: https://syzkaller.appspot.com/bug?extid=8258d5439c49d4c35f43
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=122e9582580000

Note: testing is done by a robot and is best-effort only.

