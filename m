Return-Path: <linux-usb+bounces-16154-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7478C99BA4D
	for <lists+linux-usb@lfdr.de>; Sun, 13 Oct 2024 18:14:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 377B9281B61
	for <lists+linux-usb@lfdr.de>; Sun, 13 Oct 2024 16:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A157147C91;
	Sun, 13 Oct 2024 16:14:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3F842065
	for <linux-usb@vger.kernel.org>; Sun, 13 Oct 2024 16:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728836047; cv=none; b=qoCakCYCUF2MqnaRbwC5EE/AGUmo0ecEcfMQAZd+9PkW2Qs+e8oS7PL5qV60Hcl289YjfTusktRNt8skpLEzg0gh7GoZUdov6fAN0IezRUK97IR7XJPBiezxJjV6Qq6onszxSUyUa0ekEtI1a301xe7fbh89wJEV6ys8BEFrXcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728836047; c=relaxed/simple;
	bh=cxyDziBMrcbpClpT7sQKHSXjaYosTfXj8LBRDPk17AU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=iLmIj7eQOjyrF4ezP8mwCY3qCDhs7idf1H700mbsHoRhhZmeDx33+HCzrqxwF6rvCV7B6UZaj251tDgnaklaYjeNhzmuaPXtsxSOPLIi8cwsCQSGyGYzHAuOLokmsOLbVYdEfTurOxop3PBel0FQJWrJ0AvtY+SwhEh8PP6UAWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a3c27c72d5so4181125ab.2
        for <linux-usb@vger.kernel.org>; Sun, 13 Oct 2024 09:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728836045; x=1729440845;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jsOc3y9Oz5HGogm4560/p/dh8cnJBNPbUcw760E4xTY=;
        b=GqUikWWJs1Uxj6xqhQeFCk4lVlWAtiCn96WDWyaP2GtyoSK3+q9FJ6Xc0QT0kzlfQU
         W0hsymIkUJ4H77TbSGZRO3E/XH5dk4Hv3xuwbMQY4qWLXJD/+7li2uXLIU+nXPuB6SCU
         WhRt+kI47e2XYURKD+b6t/cQs05fNQWLO1CQHU0OZ6+/vpBLKZpLzR+Msxn8u/W0v0CT
         QDVAAzf2cRni7a9mtRupvtBXa/M22S/zxr0s8JBs5gwQ2cgfaxZSMc3cDjCVEXA6XoQR
         BhRGDTmlxr2QoU0xXsw6U8JLxNy5Ijpi3sBpeUGYdJiRAeby8b2bwu2G8uZgp3AsSVdR
         dLjg==
X-Forwarded-Encrypted: i=1; AJvYcCVLy+LgeoHhm5ultjryQwPeZeGCSw4NAHB1dM/Ket7M6v80pJDEvpAR6u4v8KaA+XQjtS29hKiiTZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN69RZcYFXb8EJon1Mf16ZYUWYshEgp5wLZyMb/rQS0cg3VAZX
	2I6bssGKCExzmY6jss38BByC6swpdcuN+D+kq+SGtnPPFvTazzXcgNacz4SZqax8VlrxX++LXkk
	JZwb98YGEZA3/My3aqa20IHCPRGtEp24wTb1K28tUORYStNd/UuzZ85Y=
X-Google-Smtp-Source: AGHT+IGaBLNObaP8lW/vvvhGno9pbGMmUbe+3hsP3j5e4q8spuiUpuMd/GXq+5/yOO4w7gxbUAs/bdq9Y54qYG0W2dnF6A26atqR
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a08:b0:3a3:9792:e9e8 with SMTP id
 e9e14a558f8ab-3a3bcd9c979mr32522925ab.5.1728836045133; Sun, 13 Oct 2024
 09:14:05 -0700 (PDT)
Date: Sun, 13 Oct 2024 09:14:05 -0700
In-Reply-To: <11dd2a9d-2f1d-4cac-976c-90a1b0ee667e@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <670bf1cd.050a0220.4cbc0.0034.GAE@google.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=14c45087980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4510af5d637450fb
dashboard link: https://syzkaller.appspot.com/bug?extid=f342ea16c9d06d80b585
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16768727980000

Note: testing is done by a robot and is best-effort only.

