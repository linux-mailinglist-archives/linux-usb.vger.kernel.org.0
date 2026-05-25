Return-Path: <linux-usb+bounces-38023-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPq5A0ZgFGqgMwcAu9opvQ
	(envelope-from <linux-usb+bounces-38023-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 16:44:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AA35CBD8E
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 16:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79421301C900
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 14:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751743F20EE;
	Mon, 25 May 2026 14:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/o1+SZV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF87397AF5
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 14:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779720237; cv=pass; b=PbPGs237mpH2BcboscwTydebKxawY5LD01vSmyxXdPE8PfnTfpnJ4mfOdYBmmDSTUyeiLlKESl8OBOajtbBrreI23LPG1KQed/RqJAdCptAGOuVLQ4lexyIaK8mwnepcDk5cukvhyV6uulXjGow5ShIDhfaeCkPHKSfvggZp2/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779720237; c=relaxed/simple;
	bh=P0e9QPe2YCkGR4KhiV4PcnTIW8nV8j6ZmRvQc7zuxx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hkajvDdQF6xwi8vlFLnI3w+16gADCQeARGLlpnvDo2Zu76Mh6LYptxjCuHKkxt08qo4i2oV/VNjaZg7qwmGZI3Z0yHDAvQzw5122KkIhtfuKycIbOnFvs5JPkIuOB4VoYm2AQXDc92fcnKMfL/KKw4yvATqm0PVZMtENPGh37eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/o1+SZV; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-303dbfbec77so11143572eec.0
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 07:43:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779720234; cv=none;
        d=google.com; s=arc-20240605;
        b=Yh5I8cg16FcVtnLH0DIonI/684NNCVgq0YLrVenvLScoGzb40akmF/VJxcfWjU7SGn
         6lZFWeNGE31VtnOzYqBiEG08iYDXb6HEYruIpkFFUYgiEYEjhj+3sXzvUm1kGrp0GP8o
         7dyCWguUl0AlOMnjZtbb3WTXFvngC1zUupNJZ4e0Mm821N8g1pPxNri4hkKNIEA8dlMD
         3FbM3EZpyNra+Eav2lAGNRvpi2pz3RmPw78oobQ3k66oX/hcwwn0mkTQtXk6hDpfvkKz
         1gtZu271hTuYvR7FI88VyFGua1bz85SyZ+XDCLiwZr/8wU8rGoGFBXOFH0Tu1HuAAMHh
         098w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=71wO09jVP9qmCd1Qkiubx2/BEe+jWKIUN5BAIH24AdA=;
        fh=8/7vHJYNBRbFoA9YDDOhyyPNEhxD/uJx5Zsdf2b2jmc=;
        b=Tvt6eVDcIpGHn//1esXqQd7+Vbd5MASp58Zf10LAVq1EFq5nmiJsKP38vR4mVk+tYi
         1bW6atTY1Elh2KZ/n5+wzJPk0oxc96RFPAHIIXtiJKQhqrDqluZhUvKTqM9K8EdThKpw
         Bfilw/gU5c5z/aPn4OKjCNZ8LlRxa6XdWM/8MBJhXlJ904jMEGBTtHupkzllhZHSx5Xc
         95u7CnXQSZ9Txv1PEO1ThpQsPpdC1TxCnmInwbQDG5Y0fRym42/WgEvlI8YvKS7FEK9C
         nHWN0N3zXOX+z1skz7OAjyH4WPrHNXkaqlnT/2T44Blj8GKlSFnjnAaTxQKsXQ7SlJ+Y
         TQDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720234; x=1780325034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71wO09jVP9qmCd1Qkiubx2/BEe+jWKIUN5BAIH24AdA=;
        b=b/o1+SZVxx8jCQlCjooQ9+G1SIGr3V4E3+7dNCUDIHfz0BgsN8hSO5dfnKP39CVdNq
         Segiyvt4Y9J2ftQjoxYIz63NnQ/KqAuwr0KxZU8XeI2KQcTehxG0d5a1AB1j9V4oOqEw
         F9wOKzoSE/n9i7A14JD3SXmR2erEMoftfgfgsjEDqcCibXwy1rf+1SeMXOUKmy4vTE2D
         6EZoobGsRQ9RBSPhnKWe/AuCg1Jbm7Fw7pkvnQ1enWE9L9NrKHq6skBUedIl5vwQubE1
         tk0OakPVOS79iSIa+P1ekohDOXKFIu4LasK1GSNbqlOxv9WKjTynNB9LM097Dylpw5DJ
         fuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720234; x=1780325034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=71wO09jVP9qmCd1Qkiubx2/BEe+jWKIUN5BAIH24AdA=;
        b=ET7KPVWK6XrzfSLdvmO5xmQ/fcdDz6a5sGFX7+ZQmABEaGIc8/BCW8TkB62q/zcjok
         sD8dtTO229PNz3p8VmFi4G8/Oh78TGAQkhSbwGFIST9M9MF2v1SWkKtCZezyaX+2ja1A
         oeNQA1TNLomRwWm2YJROoGiaLTRa+AFavf47qkBT+7xwBqwREaJYDjRvTMN9OFAkWxYD
         uK4xgVk5MJLRg+RncxfpkZkOHTijYFUTCOUxVkd29jFI5wUuoyDrDkg3G2WlkfeEXHDA
         VGaTpBN6rfloUWWK5EEakPGH71L5zC9BwzjE3hJLVdsNNiYJBSmddosPY8ulMNrUtT2O
         5Yjw==
X-Gm-Message-State: AOJu0Yzw06DUPJpaC1QlMlIz+Vep/O4vFJPP6rZdvJDx2DbOkt7U0CRK
	DHgxFBm7k1xLb4gGkfOM6246oLig7ZZTp4SkG+tp5OY+ZvvIAZlo6oeYXGs8VXWGM4ie7rJGJBV
	9+26JLy3larLM3pJpoeR7etK4gjvclOo=
X-Gm-Gg: Acq92OGEMpmiWofUzBFEHKP19B1KrZ5pUXN4qIyZfWjVtf0ViICftUhpw/Wac+OSrTs
	n3Mq70q/oWMptzzLDEh8JW50r0TmfWK80lOeNsqCRYC0I/1rCnhuS3rZBXKDCAKnIR+MEcsyZxg
	TA8F+NH3RqdLn+erBkRmZe/xuN5Rsvo+S2AHBMxUqyD3xF5V3rXQMBt23M3nlnUXASj9eRnxF0G
	YfSvyZo3kbUkQ50Ai00/f8TGOsCPQAeb8k6FCNsM55837WAUhBubzr502Ppa8jLVhIQIX3i04VO
	G6un2/9G
X-Received: by 2002:a05:7301:198a:b0:2d8:7302:d3d with SMTP id
 5a478bee46e88-30448f4b600mr7027108eec.8.1779720233893; Mon, 25 May 2026
 07:43:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523083013.46372-1-clamor95@gmail.com> <20260523083013.46372-4-clamor95@gmail.com>
In-Reply-To: <20260523083013.46372-4-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 25 May 2026 17:43:42 +0300
X-Gm-Features: AVHnY4JqJNzX6TKO-WM02HYhrKkr3o1HkibMA_XK5sGKWAX5Jy68yUCNtw6-GnE
Message-ID: <CAPVz0n0jpnPFh0f=CWHufzZ+e24xsem5DFTKdFu6sczCLk08Fg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] usb: chipidea: tegra: Avoid controller/PHY init if
 bus is externally controlled
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
	TAGGED_FROM(0.00)[bounces-38023-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.990];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 72AA35CBD8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D1=81=D0=B1, 23 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:3=
0 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> If the USB controller and PHY are externally controlled, then the
> registration of the controller and the PHY initialization should be
> skipped, since these configurations must be done by the device that
> controls the bus to work correctly.
>
> Since USB PHY in Tegra controls clock gates required by the controller
> itself, Chipidea core PHY management is not suitable for Tegra.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 32 ++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 11 deletions(-)
>

Hello there!

This patch is required because I could not find an acceptable way to
manually remove and add a platform device. I will explain the details
below and hope that someone can give me some suggestions on how to
handle this situation.

The Tegra USB controller is the root node, and it is bound and probed
automatically. This is perfectly fine for ordinary use cases. On the
other hand, the modem used in Tegra 3 devices requires the USB
controller to be registered at the exact moment when the modem is
ready to handle USB. If this window is not respected, the modem will
not expose the USB device, and all you get is a cascade of enumeration
failures.

The solution as I see it right now: The modem has a power sequencing
driver, and the USB controller can either be autoprobed and
unregistered in the pseq probe and then registered/unregistered in the
on/off sequences, or it can have a status =3D "reserved" set in the USB
node and manually register/unregister it during the pseq on/off
sequences. This would eliminate the need for this patch.

The problem I have faced is that I cannot properly and manually
control the USB controller driver to bind -> probe it and remove ->
unbind it from within powerseq.

Help is appreciated. Thanks!

Best regards,
Svyatoslav R.

