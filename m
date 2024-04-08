Return-Path: <linux-usb+bounces-9058-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2173589BF78
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 14:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D04E828721F
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 12:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2E27173E;
	Mon,  8 Apr 2024 12:51:48 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E656A348
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712580707; cv=none; b=kFBHPKjdtOo1w1e2dZdxRTMdWW36myMAHONFEpwxTylxENKOSNqC+nOsQmZPH37WOdG39vuzVQcHptV6dKLyDz3T5PPu6OK59NdXtr7Om/WWs1mPUTl1wo6NPdaJG1ugs4FxQMxvHvKy2DF0sSbH1jf9C49ngtoqTAKjWCRw3C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712580707; c=relaxed/simple;
	bh=UlDn3u++VeRTZAzlozVhYrVIfqq8x5y6K4ftZAsXbmk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=bHxVX15t6F2DbW8/jYdNXBwkTdPlgqpMaSka9Tnsf9fDUcqosRPiDaDe8yf1smVdjD/gOrZTKWl7y990v4QzbLITzitVoVjPIpG+D9xc5AOtA+9k5S+fZAN5i3+djxUwJ/aLnuPnbp8HrpVLXtFvfDVkUHYDi6RO71rm1JyIcjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7c7f57fa5eeso360053739f.1
        for <linux-usb@vger.kernel.org>; Mon, 08 Apr 2024 05:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712580705; x=1713185505;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7h8z+6KiyxOrExyagXtxcsJEsWxSoMptUt8KwlryBoo=;
        b=lkNyXeF2aLJt1a1ypfnTQNL7/aRNnrb5kNh4/U9dJ7aHze8klsI7it8j228mzMq0A7
         Lqc9EkTezVaNXEBMdY3LyG1Wo+22F0wD+ijFifESviRNF/rDnI692DGaLu/ExbhRtSmx
         qTibXpccECGdgnhzgG3/bm9y0Wrh3Dp7LyjkcEMwEfzdoMnRMrA9YM+J2li5Cdyxs64B
         M/EYcqJL4YmWolR6lEz/yBksvGl4ceShAalOwaNPjBaE5d8lZ4mJgHWeJTdQwmFVTArC
         svPYXk77l+ZalmznRtQyZU7iWskk4CX8jYvzKRAgyrPZvQojU7sdxE9OSVyisQDKWRsx
         SVKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3XKUUzLuPuElKkrllAFbLWMWe5Fa+nbal4Xg6WAKGfM3MHhVpU7Dmrh+E1GnwNmNh1ux5yqvImJBYhV0lXi0Hx6ROGvAnKaXY
X-Gm-Message-State: AOJu0YwE4cbsnMQq9T33ZGiVZQAIqDyBkXuG6lrQ0tj6+KFpCF3p56zi
	qG1a8I8s+6HWkal4D0bYqO3byzocoimYoF/3zn306PDFQ0tWuRH08Z3pqa1LSvswVg9kOlM5Zxy
	zKMG6mMrKmR+D+Cp/X8Gd7MGHXkRSVsWViorNPMlZ72rzN6sJ9rZjvww=
X-Google-Smtp-Source: AGHT+IG3RXDgu1mZrMGeacXrivnfLnJeUxeVWoc6ktafOUWjoHbP13kwuCJYGVN0ahs8jANM22OwW6DLXaUcyHwM8k8ppKipmGoE
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2488:b0:36a:20a2:e493 with SMTP id
 bt8-20020a056e02248800b0036a20a2e493mr335683ilb.6.1712580705601; Mon, 08 Apr
 2024 05:51:45 -0700 (PDT)
Date: Mon, 08 Apr 2024 05:51:45 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009b56fe06159544a4@google.com>
Subject: [syzbot] Monthly usb report (Apr 2024)
From: syzbot <syzbot+list56b350aa6b0ae73ad4c4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 4 new issues were detected and 0 were fixed.
In total, 72 issues are still open and 332 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  3410    Yes   WARNING in firmware_fallback_sysfs
                   https://syzkaller.appspot.com/bug?extid=95f2e2439b97575ec3c0
<2>  2870    Yes   KMSAN: uninit-value in dib3000mb_attach (2)
                   https://syzkaller.appspot.com/bug?extid=c88fc0ebe0d5935c70da
<3>  866     Yes   general protection fault in ir_raw_event_store_with_filter
                   https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
<4>  621     Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<5>  401     Yes   INFO: task hung in r871xu_dev_remove
                   https://syzkaller.appspot.com/bug?extid=f39c1dad0b7db49ca4a8
<6>  304     Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<7>  274     No    INFO: task hung in hub_event (3)
                   https://syzkaller.appspot.com/bug?extid=a7edecbf389d11a369d4
<8>  225     Yes   INFO: rcu detected stall in hub_event
                   https://syzkaller.appspot.com/bug?extid=ec5f884c4a135aa0dbb9
<9>  195     Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<10> 189     Yes   INFO: rcu detected stall in syscall_exit_to_user_mode (2)
                   https://syzkaller.appspot.com/bug?extid=a68ef3b1f46bc3aced5c

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

