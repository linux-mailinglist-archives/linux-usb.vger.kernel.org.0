Return-Path: <linux-usb+bounces-12437-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1664693CDDC
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 07:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 695A9B21CC3
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2024 05:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0334158873;
	Fri, 26 Jul 2024 05:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v0aiKzzj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48152156898
	for <linux-usb@vger.kernel.org>; Fri, 26 Jul 2024 05:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721973548; cv=none; b=buAv5pQ9ZxTS8iLW6bG7iwLhLn6JBP0o1YzdbVyA9Tt0sIV2CtF8X2bPF3sKMcbU1pgIfSIQLodU+aPWil+fK5tShX5AmbVp5P+WzRUKF1L/pafV7X6J5XDEA0b5qdFdo9hWunmX217qqsXmU0Imlgc411uXmTG9ijs6iC+RRRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721973548; c=relaxed/simple;
	bh=PeZcMZeweJbsVxgw1N7g/HLCdkhelynbAD5Jt8gLcjg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=svdbUIsElJbCHVSVWMOYL93j64VFbD2PRcE2ZqHmGuhc5v8zKHdS/cYhbI14PJSAIgCBO4GzWuuGFkDHLhlaPIflJbew8sDtzKHnlMpSPQuIE7sWuBhXDIPgHYhmegcfHQ5eTqlaQ8F3xxQkbhfkchnsK1M7cW6ONj5IM0Gnzqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v0aiKzzj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso2557765e9.0
        for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2024 22:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721973544; x=1722578344; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dAYeHQWH8jaw6jGoVv0l5Fwc2TPm2KqkM2puS1a7KXw=;
        b=v0aiKzzjyfZS0gNMkTk/K/WTCv1ukrmyNCy/5dtpBqrt5Hwd3O7ntFyFkVCxrcrGKI
         IUy+Hs3EHVlyjpytmuINswMCKgT3IQl2M46dYO0VxmbtQcG5CSaZiZTf9ViBMCMF/HFU
         FKyt+cL/m8jJoe1jqxmAnPjOxcUX6uhP5R6KQaTRVUIHQYzzqR98Vthc7KmcQ/DbdaUG
         JKLJ7PzlmEBUZ8u76CQhU1Ro16HVomxM2A3qirzmd3YEciWST7KAon7Xdirn+Q6B4EXS
         mKBoZ9EKAAnR4BXf/LAAUVySvGbe/BYcXFTy7DOBLbLht/8TeyXuhNrn/yM9er2qMcp5
         qgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721973544; x=1722578344;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dAYeHQWH8jaw6jGoVv0l5Fwc2TPm2KqkM2puS1a7KXw=;
        b=Q/m+uGQib88ja6yq5Ku+/OhWWBkM2M2qv9MyLAEi805fnVm/gL34OSc+ogr/XgUN6f
         gYxziMubDJqQI4s+CenR2AZSnfLOF29aUJtQIaAOeqzpfsfF5NYtSZJJ7e6MQckfeIA6
         nozO1+3OSYsBOsL+FOwrcfAQCHoH2rWXC/3SlcZa9quGx1rt5FWI84CSZozhiD68xM9r
         4u9eEqsCXZnomrl0lrzLOPtlZkT+LnHI4doF67sNAmSzYt1oMm9VZikTuBMKhfyL04/r
         dZROiVwP76RxrMhnT5o9qbTJhrkKUDnMFo09wVgjmI6KPiyt1bm8kQeON0rYIJNFGves
         lLvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT9w0Z35WE7HiYeU2uUQZuCPaD71/hmvO+OIgRdfFsvauTBDgBZtCZ5At2ntcJ4rCUYuAuak6eFlHSqN8G9yWBeQgB28dOen2N
X-Gm-Message-State: AOJu0Yw8IqSMbLIyQ5DzovXinBf1iTvYnvFWtx6zks+BHimACe5PRikt
	XWsbnYJ/Ao5+Y6vmylYycBNxP9bZbr6xWeetS2LM+79lUMoAEbMh6eLeJVEPRtn2KCPn1hq4jjx
	b5AK9aw==
X-Google-Smtp-Source: AGHT+IG+TSLMeItn3Y5MEhX/SpI0aUplguwHSbj+rsaQ5j2pMvkVudDYgkzZ54VWmsDtuZ5I0CUY6w==
X-Received: by 2002:a05:6000:4011:b0:367:940c:6a3c with SMTP id ffacd0b85a97d-36b3640529fmr3557937f8f.41.1721973543552;
        Thu, 25 Jul 2024 22:59:03 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c0574sm4045173f8f.8.2024.07.25.22.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 22:59:03 -0700 (PDT)
Message-ID: <dac4a84c72bba076ea0d3a51a78b6d350732a7a6.camel@linaro.org>
Subject: Re: [PATCH 00/15] usb: typec: tcpci: few TCPCi & TCPCi-Maxim
 cleanups (mostly genmask())
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, Badhri
 Jagan Sridharan <badhri@google.com>, kernel-team@android.com,
 linux-usb@vger.kernel.org,  linux-kernel@vger.kernel.org
Date: Fri, 26 Jul 2024 06:59:01 +0100
In-Reply-To: <20240710-tcpc-cleanup-v1-0-0ec1f41f4263@linaro.org>
References: <20240710-tcpc-cleanup-v1-0-0ec1f41f4263@linaro.org>
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

On Wed, 2024-07-10 at 11:36 +0100, Andr=C3=A9 Draszik wrote:
> While looking through the TCPCi drivers, it occurred to me that all of th=
e
> open-coded register bit manipulations can be simplified and made more
> legible by using the standard GENMASK(), FIELD_GET(), and FIELD_PREP()
> macros, which also is less prone to errors: e.g.
>=20
> 	if (((reg & (TCPC_ROLE_CTRL_CC2_MASK << TCPC_ROLE_CTRL_CC2_SHIFT)) >>
> 	=C2=A0=C2=A0=C2=A0=C2=A0 TCPC_ROLE_CTRL_CC2_SHIFT) !=3D
> 	=C2=A0=C2=A0=C2=A0 ((reg & (TCPC_ROLE_CTRL_CC1_MASK << TCPC_ROLE_CTRL_CC=
1_SHIFT)) >>
> 	=C2=A0=C2=A0=C2=A0=C2=A0 TCPC_ROLE_CTRL_CC1_SHIFT))
>=20
> (arguably) is much harder to read and reason about than:
>=20
> 	if (FIELD_GET(TCPC_ROLE_CTRL_CC2, reg) !=3D FIELD_GET(TCPC_ROLE_CTRL_CC1=
, reg))
>=20
> and so on.
>=20
> These patches do that. In addition, there are a few comment fixes and I
> added in a conversion to using dev_err_probe() and
> devm_add_action_or_reset() in the Maxim TCPCi driver.
>=20
> I kept the patches separated by register or register field as appropriate=
 to
> simplify reviewing, allowing to focus on one field/register at a time.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> Andr=C3=A9 Draszik (15):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb: typec: tcpci: fix a comment typo
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb: typec: tcpm/tcpci_maxim: clarify a co=
mment
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb: typec: tcpci: use GENMASK() for TCPC_=
CC_STATUS_CC[12]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb: typec: tcpci: use GENMASK() for TCPC_=
ROLE_CTRL_CC[12]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb: typec: tcpci: use GENMASK() for TCPC_=
ROLE_CTRL_RP_VAL
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb: typec: tcpci: use GENMASK() for TCPC_=
MSG_HDR_INFO_REV
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb: typec: tcpci: use GENMASK() for TCPC_=
TRANSMIT register fields
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb: typec: tcpm/tcpci_maxim: sort TCPC_AL=
ERT_MASK values by bit
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb: typec: tcpm/tcpci_maxim: simplify cle=
aring of TCPC_ALERT_RX_BUF_OVF
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb: typec: tcpm/tcpci_maxim: drop STATUS_=
CHECK()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb: typec: tcpm/tcpci_maxim: use GENMASK(=
) for TCPC_VENDOR_CC_CTRL2 register
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb: typec: tcpm/tcpci_maxim: use GENMASK(=
) for TCPC_VENDOR_CC_CTRL3 register
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb: typec: tcpm/tcpci_maxim: use GENMASK(=
) for TCPC_VENDOR_ADC_CTRL1 register
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb: typec: tcpm/tcpci_maxim: convert to d=
ev_err_probe()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb: typec: tcpm/tcpci_maxim: use device m=
anaged TCPCI port deregistration
>=20
> =C2=A0drivers/usb/typec/anx7411.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> =C2=A0drivers/usb/typec/tcpm/maxim_contaminant.c |=C2=A0 46 +++++++------
> =C2=A0drivers/usb/typec/tcpm/tcpci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 104 ++++++++++++++---------------
> =C2=A0drivers/usb/typec/tcpm/tcpci_maxim.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 18 ++---
> =C2=A0drivers/usb/typec/tcpm/tcpci_maxim_core.c=C2=A0 |=C2=A0 71 ++++++++=
++----------
> =C2=A0drivers/usb/typec/tcpm/tcpci_rt1711h.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 27 ++++----
> =C2=A0include/linux/usb/tcpci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 31 +++=
------
> =C2=A07 files changed, 144 insertions(+), 158 deletions(-)

Any comments on this series?

Cheers,
Andre'


