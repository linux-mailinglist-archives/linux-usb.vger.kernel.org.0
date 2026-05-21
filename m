Return-Path: <linux-usb+bounces-37893-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAiPNFUYD2qVFQYAu9opvQ
	(envelope-from <linux-usb+bounces-37893-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 16:36:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 539D35A7666
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 16:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 878D534A7400
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 14:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BB63B8BD8;
	Thu, 21 May 2026 14:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b="Y3HTszzr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CC13A75B1
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779373274; cv=pass; b=LgVf6JbbonnG6MkFCAwTY3o5Lwy0TJmBXMsH4QVWeIq9FaoRqmr4ajjdYjJf/YbieN9AkCTQUlCigaj3esIqB2wNDngfkiqDg1EQofT5j+1/87s2rlp8WHnOgUewMepUgUSCWB8u322vG2MRyFmUlw9zQgic6Vhv72MNS8FSO6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779373274; c=relaxed/simple;
	bh=2kvTxgC5CktaC+j4o9y0c6/EDWFOQiOSkjkB1cbEnTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUv2cRG7cQ+1QOf7eoP4aEJufAf1gbCiXJUXcrFZ+WKtRC6pFuJshwUhuDPT0ZqZ0+d/uIAbPJa+F2jVUepduo8hgXCvyQvuJQbqR+brCB1FSg920K7IfK4WF3fxCQvtsUAIaXAywL82phZmNY1EmEms5I/ri/ilVJEIkpKIYDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com; spf=pass smtp.mailfrom=motu.com; dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b=Y3HTszzr; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motu.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67c1e0229acso10354836a12.1
        for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 07:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779373271; cv=none;
        d=google.com; s=arc-20240605;
        b=FVRGClSEUb9DMBWe2HSl/9jY+yA2wnYilipZYWdslwqkza5mfz8tZZy3wabBYd+CgX
         dY+4k13JlGVnVxAhYr91o5NRJ5PDsgIuGhuYbdPlB5zp+Yiz94TbUOwYOVHj8ZABILnA
         WtqxO8WJ3Ji9Zy7GDig3nQvSI9ti7Ki1AfC9rwZ4q/VNQZ//7wENY15cGshhsWEkFD3T
         xNXuM5uj/tkjh06MjsRQzU8CF3W3sgMBf/iDUqAiN753ri0o0eV25KZWW3Y9l+UoF9+F
         pr3ysw6gl9SIeL4M6J7vptJAt93RoJmpsml8xRLXFJXdZuQWhsLbYULq/Icy8xfFkidw
         OjhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2kvTxgC5CktaC+j4o9y0c6/EDWFOQiOSkjkB1cbEnTk=;
        fh=rhCEDnVMiX1F1zk3xueImoPYx2yVZf7QqrPeTadCdV0=;
        b=Sfc9Id5FTwH2+GVDwnpal7ueEYSzNJ/Oe7EYxOf3xHaqq5JQiP61fzrxqxWuFIj2rC
         dEYZ4aLpx+qz/G61R8vQhUcQrN7lC2DbcvacBgy3Dlm9isHKSut3uDh7xnCd/Z8UcJup
         CcKJCoauRhY2XZtU4cxLBFqOFNmd8U5hLLKt0AuJzIICcxiAZtkk2N5Ke+YgGThQpyP5
         CMphYpKCqr7D9/fzTdmukZa99iPUM5ZI6CnaynN7NZtDC6s8USy00fpxRpIvKo5OmY11
         5eRUu78BR+ox+VADgTPqsDJiU9uWBYyjpJCwjVCXoC3StbmIz6VnMLlT/1wsrAhUkN0A
         KHvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=motu.com; s=google; t=1779373271; x=1779978071; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kvTxgC5CktaC+j4o9y0c6/EDWFOQiOSkjkB1cbEnTk=;
        b=Y3HTszzrRVHezws6H40lgHszuUqpZse9mZxk/ELYiSgsig8Vby76t4qvhNzJE6piDa
         34vksmzyi0Q9/0zeBVqQWM568a9hvmBuvdKBQDYA/IdOOz3TXPnnYGVdnMyL7It/e20i
         2RLTmcOZN2fVfGGy1LpBNWzqilS00cxFl8Xh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779373271; x=1779978071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2kvTxgC5CktaC+j4o9y0c6/EDWFOQiOSkjkB1cbEnTk=;
        b=jammrb1Gln6+xEPZGdQ5t2/+j8DtHYRsiUAloAJGTbm+21I6v3iTmdzHHtPISCFSXL
         aWupUysDlnexSpGMPNlf3NeFdX26elvIjwLxMkdGTE1/gm+bOXaB8lM0NnTFP2Xsui05
         dlyGgJjVahOp1lprSKlOaQO0vGsrTR9f4tRwnI2nhAuD8OEUjTTVOg/uIekiaBPK+kd2
         BYiGHwIMbW9KVTwFHqfHuS67hycCAbHix/LK8cPlrXg2U83EqoOma6kPQ6U5a6O2Mis0
         cvUIC1dzFfyLxOIpV4bKX+NdHsaGaWUDzC42Ft1VezFQLsMJis9Dp34/HMgOWQFB9z8V
         rGxg==
X-Forwarded-Encrypted: i=1; AFNElJ/MxOsCKl2fv3YjekhCbCF0iDKpzdYjLSu99YkvKUrfh5iyPhfu/cjlzmWj39KXFEIRtE+ATbdUrOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOITsU3jxwiceM/GGphDJTv+GmL5gMav34hDj0+f6t4wNFtsSL
	rdF9W7DnNM9CWBTBupGWXvSIHNLl8u4uVIBwCYn0BYlL1L1GjlFr5Lk5bUKZBbJGEhmPME7pYbv
	z3wZJHqXABtbuAe08pDz7Yeia1SgRBEhOVGvr9h7wJQ==
X-Gm-Gg: Acq92OEEjcLLjitZc/UpUW6Ky7hckxUJzJViidCH/DjGmTINyvni3h4r13WkYo37X28
	TqOpPGBL1YQM+nYFL1TYzOKl9MLIE5wv3TY+e7NraEL7HffvWs5+SOHDhZIWh8IqoRlkIQNUmig
	ham54zbHZJgi4zMPQzNosazJD0QXxDsMS/isQYzhKxf/iV321oupoo00jf7iHgyKqowTBLkOnEP
	cEqTr11Jjvky4nwpsam/hOe09CcJfMj2lxGN4MERKgGgDtBbd/Z2bZTdZMDb+HHU3ZhiJSxmadz
	Vy5coM0d
X-Received: by 2002:a17:907:74c:b0:bab:e742:aba with SMTP id
 a640c23a62f3a-bdc186fd257mr183045166b.42.1779373271099; Thu, 21 May 2026
 07:21:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+Df+jeoj_QL6XNzUyP963HF7ngCWoAs0MjqQXPr3Fa6VW3rXw@mail.gmail.com>
 <20260511192105.3756809-1-mathias.nyman@linux.intel.com> <20260512110810.17fbde0a.michal.pecio@gmail.com>
 <85f8441d-d6c0-4607-9269-d80b1294afbd@linux.intel.com> <CA+Df+jf79bnONyXUnf0_zAUrqNAVzy1zt9VCivbxYvkedfGHRQ@mail.gmail.com>
 <20260515063210.4ed0a940.michal.pecio@gmail.com> <CA+Df+jc=z96K52NJ6YXG4x8gK95udcbFHs=0hTQS6cm1r8z0zw@mail.gmail.com>
 <20260518091327.470d8fb5.michal.pecio@gmail.com>
In-Reply-To: <20260518091327.470d8fb5.michal.pecio@gmail.com>
From: Dylan Robinson <dylan_robinson@motu.com>
Date: Thu, 21 May 2026 10:20:56 -0400
X-Gm-Features: AVHnY4INjbxd_gIFopOqxZ66F2rBIaVWiJjCpzU7taerGxpRx9pwASfeaM7EPPc
Message-ID: <CA+Df+jc7rPGBWzvW4eU1WA1GB=S59OsF3_q0O9HmrczM06CV9g@mail.gmail.com>
Subject: Re: [RFT PATCH] xhci: fix frame id calculation for isoc transfer
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[motu.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[motu.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37893-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dylan_robinson@motu.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[motu.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,motu.com:dkim]
X-Rspamd-Queue-Id: 539D35A7666
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 3:13=E2=80=AFAM Michal Pecio wrote:
> Underruns are the most important thing to test here

Agreed.

> Yes, this is very annoying because it's undetectable (without CFC).
> It seems we need to handle Ring Underrun/Overrun events, somehow.

I think handling ring underrun and overrun events is probably the
right approach here. I started putting together some tests, but ran
out of time. I hope to spend some more time on it this weekend.

My current thinking is that for an URB submitted after an underrun or
overrun has actually occurred, but before the xrun event is reported
or handled, there will be no way to determine its true start frame,
since it will have been submitted with SIA set.

However, because completions are processed in order, the HCD should
still be able to determine by completion time whether an xrun occurred
before completion of the URB, and could therefore indicate to the
completion handler that the reported start_frame is uncertain.

Hopefully, USB drivers could then detect the discontinuity either:

- after completion of the first affected URB, assuming the HCD can
indicate that start_frame is uncertain (for example via a flag or
sentinel value), or
- at submission time for the first URB submitted after the HCD
observes the xrun event.

Not to repeat myself too much, but I think this discussion also helps
illustrate the value of allowing drivers to supply a specified
start_frame, since xrun events become much less likely when scheduling
sufficiently far into the future. That said, I think it is worth
sorting out these underlying frame id calculation issues first.

Dylan

