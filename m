Return-Path: <linux-usb+bounces-38164-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBP1KE+vGWpyyQgAu9opvQ
	(envelope-from <linux-usb+bounces-38164-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 17:22:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D09D604957
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 17:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 968F2311C6F6
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 15:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBECC3612EE;
	Fri, 29 May 2026 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyWOGUdF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602F63E8662
	for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066693; cv=pass; b=i85otn/KisuuaoEl4iRVCQLaZEslb+gRZy/p2++O+JXdiUZYsHIwGLvZFI/unguCT/oE95d4IygHgcIHqYRfHTSKoH+/LBnl+IBf57fp3gHtLcxyVteHBpLyN4PO9eN2sycuYza0d30eHWYqhXagcuBVaKcZaDyRobniXu44Grk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066693; c=relaxed/simple;
	bh=fQfj+gPmvgEK0Au1fq8tS1UqLUrdEtewMemM1nyumCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tH5DlRwDRvt7ZzDjBKyAqY52+JXQZvxobV+g34ujyvdeXZQCwIN62+U+DGHybWWqaEjgyT/yreqXXvI8VNwMjXYk2iMIWW/9IAPoS/PUlnLerny2v3oFeOd1fT/M9DiQiGP36QRR9h9hJKXIJmAZXQZZoKkCtLxyXuGU9dgA2Fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyWOGUdF; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-132d1b2519eso10644569c88.0
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 07:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780066691; cv=none;
        d=google.com; s=arc-20240605;
        b=ZCv2ydnvBXjusQK5PVxY9oJZRG56bzmuHH5eDPXQGBd1vIkkcl7Jc99dUJgFXRN6m7
         1lqFHwllhcHcrLxOA8d5SriUIhdYtlneb8Zxy1U8jkxPHN7dtDVr54qYzp1vwBoiovXu
         NjpU2vErXJXT92TSZZ4FhrjrIaX9xFblwGO5Z8fDJW+/9C8oIv0S9DpruHnjos8G/VAU
         4Hcv2Zo39qxqYHRrZlgFUXHYBjOwqhFFh7XmKBXjmzecorOkPMRB6U4EFWTyKiX3+BgZ
         eqJauykBBPV6e4af7pwNF7U0iCNAOU0ILgiYFlLHp/cpxbAdsuibbKzrfUZa6yAdRAof
         rCHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D0M/NZDH6fcDnv+eyc8PV40uOX6pNFdyudXQwoi/OMA=;
        fh=8/7vHJYNBRbFoA9YDDOhyyPNEhxD/uJx5Zsdf2b2jmc=;
        b=a/pafBvfklMfZsQF8TQgEIcEwJ0qL7SGGhcvdub0GK4VO91ByiY7EdS11nlD3zyT9v
         Zvrj0FsYdKOqCFsjtV5E7SxaoOazvcNrYvrcZLI2uCVZb84J+zhbgcYXSf/FUhMYEJFW
         NGC1qCX6BmdC8LbtkqjeJgHlJnDxfOGA76lDToQOFII6kuP5wwZFDImr9YZwYdC3TUzj
         Ov10IyBIK9P5HmuPJZ309kwPFNe5DghPjU34ePGVWCimtpQn0sQ1eznbQgZ8TKOhohzl
         9nWGns10xaLe+hkB1PiGAgCbc4erra0CvbriJaakthRmqiB+oIT0A11Nx9sYp7AR+Izd
         hm2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780066691; x=1780671491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0M/NZDH6fcDnv+eyc8PV40uOX6pNFdyudXQwoi/OMA=;
        b=CyWOGUdFOn3NrSgpnO5y1zSbbaZfyqNAaxOZW4bX0ecjvX3v4VcoYZkF0IbeMy6elY
         Iqhg40OsDJj+hgkdC8EKY8Y6vP6CK8ddUAREUAyYxCHZge2CYIyd0WWwvUL5D8mmZGdQ
         oWQiOxJIVnUZbKIf3jmgMh8rvYOOIs458YOj8RAQsIgpLCxP5MW3p7GZs+KE+Yyda8h0
         2B5FeG55U7zCz3kmLiTxWuyE1bYjK4WZSRuuj/6+ijuSR50u/WfKLwNddAoUbejBKExi
         I8Rrj0DbemTU8tcIZj//H/XNMQRLCw4V+yhMHZFMrb7PIKPq+0ZH3KPVGdNMp1I0/FG9
         IxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066691; x=1780671491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D0M/NZDH6fcDnv+eyc8PV40uOX6pNFdyudXQwoi/OMA=;
        b=ObPcoDNVXHdUGjh0JWRTiqvhlEfZ6ne3JnpZPgTBM6j7P2GUQaXLkijp6kbmL0rjoB
         pPTHzicujztqG/VABhVHp77EAUUimPq9arfD7t9lNR6qY1buTpJIi9NrXLzM3kWPzF8r
         8u1U8YIIUqU5rFfH+MjMwkWIXGNVuP+T3ZcNprLSubfubwlKyJre1m/xldG7oCYhnYJ2
         SKgJpF59MdcQrpcxZNzOpvIio2LSDLi/0iQCUM8yNjN8gk9tdfn6PqDpLJ6W0kXn7U9P
         4C6fA7xBifO9NdSgD5Rcqygp/Qsobp21cmp40gxtnyzVplEcPS6yVjubtwGSvHByXix2
         Z4WA==
X-Gm-Message-State: AOJu0YzolUTqElsbuRiRxlEbEpipxPQ7xezcTGIJaE8oUtFniujmBknB
	p9+liFGATpqgE+J3PXqznsqqCZg5kMMWk2Wz4TXL1Q4Zltea2lFY84Rh3AgSDL8j5f6A6aYC3Q1
	sn2n/LuTms128h7s0/515ZVVEzxg0hOPQyg==
X-Gm-Gg: Acq92OFJCoxv6nZZnGZHrSdDuoySgyamfl3MAs7BlRHV1fP9P+nKThNEalW4XuG1ag8
	aNB3lFO2dJrcPWr4RPYhGLLgmcQEPBI7NCvxLpLPRHAbmYzHfCBzg05kY5FmoYXQC0n98oUUhIX
	HjlxsS/Pf90RPG58r6JzQyGVepAW8GfBexY1JzfSRU+jfXi392KyHyJSrJMQAsBS8xNMmb3QFtf
	fcaUan0Nk7H0Ndje79najPgAOPEqbnprFQMNr0RsOrCw2uX9BZQx6P4U66J69PxMRFaL08VFP0S
	1k0TmeGfIcV8ij2isqA=
X-Received: by 2002:a05:7022:49f:b0:136:e42d:2c20 with SMTP id
 a92af1059eb24-137d3f0d89cmr13506c88.16.1780066691402; Fri, 29 May 2026
 07:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523083013.46372-1-clamor95@gmail.com>
In-Reply-To: <20260523083013.46372-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 29 May 2026 17:57:57 +0300
X-Gm-Features: AVHnY4K-1vYeiXFYk-AlYEtzVzIQXE43sf_M9vxLcJuCUs6YujSLvUbhSvlV1gE
Message-ID: <CAPVz0n3hYU86yGeNS9WqHHPqn6JOPGrTqtSz=afs-SyDgeiKvA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] usb: chipidea: tegra: Add external control option
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Peter Chen <peter.chen@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>, Xu Yang <xu.yang_2@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38164-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,nvidia.com,gmail.com,nxp.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1D09D604957
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D1=81=D0=B1, 23 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:3=
0 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Patchset adjusts the Tegra-specific portion of the Chipidea USB controlle=
r
> to allow for the disabling of automatic PHY and USB controller
> registration. This is achieved by adding the nvidia,external-control
> property/flag. It does not affect any existing configurations, but it
> allows the USB line to be registered or deregistered by an external
> device =E2=80=94 in this case, the modem.
>
> Since Tegra USB PHY holds clock gating for controller PHY cannot be
> handled by code Chipidea mechanism.
>
> This patchset is a part of larger series aiming to bring XMM6260 modem
> support for Tegra devices:
> https://lore.kernel.org/lkml/20260511135703.62470-1-clamor95@gmail.com/
>
> ---
> Changes in v2:
> - separated Tegra USB into its own schema
> - tegra_usb structure moved into tegra_usb_phy.h
> ---
>
> Svyatoslav Ryhel (4):
>   dt-bindings: usb: Move Tegra-specific Chipidea USB properties into a
>     dedicated schema
>   dt-bindings: usb: chipidea,usb2-tegra: Document
>     nvidia,external-control property
>   usb: chipidea: tegra: Avoid controller/PHY init if bus is externally
>     controlled
>   usb: chipidea: tegra: Expose tegra_usb structure
>
>  .../bindings/usb/chipidea,usb2-tegra.yaml     | 95 +++++++++++++++++++
>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 22 -----
>  drivers/usb/chipidea/ci_hdrc_tegra.c          | 43 ++++-----
>  include/linux/usb/tegra_usb_phy.h             | 15 +++
>  4 files changed, 131 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/chipidea,usb2-t=
egra.yaml
>
> --
> 2.51.0
>

Hello there! There will be no v3. Sorry for disturbing LKML with 15
year old obsolete tech. My mistake.

