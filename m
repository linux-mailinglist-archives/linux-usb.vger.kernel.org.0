Return-Path: <linux-usb+bounces-25641-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E055AFEE39
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 17:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E16301C43804
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 15:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA7C2E9EA1;
	Wed,  9 Jul 2025 15:56:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FC72D9EDC
	for <linux-usb@vger.kernel.org>; Wed,  9 Jul 2025 15:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752076566; cv=none; b=h2pBjGc5V6dgl7MmHWvXhzd5Fb8cJAH14OC/fzvGMizhApjldw3QWNVRV0jjRS1NvYozWhKp6rtDTJPLTRwEqIF21csTnJSISZeVeDGH92EhQBDZKsKTeAveYE/Yoj9vcU5elJnRTW1LgNYu8OeabDumeji/osYQOz+TVbkPZj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752076566; c=relaxed/simple;
	bh=Klhcqa0zXjE1jMAuczJtOID00nhS1/VKgAh4s0ac6qY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=J0ot5tlcT7DTCFEd9OaKeGDiJOt5nsm0I1nitlCNy7r4As9xPxAG7YH3C+t1224hS9m2fJkxeLs6ohkl3UU/xaZGIXIXyHAiRLJ28o5eDneYMaKWs1l3BUGY/pYCAsiTb/x2eyZ2QdDd4CGr24JKhj4DN4E/REah6rwmrCrvUCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86cc7cdb86fso10444739f.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Jul 2025 08:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752076563; x=1752681363;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZA6788H/o3UPwVHElcOp7R8jW6eULSWFdSmHy0kTRYk=;
        b=a7wfEJrMjoypmHBUN+RCNs1Qp/3P9y2dfijhh2e1Se7oWUoqgWMY1nzylqOGdURrWA
         4XSXlm4w9YC7vd6EPwEmalqlq96c6JAWQu2hAgKywwxdtZIv7fGtU4uv9BCz/0v/fdVW
         wdw6ouOg3H1U2SxVeJvuAP94YZizihYRt4dLqVFB897hpN8peT1EDHSCi+uctoOvLRfg
         Ep9NQBGo/MXrrZEK/6MoK19mj07Q8szY5tVbVBkEGOUbskHVGfhDjzVSNm0ry320TsmH
         8uqlbEIrUjQ0koog/JNSbOrvTQoj75ubwVyfrkiNIYHupGop7DzSni+UdoypCS4ytLpz
         mntw==
X-Forwarded-Encrypted: i=1; AJvYcCXY0yu8IEIylBZXov6Qj+U4H933Dv8ABPj5sC/W3QQJL6GfAT3rgbFxMTy1GR883k4F23S1lw9p0sE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxanO+4+Sh+6f/fjsCm+YMl+9yfzQHMcZ9ERdGya0U0lpdEG20H
	R1P4gjgUchl9BoYcVsg/vNVmVrTCz/OCKKSWc+eaOz9H/3M5NYMRJrDh9nuOKxhFPvX5FEgFdcE
	+dY/r+H9imp3EutVk9jGBnNaduIqHDNOBBDr0KW+vbgjTziQTaHOz5v4xhqQ=
X-Google-Smtp-Source: AGHT+IHMYgVqoKgL7WaXTj2pN1Mdf52GVHjXjp6h7wMS57lXGHBOyXymkA/DWtdO3E5Hq+lBFpPsgwQ04QJsgHUr9H+vfOMSG0RG
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2dd0:b0:86d:d6:5687 with SMTP id
 ca18e2360f4ac-8795b0c7254mr416874739f.6.1752076563029; Wed, 09 Jul 2025
 08:56:03 -0700 (PDT)
Date: Wed, 09 Jul 2025 08:56:03 -0700
In-Reply-To: <5644bdbc-8449-407c-8e0c-e725e10a40f1@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686e9113.050a0220.385921.0008.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-out-of-bounds Read in mon_copy_to_buff
From: syzbot <syzbot+8258d5439c49d4c35f43@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+8258d5439c49d4c35f43@syzkaller.appspotmail.com
Tested-by: syzbot+8258d5439c49d4c35f43@syzkaller.appspotmail.com

Tested on:

commit:         d7b8f8e2 Linux 6.16-rc5
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
console output: https://syzkaller.appspot.com/x/log.txt?x=1155ebd4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f51185bd4f40ad44
dashboard link: https://syzkaller.appspot.com/bug?extid=8258d5439c49d4c35f43
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1113ff70580000

Note: testing is done by a robot and is best-effort only.

