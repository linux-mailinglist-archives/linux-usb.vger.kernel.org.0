Return-Path: <linux-usb+bounces-6748-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5876A85A465
	for <lists+linux-usb@lfdr.de>; Mon, 19 Feb 2024 14:10:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A9271C2371C
	for <lists+linux-usb@lfdr.de>; Mon, 19 Feb 2024 13:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE68364AC;
	Mon, 19 Feb 2024 13:10:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F9C2D607
	for <linux-usb@vger.kernel.org>; Mon, 19 Feb 2024 13:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708348205; cv=none; b=SAQe+Kp6a9ECQVqHukK0B6kJNOD5kGuMtFu8rnKosfU0Dvd/ibePhRC5wyIw+0qDKO622zCnbMjUxYgw5aXwQbwLhmWoWX1OFpduBaFILog0VfnOx80amo5+BhbyV7JeBb3gzfb1+rJ1o8FgBjnFMWBMfSYG5Ypa6Wj3cr8doAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708348205; c=relaxed/simple;
	bh=6biU2L8B/V7conuu8Ja0RqbgynGZas3q2ELFDjoWe9I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HHfT0rEMmtzdeNCx5RCusuk4RRP8x3GkbsdbgkVZGVUXnoyAd+L2obLnyZbdq4DeI2hu6X5peFoqCwAcOojwmfJloe260CM/i3rV9iZVpJ7LKVtAxI3UEkIRv4N0q+24ZOe7Dmpzv/tN/VJjbpxQW+a3TdQg8OIXIvyjDANBAxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-364ff869140so30220475ab.2
        for <linux-usb@vger.kernel.org>; Mon, 19 Feb 2024 05:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708348203; x=1708953003;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SDiM6XZIafcYqC9Ci7EigVOUHJMlV0bbSuptTdR0jkE=;
        b=Bs0ReWoa1zTyTyRvmL3YiqGXGgboE1dpA+Pie4T3U3ORMxLV+apyURF/J9Gm/hRjys
         E8L1KW7/7OGCpoeR2bbmDd1nfkWlwcjtpZVZ3xdilswB6+iQ1jXsattWCr9rrL/HOHP9
         Z8Zw1bTQO4UzTOdZGujTDHl3A13tGifKdeZsHK/I1OLu3ctuPgMsTQikgqIPbCJmvk6b
         jBuiwlpV4vuODmGswdZGj/04FmmKMvuiGbbAWivEUr0Y+Vfhfofs+oVuSYliFtBYeSow
         8YJVRc3NrKG0E8d9WgqMme1i8WWjp7io+JrKEGOGarPmIzkWmoS6STq5lvBhtfM+XGWj
         lPXA==
X-Forwarded-Encrypted: i=1; AJvYcCVtZoPUxyIIFpIVFlEiYYm3cc4UNMQVpfR2FN2OTG6i/wY9l1kaSyFgAr7LSUkrD+sSHkxRwYeY/kugP2QRSAshNCyS1CehIfpj
X-Gm-Message-State: AOJu0Yzs9hFUGFgNdio497n0kNBc7U8SWEOsVTkbG7895QvbjPKdpiB+
	CU5CE789fjMfIGJZuSDNWAdpHLHVrcl/TWsW2w1LfZi0xI53rLPlt06NJ3Y7YqhC6HmxyMHsFd5
	BcoXNySo1a81h9a2hByKmvdBGxvI026dqs+GYAnV6dU66ryNgI/c/sw8=
X-Google-Smtp-Source: AGHT+IF6TLcgpBQRPhRX8L09PDGE2CYgtM71N6waCHlrqv3vgJCX/1zRjvQEqZxY2d/3yRVs9Vor2ZAaNeLYh8ivM+AaJxbX7gXf
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:154f:b0:363:9252:ed47 with SMTP id
 j15-20020a056e02154f00b003639252ed47mr1114563ilu.1.1708348203022; Mon, 19 Feb
 2024 05:10:03 -0800 (PST)
Date: Mon, 19 Feb 2024 05:10:03 -0800
In-Reply-To: <0000000000008b96230610c6b3fe@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cb40790611bbcffd@google.com>
Subject: Re: [syzbot] [usb?] [media?] possible deadlock in vb2_video_unregister_device
From: syzbot <syzbot+3b1d4b3d5f7a358bf9a9@syzkaller.appspotmail.com>
To: benjamin.gaignard@collabora.com, hdanton@sina.com, 
	hverkuil-cisco@xs4all.nl, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, 
	m.szyprowski@samsung.com, mchehab@kernel.org, syzkaller-bugs@googlegroups.com, 
	tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit c838530d230bc638d79b78737fc4488ffc28c1ee
Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date:   Thu Nov 9 16:34:59 2023 +0000

    media: media videobuf2: Be more flexible on the number of queue stored buffers

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=166dc872180000
start commit:   b401b621758e Linux 6.8-rc5
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=156dc872180000
console output: https://syzkaller.appspot.com/x/log.txt?x=116dc872180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eff9f3183d0a20dd
dashboard link: https://syzkaller.appspot.com/bug?extid=3b1d4b3d5f7a358bf9a9
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13ffaae8180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13ef909c180000

Reported-by: syzbot+3b1d4b3d5f7a358bf9a9@syzkaller.appspotmail.com
Fixes: c838530d230b ("media: media videobuf2: Be more flexible on the number of queue stored buffers")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

