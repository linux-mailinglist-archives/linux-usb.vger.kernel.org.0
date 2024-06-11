Return-Path: <linux-usb+bounces-11151-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36250904086
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 17:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F575B24839
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 15:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400B538FA1;
	Tue, 11 Jun 2024 15:53:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9E738390
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 15:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718121185; cv=none; b=ejPp9VMzVhD9+EgB2zDXS4DxpZpIuBTCVSd9YeicFbGYc2Q4HPnSKBqIWVXsU/fDITnug4FcBQC2BixXUDaLa3/pRZPd8KyJimvMM3LVg7I6GKhdAjjoaVUmJPg00C7Uhi6V5MvAy38DW3hflz5ALlyKokRBxVOjpIVRgLWekhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718121185; c=relaxed/simple;
	bh=4YWTAY4k/NT07i2PrAMgV8Tt2wCvS+q0e0VohlzadUM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=n3n8xup4yq1R8uMTQHjX5but+zw6KxjgeMOh8RqtDouJxkEO2pFCBioeO64j/vpjHBqhc6fWwOfextyaJyLFC10dzLL7xCVsYNUXoFuWo1cuQsTcNqIZaOw5Rm2HtCLWaJH3X9YdLcoJtIhPNUVjvR0H81HbjahRTmX2RXxt8SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7ebb445bacaso120082039f.3
        for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 08:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718121182; x=1718725982;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XFjbHNvcgSLNXhJqn3uZ0hKKgUPVLUjPjtWE4E1qJgU=;
        b=vqLFjXCwPhVDZ9HjJOkK/33p/AqLcghDGd+914K/59ncgEBAszubZaiE0jQtUaue56
         KP1eS+PI5p5T8mI6G+pNx5dZaNcGdt6SHPUey0TNWr4bFmgCF58glQrVHarms0NFGfg1
         D9T+QsVF4OtIFc7KztlcuEjPTBjSC9zPSOm/T6JztdxMO8ml4e+/MlUMpFHZ7Jzvp/+4
         7SXH0LsT5RX+oOU5D9uQ01QMcCLQ38n9msLputMZTSLvUNN3WYBE/neOvx/2BM5OTorO
         PkcYSnVKQ58+2YFP94bvreRl2/GebnzJOqSfw6NN9YMf5EIZBeXfWoWNIO4Lyiq+gCYZ
         QvMw==
X-Forwarded-Encrypted: i=1; AJvYcCWkYFawAdFrtvkZoP5DhtZUECl3Y4XlzBdo7oba4fh2Gn3SYyDSwZaSK20E3sHUjS65ZJi4+kM0VNAxgtymud4MQBcbeMb3fi0F
X-Gm-Message-State: AOJu0YwTD54MV1Z+I5wbUbf6xiaQWBkvTvFhwhIf2ABXaJKFvyMKDxIP
	A/7HhWHzzaPrrW/kmGp44rMAKbjimbtnZ6l2TUR5eR3EgEM3PZG5SJy/n6/JGzzXlF0SehcJta/
	hG1bYtgdxdI+IsAe/CuC/jPdWT2bzElSVETaBYQ2ZiM4+Jwwu8wO5lkU=
X-Google-Smtp-Source: AGHT+IGX4GhvZg4jJi7qIRxkQJLJsCVxY7kkD2G+PAaxGMOK9zdGU2RuivPQudvigA1TlgfuRyax4v+kmchvaBlro09kIzvP63XE
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cd82:0:b0:374:a16b:6f7e with SMTP id
 e9e14a558f8ab-375803c4cd0mr8494635ab.4.1718121182777; Tue, 11 Jun 2024
 08:53:02 -0700 (PDT)
Date: Tue, 11 Jun 2024 08:53:02 -0700
In-Reply-To: <23b1962c-044d-4dbd-a705-58754f0914cb@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c7e169061a9f42e8@google.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=11bcfa36980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3b4350cf56c61c80
dashboard link: https://syzkaller.appspot.com/bug?extid=5f996b83575ef4058638
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17790922980000

Note: testing is done by a robot and is best-effort only.

