Return-Path: <linux-usb+bounces-33137-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEnMLp/MhWlWGgQAu9opvQ
	(envelope-from <linux-usb+bounces-33137-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 12:12:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21092FD0EE
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 12:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22930305DA7A
	for <lists+linux-usb@lfdr.de>; Fri,  6 Feb 2026 11:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12C1396B72;
	Fri,  6 Feb 2026 11:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XAe/AAa0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8E0376488
	for <linux-usb@vger.kernel.org>; Fri,  6 Feb 2026 11:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770376148; cv=pass; b=qmjtlwzI97Bhy2/uFGaEMKA2XBGI7tb85oK/4QcEQuCVVNMraaUnbYyLnqHjNmyYQqKRBf9FuTEGV7Nn9xWFXbE5MrrB5Czc9+wf0G4yMSdYvRYQLFYt1zRDsJD5qFNyg+pXUuk9HacbVvY8jlst35Xdun+TeeQTKh89i1P6OcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770376148; c=relaxed/simple;
	bh=jQfCHmMRS9Ez/SoNwJxIOUjnuF8dqM3nJxhqxQgpzrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hBMO+3awIjvtxQpu0/3M1pfwCGbhHHjAU7I1QG1Vc3CWVnF6NlFVqhXBEwd0drDuEe2WeF1gIBbDbUrGLM3Ro+iCUP+9IpHUIMSpRiAqxol8tirUHOkrTUtOX8Mb1KAShiZNg5VrbX9vmxSg4J20PDuDUt8vj7q1/dAs2MTdyGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XAe/AAa0; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c2dd0c24e5cso619361a12.3
        for <linux-usb@vger.kernel.org>; Fri, 06 Feb 2026 03:09:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770376147; cv=none;
        d=google.com; s=arc-20240605;
        b=RYNsr2TMnWevMYj1FN9DWVf2bLDyS2uOVICconHAb6P35+teS7Mio2WcsaqovaP/rR
         zIyZCQtWNdBktKD3HQIbCa1+UradxtswawmBSn2LYzDYKFhCrvdhnND1Eekxn33s6OTb
         ZQSQJ14TrtZ7ht/SZG4LPN9KmjtYwQv3C5h/v4MlyIPEFsquzIjQbcinxK9WEPsbivpR
         NhSiORCKFInKut41P/mGKewD0fnc2dG0615IxHnp5stKooNX1qU2L/k06OyJjsjuOQ2i
         ZV45dt/+eczEARyAPzDaOA0XCjltl6PKil+gGhQiazDrysWMT3XEOyczfBXLmHAvZAUu
         zXKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jQfCHmMRS9Ez/SoNwJxIOUjnuF8dqM3nJxhqxQgpzrg=;
        fh=3ht1/s+XtLfm90VApstOj6hX5gVP15LGQWjyZ/0PZrI=;
        b=e5JS+rWTmZfFRosCL8txQtdufjn/HObWVPHwfWACj1BZxSIbWHpTapD5Q5p4jbzkbk
         uMROD/rekKlKMyj53eHVqRVB5gNmAnzPA3zV//M9ENyHBNwbqfpB4a0myVWO6RdOWOEc
         9sWd5ewmf3NmsJmcaKPH1bOkumrdm0KNI1qY8GeXg8MAoZSr6dNy8gmSnVggYnyEeG/V
         Wusjjo/tqGPAWakCYh/7PbA6cA81hRHIjAWvBzJaTnB9VHWiO6hRZsAVXbl2kbvok9RO
         5EJ/eWpkXp6rBKz3WSP565JUm2WETnGzykLTiFQY0FNQuyGYh0aIZHCQqSoDmGx8v8DZ
         fvKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770376147; x=1770980947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQfCHmMRS9Ez/SoNwJxIOUjnuF8dqM3nJxhqxQgpzrg=;
        b=XAe/AAa0cVFHy65N75VTjsIzWs8k64undPpvub72gvU79UzUBcbgMAmXcdlLntQ5VU
         JNowGLwFzRinR35UOctcmDHepquh74RYih7Uiz9PJ+0SOGqcV1arTQ6cf0kNIUpFqbgo
         +we8eFBw/2jnIWOEJC/dkJWNp2dkFA9zYPuVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770376147; x=1770980947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jQfCHmMRS9Ez/SoNwJxIOUjnuF8dqM3nJxhqxQgpzrg=;
        b=tEyR3ekPOfUrHuKR970hKpyfDob/lOtcraG/zonrSE6VN51r2zGV41tPNIStopQj7s
         21O362vglfgdQoyCyjRSEHscdlznLpR7X02G63Mvjtu77tJkafenrAt/Xz2IjIaiEn2F
         +AXhirLL5AudSFgq0j2/u7gaKvWDeoOYFaE/qsvnZctv9WjWaw7Txcf/8xFEFMFOshQQ
         qbKmUsFiJMjBdtz+UQgSLCsYXi0f08yglBxxvOFzAGCFjEQW5s1MCt6TdF3C1zuH4xLN
         Um9nYzTL8mDgfVU0Ir5WK9CqET+NtQdjNHatI0j7Pq4yX8lY188SuER8/cNd9hr+nyQo
         Ti+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMeGaZMj5kI4JZnOnLfh/ToeC2QAOFkHKNOsZ1VLdtuJXBoNiNw3He/lKg3jr5uvla3z4WMzzhtQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUFBHKxtMeVQoSTmfvIyvAQHA06cMkgC1Ko11njdpQNnQJQ/ys
	0dy6N1ENDYTwZ5fpTnG2hK5Z75z0dv6Kpvvfvyc5YGLkzymbhW/e7GryVMy68ItCvFl0gJyNEBg
	QFynN91DlnPp9NbOvND1JSzJXSc2fbR+GcgjoO/i3
X-Gm-Gg: AZuq6aJDC3POpwLck/PNpV8f3nQAeWLuHK3DYdHhFUObEHGRT5AT0hdT8bkZlCZflKT
	GNjSY5R7sRteGDqrwdRb/AN1vMCkcvXs/EJi+Tz7VdN9EQaLo/wveS8Xj8ziUUbELZI3WRbJPvA
	mGPLW72Ae7ZzYY6vGe6FF6QyWRVyVmAfvBqxKj+kE7tqQc3fkYpiQU64lebd9P4Yc71zmxlOcAa
	ONtQgybkj2vIjG47uZVKYrNsRLN6qE5BbyRkh7R8o6I2Xh5lLh5Ts6h+NXMpWhEnlxlRCrhH06W
	syPJnpP48aTmuyuJVScP5ko9uLoxoT3I
X-Received: by 2002:a17:902:f68a:b0:2a9:db7:4471 with SMTP id
 d9443c01a7336-2a951f0fab0mr22033145ad.1.1770376147579; Fri, 06 Feb 2026
 03:09:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126090616.2224907-1-akuchynski@chromium.org> <aYWs815nqAGCdIa-@kuha>
In-Reply-To: <aYWs815nqAGCdIa-@kuha>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Fri, 6 Feb 2026 12:08:55 +0100
X-Gm-Features: AZwV_QgMCXo6sBzj4_hkdxB5ArbCQXbe1jwjd37eH29aGICXWq1d1xQIuR1y05Y
Message-ID: <CAMMMRMcBKWdVmXG_fHhOmiSdihxLGyrjTGeS0vvYF31FTfucgA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: Add Thunderbolt alternate mode support
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Johan Hovold <johan@kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>, Madhu M <madhu.m@intel.com>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, Pengyu Luo <mitltlatltl@gmail.com>, 
	Fedor Pchelkin <boddah8794@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33137-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,chromium.org,vger.kernel.org,linuxfoundation.org,oss.qualcomm.com,intel.com,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akuchynski@chromium.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 21092FD0EE
X-Rspamd-Action: no action

Hi Heikki,

On Fri, Feb 6, 2026 at 9:58=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Andrei,
>
> On Mon, Jan 26, 2026 at 09:06:16AM +0000, Andrei Kuchynski wrote:
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * UCSI Thunderbolt Alternate Mode Support
> > + *
> > + * Copyright 2025 Google LLC
>
> 2026

Thanks for catching the year; time flies!

>
> > + */
> > +
> > +#include <linux/usb/typec_tbt.h>
> > +#include <linux/usb/pd_vdo.h>
>
> We now need to include everything instead of relying other
> headers to do that for us (although, I don't think this rule is
> documented anywhere yet). Include at least these:
>
> linux/err.h
> linux/dev_printk.h
> linux/device/devres.h
> linux/gfp_types.h
> linux/types.h
> linux/usb/typec_altmode.h
> linux/workqueue.h

Understood. I will explicitly include all necessary headers. I'll fix this
in v2.

>
> Otherwise this looks good to me.
>
> thanks,
>
> --
> heikki

Thank you for the review!

Andrei

