Return-Path: <linux-usb+bounces-36802-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFVJJTTE82mR6wEAu9opvQ
	(envelope-from <linux-usb+bounces-36802-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 23:05:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5414A8018
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 23:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAE53300B9E6
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 21:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A497B3B0AD3;
	Thu, 30 Apr 2026 21:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E39r32m+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0814D17A2E8
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 21:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777583071; cv=none; b=NbPivyY2AAvgNd/xbem/agDyOozz85mIQZlH4EpdsFhhXYfe6pcaVX2RtpLz9/mM0LO8Yko3iyC9AYqp/QkHq9EEkpTr6Y8CJ5bk386X01575+4CY76xwaDm2eaQJii/rmzkRmQamnXh4D7oQGBQ5hGVOnd8MKtuWCjlFU6fC94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777583071; c=relaxed/simple;
	bh=AXaBC6uLtMLMx0KLblAysy0w4TxdkHZ2WrZg8Y0ErqE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eMMhe3hG0jYHlOPQowodI8zBJMH5xNqKG5WEyrLcup5E65zucDDUlpCSxgDU7wd6xyTQRI1gVTQ0CIF0aE4vgDLKFl1vaf9Oobh0702tTmxCgOqIx2HAkHSj9pDku/eY4daC1XQZMvONqOTK/yEBV0ZY3+FLDIu3XWc+nPFDeL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E39r32m+; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38dd575bca3so25464281fa.1
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 14:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777583068; x=1778187868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXaBC6uLtMLMx0KLblAysy0w4TxdkHZ2WrZg8Y0ErqE=;
        b=E39r32m+mmKJTYFuiu0pH55I2RdKHBlWtpnQmfk/XT0OJPzB3/r8Plx84lfdZSa1HP
         Ql2kTX85gnfGWfH2mfIUEt4kkxn8UtDykl4e5Ul9VbGTIf5ljAsCt0NoOL/KK3qg+VYw
         yIRuL2M17WStxGi/iTnqCvoDrQThYbnQyon4RZe2oNkNhL5DC7e+Lt/sAywKO6f/8G6x
         9smuCn8OyJbTmYyreZq4BZm2M/NXX9k6UYKeL/qQEytNhenCK0ImhVdvJZkirV1vA+xI
         PJDIpp+EpoIy6yYJz1JqIDtvWX/J7PJSTC7eeZfiAEJQm15NdeSupPlf4Iyr1zZCKmoq
         +DAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777583068; x=1778187868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AXaBC6uLtMLMx0KLblAysy0w4TxdkHZ2WrZg8Y0ErqE=;
        b=os9VSxekdxVBNOaNvfeqiWRS/Vz+zGcsMnmuW328Dn5nvNA/s4StKWd49QzKchPvsE
         hggYqIO4zllFUR6/sEdv9nuJ+XtyAtzzjE/PVc5/i3HgiyYmHUFRcgF6e0Lk6fE/pa5A
         PhfWEUYf08WNIrioCf0M/nlvw2/Cunb1hR79P3FzoR7QOzOYNGbwWZ/yi6YBTfPXiZzi
         8ATNlesMF0XaU2FCSnMrGNZYMrs27YH/G7M2SFSprqYh97M3QuR5jvUXux4AMspvf+Fk
         zvIMqisRhH2BvadpAsvojwkx9S/VwxOBAsf09y98J0Tovvrt2yJGANea6/3cipYUw7uC
         p8tw==
X-Forwarded-Encrypted: i=1; AFNElJ9hIH4hruJj3os556LqnDAScFWAp3X/4DrsXAY/AafOIdqyd01vBeojnVDOvIOD4KMAdB8qkkgAYDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvOCNKB/XHjeZnRkPiwI5G6HkgNuJyTwHj5BN0fhvtCYLUXwPw
	7CzFRtEXfuXQZ2Uua66OBKhb5GJUAiacHxAdTEVK2fwDdxV3mqU+WrE4mSpHPA==
X-Gm-Gg: AeBDietgWiAbeMozVxm0IgpRsddXpH+12yRJdgavoOzUftqNkQofQpVh4+5ap9ITz8M
	YJmWBnVuuUKTQCBXNsg9rj0AsgH7BrafqjBzMMe98eppwwyv0xETQd4uSROcwMahdeaS3j9jgGp
	WKbd/lw7YT3qBnHAwhHoE1grEwAxD8MD7doajdTYGCtxYVLdee75hHY8NhJ/UxJUdMQSco6v2jY
	MMrLtZs6yoMmV2kwlj+d8YrM9vA7Zv6ZZNgd7TCXYplvm5DM68AI8cLP5VmMB+Od2UVM5s9wfTZ
	4A6L0zLlHh/ndbRqiZXIkRvmL0McyG/WxHsWNUGRzBUOn1bt7Vm3kpOgoDaXRL/8TdA2+qfmxht
	m1yfd88eiYlcW1hG12/63Yi+JvwSpB7OKxNpjathVJ15maLt4f67n7Y4RhtQpHbViw7bG4i6Ky8
	9HBFyxaGVokKxiFjuCMF2DiNXncYRIHXkbnuTLVeJjEvI=
X-Received: by 2002:a05:6512:3b2c:b0:5a3:e7f1:5946 with SMTP id 2adb3069b0e04-5a85272126cmr1431698e87.9.1777583067906;
        Thu, 30 Apr 2026 14:04:27 -0700 (PDT)
Received: from foxbook (bfh75.neoplus.adsl.tpnet.pl. [83.28.45.75])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85af54d72sm38841e87.7.2026.04.30.14.04.25
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 30 Apr 2026 14:04:26 -0700 (PDT)
Date: Thu, 30 Apr 2026 23:04:22 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Heitor Alves de Siqueira" <halves@igalia.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel-dev@igalia.com>,
 <syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com>,
 <stable@kernel.org>
Subject: Re: [PATCH v2] usb: usbtmc: reject invalid interrupt endpoints
Message-ID: <20260430230300.5a67c1dd.michal.pecio@gmail.com>
In-Reply-To: <20260430224849.3322afb0.michal.pecio@gmail.com>
References: <20260423-usbtmc-iin-size-v2-1-31afa4874f71@igalia.com>
	<20260424002839.5ad25517.michal.pecio@gmail.com>
	<DI51WD2C7TJF.1X6B12NO0OO4@igalia.com>
	<20260429001626.2f08b991.michal.pecio@gmail.com>
	<DI6PD3MOZAXW.RNUBKGQG1O6M@igalia.com>
	<20260430224849.3322afb0.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: EE5414A8018
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36802-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,abbfd103085885cf16a2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Thu, 30 Apr 2026 22:48:49 +0200, Michal Pecio wrote:
> The only change to support USB488 devices with wMaxPacketSize == 1
> should be increasing URB size to at least 2 bytes. But I wouldn't
> bother when no such HW is known to exist, and surely not as part of
> a barely related bugfix patch.

Correction: I noticed that USB488 spec Table 22 requires wMaxPacketSize
to be exactly 0x02, unless the device sends vendor notifications.

One could argue that 0x01 is covered by this exception, but that's
obviously against the intent.

So for bInterfaceProtocol 1 devices, requiring wMaxPacketSize >= 2
should be OK, but bInterfaceProtocol 0 devices are unclear.

Regards,
Michal

