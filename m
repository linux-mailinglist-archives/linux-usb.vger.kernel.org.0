Return-Path: <linux-usb+bounces-37619-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAN+MbQqC2pAEAUAu9opvQ
	(envelope-from <linux-usb+bounces-37619-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 17:05:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 629B356F88F
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 17:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A87A30BE603
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 14:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74872C21D0;
	Mon, 18 May 2026 14:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIXlrlDz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3133529B795
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 14:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116188; cv=pass; b=XJoIggPXe7XwA4Q+hlZvb0Kn03kwJK7NrOVd9a655mjb+5oHxLrpu8yTFid363Fv5X+msnX0FgF5hGaCPMAwqilhgUB9g0aXuO3Zcn6O0iPEDBfIV71lGSkcYei+JvEEvMZFPDuEIVw358oc3iOzfmzVVzuP0YoW+AqbgvLwwFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116188; c=relaxed/simple;
	bh=0mTs/w4vxpYjNpeIJS0QWH0SfL36tY50xv2X9s26CYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BUlhb2PLEtcIbBvm4SogPG7uospFasCv69meBEa5Ucll5ew2fufFadELzW4k7rJYLZsHf+cZqrXTf4EilpdIcamqSMj3nDOJ6D3gb7kCR4QJg4yfYTt2fNafacisQhAbn86ad2Y3LW8QbifjCy2H1LyQLuvdtQgr8HS6GExS1iE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIXlrlDz; arc=pass smtp.client-ip=209.85.208.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f193.google.com with SMTP id 38308e7fff4ca-39397d63804so31409091fa.2
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 07:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779116183; cv=none;
        d=google.com; s=arc-20240605;
        b=AVYLXcuT7ymDb6mzcVRM9Od0TP1xc7nbn75rN6DYjBgbBdiYPvujcpYokRPhixI4ZE
         0+72EFnQRFQTWJQHuTDfy9lYiZXrdDUg5m6hemUwdYNk7YLT+HvrN5bWNqAhTHPGb+qP
         pvKhIZ3xqsJNKYQKsCdnL+aN5/PZbluYgdgwqVnDybaJ+oOfAKF2aYdNC06H5HVmJacq
         TpHXqMRXc5x2k8ESN0AR8n3bMCXBcZftBAK5EfkL+r4I0v0ap3iB1iUWE/sGGNgO2xVt
         +NBli4mxMsendF3Y4WSxcAUKTrXoGaeaU3DBzkPcSkfTQN6WcuBgVGPySlrVUJoUyoMS
         NqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DYFmRZInXkJuwtO+3cn24w4m42t55qgcjnPW5qhsGC0=;
        fh=2eEAZBXRI+16CJkhdxTfbuWp8+90JnnDkBvtlcSb7EA=;
        b=PeUxdPr5OyVZ7lvwjhOiRd/zRiPJvwysNTmEWiJHFSbr3kZWrwyjVLb87dYgkqqLSQ
         0oyO3w0xNWMp71joRrJDjTW7PgTYfjPXCif41EtnC99EYi4xPiAPeScsfb1ADEicax+i
         /Lsl0y8L8mhLR6m4tDMJCA39kBcQaBW7Hl3mYSdBT8cGVdldKQUL6g/hLz60V5Kh6IUB
         HPQ+d7uxEueGoj1S1Ao3ldN1nzfk+aK07Jf5ME/t4hd7LzMve3Cfz0buyLzNB7gdBgCc
         mY9RkLWWUbNr8PhjVikSpBWLt2wmKt/1XBh/mF3I8gb8mM+OeAa/45byCIVK8bHmwSyh
         M1xA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779116183; x=1779720983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYFmRZInXkJuwtO+3cn24w4m42t55qgcjnPW5qhsGC0=;
        b=FIXlrlDzi2+Yt9mCHlw70pWVoN7DJgq+9EhwOqueWsit9AnstsbKa34mCq8XuAf5ZS
         9D/cltcvNSGb3F/xYe5T/kHR5COfnZyF1mUsEIUAs2kzQEzrNJ6IMH9IMxwBZCYK7saO
         OS2AtU8X9Pnpu/8wa5wvnJ8jpzeUCzIHfucXDS0CGbtHA9p4ix9Sg0CaZY8eIA6vhm4w
         2iqR6I0d4Fl69wMBTja/tJjGp5H4F/4eBrjBYUcx/8CdrwBZkatPK3EKrd0/87vtSN4t
         o7ISZFbKR9g2xNTHKYPPbmdnikicuO4OWcFP0CNq9GuP/v9gzCf2sOAQWV9uOkSMj1dv
         wGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779116183; x=1779720983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DYFmRZInXkJuwtO+3cn24w4m42t55qgcjnPW5qhsGC0=;
        b=HVnkqbWW34zhF6+E7vcMeUK9wf6Ux3wCWbU+VyAe4cpN2eaLh8U4pV0tgvhxRQVMWN
         VEI2HSclV4wul2mQ7VlmM1uWnJGkrlNo2EAsj7btShi/Ux7d9GsQY+OMkMMKCzYyl6K/
         xsBqRZX7CdeeLxiWWcPJ1bpO5QkzX2NtBZhtyxfMRxznV4jSYIgAJqHlVUNA+hqlYXaj
         GcfKW0Kx4vmGD7wdYaMtI70sQODyes1nKSjR48HEWlO3xac+S3FgeInhD958MZdy1v3v
         h3fuS70cDz9Qb4+vdYE3DLDdU4P85gnx4s07CCP3EL2ydORySqatlJ3+a2n3pBUZca2X
         chPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Ekm3q3Ag2rwB4DJnO0PKXLh3GdLWCk8GboyV8dN+KzVOmRYiO+CCdG5OM2o5R/qeILjBgszfN1R4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJWr7jKrXc7j7GcTts9Am22vTk+w2fflFUhXUQIZqNzDAGlBLE
	EpCMVwQPi0UoiRLGq8tNMIlkpq9KWfkMmQjz6VaKSBUBuiaXjBENKvcePV2a9fbVvM3KIfudlqP
	eMsNpM45uDdO+y/SZ3e4H9EfKHOfngZM=
X-Gm-Gg: Acq92OFaVNCWKI9yVjZsz0Tbv+SvCsrwlXctQOyXOx639DD+a/SmRcMCmAFgoz2iVum
	wgYqP70/vQIlzHrvVPry3IbZ6kaOzWch5CUfxk+i5sdz0RdPmsHKPf80DSpDvvDWazwFzxdF2/A
	GXioTwcDch4/iSFNSa5pwRnLhuns8ckhSIH8dnXu8aS7TkjJpFW8Yr33am2SOWc/w9HdrmJgAUx
	YifSkAO/CsCVbS2uG4dsY0TRDqYBYF8d17aDuONasP9414HtQ2uifEyq9wmz+cdmGpsAvJiofeL
	ATvTrIW694LbgToBQAPOEA7mP3yUZQ==
X-Received: by 2002:a05:651c:515:b0:394:5c9a:f315 with SMTP id
 38308e7fff4ca-39561fa5006mr44886361fa.14.1779116182771; Mon, 18 May 2026
 07:56:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516042428.3777524-1-rollkingzzc@gmail.com>
 <agry2e2brte8W7U0@hovoldconsulting.com> <CAB7XQsGZg+wrSpCsjLXdZEsw2y9f73eNGOjYkbz_PLAbR1_C8g@mail.gmail.com>
 <agskU46ts6au5LmQ@hovoldconsulting.com>
In-Reply-To: <agskU46ts6au5LmQ@hovoldconsulting.com>
From: Cen Zhang <rollkingzzc@gmail.com>
Date: Mon, 18 May 2026 22:56:10 +0800
X-Gm-Features: AVHnY4LqqEiqOisajDaFmyV3aOvbRRk07wOaPCtjupiylQc1NG-NYm5HhgvSsJc
Message-ID: <CAB7XQsGxxax-WaR_B3EmUUUYDg3Nnw75rmwkYuMHwUJ5eQ7doA@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: belkin_sa: validate interrupt status length
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, zerocling0077@gmail.com, 2045gemini@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37619-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rollkingzzc@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 629B356F88F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Johan,

Thanks for your guidence.

Johan Hovold <johan@kernel.org> =E4=BA=8E2026=E5=B9=B45=E6=9C=8818=E6=97=A5=
=E5=91=A8=E4=B8=80 22:38=E5=86=99=E9=81=93=EF=BC=9A

>
> Nice work. But please mention that this found with the help of an LLM in
> the commit message as documented in:
>
>  - Documentation/process/submitting-patches.rst ("Using Assisted-by:")
>  - Documentation/process/coding-assistants.rst

I will add an Assisted-by trailer in v2 and also use the Assisted-by traile=
r for
future kernel patches where an LLM materially helped find or develop the fi=
x,
following the documented process.

Best regards,
Zhang Cen

