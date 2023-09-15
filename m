Return-Path: <linux-usb+bounces-133-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5F17A1C31
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 12:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7609D1C21658
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 10:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55E1FC15;
	Fri, 15 Sep 2023 10:24:00 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C83FC05
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 10:23:58 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A615130EC
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 03:23:21 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so2436283a12.0
        for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 03:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694773400; x=1695378200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZU4AuTd77SCi2z8SlZIHecF6Q/OBga20jXZU+Tyw7RM=;
        b=T+ArXf90tZNK6WJAB/Arf6yieCKcCF0mVThlCkVvgBzgPsSl6Y/1agYxy8iGFUwPaZ
         NeaMIero5ajJK3OD72L2C9rxVpcDMn7CVUc1y/0lb9TrQxIHE5T/Bl0nve5QTzJ2uCmh
         DTVEZxeFsejwAMOaY2ycjJTv7OaniPmTfllcmEfwfR49pGoctK3vN8eXAyzWMw5ioyPM
         2uEbl4iuW2GL+vwJDph5oSzEUDfghLO/XfLpea0Ybq+qYGQ6Sg5NBKasuH92WqUlYgdz
         IQDDOi3FzdVm/HND7pnIl4MVO+NPgp1WHW6ovHZCEov+693P72TDEokX9/jOBhzgM+qW
         55Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694773400; x=1695378200;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZU4AuTd77SCi2z8SlZIHecF6Q/OBga20jXZU+Tyw7RM=;
        b=PtUKFjbW279Fiac7PdmUoistItzELBkyp2zo76ESUOHGFJ78bD2crJyV1TcXt3ObJO
         xP1v4oZI+IMIlkjjZ3NJdD44QXufjyFhP7Rzo/QiVNE28MD2LbA66fMtMV7uRorFyyG3
         41W2ybDUS5IOXTrut8stAWn55lleuf7QT3FHvIldkRPFW7LGfPp30pmVsNzMenHorh6F
         FW+2bIavb+k2BQ5Kk7pL7lIqvWxdxCYlYScamG5FwJwFCAkj1R+WMBWmnSs43vQqt2dc
         GS4mCECvjOP8zMo3AfZYoPtzpkava/pCKIRspWOmrro5v5q2CAelTzKRfUv5DW+6bYs4
         bqew==
X-Gm-Message-State: AOJu0YyBWmFG2KKQrtrehlRcKySP+E0uMhb9TGUNoKT9jkZy2ivGv5h2
	GEAWIpMEdr0MPKuDj6iYxpNAKQ==
X-Google-Smtp-Source: AGHT+IHd2NUDtrOHeXSqw9jdD6L2t5IYy7aq0QEiscLzMW/L1cneK//YI9eejtz2lfL2eEwyr27C6w==
X-Received: by 2002:a17:906:74d5:b0:99c:5056:4e2e with SMTP id z21-20020a17090674d500b0099c50564e2emr951471ejl.31.1694773399810;
        Fri, 15 Sep 2023 03:23:19 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j21-20020a170906831500b009ad87d1be17sm2211358ejx.22.2023.09.15.03.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 03:23:19 -0700 (PDT)
Message-ID: <a711407d-4419-4b75-99db-b8461b3bbdfe@linaro.org>
Date: Fri, 15 Sep 2023 11:23:17 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: typec: tps6598x: add reset gpio support
Content-Language: en-US
To: Javier Carrasco <javier.carrasco@wolfvision.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230912-topic-tps6598x_reset-v1-0-78dc0bf61790@wolfvision.net>
 <20230912-topic-tps6598x_reset-v1-1-78dc0bf61790@wolfvision.net>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230912-topic-tps6598x_reset-v1-1-78dc0bf61790@wolfvision.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 15/09/2023 07:50, Javier Carrasco wrote:
> The TPS6598x PD controller provides an active-high hardware reset input
> that reinitializes all device settings. If it is not grounded by
> design, the driver must be able to de-assert it in order to initialize
> the device.
> 
> The PD controller is not ready for registration right after the reset
> de-assertion and a delay must be introduced in that case. According to
> TI, the delay can reach up to 1000 ms [1], which is in line with the
> experimental results obtained with a TPS65987D.
> 
> Add a GPIO descriptor for the reset signal and basic reset management
> for initialization and suspend/resume.
> 
> [1] https://e2e.ti.com/support/power-management-group/power-management/
> f/power-management-forum/1269856/tps65987d-tps65987d-reset-de-assert-
> to-normal-operation/4809389#4809389
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


