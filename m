Return-Path: <linux-usb+bounces-26149-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40520B10DC0
	for <lists+linux-usb@lfdr.de>; Thu, 24 Jul 2025 16:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C58D93ADEC0
	for <lists+linux-usb@lfdr.de>; Thu, 24 Jul 2025 14:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D1F2E3366;
	Thu, 24 Jul 2025 14:37:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698E8292906
	for <linux-usb@vger.kernel.org>; Thu, 24 Jul 2025 14:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753367824; cv=none; b=l3ZDkLjO6kGV1/6t3m6HdGFsmirrVRBEVat4iPkZaHWS2joxJhV6aAq3zT1GAh2tJbw1Fa1Vl2R6zEDyojQQLriA3g6nys4B/qXbZFenUzFVlzVqc1aRgel6wh4lpGMCOj1yBHCeQCyoQWbHElCYP/JCO5qG+OCAZ3bRKlE0Zy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753367824; c=relaxed/simple;
	bh=lrZGovMfzr3uWw6ywdu3gQ7QC2dY2ZiLkUdsg73gBYQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=YDMGbs0g8X02VuvM9M6hpOV0WB3lkyZw0NPEz67SaODgrM4UfofhijU5xOep94tBIPlsRDAJBC3iR6xvutB68L8nXw28fRTEw61/pbkZz2VcTOGIoIXkzil1CB64pad0KheFEJIR0K43ymiVmJe7r7b3/t3I0oIMo8NY0FQPIws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddce213201so11600025ab.0
        for <linux-usb@vger.kernel.org>; Thu, 24 Jul 2025 07:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753367822; x=1753972622;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VnsYI8YKyGb65+gy6ObeUjKR0Rc4w8XZ4XYDxw2JU78=;
        b=Ix3X70yp6PgLxcbE6Xlm01B+gEFYvQLBjT+AH6X/ncyeTcLHVDSqttvLKKAXUWFvKx
         Q3kO2nL719a+NKkOnaAEvY6Z20enCL1l3TEkIrDQW5VoHCpwn//Ya1Dbe9dPmOrsEsso
         KKunqqtwogyFuuKKzmt0UinWhQl6FEMBa6Cxq7UQejEpe+/cgW+6PXYauTgmyjsM7du/
         wkCtgyFz44NF3yOYJPG7CQu7zlryQrVj0Q5B8D+lWyp1n/RbIjIsiVIGqGJNV3rfabEc
         INySVDO4vDmKvsnjyHVShQs9gCYN6T2ykEwNE7lI3w+SMFfQmF4EwIxtFa7LaKtqK/zm
         MQNw==
X-Forwarded-Encrypted: i=1; AJvYcCWoIAsKeEcN2PN7kWUn4mIIlFqoBITcYqBQ45+oCHLmKa5CmOdjohoi/pT+02c8vCDy0inWEm6zVSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzABuSfXUab6zzp1wyS8Kv/J9u3vltxCBQvJVRgTrWVO36fkg+A
	DRHEWyq5OQbFcWcw1+WHFGI4XvUo6I50uP5Hmm+J4qFqIowzkPSD/yHDz6U1IUEJywINg0dC+Yp
	hEwRHeSfo5xot3ZbRkMvmXEcw3mgXbKjsvXpA0FWxDeU0EW3LROydZD7f5g8=
X-Google-Smtp-Source: AGHT+IERoU1yT7l8iHA7Ue4j2KCrPAHlncDFmBiCxEjvwU8YdVsV4w5ZKsyuZX04fkC70WLhUX8b5zz2uwits1ygwE6y0PLFxSFZ
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3497:b0:3e3:b4ff:15e3 with SMTP id
 e9e14a558f8ab-3e3b97cf3bbmr31859135ab.4.1753367822441; Thu, 24 Jul 2025
 07:37:02 -0700 (PDT)
Date: Thu, 24 Jul 2025 07:37:02 -0700
In-Reply-To: <681853be.a70a0220.254cdc.0045.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6882450e.a00a0220.2f88df.002a.GAE@google.com>
Subject: Re: [syzbot] [usb?] WARNING in osif_xfer/usb_submit_urb
From: syzbot <syzbot+4687ab80180e5d724f51@syzkaller.appspotmail.com>
To: andi.shyti@kernel.org, gregkh@linuxfoundation.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 56ad91c1aa9c18064348edf69308080b03c9dc48
Author: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date:   Thu May 22 06:42:35 2025 +0000

    i2c: robotfuzz-osif: disable zero-length read messages

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15b114f0580000
start commit:   4f79eaa2ceac kbuild: Properly disable -Wunterminated-strin..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=a9a25b7a36123454
dashboard link: https://syzkaller.appspot.com/bug?extid=4687ab80180e5d724f51
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=103081cc580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17ba139b980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: i2c: robotfuzz-osif: disable zero-length read messages

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

