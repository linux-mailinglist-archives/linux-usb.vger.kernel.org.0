Return-Path: <linux-usb+bounces-16341-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 630B29A0D8C
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 17:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2896D28262B
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 15:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DFA20C492;
	Wed, 16 Oct 2024 15:02:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A7F15665D
	for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 15:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729090927; cv=none; b=SARKOBeEWjTrQ7VGYQ0hl0CHtKpwqgGMtdwCq0Hxwb6ViUjzTPf/W3StoUQsm182Fb/rE87BTrpFiK6DvywjKOBdBEoFPMUPy48ye/2giJMf9JlSDGI6uukkNHwRXu/ZNV6pYg1gZ7FRa0VeKSBePiyozisww6ctYcY8ZnULoJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729090927; c=relaxed/simple;
	bh=+KNXnCqiG7faN+ZcgUsLe7oMHjE1md1OEgScr2PZufM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ID5+Ik7Wpf+gI3KyFSlUEtgVPBAIEqv8k4iHV5e1cIfefAZdLbtGOeHKYM1T2aSr3TEHxyWZU+Aibwx6zXGXKuJeI3wQYCHHJLPohrf5jHv1AlarY5908W/DLunTOe8VTnOlsD8LFL4fwTqbqxlhSe4dzBoS/0kiumjM7FrOkr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a3ba4fcf24so52145485ab.0
        for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 08:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729090925; x=1729695725;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdv73cVXo3QjIFgT/fpIR2pi/lnO1Xr5ZnL+OJ6/H9A=;
        b=FEkeIfQj3aC6bHaYPPyDCIO6SO6d5FxWSNd2sJ/o/bVn9Sv0aQpf+K8FKw0K8u8gdw
         YFWQmzK4CugRYV5XYQAAgR/OU3LhAykhASKfmFNLx5VvtamK9ePM4aU0EQqTNFZxzy9T
         ipEgNX2g6IacwsRX1/kwMYaMWG2c+vtSB5M1FkKCkfkM5b1zB0k8F2Rn+qTBj+rCRWIf
         F6rbfSUYy4obCrij00dzlnHy3JYqE16CS3dZL9VgG/Za2ZA86J9brpIPXecW3HElBrOX
         6X+e2x1E9vrn1dG+E0WjZPCRkgjfbIVS4V9nSwXx7eUNSvs04AsHcr1CD5IJ/F3WLJyh
         mu7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW81vixCuy0WIIh5xCly0tzhY9I2NaTWdwOwDoy8W0jK4L1wzdSXPDZtxr2Hh3LtuOXMJkkVe1N9BQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgJ04QvAa06UuSPrGTBPlOjhqz3h8TmxTMjiGW0XhEnxFnov7p
	+w8Q5WX4cbrU6AX5/jYLnk7Nn5aEp+9byH1LhXQ0qvtmkaLQEeejcj8rld2tMecUms06evU9d4e
	1BglSkEnpJi0mShFoaIJuNylDMz6UakWjuEu1eru9aLZWRtKOirmrqOU=
X-Google-Smtp-Source: AGHT+IEmyMNANxH9qx+blsdqc8dzxZexz4DgF3i8l1KJD6Vkb/LaLByK/k0a/A9nm8d24pYZ2PcyGTJzMBlEIBVgt/dQfwr7SVpc
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b2d:b0:3a0:bb8c:bd0 with SMTP id
 e9e14a558f8ab-3a3b5fa179cmr167369525ab.12.1729090924850; Wed, 16 Oct 2024
 08:02:04 -0700 (PDT)
Date: Wed, 16 Oct 2024 08:02:04 -0700
In-Reply-To: <c1145389-2695-41d9-ac30-f8819c2ff679@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <670fd56c.050a0220.d9b66.016d.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_port_suspend
From: syzbot <syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com
Tested-by: syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com

Tested on:

commit:         8e929cb5 Linux 6.12-rc3
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git v6.12-rc3
console output: https://syzkaller.appspot.com/x/log.txt?x=10a8545f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9878fe11046ea2c6
dashboard link: https://syzkaller.appspot.com/bug?extid=f342ea16c9d06d80b585
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12d0545f980000

Note: testing is done by a robot and is best-effort only.

