Return-Path: <linux-usb+bounces-35766-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCnHJDXOzGlFWwYAu9opvQ
	(envelope-from <linux-usb+bounces-35766-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 09:50:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9F5376453
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 09:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E49F301D687
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 07:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9F0385536;
	Wed,  1 Apr 2026 07:42:27 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498F737E2E9
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 07:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775029347; cv=none; b=gMp4kjLqhCQemXTWZOvh/LuipeWAuTOK3jntK8NNrYOhUZAMKDNKHIkCVT1uB+gDI6mirjfUMraLdZbp59BkvurgM3eTQvuJG2mJvRN+qqBx/cTpbXs6/FggvEhbLeMtX+gZL1SUGmvP4ZZ76WkGxdJZ6CnvG+0rXHh8a4GITHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775029347; c=relaxed/simple;
	bh=JxOAljTa2DeoZoi9HyLXKpuXM46stgo1ie5xuKqUMTw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=me1QSUHSQvYE50go1u2jQ2Bjx+Bz/MJLakc0Lsfpb5lQP0eAQ02S6Gj1xgr3E1L3HZY7sSkEiagHbOMIqlMZTYztqkwga/OT7EbrHsz8JoJkBHfG517AHIaBq4ptE7OYV9xaaHkGtipMJlQOAt1Kcdy1cbFcY9hAgUsUoum1Zf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-41c4c7d2b28so10872696fac.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2026 00:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775029344; x=1775634144;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LQimvfhfilJkWCdcO6xdObyHc50JNshKkFeCPbvMI3M=;
        b=QXW3qhB9N3NeAEi01PwRwTwN6MJRCK0ZJRPtooFOEzjxsg2m/NRhTQT5xsaMNLQUzG
         DqgVNYFXKOjrVDTKIhLIuC1jop2ybwP/x2TcTdX+VMLUTSzOAvS3tqP67lElAUF59CaD
         GNf7REf9+A0HNgjn0+lb0FIo/WoTbTQW2UPotHzRKRoNxfbIo5wTw86AiwjK/RfC1YEu
         R3xK2PGH/1gJGRzZn2h9kT5K85XUeI264nAO2VXFFa57sZaDj2A26gdmKj7fQKwL3xFl
         rvd/xxrxHLSxrWx0PLLCXSOM1rdvee2w1UdMmaq5E+hLn+lan2mayfcIdmEv08b3+rTf
         JjWg==
X-Forwarded-Encrypted: i=1; AJvYcCXRfxHpqk1KFvos7QSXSOf+RwYKdahS6wBYiT681d5jNwfDIE2yFG5YrDUm0trp7StuensUfiMCx4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqnSHq5cjlXiS8KUOJYt9JyrBdH4SXeyRY1wq9s9jc6IOsyiAP
	sfGxbEYzwMzUAuxepNtNSXTcuDvjr68oRT0MxHps7WspTNBJY2bTgljTyJW0BDfXfkATOClVw0M
	aErfbmVjTKg6EzDqEiQBD4Z4OMMZWdPQHybGAgRJrDwqzFNXd2MJvr+N79oA=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:610:b0:67e:3eaa:80ba with SMTP id
 006d021491bc7-67fabc0e54amr1225183eaf.15.1775029344253; Wed, 01 Apr 2026
 00:42:24 -0700 (PDT)
Date: Wed, 01 Apr 2026 00:42:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69cccc60.050a0220.183828.003e.GAE@google.com>
Subject: [syzbot] Monthly usb report (Apr 2026)
From: syzbot <syzbot+list35792fb0680f47cc36a7@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-35766-lists,linux-usb=lfdr.de,list35792fb0680f47cc36a7];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goo.gl:url,googlegroups.com:email,syzkaller.appspot.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0B9F5376453
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 4 new issues were detected and 1 were fixed.
In total, 80 issues are still open and 415 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  6855    Yes   INFO: task hung in lbs_remove_card
                   https://syzkaller.appspot.com/bug?extid=c99d17aa44dbdba16ad2
<2>  5232    Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<3>  3941    Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<4>  3547    Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<5>  2716    Yes   possible deadlock in input_inject_event
                   https://syzkaller.appspot.com/bug?extid=79c403850e6816dc39cf
<6>  2701    Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<7>  2177    Yes   INFO: task hung in jbd2_journal_commit_transaction (5)
                   https://syzkaller.appspot.com/bug?extid=3071bdd0a9953bc0d177
<8>  1441    Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<9>  1436    Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<10> 1400    No    KASAN: vmalloc-out-of-bounds Read in kcov_remote_start
                   https://syzkaller.appspot.com/bug?extid=8a173e13208949931dc7

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

