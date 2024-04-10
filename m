Return-Path: <linux-usb+bounces-9211-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2B689EBDF
	for <lists+linux-usb@lfdr.de>; Wed, 10 Apr 2024 09:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6852281E23
	for <lists+linux-usb@lfdr.de>; Wed, 10 Apr 2024 07:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F21613CF9B;
	Wed, 10 Apr 2024 07:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M5pXvUxr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2265FDDC1
	for <linux-usb@vger.kernel.org>; Wed, 10 Apr 2024 07:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712734027; cv=none; b=BPiLt2wW/Z08K4KsaWRXUjKQyUbuDpJlTy8NGxSQ8Q6XuOPNwszqel2bk2tMiv1su1v15xdbJfxaER13D3bPt1IXZSpu1b8XrhObw1jgvt1oUVnMbpUGRLHuOwFv2lE+xMmSBGK9T1uWrGEMMwqqR8OBm8yEN/mX5D6pp+N14NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712734027; c=relaxed/simple;
	bh=kbTUGekNcumuE0JP93SeZKNvpUyU0+2KkheoNGzqnw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2KBRN3RPJch+2A3mIJkyosocmDjZJAnWz7ws5EvNhdcJX8EiR/X4J7Dnn8xt7L3HoJyOmF43U5IL0IeCQmMNNElSf4CxNzrEvjvtu6fhi16KskFLylxeUR8fszfO/87PS0slEKtOHu3SNu3V8f8x0nGDeSJt30iaoQs43SahEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M5pXvUxr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41699bbfb91so41925e9.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Apr 2024 00:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712734024; x=1713338824; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPqlx7BmYYQRrHwdFpEcKrs3wYCOOp0IuBOu6np/GUM=;
        b=M5pXvUxrj7KE0m6xxN+sVcC4a+HAtyQr+Q55bPVLzP+ng4V/W9st/nVawiYhmS4BAY
         JeZuq3I/05KElP5AcKYDc+iOdyV5iNHtpgGhxPryIFbhCJQYsAZyoQxCHH8jha/FAhrI
         ydIMSb0q6EEiiIqna6Bnz8pUNxdl2+tUzRUesCPAcxBQiInXdS4Qai8BVzhj2tqIrTMY
         ex5DC5kz6VaV4wntyR8RPdQK/gODFwH/RVYC4UnxEsvt9KuEEYIwQ+9ykdfaOwDJvPnk
         0OeoR4R/HOOM23L2stu1h45ihDaEYYMjguRHSimk8BfhbQbgTeQq2Ls980YQF3j9nni+
         LzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712734024; x=1713338824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPqlx7BmYYQRrHwdFpEcKrs3wYCOOp0IuBOu6np/GUM=;
        b=jT9YXyuaOiu08bZfYP9nWRzE1xFJfd61NK8syXeGoQEft/Hpfm6Zty2GIzS1HgxWpl
         3UB3yDzO5l8Z/we+eJjbwlFE2SOp/9Dpn1gPY8jlSLQtP99HIl3JArNzEtyWCcWVKK0h
         T9sCHiMQAi6SD0OEJjP/0kbtHmHu4MeT2mOhEVapo3y7cByNnpDSPEY7tCEcAfnanw4u
         7lssj69JboR1mDaW9UnVZQ8R8ubaiS9cxfJ8jfbrZKlPvlTGApjQjhA5N6s85824l7Rl
         Qu7s6J9nc5tG6ETZTElT4PkdeGtUkhQvBflyAKWBFRlqWGTbKUk4SixC+1NyZXnK9hvI
         cQXA==
X-Forwarded-Encrypted: i=1; AJvYcCWgi27GVSXYEy1Whszpkju5/4vxa4ggwBVSo9MleS1rnVP7G3TnA0ceNNKvFkEsaBXUTliANANkfIWoE4ExkerG98VuTbJ+w/aD
X-Gm-Message-State: AOJu0YxshUo8hjqURK5rxUNpNbShUmC6nx0Y0ZnaMQplGjMGtu8SGNzA
	1tKKSnBIJ0TVZHjD/aR24WIv2Xn9KZxQHXVtT8KNDFjHLxBJOYAIE0/qznAYCDCKiPBZchUiIkg
	2hE3nVmIj8R2e8C31LvmY1BeUwhzVfplMMD9+hYCHogFaPa7qjLRXnWM=
X-Google-Smtp-Source: AGHT+IHEZ656PFyJo55eH+SvyyFTU5QIl75hwIQr7KlrDN2EIMWnZAUbcj2ioWKER3bUrt2gpRpgFlgbbn2FiCYBEY4=
X-Received: by 2002:a05:600c:5113:b0:414:daa3:c192 with SMTP id
 o19-20020a05600c511300b00414daa3c192mr138732wms.0.1712734024167; Wed, 10 Apr
 2024 00:27:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3042f847ff904b4dd4e4cf66a1b9df470e63439e.1707441690.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <3042f847ff904b4dd4e4cf66a1b9df470e63439e.1707441690.git.Thinh.Nguyen@synopsys.com>
From: Manan Aurora <maurora@google.com>
Date: Wed, 10 Apr 2024 12:56:50 +0530
Message-ID: <CAJnM4-xYjmYUa4ePaYG3P8O3CYCWOMJwF=e7D1Pv8vvk6pBtNw@mail.gmail.com>
Subject: Re: [PATCH] Revert "usb: dwc3: Support EBC feature of DWC_usb31"
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Youn <John.Youn@synopsys.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Will McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thinh,

I'm working on a patch to bring EBC support back, I had a doubt
regarding some of the required corrections though (inlined)

Please take a look and advise, I'll proceed accordingly.

Regards,
Manan

On Fri, Feb 9, 2024 at 6:55=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
>
> This reverts commit 398aa9a7e77cf23c2a6f882ddd3dcd96f21771dc.
>
> The update to the gadget API to support EBC feature is incomplete. It's
> missing at least the following:
>  * New usage documentation
I will address this
>  * Gadget capability check
>  * Condition for the user to check how many and which endpoints can be
>    used as "fifo_mode"
The easiest option seems to be to add a new function that lets users
specifically request
fifo_mode endpoints eg: usb_fifo_mode_ep_autoconfig_ss
This function will cover ensuring that the device supports
fifo_endpoints and returning a suitable
endpoint (if available) and NULL otherwise. This can be indicated by
adding a new bit to
the existing ep_caps  structure.
Does this seem like an acceptable solution?

>  * Description of how it can affect completed request (e.g. dwc3 won't
>    update TRB on completion -- ie. how it can affect request's actual
>    length report)
I will remove the NO_WB bit for the EBC endpoint and leave it up to
the user to enable/disable this
>
> Let's revert this until it's ready.
>
> Fixes: 398aa9a7e77c ("usb: dwc3: Support EBC feature of DWC_usb31")
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
>  drivers/usb/dwc3/core.h    | 1 -
>  drivers/usb/dwc3/gadget.c  | 6 ------
>  drivers/usb/dwc3/gadget.h  | 2 --
>  include/linux/usb/gadget.h | 1 -
>  4 files changed, 10 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index df544ec730d2..2255fc94c8ef 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -376,7 +376,6 @@
>  /* Global HWPARAMS4 Register */
>  #define DWC3_GHWPARAMS4_HIBER_SCRATCHBUFS(n)   (((n) & (0x0f << 13)) >> =
13)
>  #define DWC3_MAX_HIBER_SCRATCHBUFS             15
> -#define DWC3_EXT_BUFF_CONTROL          BIT(21)
>
>  /* Global HWPARAMS6 Register */
>  #define DWC3_GHWPARAMS6_BCSUPPORT              BIT(14)
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 564976b3e2b9..4c8dd6724678 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -673,12 +673,6 @@ static int dwc3_gadget_set_ep_config(struct dwc3_ep =
*dep, unsigned int action)
>                 params.param1 |=3D DWC3_DEPCFG_BINTERVAL_M1(bInterval_m1)=
;
>         }
>
> -       if (dep->endpoint.fifo_mode) {
> -               if (!(dwc->hwparams.hwparams4 & DWC3_EXT_BUFF_CONTROL))
> -                       return -EINVAL;
> -               params.param1 |=3D DWC3_DEPCFG_EBC_HWO_NOWB | DWC3_DEPCFG=
_USE_EBC;
> -       }
> -
>         return dwc3_send_gadget_ep_cmd(dep, DWC3_DEPCMD_SETEPCONFIG, &par=
ams);
>  }
>
> diff --git a/drivers/usb/dwc3/gadget.h b/drivers/usb/dwc3/gadget.h
> index fd7a4e94397e..55a56cf67d73 100644
> --- a/drivers/usb/dwc3/gadget.h
> +++ b/drivers/usb/dwc3/gadget.h
> @@ -26,8 +26,6 @@ struct dwc3;
>  #define DWC3_DEPCFG_XFER_NOT_READY_EN  BIT(10)
>  #define DWC3_DEPCFG_FIFO_ERROR_EN      BIT(11)
>  #define DWC3_DEPCFG_STREAM_EVENT_EN    BIT(13)
> -#define DWC3_DEPCFG_EBC_HWO_NOWB       BIT(14)
> -#define DWC3_DEPCFG_USE_EBC            BIT(15)
>  #define DWC3_DEPCFG_BINTERVAL_M1(n)    (((n) & 0xff) << 16)
>  #define DWC3_DEPCFG_STREAM_CAPABLE     BIT(24)
>  #define DWC3_DEPCFG_EP_NUMBER(n)       (((n) & 0x1f) << 25)
> diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
> index a771ccc038ac..6532beb587b1 100644
> --- a/include/linux/usb/gadget.h
> +++ b/include/linux/usb/gadget.h
> @@ -236,7 +236,6 @@ struct usb_ep {
>         unsigned                max_streams:16;
>         unsigned                mult:2;
>         unsigned                maxburst:5;
> -       unsigned                fifo_mode:1;
>         u8                      address;
>         const struct usb_endpoint_descriptor    *desc;
>         const struct usb_ss_ep_comp_descriptor  *comp_desc;
>
> base-commit: 88bae831f3810e02c9c951233c7ee662aa13dc2c
> --
> 2.28.0

