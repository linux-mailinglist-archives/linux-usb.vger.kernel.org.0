Return-Path: <linux-usb+bounces-7645-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6255874ABC
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 10:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 755121F2196B
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 09:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2373384052;
	Thu,  7 Mar 2024 09:22:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C0F83A0D
	for <linux-usb@vger.kernel.org>; Thu,  7 Mar 2024 09:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709803324; cv=none; b=nIDVwYnghkwKiDuXAZGdp3/kdepqQTci+5bgoDlIeF9nmgkd4x+KEOdx+BciCR16Y6Ku+XiAqBHePLShmxSx4bmpZt6c9QKV/ynxnaMdgc6ZuWZLU5r+p+k/RFfBzkNG3dOpOX8yttZwXwY6nyXnA0EWopaZ54766cont0HeVWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709803324; c=relaxed/simple;
	bh=k6Z8Dy08v8JjctZT+zEqRAI+iDKakEThNIneji3WUs8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=iLmFx0po5Wk788rQfimvDTc8lYii7xjafIq8uXr6VwO2vat3PlyXhYlOcKq2FDkYxrrHaSk53IP6UCbTnYnlE4P/lcc0AocUpj3RLYxLpbCIaK11LnOyF6DKvXlhbljjIcrQzblrseDijjV06i71fjfQYAJK79M/2XM2ETj4dI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7c75dee76c0so55396539f.1
        for <linux-usb@vger.kernel.org>; Thu, 07 Mar 2024 01:22:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709803322; x=1710408122;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4cB4mfgxxhOdGVz1qSSrC2aE19EtM0xTHQYqGcCbdk=;
        b=fdmEmlkWvsjGGgmAQMaEgLjHEvPFAqIO4qpvWYVotS7fxWF88woKEKfKIts3OLHFtf
         2DMuJlvlG8jB3qQYqP2QgKn6slr63A4SEBh1FIB0FmRtS2z8hFIwIQCuPwcTnMNGSEoR
         p5/hZy8qOzA1xsBb3/uNURvlCCAQZoPogyQgPfXvpNf/nDpxzZBkWA3u/EQsElYuD3tm
         VFAsNOGCbXg/rx4sS5LG+NIsosrKz8Xsfukvj1Kl8S/m0pgelZMo9qyFE5shuYiO1lgv
         YCr8Sm66wdrj2kCFIW8k1eWHsB33asUNzoB+PiHaaRlmjN/8jwxnT4LXkGlXWvlqPAoX
         sjQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/zSDRp0cgOwJNklPu1ATCrnHJiYu6IhzfprCJ7Xxv4vFxq3OC79sRHFpMmNH7edFY786G5uGK46G/ekKrFxJS1uzdbEYiDMQl
X-Gm-Message-State: AOJu0YyyhecqST9VIcMVJSyuhzcdgF9ygVNwDNcMp8BoC6TLI0YygBd8
	iqO7+BRVZ65GuE/BntDQxJQnpHm8wqiZ+A9imNKgBZ148+r8z2uI8bg1HCC1zhupmq2JL3g0Q3d
	LtkDYT5s0cu7VCo0l/so4XEtyzYmR4jQnm0Bx/USDNUCQ85wbD8xqpSs=
X-Google-Smtp-Source: AGHT+IEMTxQCdUA6Dv7Lv6y16wV0knL7dKArp17Um7aS/ApI3W+O/xlDfqd9xlZ9X3uv+mg+dW+z3XFCb+N79t1rzwFiFjeKNebx
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2b18:b0:476:b3e5:4392 with SMTP id
 fm24-20020a0566382b1800b00476b3e54392mr44985jab.2.1709803321994; Thu, 07 Mar
 2024 01:22:01 -0800 (PST)
Date: Thu, 07 Mar 2024 01:22:01 -0800
In-Reply-To: <0000000000009752a005fdc2d114@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a4bb3506130e9bc5@google.com>
Subject: Re: [syzbot] [usb] INFO: rcu detected stall in newfstatat (3)
From: syzbot <syzbot+96127c74434e19e4609d@syzkaller.appspotmail.com>
To: brauner@kernel.org, davem@davemloft.net, edumazet@google.com, 
	gregkh@linuxfoundation.org, jack@suse.cz, jiri@nvidia.com, jmorris@namei.org, 
	kuba@kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, netdev@vger.kernel.org, 
	oneukum@suse.com, pabeni@redhat.com, paul@paul-moore.com, 
	penguin-kernel@i-love.sakura.ne.jp, sean@mess.org, serge@hallyn.com, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com, 
	takedakn@nttdata.co.jp, tomoyo-dev-en-owner@lists.osdn.me, 
	tomoyo-dev-en@lists.osdn.me, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit c2368b19807affd7621f7c4638cd2e17fec13021
Author: Jiri Pirko <jiri@nvidia.com>
Date:   Fri Jul 29 07:10:35 2022 +0000

    net: devlink: introduce "unregistering" mark and use it during devlinks iteration

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14dc6736180000
start commit:   29cd507cbec2 Merge tag 'integrity-v6.8-fix' of git://git.k..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=16dc6736180000
console output: https://syzkaller.appspot.com/x/log.txt?x=12dc6736180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=70429b75d4a1a401
dashboard link: https://syzkaller.appspot.com/bug?extid=96127c74434e19e4609d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11767d61180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15f691a6180000

Reported-by: syzbot+96127c74434e19e4609d@syzkaller.appspotmail.com
Fixes: c2368b19807a ("net: devlink: introduce "unregistering" mark and use it during devlinks iteration")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

