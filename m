Return-Path: <linux-usb+bounces-10241-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F3B8C3626
	for <lists+linux-usb@lfdr.de>; Sun, 12 May 2024 13:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E2131F212C8
	for <lists+linux-usb@lfdr.de>; Sun, 12 May 2024 11:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3F220322;
	Sun, 12 May 2024 11:05:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12E71CA9C
	for <linux-usb@vger.kernel.org>; Sun, 12 May 2024 11:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715511905; cv=none; b=MJnt+7jpld+BBbYhIWgxPoF2EZJDcdJ+bGyYG6AmLCEjJFHz9PY2oKuUgRBlPLoSQo5ohCofYcc1wr9a7zRa3+0CtxI3NOmrLpuix+m55PJsMSe9Uvlxtj21faei5d+wEnrZbAD2FpCnHrmBlK6tTStMrVgr4+HmUFMEfba47e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715511905; c=relaxed/simple;
	bh=jYig5DgAOcqBHrE0/9+1Mu2F6/2OlimOLVdZNsXTNhY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pW+uoA3KRcyZ3LzVcymzNbXKxFk3SJskFdFwzYvlLtmXilLzidOzAQCkB3G10WCGiLHNrjJPrF7LbOMpZitgmBaONSJtQ0AJUmF55+hisjw41H6/Q9YJ27YIYGHKs9BcCsEQaVnU84gwlskW/LGxVw1PAHozL4zU1E1w7xpqoEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-36b2eee85edso48531395ab.0
        for <linux-usb@vger.kernel.org>; Sun, 12 May 2024 04:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715511903; x=1716116703;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1AzMq+CA5JeAen4yA3wRsZUlx1QJVPYX6wCmrtep2Os=;
        b=iM8hZ8JTnpBIFXTdlDUW9bjlATbG/RtZu9T/vfb/Kk/R3HKJcmU8T0I4k8z5rW3TdT
         vDfWYZYUPP5M3rjbFBN3GOTP91X+H/3y2rbNUajaCSlHrUy4PuVlVrnISdNkHVQBnKeF
         8Ldz/Lhs1Iex/FR7R3gkpM3ztpdsZfdpFWpSPz9Gg+H7MwxkcWgH7C9eq6h45dFfP4sG
         uP/Hb3lXoOWBZuSsmadqV3Z2eWG3Zz9jQmEzVD27/CkYX02D6gotkijDbP4po1ql37i3
         wK4iahu3jFXNM+RUlbdyN+NzfuJ7ESPDuGqk4mP0BKPSrmb6krKSD1yRYQkVBTMOS/Ha
         8soA==
X-Forwarded-Encrypted: i=1; AJvYcCXtLY6rFQtVRsXIsZQKMzUNHAOVhq9o6Cf2YsAea9O8N6bxpNR1Cze5iQoJE82hap/8p707NqKZVMlYspufwRLnOXsaa4kRDmEd
X-Gm-Message-State: AOJu0YwwZObfp6tSPPtnrFSmSHHkmqIkPylgJ/ssCEodlYgKiSy6lDD0
	V9j+80l3QMBbscXboO0thrmqcQKXto/ZZx1mc7PkhOrKMJYyoB8FiVhNzqdHX1pX4iMOCUtClG4
	dEVJYPjnbNMqD4ySsRDvCGb3b2JjsWEkAPsrJtoTfbrDYEGblv9/UPT8=
X-Google-Smtp-Source: AGHT+IGNjREMwQGltAFiKnu2rdMUsKA/x7WehSP+HZJj5UV4BdfJukZuMBf6IpPhE0j3eAVYtBhejK+D6fNrUTJJVVE3zNpl+ZoP
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:d152:0:b0:36c:4457:ca5d with SMTP id
 e9e14a558f8ab-36cc14f785bmr944215ab.5.1715511903210; Sun, 12 May 2024
 04:05:03 -0700 (PDT)
Date: Sun, 12 May 2024 04:05:03 -0700
In-Reply-To: <0000000000008de5720617f64aae@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009966ab06183fbd83@google.com>
Subject: Re: [syzbot] [block?] [usb?] INFO: rcu detected stall in aoecmd_cfg (2)
From: syzbot <syzbot+1e6e0b916b211bee1bd6@syzkaller.appspotmail.com>
To: axboe@kernel.dk, gregkh@linuxfoundation.org, hdanton@sina.com, 
	justin@coraid.com, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, loberman@redhat.com, marcello.bauer@9elements.com, 
	rafael@kernel.org, stern@rowland.harvard.edu, sylv@sylv.io, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit a7f3813e589fd8e2834720829a47b5eb914a9afe
Author: Marcello Sylvester Bauer <sylv@sylv.io>
Date:   Thu Apr 11 14:51:28 2024 +0000

    usb: gadget: dummy_hcd: Switch to hrtimer transfer scheduler

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12415cd0980000
start commit:   9221b2819b8a Add linux-next specific files for 20240503
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11415cd0980000
console output: https://syzkaller.appspot.com/x/log.txt?x=16415cd0980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8ab537f51a6a0d98
dashboard link: https://syzkaller.appspot.com/bug?extid=1e6e0b916b211bee1bd6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15661898980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=161a5d1f180000

Reported-by: syzbot+1e6e0b916b211bee1bd6@syzkaller.appspotmail.com
Fixes: a7f3813e589f ("usb: gadget: dummy_hcd: Switch to hrtimer transfer scheduler")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

