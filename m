Return-Path: <linux-usb+bounces-3798-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 115B5807F04
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 04:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 429A6B211C1
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 03:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88651869;
	Thu,  7 Dec 2023 03:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMcTTPao"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5EED137;
	Wed,  6 Dec 2023 19:00:34 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6d8d28e4bbeso318559a34.3;
        Wed, 06 Dec 2023 19:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701918034; x=1702522834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhSz+48D5Rt4U23Tg+4vmyl42dn2RcUMbGtIBTvQxYI=;
        b=BMcTTPaod/BN+Urm/9ApJxmjfk5GaoVwvhVJ6Df0wFWe5xHPGcKLu+yGjUGfgyKao6
         q80fOjJqhpKWER94jMrsRSFJY2jimODImfiAGaPf9qOkNsxSca5a5SUHNh1lIIaLMrC5
         YRT4MOmHCNhamkRkJECGi70JkCKQP7W2XTmpHhN4p4jklnPP3Gl8MvRLh3aif4T0aG3M
         I2bfLyMdsBRYCibbJ6Ybu49Cttuk++LZoTKEF8YLJewg6B7a7LZq70ch3yadPArOIlpZ
         W2eFEBQN2b6GXvJI7y9QR/zyBoe2auI6UUB2QA3L6udWpeBECeViNXqu6m6bNHzeX6FB
         TGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701918034; x=1702522834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhSz+48D5Rt4U23Tg+4vmyl42dn2RcUMbGtIBTvQxYI=;
        b=musEAFM0FUha7lYkyy7wNGCAVhKfBV1tsK0ujTo02DjBs8RxwlbbTpNn9cTMvxxLaD
         H9hdcBmcoGFDOBQWxQvYsfQ3gc/AeTyIdVGnXFUXwTK1Vj69ruVRrQ+dLmmhIvjSKaGn
         Ecy2YqMGssm4DYKO2odlwctaHYG5T1Q+esWGcgXK0ASUxdOybahihO5ynM7o/FqsAglV
         7rAHZjjl/pC6mNAeqGuGPVh0VslcoiUzRsZsMaN7O7JQkr2Q9d4hi8rwIJpVTIuZX+aU
         Ix1RGaFfCL/n3dI4n9LXZILdC885nYNPuAFiqTl2VUlajqRL9Cv67mRQ0jJ+XqEnm7Lv
         ZDxQ==
X-Gm-Message-State: AOJu0YxyMxf5SvGUMjhK+1MR8RMu5BbvL/Y4GWkdFtYgXmiO0NcAazrQ
	oHTPbpAC0oUif6/qhGLS8jjCj4u7KKOXWrXpfsI=
X-Google-Smtp-Source: AGHT+IHUpb1GnaA/CMOhx1o6Kl2ufAYV1QErXdu0v0VhY9k1KyIeNaAQMTyBECQwibQwAeE5EkGiE9xYBrVBuWfDHRg=
X-Received: by 2002:a05:6871:6114:b0:1fa:ded0:d8e6 with SMTP id
 ra20-20020a056871611400b001faded0d8e6mr2094531oab.5.1701918033974; Wed, 06
 Dec 2023 19:00:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206181317.27515-1-rdunlap@infradead.org>
In-Reply-To: <20231206181317.27515-1-rdunlap@infradead.org>
From: Peter Chen <hzpeterchen@gmail.com>
Date: Thu, 7 Dec 2023 11:00:22 +0800
Message-ID: <CAL411-rcnuJtNJnvpkq4KWMib7xP08SEH8c5F1eT2mgZi4H6ng@mail.gmail.com>
Subject: Re: [PATCH] usb: cdns3: starfive: don't misuse /** comment
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Minda Chen <minda.chen@starfivetech.com>, 
	Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
	Roger Quadros <rogerq@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 2:13=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> Use a common C comment "/*" instead of "/**" to prevent a warning
> from scripts/kernel-doc.
>
> cdns3-starfive.c:23: warning: expecting prototype for cdns3(). Prototype =
was for USB_STRAP_HOST() instead
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Minda Chen <minda.chen@starfivetech.com>
> Cc: Peter Chen <peter.chen@kernel.org>
> Cc: Pawel Laszczak <pawell@cadence.com>
> Cc: Roger Quadros <rogerq@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> ---

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter


>  drivers/usb/cdns3/cdns3-starfive.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff -- a/drivers/usb/cdns3/cdns3-starfive.c b/drivers/usb/cdns3/cdns3-st=
arfive.c
> --- a/drivers/usb/cdns3/cdns3-starfive.c
> +++ b/drivers/usb/cdns3/cdns3-starfive.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/**
> +/*
>   * cdns3-starfive.c - StarFive specific Glue layer for Cadence USB Contr=
oller
>   *
>   * Copyright (C) 2023 StarFive Technology Co., Ltd.

