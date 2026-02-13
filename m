Return-Path: <linux-usb+bounces-33348-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOU4BFicj2mxRwEAu9opvQ
	(envelope-from <linux-usb+bounces-33348-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 22:49:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEB4139AB2
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 22:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 932E930089A0
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 21:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F030128688C;
	Fri, 13 Feb 2026 21:49:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873F32459C9
	for <linux-usb@vger.kernel.org>; Fri, 13 Feb 2026 21:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771019346; cv=none; b=dYO5JxyzcfRYeHnjEQ610rpl+ZFJ9PR9pk5HSpN3W4lbEi+MXcLCC50C1wCqMHaruu+dJuR6o6iSXDYR8J881+ZG9QaNxhxQ48O8Z0sUhCpSygRz7h6S+f9eh91YsFU56ebRjLDjt7aI3i/xdgF53r7d40Y9wa0uIqHA4Xeg5Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771019346; c=relaxed/simple;
	bh=X4e0rIufxxDMwO7ghfdKMPlKGusng4Cgo4KZp5tc+mQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=DmQ7TAmOd9WPV4J0NFU5uTuEzrF+fgbpmYvI07lLKmJK2bp98iRFbpUdMBAgUyeapL9/GykJra6IfbE3JZl4gGkKDyZTSbdSchFegv93wscSEZmSa18FzlZa9/u6V6V0lQ9acGpEabfAQtGDkvN/Cqa400Y9ovHjUQcFT7G1R50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-662f738c3bfso13643388eaf.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Feb 2026 13:49:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771019344; x=1771624144;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6E7ue0R2u59De3aROz11JYm5Bz11INfGoiwMnQB3feQ=;
        b=ICOZnaA04eO8HhFiWFo3DONUE681S8DQNfzYDJUAkhNqD5hkjKmPh9nTeU89lMv/OA
         IlJg8zJbeh6XCBbVb3KgHo6JYDX5pqJ1jyXTum/4IzbBXmNGs83ZvvNmEMjhJUQOhtn6
         Wyf1qpJu9jdrWkT87Q42akqJIr64GAcrmw/A6GrOLir0sX0oyor1Pv+7KEu5jUaCG3KT
         CNMvxeurEE7YWZ9K3ezsuwFGZRv0997LyB/xivRprNdAFpfQeTOb42CyAa8E3hqlIR2C
         bH8XRxhg6BY92x+6zLn7js1nw3TMG8gZ93xk7RXcSQlWstRES5Jcxo7bs7bBRqZgRcOY
         iBig==
X-Forwarded-Encrypted: i=1; AJvYcCWGw2aVZ3ixuX+hImfC1cpuLi6mkilCKY3piYz+WJlR5EehAtIT8kUit/3+DL0XBOUuhPnilYItbi0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yypjxhu+N91SxWdC7sOeuI5oz3pGCRX/IiNZsWC1yomf4kGpTtl
	OZyAP4mS2JuNf7QNIVS39reRpAFpGa4NEsvcLsXDHjChp7WE5ESrHtUhdE4DPqa+Mn5tyDCr2j5
	/urt6us5lyZh1en4ckeydvVpSU+aSStXa39/fnjp1gWZWOK0lCFy6zHwF/q8=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:211:b0:662:c114:b29e with SMTP id
 006d021491bc7-677670a17f3mr1496796eaf.24.1771019344515; Fri, 13 Feb 2026
 13:49:04 -0800 (PST)
Date: Fri, 13 Feb 2026 13:49:04 -0800
In-Reply-To: <2236c07f-9cc9-48c5-b65f-ba1d5bd569a8@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <698f9c50.a70a0220.3c8f9c.0074.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_bulk_msg (2)
From: syzbot <syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com>
To: greearb@candelatech.com, hdanton@sina.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, michal.pecio@gmail.com, oneukum@suse.com, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=a04e768f944f1aa0];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33348-lists,linux-usb=lfdr.de,25ba18e2c5040447585d];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[candelatech.com,sina.com,vger.kernel.org,gmail.com,suse.com,rowland.harvard.edu,googlegroups.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 7AEB4139AB2
X-Rspamd-Action: no action

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com
Tested-by: syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com

Tested on:

commit:         da87d45b usb: typec: ucsi: Add Thunderbolt alternate m..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1129fa52580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a04e768f944f1aa0
dashboard link: https://syzkaller.appspot.com/bug?extid=25ba18e2c5040447585d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11c46b3a580000

Note: testing is done by a robot and is best-effort only.

