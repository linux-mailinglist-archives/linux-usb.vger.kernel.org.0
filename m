Return-Path: <linux-usb+bounces-37038-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLO/JMCz+2mMDgAAu9opvQ
	(envelope-from <linux-usb+bounces-37038-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 23:33:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0454E0A51
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 23:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CAFC301BA5A
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2026 21:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1433B3898;
	Wed,  6 May 2026 21:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDWPJr1T"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E5635C193
	for <linux-usb@vger.kernel.org>; Wed,  6 May 2026 21:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778103221; cv=none; b=DmxSwrpbytJGUCMv/lAX4SMSjAQzwKk2xLssCpkKDko99kcvlbKcJ8UQ9w7ovDnFwjLSQqp3nO0yp8rq88NImU0uAkNSneoY2Y08OX8vX83HmTSo3G8KYXtWG8gtbVlJk6gzs/3DnzEmGcYbmg7frBK3EE/X9SuIR8PNNzHhDUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778103221; c=relaxed/simple;
	bh=dMbIrheGNaYAV85OtW9Wo1+9kXfiK3PIpOkc3nPKbjA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KRVBuKVp0nab4BaW4BmGd1e+OEV/IbSd5M9p+ZXe5e7ayPskP6G2TVepOYzoD55ea2rh7xAVWDyTMLLiGFQ6cV0sLLfnldEqijSvAFQ2sJs2+eReJkHZ4vmJdyoo9HnbOUJMaoud+O0t61Obl62Z0zAYVRVGm3S0XO+Yw9xHGCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDWPJr1T; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so1450115e9.2
        for <linux-usb@vger.kernel.org>; Wed, 06 May 2026 14:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778103219; x=1778708019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=speIVgikBPZKEXmmEFMgnIv3hnOiW/sq98R/NbvvuMM=;
        b=GDWPJr1TG8/NeMbiWsifSzeZ8k0Q18NgWGOggCXeH6XoATbs76diwaw6k0iRxlApAx
         r+8ZOLNoDlZRYSa8nsEHFmJDC6C7e4d2/+Q8V4ZBQIKTfQqhHOuUD7oMCbrvHRQLVF9M
         6hrBlEavA3Gqx2uKYhTkCUksIWO+eNZZunn6urTIZs/o58qJtdn1YBSMHqxA6/b4Itds
         X1yozmmMKjOle2cxxu0t1tvWmVJgdvTM+s7cRAjG2p9i+JL4i7JGYzkH0ED2rFiqGncD
         zflf8N/AqVcUmGwxfRHko1T4DaGai3CPxmyTG0AezeUJIRfOQOKDIdc/Y9g5MynPYINn
         LRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778103219; x=1778708019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=speIVgikBPZKEXmmEFMgnIv3hnOiW/sq98R/NbvvuMM=;
        b=HfbzELYVHqeWkZSHVmJ3dCqruGZ1jxNbAPdkMsmN9SvDSpFERirFt57xO+6HqbZQNC
         /ueBF9sZOoIuzFezuBBd4HuKp6EYzlDsbhj/mYK/IDUQDtBKGBa266WwuwpNBRBDhYgK
         KEAKmL1BIS1cBHLKj1EgZaENsFrh57nKmrFvKRd3OzimQohNE3FRWaOQbZGTPZcXWTxM
         59a++hgBwA9JEWDIKGE/LSJWYooSZseBOaFt5U8P4/cipBPcj2XtuI+lJ60csNC9Pn5H
         Af2PiLh6yT2U6hIpi2cSYqDyJC2Pn27uOveylBWgpf6I/M8aYzM3KF5sg8L6NFuoqpsr
         eBBg==
X-Forwarded-Encrypted: i=1; AFNElJ9Pwjh94LPQAMVcSCNLw9DYTwQE3JssmJuiN6Vybp1xfJfddaPCPgKZoioVkA8+hxhmSegbeywdCx0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ZCz4cYv8mDVcCtJwEfkNCyxZPscHYC+vN0ANYb02XF7ScIAU
	UEZG4h/B5p4PzfHw7fPAd8XEgzwpJPfCCfIg2pytEUTxh19EjmjrXqwa
X-Gm-Gg: AeBDieuHBpHUP3x44oc7256cJ2RqIWWD19UlPBm4ZoNap5pyNymbWRLMBqGnxIrWjgE
	AsfVXDNroad9xWCohP1bOuZZ/RDb1cPjHtqu/flJwU86vopwC0Mi2pOtgbkvscGDEbRlyx9Dd7Q
	9Kr6kazMAr1Bas5pMI3ZySbcb/Rnufsxqogf2PeP5TA6V8klbcfToWeTS94tuHYjZ0rPOqtxiM9
	ifS3B+2/1nxrl+FZ0El0C7Pm/ArtIvhC/bh8cst5d9WXsEXw3CaMyxrOt1JIN3ffxyxjkaC9GMZ
	pm+nLQAHWcKTmZpI9uPGivS+f8RVC3hWFOkcTqVgfmZcAom+7cStS1Eg7M7O+F26pONN4lxtesv
	+XTfV+8MjOV4lSG+oE94gbG1KEOUcNMYV4YWJPmMUByhU/qOGFiADVMkRkxL7Skz9aVhjEYgVfU
	JZVJgQzb17GANssEs7Lzrc3uplRpRCF7xP3wXHJ/z1+K5cxQ==
X-Received: by 2002:a05:600c:3e05:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-48e51f2a997mr95182205e9.10.1778103218791;
        Wed, 06 May 2026 14:33:38 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b213asm25243965e9.2.2026.05.06.14.33.37
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 06 May 2026 14:33:38 -0700 (PDT)
Date: Wed, 6 May 2026 23:33:32 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jihong Min <hurryman2212@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@intel.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Mario
 Limonciello <mario.limonciello@amd.com>, Basavaraj Natikar
 <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: add initial support for AMD PROM21 xHCI
 temperature sensor
Message-ID: <20260506233332.664f220c.michal.pecio@gmail.com>
In-Reply-To: <2e2ea249b30168a2eab62fc110c226a511f21bf2.1778099627.git.hurryman2212@gmail.com>
References: <20260506032939.92351-1-hurryman2212@gmail.com>
	<cover.1778099627.git.hurryman2212@gmail.com>
	<2e2ea249b30168a2eab62fc110c226a511f21bf2.1778099627.git.hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 0A0454E0A51
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37038-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu,  7 May 2026 05:40:34 +0900, Jihong Min wrote:
> AMD PROM21 xHCI controllers expose an 8-bit temperature value

I think this commit message and certainly the Kconfig help text should
include full name of the chip and perhaps its official marketing names
too, so that people better understand what hardware is supported.

So: "AMD Promontory 21 chipset" and "AM5 6xx/8xx series chipsets", or
whatever they are called by AMD and motherboard vendors.

> through a vendor-specific index/data register pair in the xHCI PCI
> MMIO BAR region. Add an auxiliary hwmon driver for AMD 1022:43fd
> controllers and bind it to the xhci_pci.hwmon auxiliary device
> created by xhci-pci.
>=20
> The read path verifies the parent PCI function and uses the
> initialized xHCI HCD MMIO mapping. The vendor index register is at
> byte offset 0x3000 from the xHCI MMIO BAR base and the vendor data
> register is at byte offset 0x3008. The driver writes register selector
> 0x0001e520 to the index register, reads the raw temperature value from
> the low 8 bits of the data register, and restores the previous index
> before returning. Expose temp1_input and an xHCI label through hwmon.
>=20
> Register the hwmon device under the parent PCI function so userspace
> reports it as a PCI adapter, while the auxiliary driver still owns the
> hwmon lifetime and unregisters it from the auxiliary remove path.
>=20
> No public AMD reference is available for this value.

Is there any documentation of the index/data registers themselves?

Any potential danger that something else (FW? SMM?) uses them too?

> The conversion formula is derived from observed temperature readings:
>=20
>   temp[C] =3D raw * 0.9066 - 78.624

Could make sense to describe methodology, particularly in case some
people would come and question the formula.

How was actual chip temperature measured?
Was the output compared with any other (Windows?) utilities?

People will be comparing these results and possibly trying to draw
some conclusions, like OMG Linux runs this chip 8=C2=B0C hotter, should
I demand a full refund of my free Ubuntu download????!!!?

> The temperature register did not return a valid value while the xHCI
> PCI function was suspended in testing. Keep the existing behavior by
> default and allow temperature reads to wake the xHCI PCI device. Add an
> allow_pm_switch module parameter so users can disable that behavior;
> when disabled, reads do not wake the device and return -EAGAIN if it is
> suspended.

Is such behavior useful?

Maybe the driver could just disable runtime PM while it's loaded.

>=20
> Document the supported device, register access, conversion formula,
> module parameter, sysfs attributes, and sysfs lookup method.
>=20
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Jihong Min <hurryman2212@gmail.com>

