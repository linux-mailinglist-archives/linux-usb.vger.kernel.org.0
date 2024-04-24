Return-Path: <linux-usb+bounces-9691-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A38EE8AFE2F
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 04:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58DE81F238FF
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 02:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC152134A5;
	Wed, 24 Apr 2024 02:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ei2NYRy2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DAFD29E
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 02:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713924389; cv=none; b=gcd4pCxgO/4xSYIlfN6BjVqyJ6n0LzIH3aML0oKiufhkAhMux9FyK+kuw0l2aXXB5rykPa7vFlhoAbiAbv2O4cQe29qNR1IMl4/Hm8r6j+zp+p4oxEtwJSMWfFkEj3gPF6qxdL3q4PxU4YAIjOBnU/1IkqyM+9VxcsIgGS+GueY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713924389; c=relaxed/simple;
	bh=ggqkpIJRRlUV6tAg88gjXJlRfrPJhi1RKOyLAZkKTE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aJroaqNB8UoTJuYkvmg7NWVdyJgIaY+SoobXr2IjtoaIAOmZU/GOPnliUUVE+JdSc65m5hPc2G3CBCH7HmYZF/uPDEKFiajpBFJ5pl0s/QNZd2Ops4Xh0Z9Q+seUc9nUcHW7B3Zct6JYbnrxFQtG5c2POQNWyb+Fg6tdLz0w4hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ei2NYRy2; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-de46b113a5dso5979640276.3
        for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 19:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713924386; x=1714529186; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7VmXPwLmorMky3vFkXFEX7LkOC9EFvM8+1foS9yBPWI=;
        b=ei2NYRy2JYoPm+h8mKmll4edS1BhePitiK2WMIz+hLdlWgSNX0GFkT6yyzDyIIfEpo
         bII2+MKjfYekjcBNl0bmUG6GuYOJiOVLGU7EJoqoTEMNLNiZ4XNndsuc3+Ls6kO2+S2g
         Mflg4IMM1AZUXALKo3DZmTQsgz5UcOddKaY6gyZO3JyLAA10WIEN4dDOu9QZdUd914Tp
         f3LKUafcg7VS0eQC2FJ2lQsjlJdVXUlhP4TocL0jOLmwzOVXo0WYKv+uIidAeu1gbVLE
         AJFYIzL4NV1cjVyA6A4dZH21lI2Hej+mspYCMsOaBHaZBLrhyatwLZrtXTibB4yQuX0c
         vFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713924386; x=1714529186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VmXPwLmorMky3vFkXFEX7LkOC9EFvM8+1foS9yBPWI=;
        b=xIIrgdvCVwrWdxc4OAppHFQ1QrHk+LkIoCOm70xRVBfrl/WPMdjdWkAIgy4jla/ksD
         o1NkJa81Rcg+mjK9Dc4OpO3FlXC//pDqGQEReUQS7jiovYpSYFt2dQT7uZpQh1/aUBo0
         T2nQoPeSUUUNoEUU+dCsNc7ysXR/JaqaUVvYeDiIgH3pQV2/UHm5oGnwd5pSWd9Q+XFx
         BHwE4tLWpdOUzyapqMzf4HGwEUVUK5TCB/NWnbob0FPhjUF07i9UcJOfHvhCXzr62zKx
         UGJ1ANP5JvfH9ml6DMGqASbM7YmhVkFI6UPDDLmXB+suMbu6dlSbKj9gunxpHAVoHqHu
         oAvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKpY5kCGcckJZ8tx8WmhwtlHC9jJ4xR6T4u/B3G7p2+s9fnCvYwnhRReAlfe7k5TzKaq5B+I3bK/i1a9eBh8GqsiPxhANw51Xm
X-Gm-Message-State: AOJu0YzOsRr3vYf0bTLpBB5jpd7iw57Z2TmMpqTzco14u1GiUAgVVlmR
	hM5qqddDpOAUEnQTmvVXv3HQRmAEsXTc42oLdQYkB1mWltBrLnodoFJq3h93x0C38uUzD0xwuho
	uUgHH04qV2ii2W/y23QSEyhnfW0EXkTg8AYfMgg==
X-Google-Smtp-Source: AGHT+IEhyHQTOiRrOU18xVsOck1+aEKCBM/7FJTW0SWFltJ3m3W6GG8zqUGem9WcfD/aL4IVh4bbEmCIrWfgpSt8XeM=
X-Received: by 2002:a25:820a:0:b0:de5:5693:4e90 with SMTP id
 q10-20020a25820a000000b00de556934e90mr1495408ybk.40.1713924385958; Tue, 23
 Apr 2024 19:06:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424014821.4154159-1-jthies@google.com> <20240424014821.4154159-2-jthies@google.com>
In-Reply-To: <20240424014821.4154159-2-jthies@google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 05:06:14 +0300
Message-ID: <CAA8EJpq_DujhwoJ87Cg4gZ4LNdPu4i93EQ0VeKrCJPkeDj9ThQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] usb: typec: ucsi: Fix null deref in trace
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	pmalani@chromium.org, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Apr 2024 at 04:48, Jameson Thies <jthies@google.com> wrote:
>
> From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
>
> ucsi_register_altmode checks IS_ERR on returned pointer and treats
> NULL as valid. This results in a null deref when
> trace_ucsi_register_altmode is called. Return an error from
> ucsi_register_displayport when it is not supported and register the
> altmode with typec_port_register_altmode.
>
> Reviewed-by: Jameson Thies <jthies@google.com>
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> ---
> Changes in V2:
> - Checks for error response from ucsi_register_displayport when
> registering DisplayPort alternate mode.
>
>  drivers/usb/typec/ucsi/ucsi.c | 3 +++
>  drivers/usb/typec/ucsi/ucsi.h | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index cb52e7b0a2c5c..f3b413f94fd28 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -361,6 +361,9 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
>                 switch (desc->svid) {
>                 case USB_TYPEC_DP_SID:
>                         alt = ucsi_register_displayport(con, override, i, desc);
> +                       if (IS_ERR(alt) && PTR_ERR(alt) == -EOPNOTSUPP)

This makes it ignore EOPNOTSUPP if it is returned by the non-stub
implementation. I think the current state is actually better than the
implementation found in this patch. I'd suggest adding a comment to
ucsi_register_displayport() stub instead.

> +                               alt = typec_port_register_altmode(con->port, desc);
> +
>                         break;
>                 case USB_TYPEC_NVIDIA_VLINK_SID:
>                         if (desc->vdo == USB_TYPEC_NVIDIA_VLINK_DBG_VDO)
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index c4d103db9d0f8..c663dce0659ee 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -496,7 +496,7 @@ ucsi_register_displayport(struct ucsi_connector *con,
>                           bool override, int offset,
>                           struct typec_altmode_desc *desc)
>  {
> -       return NULL;
> +       return ERR_PTR(-EOPNOTSUPP);
>  }
>
>  static inline void
> --
> 2.44.0.769.g3c40516874-goog
>


-- 
With best wishes
Dmitry

