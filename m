Return-Path: <linux-usb+bounces-5109-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BE882EF14
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 13:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7614E285AA8
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 12:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FE91BC36;
	Tue, 16 Jan 2024 12:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iqoC8RfY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37E61BC25
	for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 12:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e7ddd999bso10754685e87.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 04:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705408424; x=1706013224; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yqUSIm8UXdupfFL04/MqcN8j6+bdxHnm7+lARtVgoAU=;
        b=iqoC8RfYejQ3U5SqT8yFWI3JdBbw+kjeKlNIyf2Xx8TVr0S6IyM40t3sGrgvg2Lern
         zCkMI7IMkj8M4RDJbYpkyDavDjBmvq2jd1MC+O3f3A4tMgmmaaieptVCHAFkbZ40xb57
         RgNIP5qL8N26oH+J7KrquOTJN0VNMDymIVIHPgIeU/BRqJpuSr6hRZkFJ+Gml/kNHaQM
         KKvGyIkykkN8L/uZrkO5CMeS8MB9yV/V5FHTpDa4Nk8cVYifBHq+Bg4rWyLjatmKoMdh
         hdtsiRGJXiQGv4VB4YmcXc28bWLc/N+vCjK2lqc2VVwlH8RmJqvP+i9iROpw9DjrnVXB
         7TJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705408424; x=1706013224;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqUSIm8UXdupfFL04/MqcN8j6+bdxHnm7+lARtVgoAU=;
        b=LpBnmv79Z1dTqlli/vslphNHFIm9hucH5pkChmyXZwnXyVKvV8E6jjrNsDVxnTOIuD
         60JXrxcByDunqz0Dqqw+6VmpmnL4HXdKp2oBU2InyWFsBvND3o9FxVtpSwztKSlvx/vq
         PcEeiRUvknNLL3ZatvXBEAixXAj6XMS/lMCEjWdz6gn6TJO8soXiZtJuddjfHpATy+8G
         6veAKna7SPHkG6bVU2SMHeVARH/CfU2KYbKH23YqTl+f7bfGaVbGIO2fwhJloz8/vQFo
         MsHJWXh/cHFuwH8ezOhm24OpH0bra7jFAim5QdZTQJM/gQPLRKoRP3vEz2312UqMFPu3
         l5Yg==
X-Gm-Message-State: AOJu0YyzUtjhWUxKJDkYuk6des9UVnJOnY9M5nC+QuX1eppRUVDGFJPo
	T3P+fYJYxpFZEdsr2lu2114+KFHBazvlEw==
X-Google-Smtp-Source: AGHT+IEnYeTGzE8ZNVwW0Wo/DO7GcXJyF7myoaGvnuvy9vpcXIHzHBeFf5ELzlSPEnV21sRW4i2hnA==
X-Received: by 2002:a05:6512:2383:b0:50e:7615:d34e with SMTP id c3-20020a056512238300b0050e7615d34emr4223427lfv.22.1705408423784;
        Tue, 16 Jan 2024 04:33:43 -0800 (PST)
Received: from [172.30.204.234] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id f12-20020a05651232cc00b0050eca8735dfsm1752612lfg.140.2024.01.16.04.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 04:33:43 -0800 (PST)
Message-ID: <f5e88324-3bf8-4b54-972c-d8f47a674cf2@linaro.org>
Date: Tue, 16 Jan 2024 13:33:42 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] phy: qcom: qmp-usb: split USB-C PHY driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-10-182d9aa0a5b3@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-10-182d9aa0a5b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/13/24 21:55, Dmitry Baryshkov wrote:
> In preparation to adding Type-C handling for MSM8998, QCM2290 and SM6115
> platforms, create new QMP USB-C PHY driver by splitting mentioned
> platforms to a separate file. In future it will also be extended with
> support for the DisplayPort handling. It will also be reused later for
> such platforms as SDM660, SM6125, SM6150.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

