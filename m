Return-Path: <linux-usb+bounces-10532-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A87448CEDF1
	for <lists+linux-usb@lfdr.de>; Sat, 25 May 2024 07:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 532141F218B4
	for <lists+linux-usb@lfdr.de>; Sat, 25 May 2024 05:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D01B67D;
	Sat, 25 May 2024 05:11:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65268F66
	for <linux-usb@vger.kernel.org>; Sat, 25 May 2024 05:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716613865; cv=none; b=KiHOYJk2U/zvwtJWAwEGtNbRFJ/b3t0WkE1XO9TDL+dp/B8dW5NFNmFG6H4XU2zZDCF0pPxOik1aKIR9Q21h/G4NtvBedEo4OCgesDckfqc9yDkKwirxveASerwMJyGuDpry7jY/KzTlBTS/O1zUus6UX1uTXpqDgRqTTG3mIOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716613865; c=relaxed/simple;
	bh=ChEzdL3+2gOHaf5Aw/yfnfdaUguDfZndQdJ72R/j/mQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uiJZ+lP5x5dvT2j8CXrPxVsjT6R8QBuIIAxQIzlAyfKjqT6HQuZzQcRUKfEGhmYBMwtYs14sx4hysRZrxPIoTD02X3yZ2eLdlS7HpXV6jxdJ91kKuwTjThjZhcdR/WwO+qSJp0w62mjo4TrvCEztwRPx/xUUbUx8RMFtCEnmFRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-36da593c0faso37717455ab.0
        for <linux-usb@vger.kernel.org>; Fri, 24 May 2024 22:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716613863; x=1717218663;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I8IyrQNJ0zAFLZsLTn91HX7IoDexMyQtJMtnbbiIgt0=;
        b=KCpmcTJb5B9yjuWNxu0MHOxOL3OIfBjesKmYgoF+WNk7HUK4ccvZaCOj6dva5lfhY8
         SEy5V9NC6QfelEA1t9Z3yNHEBNJsNEuBMzAjw8FZpLjWz+PvrYVDqc0fpj67X1+uA+Ma
         30Ai1PkyIKtRsItl/pdM+H6swE0wBZ46G4Q8ycStt6cFfRZE7aVDsQB41H9U/YzTNAbZ
         GiDQrUqWBFagoROLw8hB4ToTglP4C1a0fiY3mEqK1yBvax3/FDh42DdEalb2O46t9tQ0
         jCc7D7NRHJ3R/jBXA8PMcPGhdF3sUXe2JPL5uBaNOXX+y9AIaCP7tS2JVXcBmseSPSdc
         9yFA==
X-Forwarded-Encrypted: i=1; AJvYcCUrKVcC211xl0+DnROtsUjIkIDlSXJtPczeNvLq95sdY30ttdXLJ9yaCgBxl2UBVlK3C2Vjyj1emkaPK7iHDfpdMngx+AZCYQ9F
X-Gm-Message-State: AOJu0YypW9DjdcDGV66EiRmDv2bfzyRO1SyTRWYHt+0FR7z6A8QNH8rO
	hji+hCoD7nzbtjEvbFsGz3i8XZssd10cJ5DJ5c+GFDuJtqyC3bYNF/vWNeI64SH+pE5eSKlHGUB
	eTMyzIXhC3O+ZiJosGH/HRw2SE2iJGkzf8iSvuoN2Kt3NHyUOKaR67IU=
X-Google-Smtp-Source: AGHT+IEwpd5Ene7lFVYgVE0epmFBsfn5s2UO1jINS7zpgHxZEKqzT9qhLjfX+igNk2YQjqbsnny9VTdFYS/nCzzlC7H/KSJs3Gmi
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a4e:b0:373:8c59:d31b with SMTP id
 e9e14a558f8ab-3738c59d5c8mr455755ab.2.1716613863064; Fri, 24 May 2024
 22:11:03 -0700 (PDT)
Date: Fri, 24 May 2024 22:11:03 -0700
In-Reply-To: <20240524201212.mjMDljAc@linutronix.de>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000865ac60619404fa2@google.com>
Subject: Re: [syzbot] [staging?] [usb?] memory leak in _r8712_init_xmit_priv (2)
From: syzbot <syzbot+83763e624cfec6b462cb@syzkaller.appspotmail.com>
To: florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org, 
	larry.finger@lwfinger.net, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-usb@vger.kernel.org, n.zhandarovich@fintech.ru, namcao@linutronix.de, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+83763e624cfec6b462cb@syzkaller.appspotmail.com

Tested on:

commit:         56fb6f92 Merge tag 'drm-next-2024-05-25' of https://gi..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=12817cb2980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b43fd1b132bcf5ba
dashboard link: https://syzkaller.appspot.com/bug?extid=83763e624cfec6b462cb
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=117c460c980000

Note: testing is done by a robot and is best-effort only.

