Return-Path: <linux-usb+bounces-15932-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 488BD996CF1
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 15:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00B391F23EF3
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 13:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A08199FB0;
	Wed,  9 Oct 2024 13:59:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A617A1946AA
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 13:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728482346; cv=none; b=QWyM0F0h+yTPHrCIfslip0Hza7dMm/N4Len8fuSgYURjanhbM5CxnxOi5XCHomLRAYR70LwNVvIwH+vxx7OuinEk2Mk2ZeKIzzcZUMJ0i0AtNzSzFzVg+vcuGMjdZQbYECOvlyzRvZjet0y1HTVmkIhxEKYSioHxphUKso4LKh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728482346; c=relaxed/simple;
	bh=UiXOYGhi09FbiLK08wnzmsQ7P0ugRtXYloj4gHvOG7c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=O3CDzR/zMvd3hOKwFZqmO12cRANOvtGdgVEK6FHx3kc+Nx2FsYGZEn6SYVRmOd8R83Y3lwY2+mJa9RgzuNGj4F7TQBBFrsj+v/SDSW5pG8HWy5xaJJzSM0wj5IyyyGN6q+7R2HdI7G1dgIyLM4K/n0v+5+t2slgPR6LYC80AzyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a363981933so98720505ab.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Oct 2024 06:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728482344; x=1729087144;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PcwKS8IZf+tCbxTp2xw2zoEBy4y1bAD9E+aHpLTswNs=;
        b=dTQsRbAXB3U7uvJhs1OGJhHfv93fVy5E8+H5v4EOBmKJs04zs07WYN8T0nIWfkpMQb
         3utTSkOw4CSmcMSLubWBDJgAjh7I4qfawKb53sLPQdkrPZdyYizl7CQLXTYPIokcXEbB
         m0YdlLyaZLVBq9DfzkavVMSk5gCAT+3ijQl/C8HoSMqeW8CApzqKy5eUew39Tgu8pE7G
         JjiPT3MEEaTa5zZlvG/W0/STElJ2HM8E25jafe5rQ4MJS9DnTcNf3etM4G8A2PJ1tM/w
         JVva61qzkc+g4+YDsQtcaWcUSl2ZlhkZrCi++9j5TbaTtqqptWUZFk5TwP+LiVRzImXQ
         81OA==
X-Forwarded-Encrypted: i=1; AJvYcCViGTr4j7u7BYiZbPMA4T1r5fvQWlwKFowJxluHii4AJYMMAHDtl2dM681TuFehEz0HEvMVhD2KJRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyISH7WtadAM8l8CsseaGyxH6jBsccv26jxZPwmZbx5nEFlJx54
	U+gM9E+b6JQfUxtnMll4bpkui5IwbDCfT/X3QHPGazG+ahTaFopSk/MtUumNy2JxkT4J5MJAWn4
	y/Dz2nwvVcbSIykTE6iXk35FXcYAuCcMXbgOUhkbMoVjxMbsOf1hVE8Q=
X-Google-Smtp-Source: AGHT+IG2iYqwOHNqRdBl+b/ZzBo08O8Ucn0EawPGs0yDWydlzNn7igtj7Ti7oEI0KHY5WZPv+49Sn4Sy/o1liIWOlNw5Cdmq3ALq
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fce:b0:3a3:3e17:994e with SMTP id
 e9e14a558f8ab-3a397cfc554mr27815995ab.9.1728482343906; Wed, 09 Oct 2024
 06:59:03 -0700 (PDT)
Date: Wed, 09 Oct 2024 06:59:03 -0700
In-Reply-To: <tencent_3212D5C64009A62EE86ED08C8467FD46D606@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67068c27.050a0220.1139e6.0000.GAE@google.com>
Subject: Re: [syzbot] [usb?] possible deadlock in chaoskey_release
From: syzbot <syzbot+685e14d04fe35692d3bc@syzkaller.appspotmail.com>
To: eadavis@qq.com, gregkh@linuxfoundation.org, keithp@keithp.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+685e14d04fe35692d3bc@syzkaller.appspotmail.com
Tested-by: syzbot+685e14d04fe35692d3bc@syzkaller.appspotmail.com

Tested on:

commit:         4a9fe2a8 dt-bindings: usb: dwc3-imx8mp: add compatible..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=115fbf9f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4510af5d637450fb
dashboard link: https://syzkaller.appspot.com/bug?extid=685e14d04fe35692d3bc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=105e1327980000

Note: testing is done by a robot and is best-effort only.

