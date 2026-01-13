Return-Path: <linux-usb+bounces-32292-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6638FD1A31C
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 17:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF9FE305F337
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 16:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDE2284880;
	Tue, 13 Jan 2026 16:18:09 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EBDEED8
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 16:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768321088; cv=none; b=YS9ArnBxse8TzNCdXtLyQXEH1B7guFpkSoz6XZBkP+iPC0KjPm06oYk4mDA/wr0tNy0bgniT6+7sJHIaEZswX0WMnxVbGg60+IkrpmXvDtR9MUf7eOQWPaNs312ZUw3YkEJGqdkY2ifCDrU32BqJyG6CfLgLn+K/BhF6gjCuYcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768321088; c=relaxed/simple;
	bh=LmwLL/iVS9XoQSlMXyboD9r5eQE9S01TEDc/ODGeNpk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QUOpFyhMmFge82SrSper0fC8ZwoOk9eHMDNzVBU5nbh7gQfk0if3QJCR4GI0XiXBfEW+IgQO6baWvKO7N6DADE8lRBjwVmb7Koyam6e2D7J9Gj1rR3WPob6VssVP/N/ske1VnYrAc7a+bYZbindU2rakmxPUYMfX9InDwq/fTp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-65e902a9ce8so14737304eaf.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 08:18:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768321086; x=1768925886;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6L0XQeaon7eL8GF1a2BoI3VsTUlKfh6i9fMWRkDZKU=;
        b=d3zeKTBiQ8ty1pBbkZ2BTgkTgnelA7RH9a4CCeLT8wbFmHm3b8JC6OKTmp9w5QampR
         quGwmtkFk64vgwgPPCHFFTtG9evR3A1joPLzZXz2B5fvrv3tu/41tiu44DrnQnPxdSGJ
         o0tCE/mfYDGlQ3nSTBQqsmH/xGagn9AbBUjLRB2sOauaKdXSi3KQLoJNND48fwigRGd+
         dnSbnUWgVszBh2IiA4fpW2esPhPBgFw2p/aRMPyeJSECr7MlQrtlTBIsr6TdpqNBg392
         d/RPujD6Cxq2ja9LJZ8NOM2P4RscrTc5sJWT2YA90INb7/fK1WteVYX/y3d7HidLj4uA
         Txjg==
X-Forwarded-Encrypted: i=1; AJvYcCXOXRs/+/+9y8x3JYjk1AVixw6fS2A73lfn6b7sTdoLe7Zzd8WeJiltk6E5w4XH/iCflHDzQSXCl/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZp404vvgIYkKjc/0ZtBLp7KxCCHcXU1+/6YXHak2VjHQW8pnt
	0Zyv/lI8CYkouW88zU/8G2THk2uxhL3ywmP4/gMs4RpsPeJApeuxMLgWUeexKvrj324uoOgLNuV
	MILGprE8+gsDTUybInl24YRLEOmYv3MdMiMF2BegTv44kPJkdEL6kTC7ufpo=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:8018:b0:65d:1636:5439 with SMTP id
 006d021491bc7-660f2d28ef2mr1284293eaf.40.1768321086188; Tue, 13 Jan 2026
 08:18:06 -0800 (PST)
Date: Tue, 13 Jan 2026 08:18:06 -0800
In-Reply-To: <20260113154748.341096-1-coderlogicwei@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6966703e.050a0220.246a4a.00db.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in i2c_tiny_usb_disconnect
From: syzbot <syzbot+30b78308ba7e64647ff8@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, coderlogicwei@gmail.com, frederic@kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, oneukum@suse.com, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+30b78308ba7e64647ff8@syzkaller.appspotmail.com
Tested-by: syzbot+30b78308ba7e64647ff8@syzkaller.appspotmail.com

Tested on:

commit:         b71e635f Merge tag 'cgroup-for-6.19-rc5-fixes' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14a0a59a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1859476832863c41
dashboard link: https://syzkaller.appspot.com/bug?extid=30b78308ba7e64647ff8
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1331f922580000

Note: testing is done by a robot and is best-effort only.

