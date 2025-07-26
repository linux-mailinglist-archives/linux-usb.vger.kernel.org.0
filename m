Return-Path: <linux-usb+bounces-26220-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B8AB12CE1
	for <lists+linux-usb@lfdr.de>; Sun, 27 Jul 2025 00:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A628B189FCAA
	for <lists+linux-usb@lfdr.de>; Sat, 26 Jul 2025 22:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE2D21CA1D;
	Sat, 26 Jul 2025 22:03:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937021DDC23
	for <linux-usb@vger.kernel.org>; Sat, 26 Jul 2025 22:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753567385; cv=none; b=fxPtsOisp3R17ZI9kMn7PtbwUMxl3z0g0n+oCGsScwht/c0OTlodlrLbeQ+LzrEjtZrKs1XDfFANW276wp5wt/Dsi88oG9tkz3hOYIZz4nFD4ANKU8/O2XE832PXAKm52pV33zZ2/K4jm2tgMa9G7TF4cUtZ6NuFWhcV+V8dpEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753567385; c=relaxed/simple;
	bh=hAIQEa9/wMDIbPrtWnPtN/2kEFN1fDZrN7n44Sn3QZ8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=V06HzpE07QSqq4v0NenARIxet/CQ6bQ5bqQ2oo5Mys3RlB47w9GykHMbtVjgY5P44WaNLU8zRF1GyKlGfluOHx81zk1CRR4pHjz/cK4zoNfu80hYH4mqkkjbeK3gRFez0yWVhV0IT4OANo/o/g69jy1n2WNQ1K1bxxC19eJnQwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3e3d0bcd48fso13880755ab.2
        for <linux-usb@vger.kernel.org>; Sat, 26 Jul 2025 15:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753567382; x=1754172182;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9RK7wGz2vWGFPMqUZLIN/3luuaxzEK1Gxjaz5YHOQ2g=;
        b=tZkp+xT1EDo6ESz+xgrk8aqQ1oO92QdQDnLdsvCSpzL14pTluaqdL+jp2NYxsg58vb
         f9UlF0flj+1J6tpHfvXkmro5wPGXln+hBsG6+8Ek0H10HBZfU6SS9xdl8Rps4t2sfwq6
         yrY+RCUm0ZeprCWRq+xwvDp4ZDz9bcE1eLiv2Dyt7miqVFw6cX0JqOKvS41YW5JmcaEU
         5te/ElNkid09HTMy1zOX2DWqIfcO0dMRqiLykmFMO2J8l+j0CwNnl4lD7n24Lv/HsvIM
         RP6yX4n68Dflg88wpmRlQhe3amMpBL1PQ4tkbrRxmSKgzbNpCWhzc712LRLoiyWFj9Zs
         mIOg==
X-Forwarded-Encrypted: i=1; AJvYcCX+tgBqc6YhsDhY7GSt/0gVdNpVlKCVJLmh+X2dyu5eBT7D5bn+CswhBclheZGl89n6x3n7aVpzxTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxApeRVPkmm9558o6pdgQ79VMPDOj7oLnDmsulzePGUHm8Sh2iV
	spwEfFcT4L7IQy0x0XXgW5b/qpVpKkPq3ZpOkgw40P4qrHtakAyUZIefeRmaBrAwexX29GqAr/6
	5KUmsB4zlzCTTUqwqNB4XAIp0gOX9Hy8MdFUVOu8B4ToMSs32ae5vimxP9Uc=
X-Google-Smtp-Source: AGHT+IGZJC+VY48tFT/D0XvvvPAc0mmUr5HSv8HwlFMtkySwxIdOR6wdI6eArVetLqp+iaWLw0Ee/+zNfWqSm2UgqEfcTk+iLg9R
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12ec:b0:3dd:b808:be74 with SMTP id
 e9e14a558f8ab-3e3c52e6cd9mr103088085ab.13.1753567382583; Sat, 26 Jul 2025
 15:03:02 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:03:02 -0700
In-Reply-To: <20250726204144.107432-1-contact@arnaud-lcm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68855096.a00a0220.b12ec.0033.GAE@google.com>
Subject: Re: [syzbot] [usb?] [input?] KASAN: slab-out-of-bounds Read in mcp2221_raw_event
From: syzbot <syzbot+52c1a7d3e5b361ccd346@syzkaller.appspotmail.com>
To: contact@arnaud-lcm.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+52c1a7d3e5b361ccd346@syzkaller.appspotmail.com
Tested-by: syzbot+52c1a7d3e5b361ccd346@syzkaller.appspotmail.com

Tested on:

commit:         51d4b0a4 usb: musb: omap2430: clean up probe error han..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=103028a2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b3af2d4b01cd6138
dashboard link: https://syzkaller.appspot.com/bug?extid=52c1a7d3e5b361ccd346
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16574034580000

Note: testing is done by a robot and is best-effort only.

