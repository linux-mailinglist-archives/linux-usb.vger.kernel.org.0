Return-Path: <linux-usb+bounces-17451-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D16189C4DBD
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 05:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97EE9287A82
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 04:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444A4208975;
	Tue, 12 Nov 2024 04:31:09 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E7E79C4
	for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 04:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731385869; cv=none; b=HWHRHmpLW2gZfW9KlJHHSnhx67wLjxrtuskzD09yLugNggN4ffsaU9rwu6ULrtltmxXOzY9f5o13mlCS1jP/wEQx4OCacwNiTAW8gjKej4P0r0vVCg61ul6W/0Dvfh66LxYXI6F2Wo+Xxw6Erh6KCsALxbMbo6/EMh4nOYZPXTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731385869; c=relaxed/simple;
	bh=UXtpxBefUNr3VcIYNI9rVjNQrYCyWHXXzZkWnLQ35Tc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PMB0BgCRZ9ZLI/Cnk3inLCfmm9ZwI2szKVdmoeOdTPY3Gjr2rpdecOWQqoSS8MQ2wj+xyxvEAO6sN5Qn/7wwdAfAmB6b7dgoQUrEXxaa1piItlXp55cWcnHD3fz+FW94Hd7TWJbjWgNA4fjScJa/5oqxbEnhI10kH+EzP/sbBU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-83ac0354401so655873239f.3
        for <linux-usb@vger.kernel.org>; Mon, 11 Nov 2024 20:31:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731385867; x=1731990667;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=57INWnZiq0HfAnj9yObF5CBGSGscztNUCHjuo+6K0KI=;
        b=cFzK0mdoNUVW8Mg0b8SjDlHIWe/6W0Opineco0AH7nN/76xURibX1nEyUmvf1mQWUP
         zuOX1dMUoFARwiyx4D1y9c58vHyr8W42WYolSw62yhm1uHmLinld8hFWZ8toRpa2mSuh
         ZfMCyuNy3c094uONCW5BCgKetGa7xEsoDiuaPw2tJr+B0gNhQy9eAKDHVCYcZQjCIHjf
         khkwBqqsMiP6cyfV68FVDHDKLqCFPe5SChwCIdwD7UaCHTyZrtJNnwQqYQlpa9PQiKTA
         ffbZcW1vWTJPim3UUHnC3RwVcgSlCkdSO5lROWujtVVZvYFotWqagGeUQQkfIW18BRxg
         heXg==
X-Forwarded-Encrypted: i=1; AJvYcCXUtdYA38QQYjzIVUZBOnTMT9qfOZOur3k9AWmAVus61NJtSAJJoLbK2VTz+JTrJ6qpjpVaxt8xHdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBMPZXti95MvZwqlw/Cv9vxHCfXBax0dKjEOeTvsrg16ALss0C
	kjgaV6IFv5Ls+F/yW5hKBiiifqt+ITs2bAbQofGOdj944dCUXLacMM/hn+V0sjk3p7Wfn1PC2QB
	OFmAN5L6A4+dyFEHX+ZiPg8BqJAKPlJbBRB3TpEAhYqNuX0T6ysJUtLc=
X-Google-Smtp-Source: AGHT+IFFUDjXKPivqzf1Tpm1sYMybaBdZY0FjaiXxICZysfVPEn6SL2GpDXPpaOREbFWte39HRrYxumuNBSVZgs5bBmZdVwHU/rz
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1908:b0:3a4:ebfa:2ac7 with SMTP id
 e9e14a558f8ab-3a6f1a0a674mr158303905ab.12.1731385866731; Mon, 11 Nov 2024
 20:31:06 -0800 (PST)
Date: Mon, 11 Nov 2024 20:31:06 -0800
In-Reply-To: <20241112002134.2003089-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6732da0a.050a0220.5088e.0005.GAE@google.com>
Subject: Re: [syzbot] [wpan?] [usb?] BUG: corrupted list in ieee802154_if_remove
From: syzbot <syzbot+985f827280dc3a6e7e92@syzkaller.appspotmail.com>
To: alex.aring@gmail.com, davem@davemloft.net, dmantipov@yandex.ru, 
	edumazet@google.com, horms@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wpan@vger.kernel.org, lizhi.xu@windriver.com, miquel.raynal@bootlin.com, 
	netdev@vger.kernel.org, pabeni@redhat.com, stefan@datenfreihafen.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+985f827280dc3a6e7e92@syzkaller.appspotmail.com
Tested-by: syzbot+985f827280dc3a6e7e92@syzkaller.appspotmail.com

Tested on:

commit:         2d5404ca Linux 6.12-rc7
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1608335f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1503500c6f615d24
dashboard link: https://syzkaller.appspot.com/bug?extid=985f827280dc3a6e7e92
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=109ed35f980000

Note: testing is done by a robot and is best-effort only.

