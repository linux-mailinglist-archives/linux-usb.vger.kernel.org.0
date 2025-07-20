Return-Path: <linux-usb+bounces-25973-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DE3B0B39C
	for <lists+linux-usb@lfdr.de>; Sun, 20 Jul 2025 07:40:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EFA53BEBE8
	for <lists+linux-usb@lfdr.de>; Sun, 20 Jul 2025 05:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D5B19DF4D;
	Sun, 20 Jul 2025 05:40:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49423A937
	for <linux-usb@vger.kernel.org>; Sun, 20 Jul 2025 05:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752990004; cv=none; b=lZi/hoiMhzh2dPpQp8qHTr5jotwKmixA3K8CTvPOmEifAO2Tu68wQgek0hP2fWsgVDOxQ9EWNPQxJfPjkGmzRmfYDOq7oDPe+s9pLofTKjLDuk1xx5fzzmFT6Jc24GTMEBHJ8IEDh+QW1r0t6FaDU565EAPKtb81QmnVrI6GXBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752990004; c=relaxed/simple;
	bh=muXBiYw4vQbbPyc/36SGZ+vL1gjm+ANl+nfMqvCY8P8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ANN91VgSCKXxBPf0G2mVCv28wpajd3Dzu6LB2yrjTjcX6lw6K+VJrFhGML+dnxcNufnSBTfE9Yv2XyZVbfgzAUUfskdMF4VEAQIYbsx3v1auUrSoJ64NzGjPbdiLss9BwK3u3IYScfgHs7q9FQ0d3DkTpMnrcNqrawxOrvF3Xxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-87c30329a56so71426439f.1
        for <linux-usb@vger.kernel.org>; Sat, 19 Jul 2025 22:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752990002; x=1753594802;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=it+EqzfuWYsMFq9XdCLdSOJ8tBw2jdd27CQqoYT+xug=;
        b=ScHGg3IVb++UjRst3+RoNu1VcL6K0duWirwmP8Zlp5ZmkuxkNDi07Ff16QsjlT1+H1
         Mje93iIS7rM6fIYgu7HlEkmtIWapsEZps4SXIGxr9za2EdVh0OWnxGvESYd+3Iw0HdX7
         kBRZV7Ce4h4aYkgmeijl7KMmse0ZQZN9Mpp6g2P3AVkmWFo6jxNc9+sDbeYUXcm6rrkL
         mp+2cL5CYO8dIPct5AFUAWkiLiemTYK30HRPP+C3WIHLcw9Xu3MMQL8wIGddu5XtoQNq
         yUOxQsjISygN610HpaBTIfqBpVZtOON5a4W7YgrG0ijshcss53bE/tziOAZHDMUruo7i
         Q64Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKohR4ZFPg4wjnNoCOnvTq7tCoysQETwogyxM59i/h0cIacsA/xmQSkNksgiKaMhXI2cPO+1b7Paw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3pQOwfkDWOvu3a1OA0vzWUf6WYiS7PXkjXeRhKzkujQwXrYsk
	I5+g4CKG2qdqmdaCK9ObKXWbMKmW6XYjQXztNBmsRMyus3K3LYJ0gkS8ijhAJWEnGrLQI3cNiva
	8noOhMI9uA8EM5AHG+sBFM0tG3De4NTkzRfjj3GNYFF3TXJbcV2sOPkpIRa8=
X-Google-Smtp-Source: AGHT+IGgN2BB6GRD8N6VUWX1hRZtZHmzIvTSk+1awGdOIcIz4cAxue9x3wPqECEvpT1K14rS+tyNyhRgjxk/z3OhYfIQrNAzHECl
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:298d:b0:876:a91a:9098 with SMTP id
 ca18e2360f4ac-879c28f9ac0mr1843494239f.2.1752990002418; Sat, 19 Jul 2025
 22:40:02 -0700 (PDT)
Date: Sat, 19 Jul 2025 22:40:02 -0700
In-Reply-To: <684392eb.a00a0220.29ac89.004f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <687c8132.a70a0220.693ce.00ae.GAE@google.com>
Subject: Re: [syzbot] [usb?] stack segment fault in __usb_hcd_giveback_urb
From: syzbot <syzbot+9a4aec827829942045ff@syzkaller.appspotmail.com>
To: chunkeey@gmail.com, dmantipov@yandex.ru, gregkh@linuxfoundation.org, 
	hdanton@sina.com, jeff.johnson@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, marcello.bauer@9elements.com, 
	stern@rowland.harvard.edu, sylv@sylv.io, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 15d25307692312cec4b57052da73387f91a2e870
Author: Dmitry Antipov <dmantipov@yandex.ru>
Date:   Mon Jun 16 18:12:05 2025 +0000

    wifi: carl9170: do not ping device which has failed to load firmware

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=129c938c580000
start commit:   7f9039c524a3 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=6acfdd5e5c8ef3d0
dashboard link: https://syzkaller.appspot.com/bug?extid=9a4aec827829942045ff
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13fd0570580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17c7c1d4580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: wifi: carl9170: do not ping device which has failed to load firmware

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

