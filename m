Return-Path: <linux-usb+bounces-6813-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1FD85CAE0
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 23:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C01961C21A25
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 22:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B826153BF2;
	Tue, 20 Feb 2024 22:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AJ8roU4E"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7736415442C
	for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 22:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708468847; cv=none; b=FQOrDyJ1MqY7Lv4lvH6DwbH2YN+SsYluSiCOG3Lji2BP1q2MKS23H2MwrsEjFb+S0psuEpjOmfmOlZhslxmSXhj6qtqaFjMsilRfzab4iBMyH1P4eHHJKPnfYmBN5zk3R6rXPi/96raQY77RgMSFNGQ+WlmYrxkaqXTkPWR4GWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708468847; c=relaxed/simple;
	bh=qqa0KvriwB1v8Bj7pTBYPvZ+DPDnOmT8Yxi6uMiKXwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HaW+LoA+Zurjlt0m1XABWPwDI2MdThMpySuE5xPtlQtkWxB0ijG/Xi3L0077ucyHFd3QfxekNm96AB5AZ38EjYiQdusyTSfXMbvEw2SDNJnE48kQoF/F7E8VQCU6eWxmc4HZ4/zHRYlqnFhNIbN1lyHQROf8priPcQIx7nPNChw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AJ8roU4E; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-607f94d0b7cso49932647b3.3
        for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 14:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708468843; x=1709073643; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MmwuqZ+SRwcH0WhEWSC1fUHglZZfWWDUa+m2OJY8rik=;
        b=AJ8roU4EID6WpClvCwPxjcgXaCaWQnxpcmKDB4L147zDSKMdn1ItToPD/hISY1rbt5
         FTulxBHFMkmZu24v6Sw1IyLFvNF1f2xDxw18vhiKeH6XtxPjzhSKCKbAnGckJvEB3Xfi
         1SWD2XrbZXptZKcgZpMOePkmu9F2jt0hqEk3uFyVtTxpwAOE8j4YQ1YK/y+DPjC0A7Z8
         PesWtTZ0yN5RU+bh86bpOyAZhKqdUuQiPIt5eBoSf5uYloDe7wxribjFCZlW6VboXnxD
         37BCx1kjTZsolU3WLawjuchbt144tpbCK41upSk9vS/nsInw6bXxn8TNURj3Hga2b2i+
         myLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708468843; x=1709073643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmwuqZ+SRwcH0WhEWSC1fUHglZZfWWDUa+m2OJY8rik=;
        b=aIPVLnLMk4EAfhXKkucg/kHK8IMF+xlhgaUcMhCKF7BxGuOZlLOFzdDaMKhlMyYjWX
         i8Bgkk+r+uLlJYrmqEm7/lNrewQvlzYB1QOO8NzcdQHdEZ6n7TS5YTaHahCht2kzAM9J
         i1P3up8nno+unj51dpKX8wXAO9bKBvQhIMQ8C6OHm/r+ElOs7hmHfugDUXb6FMDtdSS9
         9OoWqWI7423QyzjNT59eWH8ZjuznYxafd3gkI6wnFKQkAWO0UhYhZFF20ePRMAoH2dCa
         LoXPpqQvGx1LYTPDAz3Q3pKn3h4P4kQsWwWf1rzKx2fnsSbXkZRIiIRQXTMA/lI/x+hM
         mj6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOxbYLWrGlIek8ZkXQ1hsuiQThg6SWSXL3NrAqmovOH0CmubqqfO4wDPEo2i/L19EMlk0gNz2Ig9XiJ8xDrQ7EQOXDzE1x2KPF
X-Gm-Message-State: AOJu0YyViQuYA6VoIRJERYTfTm/rzqM48FRxUfRuNQK8H3YcoeAuX05N
	ZSZoTwg1Li2I6zA9Ckacg7tIPJq9OJl/73XOp9dUKQIWCBJQgr3Jb+hx3MVcgMzOuR9cnbppfnA
	agBH+/GTo0xMf5vLaLb46yeDDAOzNfe9cIFUlsw==
X-Google-Smtp-Source: AGHT+IECKOxvwNIHjH+q3UCKrD0cIZc/Wky7bvQz0uKvXaoNUSqNSg4CHepJRR3O8AFfyFDZjhCR5X9cScX1yRPWYQg=
X-Received: by 2002:a81:b71b:0:b0:604:3ee2:f258 with SMTP id
 v27-20020a81b71b000000b006043ee2f258mr15118384ywh.45.1708468843468; Tue, 20
 Feb 2024 14:40:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202-pm4125-typec-v2-0-12771d85700d@linaro.org>
In-Reply-To: <20240202-pm4125-typec-v2-0-12771d85700d@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 00:40:32 +0200
Message-ID: <CAA8EJpoUHi8FDAKa+LO+2t7fXxXaFYhXAJzkUUPs_uJH9pvZWw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: qrb2210-rb1: enable Type-C support
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Feb 2024 at 01:55, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Reuse Type-C support implemented for the PMI632 PMIC (found on Qualcomm
> Robotics RB2 platform) and implement Type-C handling for the Qualcomm
> Robotics RB1 platform.
>
> Dependencies: [1]
>
> [1] https://lore.kernel.org/linux-arm-msm/20240130-pmi632-typec-v3-0-b05fe44f0a51@linaro.org/
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Removed unnecessary conditional expansion, covered by existing compat
>   string (Krzysztof)
> - Link to v1: https://lore.kernel.org/r/20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org
>
> ---
> Dmitry Baryshkov (4):
>       dt-bindings: regulator: qcom,usb-vbus-regulator: add support for PM4125
>       dt-bindings: usb: qcom,pmic-typec: add support for the PM4125 block
>       arm64: dts: qcom: pm4125: define USB-C related blocks
>       arm64: dts: qcom: qrb2210-rb1: enable USB-C port handling

Mark, Greg, granted that the dependency has landed, could you please
pick up patches 1 and 2 correspondingly.



-- 
With best wishes
Dmitry

