Return-Path: <linux-usb+bounces-5659-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B5B842C2F
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 19:56:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CEC21C21FFD
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 18:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4584E7993F;
	Tue, 30 Jan 2024 18:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GOuziRe0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E73D7993D
	for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 18:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706641003; cv=none; b=R49H0GSjuW3LW3/vUptuYqocWw6X/duO8WD2/si3Z4iv5NDftawAsh0goxM0KZUn5rBt4ivzUnHZUlHtaU4SD/KqX9snLbpWj3SNDNs+NvmFM6H/dApcLyZaDkMszjUqUEXKnR5u33Hjz9qgD+ki2V9mF8HhqfPIBIHH0bl+vuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706641003; c=relaxed/simple;
	bh=5Dws1mz1XNbLrM8JL55q/tA/5yEt1fNiujcPapBJ3sY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJs64kKeDC2u9FkHUvTfOYzyujeE3tCtTFS/tOMQos4PD/OBOqmI4688tWrONJZZiXyAjGuUKYIVJVcyvRBS2/ZVvFJu7p36QK7YbsoikTtgHWu1qN16wr2Jk3A3BBYtoxysLHXiTdicG3BZmUUD95hlT+vFH2hWMBeucq+XUtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GOuziRe0; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-55eda7c5bffso1146a12.1
        for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 10:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706641000; x=1707245800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtWxv5dxUX2xZrkhPchT110iH8pzn+CImZrkrmnden4=;
        b=GOuziRe01xDmWQ2n+3fK6yFdb6wnKLTdrpOm+4mJ32xuy2GuMmAvPcDsCMiw0i/CRT
         ScyaHKWj0LWTrVitapPK3euU0cyk4W6BFkSoW9dPa4yJ1Wdcklo4Fi5MSL4IG+Qx7dnM
         4vWtsCs4k/7YuGeyNDywAf1bMsr4lLjbRwiyT7GMXX+AkLNP+10j2bXGMz1ixdvjB5sd
         2s5Qq1TYUIrmOZOtDPEqbaUDOJe8NxqUSdc0a06081kMRkgpQl5l87WpQNwcu077AHQt
         AK7j58Z/eacuweHEPEXko1QWzVcSTNPvo7j/xeeL5QMrQlLdVD7hk7uXOW4FZeXLEYb9
         bV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706641000; x=1707245800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WtWxv5dxUX2xZrkhPchT110iH8pzn+CImZrkrmnden4=;
        b=dvFdrpzooE+IzwdoUKmloirknugrEMZ5T6FfdTdimsCUAUMAR4QzDahWnTlyxwBA0V
         UsPS8foVgKS7ZchNNkK/MafL2oOuF+16VS8mM8m2O2B9+iytQq9wu2umglSw3MuezMFr
         VHlzN7ISZHwTnMihzd7Vx1DM7ls4/a+2XERtVodc5DVAptDC6beOCL5S06xFzhtkfhWj
         QSTeV4xQMugDuEEMPcKOQ5In9vf6RHUayw4L/uqX+7yht+At/oacF5EjKErkrLiUfh2q
         E3UEeumecSWygCu20LQOtTU9H2YBiAzzlEYjPQ5GzZbNLuTJgl/Y/gqVmFQzRTgYEtul
         wdpA==
X-Gm-Message-State: AOJu0Yx5MLh+O5LNmUkluR189ZFUTZ/3su8GwTg2Bce/qdccGUTXyv2V
	ZlELnJ7zNpuoITnbAxDNlLnH8EW0YXiWu+k6YBq9KTdeSm4INa2yVPe63qN6MvBlGXrgMPpbsdT
	WI6iO8/J1/8B9/zgy3EIeUTZJJcqtNAR5l9dQ
X-Google-Smtp-Source: AGHT+IHzcTWMuf26PAdqRPEoByLWAK7S8tfJjASi55f5TVszDCd7YJ+jT8PxvX3g//2ZzC2hDAxGJqwUKhHjAUJii18=
X-Received: by 2002:a05:6402:22a2:b0:55c:ebca:e69e with SMTP id
 cx2-20020a05640222a200b0055cebcae69emr194485edb.5.1706641000113; Tue, 30 Jan
 2024 10:56:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a432603b-b801-4001-b309-247dded707d3@moroto.mountain>
In-Reply-To: <a432603b-b801-4001-b309-247dded707d3@moroto.mountain>
From: RD Babiera <rdbabiera@google.com>
Date: Tue, 30 Jan 2024 10:56:28 -0800
Message-ID: <CALzBnUHA985sgWfw1tAiNxWH=6Dw-Evnk8kAY-XFS1eDJJfmLQ@mail.gmail.com>
Subject: Re: [bug report] usb: typec: tcpm: add discover identity support for SOP'
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Tue, Jan 30, 2024 at 3:16=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
> svdm_version is uninitialized if port->cable isn't a valid pointer.
>
>     1898                 break;
>     1899         case TCPC_TX_SOP:
>     1900                 modep =3D &port->mode_data;
>     1901                 pdev =3D typec_match_altmode(port->partner_altmo=
de,
>     1902                                            ALTMODE_DISCOVERY_MAX=
,
>     1903                                            PD_VDO_VID(p[0]),
>     1904                                            PD_VDO_OPOS(p[0]));
>     1905                 svdm_version =3D typec_get_negotiated_svdm_versi=
on(typec);
>     1906                 if (svdm_version < 0)
>     1907                         return 0;
>     1908                 break;
>     1909         default:
>     1910                 modep =3D &port->mode_data;
>     1911                 pdev =3D typec_match_altmode(port->partner_altmo=
de,
>     1912                                            ALTMODE_DISCOVERY_MAX=
,
>     1913                                            PD_VDO_VID(p[0]),
>     1914                                            PD_VDO_OPOS(p[0]));
>     1915                 svdm_version =3D typec_get_negotiated_svdm_versi=
on(typec);
>     1916                 if (svdm_version < 0)
>     1917                         return 0;
>     1918                 break;
>     1919         }
>     1920
>     1921         switch (cmd_type) {
>     1922         case CMDT_INIT:
>     1923                 switch (cmd) {
>     1924                 case CMD_DISCOVER_IDENT:
>     1925                         if (PD_VDO_VID(p[0]) !=3D USB_SID_PD)
>     1926                                 break;
>     1927
>     1928                         if (IS_ERR_OR_NULL(port->partner))
>     1929                                 break;
>     1930
> --> 1931                         if (PD_VDO_SVDM_VER(p[0]) < svdm_version=
) {
>                                                              ^^^^^^^^^^^^

In regards to the Type-C specification, a cable plug cannot initialize
SVDMs themselves
and will only respond to SVDMs initiated by a port, so this block
should never run when
receiving an SOP' message.

However, I could see how this block could run if the port partner on
the other end thinks
it is allowed to communicate over SOP' when it isn't and initializes
an SVDM, leading to
the tcpm_port into running this sequence. So, I'll add a check to make sure=
 SOP'
messages never process the CMDT_INIT case. Thanks for the heads up!

---
best,
rd

