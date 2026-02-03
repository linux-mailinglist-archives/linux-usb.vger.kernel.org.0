Return-Path: <linux-usb+bounces-33040-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBbDA8T5gWk7NQMAu9opvQ
	(envelope-from <linux-usb+bounces-33040-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 14:36:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6136FD9F23
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 14:36:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DE653066404
	for <lists+linux-usb@lfdr.de>; Tue,  3 Feb 2026 13:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4EF439E180;
	Tue,  3 Feb 2026 13:35:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0204534DB77
	for <linux-usb@vger.kernel.org>; Tue,  3 Feb 2026 13:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125705; cv=none; b=h1aTCq6vbdwIBigahXmbaHrvDeKqqG2QeydOim7ryVw1gvZZ4lqKc60Dpx553jMsrQ1Lsk99qnNd0eGS2b3jmFmyL5p43gBpv7Ryu58HwPj8wo+CADuPBiPLQqf3cHm6BSB7L459Zo3m/7EiBG7zY6K9yc7xB9v8H+OrAO0hM+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125705; c=relaxed/simple;
	bh=ZZ4pBXDIrZeUKSoJcjLSCU1hhEAVf1/7AA3xeYo0rGU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=r4KXtUZct7UF0ujX23J85VOj565IrOZIfTdVhJ9/7KRQLB8SYvVOhGOJ58MdhDT8IYcqcFojyquRYNgtvyZCLyT+kl44EbCK5sgfoEjlvYlvdbhchoAmZMDH8Z+9TPjVbG3q3ix6FZkwRessuQumPWn5+xbiCwZPpJK91DOXito=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6632b0d7401so12554944eaf.3
        for <linux-usb@vger.kernel.org>; Tue, 03 Feb 2026 05:35:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770125703; x=1770730503;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/ye+P3u/TQniUhIsnz6XxNe/73JJs4d9RPEqAhqUWk=;
        b=oe07rtvXk6HpQwi9LyOVUEBVv0soeG0cewPvUrLPQMGRP3XHUfa3Ys/FrN0P9sDOCU
         BN1a4snnyRXHUKB5jNy7Waw+WJIzSremQknc7rby3Laoyr5n2L8AiBjbOFmIGwTVC8oV
         JMhTxi1jXRqsRmxx/M5OYJIC2Xg1gwq4frE/BhwBMvBRSpOCrvUnbvKJoaxDJM8mn1rW
         v6lFY1K9oqis1trwFwNDiLJX22DFN+76Nca0EWbFOxnzZtuPxMQWirwx2c1TC/ocIm0l
         MHZ6fDSOm4uQIKxXqIqRZ22RV7wgCe/bMo+UAYmoE/EQHRcUT1XAfOWUif3/oVN9toVG
         dPHg==
X-Forwarded-Encrypted: i=1; AJvYcCVvwG54zrWTZbyyXVhcUCM1wa2t1LCFmqSb/YsvDC2L2eNPk3pupT/j4teqB5Xm1HRI6Cq+n7/fWDo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9e1Ji15UTh3+5BxjEOpC8/b4MLviv/2tulfZ95jJj2Ds1Sfhw
	9+BS+V2S8WEhNTFdPT9woPE8X4bDnwYYSh50+XZ6fbTyCIJDt2bE7JccOP6bBsuLTfGBzGbBXCB
	vh77JgQEs4uGhyttzMGKKDXl99vPKNwm5iVcu8PVpXcDavFV5zA6yBJmnYHQ=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4106:b0:664:7c2b:c79f with SMTP id
 006d021491bc7-6647c2bcb13mr4298574eaf.73.1770125703078; Tue, 03 Feb 2026
 05:35:03 -0800 (PST)
Date: Tue, 03 Feb 2026 05:35:03 -0800
In-Reply-To: <aYHJUJzHlkBD_Nza@chandna.localdomain>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6981f987.050a0220.3b3015.000b.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] WARNING in asus_remove
From: syzbot <syzbot+13f8286fa2de04a7cd48@syzkaller.appspotmail.com>
To: bentiss@kernel.org, chandna.sahil@gmail.com, jikos@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=750532df2c47a03];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33040-lists,linux-usb=lfdr.de,13f8286fa2de04a7cd48];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,vger.kernel.org,googlegroups.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6136FD9F23
X-Rspamd-Action: no action

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file drivers/hid/hid-asus.c
Hunk #1 FAILED at 147.
Hunk #4 succeeded at 1346 with fuzz 1.
1 out of 4 hunks FAILED



Tested on:

commit:         193579fe Add linux-next specific files for 20260202
git tree:       linux-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=750532df2c47a03
dashboard link: https://syzkaller.appspot.com/bug?extid=13f8286fa2de04a7cd48
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1129c53a580000


