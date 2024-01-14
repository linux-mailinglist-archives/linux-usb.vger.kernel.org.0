Return-Path: <linux-usb+bounces-5033-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 364E482D164
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jan 2024 17:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D68821F21664
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jan 2024 16:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4A13FF4;
	Sun, 14 Jan 2024 16:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kkhGhuBm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608377E
	for <linux-usb@vger.kernel.org>; Sun, 14 Jan 2024 16:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33765009941so6507252f8f.3
        for <linux-usb@vger.kernel.org>; Sun, 14 Jan 2024 08:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705248831; x=1705853631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jnkq2UkgPpVsEo47nILwi/m7D73qWwB4CzFMK6Ortrw=;
        b=kkhGhuBmqZEm1U36KEXt0uG/abEjWX6jkygvD6lMg94bywKXx+0IDvSCIzptL0BfVM
         5vXtt1t4YIQvs+3wjlOTv/xQ+5CYvbdbAR+y5xKKM2DpYEBN8eXLCdbzvb7uYc69vDez
         kp5hFnN7eP7o+kYaZgTgF+U0n2lDJFPIqgciSBzcq/brfU4mi/BJR4aoxFKMnj85zcQB
         uweCQ5dOWMhQLC/WIHDoby2WXlQgFwTX4KuXnKud4FvK5BOoZxd03dUVnZK73kTqE1/M
         bY+DHuHHHdwTVuXCuDZtIl7sXik/ukOP1nH5v59HbPm7+IzVX8WGUPWHDYpnknQJzUwl
         vgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705248831; x=1705853631;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnkq2UkgPpVsEo47nILwi/m7D73qWwB4CzFMK6Ortrw=;
        b=kh3C8pBkhBPSQe6w1pWF9RAjQta7S/a/TbCAhzxCDN/XzZvpXyiZ13gFb1U6Up9uTL
         2p6+zOqTM2Pdy4+Y2mmeWH3sV0aymXJOU7Sjy1AlDaX6T3yWWiv1zdlltVdrvStc6Wcn
         ygbSuF9ZY1pwx+HYYjSWBSyfgidHMrB/nIJmXToq9Z/0jMbCrjaZlx0cWP6ETjOdAFi9
         Us4qRAFH5aimJKNRMZC37Eq3hcXpeCo8Kb7eNSpyrfb2djAO/GQKroC/JiLikJiHwrqE
         0BjwiqhEOxoF7ibwSpLq3qdIp6xEHT52CAmWthyPYfGZGfwHrs+dca9OUwBPYDXfAX3I
         jnuQ==
X-Gm-Message-State: AOJu0Yy/tsCCT4phnwa5fUowwCWEQ4CQgWvRqLWWugGvS/IRHDIAztJ8
	v/qOqNI4HCBvP67RmRfZgJx4v74/sWiLkw==
X-Google-Smtp-Source: AGHT+IF5m2DAEY26RamFHE/RDILSrRoXqn+NXcQBtc0X9MyybfSFoA+02oJOWrUK/+mSZShCljgbVA==
X-Received: by 2002:adf:eacc:0:b0:337:62ca:7f2e with SMTP id o12-20020adfeacc000000b0033762ca7f2emr2727073wrn.93.1705248830746;
        Sun, 14 Jan 2024 08:13:50 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id e19-20020a5d5953000000b0033609b71825sm9451486wri.35.2024.01.14.08.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jan 2024 08:13:50 -0800 (PST)
Message-ID: <66aa917e-d1dd-497a-ab06-6577c8256e13@linaro.org>
Date: Sun, 14 Jan 2024 16:13:49 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] usb: typec: qcom-pmic-typec: fix arguments of
 qcom_pmic_typec_pdphy_set_roles
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-6-182d9aa0a5b3@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-6-182d9aa0a5b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/01/2024 20:55, Dmitry Baryshkov wrote:
> +				 (data_role == TYPEC_HOST ? MSG_CONFIG_PORT_DATA_ROLE : 0) |
> +				 (power_role == TYPEC_SOURCE ? MSG_CONFIG_PORT_POWER_ROLE : 0));

Not a big fan of this syntax but... its fine too

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

