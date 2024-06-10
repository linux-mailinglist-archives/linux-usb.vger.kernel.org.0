Return-Path: <linux-usb+bounces-11082-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 075049029C1
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 22:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84E5B283510
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 20:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9AE715098E;
	Mon, 10 Jun 2024 20:12:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EFD14EC73
	for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2024 20:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718050326; cv=none; b=n8AZ24B6Pkk8RjRhz3ZfSXbiOh+Mw/1wzDe/wGql+0LvoI14RbWH9P3Ze8/GWVR/cxODGc4F3qKzoevSzIYXq1D+8TeJ1mf4YoYgexytcGjN9nGYT31satmJB4H4dmsO+ruTR4TdiJW3d85frLbUiKGNmoFro3wu8S/zk58UPpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718050326; c=relaxed/simple;
	bh=mp1Q78UwSSe9n2Y0sLLqPNBBOSPg9iabbMrlvqKMXtM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HC1RUtDEP67EAAFEtiO6gD+K0+xC0GIS2qVl7iuLy+ZVBMXFIJhgn9qxvNDcOEgh8Lh2RR2BkH3+yQ2PcdHLRDa6wQyO1DVaT4ylb6IdKxG3jTROg1vhWJPiVcE7vQbqIP+8teTYe5dLL5ebnAPXh0ejWD2afK6HO1U+1IJVyow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3737b3ee909so51931805ab.2
        for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2024 13:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718050323; x=1718655123;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9hYMnibR7DOM9ET3noPinHJRffU48mMLpItbsVsUdkA=;
        b=uza6vfPdBF5LYbW+Jq48TVQdKPw6s7jJ6rSmNuO7OX3Nrfbii9ZL4CUkkzXWdTYjXE
         Gl6cgbjaCfJXR4pozxSN4YdIACRZ8tv9NSotjB/Gm7C6UtD0uAQmsTpR5TNgpGWp+Fem
         qW2E3O3wmx67itY8sGSdqmtzgh4QIDPkmnGYR3EwFdEyB0VT77HIYmIpaRSwAw0WbzZr
         YhzBuT4DTfxIDf5aqKUjkWgR+DNu0JAh8+A1fscPInrtjhWojM+x0tIZ9sBGcxnssXhh
         seurXr1r+++BOhqWWengxGhWDyXPk0nMeDwWpxBeb31172PDGg9P/L6wigIHhgZN/g3y
         pBjg==
X-Forwarded-Encrypted: i=1; AJvYcCV/mYZWDmQmeeDTVanlGMD8kgPboIY6szfAk4FcC71rjj0Yd0zJ4WRq/afGmBFG9KA2wCSDvbouOax+fHA4dU1mCbY3JTLtDTJW
X-Gm-Message-State: AOJu0YzaThiws8cCSTr+fRzaCKZzF0tgmMNloxz5trXakcjoAxIBj/pe
	GGDu7k7zrl1IEam63KqL4odQHjjcvuBVb0aXyRRqoG7a9I+/dukrBer877UN0kRYTPWwVdrg6ln
	dysUwHIhKhI41n8xG/5FcL5idt4e1GJyJsNq9rE7lLaCjjOVR9dIQ1Q4=
X-Google-Smtp-Source: AGHT+IHJIpXmPJOEopzwZPN1wIDxsmWIFZqWwbZA8jsx6RcBPzv0N+h9ogETA+tpiIRvciHoELcRoUZXh3CZfbnibv5SqdjZE5oT
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aa8:b0:375:9cb9:9d04 with SMTP id
 e9e14a558f8ab-3759cb9a138mr4169745ab.3.1718050323192; Mon, 10 Jun 2024
 13:12:03 -0700 (PDT)
Date: Mon, 10 Jun 2024 13:12:03 -0700
In-Reply-To: <c3073a8c-bdaa-4123-ae27-9143d916a701@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000386b64061a8ec33d@google.com>
Subject: Re: [syzbot] [usb?] INFO: rcu detected stall in raw_ioctl
From: syzbot <syzbot+5f996b83575ef4058638@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+5f996b83575ef4058638@syzkaller.appspotmail.com

Tested on:

commit:         8867bbd4 mm: arm64: Fix the out-of-bounds issue in con..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15f51bce980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3b4350cf56c61c80
dashboard link: https://syzkaller.appspot.com/bug?extid=5f996b83575ef4058638
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=151b5fce980000

Note: testing is done by a robot and is best-effort only.

