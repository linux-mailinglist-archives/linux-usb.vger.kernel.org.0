Return-Path: <linux-usb+bounces-34848-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eE1jE9DJt2kRVQEAu9opvQ
	(envelope-from <linux-usb+bounces-34848-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 10:13:52 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCB1296CA6
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 10:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A7DB3055C96
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 09:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B7038422C;
	Mon, 16 Mar 2026 09:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWYlEwok"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CDE381B1B
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 09:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652112; cv=pass; b=RV+PVeJNaQmYf0H6TFT4nFSDlmDo2o45yXs//WP3Rmgx22CSnj+F5S/RcVuOcvwSEM+tyJVs9QzAIWK/jYMUKt86KW710ZcNajd+Br2KJQJUHkLvFDUGh0men9hmt8BMXZ8lEyvgvkIF11MzAiZLDJIXGNz2kyR+zcvTvy8V8zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652112; c=relaxed/simple;
	bh=e1NTUjgORk0VY8Egtdre0eeDntNhk++SEJ7nb5oNIBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A7JyfjMwc+QPneto5eqhhqvBFWzu33Duiwri1VLcIdp9dXnAziNiFUfweE5Kb1OrXvff4jLIuGXiYkkJGW7UCChs+oQytIX6Sw+slWZ3oFQMZGrKj7NVuyht2BWy2mfn1pkrfreAzNND0d6niz8dOcoqd8XlGdOBbdBoLdPGMMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWYlEwok; arc=pass smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-67bb5e4cf5aso2634549eaf.2
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 02:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773652110; cv=none;
        d=google.com; s=arc-20240605;
        b=YlTJmm/vG4WLjvyLrKQwRpFyt/qoxGAT/XRKha+MW//I88j2LPlyxr09cI8S6iLldO
         /aJlmb4l5clCpG9wsB2P71HHx1kDGsvkTYF1V0J11KPPRl83CwCnmlAAkRfa4mvmQEo0
         rS4DGGIK3UcElR7IZJ/6zZ3zDigPFhrNScmHoC7Z9a3zQEMZYZsJAAsUaNu37+XGDaUf
         Ak8e8Plt3+vOe8henPqHS8rxtRtlyOhdJVFNGcK9TZvSmYXaFagQyvMC3nDwC0edzhlR
         llnsXC1rdee+oswnTNCNiWXmUkcxFYHY7N3Q67LJigZPTVz0SW16TbMZ0R2VHWtYkz35
         6XzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e1NTUjgORk0VY8Egtdre0eeDntNhk++SEJ7nb5oNIBw=;
        fh=IWjuD6fYt9mNunSLW1t0dr4qRJxdlATMquqgeRiWKaE=;
        b=c/J8vKOdsSVmbzWq1i6vqnr0ys102EbC2c1iiP31QRNiZo91MuopIx7wpvljpTXNAB
         KUuV5t21IcnyZejWxnGHpw6C8Pl8bu+uJuNa+2JeiRk9g45+JOEQ6GCFCKJU9JUzC/NC
         WWD3FNyZD1dShM93Qx7c3BrDtRBsc/gyQjRNHj9hPhf4xztDMm1FeCfEjvbtUz3AZ330
         p30d+kpBEjk4vAmOLJeJy2t8UUCXWyNC3yEyVl+qmDzRGBFRaLICXY6WRUYYw/1K+oYS
         ciFQmepLf9PlY5CTJmv+OyXvVv8wR/slHNwqEI8xmX0PSjwIHSgm0oe9bdJ6f7hmhwlM
         pL1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773652110; x=1774256910; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e1NTUjgORk0VY8Egtdre0eeDntNhk++SEJ7nb5oNIBw=;
        b=iWYlEwokHmHLSHUHEG3daDYwvwff2BzMf5znb8VoW6CmYDLUdZW6P2dneDYwH16qeb
         z1eM0x0BTigx9F8qBXZcASP/EdXTaUB2yOy8yigZUacbDoYSZp4E/jQyJ0os5RGECXse
         EAsUPM/k+0GRhXeg1yx8QtKFAY2VuBEZqpLqCmb4gofY/WNCOjoqGGOp3+YzyMgeRRuS
         K7VPMsFi9oZ0CcR43vXxMFxT9iH5esORmAHAQeC5ac3P508vWtY5/GSct6bwCqPEeq/5
         H+pvLSqj+ToSpZpw2uTtJx5Dc89hVm4pvImRO4eZ2aYuXLYXqGOortf2mHQ68IwSlPxG
         P1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773652110; x=1774256910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1NTUjgORk0VY8Egtdre0eeDntNhk++SEJ7nb5oNIBw=;
        b=AT73qP/c/ABbenx8Iniasc4FhINEV1oBRjkIYMNEfubL4Y+VJXhl3iYvM1ojQt31Cq
         tI4bhSreVVer4l7zDg3yOHLE5JESU7/7qmbPlRQI2+TtNSTfNCWuWX2d407dMkCcDshX
         nv6Q4WvEGp7RNh2Egu/0frGzUf70TYTR9/NYNC+SztWT57waGMPeNvyex9Xjs3FMEdF1
         bWNPtbZSAkH4wHitDp2HAGvFhvM4cEM+V1SqIYrwcMcYYqgfKjPa4pzHe3B7wEwoHDzJ
         1U2iwEpaBE8C0buT3xSalL/qFvmU4j02MKS/BZ799ebpPLmgjYYP3CVODP97RNNsYNNu
         26tQ==
X-Gm-Message-State: AOJu0YyVGh68ObgZj+tb7wGzDS4B0oA23tnQqEfh6yPasroJBsI749W3
	b42hKgDvu7W0tQHUNnAu1WkT3260ME7eItBHpDMHfhUsSpjN0eENN+VRyaxc8H2Kh8aYcZOZjQr
	LGlzOI3UE3UEi7wbHQ9ybZJCQpMgwqRPm1S7W
X-Gm-Gg: ATEYQzzuDqlcTve/OSAqYxdBG8QE/S7HIUePrDRxsgx7aNe/OUYq7j0+Z4il0j/JAFI
	OtUxXDMSWGW1DMTOtF31Js0JrxEOh1EnTC4on1ecGirgfJkAl5iuHhcRFxMTHbi4USkq28FLaXy
	nGOz8F3aqnhYXAUSaM3CG4jiegyhjZL+8qbW4uOD5G2eE7vJTTVr1W4FoCw9G+JOXfFtebZqIqj
	+63TLJ/k7r4+dHpTClBttXejRGQuLbvDI6QYMKaWVk39/Ksqee7E6z1J2K27NrbCo5UE0zpzTuO
	Q4QCwO9vWgvSaj79XUgdVNOkzE4MBV8M0S9476D0HuxSRHXp
X-Received: by 2002:a05:6820:2909:b0:662:fbd6:1849 with SMTP id
 006d021491bc7-67bda98cb6dmr7947615eaf.4.1773652110143; Mon, 16 Mar 2026
 02:08:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260315111827.20205-1-Loke.Forsberg@gmail.com> <2026031617-hypocrisy-lion-cb8e@gregkh>
In-Reply-To: <2026031617-hypocrisy-lion-cb8e@gregkh>
From: Loke Forsberg <loke.forsberg@gmail.com>
Date: Mon, 16 Mar 2026 10:08:19 +0100
X-Gm-Features: AaiRm52T2Smr45LpLFNtDU2SfUxXBFQsyXF_qQ90gLIGGU0SP5DsAcEv-pM0sYg
Message-ID: <CAKMvwTZMF_advDvKCskqA_6_VrkjsbJkYjT2+NCyFUDnQCc=ow@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_ncm: replace kzalloc with kzalloc_obj
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, khtsai@google.com, raubcameo@gmail.com, 
	kees@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34848-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,gmail.com,kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lokeforsberg@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AFCB1296CA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Why have you used GFP_KERNEL when kzalloc_obj() does not need that for
> the default case?

I was following the pattern from the original kzalloc and didnt
realize it defaults to it. I will fix it and send a v2

Regards,
Loke Forsberg

