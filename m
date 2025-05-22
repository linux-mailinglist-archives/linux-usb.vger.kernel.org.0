Return-Path: <linux-usb+bounces-24213-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0E6AC0612
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 09:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7496A8C18F6
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 07:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D14E224AF8;
	Thu, 22 May 2025 07:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="Fojo3Oc3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F13224249
	for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 07:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747900079; cv=none; b=ciXIIyZPDZb05x1fp40abSvuELcjPTdWpaUMSduQY4ABZWpN0iqWM5JkShKmAZ96fyLaSy+tMzGeeAVwLymLIxI1jS8q6HgtcGrMgVNxdMDmOH9KBiIQikoXGK0Gq8/1IaEyH/Dk6o5fgzLrVr2O4Tr+BXTHZzNZufUixWzLDUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747900079; c=relaxed/simple;
	bh=oawndc3u6OFeNXbkn8onoaiERrlvNEUPYPsJqnlMj3g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=TdU2cak9RG9WdUlyb2TOuInHKTjUnmzW7CO1/ijr93tS29nAJbmdX8euciiitUWQ4XEVJljBoCJKDLVFob5TDRfcFqRHkRQ6JchVZn6RcGqEwEgjmnh5syFPFnnRJJoj59LfKlzLoZHakFF8pLqfok4te90HYFFcdbj43VJwvEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=Fojo3Oc3 reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3db6ddcef4eso67294475ab.2
        for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 00:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747900076; x=1748504876; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSRz3DaXBxnm8FuwtommREWFzr69OZg5+bKQaLg1jag=;
        b=Fojo3Oc3H06coOR7chfBFvcK8GGYRppOZgKiv/ZZ32e5UXpuXTpVyrPl51ke3EaLOR
         YZNThfr6NT2MUlQBaA+ZWtzd9Tj3HDt9LcL+b32QbWTvsUgG6mZnRYogFNpvf4wzeUdh
         +4XJUG6bdEp4rEqNIAW3yJFgGB5lTgZo6KxJQZxSadJpu/z1AuidoVGEUfaHrgaLoifB
         knYLGmxDduePn/EoEA6uUY2+wsLhfboXZtzC082v1tpMv2ZDOW8aEko181dp6snaL4xW
         4w4Y5lr3xvAQeWmH10eYcZc1LS0dhrdkT9EA2yppPE+p+Z/KjZ2D9wF7WKZYUbMzLsVL
         Vv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747900076; x=1748504876;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qSRz3DaXBxnm8FuwtommREWFzr69OZg5+bKQaLg1jag=;
        b=Fg7eSVNv1F1i/1iENGB1FjvCf7+FXLNh3VSb/YJXJyikJ2Sto5KcuZUcJ9I28bq1Bt
         4H/4qLuyllLKJtMsmSgh+Efemed/qdXE/9q23l3GEdDVrgdiA16zpH2FGvDOp840Xmuo
         Q+FewgWo8N9AHs1DRNm8jPK5gxlZKmaFijfxVQUs24Mxynt9gKyWdAzdYawD7bPYlijV
         V2Oq3LNKm5yP7Wcd9Ddyzv0IfI9vH7xT9IA/CNFtU7Mg1JRkNIVaOA0v0jj+ykLCi70O
         cPuGwfvF//rpR/aBrV6uMjei5ks5VKBIKCNOWxSIc7g+mUIOU2ygZgPy09MO/QC2XnGT
         XRjQ==
X-Gm-Message-State: AOJu0YxfUcsg8+qWlQX6hAkf/W1y6L1nLEVMQjIxyMJOtlwo/fnxiZ2a
	dzjCxnPrT67gq/jlc8Hhh9xcedHfqdLI2mcknCl0UX5Tm3CFAIMhZgLY3kTmI5c0Ox0=
X-Gm-Gg: ASbGnct6778IJONquk5bWEk22XG52VWnopgk0AThQpW+Y1sumBpOn6Kq3pbuAgGlnAx
	jV2Js1//00e2wqQu+tLVMbhNTtoVgPF4orOqAANk5SJyhj/K2YLEAm//yOGX+tRx3nUeHt+7ws5
	LULSU7iTGcKOoPZb+GOsKLHmdwEgpGv4YLDnlVAsYYgYC4e4cxG2VsKBBkEKCCpkZ4JWpXWL02g
	wGisgKvXfJPd7oRTdAnr2ZWde8jwNcmqrtmLw3WcdkXT1lofwwZk+ADcBSgUGG6UepV9j42N1LX
	S75EnI56KVLIu3lCXhEW4XiMfzuxqvMDEn0MzDcs87LeNRcDvu+eLt+Aqec=
X-Google-Smtp-Source: AGHT+IEG8W77MeONJnBqaY3Kk6tuHXRXvYrpqiOJH8hduazBrd/kiXsmtoZpvJrUizpMHw69vmC2bQ==
X-Received: by 2002:a05:6e02:3784:b0:3d9:6cb5:3be4 with SMTP id e9e14a558f8ab-3db84322dfamr259928015ab.15.1747900076239;
        Thu, 22 May 2025 00:47:56 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc38a5besm3021494173.13.2025.05.22.00.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 00:47:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 01:47:54 -0600
Message-Id: <DA2IV4ZGT2M8.3QXO3L57VXSA5@brighamcampbell.com>
Subject: Re: [PATCH 1/1] usb: typec: tipd: fix typo in
 TPS_STATUS_HIGH_VOLAGE_WARNING macro
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Jihed Chaibi" <jihed.chaibi.dev@gmail.com>,
 <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, <skhan@linuxfoundation.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521214851.386796-1-jihed.chaibi.dev@gmail.com>
In-Reply-To: <20250521214851.386796-1-jihed.chaibi.dev@gmail.com>

On Wed May 21, 2025 at 3:48 PM MDT, Jihed Chaibi wrote:
> "VOLAGE" should become "VOLTAGE"
>
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

Nice work! I was able to successfully compile this driver with your
changes and I don't see any further references to the misspelled macro.

Patches which fix issues which were introduced in some previous commit
typically indicate the offending commit via the "Fixes" tag. Admittedly,
I don't know if the tag is reserved for technical bugs rather than typos
such as the one you addressed, but such a tag would look like the
following for this patch:

Fixes: e011178579b57c03 ("usb: typec: tipd: fix typo in TPS_STATUS_HIGH_VOL=
AGE_WARNING macro")

> ---
>  drivers/usb/typec/tipd/tps6598x.h | 2 +-
>  drivers/usb/typec/tipd/trace.h    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/typec/tipd/tps6598x.h b/drivers/usb/typec/tipd/t=
ps6598x.h
> index 9b23e9017..cecb8d11d 100644
> --- a/drivers/usb/typec/tipd/tps6598x.h
> +++ b/drivers/usb/typec/tipd/tps6598x.h
> @@ -27,7 +27,7 @@
>  #define TPS_STATUS_OVERCURRENT		BIT(16)
>  #define TPS_STATUS_GOTO_MIN_ACTIVE	BIT(26)
>  #define TPS_STATUS_BIST			BIT(27)
> -#define TPS_STATUS_HIGH_VOLAGE_WARNING	BIT(28)
> +#define TPS_STATUS_HIGH_VOLTAGE_WARNING	BIT(28)
>  #define TPS_STATUS_HIGH_LOW_VOLTAGE_WARNING BIT(29)
> =20
>  #define TPS_STATUS_CONN_STATE_MASK		GENMASK(3, 1)
> diff --git a/drivers/usb/typec/tipd/trace.h b/drivers/usb/typec/tipd/trac=
e.h
> index 0669cca12..bea383f2d 100644
> --- a/drivers/usb/typec/tipd/trace.h
> +++ b/drivers/usb/typec/tipd/trace.h
> @@ -153,7 +153,7 @@
>  		      { TPS_STATUS_OVERCURRENT,		"OVERCURRENT" }, \
>  		      { TPS_STATUS_GOTO_MIN_ACTIVE,	"GOTO_MIN_ACTIVE" }, \
>  		      { TPS_STATUS_BIST,		"BIST" }, \
> -		      { TPS_STATUS_HIGH_VOLAGE_WARNING,	"HIGH_VOLAGE_WARNING" }, \
> +		      { TPS_STATUS_HIGH_VOLTAGE_WARNING,	"HIGH_VOLTAGE_WARNING" }, \
>  		      { TPS_STATUS_HIGH_LOW_VOLTAGE_WARNING, "HIGH_LOW_VOLTAGE_WARNING=
" })

Consider making "HIGH_LOW_VOLTAGE_WARNING" inline with
"HIGH_VOLTAGE_WARNING", or vice versa.

> =20
>  #define show_tps25750_status_flags(flags) \

Reviewed-by: Brigham Campbell <me@brighamcampbell.com>


