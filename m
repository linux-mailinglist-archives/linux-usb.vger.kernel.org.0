Return-Path: <linux-usb+bounces-35290-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKrAI78awGkmDwQAu9opvQ
	(envelope-from <linux-usb+bounces-35290-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 17:37:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 205E42EA079
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 17:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3F6383003999
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 16:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D21368964;
	Sun, 22 Mar 2026 16:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=scala.name header.i=@scala.name header.b="qkHSLFee"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F522F3C3D
	for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 16:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774197436; cv=none; b=Mnqs3wOQdSP7dmOCM2YSVNoGZFGXJMOewBe9zYcFNUJQALY+MVlTdze1897/XawEdQXBH0mmW6NSDA0M2KSNGFZjjIEUQX1hGY/lANpbDYMZP0KIGv3Do6v4SgI8eu+TEf2iUGZXiVKiY8LvLCpR4MHloxmMTOmUSTmnJhkGux0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774197436; c=relaxed/simple;
	bh=JFpoWSgD1s/KhKAWvJeZEZ04y6D4QxnN9MevAWxYU4s=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=M7sUWHr0ZX1swLAv5p7Cjrc10+pIUZQHcYVoOkWXeqI5UGUn4zY6lRVSOc1AnmoDawAIhKTiELXq7KwSpmAuYq5jndB+CGTwvOzRRfABVwIK6mQRegctnvwzZ4et8RkMiHP/oPnj3BsRagx0btDKujy4OYfEj+D7TxKoNp0yYpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scala.name; spf=pass smtp.mailfrom=scala.name; dkim=pass (2048-bit key) header.d=scala.name header.i=@scala.name header.b=qkHSLFee; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scala.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scala.name
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so2989512f8f.2
        for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 09:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=scala.name; s=google; t=1774197433; x=1774802233; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:reply-to:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9a6p/HT+rfzidRgp0jxaqZ5q+tj10zj/6Sd+UW0c8E=;
        b=qkHSLFeeMK+G0U/sSgK5poDWkucvf+9uYEMtYLwK4Ft6tzg69sa0VA1+6zcMQ0uvK7
         Cpy/98BueWB20jDozMElyc1VeO0kxwTdWPeDW9Ym5va+4GKpFPZd7ir71PB6E3mL87j4
         ZUDZJdlvfbJcpQf3ZOs5+0hq28diJwC20WBL/soMGJLFWQDMebu6Q2Q1D83Wh5y6PDPk
         +lrC9nBWqG+EDA/2kSUzS3I6aJQj7q5jB8hK1LV6+EmvuzT87rnIyyBF2kB4jyTyMvNx
         XDVDTEwIKTG1o94FaD2xx5jKmlmdFCw7ds10DbM1xVFQl1IJV87sPQFca/Giba9UuzyQ
         UqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774197433; x=1774802233;
        h=content-transfer-encoding:subject:from:reply-to:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9a6p/HT+rfzidRgp0jxaqZ5q+tj10zj/6Sd+UW0c8E=;
        b=ldTrDLF575nL2+jd1uY/kToOBIEl+cUEqI1xC428k9B4YOhJGgGnKUe4BKPwTQSVvZ
         v+tniMc8OGuZHUHVyiob51Gv9tfWc5PayhKJ+yRIXzrSjI90yuCWuiCiVAhxCcDe68tO
         9B8dDIQSjf3WqRJiYZaUAbMCV4PguOa2m+4tmZ/QDSPoDDNu1Ll01bm02uItubpW1BuS
         cGRdvl+Q9jyw7shjtLhKDZ6ZiUe8zqL5vRkkVy8f/s5DHUim9I0+PH3ZUO57F+pbd7IM
         utPk52IQDNZ3274MRI+Vg3KE/tMw7huzqlz7C0FJiI/WFz2FI6fOgtzC4EstzDjHMr/j
         CnCg==
X-Gm-Message-State: AOJu0YyXp17bwkiAs3IPPunHYz0gjg3ZOT4cqtoBTnV+tOQhYS1G6B3c
	RZF8H8eaK+z0B5c7cNzEAf/Odk9gATzoy3kpaWyiusRZj5tpIOCS/WTJoF1mKulG2AeGTCBWQ18
	HEe0t
X-Gm-Gg: ATEYQzzZ9kY2B8J+UeqhATK3SFklOcFzoX8457oNe0itP5HowdiEmujb9GW2rmhrCAV
	R/NchjgQwDG6SW9Qz3BxpB2ObJKdjvofUEK28RhjpmxBI2wPmX77sZDwZZxHZ7Ssb6X9GiiqNW7
	guddcfGVckEjG6zp76RueVRQ8rk5MsFh49zxQZdJzVsfiO21iuvNL+G0aaNeZ+/rzB44p7lO8YM
	qAbB1q5NseXZ1f3BldM0Iwrzwj0T5lgXm7L0Q/i/VDbXc+6GtQYkra/Z2YSeNt3nCreiqHAJcQD
	tKqUTmJDaF1vlTDpSTAXt9tFqPVNUW5Afn8jnr33VA1lseQTIsoooWLD5avbURH9F0F54GXSkd4
	WeKijhWnRUZ7EpBp4iR3rcWrznLBSfaCY4uS7hQm/UXAoQDEgfSiRE3s8/E5GpsHRQzhQ5IQGCL
	hZpEmPRup8TkA0Dzb00E8WPZaTKUqLaEqYvnS34VQxRZ8JWGWGC/6b+r3gWhomTbY=
X-Received: by 2002:a05:600c:8483:b0:485:531d:28b9 with SMTP id 5b1f17b1804b1-486fedc0070mr135241265e9.14.1774197432568;
        Sun, 22 Mar 2026 09:37:12 -0700 (PDT)
Received: from ?IPV6:2a02:169:ee00:0:98f1:7a2a:1483:7cf1? ([2a02:169:ee00:0:98f1:7a2a:1483:7cf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b322d9sm277821525e9.8.2026.03.22.09.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 09:37:12 -0700 (PDT)
Message-ID: <7333738a-8364-42fa-b334-c4dc4b0ee503@scala.name>
Date: Sun, 22 Mar 2026 17:37:11 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-usb@vger.kernel.org
Reply-To: Francois Scala <francois@scala.name>
From: =?UTF-8?Q?Fran=C3=A7ois_Scala?= <francois@scala.name>
Subject: Caldigit TS5+ problem with work in progress patch
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[scala.name:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35290-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[scala.name:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DMARC_NA(0.00)[scala.name];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[francois@scala.name];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francois@scala.name,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[caldigit.com:url]
X-Rspamd-Queue-Id: 205E42EA079
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,


Last year, I purchased the TS5plus docker station from Caldigit 
(https://www.caldigit.com/thunderbolt-5-dock-ts5-plus/)

It is a particular docking station as it has two USB controllers.

This cause a problem with the Linux kernel, where the typec_probe 
function is designed to handle only one.

    Mar 09 09:13:54 alpha26 kernel: sysfs: cannot create duplicate
    filename '/devices/platform/USBC000:00/typec/port1/port1.0/partner'
    Mar 09 09:13:54 alpha26 kernel: CPU: 8 UID: 0 PID: 14 Comm:
    kworker/u64:1 Tainted: G           OE       6.19.6-arch1-1 #1
    PREEMPT(full)  a70f585a3574c37bff18875a6cf7bd8652b4cbca
    Mar 09 09:13:54 alpha26 kernel: Tainted: [O]=OOT_MODULE,
    [E]=UNSIGNED_MODULE
    Mar 09 09:13:54 alpha26 kernel: Hardware name: Dell Inc. Dell Pro
    Max 14 Premium MA14250/0TMRG5, BIOS 1.7.1 12/11/2025
    Mar 09 09:13:54 alpha26 kernel: Workqueue: USBC000:00-con2
    ucsi_poll_worker [typec_ucsi]

    Mar 09 09:13:54 alpha26 kernel: Call Trace:
    Mar 09 09:13:54 alpha26 kernel:  <TASK>
    Mar 09 09:13:54 alpha26 kernel:  dump_stack_lvl+0x5d/0x80
    Mar 09 09:13:54 alpha26 kernel:  sysfs_warn_dup.cold+0x17/0x23
    Mar 09 09:13:54 alpha26 kernel: sysfs_do_create_link_sd+0xc6/0xd0
    Mar 09 09:13:54 alpha26 kernel:  typec_probe+0x75/0xf0 [typec
    9ceda448c6e572f91f8deb4f238aee9fc6b9153b]
    Mar 09 09:13:54 alpha26 kernel:  really_probe+0xde/0x380
    ...

So I started to work on a patch to handle this situation (available for 
kernel 6.19 here: 
https://gitlab.archlinux.org/fs75/linux-ts5plus/-/blob/v6.19-ts5plus-test/ts5-test.patch?ref_type=heads 
)

Instead of using the hard coded "partner" name, it now use the device 
name instead. And the struct is updated to have multiple partners.

    $ ls -la /sys/devices/platform/USBC000:00/typec/port1/port1.0
    drwxr-xr-x 4 root root    0 Mar 22 17:17 .
    drwxr-xr-x 9 root root    0 Mar 22 17:16 ..
    -rw-r--r-- 1 root root 4096 Mar 22 17:17 active
    -r--r--r-- 1 root root 4096 Mar 22 17:17 mode
    drwxr-xr-x 2 root root    0 Mar 22 17:16 mode1
    lrwxrwxrwx 1 root root    0 Mar 22 17:17 port1-partner.0 ->
    ../port1-partner/port1-partner.0
    lrwxrwxrwx 1 root root    0 Mar 22 17:17 port1-partner.1 ->
    ../port1-partner/port1-partner.1
    drwxr-xr-x 2 root root    0 Mar 22 17:16 power
    -r--r--r-- 1 root root 4096 Mar 22 17:17 svid
    -rw-r--r-- 1 root root 4096 Mar 22 17:16 uevent
    -r--r--r-- 1 root root 4096 Mar 22 17:17 vdo

My question is: how do I get my patch reviewed/merged ?


Thank you

François



