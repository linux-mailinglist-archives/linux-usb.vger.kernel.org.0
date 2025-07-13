Return-Path: <linux-usb+bounces-25737-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB71B03304
	for <lists+linux-usb@lfdr.de>; Sun, 13 Jul 2025 23:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17F6F7A6F57
	for <lists+linux-usb@lfdr.de>; Sun, 13 Jul 2025 21:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5831E2834;
	Sun, 13 Jul 2025 21:20:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90EF2AD3E
	for <linux-usb@vger.kernel.org>; Sun, 13 Jul 2025 21:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752441604; cv=none; b=YK43Je+wSSpwW6FzlL74nvJyjks1oOkLkh0zo1t4ZUmPws/xdrXm8l7B4HTZOHJsfk8nxDMXQZNKjK6vEEBXw2QShSoQbOzhNEwBpoIIoURLCRpCF/XGpW6IFQPNZ52A2edppmVPmFDihHrvv7pKmcKXUcsYqA8CeMbEU2TEOaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752441604; c=relaxed/simple;
	bh=92prjVnmDX/HU5+tA/8d6ByNO0JCsQ7eWlfApWJCqCE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=r2TzWYJhG7Q8heUMAr+5NfTp1J8aQfEKLx2i/7/Q4NiZ/DeJs/NsSRS8f4hpWkqLQkN3wMXq2CrEeAIU0UM3QAEME0Z8izjaaCwPgTWdFlG/+EpWlI8NF9AygkvPSvaEdVDGFLnr0jBtbtdg8/UTm6ijLusje6nodjpvHoLILoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3df2d0b7c50so43193795ab.1
        for <linux-usb@vger.kernel.org>; Sun, 13 Jul 2025 14:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752441602; x=1753046402;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b1od9CAsDdqFqIvD6IJbr93GnQICF3/AYSGBhOqQUl0=;
        b=ACNbwSzl6Q0RZofcABtXnjOkpAELeeiCbc8XxM+HPf+40EdYq4iyW5dSwQugzd6gyQ
         hrsO7tq46NRt1rCuCk5SkHocgwmoKIu0eEBXOEkne4jG3mQjay6Il+A6oqWUHgDfg/is
         Cf1Ue1XM70oi70bdmYLKluwMK+Bhjgbrjd/H7r1RhSKEsZtJZKgECtE+FcWDUnSTgboz
         9Iysiyj+3sl2EaC6BnCtG3dvUHCYSns/aEQ4qR0/FSfv9tWi1HMUASt2NsDv3bnyQFdn
         2t/CtedxVDGvLsUiUeb+Hmslv4LnUgICRAe3vj4Rk0A1konJVnPKz5teu+Px/DxeRIiq
         G2iA==
X-Forwarded-Encrypted: i=1; AJvYcCX2nFQd6HivvnaKEbHUuNL6TEWnf+uWYMuMQF2JTwmBvpjWetIcpy2v+B4hCkObvbf6S+u+ouDPzqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCxbpfPXDgEjvKOox6Q4QwcHObz0CqZeUn6iynbMk+g0Ivqbic
	4RXA8ZV0zSIe9KjcPZSrWTPia5zMrFX7BXLTFMWgCczkJLFSdpL3Lx85xmKfT6upJA9qLKnrVdL
	cykuIqftLlBwBULslTDAZcJ12GRlFIK8Le97nFSrCtkqTrB2vcZDDcp3Lhy4=
X-Google-Smtp-Source: AGHT+IHj+TnAt8QJ+CiZShWzfqHJREdvhH+VHjOiL2iCMjtU15CPDrH1wh+oQ36d5yLgLZ/iQo9LVQD3kw+pTqgRzCHbDUHEXjlh
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2193:b0:3df:3154:2e90 with SMTP id
 e9e14a558f8ab-3e25429f52dmr105499625ab.19.1752441602051; Sun, 13 Jul 2025
 14:20:02 -0700 (PDT)
Date: Sun, 13 Jul 2025 14:20:02 -0700
In-Reply-To: <e8fe21fa-9a2f-4def-b659-063d55a40f3d@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68742302.a70a0220.3b380f.003d.GAE@google.com>
Subject: Re: [syzbot] [usb?] KMSAN: kernel-usb-infoleak in usbhid_raw_request
From: syzbot <syzbot+fbe9fff1374eefadffb9@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://git.kernel.org/pub/scm/linux/kernel/git/hid on commit c2ca42f190b6: failed to run ["git" "fetch" "--force" "--tags" "d2f5fa5d883c5402c78965af80c005a5cbdbc6c0"]: exit status 128
fatal: remote error: access denied or repository not exported: /pub/scm/linux/kernel/git/hid



Tested on:

commit:         [unknown 
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/hid c2ca42f190b6
kernel config:  https://syzkaller.appspot.com/x/.config?x=76c2fb9aa0954fb8
dashboard link: https://syzkaller.appspot.com/bug?extid=fbe9fff1374eefadffb9
compiler:       

Note: no patches were applied.

