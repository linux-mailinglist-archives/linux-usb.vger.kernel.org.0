Return-Path: <linux-usb+bounces-33179-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDKiK2U8iWmu4wQAu9opvQ
	(envelope-from <linux-usb+bounces-33179-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 02:46:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E611210AE6E
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 02:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 399D4300B473
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 01:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EEA26B098;
	Mon,  9 Feb 2026 01:46:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9EB1F8691
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 01:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770601564; cv=none; b=k2ADGbqI8rAGnstr4NyLv1XDb2QivnNh0qyhUiG9kLW/EWe/wn2k4R5WlXkZxbL9Wwo+y8lZzZRAj9uEGYrD+RlbHqje7YZi4z+2l0Jq/WMvQAYBNNi685C7GC8FVG33lVy2d6tMZsOgVKnpXnxfk/tHFkjMAuTEgRlbxJlEpZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770601564; c=relaxed/simple;
	bh=MHu2NaVyoKXu2qjo5aItoAuEh/EeE8HMUDqrTgPll7I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RP9J6PHaqaItrm2/ldqL2MZra0U7qZmDaVFtahZj9iiwNfCD+Tx/EoSZ5PGacIVAMy9DKGYiy1LH1gwr3K4AFzQlqPIF0i84CucEfEtbBKkxHdtgNQ0wrl/i4jyt6yhTwjp0nafvQpFGQpGTDTDXAbtdiFmfc88Jm5iGmb6svxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4046864f5e7so6124164fac.0
        for <linux-usb@vger.kernel.org>; Sun, 08 Feb 2026 17:46:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770601563; x=1771206363;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3diEtA+C91S1X961tCYfiJD5tez2mjtAe95mtAjdMLg=;
        b=UwtQfxMSyMyCz+ZCppsPMpvbdiT8Dkf7+Zn0M1BSwdtGP5gBysHvvDttd2/YZcMcOy
         XpikNEKAhVbAzrZ5Gj/P40uBJg+FEfB7QFMaS81bvlOQuObpi+8wiTl1kW4QprqKlZuH
         XOh2NZMp+HuRyI2PytER6nUnHQZmu9Zmgt6bM3dbB+5/1Ga42x0MTvBYkP7LfxXrVg/t
         GMU7uvKg0kQg1vNcVeP0kyVIhT1RM8Mku2e5LH2j79b4gQFx/yZMTncgm4bLOqztdSPZ
         R2ktjNv6EN86seWjPscmp3mVEhBx+zkEfbSr0lVy0utbTtzhyxy6YJrs8Do2IjYzqXhW
         iWzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh8+1Dz5LMiZMhaMItiWYrxiVClwnata3CjsecfEEHE22hsuEEuLIFJ95SaGcNPQ9IxKv6TLAaNgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL3yJf/O/+BXo9Vw3RD5kKSB+NehkTNRxz23bGc30Pe/oyArEG
	NMkyxUjH/5Zhc/D9OBE6IDytX5j2LGzvcZCWgJtONAt7Pw/iqZJmDL3WhbWQi88KaWPxoKLky1E
	o8JQ8FotQ7CM5buO361/3ulxFhyaSBR3m+ftZk/vhtotLOssqG/bxn4N6oCQ=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:ce8b:0:b0:66e:4279:3df4 with SMTP id
 006d021491bc7-66e427a0122mr2537870eaf.59.1770601563434; Sun, 08 Feb 2026
 17:46:03 -0800 (PST)
Date: Sun, 08 Feb 2026 17:46:03 -0800
In-Reply-To: <0b508f72-7248-479c-ad26-b9385e52c094@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69893c5b.050a0220.1ad825.000a.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_bulk_msg (2)
From: syzbot <syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com>
To: greearb@candelatech.com, hdanton@sina.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, michal.pecio@gmail.com, oneukum@suse.com, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=a04e768f944f1aa0];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[candelatech.com,sina.com,vger.kernel.org,gmail.com,suse.com,rowland.harvard.edu,googlegroups.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33179-lists,linux-usb=lfdr.de,25ba18e2c5040447585d];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: E611210AE6E
X-Rspamd-Action: no action

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com
Tested-by: syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com

Tested on:

commit:         da87d45b usb: typec: ucsi: Add Thunderbolt alternate m..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
console output: https://syzkaller.appspot.com/x/log.txt?x=161c17fa580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a04e768f944f1aa0
dashboard link: https://syzkaller.appspot.com/bug?extid=25ba18e2c5040447585d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=120a765a580000

Note: testing is done by a robot and is best-effort only.

