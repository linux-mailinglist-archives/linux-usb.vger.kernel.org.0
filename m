Return-Path: <linux-usb+bounces-37556-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PpzIfIECmqNwAQAu9opvQ
	(envelope-from <linux-usb+bounces-37556-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 20:12:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F35BB562EA3
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 20:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA179300B86D
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 18:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7475E3CBE96;
	Sun, 17 May 2026 18:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCAbGWtc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A9A2E7621
	for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 18:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041516; cv=pass; b=H+/oxlM6PqZNy3zpBnjKe3iGoXj1mCT7FNLU5pSXSUIYCq2BhzzRwipexnSDj3Iv3D3OV94l+cAQ75NWkfOVPIrE2NBa+v01+6IyI7UD6PGwVgDDNBuu/aU6bYlyvR9LLqh9cZT4ZJTzOAoe0qw1cFhzCJmh1OMjVaqdyohk17s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041516; c=relaxed/simple;
	bh=q+TWlZ4+1xqqsdfNjfoFjpGigSMbv8eaadrNwve4XgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3K/H/arzWfWpFuQzp3mUZJdj3cMHUSlITwVPlJqCoalZ3BV3ieb0xaO1pbjuFxhOC474kUs6A959htzkTrkO/0KceFuusCaHs3Dt5V/zwrwtqC9E6ijTvtieL+OmbvOyn3MbVF0hdyW4jhX6ALpYUhS09I2I8JjoJYbuQkIFu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCAbGWtc; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48ff4f8ef0dso16769625e9.3
        for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 11:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779041513; cv=none;
        d=google.com; s=arc-20240605;
        b=Wnc7B0OnrODirbmELy8i6PtxTnBB0TddVlfk0zuK1D2qa806QQC277qutq4LMgFA03
         P5d6q6XehjkKrGr4rB5prByePQiqDfbcnOBZyZYRPY6tJO1dES+9Y/87rPv4XeGWVWKr
         t7MRz5CNEz4P/MgbAtpAxt6rnirABLC7ITSjaBBU5eoqpb03MWW3OMUxCnT2BwSLX4rl
         uCvbr8eI1yBSMd6pGJaLNKyprMXpcJ4jpl4kSqVxcFnH3KqyPKlBz7doV2o3kGhHxQak
         6pVnPFM5lF/kIFUtZskK5hX0hNK4bynht66twQqkHg/3chY3EpPBITvsjCpwp+M+fj1h
         aF0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6lJF1My7V9PTOOKph2a8IDzjgDYamLNVlpuj6PV21LI=;
        fh=Flp2TMsHRjjqA6J112zeCXmWAn1inWZv+D3UTtrewSE=;
        b=hiDQgsZVKBpvO/HAsFGV572ZJzE29jEgomHaOYd1QowC2fdmt9qLQ4hhH6hGUfKV4m
         XL7znoemJXMg6/bMp5L1dR0OSSd6rUNa1cFytATwKRe4Von30uMVGY1JbgaNY4eaOohO
         SKQg+tPOePQD/p+9ePi4H/UD9XXTuFXPiORJahqNmssPJ4Ar1r7yuxwDQ3bTj7rPfKYA
         3i9h7z63Qb7plR08xXaKrJ/UKjf0R8U/9wbFHhzXYJQCvs4eQlC8ZQq5JQscyZUqxIUn
         zJLobt/IYAY9qbWy09G5C1cFDIg/g9clXJhaBzGx+wQNhPPIi6C85o9cKL+KXAEPcfO9
         kSgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779041513; x=1779646313; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lJF1My7V9PTOOKph2a8IDzjgDYamLNVlpuj6PV21LI=;
        b=GCAbGWtcTqm43orw12oCcdzyGqj22MV82fh8btxRwpsalsXX6rP0RKOBiEzjuCUMni
         sK9rWjQ/TUVV84id5ir7dg62Ml/X6cl2+FxwCYjXUOnqFZeuRyP184iXP9Le4dsEyfrJ
         1wFhbv0PbnJDMZfZnjx8NjeTvHhnEjBEMGkYHzLf4nR99Py7JrAZkDG0zfRIvyYERPXL
         CwDCRC8uyOMnagDyvskLMK33PDDc2+MGY8KKJp8P5pugIyh7UvPMnubbNZoxkO3AwZtm
         OlOKDH2MsWlp/ue0QYWtNVNVVSalz+8rojGncHNTS3PSFu5zPxMn3EMwmxYOKt+8NIBK
         /jZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041513; x=1779646313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6lJF1My7V9PTOOKph2a8IDzjgDYamLNVlpuj6PV21LI=;
        b=lozQWO76Ld8s6ne4mTTzIt2KpJTEzbecZRrG06nRFHiq/ldPBiE2pY2Xfw4pbqa02x
         //5I5J76ky5p16hrV2yNSB/mh+4p2tD2/pY1Jc1XuuAX4w5rbzAkhZi4Ez36oM0PHP9J
         gpRAeuc5Kce1Ln74D/VJdLs2kh6DCbK0f2srP1oL2MKBHpz8rUjZBN2vdGyGChkfECw3
         rbxQb5ZigdQax0sJvuO/3OugUJErD90RrUhwtmml/8GyFyMYbotYNPMeT5LxvbfJumWy
         xNlHzwKJ/cGl+DRMn46aaJ5q63wW/yFNYcYr83apvLT3jrcP8n//Ju+K0PGhseQyScC9
         AJ8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/t0js7crsAw7+7yCRQai3GR2e4jtVBdmix7K9sbTbcjKVcp6vMHp5RnffmsAXL62d28997QnVQcMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHRKBdycG2uwIXMWzc7Y6DEXwpu3Xo9d/l8ZjcS5++7THQnHnH
	gGXauPldsXnZZkFqlRd41sYQ/K031FgIBCAI62xjeCQ2FWMTWbzgm7PB19JBKfO0NLBFi6348YY
	1DOlul/FrLwKNnv4eX0VrFHbVujvKxH/Rzr9DABo=
X-Gm-Gg: Acq92OFwanKw0OyGkfzMUVXck0jHP0Ye2+c2SdLBmyjjE/Hu1u0sFbUDXxDhAom8YSE
	3pPJz+JPxsrQ6PxiVm0LBBiuxJdOvKlL3DaMmGIeldUFC5J5UNq6UWxEaN8T9XYKAIzSk4fezrz
	GxFGoH3zCaXUwA9pliTAK4hQrCpsmjUHOMmqkA/2B47XK0zpsc+EVVcZ+C+kLa213YUbr/HVja5
	kwqNMWNyzZrnOyJ+CJ9kk+mTjf5oDFv37zDgwD1qUTpdcoVOtTsuRfpcCCvuWDlr/9TSgRCk/5b
	tY5839kueSCznsKY/T3TExI8ah0ADSRvPkbWXVaerQnGGz3+ayAv
X-Received: by 2002:a05:600c:8b13:b0:48a:6315:da26 with SMTP id
 5b1f17b1804b1-48fe6513492mr201325455e9.26.1779041512615; Sun, 17 May 2026
 11:11:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517000145.1868817-2-eeodqql09@gmail.com> <20260517000731.1869133-2-eeodqql09@gmail.com>
 <772a57d4-039e-40f6-9b3e-1423a6e014e9@rowland.harvard.edu>
In-Reply-To: <772a57d4-039e-40f6-9b3e-1423a6e014e9@rowland.harvard.edu>
From: Seungjin Bae <eeodqql09@gmail.com>
Date: Sun, 17 May 2026 14:11:16 -0400
X-Gm-Features: AVHnY4JZFT27wCQ_r3UTsqmnS9kjzv1Zij6saWGDrLvU6tKkOn6SZ_HHn8KQhVU
Message-ID: <CAAsoPpX8ZjQwESVgtDTrvmnuHwOSNdwPK5-CPejioj3Wq7y9ng@mail.gmail.com>
Subject: Re: [PATCH v2] usb: host: max3421: Fix shift-out-of-bounds in max3421_hub_control()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>, 
	Kees Cook <kees@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	David Mosberger <davidm@egauge.net>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: F35BB562EA3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37556-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eeodqql09@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,harvard.edu:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

2026=EB=85=84 5=EC=9B=94 16=EC=9D=BC (=ED=86=A0) =EC=98=A4=ED=9B=84 9:15, A=
lan Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sat, May 16, 2026 at 08:07:31PM -0400, pip-izony wrote:
> > From: Seungjin Bae <eeodqql09@gmail.com>
> >
> > The `max3421_hub_control()` function handles USB hub class requests
> > to the virtual root hub. In the `default` branches of both the
> > `ClearPortFeature` and `SetPortFeature` switch statements, it modifies
> > `max3421_hcd->port_status` by left shifting 1 by the request's `value`
> > parameter. However, it does not validate whether this shift will exceed
> > the width of `port_status`.
> >
> > So if a malicious userspace task with access to the root hub via
> > /dev/bus/usb/.../001 issues a USBDEVFS_CONTROL ioctl with `wValue`
> > greater than or equal to 32, the left shift operation invokes
> > shift-out-of-bounds undefined behavior. This results in arbitrary
> > bit corruption of `port_status`, including the normally-immutable
> > change bits, which can bypass internal state checks and confuse the
> > hub status.
> >
> > Fix this by rejecting requests whose `value` exceeds the shift width
> > before performing the shift.
>
> Another problem is that the root hub is supposed to reject requests to
> clear or set a feature for a non-existent port.  Just as in the
> GetPortStatus case, the ClearPortFeature and SetPortFeature cases should
> check for index !=3D 1.
>
> Alan Stern

Good point.
I'll add the index !=3D 1 check to both the ClearPortFeature and
SetPortFeature cases in v3.
Thank you for the review.

Seungjin Bae

