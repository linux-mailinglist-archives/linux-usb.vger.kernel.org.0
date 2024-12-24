Return-Path: <linux-usb+bounces-18780-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8AE9FBD95
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 13:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 346487A1E59
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 12:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1572A1C5F25;
	Tue, 24 Dec 2024 12:54:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1781BDAAE
	for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 12:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735044846; cv=none; b=LxmjzX1UsuWYI4HXjBqxSpWEWasNkEivviMeVMkTNX4xxsCN+27k0CLlBocpT6TB0sJoFmdl9JpsVI5DcyrXcwvAROSRl2269k9XRmsgjkXUCoeMkPTL+jU2Z529ELlvz5ALbX2CsLinhBnibhzfdAv3ye85ToWWk0ik0MQHsqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735044846; c=relaxed/simple;
	bh=evKkQ6HRgFCs4qvyPiGUzDaLav0G3Y1QWg/On8rwMgs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ImRkK/VY2o2RQSLxIfzyclNAP61S09kKSeRZWoPFUBNW670RSmMQlrRs04FIeiXQvpMbj5fKr6JO+m+swZ1yQ+gaSMb3F7DZLKoyw/OvMHEG8hzvVjNOMuTrmCoABgTpUdx/aoUHULS2F4mFltg8yRPXG7YAjzmDxd7pQoiSFac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a7de3ab182so96876955ab.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Dec 2024 04:54:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735044844; x=1735649644;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1AXNF3HG5kzxLMUq/sCEuz5IDc2syA6hOB1XtzvB2IU=;
        b=h6MgXA/0df3EIsEIDrPX12wvjaswsSHEN/WaxWL1TYLGBoCZPS96EIAyBmPpAa0BVF
         o/ATtEJceqnQvAjeCtkYuVIx2z2MSK6R/fxvb1zfOIvo9rDm38+yrxUVh+t3s21uv4xl
         V0xdBfq+JiA5jOv0WON/voPcN5G4pzW1vYBaE5nVl6/4hxdOLIKj/CVnz72Jv9ciV/l4
         3mzKR8dD8IUk0jGposYiOcr3ihs0KttKrfzutBfmcQN34+wvls0blheJ5dBSYoo8rcSD
         ejCE2gvo1hDRs0ULj62m6sZ21cSxuF4wx7rHwoROo+qjxnhAH0fb35GduD1wPL94NWGt
         relQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgQm2k8LVU9BN0Miynrar2LyQod6RxgceMNfSHFYh8vmrGhjV2/AoLo2/QkBqWO0Gyj09SenwvuAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YybxPXlX6hVHugh7LoG55Buk1sQjnyh9Ch/wek/BLK9U1wTxXMI
	bCE9fSmHE8yaEgc9pWvB69K0CvXzPnd1sxInLzGtx6iaXLOPIFpPs2y5SXsthO28ao9nzcgioun
	KbuCBAKo9Ov3hdNYxIYP0/GT7PkY8S9vSclRR4zWPuMOpKpA6ysDjPuA=
X-Google-Smtp-Source: AGHT+IFjNd65RorbDiw7iPiMhcltosJUGUn7EAB+95J5DOXJQ45jC/wCOMvdSBeDexbbzglCBhMkkC+Z1x7VGvejquji3l3KC5+/
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3b85:b0:3a7:8c3f:edce with SMTP id
 e9e14a558f8ab-3c2d14d21a9mr179594035ab.3.1735044843942; Tue, 24 Dec 2024
 04:54:03 -0800 (PST)
Date: Tue, 24 Dec 2024 04:54:03 -0800
In-Reply-To: <672ad716.050a0220.2a847.1a9e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <676aaeeb.050a0220.2f3838.01aa.GAE@google.com>
Subject: Re: [syzbot] [usb?] [block?] possible deadlock in blk_mq_alloc_request
From: syzbot <syzbot+ca7d7c797fee31d2b474@syzkaller.appspotmail.com>
To: axboe@kernel.dk, hch@lst.de, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, ming.lei@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit f1be1788a32e8fa63416ad4518bbd1a85a825c9d
Author: Ming Lei <ming.lei@redhat.com>
Date:   Fri Oct 25 00:37:20 2024 +0000

    block: model freeze & enter queue as lock for supporting lockdep

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15fd34c4580000
start commit:   c88416ba074a Add linux-next specific files for 20241101
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=17fd34c4580000
console output: https://syzkaller.appspot.com/x/log.txt?x=13fd34c4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=704b6be2ac2f205f
dashboard link: https://syzkaller.appspot.com/bug?extid=ca7d7c797fee31d2b474
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1250b630580000

Reported-by: syzbot+ca7d7c797fee31d2b474@syzkaller.appspotmail.com
Fixes: f1be1788a32e ("block: model freeze & enter queue as lock for supporting lockdep")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

