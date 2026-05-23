Return-Path: <linux-usb+bounces-37962-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N+ELk5lEWr7lQYAu9opvQ
	(envelope-from <linux-usb+bounces-37962-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 10:29:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0585BDDB0
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 10:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B43530214F7
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 08:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36B63502B8;
	Sat, 23 May 2026 08:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfkhPQr/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58C13542D1
	for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 08:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779524904; cv=none; b=cILfyK0NXDrya64KqUtjIaBkWia6K6Ot88NOZtEVnRixjTu9xymtCH9GksGYUV4Yb1Rb4IYi2e86efS5giCHsqvEc2M4GVR/zdrFmAJOjx66kddP5ACn6labO9Seu5ul6g9IbyMZBetxuHkLqQkEU9fF4vGs9ixJIz6wSq509Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779524904; c=relaxed/simple;
	bh=SJYthm/hJjyvZnHoxcP0FN011OD9BRe6ay27b+7gC+U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jiXAhbWs0V3Jd4QQCPuZ2rIh+C5JMrRjpqRvFV7VD8suYGajfD0AA2nF3TmuyIRr0uvQNbc0eujUsgZ739fJqwpvO37y3QuIXkSqg4Fw8/siTEgtit7WHs+uTCPeShcfWv5QyDJwDPZnBGk5IaK7f1PXV/clsQEuP+BnsE+B5+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HfkhPQr/; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a8d1f43432so13283529e87.3
        for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 01:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779524901; x=1780129701; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EhmWhWD9464Uoh3KFvCuWff7V4Zp2a8qUYWAxJoJ59c=;
        b=HfkhPQr/smgQ0JTETyFkjiCEB5kJoXcBpyiy/8c58BQPRHfZ56uC5Afv9aSLcdlk7l
         qgCahylv+/WUSGOrrAGwuSEhKgWhbqlfQfEn29B+5K90EymTLQCcbdujzBxHzMiwKaN5
         8mKWSnJNXr/c7tQ/gbAOm8vrAs4uiVwBalq5Sz2BSoe3WcqxUpzIgsr/tljV682k08ug
         UiML6DUfxehgEo2bjKvnylPIqBWvSJy1CJCa2g6gVk41bwN2nrYKZPuYWxQ+474I0Luz
         gteiU5XXn+4jhBYRMaENtrUxm8ZjwWZLt06sypgyTE703erJAl/8ynM3c8twBiuiAUd9
         kBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779524901; x=1780129701;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EhmWhWD9464Uoh3KFvCuWff7V4Zp2a8qUYWAxJoJ59c=;
        b=srwameWv33XDetTl8yxft0ytl3VHyLkQ/AZAzgLKMm+mNirzILHDRBUyWOTfpRv41I
         BiyVYATGJahw2z0tIs12zFQhRY1jCBAvaM1ghuMANMTboi7GviG8460YV37ZpAVH40R8
         hZ2S3TNYh1+pgPrOshIOmOIJaXZ+XncdxMY3Zvo/mGX5bDVAt6ALTLqzVDuSSKCqwJaW
         n2XupAPk0xooJxoA1qw05iHl26ojxz+h+lYohq1WqII9oWJAPoqZRuWr6CONP4kuCSxT
         KmIocbHYJmibC6cz6ND0mYT3poOS0x3WMbg3BOqkuUZkLJs2o4ZRkMZTADHifsYUnZbK
         zWrg==
X-Forwarded-Encrypted: i=1; AFNElJ/BLA21f53RLLxIwBQNeb24XrU0Foa+R8c86be4J75WnP4WyAhQeOICxIqkwqDPrGmi+o5Ed9t9mBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbCeHXTc6dZU1JWOdFOAK2T1i0MIBXAslI+Qt2CeIzu3CUZdQr
	YVeCvP5CXnW/3gOwlZeaz0O6fsXRM7gi7+3wRAct2EaSiBz77fqloGzN
X-Gm-Gg: Acq92OGOAKT6a8RGDJSbfmkJXX45eVYyf8mK7pxJrjY4Bu6DQvmaxbZ/OtWHyuheSWY
	JvaDMhQI8l0/ppUpJX1pNWWYBFmkWOJFbJK9fJFAC3d/YPtdmr8fj4PMEMQIHq5CK+gua7qqv1G
	Ylpu3znUhrWh9/KjcPn9BMmHaq8K8+4JgzLAGJewkCJ+r3VB57yS22KL1tR3+JS6/xP6LOtr3AF
	qPtyqM6UNOx7zCwL898wDLuPmxr6TsRHgrFYld2NfGtsUWxQncobuM9sqRhsEoLWsw9AiZymWPD
	N9mW+gYa1HVVFY5cbkQYR2nRTKktSaBLmxwU92o/DJgiBgYD0j2E92xAyWPgzSbQLX/Fg+CCq8T
	+SJKJFFPZmPjd0Dm/oBE1D+/a7MStSxrhSiO3tE7oi7W4Rjc8TJ5kKdDWqcVv7GBRezt9LckChz
	lRmcDDkXy8Ox+IBh6/0eixdJMW00bIQm5R
X-Received: by 2002:ac2:5446:0:b0:5aa:126b:4504 with SMTP id 2adb3069b0e04-5aa323c4508mr1870160e87.23.1779524900655;
        Sat, 23 May 2026 01:28:20 -0700 (PDT)
Received: from foxbook (bfk48.neoplus.adsl.tpnet.pl. [83.28.48.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32ceb27dsm995789e87.45.2026.05.23.01.28.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 23 May 2026 01:28:20 -0700 (PDT)
Date: Sat, 23 May 2026 10:28:15 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Desnes Nunes <desnesn@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org, mathias.nyman@intel.com, stable@vger.kernel.org
Subject: Re: [PATCH RFT RFC] usb: xhci: Kill hosts with HCE or HSE on
 command timeout
Message-ID: <20260523102815.5c05c70a.michal.pecio@gmail.com>
In-Reply-To: <CACaw+exPdwXVsJc5Xr=vN1WJt8XR46=X0-8PP=+5dWY5zUrKeQ@mail.gmail.com>
References: <20260430014817.2006885-1-desnesn@redhat.com>
	<CACaw+ewwM_5eqyGW5=+THwHsYPs7u3NT096AFQdt6x4E6HcWtA@mail.gmail.com>
	<20260502114644.76e6b5a3.michal.pecio@gmail.com>
	<CACaw+eyKh7buHDoDyTOe8O65FP5cSXYdzCcQvwqKw=1DwX26oA@mail.gmail.com>
	<20260502235517.089ba5bf.michal.pecio@gmail.com>
	<CACaw+ewOTVh49tnkz+cRr0SD_Z-LmYrMWhFUrsik6YF83mPBtA@mail.gmail.com>
	<20260503071749.6abda137.michal.pecio@gmail.com>
	<CACaw+ew8uV5g1G-6qZGtVBEYZ3k+fvFrOq3XMyq-Nuhbq5mdnA@mail.gmail.com>
	<20260503213111.117db3a1.michal.pecio@gmail.com>
	<20260504093118.615ff480.michal.pecio@gmail.com>
	<20260518083339.507e24bd.michal.pecio@gmail.com>
	<CACaw+ewSWTo72fSk2Q7ZzCM8pNuyrX5ua+qA=SZOQuNNMKSA5Q@mail.gmail.com>
	<20260522110328.0d3eecd8.michal.pecio@gmail.com>
	<CACaw+ezqEO_PgjGeYCLq5hA2eKczFXgmZLa8qjPtVJZCGwsdsg@mail.gmail.com>
	<20260523022944.59799d83.michal.pecio@gmail.com>
	<CACaw+exPdwXVsJc5Xr=vN1WJt8XR46=X0-8PP=+5dWY5zUrKeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/8AsFH90U3UhJQJ44ORrK+_/"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37962-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9B0585BDDB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--MP_/8AsFH90U3UhJQJ44ORrK+_/
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sat, 23 May 2026 00:47:28 -0300, Desnes Nunes wrote:
> Hello Michal,
>=20
> On Fri, May 22, 2026 at 9:29=E2=80=AFPM Michal Pecio <michal.pecio@gmail.=
com> wrote:
> > Sorry, I forgot about the most important thing: crash kernel log,
> > or at least the IOMMU fault message showing the bad address. =20
>
> I was indeed intrigued and almost sent it without you asking for it :-)
>=20
> The crashkernel's fault address is shown latter on down below, but now
> I have attached the full kexec dmesg too.
>=20
> PS: Note that the debugfs file 'memory' from before contains the
> addresses of the main kernel, not crashkernel's addresses:
>     - From main dmesg:
> [    6.728105] xhci_hcd 0000:80:14.0: Device context base array
> address =3D 0x000000010a958000 (DMA), 00000000f542e3ba (virt)
> [    6.737602] xhci_hcd 0000:80:14.0: ERST deq =3D 64'h10a95a000

Neither debugfs dump corresponds to this dmesg, addresses don't match.
And it doesn't look like the guard pages patch is working here.=20

But maybe it doesn't matter. Your "memory" files show a clear pattern
of consecutive page-sized allocations (example from after.zip):

102fb6000 DCBAA
102fb7000 CR
102fb8000 ER segmnet 0
102fb9000 ER segment 1
102fba000 ERST=20

We can make a guess that the faulting address is the ERST, which
definitely should be accessible to the host controller.

This simple patch logs ERST allocation and freeing; as far as I see
nothing else touches that mapping.

If the ERST is somehow freed before starting the HC, that's a bug.
Otherwise, it seems you were right that you have some IOMMU problem.

Regards,
Michal

--MP_/8AsFH90U3UhJQJ44ORrK+_/
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=xhci-erst-alloc.patch

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index e76e321e119f..3f1e25bcb7ee 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1815,6 +1815,7 @@ static int xhci_alloc_erst(struct xhci_hcd *xhci,
 					   size, &erst->erst_dma_addr, flags);
 	if (!erst->entries)
 		return -ENOMEM;
+	xhci_info(xhci, "alloc ERST at %pad\n", &erst->erst_dma_addr);
 
 	erst->num_entries = evt_ring->num_segs;
 
@@ -1867,6 +1868,7 @@ xhci_free_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 				  ir->erst.entries,
 				  ir->erst.erst_dma_addr);
 	ir->erst.entries = NULL;
+	xhci_info(xhci, "free ERST at %pad\n", &ir->erst.erst_dma_addr);
 
 	/* free interrupter event ring */
 	if (ir->event_ring)

--MP_/8AsFH90U3UhJQJ44ORrK+_/--

