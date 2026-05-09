Return-Path: <linux-usb+bounces-37184-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CaLOlNT/2lZ4wAAu9opvQ
	(envelope-from <linux-usb+bounces-37184-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 17:31:31 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E86500481
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 17:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE0603010519
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2026 15:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA402C11F9;
	Sat,  9 May 2026 15:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuBijSLK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701F81F4C96
	for <linux-usb@vger.kernel.org>; Sat,  9 May 2026 15:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778340687; cv=none; b=NleEVKYuodaQfFrjAywglkFYcPhh3l1EFfiI9wJ0V/W6cJrZScxgGwYle+nzKfBumZE+rH++hjUEhsVoDvAsVtH+DIVK7hJ8kWbxdejEcsVPqcj3SogmGfVIzwQc62WjXZNSmJh9c3ijGEbNIdzFzWxcohRwdICSGeyyVodALRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778340687; c=relaxed/simple;
	bh=v8dDnB6Mx5WSVbgMWKHv2nkN+YZSEaZ73/z3GFXXrmw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vGcvPrb4/YzV9yLidULpbfnraAhn2WnACyV0Oe1OZs9zlkzPb8VwNdtD1wKog4wR9aOzKEJRYp0klLUAnRtbtuqFq4iM61TLxXS79e0AqqecxIBJmwBauJ2fBfgTe2ap7BzCN/O0MxaDojX9phluJGl5xPSCpJenMWwueZYgH2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuBijSLK; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59dea72099eso2793787e87.0
        for <linux-usb@vger.kernel.org>; Sat, 09 May 2026 08:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778340685; x=1778945485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8dDnB6Mx5WSVbgMWKHv2nkN+YZSEaZ73/z3GFXXrmw=;
        b=AuBijSLKHoQb4/Ay1OMPrWpzSz40w1PGwA8BsIFhon/WRYkDzV9M+fXsE0um/BOKOn
         Tx1wKXwKegU9pqAgw3514ll+h6g0wazmQvSRFqkSBtHHdFCYCqajDKcUwCk+eF4xGOWX
         9ZkgddXINdys6l1HeREr/YSOJpTg3rIzu8KZWtKS0Y3jtB9XMoXhwwGy2Gf9PxmeaAXG
         ALpc8rdvBBpb5d386MYbhRbaaa8/tHDaNDMSg5e+WGOOutwks+ABDhP7JZKF5bwR6rMn
         ILlCZVVY21JoMZdRBtU5uXlr+vRrvJMhBNbl0xdHgc71BOgoaOnfs2FWp0YUjBElX1t1
         0IQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778340685; x=1778945485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v8dDnB6Mx5WSVbgMWKHv2nkN+YZSEaZ73/z3GFXXrmw=;
        b=BKMijZ1MkN5wENm5xIhQws46CTIlZalE0XIsfMTKjBWQElXgCBQzej5+VknojPwDrZ
         qoVEYzxZqi9YD7nNLYvYgcSEpZimNtn3jiNFCD9+jiSYZfAoO4kOkNjwByLADJsS7ClJ
         IGSOelYeM/oy79iVRPlMHTa+EdTDYaGNBt5nwQkUCf7ACdX8le5FRpGz+jFQTImm8yD1
         N0PkaLVy52/T+capDYnyPXPoaiX1i7nOXQCRwdPOMiXvosbIB2+OG4ExIvkpU+vKVMEJ
         3XWj+WZ5kYFo++vAxMXZt0FD9CiSGFlqgp0IPPxtU93mesOG/VDcMxBkA2aEWXRylct2
         0ahw==
X-Forwarded-Encrypted: i=1; AFNElJ+VnixHsFXf7LddvSE32chYimi1KDcObLBfK0WQ2bQsh7kj+vVcfpu3b0J/onrLZI2net50a2O6dMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyktL/9JOtEvr4C1k+j0sICEVV0ZS5r3tCEojb5sbvjF87yeHcR
	ACBo5GXCMWfNutK05Y/Ak3iL4UZL9peUSK26xEKzQ3TFcdRRpRstzKZK
X-Gm-Gg: Acq92OH7leONtbQG62jpzCWIPRv7uJcpzrGFxW5reli2QrVHM4HZaJoNj4gB9/hLBip
	A03C2wha6sYhQVcGU0vd0NcG/SPmv6+7dPNHLP90nadB94EzOusp1rKwKw4QTcTrVQIKA1quATa
	ZOoyNgFSwOdMYjw6wC2zWSa1xAVxvf0GKv5EoyiRBEK8tZS00/pYpQqSiDlpyMURBFYPQimYhby
	Ih37iP1YRfKfgt36Eju65aUDtckyR+GxNQZGsaLIntmav7un9zmh1Fpoci6VV69/Jgy7IKue3QF
	PfsLSXD6Tzjfu85PrLMEaHhlpScAUR5RUTAdoc+ZkgrpkEEEvGF8R8yiuZerBh4qlfQZS5UGh6b
	dk07Tu0VnP/utwt69h93yGOh1hdpydheZ5HG9OeUV699TRXmGUizaakeGBUw3bCnl9ZlAioyGKv
	lGpPAgYLYZVu/z/C3wt9/FAYBesLhxqZQcMfU=
X-Received: by 2002:ac2:5932:0:b0:5a8:881c:9cec with SMTP id 2adb3069b0e04-5a8881c9cf1mr3754775e87.1.1778340684360;
        Sat, 09 May 2026 08:31:24 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f3a614sm12131491fa.16.2026.05.09.08.31.22
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 09 May 2026 08:31:24 -0700 (PDT)
Date: Sat, 9 May 2026 17:31:20 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Gregkh <gregkh@linuxfoundation.org>
Cc: c2mismo <c2mismo@tuta.io>, Linux Usb <linux-usb@vger.kernel.org>
Subject: Re: USB: Lexar E300 21c4:b083 fails SuperSpeedPlus negotiation due
 to missing BOS descriptor =?UTF-8?B?4oCU?= request for NO_BOS quirk
Message-ID: <20260509173120.7c15ee19.michal.pecio@gmail.com>
In-Reply-To: <2026050910-shopping-perceive-b23a@gregkh>
References: <Os7vNaR--F-9@tuta.io>
	<2026050910-shopping-perceive-b23a@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 65E86500481
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37184-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sat, 9 May 2026 06:07:19 +0200, Gregkh wrote:
> On Fri, May 08, 2026 at 09:18:22PM +0200, c2mismo wrote:
> >=20
> > Dear USB subsystem maintainers,
> >=20
> > I have a Lexar E300 M.2 SSD enclosure (idVendor=3D0x21c4,
> > idProduct=3D0xb083) that supports USB 3.2 Gen 2 (10 Gbps). Under
> > Linux it always negotiates down to 5 Gbps, while on Windows the
> > same hardware (cable, port) works correctly at 10 Gbps
> > (CrystalDiskMark ~1087 MB/s vs ~450 MB/s on Linux).
> >=20
> > The kernel log shows that the device initially attempts SuperSpeed
> > Plus (Gen 2x1) but fails to provide a valid BOS descriptor, causing
> > an error -71 and a forced fallback to SuperSpeed (5 Gbps):

Where does it show that?
=20
> > [=C2=A0 179.146227] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device num=
ber 4 using xhci_hcd
> > [=C2=A0 182.237405] usb 2-1: USB disconnect, device number 4
> > [=C2=A0 182.420843] sd 12:0:0:0: [sda] Synchronize Cache(10) failed: Re=
sult: hostbyte=3DDID_ERROR driverbyte=3DDRIVER_OK
> > [=C2=A0 182.552343] usb usb2-port1: config error
> > [=C2=A0 183.131966] usb 2-1: new SuperSpeed USB device number 5 using x=
hci_hcd

Users with confirmed BOS problems had different logs:
https://bugzilla.kernel.org/show_bug.cgi?id=3D218943
https://bugzilla.kernel.org/show_bug.cgi?id=3D220027

> > i did try to add the following entry to drivers/usb/core/quirks.c
> > in the usb_quirk_list[]:
> >=20
> > { USB_DEVICE(0x21c4, 0xb083), .driver_info =3D USB_QUIRK_NO_BOS },
> >=20
> > I am running Arch Linux with kernel 7.0.3 (in the recent version
> > does not contain the NO_BOS definition in its source), =20
>=20
> 7.0.3 has that quirk flag, so this should work.

Well, maybe it's doesn't because it's a different issue?

Regards,
Michal

