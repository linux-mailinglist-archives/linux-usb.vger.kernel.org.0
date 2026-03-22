Return-Path: <linux-usb+bounces-35287-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF5fJft1v2lo5AMAu9opvQ
	(envelope-from <linux-usb+bounces-35287-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 05:54:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E44BF2E83A1
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 05:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E0203013A8A
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 04:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F8A33065B;
	Sun, 22 Mar 2026 04:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZNrn4N8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F47175A6E
	for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 04:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774155243; cv=none; b=AltbGUX6tWhVHSlnJoMVIFT0P0aT9fHlMa4zY8XlP+hzbHDa8RSXR3IQiuUndFNaKe4Xyr3i+PhQ1miYgIk3RIa0eWnDfEdz9v5dQHIu/srQoL3nIQHWhGQH+W32iKk33QTJZbXIknU3WZJli7+a5cK+ODfR73oNEwYw0D7wlag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774155243; c=relaxed/simple;
	bh=4NO9JUJhyayWXRGH7TucTjOwS9UYDPyhXQDSeG2XibM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VHC6WLTUkvV6cXFOtm2tCaHk1Y/gpuwAvL93nx373/mxaEQzXcXPNJxe2atR/9sxqq/NkkIY7dfBsnkcSm4ilXfIXpUrAkP+E6yPos6UxGZXm7mliRxVtHSZEy7pPOgD25whh7ZCzVZaG3J05aHOTuXODW+rCcm8KxpbniqHbmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZNrn4N8; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-668d4751a3bso2750256a12.2
        for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2026 21:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774155241; x=1774760041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rceXIYjkxGxkrV6mCBwPxwxWKyKTu91DLeOrWHZGrOQ=;
        b=nZNrn4N8GRWlH5KJICEUmAgZUc1+B/qUxslhAgsp/m/5UABEM1Gnld63W0RapXk+24
         qkVhn9CyppMkWGUmeePCgAPzvNUpbiAK00tBKq0fFP36qkZS+UX36S5p3OZuC2tLWQRe
         I03BIUXUMIJg5SSQ4np6EjEZHuGlpP7UJndNe0L1r5VFOAM/RM6kQG6UYNYkrs4wHp4g
         V2DfGrlhU5+RDGAbgHEQ8zVew4lvlvY1LVxSaqNaCexegR6nNu50GYV9+FnhgGkmjNp9
         i64TZ8DbEI6hLwopvaNalrWVZnxFRSOFf+EjJyK7BiSfR/dlvdO6N1CgUxamFzgi/oSM
         izqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774155241; x=1774760041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rceXIYjkxGxkrV6mCBwPxwxWKyKTu91DLeOrWHZGrOQ=;
        b=TSYZ3x4uqWVxnzARofmLYPGfJ+qfIuwyc0q/RnNlAwKWLWQezRZ4+iudeZZdog7ul4
         5JoUKXjb0GRWQpb8YmNmG/xS8xYT6oqcGyOkXjZwLaqjr68kFs8mFVOGEBkYs9RaAdYe
         gpWVGsm0CZeMk9XBnvCHJBhymyDKR4Z7xtLNMYJzVaS7r7T2sug19GwueRQpxYJRuEgH
         9PJOJ3aVK6NSPeCE881sXCWoiA8GjNbI3RDYGDbmqXIUtFc+RiDcLYHrThV3bfYVmKal
         DUaHxzINXEffQzd9QFp5v/9PjmTKMvTcS1OSOPJC0WCQDQogg+Ao13FY8Ig1LyRUWmfx
         5UOw==
X-Forwarded-Encrypted: i=1; AJvYcCUV31A9wEGm5jCV1dfQ9w/IlzJ1PizmdvS5ZNu80UDYqgmEtIkTGVz9rCeX/20BaKFQN6ZBqS/0BBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfgFFJLQQ2kS4BE2pq+wWd6IRQPVv3yuaC7ApxiVbJJUwrwXju
	3gNjcAFJngoVzL9pmTpSjAC9oUpgXyd8RtWp1SJU4mdcJbkTozjYY6zb
X-Gm-Gg: ATEYQzwBKWwKGtJ3RcnvYjnbiMZc8CuSv+jq5SJ9KzII4NDOsmcCmVFGJb9eh9UfMsw
	fkshPY2DoGudc51qP+wgnK5o6nPyO3M9JNORiVTLQLjVQC30Kf3iA6BikVsquZi/JbURJInH39S
	EGEnPwK5KxS4k5u2mN0KnE3PM4bf57uPrmkZkYRcg1TXPX5+bajgCM99UqlDbAqCXYFbMamyYKh
	RHYNC+VptAEvuYxS+p0iUrSsQSFtOvUkhIUzLrNI+S7d5eZII/xjC7jmsRQu6E+Ffj0sZyRq8CX
	W9FKg525qtSVOic15l3jBT73AWNTs7jRBlt5tZAB8NdWQZ2Ln9/WZhmIMWF3YnC/Qusuy3GDRt9
	gM+U7a4ju07byHM8tC7JDSdQoNAtktr328lzXdVnlBlc2MEFXbNBy12rVMp8OqFlslR1kCyOCbD
	V7EiX1pHFrUys+COs23B1wFSV4v1PgROy4Vc0=
X-Received: by 2002:a17:907:a807:b0:b96:d6cd:29e6 with SMTP id a640c23a62f3a-b982f0c00e5mr517986566b.2.1774155240526;
        Sat, 21 Mar 2026 21:54:00 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43c3bsm333532066b.2.2026.03.21.21.53.58
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 21 Mar 2026 21:53:59 -0700 (PDT)
Date: Sun, 22 Mar 2026 05:53:54 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: JP Hein <jp@jphein.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
 <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 0/3] USB/UVC: Add quirks to prevent Razer Kiyo Pro xHCI
 cascade failure
Message-ID: <20260322055354.03399a32.michal.pecio@gmail.com>
In-Reply-To: <20260321223713.1219297-1-jp@jphein.com>
References: <20260321223713.1219297-1-jp@jphein.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35287-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E44BF2E83A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 21 Mar 2026 15:37:02 -0700, JP Hein wrote:
> This has been reported as Ubuntu Launchpad Bug #2061177 and affects
> multiple kernel versions (tested on 6.5.x through 6.8.x).

> Tested on:
>   - Kernel: 6.8.0-106-generic (Ubuntu 24.04)

How many of those problems still exist on current releases,
where hese patches would end up applied?

Does anyone have a repro?

How does it behave on non-Intel USB controllers?

Regards,
Michal

