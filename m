Return-Path: <linux-usb+bounces-36432-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Id9NDfh6WkamgIAu9opvQ
	(envelope-from <linux-usb+bounces-36432-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 11:07:03 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6A044F066
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 11:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9922C300C0E0
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 09:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056E93C3BF5;
	Thu, 23 Apr 2026 09:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncAOlOfo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3AC382286
	for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 09:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776935215; cv=none; b=pOCUr4y8rfmIDwmSkn6OjKxwG0E/MpuNb/a51esWB51R036eDxmn0Qf+BuwiN0yRGd33ATJkikPq2AENxy+U0kck9ZeHYFGTcOaon4QW5m3jraIyciJ7bwyp78Zv6xpyoC8d4q7DrDzDy8+rSNgt3jTxgeZrd1PAdPMhUCrClOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776935215; c=relaxed/simple;
	bh=ekBPy6xnya2iJzaxncPdTe/UgC/zfxmBeyK3mGiBHAI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=okZFhpxrZu+JgiEDuteu2dqmGXs+erXZY5LsYy6XdcQmWwKywaQWM32PInWspL4EKHAn43x3W+bnpwADLr1PVidTYUnxz5De5vLGsFgXKs2EJYb1WwAZQFJwRax+6yiNOMiEGhr+l1RumTTNvHyR2UN6Tibv/KdoVqKwmuvuofE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncAOlOfo; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38e7d983f79so49492661fa.0
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 02:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776935212; x=1777540012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZEJokfOZmv1qCJyESOa1O3xCJORWT+u8SCkhe3TFhk=;
        b=ncAOlOfopIymhadmvLeWmG93rkBGW913wWclMBPgZYGm8q4VacOomDIfpQWRmbmF3x
         RD/ukd7E+qeZwYYtpgfwojcX3NQhvVbKNE+LiM4Gxn7tCMsjS2UPTTloKii/maLxvGg5
         cpFrQL6SQaPtJfsu8dhyzsJ7h+gXO8SIMH0aba5HbD/nv0p3B+BZpDSAZQYLcByEGdKm
         MK8VrpHJD29KXn2w9K6XLecSWhmEsTAIrESCKpkEX9HgGb35r/qNwb1zDCXNuta+kZH4
         5dzXTt3bMoDANTAP2osuhgJS6M/VKcOsGEzeaWHLTPFCOPG0Lxyh8CDqDnb7X0/+6YnD
         tlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776935212; x=1777540012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PZEJokfOZmv1qCJyESOa1O3xCJORWT+u8SCkhe3TFhk=;
        b=JO1mzA1ZX8MI1M4MWH+9JG+qSXAB2CvDi9xKF0zLsnojuZG0HWihscSpZLT6Aye9L5
         ClTROYrj2TUDnspX//vrdFVx2P1QkM4sLrGhTdubXPJd4xQA23wEAVq7WrazXxeDT37R
         n0v+9nqrug775f/6UUzSZJp8vEkiDqn4c1SJ56bwwNhvUphN11w/88TAiKercuzq8ddO
         XOsFql+MUd4vum+D2tXFKhf9N27L+lcuFhCQUjtnYUswcfMj5RBfrqdtX/fDzS5XTlDD
         O0/vo9jmaWdJiYJChC0geMdtyhNO4aiy4LfBKObGx6Hroic+7GmwF2j6kvPSWM0vO0wz
         Tmig==
X-Forwarded-Encrypted: i=1; AFNElJ9c+4dCTjgHgR/HkWrShJZBr7OUqV+YiiX7PeCOJDWcQI57LO5GkpFDw44EZGQCijCPdgfVznIRJww=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXaNugLszv2oMCf3rcaGBbtZPnfsaDYd6EnO43BSUhPPf/ye+1
	J1ss88r5qs/INzsL8bcEMHqSQaLNnqvq5qqxqDBfDMZLL0ufCLy0y47r
X-Gm-Gg: AeBDievCyuebA71fzpJpzxsfGzEF/NjKOjHvb21gzZDCvPJNj3N9UsclQEQxdu5eoAD
	9EylyMYvOoa7ge9aFoQr1Sbh1IkYa7RHiznlcfGq5JKNZKAxbQIr1JZnLktGKojzxF2Lngy+qIf
	FMfqf6TS8KcOsVGtTSUeiYG19i0hSp/rCbmP48Kk5rbvQGMngXtWaYHkUQngEgcIMhJhytRf+KS
	5WtmBqwHKzcVHp/cyJPcqhVlrsBTRvqOPmuYGe0T+np4/fu6ykKqFN+ZOD1sglbNZi5FkRRB3ji
	LSeK8i8Iv8tUETXcR+SsMc0qQMauKvlkVgZIaiFFlkESFXRNocV62TsO/SZc5h0aYteWGgKQgY7
	LN4KMLr4b/ylG2ekniSFTKEFgb0esxCR494UEgPweGKtndMmaQzBEKKzVfXMy7JVs5Srq/OsqR8
	ERQVdNObZukciKtTI5MJzVuwMd+G+gw7EN07y900TWFlI=
X-Received: by 2002:a05:651c:41dc:b0:38e:85a3:fdf5 with SMTP id 38308e7fff4ca-38ec7aa49c7mr82018051fa.18.1776935212249;
        Thu, 23 Apr 2026 02:06:52 -0700 (PDT)
Received: from foxbook (bfh75.neoplus.adsl.tpnet.pl. [83.28.45.75])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f5125sm40606501fa.8.2026.04.23.02.06.51
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 23 Apr 2026 02:06:51 -0700 (PDT)
Date: Thu, 23 Apr 2026 11:06:48 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Xuetao (kirin)" <xuetao09@huawei.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Alan Stern
 <stern@rowland.harvard.edu>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <caiyadong@huawei.com>, <stable@kernel.org>
Subject: [PATCH 1/2] usb: core: Fix root hub descriptor wBytesPerInterval
Message-ID: <20260423110648.158ec861.michal.pecio@gmail.com>
In-Reply-To: <20260423110517.664745da.michal.pecio@gmail.com>
References: <20260402021400.28853-1-xuetao09@huawei.com>
	<2026040241-purveyor-bakery-a9f1@gregkh>
	<c463f9ed-22ed-4ee6-b4fa-2933770e9c4c@huawei.com>
	<74f1bb0d-24c3-44be-9583-0585863cdae3@rowland.harvard.edu>
	<2026040221-reclusive-garland-6281@gregkh>
	<c2d89ac0-1d5c-45b8-ab68-53214546a7ae@huawei.com>
	<00ad170a-2546-4d7a-8f8b-af6d46e09a73@huawei.com>
	<20260423110517.664745da.michal.pecio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36432-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D6A044F066
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Per USB3 9.6.7, it's "the total number of bytes this endpoint will
transfer every service interval". There seems to be no good reason
to have wBytesPerInterval < wMaxPacketSize - either one is too low
or the other too high. Here, wBytesPerInterval is too low for hubs
with more than 15 ports and xHCI spec allows such root hubs.

This is inconsequential for emulated root hubs, but we may want to
override and log suspiciously low wBytesPerInterval in descriptors,
so fix this to prevent nuisance warnings.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/core/hcd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 89221f1ce769..fc8130f94ca5 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -339,7 +339,8 @@ static const u8 ss_rh_config_descriptor[] = {
 		     /* Companion */
 	0x00,        /* __u8 ss_bMaxBurst; allows 1 TX between ACKs */
 	0x00,        /* __u8 ss_bmAttributes; 1 packet per service interval */
-	0x02, 0x00   /* __le16 ss_wBytesPerInterval; 15 bits for max 15 ports */
+		     /* __le16 ss_wBytesPerInterval; same as wMaxPacketSize */
+	(USB_MAXCHILDREN + 1 + 7) / 8, 0x00,
 };
 
 /* authorized_default behaviour:
-- 
2.48.1

