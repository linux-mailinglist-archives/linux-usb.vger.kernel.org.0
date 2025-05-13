Return-Path: <linux-usb+bounces-23921-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8A2AB57E2
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 17:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 113641B40BAB
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 15:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEE12BD00D;
	Tue, 13 May 2025 15:02:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369A71C84CE
	for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 15:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148524; cv=none; b=eoT8osau5e7njtLWisruwsd5SfJBV5wgddML+jsiSQdaU7Of0wXI49DnU0MhBNehuys96wieqG/xsYy7esUYGAfMOS/yx0n8eeP6YcxwqlG8plF5VpaXKlS9+e5tqU3wnKbMBh3ChYMnpvdLUTAjO5oMsl5M4JZORW3KqxaUSH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148524; c=relaxed/simple;
	bh=hP4PegqdC13RnAQ85+yUWVwc7+/McCk2lZDiw5UO/Bg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=S2bd37ahBObGOBfg8dstoGrttxB2mrZC5bK1Bf7bvMI9jYvA11DThsBwA4drklO1z1+x9sKeeFNUkB7hdQzNmiK9KNd+QrtesQURMEq5otPpRl4liCN86UWriu7UHcQYVJXDIhBUVIIexyoPKWEsKvaOEjP3R/6Uj3VgZ85GilM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85be9e7bf32so997394839f.0
        for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 08:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747148522; x=1747753322;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRCw3Vnmu98ynSRU7dOHd3K3QYDecyR1q9zxGNfhk6k=;
        b=Fa9Uc3uFEcPNREaOBFRMMYKBP6cwLAx4u2BI9hJPwn++IZWajjFLy2aKKNRZjc5Y66
         hG+P0VAmFCfgQjXyfUN3b6t7u6+BWFsy/XLe9sDupCXP6FDJGkQPb0hoCc+y574JWN3R
         8IDSpX9kPNIckhbRgI8SD3KtG1wh1HTE9/HVml7kaBxlQ7DHoa3zbXi6QxcGdDnR7ORa
         X1HUAD0pZWTw7+m9U433YGExLRkzMYCxf1RNoNyq1uCO5gn8/u49AJokzXBHIkKvfXuz
         ZFTEwVac7j/UY6IQL87T0KK5NCb7pgVmxW5wXdjKkRiaR5pVrVwfju4bpDanALs8W0S0
         kOSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE6wHDLJ1NUCL5bWoWaOtfltZmSQwWxMh4cxZPd02gzdFreXUGt/ir1iLJdvfWkZOsDWE9+9zy3eI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHxQo1HyU9nqvIMe17k0tBaMUn8KWkHjACgXY58o0yfrGmfxur
	ayzRLq05MGkPWhdk6vZX1/7Cyd+9KNPi+8UGIS2owNH3teeNRPHfm+McouweiENIcFVnBCnxrJq
	xMJVHKX++FPoP5A9mQft5yXNtiORktvSSdcv9KRsECgxcMcy7lTd2U/k=
X-Google-Smtp-Source: AGHT+IGMtQ161tXmf2KXLsHZBWzf4It6/o3Ywvnbm9ZKDK/irJkDeLwoCqMl97LC/tlvDAtSX5MOkOfGHaXSl5yf56Ur/aYT6NLX
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a6b:da19:0:b0:867:63db:8e4e with SMTP id
 ca18e2360f4ac-86763db8f38mr1628657039f.1.1747148521963; Tue, 13 May 2025
 08:02:01 -0700 (PDT)
Date: Tue, 13 May 2025 08:02:01 -0700
In-Reply-To: <000000000000453f3d05db72fc7e@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68235ee9.050a0220.f2294.09fc.GAE@google.com>
Subject: Re: [syzbot] [usb?] [media?] KASAN: use-after-free Read in
 em28xx_init_extension (2)
From: syzbot <syzbot+99d6c66dbbc484f50e1c@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, hdanton@sina.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, mchehab@kernel.org, 
	paskripkin@gmail.com, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit a368ecde8a5055b627749b09c6218ef793043e47
Author: Alan Stern <stern@rowland.harvard.edu>
Date:   Thu Jun 27 19:56:18 2024 +0000

    USB: core: Fix duplicate endpoint bug by clearing reserved bits in the descriptor

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12cf6cd4580000
start commit:   cd802e7e5f1e Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11cf6cd4580000
console output: https://syzkaller.appspot.com/x/log.txt?x=16cf6cd4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=91c351a0f6229e67
dashboard link: https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=143a7768580000

Reported-by: syzbot+99d6c66dbbc484f50e1c@syzkaller.appspotmail.com
Fixes: a368ecde8a50 ("USB: core: Fix duplicate endpoint bug by clearing reserved bits in the descriptor")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

