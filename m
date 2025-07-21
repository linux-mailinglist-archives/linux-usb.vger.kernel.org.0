Return-Path: <linux-usb+bounces-26017-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED7FB0BC73
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 08:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 685BE3AB822
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 06:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB40E26E719;
	Mon, 21 Jul 2025 06:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="aq8cV+t8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711B2239E7C
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 06:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753078931; cv=none; b=VuYA9ksJhs4B61ZRSkXp5pHuMt571T9Ie6Q77+9IFICdV54cHe1Ft57kl6ereJCJTL5nTm59dK2XuZzji78hdaFB6n/U1sOCTkf7pxVaVmC/XPEB0mGMo/nZSNIbvybtBOG0dg5YbFWdop2JajamdPMvtsM2uNIGcOu12+B5M3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753078931; c=relaxed/simple;
	bh=e/WbSFDNeDfS+LSOj9AgaJuPp6oksM9qfd/sSKFNU8Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=lyC8/rG2NFEZKPCtT77VQZrLctt52MdijJkplIUBpPsLgaW8g/2Z2kBR6CkUSQBpjTIXZjgxbVGXfqRyNucUtY7Q2nyY34ZsHUJH+gITAakUt0SIzWT9nbIcBxubn2hyUxiWOk/yo4LsXpgJeTSawELqPfDr4AjpQ1+wPNJWVz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=aq8cV+t8; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-612b67dcb89so5365238a12.1
        for <linux-usb@vger.kernel.org>; Sun, 20 Jul 2025 23:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753078928; x=1753683728; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxlTp2H4f+SSkPB3pjUTlZ/GS1r2OUFTEUF3Vv45kbo=;
        b=aq8cV+t8y3rWHCjiRbl1Fa/PBc1hKt6fQzWP9kVTQ8Lbya1WAwYWSCto1v2ps501YO
         kz6t8IVe7/MxPGy9n/plexfvL9Xk6caeMmH1znATp2fzc9Cu6iYNevRm4g0YE1sT9Z7G
         M9FWnLLkYRmhWd1sOBOmDSS5RSuCLGw6qohCuuUZAmjMoXji/WD400pN7adUslNfF4Ju
         jxShos+hgQ4l1awXVGTZVeaS0YwOCjZ/FBRM6a21Rmo4O9xPTUMLYcKLI5uecb0xdd5H
         GGZEZXu3eB3WpgW//GERqpoAKIvduMvNq01cjq0ompbmiayFUZgCvlBHfDvaoZ5OiXGl
         rftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753078928; x=1753683728;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SxlTp2H4f+SSkPB3pjUTlZ/GS1r2OUFTEUF3Vv45kbo=;
        b=obt8SNMllQ8MXx/pb4KFBQAyRd9Ol4YQyAiT0Kh0ExmOAPddekqUoAZfqY5fQrfek8
         +8//b3cU34pxwRXO/pxrIuYSbQe2LbhP7dmiLXZWNmkHuTwEG6UB7na3VDu6mFtMj+g3
         NUu+Jv9wfjuU4QtJ/aNI0viqkq84GEJ9A79TKjj8exuM6juI9dO+bEbp0/HVmVxPLh+E
         W6KKotpxGSgBHT0yKj91C6C9AjLJGiaR4uzovMyKoIwIWmU/Erre3Bbobx5ChwL8ayq1
         tSKM9AKq2XY77VXE968APP1sq63iWsbak/XrMiVcjjKx9sOmw9oHB8hfFQwUIeSWo5o7
         3I6w==
X-Forwarded-Encrypted: i=1; AJvYcCUFzoCSetCKY0y0/R4cflhT4FrKcToKQRbCwqxlYUtA75R1NJiYq7AiEoURPIuCc/jl4GljlkxwUcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoK2lEHGmljByfcPKJn2B49dmg8+tZ64rP5dBZ9HnZxdTdUJc9
	KSb5jjaXaB59tPirXAukJUbQWa3s5fhdplyfHCxFKadSy41JrrLTCFiUoPPAv+eH8y+S7nbz0eA
	z0w8kot5tTzw8
X-Gm-Gg: ASbGncvScXszdJmk3APJO9rcExqHuhGia38ayor4Jn1HVwJX/ootdbolSA8bP1KL+TW
	t2mfu8P9On+790EYlMQ5b3nJ+YBjXAb4knZNzRtBTVeRXhK4VDpPnUmqqpiTVnWS9HnMlO60mBO
	c6MnF97KusoRDxHtY8gbh1R2Zeb8g3Uxk7IFBE+IN5zmN4FPryTF/qqnOAe8pvx772Zvcx3+MmO
	pokGJ98aSHLBLqsyu15ftEXZHA3rL+77rdE3KtRuvA+3VHxoFgQ6JuWET7aU7TtOkirKxa8yfZN
	dh0EygZACSWP6WBE60WduZjM/MRaXxa4Seu30fBM8GimMP8wmHhl3zbVRfGoJsyWuOj30hRpahz
	zrECJQimzO5gtO2Pm5RDg0OEoWl+fSIs7yM7Qa/ugstiNCh4z8zTzdH5nK9ADNlxFLyDEnUyG/C
	JVx+lvsi3bEpjhjCmC3r22c0vtVw4LJ38=
X-Google-Smtp-Source: AGHT+IGWvgXRtNul1EHNPbtYzvjFLipYAjCIlsMOcSI5SACMCOkh5I5JbXvq4SIjNEe0zxTInnpH1A==
X-Received: by 2002:a05:6402:1ed2:b0:5ff:ef06:1c52 with SMTP id 4fb4d7f45d1cf-612859187eemr18924367a12.3.1753078927734;
        Sun, 20 Jul 2025 23:22:07 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f09d99sm4949565a12.3.2025.07.20.23.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 23:22:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Jul 2025 08:22:06 +0200
Message-Id: <DBHIM4SA3OIK.PXX6HMDE93B8@fairphone.com>
Subject: Re: [PATCH v2 0/5] Enable USB audio offloading on Fairphone 4
 smartphone
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Felipe Balbi" <balbi@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Wesley Cheng" <quic_wcheng@quicinc.com>,
 "Stephan Gerhold" <stephan.gerhold@linaro.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
 <DBDAPORDD5IM.1BHXPK225E2PP@fairphone.com>
In-Reply-To: <DBDAPORDD5IM.1BHXPK225E2PP@fairphone.com>

Hi Mark Brown,

On Wed Jul 16, 2025 at 9:19 AM CEST, Luca Weiss wrote:
> Hi all,
>
> On Thu May 1, 2025 at 8:48 AM CEST, Luca Weiss wrote:
>> Since the series for the USB sound offloading driver was finally merged,
>> we can add the sm6350 dts and enable it on Fairphone 4.
>>
>> A few devicetree binding bits have also been missing in that series, so
>> there's some extra patches for the basics in this series.
>>
>> Depends on:
>> - For qcom,sm8250.yaml & sm8250.c:
>>   https://lore.kernel.org/linux-arm-msm/20250425-fp5-dp-sound-v3-0-7cb45=
180091b@fairphone.com/T/
>> - For dts:
>>   https://lore.kernel.org/linux-arm-msm/20250321-sm6350-apr-v1-1-7805ce7=
b4dcf@fairphone.com/
>>
>> Devicetree patches go through qcom
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> Changes in v2:
>> - Move num-hc-interrupters prop to sm6350.dtsi (Konrad)
>> - Sort cpu & codec nodes correctly (Konrad)
>> - Remove usb-soc-be prop as it's no longer needed (Wesley)
>> - Pick up tags
>> - Link to v1: https://lore.kernel.org/r/20250425-fp4-usb-audio-offload-v=
1-0-f90f571636e4@fairphone.com
>>
>> ---
>> Luca Weiss (5):
>>       ASoC: dt-bindings: qcom,q6afe: Document q6usb subnode
>>       ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4 sound card
>>       ASoC: qcom: sm8250: Add Fairphone 4 soundcard compatible
>>       arm64: dts: qcom: sm6350: Add q6usbdai node
>>       arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB audio offload s=
upport
>
> All dependencies for the patches have been applied already, so this
> series can land as well!

Is it still possible to pick up the sound patches (1-3) for 6.17? Dts
has been applied already.

Regards
Luca

>
> Devicetree patches go through qcom, the rest through their trees.
>
> Regards
> Luca
>
>>
>>  .../devicetree/bindings/sound/qcom,q6afe.yaml      | 13 ++++++++
>>  .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
>>  arch/arm64/boot/dts/qcom/sm6350.dtsi               | 11 +++++++
>>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 36 +++++++++++++++=
+++++++
>>  sound/soc/qcom/sm8250.c                            |  1 +
>>  5 files changed, 62 insertions(+)
>> ---
>> base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
>> change-id: 20250425-fp4-usb-audio-offload-e5d7fb55d283
>> prerequisite-change-id: 20250321-sm6350-apr-15f3e7e4e5ca:v1
>> prerequisite-patch-id: 69859554c94de52068406dab0d2869ca26072c78
>> prerequisite-change-id: 20240809-fp5-dp-sound-b3768f3019bd:v3
>> prerequisite-patch-id: 2d8997a2be02cfddf3a054c79e7eb308a6d06710
>> prerequisite-patch-id: 1b7c8f00ab50ae71c0221868578b9c1dfe939e4d
>> prerequisite-patch-id: 4fd0673c4d35c1fefce63ec5785ff5ea67cc3d3a
>> prerequisite-patch-id: f5ec3a893de19900f62dc691d83986f1104914b0
>> prerequisite-patch-id: fce7573c39e768f7a09c002064b6159b8e91161a
>>
>> Best regards,


