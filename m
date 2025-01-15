Return-Path: <linux-usb+bounces-19372-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B17A11C30
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 09:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2936C3A874A
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 08:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3CD1E7C1E;
	Wed, 15 Jan 2025 08:39:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6831D1DB150
	for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 08:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736930345; cv=none; b=RMYc56Fe3ZUBNbc3+Y6BNRbbOqWAlxh3josPf7sDXMvsJ2QHWAWR2+chfBDbyrD58HlYof7InlafmSlcf/5d5SOWaVHESou9/P1WI1ITNv/636EeltZ00wv/NWum4QJpdhb1j3pjx6R6275PhJW6J5WdrNHBXpGEsbP3qC8M0sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736930345; c=relaxed/simple;
	bh=Y24pZPuFwPFR1VZHcEMQpqo7yKBdVDnnPlgKCXjs+iY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=K/CVhGeBPUhQOiyrSM8DVfcLJWtJR4WbHYBVLuY0umMzUlUeCgwdoP7B0gNhq2K8B56BZ2AO4QvLBmc+QYdP5XC8D1DLf4q6KcxU/NkG/FUzn55CO1zY2fJq9AOnvnktw/E5VSKI48zI+UMj3j/CKLc3cxPBW4EWBOoOHX0V5C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ce81381737so18249445ab.2
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 00:39:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736930342; x=1737535142;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ta5z2IK+7I07RU1ai/knZKO94BiSdaHRFL5TZfBCeEQ=;
        b=Gl5HA8fyVuzrb6y9055orwxdPs7D/RqZlFosuivJR9O2tAAjMPEPckzuqrUhA/gw1Y
         Mk69PFUzEx5SPN2r2p3cSb5bK21/0mqRYad3iDoojJghlv9pZavTZKz8ZSMpgpRKZYba
         7QG1jUwDvkcYYcQNfb1+qi/BR2V41rJ7D0rJTUF/SvfUsc3cRz1I61aBTRdB01FGIa9v
         LocS0vcvtYuuIzaVPdb3WhkpdDDsbpmana7+IRURea2NmRlqfFqdtP4jxpn2/DZzeeq8
         iwAXXhtdmRMFyr0A/aVEnPtYXm3G88rW0M2Og1DWEWJ9PK2peGTuhThl1NIJ7gLipORf
         m/Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXEPV30bVSheQTtowAzSXYlkKxF+p2VZoJI9fInHB11ipRRzzyj3Mw/V5xMPA0UBT4QMC4ZxB4VLX0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8xzm7e/wGCmgvOM4ImipJjjwrcGbP0YrjkEAI7Rhnd2Mo9pzJ
	I/A9DeFRWRvO7em5LWtynpQe+kPo/sdrfpWNOdXFQ59eZOnjHBSLCyIGWbYmtrQ5CUPn34rIfeN
	BSyGmaX6Avg2BA/zExwuh/+khBUgXLVudmc6EsjfELVQYdBBk+CGyNCE=
X-Google-Smtp-Source: AGHT+IGBUSwrbDRmXtiHaqIZSAmvQ3odCW/shzY20iSKtiAv92ooamYnIFaosuQJLlCINwHHbzf8lnxHnEoj9TfCiaVFm7wp6750
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c9c6:0:b0:3ce:64a4:4c32 with SMTP id
 e9e14a558f8ab-3ce64a44d95mr102162105ab.3.1736930342600; Wed, 15 Jan 2025
 00:39:02 -0800 (PST)
Date: Wed, 15 Jan 2025 00:39:02 -0800
In-Reply-To: <6712465a.050a0220.1e4b4d.0012.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67877426.050a0220.20d369.0009.GAE@google.com>
Subject: Re: [syzbot] [fs?] [mm?] INFO: rcu detected stall in sys_readlink (5)
From: syzbot <syzbot+23e14ec82f3c8692eaa9@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, davem@davemloft.net, frederic@kernel.org, 
	gregkh@linuxfoundation.org, jhs@mojatatu.com, jiri@resnulli.us, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, tj@kernel.org, 
	vinicius.gomes@intel.com, xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 5a781ccbd19e4664babcbe4b4ead7aa2b9283d22
Author: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Date:   Sat Sep 29 00:59:43 2018 +0000

    tc: Add support for configuring the taprio scheduler

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=124487c4580000
start commit:   7dc8f809b87d Merge tag 'linux-can-next-for-6.14-20250110' ..
git tree:       net-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=114487c4580000
console output: https://syzkaller.appspot.com/x/log.txt?x=164487c4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=28dc37e0ec0dfc41
dashboard link: https://syzkaller.appspot.com/bug?extid=23e14ec82f3c8692eaa9
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1634f218580000

Reported-by: syzbot+23e14ec82f3c8692eaa9@syzkaller.appspotmail.com
Fixes: 5a781ccbd19e ("tc: Add support for configuring the taprio scheduler")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

