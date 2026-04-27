Return-Path: <linux-usb+bounces-36488-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uI8kIJar7mlXwgAAu9opvQ
	(envelope-from <linux-usb+bounces-36488-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 02:19:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 119D946BA9F
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 02:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F325E30068FB
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 00:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCEE1EE7C6;
	Mon, 27 Apr 2026 00:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Co9Xs1UR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A6113C918
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 00:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777249170; cv=pass; b=qfCznu4qjssKIiX1IO2SFxp/KOM1UjXV8UwNNsfc2GHVnn7+1A1HDNbMUa5Xv/aoFns6a8Lc0CG3GhFtC8F7PFThDB3oKcM7CzEnZDuujIP+BurmfHE9ku9NwHMo/+dkmZXAh5n0iGPpPgOx5JPaGOCNGEgX1TTr6MqH08G3uXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777249170; c=relaxed/simple;
	bh=ugOVfCCiJp+93ixYgWWnYCXqvdHveCQmPGZim7XNpME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ko39+7c85WhTvvI9hWPdspawFvKfOz3fhgQz3p8hSwUolttxAFSG74licV9t5gVHPlM/L6/3dXOTb6ycNRQIZq4RhD7h8Le6kmW/5oklZMEkhjgayq/uebjFMqVHQiDLxz4BCy1ZmcAeNJPbvT0BwjfJA11ZotHIm+bZ1YcDJv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Co9Xs1UR; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso5515243a91.0
        for <linux-usb@vger.kernel.org>; Sun, 26 Apr 2026 17:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777249169; cv=none;
        d=google.com; s=arc-20240605;
        b=CzweG4dHsZfcvEU3kG0iMeYWrtrhrw+U1jRSEUQHIrfHJoF+P+ZIW8eSjci4z5+izt
         EZ1sEY2/im0xKHlYFwszU2euP8mOiwxcNKT4KpYkWjcTMrMNfMdgNYCXNcb/mPiOcm9y
         76uNVCqXHyILDhxOHDC2LzNz+PklPhaQTy8tFkJSxcmMsvw3kqUH/+CiOd8Tg6tg95cp
         TsVkHhwCzlWbqbihPezh5pQ7Mf++9Qs4CSMQqwRzPZjkgIW2ZYl0c4KFMC54FArAo8uo
         6uhPcFB1yU2ZdDHYTBhIqCsT2FQs0HjKQI8o0SdfIyEJk8W2Aru/TSBPy+kHeaYC9r5s
         Xbdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ugOVfCCiJp+93ixYgWWnYCXqvdHveCQmPGZim7XNpME=;
        fh=Wq+Tfz3YtycUQTj9QxKMyHU0g2WGEGHZSwY8Hfh4VCY=;
        b=fuE6wD+fWPakfruV2AWVJw3y8f67pnivKbUOlb3sbN6jan4TgcN3RojPrTULEkZKr2
         QusSpV6B5SO52hri7Bxl3yI5knX6Y5T00+0Si2hLVySqE7YoLhKoARsUpvEiRBibuHe1
         1jUqpYyp3a+65xurc09cDjO1q0Nhg3p5UA/g5FxWmqZokcHWZgIkTlDZC1IIj064CT/x
         SAQFSWWHBpLpA0U7zpeWuin8TYE7XqchXw7olsF1nZiJXZqSde6fombgEMC43zWoE/eV
         lpUZ8lpDiQir8PEOXRUxy6J27Gd7nYjGUEyM18xn+t2XsvfbGp5tBp4AlxCglVz/064h
         cItg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777249169; x=1777853969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugOVfCCiJp+93ixYgWWnYCXqvdHveCQmPGZim7XNpME=;
        b=Co9Xs1UR/5GhVp/Mg8sBa3+wMayef/UGATUJ7MRs67G8STwVmPgA+6PkXYCciMICP4
         i/Qza1CJGAjizMKd9JLnz3pJY3CU71o9uRGE9+acb9RBSyVsIdNoTlSGpifhOqnnjWto
         Rb/tUCtdcua6+8VL3TrrPLjaNU9XJ2+6Wn4MCHbXXAanr+8magUJCH8cGzFn1l8HPjmj
         kuxIJ9i5xQ5/kkH1Kh52hWJTxRYBhzAf0cJHB5hE5Mm/hWLbh2YKUMXaQspcP1FCHKN8
         qWXgWJXHNliqbIk83Ca0EcutmocwBhKfRVDD18qsgbuk/S2dVBmrro9gHudHbm5g9YSD
         Pc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777249169; x=1777853969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ugOVfCCiJp+93ixYgWWnYCXqvdHveCQmPGZim7XNpME=;
        b=qNJs/uO4LVb6VBnnVjkXJWAmIKr/IXio2fKjauyo2VUFe6/57o6q8K17BC7HP9O2oe
         FYCt5F0i5TotpswuyNSg3FrMxIlGHGQwBGFeZstRc28X0jj1N8Wxv++qoELeSDeV1n0w
         O6+eafSsjZFQH2y18FvRArYQyqHAdbuHQSw4hgBc6Z87oon/MmLW38E5fFAWj5453lVC
         YF17nPkgBM/P6xRFb+M9Taijd3hssapRMdRZ7XI9kkEY0XF5uV/zORfGLb+H0u77q+17
         qOU0nhHGWg6HcBXJvAkR6tTeiqKQr5NBrC07UFgAFwqYOIevuedfX5TjvdKBx2C67OJh
         5Dbw==
X-Forwarded-Encrypted: i=1; AFNElJ/0Ss4rISrHQOxy+e8dtZmVWmKLtsCd0GDwwbpfM3R45XjRu8uqnb6Rn4LIwGMAgA9r2cjafFpSdMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQgTUCSbJTlwXYQEl095nGGCz6W4BMtl1v/N5r58wLiSCWuiBK
	aMkMrFYIzw8+3UsFy5nhqJEBFF5rlWxJx6MXFo1cScnjHjk4izNGb4flDPTD+WRudcm3qlJUt8P
	AZzAKi5i+rGBm3XwlphOu+Mei5g0Uavk=
X-Gm-Gg: AeBDietb7coV122S2pNLzJdyrwmiN3UHr+Uk5b6VBJzW/anLY4sSZn5EUcqK9nerOMh
	x8YESUtiCxSuUArNGOminRyjTsydMatPdMW3/6blDZ9q5J82MaXI5WHtWRaBavhKbjja6OkuQzB
	DEEFFeCM6FkPxA0WDyAemiDlSa05Q/Q8/WbV2JYN0eNI3ZakuKErNCf9ty5VltF0P6kuKR/7+LI
	c1paCLLkzCEdT7oFYzEMSYEWu3VF9h15nCCczWNnxs/383wb0bFyT7+7qjgDpnvmEHCImAm4I5F
	RknnfQkUTRPLwuDTPPAATNzxlK06/1d0Gu1OK5YTAQ4FBf8=
X-Received: by 2002:a17:90b:3b4a:b0:35d:a4c0:a0ac with SMTP id
 98e67ed59e1d1-361403d61camr40703643a91.3.1777249168661; Sun, 26 Apr 2026
 17:19:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417021858.6582-1-phucduc.bui@gmail.com> <a145db93-a8ad-4bee-8404-21f356d7d4ab@kernel.org>
In-Reply-To: <a145db93-a8ad-4bee-8404-21f356d7d4ab@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 27 Apr 2026 07:19:13 +0700
X-Gm-Features: AQROBzDh5S1ZBzuVxFYQ8RBWiB9vcWv-M3KhV5VA_7nj_DMjt8E8DfNhVOVUkdY
Message-ID: <CAABR9nE_vwzWwZ=2bbwTYgEtp=SGDnzVUA5Y8jp7gp-Ky8MN-Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove the redundant 'type: boolean'
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nick@shmanahar.org, dmitry.torokhov@gmail.com, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, lee@kernel.org, 
	heiko@sntech.de, gregkh@linuxfoundation.org, linusw@kernel.org, 
	zyw@rock-chips.com, zhangqing@rock-chips.com, gene_chen@richtek.com, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 119D946BA9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36488-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,shmanahar.org,gmail.com,microchip.com,bootlin.com,tuxon.dev,sntech.de,linuxfoundation.org,rock-chips.com,richtek.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]

Hi Krzysztof,

> Why did you change one file and ignore the rest?

I'm processing the remaining files with caution. Files without
significant descriptions or context will be updated in the upcoming
patches.
Those with specific descriptions require deeper review and will be
handled in separate patch series later.

> Why did you not mention previous feedback I gave you on your patches

> (some time ago), that there are TWO TYPES defined for wakeup-source.

Thanks for mentioning this.
In v2 of the patch, I reviewed the previous discussion between you and
Connor regarding the two types for wakeup-source.
https://lore.kernel.org/all/20260316034606.11304-1-phucduc.bui@gmail.com/

When moving to v3, I followed Rob=E2=80=99s suggestion to use true. I also
sent a follow-up email to confirm this approach,
and since I did not receive further comments, I assumed this direction
was acceptable.

https://lore.kernel.org/all/CAABR9nH3hr+Y5ksD0cn3Gd9XUvmb07X7zJw0b4k_yVbnAu=
z9=3Dw@mail.gmail.com/


Best Regards,
Phuc

