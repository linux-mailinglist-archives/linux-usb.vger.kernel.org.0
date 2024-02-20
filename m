Return-Path: <linux-usb+bounces-6812-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 185D285CAD6
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 23:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D39628535D
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 22:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6F2154423;
	Tue, 20 Feb 2024 22:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fba1YMU6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804A7153BDD
	for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 22:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708468714; cv=none; b=ao2Zzb3SC/LFPEime4ujzUl8Q40GrbBovOu8KsZq+8qjmKeoStlQUKUj5fwgq3UtorhP4CIQq4+DSHPeRW6n9YlIwYZ06Izj2DqpdTa34Y6mbVsXX9UTugk5EHZTQf4TTm758y4o4OIh/s3AV32WoII4i8OcHuhhQGgPHmxNoRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708468714; c=relaxed/simple;
	bh=yclMuqfVpq6Uo1jCiaeacEaGMBhHwnHW1pMSpxjkkR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTlZhXVRpBIP/EKgG8gxC1+h/u2tOpYLB2Lq/wVr6PWJrzzvPk4i2J1JKHiXbQulVo+r1GovBOY4n0b7vQ4ljtxAh7Q8oeJJUzxGgYZjsbp5Hv1ZD3bKCLAOD95GjWD9cg0TJl0BcdTdqzhvKz0gyNAWiRAs2P7aVkSOe70kE8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fba1YMU6; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcc71031680so4746420276.2
        for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 14:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708468711; x=1709073511; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tpl1owOrWyjqDOWkdN2xFa6uL/xl0XTw5pHOD078G5M=;
        b=Fba1YMU6OgtSFvF4nGwMzJ0Ahj9a9b0I3qZ6NBPODdqPDHGucWSH9TGTUJEQpJFtf1
         BkbJHMnSaAGTnoVaabe2MZYWROYVchs1UC0dhfCM3BXy8P4wrRflOWtxuOufcMc8daWC
         CDctDCgYcU5jaI3vMu8iGAe9C7wZtYOyQhIm7OJNfGvUG5VJLZT7DLmswCjCTsQorT7r
         SERj1VfysbzRc8L938pjDD0g51oLFV2vtiYJq3g9fAO9mgOEA+42cZMHTBBWcjNXNjSy
         eMlQc3acWMHvwRFDRHWn07LqWANaS60t1csW2jQIwAcQn0ZbDb+ICiv9rwqBJ6e0izwv
         l9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708468711; x=1709073511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tpl1owOrWyjqDOWkdN2xFa6uL/xl0XTw5pHOD078G5M=;
        b=Z/OeL6bfTRrry0S1Ah3v4PKNUdDGJ77SIx/vfz7J6M8vI5cULmxC2GgOc8J249S9yI
         hW4tNt+4XS5y6X0g6T4S5d4Vw4KnAw/OZTSHxOjY8qs7mop+y+VciZfaatI7DZnSFxBM
         30wyTxMkTYFL589Yq9EsfQmwCPpZvjZ+jfFvwNDNFmwrczH2pX8qh8397ajVBFs5KKpi
         FLCnaddKBfsQR2tY1LdWDSCYUKHkfoSEBlyywUcD1EEW1e3yP+LuIcvfjbDYcaR+eOFU
         e7J49nUQg+3+1yWsVp8IgZWTWuvbfeIcqs5HhVDhZWrGu+EuTCVlbXAG5Y6k04DfDsTb
         aidg==
X-Forwarded-Encrypted: i=1; AJvYcCV7Ii74pHlf8IoI4aSPEpAl0kLIJB/GAxL6fHJ6qt6covEBBpjPNQHlt6eMVkzgDizr9e2Lq1HEeGqHdVYT5ykOtlol6epBr5q9
X-Gm-Message-State: AOJu0Yy/Uqy9nh099TTJpT3N/uOaexNlTmAN+3+aKYBmzo9T/co3zyEw
	I08QaXXpfm47KYUqr0xGoECjKsRuCCP8BxyWOVhfMvXCtDNhkv3DLn4oxhAChwv3Vba3XhECqcZ
	zNdEWwxGxnstCLPTHwFQhBwS6dLB7TUrdMA6rkg==
X-Google-Smtp-Source: AGHT+IHu/ijwBwa+JiQvgJls8FPLtF2HDFrmYed6T0djTupJAnR5NQQy8l2L9TNIP0k9znPyUUVhzs2mv/BO8O80DIc=
X-Received: by 2002:a25:4105:0:b0:dcc:b719:4e4f with SMTP id
 o5-20020a254105000000b00dccb7194e4fmr13917052yba.53.1708468711565; Tue, 20
 Feb 2024 14:38:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202-pm4125-typec-v2-0-12771d85700d@linaro.org> <170845186085.159943.14965896524132330811.b4-ty@kernel.org>
In-Reply-To: <170845186085.159943.14965896524132330811.b4-ty@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 00:38:20 +0200
Message-ID: <CAA8EJppkVkY9_yJ8ZpwmP+b9uCM2_-5NRUT=_VHsYpj5K0s+5A@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/4] arm64: dts: qcom: qrb2210-rb1: enable
 Type-C support
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Feb 2024 at 19:57, Bjorn Andersson <andersson@kernel.org> wrote:
>
>
> On Fri, 02 Feb 2024 01:55:07 +0200, Dmitry Baryshkov wrote:
> > Reuse Type-C support implemented for the PMI632 PMIC (found on Qualcomm
> > Robotics RB2 platform) and implement Type-C handling for the Qualcomm
> > Robotics RB1 platform.
> >
> > Dependencies: [1]
> >
> > [1] https://lore.kernel.org/linux-arm-msm/20240130-pmi632-typec-v3-0-b05fe44f0a51@linaro.org/
> >
> > [...]
>
> Applied, thanks!
>
> [3/4] arm64: dts: qcom: pm4125: define USB-C related blocks
>       commit: 46ea59235c4f00bbca6955cf05d7cc0fccde7a64
> [4/4] arm64: dts: qcom: qrb2210-rb1: enable USB-C port handling
>       (no commit info)

This looks worryingly.


-- 
With best wishes
Dmitry

