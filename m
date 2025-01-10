Return-Path: <linux-usb+bounces-19191-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E83B0A09237
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 14:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F31E11669D0
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 13:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C97920E022;
	Fri, 10 Jan 2025 13:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U8iYV19E"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB543B1A4
	for <linux-usb@vger.kernel.org>; Fri, 10 Jan 2025 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516330; cv=none; b=hPgaNzuZns5ugqijq4VCuTPDV5w9LMfC9zLEAueTGj7sc1EPUmbdf69E/fxvzu77w5foGBsWLFQROTkGv2xf9PlGQsHtmjrXYYgefuwYfahG5xg5qW+kk+CBH9Hzvt2NDTYRyc5Bzl3fjUb3btpVhZLXz2K52MGMaJ/oiFiZ0xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516330; c=relaxed/simple;
	bh=kN+WuQ1KirTcQd2+CHFeW1/BZLYiEtMO99Yf7IHOlOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+By4q5EadmjsXpDoPlyAcKX2mJ5KDg3HDZEnJSvRXx8M09FtAHRfpLNTxx3+thi/3cD8fSp6gDMiVqQSUCnR2x1RGrhAe3dNUYWyk2Bqg+2pnd5QpuddvPH1OV1C2XEstePmhpg2upomuDAgxinNpjqjLWkACUKK5WQVGQE4oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U8iYV19E; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-306007227d3so14474151fa.0
        for <linux-usb@vger.kernel.org>; Fri, 10 Jan 2025 05:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736516326; x=1737121126; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5cXYftIzA3LR59j0OW9GtyfPyeBfGN77X8ReQ1YGEo=;
        b=U8iYV19EwxlaSialsBmTPaC3PzSSZGVl7bAZyZrmw7sgMiUqXDjJKxSObJ3DCguaP5
         SPYNYpttHm8Ulwri7uC7zjiNSr8rdN8keqj6fcJ/mC83ZlY3z59aQHeUKcqFPGC/qW9+
         mEO0LiQeSElRgUDB5itYqd5SpcJFc8geyZ45Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736516326; x=1737121126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5cXYftIzA3LR59j0OW9GtyfPyeBfGN77X8ReQ1YGEo=;
        b=AIu55NdUNBb5EAXsSuQiTDLKEo5eIvWaqPx3W3oDvteb/wiX664gxGpfwidAm9v6aS
         MtdapJ1kHCWedKQwQm28bDh+vhd55GWKGga14/FPnSa/agDqtwVWLFH5yzQM1nnt05Me
         oWEn6kbMlnvIq5Bm0tR+7fu827a5oGytP8uqMidPMwBrcMMGC3UJVhnDA9ToNqYiSX9w
         k0gSoRDcuXDG/fDN7cVxfcek/bFVPNdIKZx+GWX5Sq31UOsx34IoNh+AGaP6pl0Dqv8k
         ZpPWHnY276LI3Kv7JN7aAvt1YLXRUZvmfyWNP9XD+Cd4+rkPeCZj0s5A620TdADTqFb4
         S9Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVgTz2W4yM8+kiKs6TiaZMxjrwZX1gl+3lvDRpGVwPwQRHNtPZ0YBV7Xvgh5aJ00DMl/qNjxKaPmTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ3K3EoZIhlpNWB3HRicUWWrzFdJa2Kc82bmpRBElp+TemeGr9
	d9UURc3GomU2tqMcDIZ+qcvu/PJOfyBe0bz/xe6+dtbSERvfuPD9EF1k5DkkkAkuCIv15iXMpGD
	lrjdWtL50l3cQu992ZZzVIyvvBk3rGy7sARo=
X-Gm-Gg: ASbGnctgQsBe0YTg4HL7RQacd5Y+tT0hynsqe4KpZ8QCG342eVJT+K37DaB/8Kn9yCP
	p7+Rg1ujBT6OVt7Dgz1xrhvgBJAoyO6KXU8iMg3fqAGPlcWR2O4wFTCrq3vxYPkJvwQ==
X-Google-Smtp-Source: AGHT+IFF38QmzS4pEVqCimgSIZIkXRq8eu/nT2W6LM2igiQVDj3QPJ5vo24IGYrg5bdav5BTck58zcB/CBoEqnqUAFk=
X-Received: by 2002:a05:651c:4cb:b0:2fb:8c9a:fe3f with SMTP id
 38308e7fff4ca-305f459ab0amr35286421fa.22.1736516326542; Fri, 10 Jan 2025
 05:38:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109220655.1677506-1-swboyd@chromium.org>
In-Reply-To: <20250109220655.1677506-1-swboyd@chromium.org>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Fri, 10 Jan 2025 14:38:35 +0100
X-Gm-Features: AbW1kvbiLLF3eaxCs4xeh2uP83vaTT3dtcz4ROlR3rUjheFEVYbLypYFKgr5nMk
Message-ID: <CALwA+NbCOEupuhqPqxQRjM7MChyzaDTMUcXSg-xcGiAZbGeecg@mail.gmail.com>
Subject: Re: [PATCH 0/2] usb: typec: cros-ec-ucsi: A couple small cleanups
To: Stephen Boyd <swboyd@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Benson Leung <bleung@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	Pavan Holla <pholla@chromium.org>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 11:06=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> A couple small cleanups to the cros-ec-ucsi driver that was recently
> introduced. Patches on top of next-20250109.
>
> Stephen Boyd (2):
>   usb: typec: cros-ec-ucsi: Add newlines to printk messages
>   usb: typec: cros-ec-ucsi: Mark cros_ucsi_ops static/const
>
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 30 ++++++++++++---------------
>  1 file changed, 13 insertions(+), 17 deletions(-)
>

Thank you Stephen for the updates.

Regards,
=C5=81ukasz

>
> base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
> --
> https://chromeos.dev
>

