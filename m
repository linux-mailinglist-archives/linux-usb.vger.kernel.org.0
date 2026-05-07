Return-Path: <linux-usb+bounces-37073-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAH2Nwhb/GndOQAAu9opvQ
	(envelope-from <linux-usb+bounces-37073-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 11:27:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 458C84E5DF0
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 11:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F68A30465FE
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 09:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF74391844;
	Thu,  7 May 2026 09:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxheRe1i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0BB3B95E0
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 09:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144914; cv=none; b=Jne3Uvwsh4G+sP4LVcFO32kypVyrIAmcoV+FL8x/kFG1QPLMt/tiwATQGiHSJep8SSwtdI1xJbpvjp+uw3coYgXpsWKjc79Mv0byVpwT5pMkxTDUTHnQf0xwMFrOQgVTJh/ONe7E3EYaGRHP3t/H2/4S/tUUIf1AmdxrS921w6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144914; c=relaxed/simple;
	bh=6KNYU1WpeWbZtLaI95Q3FSHorYk7ZzRQOvKRN7EcI9c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AUbMkS3tg6V/VYGwY70sJKzZZ1Bu7H7wZe5PbRIKngBzRFrUGLYWtCKq56vOv8HLwco+Y+0ZcrCx1Pir+2GJYolttv30/SB8CAkAklU/lgn2BBWzugMHT6cBTTur+/cVxD2BeWqHaFVLC/BkvDVtBKrNeg3rC7ErPblV0LuPocY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NxheRe1i; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso5583065e9.3
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 02:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778144906; x=1778749706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8AqCHUecRdMHaTSiwSFKRzA+aPKBe0J8V8U1pAN7qQ=;
        b=NxheRe1i9m2sCCP55ucTBUdx1urWhohFrPkwD4vBI2HOdw4eg+P8II9CkHEe5txdp+
         XkWbVrqMHS9rPml5LOR0L3FaQjhmpZEhUeQfEx4NsC3t8B6rGdmoct7VFHNnGwyc3+WP
         Xz6dpU6+9WtBf8Bgr8My5FX4rDZ24MAf7s3xSqFe3Ldy+Ux15aKtB39mxZrKPrblNitE
         trusfVBCNaTesfP2fz48nJ2DxZ76xtU0aQejmDchHmxbdKEqu2W/NuqNsHO15cLPkscf
         J5/YSXNnjqCUBeOjOTXnJGncT3ANWGG5fRBrOOgWpb3jtQ7LnyzyhLFSf3qZVD45eUmf
         119g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144906; x=1778749706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h8AqCHUecRdMHaTSiwSFKRzA+aPKBe0J8V8U1pAN7qQ=;
        b=rDfdTprKFqmwsgfLfa5uRHJ9Jbdb4fUcanC+FL6qtSZa+EO9FB1FM5adOnIe3YPDjS
         kG5N41udHIZU2wgGjmtrgaZQxtGvjnjRDs0NISTV2CeKxJewpFIRS6eIi8p6mJbw4Fc5
         qqQC9rMgh4TS2GL0lZ6+c41uZiEuENxmkdn3KRxbN054Mb8ZozO+X0CO+3T/1iWLTELI
         iejj58TNGVdpZ/qmnJtGlGZ5lmUbIKcQ/o5LLpJ2TCkae1z9jlUaI9Mn9fbpiTtINhN6
         Oe+Uvg23f8jNGe61AJeZ+8dJ/t6xmmmWYNME0C9SHHt1ZtO1C30Ey5eachXxQSeXBxfW
         ga9g==
X-Forwarded-Encrypted: i=1; AFNElJ94HgMILhDOtCkhJkWUOWkjFax4P10zeP4Rc/EFA34+QtRo9/HmmIAYhbKa3WhbrmaQtZCWXAoLKWM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnc08TYneD5j57vQrogyh7sEsI1VdalymyCWMBDwXIF9mFXs0J
	iBMMQjFMEOwZ67lknBvgvhKe/+Q56003L5qeMA4PJG8gp/9IDu8Hl1VJ
X-Gm-Gg: AeBDieuDXNJTtt0AotNptG/PST6r3cqGaaY/CD2lXdYuJ2bVSixob94CwskF7jlOl/f
	dOKBujYgYGlMATSSObo9eCFq6B5EJUh6SMZ7dq7QWq/McMbTtwc1TqVunLCzyFcuhsbxggtn9Pb
	9swxouzpXgknyUFrRATJmKW4aZdyT1c7cRPQq0xr52tKqYnpanhvOtuMnlBMUosjiXJkjPCPm6+
	XLSeydVCoIN1MDgMF6HcyvXZ/Se+TPpEKlhRio12ewehQ/odM6V02pPJr6XqvhGYrdlDpFREPIN
	PLwvuynNROS2uMquipUGIp+chxhWI/aJ+jvfwWnTko/MokPIhj1PjF/6tqFwx5xpc3feWMUjOlx
	oZIcDHC9WXnIr5+Jq1bl803j3nPW7Q44dpmEyJgo0yzFpHrAe4lYT3ff7/qUGamSh0ZQOgjF2FT
	dU8SyXB+QOlwo/Id6KTHL4GfMq3slgNFMBB/YXqv76mhNBCw==
X-Received: by 2002:a05:600c:46d2:b0:488:b187:3c with SMTP id 5b1f17b1804b1-48e51f32c65mr113284595e9.14.1778144905786;
        Thu, 07 May 2026 02:08:25 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53895cb5sm102053505e9.1.2026.05.07.02.08.24
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 07 May 2026 02:08:25 -0700 (PDT)
Date: Thu, 7 May 2026 11:08:21 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Jihong Min <hurryman2212@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Basavaraj Natikar
 <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: add initial support for AMD PROM21 xHCI
 temperature sensor
Message-ID: <20260507110821.07480da8.michal.pecio@gmail.com>
In-Reply-To: <424c4dc4-1810-4ffb-ae93-7ec9f880ec1e@amd.com>
References: <20260506032939.92351-1-hurryman2212@gmail.com>
	<cover.1778099627.git.hurryman2212@gmail.com>
	<2e2ea249b30168a2eab62fc110c226a511f21bf2.1778099627.git.hurryman2212@gmail.com>
	<20260506233332.664f220c.michal.pecio@gmail.com>
	<424c4dc4-1810-4ffb-ae93-7ec9f880ec1e@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 458C84E5DF0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,intel.com,roeck-us.net,lwn.net,amd.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37073-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Wed, 6 May 2026 16:36:49 -0500, Mario Limonciello wrote:
> > > The temperature register did not return a valid value while the
> > > xHCI PCI function was suspended in testing. Keep the existing
> > > behavior by default and allow temperature reads to wake the xHCI
> > > PCI device. Add an allow_pm_switch module parameter so users can
> > > disable that behavior; when disabled, reads do not wake the
> > > device and return -EAGAIN if it is suspended.  
> > 
> > Is such behavior useful?
> > 
> > Maybe the driver could just disable runtime PM while it's loaded.  
> 
> I'd encourage what we do in amdgpu for dGPUs. The hwmon files will 
> return an error code (I forget which code) when the device is in
> runtime PM when called.  Don't explicitly wake it otherwise.
> 
> This prevents someone installing a sensor monitoring application and 
> that application "being the only thing" keeping the dGPU awake.  If
> it's awake already for other reasons (like being used) then return
> valid data to the applications

Well, that's not a dGPU but an xHCI controller embedded in the chipset,
which chipset is more or less active all the time (includes bridges to
PCIe ports, some SATA controllers and mabe other things I forgot).
Is the saving from disabling xHCI significant for a desktop system?

Users may be interested in monitoring chipset temperature even while
not actively using USB.

I don't know what are the conditions to put GPUs into runtime suspend,
but a USB HC will be going in and out quite randomly, depending on
connected devices and their workload. You may end up needing to answer
people why their sensor only works when they turn on a webcam :)

Alternatively, would it be possible to bring a suspendend HC into D0,
read the temperature register and then put it back into D3hot without
bothering the USB layer to fully resume and suspend xHCI logic?

Regards,
Michal

