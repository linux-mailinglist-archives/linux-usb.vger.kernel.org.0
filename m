Return-Path: <linux-usb+bounces-28536-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D97B95E57
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 14:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94B8A18A2D36
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 12:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADFF324B1E;
	Tue, 23 Sep 2025 12:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPu1TXqR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C755F324B00
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 12:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758632145; cv=none; b=CTYvIMIXrOUK95SFo2U1StmmCReumTfQgge+9kn5TJm14xKi6cjU0YO8uldEFhVTGlXOfojAB79/4g9XGaMwl9ufHOo0zDTzwyqgNi0YJu1dxAuF8ZwziU49eboXed0B5Ag0l83r4vYe4EhYEgteXLmfkTasRQbhunJpyp5qxOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758632145; c=relaxed/simple;
	bh=bPsm5BeBlCI99myQ/NU1P5fqNGX5920h4zo3ax7qRNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iV2vWeGpVd2iCNed5jnuBLip5DMAQ36izq+XM958s0QAOtYR0OV8b2Gi41PpjYff/CiyvaHqBHuX13ZY4E4XYoAXr8XWyNPVPwhpJts56uPI5mKxET7NcVYDglFFrU6boKnbc+brg5vlrg8Gve/xcTcylsq7iDPA19XK7TVSZ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPu1TXqR; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-269640c2d4bso8459155ad.2
        for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 05:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758632143; x=1759236943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPsm5BeBlCI99myQ/NU1P5fqNGX5920h4zo3ax7qRNc=;
        b=EPu1TXqRMV9c3MkOmonYDNOUzm7pwPqZjgIheS/l365/v4CTMDcXk+VMKryE/aPC6f
         1c9Jte/mSTfShot6B9THGCB6V2z/fPSGGciuZ21zoFdcG7+aEpF73sAFRBlolzGV0HgH
         O7pqPrSvTdbZfUU1FzOdsy1Vc6ng+1B/bELxO97Ecn3P0A4+mywoUi35c0YN5aYQ/eZt
         /+k6lPXuFDOdbg7pwc+1hqKO6QbTZiK3Ik7WH4968x/fRvMD1VEdJddtQfjlgKyBeGKZ
         FC3wGPHR3OIyAp6iPcwwTyLs2qyVacXGlYHBcx/xXsgX9Fy4qEmbb5Ek+tOM/GkMk5rQ
         orOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758632143; x=1759236943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPsm5BeBlCI99myQ/NU1P5fqNGX5920h4zo3ax7qRNc=;
        b=F0DetgqI14i2K5jCHnckSZ4fq7YaHsn/RfmPq+hBx6CLAzUCGJjsEHhtox1WoWMCUD
         hbQKPF6X8V+nPiMuJOAZWL/nO51+5V/yOFZOgNiBZ/+On0fEHZKXHwa76Su7N1zSF1tQ
         oyGaHMUpVc3TTX6mZHnp5zPYnBrYG5JRF59sPM4zBmfGyQoSLCVd0ASUD/oMhdo3YgHX
         F9zbjWBY3oBV54ElDNvcj7JAbXnS6XLM0knjRDM2KisvWTSCjitr5bIgSOrOYpeYt+1L
         DbOFRPaabG1Pnh7WAASIMaVcgcoMnYXyNbmbEP4vLTYLQzlLfNkwB03cbTjasSPkJC9U
         CVow==
X-Forwarded-Encrypted: i=1; AJvYcCUy4jJD9s+tEqlAJzoWHinKII2/MibFtnibpgJZ5Vs/iH39HjZtP2VR6rAg7AUU1Ou3Y1Im5b4OUA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUSvm4d3sV6Tf49miv8nZNgXNvx23Z6JFfTS2qlmDdJkA9j3R/
	qZNVtWx0+U+NUuFvX8xdE+R9SkmDbWjokZTMFTopIepDiRprPsFTz5my3n+aPICVWU3arISF6A1
	1LA8U327IU4Gc1VKLPeC19VE3Ld6nvV8=
X-Gm-Gg: ASbGncsFBHi+QKqSYquKr4yQWQDVcZe2ARifzwJVTJjsIMm/+Bv+DplcbObuY8INPDG
	guJpqi+k6Mkm0F4DIHjqCQzaneG/vlD3+v8H6A5e4WwDRnH2+9EPbjaebnHnu2dL9EYO1+eHOKR
	T0y1GCqYHZUuK84O+uRoisTAVt667C7y9ygljg21/eTVgqz1OTYUC6PCWtF7t8fgnmE90OcXuuN
	3f+x7qieOf4x9q3dbzvT7/L4FpdAK8Dl/RYP8B4AUx8FLqdTbO5EL/3g87OxiGVTxZ8ji5FbGSW
	NNmZASmMIBBPRXtcVB1CCY70/Q==
X-Google-Smtp-Source: AGHT+IEVYX6ve7luR5GnSM4eICjSDTUTZRS+D8hMwmZQRsSzuaYCoXRh0iyJrxTjeZJZllU7L9GVHzx0ugS/+Ydl4II=
X-Received: by 2002:a17:903:110e:b0:269:80e2:c5a8 with SMTP id
 d9443c01a7336-27cc94ca027mr19378695ad.7.1758632142902; Tue, 23 Sep 2025
 05:55:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825-b4-usb-v1-0-7aa024de7ae8@collabora.com>
 <2025092338-elbow-dash-373d@gregkh> <CAH5fLghm-syjWRrj=G2==W4PorPq47bkAPfkeJ1UAsGbbRhPfQ@mail.gmail.com>
 <B4D07104-0A10-4B04-88CC-3F138A783811@collabora.com>
In-Reply-To: <B4D07104-0A10-4B04-88CC-3F138A783811@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Sep 2025 14:55:30 +0200
X-Gm-Features: AS18NWBm0VpH3EPBG5YoC1bxFDVvYN6YlJxnFunV3o7Ts-fF_Inb73M49AabG_c
Message-ID: <CANiq72meH4zKk0P3y51+EQ2gZ2miBCmWSPYEJqVt2bBSrZ8t7A@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: usb: add initial USB abstractions
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 2:34=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hmm, but the USB module is gated by #[cfg(CONFIG_USB) in lib.rs, so not h=
aving
> CONFIG_USB enabled should not return any errors and instead skip the USB
> bindings completely.
>
> I wonder if this has to be CONFIG_USB=3Dy?

Yes, the `kernel` crate is built-in and it is trying to call something
from a module.

Cheers,
Miguel

