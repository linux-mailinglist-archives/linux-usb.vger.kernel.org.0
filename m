Return-Path: <linux-usb+bounces-34878-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHY/CQIVuGl/YwEAu9opvQ
	(envelope-from <linux-usb+bounces-34878-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 15:34:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8549B29B734
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 15:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31515301F338
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 14:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F07F29B20D;
	Mon, 16 Mar 2026 14:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtkVn6h6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71B926E173
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 14:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671612; cv=none; b=syKQlmvyov15i5Kpd3j843R6+oGmWuBGkwSDHpHLp5N2sO44VPfMQAtHNHljTb72NIGL5p5apMQxB46VOc7Uu+v0keQNxzIcHxQGVfZY+JQGKap+eBNt0RbtMRxlmp7Kxh54xGI3URYJe9FrTUFUDPz5WUynUDAuzXK7TRO+GQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671612; c=relaxed/simple;
	bh=ovFl0FRA/Y50902pWqD3zOFTf5Y8L0LkM20eP95/xVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQ3SLPAuhZ76cPG+mfbBudBvRPozPaJSfrxdE0TyTWDX8pxTG9t3w9yU3bPC/M8gNa/LfdH8tlbw7XeuRPljcDPbbt5IKcdQasusDAzJ/9tlwemWNBgj4s8fENerqsWlu4JoINDRi26UNwqd0iyl97/RT0/c8OkUfXBRgXB6yRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtkVn6h6; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so1334374f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 07:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773671609; x=1774276409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovFl0FRA/Y50902pWqD3zOFTf5Y8L0LkM20eP95/xVw=;
        b=KtkVn6h6JqJikItyIXK6w6Evu8ALKW2c3vDiRRMAF3DKvXKfSfx9tJP2VlZNI+om3U
         tCxG8uf0VLhsV2ungGj3G8VrPibRs8d90seIi9UJo3CiSyphmubwmGDxcKZ8p+0/Qsf0
         wYPdnhC/1doIFu4ZOr5c1VYYJjH6FNMPUz5KVhiIiKl/fXhmuiZzyU+sgYqX3h46TI3n
         d9AaKFXjVdwhd3H4UtNOyRjBLgJCiGr9YVb9xkVxBNZTSTCBbK6Yf8caiXxiv2tBfgwV
         szBYQf2ZW8FAoi4Flz8PzZD8J7jlyPeEbd9+YvB3UHqkty3LxBR4A1CEhOZUsY/q4JSJ
         lc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773671609; x=1774276409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ovFl0FRA/Y50902pWqD3zOFTf5Y8L0LkM20eP95/xVw=;
        b=DWmtoJPSE6uCdAPUA7CXg5sY1W/TQoHkjGx9veQCUEnSPRPN6jXpT1BLvxxGHmoN6B
         lyIompsHS7g0yRPL+iQVNPlAMTcvFrQ0AGyxG7IszPeQj0TdZLV2USw1ds3vszb+SVNB
         0sz8PmRew1CrbaXBIxqTKjnxSoHqvZ5isQs55jTcWnfEihnzgunTiej15WAvX3Eof+W+
         xJfd1PIB0n9GzDDlH6kwzJzNEIWSAZm2YqHq6YoZzCJFTTSx2KHBRqBbd5YzUEom0iyE
         n0yY3tM7oO0Xf5EgkvZmxOIQAgjM69z5PvSW0uKQEGuHLB7CZB59RTWDzDjSvYyYKM+C
         eL/g==
X-Forwarded-Encrypted: i=1; AJvYcCULrjNAi+dPSQ22NRJvPsdU6/saxmOoJ0Wsv1N/v67pZdNZPGdZ3dLQ0Cs2s3hiZDDtzQGBzPNoBVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDPhmFt5XDz6C7yzLMbK/2pQYzqj6Xb8Au07yNw731K2Ss5RhC
	VxUfW533ea703OY+NnZiYvSqiTNQ5ntYtm65nHvlF9STyaIUgHixp5G2yhAK8XI0
X-Gm-Gg: ATEYQzxUrUGQF2mEPiTZvkOXhtbDhhY3Xg41zvK4mmo+nZ7nNYksUpAtvrp3FP89vuZ
	lNCouYWdcbsOJU1wEibJ2KMyq6mKmaw4FewPplNZmqi9pvJsimRaSgZ2y4yU8giHXi5yKLKCWz1
	cu1ksCh7ye6ngjp5VFvqYNt3GEvZwUhg6vhwGN12dsNt0TZcAhRX3mcPad9IfNvX92hbEqy6COh
	3XsiOOpdLakRoSQPSdR1v5gX5lebRqqxBkR/ToXzFl4hbbMzbCk2gt5kZvrFO+WFuwbKZ5LvMET
	DhOQkUxB8xS0QEf8JajKujrw7sIwZQEvS54Ldpn2niDXF9zxNlKdGgZbVe4lTyiIVCDj48NEjBz
	CwFY8Y6oD5Gw+HAHkJM9bA7hKrgumbgM+Vcq3FtNpzgGigIwsJgZjxO4W7RwR7JW24N8WlqGgRY
	9WkIkIzjqgUvW0yu/Tq6zVA83xWJXfFfOkbIV4vjJGQRA0yAUcHKw2X3EvK7R0AmpHY8jEc8zlx
	Jeg5RnP3AnvSQY9aa34Lkd8icB2xMCKCBSn9SWc8qnO0HKkwM1UYXTKi/CTHCUO6Uv66fNq1m9i
	dPLHdUGUzHs=
X-Received: by 2002:adf:e984:0:b0:43b:3c32:d901 with SMTP id ffacd0b85a97d-43b3c32dbd9mr10069381f8f.11.1773671608811;
        Mon, 16 Mar 2026 07:33:28 -0700 (PDT)
Received: from scambox.localdomain (5-198-68-184.static.kc.net.uk. [5.198.68.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b468cf785sm4877457f8f.12.2026.03.16.07.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:33:28 -0700 (PDT)
From: Edward Blair <edward.blair@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: acpi: skip generic I2C device when vendor-specific sibling exists
Date: Mon, 16 Mar 2026 14:32:42 +0000
Message-ID: <20260316143242.24248-1-edward.blair@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316131219.GD2275908@black.igk.intel.com>
References: <20260316131219.GD2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-34878-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwardblair@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8549B29B734
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 16 Mar 2026 at 13:12, Mika Westerberg wrote:
> Are they both 'present'? I mean their _STA() returns 0xF for both?

MSFT8000:00 has no _STA method at all. The sysfs status attribute is
absent, which only happens when acpi_has_method(handle, "_STA")
returns false (device_sysfs.c line 591). So it defaults to present per
the ACPI spec. ITE8853:00 has _STA returning 0xF.

As Heikki pointed out, MSFT8000 is the RhProxy device, not UCSI. My
mistake in the commit message.

> We have a quirk table already in drivers/acpi/x86/utils.c that I
> think could be used to mark the other one being not present.

That would work. acpi_device_override_status() runs before _STA
evaluation so it can force status=0 even without a _STA method.

My concern is scope. MSFT8000 is a Windows-only Resource Hub Proxy
(RhProxy) device with no Linux driver, no module binding, and no
in-kernel consumer. It's a static ACPI node with no _STA, so the
BIOS exports it unconditionally. Skipping it during I2C client
enumeration would have zero functional impact on Linux while avoiding
a quirk table entry that needs duplicating per board.

Thanks,
Edward

