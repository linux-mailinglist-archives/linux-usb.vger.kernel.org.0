Return-Path: <linux-usb+bounces-32890-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WF8vGaOQemmz7wEAu9opvQ
	(envelope-from <linux-usb+bounces-32890-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 23:41:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4AFA9B30
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 23:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC4F9307BB21
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 22:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CF0345CD0;
	Wed, 28 Jan 2026 22:39:39 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB190342528
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 22:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769639979; cv=none; b=feucEoHLrruNBlTIyTjezQetXcVXITEdp4S0+J8l4bZNn9lZ0NWLvgS6zhwc3aUb2WKseRGEVZ/CIKaFkVoMNeUQIXVmFXAbWjAcy6aY89D/l1kN1j7vM0rjdN2/AudknZHB7NO5ZqGWfPYHsw6dto8hCG3C0KQRa7FnJpeN29c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769639979; c=relaxed/simple;
	bh=irExbNMTYJ2Ht6oGHaUOL1aeZ+3WPLcy+JjvjBo7efo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=bv5d7iNr0ydmRc+yjnxL+ogTWjDLKgHQQp9dbhhdTFwogCqeCnjZAyCHYRy+7XwmSbD64OHK2amEc0DHYkly99woqWmydfyrBxXQkEVJG3f6ywr2rdVqpNqzmezS7SqQQ49wN+X62LQ2gzdYl5GBNs0WQi976PIho60ubAZV/xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-409682c165fso1294890fac.3
        for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 14:39:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769639976; x=1770244776;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vgRYQnWzefrrytdL3mdYGmze1DZawhVUqn+5HRephsg=;
        b=UBje/ggDIYLvjTAK2CAgldhu25hsYbfZMcw2PWBaVQSXOLU+GvOrxoqf0bUj+z2Sjt
         CbWxzPqDs6KD4nNVrBpdyG1TLWloYYCdImLA8woqvW7BTytkxfEQc8MtEJYWgAi/571+
         tpvVZVGHUs2xjHBGCtTE9yFGOYeRgOqQGAOk/e2bGis6015ZUz6gQQG3GQfYbVSAWHe2
         R60xMp2KnmXz8gMftnBiRdvnyWQfpz076tF21+J9ERehdacs8iesAtDORP4cwuMW1BXB
         RbdUt4AE5m2RppTCnm7ooIAGKjYkDHcbUZUukGG1LYguBXzTmNAO7qI3Tb3MFUQ5NJ5p
         sFCA==
X-Forwarded-Encrypted: i=1; AJvYcCUlwuhIO2f87QI9KVitGWpOiTgVhBq0FUSdK3PCg+AwDcm3RGuDW0hpkG/PemP9C6ZjGcwLD/hFITg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMGd5G2fI+nfP2uwB2x6POvksLVTv1PtjPp2vkRJBd5yruYoBL
	7Tq9oj72hOfVYW3Xylu8ud+yAuv0cMvcjeTuLV4ZRdSBaVinetColKh81nxzqrEaM/QWVFPPBXY
	9Hp0rbaa4ORYNuFO/YQv3Xrqu6Dq3lAC4+ToOj6KpI8CWO06n6b0ksQ7iqlg=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:839a:b0:662:f3f6:bf6b with SMTP id
 006d021491bc7-662f3f6bff2mr3406108eaf.80.1769639976618; Wed, 28 Jan 2026
 14:39:36 -0800 (PST)
Date: Wed, 28 Jan 2026 14:39:36 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <697a9028.a70a0220.9914.000d.GAE@google.com>
Subject: [syzbot] Monthly usb report (Jan 2026)
From: syzbot <syzbot+list5e77845208a4007a1950@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-usb];
	REDIRECTOR_URL(0.00)[goo.gl];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32890-lists,linux-usb=lfdr.de,list5e77845208a4007a1950];
	RCPT_COUNT_THREE(0.00)[3]
X-Rspamd-Queue-Id: EB4AFA9B30
X-Rspamd-Action: no action

Hello usb maintainers/developers,

This is a 31-day syzbot report for the usb subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/usb

During the period, 4 new issues were detected and 1 were fixed.
In total, 84 issues are still open and 409 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  7048    Yes   KASAN: use-after-free Read in v4l2_fh_init
                   https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
<2>  4608    Yes   WARNING in usb_free_urb
                   https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
<3>  3403    Yes   KASAN: use-after-free Read in v4l2_fh_open
                   https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
<4>  2251    Yes   INFO: task hung in usbdev_open (2)
                   https://syzkaller.appspot.com/bug?extid=b73659f5bb96fac34820
<5>  2242    Yes   possible deadlock in input_inject_event
                   https://syzkaller.appspot.com/bug?extid=79c403850e6816dc39cf
<6>  2160    Yes   INFO: task hung in jbd2_journal_commit_transaction (5)
                   https://syzkaller.appspot.com/bug?extid=3071bdd0a9953bc0d177
<7>  2111    Yes   WARNING in __alloc_workqueue
                   https://syzkaller.appspot.com/bug?extid=392a2c3f461094707435
<8>  1416    Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                   https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<9>  1304    Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<10> 964     Yes   INFO: task hung in hub_port_init (3)
                   https://syzkaller.appspot.com/bug?extid=b6f11035e572f08bc20f

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

