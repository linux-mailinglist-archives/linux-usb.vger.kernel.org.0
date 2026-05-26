Return-Path: <linux-usb+bounces-38050-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id J2OuEh/uFGr+RQcAu9opvQ
	(envelope-from <linux-usb+bounces-38050-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 02:49:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 994605CF51E
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 02:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41D20301AD05
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 00:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934ED212F89;
	Tue, 26 May 2026 00:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b="R2wqSbC1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C831891A9
	for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 00:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779756570; cv=pass; b=geSJd0CQqdan6KaN21GWH1gh0tvRYkf1xC36hXxuowK7skIAvICohWz6utIEvWHLXR9lFiH4cbvR7YzjcYJg2otrgM3x07R7w27IPgnn+KLgOa//APgr6Xg8K5QcTAskWVyiE6Xe++mTsi+o9k7hoWtErR6bIU5lInEzrsL0CGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779756570; c=relaxed/simple;
	bh=jjT/3dvMEkLUCJ/nCBE6z3IcNhL0yJnavyXdOw6EPgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FRKGVanLMh9fZOkb51HFh2j+61YLewNQgph2dxy8I0bC8gKRXzO5AIY4apN/b4bpzxsxcz4uFGuCO5a/h6nSHusmjAVFVvXhjJniMaCQZKMYNVf93lLvFCfN4ysDzwSUVL27FnO2Aqc/Yj/NpmTjQWsA0d8Ylk+rWV6yDgtrps4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com; spf=pass smtp.mailfrom=motu.com; dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b=R2wqSbC1; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motu.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bd8f6ef4ba6so1488829666b.3
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 17:49:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779756567; cv=none;
        d=google.com; s=arc-20240605;
        b=amrekXjy+asm/jS+wEKxsH+snlhfqP0yIRJ3tT/2BRbdFxL60CrzLEJVdDu88WxYml
         8t/8wp6qCoekyCx3g1gGav3pYA8QIjNXsO3To6Oah4Vtt2dRmK/s5E2MIa7HkNn/AVsN
         V9m4hc+5OTXy/wGqbI/I3/tcPYhLqvd3gd+mlpRePcQDqJ5N539FXAw3vVEn5pSrL+TR
         B4ySnhW3DWFZ1DIBJMcXxeh82wcftwa8kMK2hQ+mDkW+up3PndQthhVMgKJBj0F9kLp4
         hU1wdxWbaSUYnXH7mVPS+h2/jDbM6vKEIxdy6inbA1kpyhu1YG/dDr57v2LH+TKY8M+l
         DNkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OZgI4v/9Wfn/w9AHeqnamSdFXB61ZlPU2bX8g3drYPw=;
        fh=cRMuRuf7Vjf4tU8aczjTswV+WBEUv7mXZvHRAJjuyD4=;
        b=jJTMqJQ/B+U0AlH4ZB5L+hkjoRiS2mDEKlKvatQjKij/Y17VsiyHdF7RrJxhltUOcI
         rSI6axka8xK7InbL7fUabJVsP+TANTi+i5SM2iaCqXKtinQDl6NWtisz1nNgodvqUCD2
         p8md4O9Zv5Rc6PEqwoDXFh6x3CcMtPLh+Snxutg3bL8Tq5ZBQCvOeN51WHA4hf59BJTI
         5nZTL8s4jS7A6MQPm3E4HHfSIUprYyO31M+ICLBIJ817BV/ScRbQkSSUu++mTtIJYnHT
         bc5s9RfI7byO0wdXPq0Sg2nN0uR2pjxqnj3nzUlQ8n+O5p0uUqXTS7KLnqG1nEBso7C4
         +86A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=motu.com; s=google; t=1779756567; x=1780361367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZgI4v/9Wfn/w9AHeqnamSdFXB61ZlPU2bX8g3drYPw=;
        b=R2wqSbC1nIHP1wT6UXU9zsQXg1Kz0lCjlfaMHFKNB6i0AVO62hRC4yoTnSZgguY/S3
         vXpKMXqA6mnrutK3uvrvOZHbChSOu2iKVKf7GnjBuafIFYqG9u/na9coQEWQfwGDFKjX
         kzdR0Lq9ItuLtZh2yVL37f1BZjZ+tqzrVYAUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779756567; x=1780361367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OZgI4v/9Wfn/w9AHeqnamSdFXB61ZlPU2bX8g3drYPw=;
        b=iTWT4LhSsiAu28AESg0F7Q6peHXlA2zilEmjjFxHrbmNYbeWEcUyQt7DyWtH1JkcYO
         2Szsd5GKW+8pVmORpfn+vTO2eoeyfNwUda6dHIUq21GlJYCWJQiCOxuaPxNcEwVHLZuR
         xbBOCj6I0JoTvRKSHO7wUOXgn1VhRM+fjd7XZJROJvKEx1QZaFON3bQt3reP39WOCL4u
         dux4y0nRhRpAWsh9x4xQQY65vDGogZw2fMzM/VmdwvGsE7ZyK42PFRUMtE5GhsG3F45r
         fwo0PQf+6rGT/pu0Sl2TjDrHT6hYjJ6c8gvSHDlC54rALEl0Bn3IIeFQR1GgggeBV08V
         zkuw==
X-Forwarded-Encrypted: i=1; AFNElJ/Hnk9fuybNAEZgtZjIvIanRC8PGo2H2HolqgAGtqlp6XciL72qb9yJCC8eKkQ+v53bm23JtRNwGc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDc9GQAcR1oOWOAF/SGECa8WmHKV9GfU8uOvSbghYQeUFxS6Ra
	/IXSsRRUBWRIQVS1zo3mO2njp0E5lvXnpfMOO88vEi9JlIMfyP68R7fORVLbByzEtq8hTPMkEEo
	514evs4qifWGnkvxHMCUdCQXYQr10PGlq3LeNCtiWpw==
X-Gm-Gg: Acq92OFNTw8dwxQGjzY8NF2HK4mZBLBRn2DdJR/vk5CJhb3Qks+fvhcZTuAasvv5JsI
	RdEMWs5N7wSzfriov7ZGt95jdgJ7LowFSEoYEy2fEcoAhy7cRuBolztvyMwPR7XoxUsR5SCbXhU
	OgV4yNvNWfFMULpvRbgjKZwyo/lPLh3Wte9uaDz4vcew+VC6bOpoDoBmms5XhymlODWRnMvMJ1U
	28B9UX4POP2OXJVi9buajAlKP6wHUb+0pKSXP3a7ydJgyUpEvVKo1DeNyNpESi/Y/4gG+6tqD27
	hwpWJoQ=
X-Received: by 2002:a17:906:ba89:b0:bd3:2407:6b55 with SMTP id
 a640c23a62f3a-bdd25fdf4e5mr908182266b.38.1779756566912; Mon, 25 May 2026
 17:49:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a67e11d4-6c80-4043-9f60-ae42a15ed0d3@linux.intel.com>
 <20260521152715.288995-1-mathias.nyman@linux.intel.com> <20260521152715.288995-3-mathias.nyman@linux.intel.com>
In-Reply-To: <20260521152715.288995-3-mathias.nyman@linux.intel.com>
From: Dylan Robinson <dylan_robinson@motu.com>
Date: Mon, 25 May 2026 20:49:15 -0400
X-Gm-Features: AVHnY4KNQ9qxlV1o8UrNqwpoYKAxZXtInln7YkUnuBKzxLmz_330M0379G54GCI
Message-ID: <CA+Df+jcBu2zhzwfeT9AuWdK4QoqoQeJ1EB7nzRVvDMrcevQ1_A@mail.gmail.com>
Subject: Re: [RFT PATCHv3 3/3] xhci: tune urb->start_frame in ring overrun and
 underrun cases
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: michal.pecio@gmail.com, linux-usb@vger.kernel.org, mathias.nyman@intel.com, 
	stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[motu.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[motu.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38050-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 994605CF51E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mathias,

I had a chance to test these patches.

On Thu, May 21, 2026 at 11:27=E2=80=AFAM Mathias Nyman wrote:
>
> Make sure a new urb->start_frame is calculated for isoc URBs submitted la=
te
> mid stream, i.e. isoc URB is submitted to an empty ring after a ring
> underrun or overrun event.
>
> If URB was queud late, but before xhci driver handles the ring
> underrun/overrun event then kick the urb->start_frame forward by one
> ESIT for that delayed URB.
>
> the gap in urb->start_frame allows class drivers to detect the glitch
> in isochronous transfers.

This does appear to create a detectable gap, but urb->start_frame
still drifts relative to the actual frame id. After each
underrun/overrun, urb->start_frame becomes increasingly offset.

> +       /* re-calculate urb->start_frame on next urb enqueue */
> +       if (list_empty(&ep->ring->td_list)) {
> +               ep->next_uframe =3D -2; // FIXME define something, or use=
 suitable -EXXX
> +               ep->skip =3D false;  // maybe, or is it the wrong place?
> +               return 0;
> +       }

Since mid-stream URBs can be submitted after an underrun or overrun
has already occurred, but before the xrun event has been handled, the
TD list is not necessarily empty here and all subsequent URBs will
still be scheduled as SIA.

I think the only way to prevent this drift would be to intentionally
introduce an additional gap so that the host controller driver can
restart the stream on a known frame.

For URBs submitted with URB_ISO_ASAP, rather than advancing
urb->start_frame, it may be sufficient for the host controller driver
to re-estimate start_frame from the current microframe index. For
non-ASAP URBs, however, intentionally inserting an additional gap may
make more sense in order to restart the stream on a known frame
boundary and keep urb->start_frame as accurate as possible.

On Thu, May 21, 2026 at 11:24=E2=80=AFAM Mathias Nyman wrote:
>
> Maybe we could add something like a 'delay_start_by_intervals' to the
> URB? telling the host that class driver wishes stream to start n interval=
s
> after usb was submitted.

This would definitely help, though specified start_frame behavior
would still be preferable so that the same driver architectures can be
used across Linux, macOS, and Windows.

Best Regards,
Dylan

