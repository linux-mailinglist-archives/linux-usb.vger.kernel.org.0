Return-Path: <linux-usb+bounces-12491-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9B493DADE
	for <lists+linux-usb@lfdr.de>; Sat, 27 Jul 2024 00:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7474D1F23BC2
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 22:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5111F14EC7D;
	Fri, 26 Jul 2024 22:57:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880E414C5B0
	for <linux-usb@vger.kernel.org>; Fri, 26 Jul 2024 22:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722034626; cv=none; b=HDW2euibCFOQg+Yyqoo8OBFwm1LgnDJUUAgiQfOAT9AMAiuNMo53GPLzCY7o0S3YCLNGRSusU0a0PdogJyL4W8Tg3iWjNTjqX4dXI/qppv6rh2kvVghpPSjE2vTQJxgASwCnoW74l0um0/qcO+DDTaXvhm5iwONBg/gQZUqG36M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722034626; c=relaxed/simple;
	bh=UhWI7TcLxejpJoI+IfqhEmkIioV4bu09QRF+kzi+Euk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Bq0jeNdm+sRGQyqRnhv+A+HwdjgYcod+SzEJYXv3GXKK2QAl5yQy7lqTeI56nTWz5Ix6glPKMxV+SgxKu7e4mkxyFYmlLuJplV7yo/Ez81GaZgaXwtKCjnva2icVpRN8bkY+Uaf0QOviQeJmanpDuqqeppp0EXZCHA9Qnudf0b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-39862b50109so29891945ab.3
        for <linux-usb@vger.kernel.org>; Fri, 26 Jul 2024 15:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722034624; x=1722639424;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hfHEsQdhoJOdt0CYCZsm++AlvwlAzWoJHsIj6s9Xdbc=;
        b=Ke1OM+lMpXih2MPcg9X1hjuHQ7oHbEy49Afk/SX1r4sXA+8DmQCFs7pj3P6teAiGSI
         SBzQ2eWsbcO2ZmBrd+65gipZ+uo+ZXxLxPqOWmsIAnNDgJsCUIOGKOhNowVc2G8jSOKv
         62+NfTmTF9Wky1r7aF9+EcYk2qtavXcG7/hQcLpwVJtrdQW3N/VhCul86nKqHihKEtS4
         J7J+NRdcF+2BfBhXhnzK9PJa115d/E9e8uBBeBk8XCRlicgn3oXUpuIvleaGSjEVucCw
         tMY9w0YPQOSjEbvpIkhb7MTXsE9zlyNbR/oNkCzdhoyJV0oSuQDSj4hl5oDHY5vHFj4w
         hW/g==
X-Forwarded-Encrypted: i=1; AJvYcCXDxltYaHbImpaROLRhIHUZ3VZ3PwXVn86ukYKHZYlAcb+WiKXJLPOzXGw7dgWLBICsTQRubhbRkg6wAmKL9CqfrDpZqZeucafM
X-Gm-Message-State: AOJu0Yx3uGNAosbb3bpieQ1fBCuhEui15tX6tDLbPVt1WRCUqtPOj1kb
	3szuXAd5X30t/cbeENyWiBao1NNrikp2+Y0IMkidfz5Bofo4UXYrZXUkFT4QIqQ+/jQOn+beVAK
	6LcmxdGlFbqHIxCrfqra8t0cnfAOCGX4bhzmqdAqvLgBBZlcvPCKHws0=
X-Google-Smtp-Source: AGHT+IH1IGReWJjnZICMOV9b++BLUObuYL6w4gT4mDFAVD0lxxD2JZLW2qTvQ0IOykja3TBds2LleQamC0YuWT65jexcIA8WcgEY
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d1d:b0:397:95c7:6f72 with SMTP id
 e9e14a558f8ab-39aec448e1cmr647105ab.6.1722034623729; Fri, 26 Jul 2024
 15:57:03 -0700 (PDT)
Date: Fri, 26 Jul 2024 15:57:03 -0700
In-Reply-To: <0000000000002b27c60592b00f38@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000009e19c061e2e6e93@google.com>
Subject: Re: [syzbot] [input?] [usb?] WARNING in implement
From: syzbot <syzbot+38e7237add3712479d65@syzkaller.appspotmail.com>
To: andreyknvl@google.com, benjamin.tissoires@redhat.com, bentiss@kernel.org, 
	jikos@kernel.org, jkosina@suse.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	n.zhandarovich@fintech.ru, rientjes@google.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 4aa2dcfbad538adf7becd0034a3754e1bd01b2b5
Author: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Date:   Fri May 17 14:19:14 2024 +0000

    HID: core: remove unnecessary WARN_ON() in implement()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13a010d3980000
start commit:   b9ddbb0cde2a Merge tag 'parisc-for-6.6-rc5' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b89b61abf7449972
dashboard link: https://syzkaller.appspot.com/bug?extid=38e7237add3712479d65
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15eebef1680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1375f9ce680000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: HID: core: remove unnecessary WARN_ON() in implement()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

