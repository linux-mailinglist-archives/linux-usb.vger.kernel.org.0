Return-Path: <linux-usb+bounces-28289-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B37FB858A3
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 17:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04FD1584FBC
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 15:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E3930F949;
	Thu, 18 Sep 2025 15:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WyvCZiG+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7E530C11A
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 15:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758208573; cv=none; b=J/xIA8+VM1/wJ5euZWZts2ZT+N1Vb1CmWUKy9NXMV+ns0F8JzYXpgFLpd1xh6rTDMBSlIxfkvI8RB4j95ZFMGrml8M/f5PCqisQ29A+z0drqsTgBKmB8WvEt2HSCJERG7gjbzwTA1mDSkMJ3JrXiiI6V9P8GUWcx8qznOTYP1Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758208573; c=relaxed/simple;
	bh=XpqlDA/hyMutqOXOtcHoeGa/ryYYMOPnkl081l9Xc5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ps7OWBRf/wO0L2NhObdB6oWGqJRAXp4PJQgD1x1Ih322AC+CJo+Yl99H16dXFcF4BM3N97UKgnYkTFvQVi57g3fPOSx3GJwdCZYEnm7DRpTt+/DofwqkfvoScuz+alTtcniljJr3CgS1/xvzQ6Wx/U/hgd2Qdry7m4Dl9SUL5Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WyvCZiG+; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-71d6051afbfso9355517b3.2
        for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 08:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758208570; x=1758813370; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xxqmW3n9Sw4jw325VsVgJ6XHMVW6nHnWRwX1gianPwM=;
        b=WyvCZiG+tMHNFlwu37e/r3icUHyWHScp19n4RT99Js6INaBe/jcEf7b9D0Ju1teEAg
         VDJQi/ME7eUnexMaqoYy6XQdxjr7+k3/5y+vK7MhXEr6wGFQBjeseS8Fxn/oeQJzUU9W
         RHASCbgtelhqIpJpYLYQOFRuSeFjrcC9bbkrtfiUL6G1uYXsHV64DCkTAf/UL38GDF3j
         N/z2HWfEbgPKTmsPYOlWkForNlsLdX63w5Odxw6L28IUK5NFmO4I5cSj2H95Q0z5ipKa
         GB8xIBimCf9NdQn+TwXBEzu7w0pB/QalOZTSShFIuHWCT/LCUOUYQohkLT7oKM2Hs8p4
         SQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758208570; x=1758813370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxqmW3n9Sw4jw325VsVgJ6XHMVW6nHnWRwX1gianPwM=;
        b=BDx6whYJNTrHPyu4MudWpcO25D3iQa0zRlFj6/tu1cI4LWypsmNRb/DPuYynJilInj
         Vh3XdE5AV5nMJAbBo9RKxo9C7vbp1maqPwZ8Fxg1kZXblBSIDj7zyi60yf5fj5MJ6Jkt
         MRTNcaSyeQwNGBxkW/P0DNRIcHs7Da/vAncvrOYpLzFpNxz5GGS4534b0R01YNiH/joc
         8p4QP9yBvfQltnr/7ly5BtBJP/kX8rny6mqo2EDj9/1mFC3IJK17A6mesQnmhgIPsvV+
         ocuCxHCcSn8Dht3twohwyaKkhSKeYl3fn8LRnIWQsh+YRup8C/HVhnv9eo/aeu9CFT5E
         JlYw==
X-Forwarded-Encrypted: i=1; AJvYcCVkx6mr/4QTrZym7WXxLrNLGWTlMtNYwwcIdd2GO9+3eNW5cgZa4QdoelMS7Fd2Piv4qANFwaNDT6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEbdvTSvlNjik2IyYDd+YbsMHOohZiVFyBwwuP+rQtxgi4G6G9
	KqttN5MJhyKOfE+W2yFT3qQPoKubrO3+8HxrG2eD41q0rRXdqhSnic0sO4OZywHpwLbN1iLiuO0
	JpY05z5tHaw5ij3K0OYZHCxmlx0nfrDH21iYvD1sL4g==
X-Gm-Gg: ASbGncu7Fl6GFs3HHNRAE6awnpQdtzYCsCJn2agDXyOAoFe/gM9cGNPBkvvgbQqWfoY
	gzdF1O7jicTTzLOU3K/9OTFHZ2saqNdcDbnvjWCj2H5GX948QMcqgkYC6olpZTP2Bq9tHdlXX12
	04IKNio2q3rL2BBvh9UmNpu4rIpogSH9a55ObpvZyc0Cq/nODW5sAQS4CRf8J605VeT8IYjcdVI
	XKF7u5RiuBWm7uwaYtxops=
X-Google-Smtp-Source: AGHT+IGhhJ7Bv3R+nZnqBzlYOnhgsyWlmTzS9C8s6bR8WkgRrUao/WcQHEslpUiS5E5xsVP21eeJhMPtVBvj4DhTSeo=
X-Received: by 2002:a05:690c:7108:b0:720:d27:5d0 with SMTP id
 00721157ae682-7388e0ff14fmr49402547b3.0.1758208569760; Thu, 18 Sep 2025
 08:16:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com> <20250902-pm-v3-4-ffadbb454cdc@nxp.com>
In-Reply-To: <20250902-pm-v3-4-ffadbb454cdc@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 18 Sep 2025 17:15:32 +0200
X-Gm-Features: AS18NWCz7mrWAc40Ox1MHdxef1Mp2CL_HkIidm9lOboNSf8e8s0UW_BDcKfNYeU
Message-ID: <CAPDyKFrMPz8X23WAoj_8A3-SsdpbZZ5Ss9MbLK0yy6FLRytTVA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] usb: dwc3: imx8mp: Set out of band wakeup for i.MX95
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Xu Yang <xu.yang_2@nxp.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Sept 2025 at 05:33, Peng Fan <peng.fan@nxp.com> wrote:
>
> i.MX95 DWC3 inside HSIOMIX could still wakeup Linux, even if HSIOMIX
> power domain(Digital logic) is off. There is still always on logic
> have the wakeup capability which is out band wakeup capbility.
>
> So use device_set_out_band_wakeup for i.MX95 to make sure DWC3 could
> wakeup system even if HSIOMIX power domain is in off state.
>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/usb/dwc3/dwc3-imx8mp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
> index bce6af82f54c24423c1e1fcc46913c8456b6f035..fde158d1f6e3d89d261ed3689a17d703878c7e37 100644
> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> @@ -248,6 +248,10 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
>         }
>
>         device_set_wakeup_capable(dev, true);
> +
> +       if (device_is_compatible(dev, "fsl,imx95-dwc3"))
> +               device_set_out_band_wakeup(dev, true);
> +

Similar comment as for patch3, please set this from system suspend
callback instead.

>         pm_runtime_put(dev);
>
>         return 0;
>
> --
> 2.37.1
>

Kind regards
Uffe

