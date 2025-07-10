Return-Path: <linux-usb+bounces-25680-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CEBB004DB
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jul 2025 16:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EF7016D2EA
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jul 2025 14:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2F2271450;
	Thu, 10 Jul 2025 14:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qGEM3rnm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D9E86359
	for <linux-usb@vger.kernel.org>; Thu, 10 Jul 2025 14:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752156577; cv=none; b=Zdjv3lSrRfNauVaQCejJ/2ehmuqgGT2TM18noO0IXxhmaDZ7wm1vPfdq7CWArC0i/SngR+L2brkKrHF2LLj2Gl9L4gT3QuCry8seARjBwRqnVNBgyNqod3rVXHFxjDZRqfaIN/c9HW4CKKZStYNZINGbqmEftdHWxhE4rUIk+zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752156577; c=relaxed/simple;
	bh=2grR0mUlBz4k8clT2FNGCooSxKt52UcD68qKVQhldjU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=WApoUtI/joqJQE2/HSwkYpjvhGAN9elEJ2N1qqYyUweJ1Z23fbO9MJ5tQ+4iUMj23Pt/tBPUYzO8LhfnjOSnQmucKW2wMK6uhaT831DgVT7eYpLyPR6vHnRf8NhvOI1h9AGhIkeytq0qWMO/OFsmkpaZ6CAfbGP7owyhCOacdQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qGEM3rnm; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso1442587a12.0
        for <linux-usb@vger.kernel.org>; Thu, 10 Jul 2025 07:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752156574; x=1752761374; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQoCinxRRh/iq3oTutQRdNZV03mKs3O7qPm/FmODtXA=;
        b=qGEM3rnmr3pYHyOtGRuhTp+UiuEvuktsPR41C3pDeprlC0oHjAZZtLmyjV7TcYcakX
         4F9N06Nyvhda2jVoGPtTdnMONwslv2BKVfO1LKmO8Pft7aFWt7rEavG3wcACeF8BU3cE
         7kAOBMPD2mlkUO2+hRpAzm1jcUl7PsUDT2iXGiW3wzIAOxTZrOEEpCrRIlvjVRekJAGU
         yndxMBpd8OjlGh8ll22Trmrk0sO+m0kSsshMRHF8ZcfUP2PD6by86ndQSnXCLvsezilU
         HX4TmFF6IGRRE4yBFXBtOgAzARBY8hGTQmEpAi80FjYxkLEJVyuDC1IWrMul+9iw0qA9
         WBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752156574; x=1752761374;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zQoCinxRRh/iq3oTutQRdNZV03mKs3O7qPm/FmODtXA=;
        b=fRfgLhZbSIvHLkhKlApseB5lDKyYRqquHnaDL+yOBVlL80Ooa0xLCQyxtipiZ7GSpR
         n5aNCWdILvPtVX97az1UF8o4Od2Q3UPdFor+ds9eKL4REnIeq9JP64ZFXUz/yQRHZjrJ
         DWnxb/KcpLnAXLJKnbgdleOCvU5nRj7p3P30aTQk0+XEDylf/oo9D86qiDcD5eShf7ag
         QCSQdJ2JrmzkyOxAIUO1VyXwGLQgpRaGfSzzVkKQX/QvgEF6KPaUARNcqDiMUb5iC2+Z
         hTZHCReV3u6pCusGUKanK+Kb9gswNX/tNpmH+xRxiuyTuqvyutUAd41wjcw96s+5iFhW
         2IRg==
X-Forwarded-Encrypted: i=1; AJvYcCXq7SrHf42tJE2CBBA3nM2D0hTpVZbPNO8S9efOsNSB0RPTHe8MiigXNhA6VyiHojHA6AJrIXmB/24=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEBaCxPNvsNUmec6+wPXYoGPRLUKZumUnz4p+iucolhpNbf+SL
	M+11SwILJ3HquFJOTno0zk+9YZDdeYB/5STg4f45u596hHjEsVOGT/3LfDPGj63O4VI=
X-Gm-Gg: ASbGncv0+B+huIuLvK0QVpyWcf/LEKTxLekwHCzQGO1OUFSaQ8HwGgBYxGZfi/58AAf
	1tH/COahGT7euC1SQtuAt9yNCJ7SOptaEBIzmW+Kkl8ZXGTSeBq6SKuKP6S/0qE3shcA+D7a1jg
	D1X8Nl7JXP0IDJKyjm+bJP3gm6hLKuRcGlCDP6TUJLe7HVnqMyas83pNefcBGrXvorTX9AmFXAY
	j8dvsvouKlDKlP1v46UCKHDFom3LEBgXRgGqfjYqwwhYU9mJy3MLcNUb3Im44BQnigNoqE3g/6+
	XfCnNr5Xocqdeia0TEILigoH8IF3UJYzZmw5JJsPbwRYtZ365ECa+rQy/RkCXcXRFbKLGiFD/v8
	jmwxAmUupGcwehMJTVIigG9c9K8HOc0k=
X-Google-Smtp-Source: AGHT+IG8YxUCUZJeWu7C8W4J27oyXKY2dGnFXQnEMhNeARIfZps63JGs0OVwIsREQQAKXy3KL4OREw==
X-Received: by 2002:a17:906:9fce:b0:ae0:b49d:9cd with SMTP id a640c23a62f3a-ae6e70fee29mr278269666b.58.1752156573823;
        Thu, 10 Jul 2025 07:09:33 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e910e8sm140856366b.36.2025.07.10.07.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 07:09:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Jul 2025 16:09:33 +0200
Message-Id: <DB8FO1H0LHQ0.2JBDBVE8JFJVC@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Wesley Cheng" <quic_wcheng@quicinc.com>, "Vinod Koul" <vkoul@kernel.org>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, "Abel Vesa"
 <abel.vesa@linaro.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/4] phy: qcom: phy-qcom-snps-eusb2: Add extra
 register write for Milos
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
 <20250709-sm7635-eusb-phy-v2-4-4790eeee7ae0@fairphone.com>
 <7d073433-f254-4d75-a68b-d184f900294a@oss.qualcomm.com>
 <DB8DGDEN23D2.1GFB8XI0P3YLR@fairphone.com>
 <a2567891-1dd4-44ff-9853-6f9a451f0a74@oss.qualcomm.com>
In-Reply-To: <a2567891-1dd4-44ff-9853-6f9a451f0a74@oss.qualcomm.com>

On Thu Jul 10, 2025 at 2:29 PM CEST, Konrad Dybcio wrote:
> On 7/10/25 2:25 PM, Luca Weiss wrote:
>> On Thu Jul 10, 2025 at 2:10 PM CEST, Konrad Dybcio wrote:
>>> On 7/9/25 11:18 AM, Luca Weiss wrote:
>>>> As per the downstream devicetree for Milos, add a register write for
>>>> QCOM_USB_PHY_CFG_CTRL_1 as per the "eUSB2 HPG version 1.0.2 update".
>>>>
>>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>> The downstream driver supports an arbitrary extra init sequence via
>>>> qcom,param-override-seq.
>>>>
>>>> volcano-usb.dtsi has the following which is implemented in this patch:
>>>>
>>>>     /* eUSB2 HPG version 1.0.2 update */
>>>>     qcom,param-override-seq =3D
>>>>             <0x00 0x58>;
>>>> ---
>>>>  drivers/phy/phy-snps-eusb2.c | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2=
.c
>>>> index e232b8b4d29100b8fee9e913e2124788af09f2aa..87fc086424ba4d9fb3ce87=
0aa7f7971a51d4a567 100644
>>>> --- a/drivers/phy/phy-snps-eusb2.c
>>>> +++ b/drivers/phy/phy-snps-eusb2.c
>>>> @@ -420,6 +420,12 @@ static int qcom_snps_eusb2_hsphy_init(struct phy =
*p)
>>>>  	/* set default parameters */
>>>>  	qcom_eusb2_default_parameters(phy);
>>>> =20
>>>> +	if (of_device_is_compatible(p->dev.of_node, "qcom,milos-snps-eusb2-p=
hy")) {
>>>> +		/* eUSB2 HPG version 1.0.2 update */
>>>> +		writel_relaxed(0x0, phy->base + QCOM_USB_PHY_CFG_CTRL_1);
>>>> +		readl_relaxed(phy->base + QCOM_USB_PHY_CFG_CTRL_1);
>>>
>>> Said HPG asks to clear bits [7:1] on all targets
>>=20
>> Okay, so make this unconditional and only update those bits instead of
>> writing the full register?
>
> Yes
>
>>=20
>> Keep the write at this location, or move the code somewhere else in the
>> function?
> Let's simply do this instead:
>
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index 87f323e758d6..6c44d0366f34 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -392,7 +392,7 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
> =20
>         snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_1,
>                                     PHY_CFG_PLL_CPBIAS_CNTRL_MASK,
> -                                   FIELD_PREP(PHY_CFG_PLL_CPBIAS_CNTRL_M=
ASK, 0x1));
> +                                   FIELD_PREP(PHY_CFG_PLL_CPBIAS_CNTRL_M=
ASK, 0x0));
> =20
>         snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_4,
>                                     PHY_CFG_PLL_INT_CNTRL_MASK

Sounds reasonable, if the HPG suggests that...

Just asking myself why this wasn't updated in the driver but only added
via the qcom,param-override-seq for some SoCs. But downstream is still
downstream I guess.

Regards
Luca

>
>
> Konrad


