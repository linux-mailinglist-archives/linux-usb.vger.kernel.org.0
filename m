Return-Path: <linux-usb+bounces-12438-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DF893CDE6
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 08:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1B1E2815A8
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 06:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F57172BBC;
	Fri, 26 Jul 2024 06:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JWbTejoA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5383B192
	for <linux-usb@vger.kernel.org>; Fri, 26 Jul 2024 06:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721973678; cv=none; b=q7Sm4gfbCuDIKUz+gp9oWkBE/ft8Wq73eZu2tQ8mdyV2VecR5b07DpVIYCZ5FjewZ7/CziTSgwWm0GMvYnp9mOEgK3zyBxuU++AnVmX61Ppo8eASV4UPp0Co4KZurLZWMps4XC9+8Z/v00Fj1LiOC+8128aTZuuXWn90cXzOlBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721973678; c=relaxed/simple;
	bh=RrAz8M19RlXBZyywNcLjF7uUh2zwnvcHtuqWlY2LLTY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X1XuZx5kLhrs8uij0wwxK0cddfOWDrF/7hqyRYITZBG8ctdUJ1330a+48W4tAzNmu3xNDqg/saTLY0426WdvGYqb8fwWRrVlWNGpFaK81XURD614AITy3XkWXUzXjt2g9DIwwU9DY5arI7zsu8nryoNrVWsXFR9IHGtYi1wfpVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JWbTejoA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so9188435e9.1
        for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2024 23:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721973675; x=1722578475; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RrAz8M19RlXBZyywNcLjF7uUh2zwnvcHtuqWlY2LLTY=;
        b=JWbTejoAWyNOU6J3f0ceeQ/zVoMQNScw74mFTrmzK+uKv6zJqairNcfriA02iUegOT
         AmoTdSDbgJeQPNinFsNZHS2vfhl/EqYBnL7BPlVosxOe3j6HE83PmgRqqcS0MRebjuGM
         mAipF0+A1xtyB6dwq9DHvLtk6Wp0FAhEOs8HKnj+b7x5O50dA7Dxpc0MckHmheEzllOW
         beVfKzpBDPCDURXBkZwWOXhjKH6fjmJduc59z8y2YbEqUJJq2W7aEEicjhOcOg25Qdn7
         IbppqGwD3A2gj0iP+Lm1QcgnrewhKP1o9rmMeEuOOYQAJmmtfd7kmfI8DcCuHqW02Z5j
         UrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721973675; x=1722578475;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RrAz8M19RlXBZyywNcLjF7uUh2zwnvcHtuqWlY2LLTY=;
        b=QKlNS3NXTYh7/q1d3BZGHpJ7PkSNCSynZ4B0nBrOIMIXA7QCJ3aY7xCEdNabg6fdc9
         06h+AvVBfgl1en2Lm14ilF9dqmmLl4ewEZM7VByDz0cFPts4nJZ8uz+PPo++y31gNN6B
         rcDxJti+nFAW3kRpyyIBB05e3wt5FMNUMv9NYw+1rgH+6W7G9sksMd2yGD229rJoHYRh
         dJXhZA5+DGLyvUbGXYwgb81zfqTUZkk7VfJaqab1zcS8LVuzulFG3b2kCjjvkZ4Td3lR
         fuqtrGnd1avmD3JcxARD1waUb0FAgopRACaqWQwBSoTFDGz4yIC0vJv2I9VSoDxhVK5Y
         yiLg==
X-Forwarded-Encrypted: i=1; AJvYcCW6exXHd5Qf9/tk6vk+c/n3ct7vhB9eNufbakfvDcJV/LozH5F+HKbIJ1LhmXLf43K4C0L5PGlLlCw0wEZesUzMO7FI30GMmzMb
X-Gm-Message-State: AOJu0Yzpn6UdV7F+oL6PBY01mb7yR83L9NCvsNaO6ai2ohal6zt3byuQ
	veq40VIc0efGLGz7prP6fYLIvePC4dylxQjIAAUkctZmh4f33wZPsZ56yUwdJxY=
X-Google-Smtp-Source: AGHT+IFYHxnbpasEh3IPrhx4/linkLt3MYWCDJhJhHxCgfmPNYvORGRvu0vhoxlG6aKHeQXM2+1QzQ==
X-Received: by 2002:a05:600c:1c21:b0:426:5b17:8458 with SMTP id 5b1f17b1804b1-42803b4612amr32590065e9.12.1721973674242;
        Thu, 25 Jul 2024 23:01:14 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c0668sm4037938f8f.10.2024.07.25.23.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 23:01:13 -0700 (PDT)
Message-ID: <1e650f29c2714b5f390a2bf5edf5920c2975fbac.camel@linaro.org>
Subject: Re: [PATCH] usb: typec: tcpm/tcpci_maxim: fix non-contaminant CC
 handling
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
 kernel-team@android.com, RD Babiera <rdbabiera@google.com>, Badhri Jagan
 Sridharan <badhri@google.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 26 Jul 2024 07:01:13 +0100
In-Reply-To: <20240710-max33359-toggling-v1-1-f6dc123f3a0a@linaro.org>
References: <20240710-max33359-toggling-v1-1-f6dc123f3a0a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Wed, 2024-07-10 at 07:28 +0100, Andr=C3=A9 Draszik wrote:
> tcpci_maxim currently never triggers the TCPM state machine when CC
> status has not changed due to a contaminant but due to a real
> connection event, i.e. a genuine plug event, meaning the system will
> stay idle and not notify any subscribers.
>=20
> The reason is that the initial state of the port is 'toggling', which
> causes _max_tcpci_irq() to only drive the contamination part of the
> TCPM state machine (via tcpm_port_clean()).
>=20
> What should happen instead is that if no contamination was detected,
> the TCPM should be notified of the CC change in this case.
>=20
> To fix this, we update ...is_contaminant() to also allow its caller to
> determine if more CC processing is required and then call into the TCPM
> as required.
>=20
> While at it, add a kernel-doc for max_contaminant_is_contaminant().
>=20
> Note: the code has an issue where I2C errors during contaminant
> detection also cause the TCPM state machine to not be updated. This
> commit doesn't change this behaviour and should be addressed by
> follow-up commit(s).
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> =C2=A0drivers/usb/typec/tcpm/maxim_contaminant.c |=C2=A0 7 +++++--
> =C2=A0drivers/usb/typec/tcpm/tcpci_maxim.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 15 ++++++++++++++-
> =C2=A0drivers/usb/typec/tcpm/tcpci_maxim_core.c=C2=A0 | 12 ++++++++----
> =C2=A03 files changed, 27 insertions(+), 7 deletions(-)

Any comments on this patch?

Cheers,
Andre'


