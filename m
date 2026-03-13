Return-Path: <linux-usb+bounces-34757-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMpuFNY8tGmDjQAAu9opvQ
	(envelope-from <linux-usb+bounces-34757-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 17:35:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A112E2871FA
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 17:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD3C632835B5
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 16:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563433C457C;
	Fri, 13 Mar 2026 16:32:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C062241665
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 16:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773419525; cv=none; b=VRRkxF5H1F+/TfA3jIhM48BVORqWCwOsx9qoPI1uqgg1exPkY1znshZZKuxgfM/jPN2jmLheaxxblwOui52ZNdIjtHCvbv45f+B1djePBQYgEwwQBVamE0jSUTx6DORRaZZXrdc46Rz478IjeCWbGeiQPiv5odF0iLm1QwnpaWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773419525; c=relaxed/simple;
	bh=d17kownJ1AGwwn9SoVOR4txdfWEgDu7epVYOJd3bS8Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QKmZHjMXfIxRhOcWi8UkPfMWYyMpYCjTTTrBCHOjrlWpdkgvkyfXxhi/LVdHRUwEASe97edaAzlCE4bEzlvkDk5YEXj4P/QTz6uwV65AFA/H/UAgsLldWZw5LZ371J1A1y+wafN/PlL/DQ36CkGSMe4VxVWA9qSy/e8HSIQHaCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-67bc5678917so18553447eaf.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 09:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773419522; x=1774024322;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NqqoX27h7cfC9UaFH/3mKou2AD8VrVf/UJ27oKiHEOc=;
        b=G9MSG9Q1LPHqnKZMYfd0NHNLWYRICBW8Ww7uZeoOZSmzuVpDV0RhNllcp10VeANT7u
         cc8tkshGKMKvokyyWMo1Y1Z6cylYnxQbg7RdfMOVj82psAOnLrY8/aA7xfc+SV1glrzO
         pRYSyLLIe+CKPHOeSlCmI6T1KhfAHW9/vba0vZoQzAf7TN0AZ1ppaQX6lbUl4DeDsptc
         47MTfmdM0KYzG/k3VBZy+yPhuU/gSoiLoOHbCrzLjlQaFXVhX93mZE29AUCAvupk3cd7
         3jyPcyJPrMms/07h5kinB5EJz9/orb1c8Fot4ognQSI4BW/ToXW3gThGd8IOBsPaSjMU
         GFMg==
X-Forwarded-Encrypted: i=1; AJvYcCWqriCNhYJNIN3F3zwBGn8sA3IxwkyTSkMJ++t2S+HnW+RLWD3sh0n9zTtsWrIW6KnIrgU1c/ycMB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkBY7ChVQf9X3wRirLmUdHvUAmpXXkvErc9cAG+BbRSItN1Bkb
	/hK870Q6EHnndWePzWwiRYLcm2perMz9sttjtAQqQajU2yxvBHERIgn6Jzl+ZxOHyMhwYqIr9Mr
	nNE8ey2L8clsH84jsxVWn2hYp8uFdtwDqTsUUmM13TQKzYo41iw4ejFqCMQg=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:80d:b0:67b:e54e:d07b with SMTP id
 006d021491bc7-67be54edaa1mr509884eaf.20.1773419522399; Fri, 13 Mar 2026
 09:32:02 -0700 (PDT)
Date: Fri, 13 Mar 2026 09:32:02 -0700
In-Reply-To: <ca83b97b-9895-4e7f-821c-bfdc71d8d466@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69b43c02.050a0220.36eb34.000c.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset (4)
From: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34757-lists,linux-usb=lfdr.de,19bed92c97bee999e5db];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,syzkaller.appspot.com:url];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: A112E2871FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com
Tested-by: syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com

Tested on:

commit:         65169048 Merge tag 'spi-fix-v7.0-rc2' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=11535cd6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692
dashboard link: https://syzkaller.appspot.com/bug?extid=19bed92c97bee999e5db
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11de1def980000

Note: testing is done by a robot and is best-effort only.

