Return-Path: <linux-usb+bounces-18806-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B909E9FC293
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 22:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 296471883E29
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 21:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8793212D7F;
	Tue, 24 Dec 2024 21:52:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B4014901B
	for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 21:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735077125; cv=none; b=uNfL5e6/Rm+XeSZo9zOJ6d5zhG7V6f95k/vOwARxmWgjsDYVaFm4TYbzE98HV6TxEpXY2xL0zUxt0FHhxuPDMcsxYeYOKJFe0g1BcUEYXtuozNYGRj5DTsQY5ye8+cUJsV47amkvq/qtuDJS8CRSp3Hzx91BxOHkcJpCeAe7JmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735077125; c=relaxed/simple;
	bh=1SccR7/85Ev+zmlVFYTm8gst8PE56/LLci2h9RzErFQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=thbvzo0wWvemi2M/gOGa2oU7/sQSlCbb7f2lhVsMdPdUSe+Jc/PpGhdFZE2gKRoaCT9GPN+BkwnHMYn1ThNlAHafxULyGIFsY6cV4jhO3gpnRf/8Dya4ox2Bi3zdPuXg8AA/ARU/8ID5AWWySPUEMxjVr+aGINC2HNDBXXoZrbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-844dfe8dad5so919514139f.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 13:52:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735077123; x=1735681923;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=76899iIyLRwwAHILxLbSYak/Z4CiuYUYRiqZJ99fGDw=;
        b=GYTctwV4ABO2qiItziAUZqbG+KTBa9baEHhrdk+PItt8ZvWITmsAcSxpURb1ejMx3b
         ozWgmcp0iRTkNLG4BNKWE/sq1CnzPuaOCoFfoZFkiNOpwGHppYOuFhg1HMKEZvMS7Ig9
         CkEbcAT0WJ06GaR94LGvWldKIhTGgqUtiT6GA3jEQT39Kge9lm/hJSX8Ws0ymYfXXGgj
         HEd/fXDu/bS8enSTss5kg6BwGnDvlSq6DDfDYWJUpIXKPKEaxXnezIqXm5LWKP6gvw9h
         IcWyck6RieqffYgN/rA7LCE70rwAKEdsdYb+S+V3ae1yhZzmcfOP2f/O3dfc3Xyn4UDG
         RrCw==
X-Forwarded-Encrypted: i=1; AJvYcCUHhWFyyMWER7yM+OofKUXPo66yDUR+gacVk0CHOUkt5WwadQ+XElVIMvFsmP7joMwKMtso6yAyL0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQdLFe/NnQtVzACENiLSBHoc/wtr2ZKni7JEm4llrf6kDaNq9M
	WmfARyfaIAcZz3DETZtmlcW8/+wm+C+MOwGOwC5M8a30EkV9FzxAWnrPks+9zPMHief3XDjmjYs
	0yOgxWj+ySohRDw+ebmfcD74DwxknC7JEiezxzpOq8Nqw9iPEGDwhG3Y=
X-Google-Smtp-Source: AGHT+IELSaY2yi5q69i55hpMIsdydyqjVz5Tv2kPSL6Z/IX0juRIHGLCcQNGIr1aG/W0dl6aCjEVM/jS5ksRpa6973mBK4SA3qoP
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:20e8:b0:3a7:78a8:1fb4 with SMTP id
 e9e14a558f8ab-3c2d2f47732mr141838765ab.13.1735077123166; Tue, 24 Dec 2024
 13:52:03 -0800 (PST)
Date: Tue, 24 Dec 2024 13:52:03 -0800
In-Reply-To: <672ad483.050a0220.2edce.1518.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <676b2d03.050a0220.2f3838.0229.GAE@google.com>
Subject: Re: [syzbot] [usb?] [block?] WARNING: bad unlock balance in blk_mq_update_tag_set_shared
From: syzbot <syzbot+5007209c85ecdb50b5da@syzkaller.appspotmail.com>
To: axboe@kernel.dk, hch@lst.de, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, ming.lei@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit f1be1788a32e8fa63416ad4518bbd1a85a825c9d
Author: Ming Lei <ming.lei@redhat.com>
Date:   Fri Oct 25 00:37:20 2024 +0000

    block: model freeze & enter queue as lock for supporting lockdep

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1064ffe8580000
start commit:   c88416ba074a Add linux-next specific files for 20241101
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1264ffe8580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1464ffe8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=704b6be2ac2f205f
dashboard link: https://syzkaller.appspot.com/bug?extid=5007209c85ecdb50b5da
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16d34740580000

Reported-by: syzbot+5007209c85ecdb50b5da@syzkaller.appspotmail.com
Fixes: f1be1788a32e ("block: model freeze & enter queue as lock for supporting lockdep")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

