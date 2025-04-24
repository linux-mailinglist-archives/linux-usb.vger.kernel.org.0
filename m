Return-Path: <linux-usb+bounces-23398-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C30AA9A786
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 11:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 814521B81BCE
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 09:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6C6215160;
	Thu, 24 Apr 2025 09:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kh3stX/B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A2A1F09B0
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 09:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486164; cv=none; b=LAME/8LX6AnRqOnjV3jTeCdKDTTna3NUx0f3bpfANlce/HD2gMEkd/NacOPwy7y3OY79upIFoUiRw4ElHi8ak3jzvz9R6aKMOIIvU7qNMk5J3YQIwXO4oRmt95VPfi+EVkCcXph6CoMQyVdCiaYVlcQFW0aTtyJdMoCEvzNC/nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486164; c=relaxed/simple;
	bh=VSsb/fev9/oFpo5bkT96ukEsZksq2vgQHZz+7xG67LU=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:
	 References:In-Reply-To; b=WiQ0H8I0C9TfUXYgTs1oKbIb5cg9MN4SJ1iB89zNvWyZAgstqmIqWbLBOwv09F6LBLgwNnARTue1cNJKjKSiDYwy5/XHUfSDOdlyTAXIyMaXBJZjamZVUI1M+SgNOUbbPY11CrDpbdC06Am2kQJumEQqxRs04+DtM/vRnXiqAtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kh3stX/B; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso844640f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 02:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745486160; x=1746090960; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byL0Dqtflxgn09JWRHWrzGYRCjjSd+RUgvJzKKWrW3I=;
        b=kh3stX/B31XaWjD7IeipASU/GVNgq0Di1S7NmsjyRzOVE7nIkQj1f0amcMl1n3cu1a
         ai7kZysU7Qi3a3UhEii9tNFS/aUkrOKSkzo5yQERkf1TGjWO5lnPEuY/Hga3kxfKIRSa
         vFs0cKXgB0p85Vw4YyRQmfUqHBMe3uwb1T79u1uPS+V4SUoHXHBTxnbDtKa/WUv9q+EX
         EdfwGMKvS2erCA/3fNej8Wc6asRZVsZWPOKraKSmnUKWu2SM1t3tSj2UyhUtEt+/JwK0
         tFAPJ/et5tgP+MIDhLgsa71QZItLlBEImlQQ+aUDJOlWhyPFFvcPc3PKGmkzcfOnnK4B
         FVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745486160; x=1746090960;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=byL0Dqtflxgn09JWRHWrzGYRCjjSd+RUgvJzKKWrW3I=;
        b=UIV8wjxA6pbOf+SnfHcySFGJytaaKCtBu6xfYdpI8w9DPbhiq8KXJl0Pn0gUaB0NUg
         7UGWjxAVl2L8HlSajfgdY4OsDpG3/5dt2iDVa5RjWwaxeLoqRR8qal6Xg5HrSGBk9x3s
         zo8BZhMkv+XbjE+tIiNqzdbHT9nUCieb7ztKgnK+bnf6Cd3xjdXYjggn9zmCoOzCqIAV
         aPC7vvstWjMD9JeSiwLCPxfcVwcxlmWBjhoSguYwL/mgDzAqChYArKHKQMeF0yxpL8dQ
         hH2a6dlEuXjimWqjdydxOYSrxebk9tnRowPNRF8U5+Uyfj4tKTfSumEHZuMGVFV1DNfX
         Uh4w==
X-Forwarded-Encrypted: i=1; AJvYcCXwEayId83tS/gxsg+JhOQzXV0RVTgzqxESxGyauQ1Q7gE03E+N1JCSP4pUUTrSqM5EIonbKnJtN7g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2tYYZyIrg6cLOgN1aJJkscQ1hUqyOjoxYX3ZDDWXaThEjWsS/
	SgiqpI7Q76oVKZ9wtf52Zgogt/MkNLRl2EpiTz5RtZvHItu+dMyr7PHbyajl
X-Gm-Gg: ASbGncv8Y9MVp390emtHXMGX7wanUHSUN0sLC9e+IuRAMHSGDJP5sVlXsd6yT3UmU28
	dBpI1Wm4GuSMhmnGlV4MAkQ0vy5VfN3jcxJoK64jrl5WXEczEByYbmxb9uvBzUpu4JL/cCKDOwT
	4pWon9Ney4m0EMyMVmyMMgSEQ/q8oKqmJV/3hE+DNxhGQtzDis7rs3KTzdPc3QwYYeysUytJbGV
	5sX1+qfwwo8f74y3T+RmdhcjSvlTEoD6Nb6h7pJJ3PAtDb2X2S4RZxzKoTciBwtS28csd3spoJU
	MlUaxVSbJJ5jQcq0LQIRqIdm3saEijD6+urmLIIEqXYTPikqMvXognEk1utVqdVxYg==
X-Google-Smtp-Source: AGHT+IG+ydgxMLHS74W8+fV+i+SmgqCmdS8ZgUv5QqOdC+NN61rJxju0+i7v3zyAsIdaiOuxtX1GZg==
X-Received: by 2002:a5d:5f46:0:b0:39f:175b:a68d with SMTP id ffacd0b85a97d-3a06cf50194mr1381730f8f.11.1745486160181;
        Thu, 24 Apr 2025 02:16:00 -0700 (PDT)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a06d54c087sm1389065f8f.81.2025.04.24.02.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:15:59 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Apr 2025 10:15:57 +0100
Message-Id: <D9ER7AW8WZDW.31XZT9R087DFN@linaro.com>
To: "Alexey V. Vissarionov" <gremlin@altlinux.org>, "Rui Miguel Silva"
 <rui.silva@linaro.org>
Cc: "Fedor Pchelkin" <pchelkin@ispras.ru>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
 <lvc-project@linuxtesting.org>
Subject: Re: [PATCH v1] usb: isp1760: increase buffer size to avoid overflow
References: <20250422230000.GA857@altlinux.org>
 <rdsyrsjl67rjhkuatkaggnrfcruvzcxlwnfb6jgqgh5ninlnmj@hy2ofl7jlhei>
 <20250423110540.GB857@altlinux.org> <20250423111040.GC857@altlinux.org>
In-Reply-To: <20250423111040.GC857@altlinux.org>

Hey Alexey,
On Wed Apr 23, 2025 at 12:10 PM WEST, Alexey V. Vissarionov wrote:

> When isp1760_udc_init_hw() calls isp1760_set_pullup(), its call of
> isp1760_field_set() may access the udc->fields array beyond the size
> of DC_FIELD_MAX up to HC_FIELD_MAX, which is (now) bigger. Increase
> the buffer size to max(DC_FIELD_MAX,HC_FIELD_MAX) to avoid possible
> overflow.

This will fix the access, but not the main issue, so this is not
correct. The isp1760_set_pullup should pass to isp1760_field_set
the hcd fields and not the udc ones.

I will send a proper fix for this. Thanks for reporting.

Cheers,
   Rui
>
> Found by ALT Linux Team (altlinux.org) and Linux Verification Center
> (linuxtesting.org).
>
> Fixes: 1da9e1c06873 ("usb: isp1760: move to regmap for register access")
> Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
> ---
>  drivers/usb/isp1760/isp1760-hcd.h  | 2 +-
>  drivers/usb/isp1760/isp1760-regs.h | 3 +++
>  drivers/usb/isp1760/isp1760-udc.h  | 2 +-
>  3 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/isp1760/isp1760-hcd.h b/drivers/usb/isp1760/isp1=
760-hcd.h
> index ee3063a34de3bccf..34dacde96c4ae3cf 100644
> --- a/drivers/usb/isp1760/isp1760-hcd.h
> +++ b/drivers/usb/isp1760/isp1760-hcd.h
> @@ -50,7 +50,7 @@ struct isp1760_hcd {
>  	void __iomem		*base;
> =20
>  	struct regmap		*regs;
> -	struct regmap_field	*fields[HC_FIELD_MAX];
> +	struct regmap_field	*fields[DC_HC_FIELD_MAX];
> =20
>  	bool			is_isp1763;
>  	const struct isp1760_memory_layout	*memory_layout;
> diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/isp=
1760-regs.h
> index 3a6751197e970013..a5a442015887ce0b 100644
> --- a/drivers/usb/isp1760/isp1760-regs.h
> +++ b/drivers/usb/isp1760/isp1760-regs.h
> @@ -267,6 +267,9 @@ enum isp176x_device_controller_fields {
>  	DC_FIELD_MAX,
>  };
> =20
> +#define	DC_HC_FIELD_MAX	\
> +	(DC_FIELD_MAX > HC_FIELD_MAX ? DC_FIELD_MAX : HC_FIELD_MAX)
> +
>  /* ISP1763 */
>  /* Initialization Registers */
>  #define ISP1763_DC_ADDRESS		0x00
> diff --git a/drivers/usb/isp1760/isp1760-udc.h b/drivers/usb/isp1760/isp1=
760-udc.h
> index 22044e86bc0ecb84..609444bea306ba81 100644
> --- a/drivers/usb/isp1760/isp1760-udc.h
> +++ b/drivers/usb/isp1760/isp1760-udc.h
> @@ -69,7 +69,7 @@ struct isp1760_udc {
>  	char *irqname;
> =20
>  	struct regmap *regs;
> -	struct regmap_field *fields[DC_FIELD_MAX];
> +	struct regmap_field *fields[DC_HC_FIELD_MAX];
> =20
>  	struct usb_gadget_driver *driver;
>  	struct usb_gadget gadget;
>
> --=20
> Alexey V. Vissarionov
> gremlin =D0=9F=D0=A0=D0=98 altlinux =D0=A2=D0=A7=D0=9A org; +vii-cmiii-cc=
xxix-lxxix-xlii
> GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net




