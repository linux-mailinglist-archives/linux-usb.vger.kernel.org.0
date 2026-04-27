Return-Path: <linux-usb+bounces-36541-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFXAK41Z72n5AQEAu9opvQ
	(envelope-from <linux-usb+bounces-36541-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 14:41:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0636B472A58
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 14:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AA933034BD6
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 12:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427B23B8BD4;
	Mon, 27 Apr 2026 12:37:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31AD245019
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 12:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777293424; cv=none; b=ctRi0c/kOVCBY0DKId7vI3jK6k6o/2W3VmYKJAH74K7vdG8snVVt0F/D8lHwamZ0BW31rFHTbMCOwbUYyx54ovfIyBTdbPZmkWp9CJGroWu7Ur3aQjn9BLzKEJM9rQAZkmywbeLvhv9c7o3d8gEOnJYJBlNqlxH5UO+iAqJ3JLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777293424; c=relaxed/simple;
	bh=vXOU4fwxua0wfE84jUc7Mndd8a3pb6aGEcU2lZD1Xjw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=M7k4U+cix7Ovmv/azCVxK0VYw97zXZej37zap8t1a1yksB0KJCdWTwO8127Thtk49cvPP/HvGIZgThzBrtXV7FpUp0J04oQDIvecdoStfwSw3djxXI4K9ZJv0WtT5O0oiaAFqaIebnZtt/545v56UgcWzY3pepQK15TvR9s7cXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7dce437f1a1so11916440a34.3
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 05:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777293421; x=1777898221;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uV1d4npxQgPCoNXo38CscKcMGh7Yi9dC0yICsjMqiuk=;
        b=JCynjn34VpxXI5g5cGuFo5TRkMC7fFlCtOA0CZM05MDWuXiV0SyZ81dKAt7KXR+nlY
         +SR8mq7BsC4Ro3cw77oZ91MhJsEkZeUGswo6q8hxrgrVqZ3pt1CBINlwpKdWKWDQZpH4
         gJpGezBO+8JthFKlL9xOJHGQGXiSeieHZm1bv8Kuw6y368xr9T0hvx6rdgGXc8UgYP6S
         XXC7epfCeJtwVePttHYEU+apP86eqcmQFdJvwMoIg1n2z/NQYYFXi+39r6v5qFIheECq
         81xj8xEUckK1QSibEA3cXaCFUxcgq8zev/bVethpohhV/bmgtx+MxfJ8c80fPtNfnJGy
         NCHw==
X-Forwarded-Encrypted: i=1; AFNElJ9vSaXOhIvURAg0f+7TDpVojjZ0V0FrmYzYY+3OXRUl7WtIUXkVYlt8oYqBPHYnbWHgvmpCSDEqaaE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1w7mDFRM5t4Pi3sHHTcm/DndM1IX4ZfFQBM7Xp7DwYuJkoC4v
	YHtZ4s7mvE/yp2XcdYoGfWUs+HJu0AK7letKSyPi+s2p/tTaI26ah0Q6xJBJOxMEC2YLW7mCsza
	UobwNEDhvmzUrpj4zRZus/1zqPxGLZpVS4LClir+BMnRzxgzwG+hdCD0TcFc=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1846:b0:696:15bf:ca5f with SMTP id
 006d021491bc7-69615bfcc0emr11420697eaf.19.1777293421752; Mon, 27 Apr 2026
 05:37:01 -0700 (PDT)
Date: Mon, 27 Apr 2026 05:37:01 -0700
In-Reply-To: <9fea44a5-83de-41ed-9531-11e5d471dca4@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69ef586d.a00a0220.316485.000c.GAE@google.com>
Subject: Re: [syzbot] [usb?] memory leak in hub_event (4)
From: syzbot <syzbot+2afd7e71155c7e241560@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, oneukum@suse.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 0636B472A58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=ac5083db84233db3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36541-lists,linux-usb=lfdr.de,2afd7e71155c7e241560];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://repo/address.git on commit dd6c438c3e64: failed to run ["git" "fetch" "--force" "--tags" "b7cf8f2fbfc36c709a08e0b9c77990e491473738"]: exit status 128


Tested on:

commit:         [unknown 
git tree:       git://repo/address.git dd6c438c3e64
kernel config:  https://syzkaller.appspot.com/x/.config?x=ac5083db84233db3
dashboard link: https://syzkaller.appspot.com/bug?extid=2afd7e71155c7e241560
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1575b236580000


