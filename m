Return-Path: <linux-usb+bounces-17645-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0F09D0272
	for <lists+linux-usb@lfdr.de>; Sun, 17 Nov 2024 09:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68327284F38
	for <lists+linux-usb@lfdr.de>; Sun, 17 Nov 2024 08:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F69482ED;
	Sun, 17 Nov 2024 08:14:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6A879F6
	for <linux-usb@vger.kernel.org>; Sun, 17 Nov 2024 08:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731831245; cv=none; b=Q4q2fZ/HuUHCdT9Gd+7VV5PTE19m6gPQ2Fz+asB4f4NUw7MFh6eiddSZBcQL1Vxd64kiqEXUCm3sjquKxmW140PsXz3HcI7LauOn9rnzgmm6Gjb7tiCaQ+/aZznsU31opSf0gOzl102LOFxBY9h9pkCHuRJFKR9frEj62+QXj3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731831245; c=relaxed/simple;
	bh=sITDq9pgxV0JGeUE+jutRHugAwm7EjJ+KKPhCIWr8/s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uCZugNq1c3m8Qr5trz+cXNC0mthaE+z+rRxVPNYwBzZmvDCVUwiwpfVzOIKMRGtKQRpyD0kIXvrkkzwxez2BEVWlPzIG5TUT+vh0tD4A5P9HlVLUTeyOnknp0+FfaiMFUtY0tBLHxxeax5e8F6ER5o4n4ck+OR/Sys/M6/dCP1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a6b7974696so12642845ab.1
        for <linux-usb@vger.kernel.org>; Sun, 17 Nov 2024 00:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731831243; x=1732436043;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0cAXStZgVrmvMzECPpPJcbsX24KNDbw/bMwbcFv7apo=;
        b=nQKJzaclQ3wxFxUKpaFon65YlxqfYb/uahYrv5WltaV3gwYnEt/hnPbyJjcO/Uo9ao
         2VZcQpz5xDB+UFCFdzC52r4se+9lNEhyTtq/EAYOtVroV3B1Mnf+EuAHmJe55bxPuED6
         sJALADtk6foFBvOnt145md+0jBgc6cm/L/9YuAQZZ31NIMXRpJs5KgMA8qBHoG1sl4K0
         2pgZqBuNxPGmbTcgFZ93kCSggZKyGnBvs7u0XJFhsd4XqWI6sSNEbjQBVsUudfn+iPq8
         yvGxKdsoZuR9OrmdiapaAr7bFctMxSnh5x+2DEj2CKot8pvNwNwP+Bl3YiVwgIk+rXHF
         FvxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbQ8XdxQF8DITdK4Qi5ESk5o1L/wiUlXhyJmGqGZCpO33EoKo5z7mxBEG2vS7SNzywJiVrxTmuc/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNVVHOgeNCEMWe30tXkZgKM3OXBpaejzEOVJovn8B0RHj9bWO9
	aAXuY4svpQiGhC1teikRnkshFdbXBZmMY3g7yX8tKAtk8lujNZW02TMwF8a7P3ojCaRkMl6/o+4
	vsV1yIG0K4HoScvDFMc50LqHIE9ufjxIX/ukBUOFcH2TRF0rxYE+KYPk=
X-Google-Smtp-Source: AGHT+IFd1nbd3dh0Rhw8u+kcphrA3gBgDy9zioD/bdGdledmXplLVHrzifgX/GQ1F/B2kxhtseYyiN1YIX4ZI/wlZ3Q4qSUI0Xzz
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1ca8:b0:3a7:1891:c5f2 with SMTP id
 e9e14a558f8ab-3a7480031bemr85191805ab.1.1731831243214; Sun, 17 Nov 2024
 00:14:03 -0800 (PST)
Date: Sun, 17 Nov 2024 00:14:03 -0800
In-Reply-To: <672c2a44.050a0220.350062.0283.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6739a5cb.050a0220.87769.0006.GAE@google.com>
Subject: Re: [syzbot] [block?] [usb?] WARNING: bad unlock balance in elevator_init_mq
From: syzbot <syzbot+a95fab8e491d4ac8cbe9@syzkaller.appspotmail.com>
To: axboe@kernel.dk, hch@lst.de, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, ming.lei@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit f1be1788a32e8fa63416ad4518bbd1a85a825c9d
Author: Ming Lei <ming.lei@redhat.com>
Date:   Fri Oct 25 00:37:20 2024 +0000

    block: model freeze & enter queue as lock for supporting lockdep

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13aa32c0580000
start commit:   c88416ba074a Add linux-next specific files for 20241101
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=106a32c0580000
console output: https://syzkaller.appspot.com/x/log.txt?x=17aa32c0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=704b6be2ac2f205f
dashboard link: https://syzkaller.appspot.com/bug?extid=a95fab8e491d4ac8cbe9
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1722ab40580000

Reported-by: syzbot+a95fab8e491d4ac8cbe9@syzkaller.appspotmail.com
Fixes: f1be1788a32e ("block: model freeze & enter queue as lock for supporting lockdep")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

