Return-Path: <linux-usb+bounces-38093-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIkwL26xFmokogcAu9opvQ
	(envelope-from <linux-usb+bounces-38093-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 10:55:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 650295E164E
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 10:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ADB983005984
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 08:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 107F9396D15;
	Wed, 27 May 2026 08:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abSVkwtP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00C73E3C7D
	for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 08:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779872106; cv=pass; b=XrFZUQhRW/OF/4uWyqeWcERTHzdKm17lb0qgJl43RxEQUiu6azzQUkkjPQWs9aEWa2ysOTqzaGE41e4b9kXWPq7xtkpY8r6gAnuVqu+W+i0pQ45aSR09eq7d9+JN4sQ1MbywG4YXg1ACUDWAsdrlvlo0+iOZm88R0BeLrAn/B2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779872106; c=relaxed/simple;
	bh=k/rf0sprghjpMIgMuOwadzixiyngqMOQ9ESziPobPSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ocvuhDsUNwwVFd+inuRwSZqwHkWicuOlLi4kQX8pgwjF6bEonJYTe0F8VYtdG5/RQ19B6bpeTcZEUWZzB1+00CzVscru/XLbyzVlZtE5lKdbktlqBro2vtPgdY1MoXu3rliETPUs6rdWXNZwfakO8eRpA05NXA1L+KVDWCI0AaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abSVkwtP; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1370417c01cso3160415c88.1
        for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 01:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779872102; cv=none;
        d=google.com; s=arc-20240605;
        b=GGqT/EqWZP3o3lebMlqhNg9F++XuQcFwjerX/q2hxyoInorTlbZ4rnLCYsScBWQCPS
         KFSAlRH7YpuoJWF2Bw7PWxQL9Jx9h56+w6jVNkX9rAQxYknR3wV1O9tuKzvwbTU1v9eW
         MOPzufjhk25rNa4dtfk0x3i/gFq/qIfZwE42o4DjvpDVFG4pTWulPZe/WFHz/lzCj2k+
         CUv70zDwhxAOWwjza2Hi5TCAsxq4WyyVAegh0bnZj9+FTUNw3GEvxF2799w1Paoa/Lef
         TCirSzSDePQfBjeee5wcTN2P97PBNebe34uJDcnB436Z1AW49T5eNYhEV8bStuJ5xlF+
         2XHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6QWsDCHfCMtM5YM23243b0CJRuPJzWBKJSsV9LUzw/c=;
        fh=KbEpI8PkINi6DfR7g/mA2Z/ELzFy1iWkej5IlKgysck=;
        b=FUln2i+2LsgVQrMEgiJ2EsSyysXmvkq/5hwFlVKiMfUB+hbt77cSAW1fcaxHeM9GPo
         NP2Mbn69Q2lUe3BxfywXosjJWTmJNaQgNlYsRisr0Q+tCUSv4k3F8XkRfFBBTgzdS3FZ
         6Wkf9DQTRdKWvPozks10EZPur6t0KdrK0xYh31aQmjRRFtEEjSufufPQZJk8hdsnQhuq
         XJ3++SRLeqOITxg4faml6GCE379E4B/lz6v+aNj74mUmR3l0Ue6qQDtU72Y2nA806ygD
         vy7rhL9elZ2zONddTKaXh77FQIvhgP7CVmkLFmzOyqD4riOj7ioFucrkiZqgcxBZ6sYE
         DBgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779872102; x=1780476902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QWsDCHfCMtM5YM23243b0CJRuPJzWBKJSsV9LUzw/c=;
        b=abSVkwtP9wfSyoCEFQTaTLLXaJuBuxo0YqIZ8bg78Xkb/MSaQ3RvlSj/uG4OmLNnBp
         1qtrzlAhk7T6vrl5F4KBnooy3QUt5VzMaTPn7wEKWcxgyIw2kinnlSxSek7cmZhCHa5d
         M5Ut2V121RytsTy/joiG6E2tyE732AwsyMaR8C/l/M9OukLXesPNd//ANFOCZxjOsybf
         VMyi0pVgtiMPaPjoAITpYYcQbWOYVShdWAs0Fzm0/rbErKpPDQrw6udpgBBTqOD345RR
         H0zZ9Og3dKHUZJji49HqMo4xPF3+G/r0ONojOvpaNWqtDTmpjipGrDGskJdx9swiDoUq
         y9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779872102; x=1780476902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6QWsDCHfCMtM5YM23243b0CJRuPJzWBKJSsV9LUzw/c=;
        b=XnxskVKA/4QRsIum5uLoiLy1lQvH6fARZje0k4e9ba4hyApIuFf0BwJRlYth5gGCDc
         2hj7lxODGGXxB1T5Zyl9NlghABXw/sTi1MIkfe265F72k/Zz9goO2lbTCPbecBA1D8k0
         1EfpiHwcc1D2Z2lwrdJmlYHZH+cULd5ajL3uabMZqS26QFIYNibG9UURzxxMZVhl8HWO
         whUlDl8kGp51J+yOsR8Fo4dJLX7lu9F0k2rEgi3wzuK3Yo9pPJ6HAwZkLJnvpty1OlYO
         DJRWFafoVudRJHT9MnCl8f68xW95PbdcrT0XFvgLdXV137UshPquIZ9JJXaQ0fPSXX3f
         QH4w==
X-Forwarded-Encrypted: i=1; AFNElJ9ZyvFj7ZLbNp85AvI8okFYf3tIG5WB6WiZTq/oY9QkTEYvNHrb02W7BRsqCqdT6eFE4IO8RmjTGq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ2oi7JWkUDWXuoh0OwtH1w8RuqUfvy0Dq9qQzWH2Y2az9tiBf
	OINwTRSocZEvu6j2adStpm2E80332JBJToMyz/GCvdGlhYiPrGEt6LOjW0b1UI/X2idHVzwQc5q
	poy3DLCwXkt7R+l4tV2TTLqAqoVWJE1F5Hw==
X-Gm-Gg: Acq92OEkgXQeArbGdvfHfF4iLYRw93sSiRMg4CzyIulN120Jtuv+mKtYTOki8CeuL8c
	lDZ06X0idAPBiLuU+V8PzIQrUGPhxMNKrhMtgy9xMoZhnAyGrmgYgQptWizPfZBmz+TFEMd6ANE
	mrg9gd9VqmaEBnC1WOddUMUzOfIY8sSqd7d2Zx9eTVenJMUT0pypBvnGKJyGtSQFAIicSECE/5G
	U0jHE+OWX0VwnNlTOhvAL8Dm08gTsuruwIoJ/lqxZgBK7Ma/WaV8md59H4r5zKaoGhUhZj2W+63
	Ole0vy/+pIHDSafAFnY=
X-Received: by 2002:a05:7301:d0f:b0:2ea:ed70:3ea8 with SMTP id
 5a478bee46e88-304490f574fmr9265322eec.29.1779872102437; Wed, 27 May 2026
 01:55:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523084408.50346-1-clamor95@gmail.com> <20260523084408.50346-2-clamor95@gmail.com>
 <d28799ba-a4af-49b8-a437-3e7b54ed06b8@kernel.org>
In-Reply-To: <d28799ba-a4af-49b8-a437-3e7b54ed06b8@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 27 May 2026 11:54:51 +0300
X-Gm-Features: AVHnY4JaYaiHwPLUWc19UBdX6yuMZEQ5-2cdxAvjMlSZR4fbv5UKlVc_P1AsxYk
Message-ID: <CAPVz0n0wzSkMjbkgy3nveYobruuDnV_Dm1A4gRQ6XOm6dTOrNg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: net: Document Infineon/Intel XMM6260 modem
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38093-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,netdev,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 650295E164E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D1=81=D1=80, 27 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:2=
3 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 23/05/2026 10:44, Svyatoslav Ryhel wrote:
> > Describe the Infineon/Intel XMM6260, a 3G-focused, slim modem platform
> > designed for smartphones, data cards, and Machine-to-Machine (M2M)
> > applications.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  .../bindings/net/infineon,xmm6260.yaml        | 74 +++++++++++++++++++
> >  1 file changed, 74 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/infineon,xmm6=
260.yaml
>
> Considering that you just sent "power sequencing" device completely
> independent of this, I think my review tag should be dropped because
> this is incomplete. Basically you will be changing this and maybe even
> in backwards incompatible way, thus this should not be accepted in
> current form.
>
> Best regards,
> Krzysztof

Noted

