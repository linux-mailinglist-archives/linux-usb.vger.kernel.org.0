Return-Path: <linux-usb+bounces-23541-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EADA9FDD5
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 01:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E977465E6B
	for <lists+linux-usb@lfdr.de>; Mon, 28 Apr 2025 23:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BD5214814;
	Mon, 28 Apr 2025 23:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dKl+m04V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9BA20C488
	for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 23:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745883413; cv=none; b=SLs6F2JQePkfVFiDh92v98qOMnibw259b5c9UcJpZo4Xi6MuthNLpJ5uAdqNQi1zQGlUiMMydaYx8BYYN2bMODqME3ZcuMILwI0k0+xZmeEX/XX5EvjpglTKi92KDjwbWefEA7fp/FQq7EQrPzgBrvcZbJrhcJOteD3JcDU4UAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745883413; c=relaxed/simple;
	bh=k37WAKWj9MK4No/K2twFZKQRmU/o0AQNp+dOIiPpcTA=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=am7x5osET8y5wxboVS9XUmDbGjMKhEt93i7xAlNuzcfVhEV/OwaWZaeyd/MsIxL3fs//4AJHFGz4nEDHkyDJwWJfMfKB8HkAe1+q+F98EgKslZGgI3paU9l4387WNoSxtOpessoP0049T0o0gPHJey7CMMYptQsDMIRnPo+46D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dKl+m04V; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e8f43c1fa0so74966946d6.3
        for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 16:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745883409; x=1746488209; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k37WAKWj9MK4No/K2twFZKQRmU/o0AQNp+dOIiPpcTA=;
        b=dKl+m04VIAsCnw77xxjQtHyVHuzckogaN9ELnisRtSE3j8OOpRmOVTL7iv7Eu5Ndrl
         lDEODEZ9R4msdpPltIBiBkKY7EmqtSMAJ3gOiQ4+duaF3gb4mXjmPA2oadoENXqnYeGF
         rEU4sDe7NsOATFvSyO/ugWgApdtgXTExOtRjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745883409; x=1746488209;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k37WAKWj9MK4No/K2twFZKQRmU/o0AQNp+dOIiPpcTA=;
        b=UaMeoBcPNEwFvqYrI+UVML611i4r3Hss333SEBB1zXOxitYz4b/ofMht2CFV7JOniT
         uEL5ss0MkZXphWeT9sLc+dB7InoKD+4GJlnb8nPWtxNOYc32k5m31VIqRgstMT1HCPfQ
         Gel/EzKa5oeteckrgjRkJgeyCKIEVZNyMNTCmZ86xt6LbE37xc3uDa8+EWzEH42MSuff
         ElCr9uRfFRexcQFgNglqcz0nqbAMBHvqpTl3e7fr9R9YuuZAYCsuNe1wBDaCisU1EJvN
         jh5E9+1KN20rZ51edPqvayOWmaR3+N1WKYETQGQNpRtGkhVQtUHSMQZc76t6vw2xewuL
         CDmw==
X-Forwarded-Encrypted: i=1; AJvYcCXDl0/nouzTKQKU2wDm1oVmSu38qAnHzUBfRgC7gJmp9X8NKCxCCxxFZdURwJYjQKQaja8d9acrn3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkhHNLc14BovZA8JKMUU/tuBKYjdGrQDjvHrhqCJx7ix4Ngqk3
	usiIlGeI0VVTYQypEAAkS3M9E/6x6CGzywf6yYJKoQycxvHAdSyJwwYwCOwErisvORT8iuP7fd9
	vgA+RA0jDcywpgAyBh7FnGFTVD59S2AvQnOQN
X-Gm-Gg: ASbGncu51xfML8qlSt9JxBk5DGtZFNhSsUoCKZFEazLIIftg/X/VivLIGRU1C+e4Ks4
	FwT/4pVNXub0cHjlAG1Xc/9TWl8kJei6qFKf7GOSDuy5vqbKTia3FNddf9y7BF+s+yoB0kt9E85
	1ZKIzPRLMtKuTDadIzz5JVvvtRHE3DprOu/QiNLIbCy63Ooedcow==
X-Google-Smtp-Source: AGHT+IFAV6Dt5wFCfoA6cMOB3MpMn43GlHt9c/t/48VDjhtKHnzic+oww3lMsF+lLiVKsN5rQEhaV4NlaHAZGDqPKnY=
X-Received: by 2002:a05:6214:2a82:b0:6e8:f17e:e00d with SMTP id
 6a1803df08f44-6f4d1eff0femr191352106d6.14.1745883409038; Mon, 28 Apr 2025
 16:36:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Apr 2025 16:36:48 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Apr 2025 16:36:48 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250422082957.2058229-5-treapking@chromium.org>
References: <20250422082957.2058229-1-treapking@chromium.org> <20250422082957.2058229-5-treapking@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev8+g17a99a841c4b
Date: Mon, 28 Apr 2025 16:36:48 -0700
X-Gm-Features: ATxdqUGecLQva0BYL1F9HfFnhP02mLVZfmOPIfqCxVFuGQnipmIIGxt7Bd3hSGQ
Message-ID: <CAE-0n51y0ZaxOe-pVdXqyoiBS2hA7JnrWLf_116dRkoMsiJvMg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] usb: misc: onboard_usb_dev: Add Parade PS5511 hub support
To: Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
	Pin-yen Lin <treapking@chromium.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Pin-yen Lin (2025-04-22 01:28:30)
> Parade PS5511 is 4+1 port USB 3.2 gen 1 hub with a reset pin and two power
> supplies (3V3 and 1V1).
>
> Add the support for this hub for the reset pin control and power supply.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

