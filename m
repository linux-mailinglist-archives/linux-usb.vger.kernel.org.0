Return-Path: <linux-usb+bounces-7462-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 017F486FE0E
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 10:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A7DFB237A7
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 09:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E7F364C2;
	Mon,  4 Mar 2024 09:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gcFtWw/Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40244225D5
	for <linux-usb@vger.kernel.org>; Mon,  4 Mar 2024 09:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709545900; cv=none; b=QXGnTsRG8sG6+WuDEZlICwiBS6+WR3I3WNiWzZVnqCJsYkIRzoNr6neeEG551skzv88V2w4HdWZvss6WczgI0xTlsNIKwe7p2mb03O6yD/cBCjBnZLVfZ7vd7UYzWXOErYJLhOMCp2qLbEn/vrvCsIHzwi1v+cajVxRc79PWwtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709545900; c=relaxed/simple;
	bh=MGhgkMD/cjVPR3a+kB0C5eJxM17tMh3NQiA6g1OtcLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EeB2ZFX7BXpEu2qSSCW2IuI8ioAK2fDDGD6W7qG6EMiQ1MLE8kIgBlHKl5IOLXBRnvJNxG/8QvtsM2cmwterGwz30XJmQmobmCELcXQKyNHXHvZftIHopnn8L5/VAO/DNmSpip1YoIlPYuDtvQSF4lX5LtvFfnfblCjj3Kkso2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gcFtWw/Q; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso4309622276.2
        for <linux-usb@vger.kernel.org>; Mon, 04 Mar 2024 01:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709545898; x=1710150698; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VnfOrWMwZoAPt5p92Jsbbn3jE/DBv9zEluClEUvIFsg=;
        b=gcFtWw/QeaQjEXNYOTtj4u72+Is6EmgIgtyA1dlOU3dGoq7fI+QQSW34vaejLIs6qM
         4kTKSF7E1QgLS1XcJ6HA/RldDR1NSeVWIMJdP5kw8BvgklYLIvULNzQREb/VHOq94m9R
         29RDXeEZxYFOFWf5ydbuMjiwJDdiWioA2jK6NQuTUwQKvo544KWsuvx0gGZF7KXnqq57
         nOsZZEQFQxxO7lj1kbTzM0NxDGlzjAQMEjg5k/YCvtLg3Dan5zmDs1znvENDbOlXCmat
         qeHrSdPjY0UuQD5nkiCM/J34D/sHK1tR0zIs3ZuiMtAVHw33U5l8LWizlYK6qL/xN431
         RfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709545898; x=1710150698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnfOrWMwZoAPt5p92Jsbbn3jE/DBv9zEluClEUvIFsg=;
        b=ETcp2xGv42brOC8E4DhjrXtOCgedFPbw9Ki1U8qCzZtxuhVc7K8SCF0Yccg+qau+Te
         y9ZBfFzqfAfE8ursfeRwKJeJyvtbdh4/mbqUvEKOMYOE4QTJECXOq5jAjEkjPLeLUnPg
         UbDTUutqlout1VinvqMmU6fouRFm/gcxNMiRmF42QK6ad/MSKkoa5kGFnfzVWgOWzCu+
         RyUAEv5xG0CNGrryrxEb+iLkAek0nPLM/1mDx5OAePdJonFE2rZ1wR7ev4zw0W4B1Ivb
         fqMhXX4qyQxpWLpOV0XglQmOJwxBP7ZLbZ+nL1p83J7JQo4+1xTv+6UY/nsP9SO4LQHC
         sbbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeCzM6QdCeE+5/bT2UYs1nj1jBTFOYFQCKIkFXxVY3AGrHii/Y/deiYh5Bi19F0FW0kkJm1cPbpNxfqOlr10Y/qF98/7KkB5jq
X-Gm-Message-State: AOJu0YxRgdlgreOsYEhjt2lcnsCFsmwG0asn2U63Y0YGQhm5hQBnOAjb
	1hQaKiNiHj7f040x48FFWF8SXo16CALnj9XJFppE/TYNxxrRYfGKLRYu+k7b0aaED8PB4mQKf+q
	pEegQGVbv5NH3wIPNmCVT+lAwZB7WCHq47ZVH8g==
X-Google-Smtp-Source: AGHT+IHGpMgW4Nq+tUL0EpMm0iZyBEZIKD85dk+O+VJWc2BEPOdiuo1YLXxxsOZBGB5cYTCYqXHAmyECwavkhIzy2VA=
X-Received: by 2002:a25:ec05:0:b0:dcb:f7a0:b031 with SMTP id
 j5-20020a25ec05000000b00dcbf7a0b031mr5234974ybh.50.1709545898337; Mon, 04 Mar
 2024 01:51:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240304-pm4125-typec-v4-0-f3601a16f9ea@linaro.org> <2024030414-stark-service-ce78@gregkh>
In-Reply-To: <2024030414-stark-service-ce78@gregkh>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Mar 2024 11:51:27 +0200
Message-ID: <CAA8EJpoCm+jqMsd6=pnpd+cCtqLYnMWLmrNQgjiyhi7ugeUjvA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] arm64: dts: qcom: qrb2210-rb1: enable Type-C support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Mar 2024 at 11:49, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Mar 04, 2024 at 11:26:09AM +0200, Dmitry Baryshkov wrote:
> > Reuse Type-C support implemented for the PMI632 PMIC (found on Qualcomm
> > Robotics RB2 platform) and implement Type-C handling for the Qualcomm
> > Robotics RB1 platform.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Patch 1 added, 2 did not apply to my tree :(

Thank you!
Yes, patch 2 should go through arm-soc.


-- 
With best wishes
Dmitry

