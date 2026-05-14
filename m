Return-Path: <linux-usb+bounces-37449-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFxiKcU7BmqmggIAu9opvQ
	(envelope-from <linux-usb+bounces-37449-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 23:16:53 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DA6546F66
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 23:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7AA73007B90
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 21:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193553A2E12;
	Thu, 14 May 2026 21:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b="RakgXxKt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3945C18872A
	for <linux-usb@vger.kernel.org>; Thu, 14 May 2026 21:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793410; cv=pass; b=T6R0VORINZ5GmXbbzv0GK32SPFhCSBsI9g0xZwq4Jv36msWgjvjrQ4HaH9zLOPhvlI/gjwYFFrmbk55YMG6GOlbzRZ6ORoEUoABJuFeakGu2hY5jiQGCG0nqXGaycDSNHc+D3dZGM4HYQuIqg7gumG5ZPdR5motqwTs2idr9WPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793410; c=relaxed/simple;
	bh=53wEapfSvsQ7yN14P+KqsnC29NMpu7qu1Djqw2vVoDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dFeCtGaseZp0QbGW1preSSecibMwQ+bP3CdawCpc2iFzLsf7lN8u452z9se1jEsaLbAYnG7j4azlbuE693gsP+wRUQPse/RvJfatlqBimDvNr8jVJ+w9jyvqEBzQ4yImgwgV9dZ4PyNAKeTlNLhbads1YdFjeeUwWviroMES4uI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com; spf=pass smtp.mailfrom=motu.com; dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b=RakgXxKt; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motu.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67f7caa33easo1088898a12.1
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2026 14:16:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778793408; cv=none;
        d=google.com; s=arc-20240605;
        b=Zq4Odky6Zxvpk6OeC/T1Grcnm984h44taIREbWXsTMyZcdYkKgve8J+FJxZqE8FQmJ
         oo/pM+Ujts/MGo771UN/ogK8VS2V0AdoChNlSvwj4nBRqqHeE0+q1dnuY1VlbmRFoSMM
         KPL1ro9FmXF45XA7VBpeZtuI+5rJnLSres7DMXi94XKNPR6fIh+co2Z15OcBS05SteNy
         LCCxhfzqrCX2S/Z1DtefYISf0v8yPMuCgW1GWxKuJ54J0Ll3avF6uHsHnkSondoBIgly
         Zi2n0zOsNq2SL0HpoGtMnxWnGtVnG+BQ0mYDKFy1bBi6ad7CDtEz054rjuCt7mfJD59Y
         QncA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=53wEapfSvsQ7yN14P+KqsnC29NMpu7qu1Djqw2vVoDk=;
        fh=3ORCZ3SlgOBAp9RqqoslIRwR5LavH9TMIjDMTEFQnzY=;
        b=WglboVnnL4UxTseQolhI3q+uP/DG40ow1rjPX+R1rB95D5tpxSV/AuHda/Hrhwv7dM
         V/5w/3U6arOAPmlQbv6Z39o7uGw4K/zYYu0zZp3QmOId5JJCRAY+aRU2SLO2bs5vq+x9
         9WP/ciY4C1VAvILiLCKKbNsRdTX54gvs4z045n2zP0zGw8QCx9L4pfpsBx6mwNCyDdlb
         j8vuFyz0V9rZwE+AoCfJJ4+UrGafgScKp5Z2hHNyEOKVD8RDTVAoSI4dePMsNrIrO2sb
         O0X8ofKTCHZ/b/FgqP45E2NSJCcW8Di6ZV4NCPyhV8gBZifvnrjfWVNscrxm2idELY3t
         umlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=motu.com; s=google; t=1778793408; x=1779398208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53wEapfSvsQ7yN14P+KqsnC29NMpu7qu1Djqw2vVoDk=;
        b=RakgXxKtm3eZat9rdgTiMq0W52Fus1qmRyTArJCshaiMl3UirsZfBz+cBgK2rwxepu
         SKDv9de3PLTeNzO/nzs8Cx0Fxc7Uhw1onNwQdMISOhhRBVNUN57Y2cvkLkxZr0yFqefW
         d4aucJXVW+OLYFirvkLPph3sLm9e9Y/k2NC/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778793408; x=1779398208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=53wEapfSvsQ7yN14P+KqsnC29NMpu7qu1Djqw2vVoDk=;
        b=A8Go8D+1lrQhowUDGjYL4jc21g0NB5VqpfuzGoDIGepaEHUwx1fjqWh//Zxbc1Uh8a
         3KPm3CIz6J+AByo8MAEbYr9SxkAmUuUgN+X/YR4C8zHl62yU4Cj9bUnCUDaxfGCccyCW
         E50EM6nzv1VKMW1folhNnsFqZb825Bt0NzcL/UCY74mRn0ku8gavlXfOM22m1SKiCGpF
         c+0qOo2s5zKlTuJCL9wwYjbI5z0J2oLb2KL5fpIGZTMf4DEQ9iaVd/HJ2cc6sem7bEom
         Nj/kljMtPUjODNiEVkp7BZf6iMmfXoC4XdYKa0STGhG87HMu7kZns1MRZmT5E2I6Om5Q
         78vg==
X-Forwarded-Encrypted: i=1; AFNElJ/eXEiMSDXCsOkhLvptLo0pIo0IE/7qIh6kxaEDOl2uJ+Wrj8Aq1oDSggxrHDlbfVhnpLGOSY1hg9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUdfamHsY8C9rCSTcT7cDUP3djd+w04CeWAG+P4voBOMTtK3Ai
	nRmGitcDoA0YCWKd4sTt9fhpWojPyUt+qUv9myNsI6W8Zy2cw48zHGLH2Kr6x66YJpi7IQrmZmZ
	zoQr7STPdU0NnSRxK94034AWm3/2GwaGZAIEZL0HMsA==
X-Gm-Gg: Acq92OFFIzhouBkZz4sIBvLvyy1vQlzRxOaihHtjYzhVeRmnD1cPA+NwdRnCthFvj94
	aW84cIFOzuNfdBdHAtk/VldbwvaqXsYb5TX+qfCooymd7n+3uULxLL5rpNaADh/RTBr9UXpH4np
	JWgxspR1O9DVkImmN9syvBmRgX/8KbukfFccaFe3KGM9WLdBffLYzZklQmWsWfI0/2XKMjgGZoE
	DvzH6QKIGCN2LcY4PRY8JusOrDJMsUlP33Uv9JC+UM4M98bUoQZru2ZfzonKM0gDlL+tHZovcgq
	qYiAro03rpFj32VMhQc=
X-Received: by 2002:a05:6402:a2cd:10b0:683:1cc8:84b0 with SMTP id
 4fb4d7f45d1cf-683bc1b772emr417974a12.1.1778793407026; Thu, 14 May 2026
 14:16:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+Df+jeoj_QL6XNzUyP963HF7ngCWoAs0MjqQXPr3Fa6VW3rXw@mail.gmail.com>
 <20260511192105.3756809-1-mathias.nyman@linux.intel.com> <20260512110810.17fbde0a.michal.pecio@gmail.com>
 <85f8441d-d6c0-4607-9269-d80b1294afbd@linux.intel.com>
In-Reply-To: <85f8441d-d6c0-4607-9269-d80b1294afbd@linux.intel.com>
From: Dylan Robinson <dylan_robinson@motu.com>
Date: Thu, 14 May 2026 17:16:35 -0400
X-Gm-Features: AVHnY4L65W_zcdD-s3i0tSWmx0abgFNvZDjIGV_R737xudnXC4ZAwg-y7UzdeV4
Message-ID: <CA+Df+jf79bnONyXUnf0_zAUrqNAVzy1zt9VCivbxYvkedfGHRQ@mail.gmail.com>
Subject: Re: [RFT PATCH] xhci: fix frame id calculation for isoc transfer
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 48DA6546F66
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[motu.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[motu.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37449-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,intel.com,rowland.harvard.edu];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dylan_robinson@motu.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[motu.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,motu.com:dkim]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 10:30=E2=80=AFAM Mathias Nyman wrote:
> v2 writes the TRB frame id field of the first TD of the first URB
> for older non-CFC hosts as well. So urb->start_frame should be
> quite accurate. Its probably more off if URB_ISO_ASAP is set.

Testing this patch on a non-CFC host with a bInterval =3D 1 device, I
can confirm that urb->start_frame is now accurately reported when
URB_ISO_ASAP is not set.

When URB_ISO_ASAP is set, urb->start_frame is slightly off as
expected. For example, I observed urb->start_frame reporting 1645.0
(frame.uframe), while the stream actually began at 1643.2.

This seems good.

> Added last frame of urb < +895ms to v2
>
> But only for urbs mid stream, and only print a message if check fails.
> queue it anyways

Regarding the valid window check for mid-stream URBs, what is the
concern with an URB extending beyond the current scheduling window?

Since the controller only evaluates TDs as it advances through the
transfer ring, isn't it only important that a TD's frame ID falls
within the valid scheduling window at the time the host controller
reaches it, rather than when the URB is submitted?

Additionally, due to wrapping, and depending on the values of
urb->number_of_packets and uinterval, I don't think this check will
reliably detect when urb_end extends too far into the future. That
said, I'm not sure this check is actually meaningful.

On 5/12/26 12:08, Michal Pecio wrote:
> A particularly fascinating case is period > 895ms; it seems that xHCI
> only allows submitting shortly before interval boundary, or "SIA".

For endpoints with ESIT greater than 895ms, wouldn't SIA become
necessary to avoid ring underrun/overrun?

Best Regards,
Dylan

