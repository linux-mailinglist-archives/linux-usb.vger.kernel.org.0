Return-Path: <linux-usb+bounces-30926-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1770DC872F8
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 22:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6887F3543F4
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 21:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932A62E5407;
	Tue, 25 Nov 2025 21:09:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A59E1F0991
	for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 21:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764104945; cv=none; b=dymSRcZ+dl05oG7EALvCgSXAvddfkKYsoaw9kv/9skufh5ix9SF0tKvLxyas1+TusH2qqpIG+OlOTdNtcHoIUx21seCxwQ5QR31jJRu0IBWEQlm/15Cb1/rqXqf3M97zOT00+9uoY572V7Qx+gI+HsdmqE3Nx2Y8hqqB9h77zIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764104945; c=relaxed/simple;
	bh=CtF1IMGypsXAxMFuVLFe9wJ2dqnKq63kk7rX3bFzl+w=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BNZudXuYCi8FBjsq0Rklz9SrV2Voms2CG7m3IqUSIs517B4pFbp7prNVjzrHbJS+EVPKwDq/JtaC86yW7fidNwpy3p+iS1RzIrzG1jw/hGi3ZHMbm7amj+JEsIeZF3k2r+KiODh6sWYVScnvQJBPkzsPX7bVKs2hTKY/G53JbAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-433154d39abso62528435ab.0
        for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 13:09:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104943; x=1764709743;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ae0IECMTB3WvTak8xKOe1qjBdVdSW5jjLog8EhDbjU=;
        b=HadLVplVZWxVkdVuBKjIYS+SD2yoy9OF9X+lFjpROGqI/Z3evWNEU6tfRy9oc30/kO
         xpZmh4pB03qstplcnZ1vXnis+soN0EVdp2MCEiaOXH/apHXzTpLb+IvE6shmdxFXFF3A
         PXqkGyjU1hVWMOd7U/bY44jrVbFupG8/SfjtL/572tso30oEhXGtUEjdEsRSpeWjWnwV
         hFyhj87WXuUcAqUleZlTtugNoKxF0SAxRqqqTpbBCKSptlqKwqN+Jx+rM6avlVjamyNr
         DgTSyVbvICo79R2V0wFsXtPL8bOk0lAsLAQp6IOP/ir8tiaWSNlfRqENbaDAcUI27YW4
         qIBg==
X-Forwarded-Encrypted: i=1; AJvYcCXhDJngIz7oO5eJJcJK2XHTrooCC62rvyjJuFIbjqeCNJcR/KTdPp/8j6lF2UGWwBp5Y7BuH/7bDy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpOOpM7tb4xW/fqKQlVzyU4CexieoIkNC4ZsQQvXydw1PvFhDW
	48XCR2GAdja3EXrkGLCjOuGKpt/KSv5jkWmKmMFn23PHcIJS/Do7d1LTASac4ANohK+T8lwsGBl
	ZVWyH9+CgZFHLMXWwpPCVByT4oeq6gmTi+hPbhk8C25ecJOL857BPJahi2Zk=
X-Google-Smtp-Source: AGHT+IHYpf28XXE6SRZe4Xdp0Cl0TChF4awDygyd6atIw2ev8bSil5pdTazY3o4sSX/CI7lBnMGTZPVTBzIySRJBD8/b5Da39yHr
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:178f:b0:433:7e2f:83c5 with SMTP id
 e9e14a558f8ab-435b8bf921fmr152965465ab.3.1764104942649; Tue, 25 Nov 2025
 13:09:02 -0800 (PST)
Date: Tue, 25 Nov 2025 13:09:02 -0800
In-Reply-To: <ca9d89ca-4da9-4f2b-bd92-3791cae54911@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69261aee.a70a0220.2ea503.0092.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] memory leak in v4l2_ctrl_handler_init_class
 (2)
From: syzbot <syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, ssranevjti@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Tested-by: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com

Tested on:

commit:         30f09200 Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17d5cf42580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f30cc590c4f6da44
dashboard link: https://syzkaller.appspot.com/bug?extid=a41b73dce23962a74c72
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=164ea612580000

Note: testing is done by a robot and is best-effort only.

