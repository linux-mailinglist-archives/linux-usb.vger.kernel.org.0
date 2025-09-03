Return-Path: <linux-usb+bounces-27487-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BE7B418A2
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 10:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 966101756A6
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 08:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1D62E3B15;
	Wed,  3 Sep 2025 08:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gOidAohS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F702C1591
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 08:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756888427; cv=none; b=m1gpP4QbsfFU7jwGEczi4YFIKYejB4PlTyWw6LQFjGNI/P/jAB/thmL4yoB0XCBZCw31fLVS7vI2Oj6oe9Vo2YcUEJmFiXYIZwWHjHUhSAjs5pFzl22BZacLWL1WYdJ+BMWipx7HvQBkDz4Xiqy+yag00/93NGtURJNmsoDTRGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756888427; c=relaxed/simple;
	bh=5JjXs/rejxxYrw6K8OJPrjT2P7IUPezcjLzaibZ5qlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LY05een0Si4mPAZ4sKStdsGt4k8/WrEfxgM8Y1mfNaVehSddjjpfrSVNU2pjrMvZCrWOgWpRVXhrN8uVCgg/i5S8WqEvpDsWHyi4chuyIMvAk9Pi0Sq/vlCGICEdKsqTNocftx3nVm6pRHyEHAuo7awBHOppoAwZgLfeG89V6aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gOidAohS; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b04260d72bfso51149966b.3
        for <linux-usb@vger.kernel.org>; Wed, 03 Sep 2025 01:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756888423; x=1757493223; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ACBHr8NfKb4KEMutVyQMnq5jr9ymWyUyWjylgBNBrHc=;
        b=gOidAohSTiPc9mN1S0UtZnAFc/qAFHNGn3ZPrgr24p5X31Kwb2QovDMwl6JMkJcRQp
         uNXf+opW2RpV4khHvZLN61PVoB3JnMs2nL2+T9H9lIE4IiR5RtgtgQy6N+tsIytAfXqP
         HNnnXISNSAGAZdVSQAi/Qi2cO2P78a4AVpCE2CPCN57FdzG+YHCDOy7mGKbupeGyFhpX
         KylEENeHmxbxhc68thnVjy8s52DHIpsoSZYgfst5pgTkJeXl/mUtjQBrjt33tFF0BfTV
         OoyG1LTDM/AD4MEA9Y2sQD9kZrhnz4GSE4rTSBluPG++kjYCTQhXvTIeNSEfgLKx613S
         JRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756888423; x=1757493223;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ACBHr8NfKb4KEMutVyQMnq5jr9ymWyUyWjylgBNBrHc=;
        b=ewlGBD6l8b304o+teyz25YC3fyGlUJa7pbnrlMxs7ov8VvY6vDmSeCjcNYk7cHA/MA
         2ORyoNu9v0GB6lMnM0o1Xzj595nSib24tURjWaZ2s+Cz3dCcbwBpCy1+6eAdXaE2jQ3w
         9EH++iXvNBQnLPtvl77lXU1a6mR9Rx0FImo/n0lnXCAWmEjzVMAy82oYUXi8lqeaM/1T
         xYWdvqYY9Z/kw1dxByL0H2115FIZYTxW8J3uZ9ffjMXED1yeFqctN9+CXo0mZ4qnKzVJ
         9/8pUYRAPXRSEWhJ4ntV3v3sTKQ08e3oP6qSuzNm5DLxw79LZBBM3YcFVKB/XM7oZOg0
         iLhw==
X-Gm-Message-State: AOJu0YzuvViglVXZC/MR5UDdI0c3cr7eKFDVKvRFsd5GynMY0ScCHIU7
	R8r4PPBCYZpD/IbPVhc88gXLadw459GHe6yBT+Z0c+pSSP7kAz+qihdG94KBXERXnlA=
X-Gm-Gg: ASbGncsCbUK0nPWuTzLyNsPdXhcutIj8D38FB5N37z+uKaazNVdD4cmFI0Uz+k8fbFc
	AanhmjoZYs13nW0B7/MQImjOLu/COR2e28MZOWQ+CvM77y4l0McHWjy0JR5NMjO+Cc9PKsve8Lt
	O42hvZd5rExQkcr2ngpzhL3wMqCN3z59xLcKizjRdRKL3ygpiYepijKS6mwYuJCh7uQ9gnMeQH2
	Vrz20e2kvmLgTC33ElHQRSKsWvgfpb6qk5dtWVj10uU+xC182rq1hnoYY+yyP1GI94Uk6s5CFQa
	OPbS6bfbM5S8eHyARWYfwSP+t+aaiqqOPLgFJQmxC5XUSAv9SAvOS8nD2simXNSQt9FKlNVRF8g
	4V7DF3jp71iuBNBKsdfXyOVeQsW+Rn0t1i65EOtos37Y=
X-Google-Smtp-Source: AGHT+IEh6tjHeFfJIDCd8AKcwONOhnH25T4xzmJnYzxd49mM1RN2+9yjvTmGddLtFB3bt6z3KxaSrw==
X-Received: by 2002:a05:6402:2105:b0:61c:1bb3:2473 with SMTP id 4fb4d7f45d1cf-61cfe999d10mr9232214a12.3.1756888423438;
        Wed, 03 Sep 2025 01:33:43 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc231561sm11146936a12.23.2025.09.03.01.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 01:33:42 -0700 (PDT)
Message-ID: <b50f9d10-88a3-4b1c-a75e-6c67b9d1504c@linaro.org>
Date: Wed, 3 Sep 2025 10:33:41 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: f_ecm: Fix ecm_opts->bound logic in bind
 path
To: Kuen-Han Tsai <khtsai@google.com>, gregkh@linuxfoundation.org,
 prashanth.k@oss.qualcomm.com, Thinh.Nguyen@synopsys.com,
 s.hauer@pengutronix.de
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org
References: <20250903083017.795065-1-khtsai@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250903083017.795065-1-khtsai@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/09/2025 10:30, Kuen-Han Tsai wrote:
> The bound flag in ecm_opts is being set to true even if
> gether_register_netdev() failed.
> 
> Set ecm_opts->bound to true only upon success.
> 
> Fixes: d65e6b6e884a ("usb: gadget: f_ecm: Always set current gadget in ecm_bind()")
> Cc: stable@kernel.org
> Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> ---
>  drivers/usb/gadget/function/f_ecm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
> index 027226325039..9f5ed6f32a62 100644
> --- a/drivers/usb/gadget/function/f_ecm.c
> +++ b/drivers/usb/gadget/function/f_ecm.c
> @@ -690,13 +690,14 @@ ecm_bind(struct usb_configuration *c, struct usb_function *f)
>  
>  	if (!ecm_opts->bound) {
>  		status = gether_register_netdev(ecm_opts->net);
> -		ecm_opts->bound = true;
>  	}
>  
>  	mutex_unlock(&ecm_opts->lock);
>  	if (status)
>  		return status;
>  
> +	ecm_opts->bound = true;

Now it is outside of mutex, so this is raising questions you should have
answered in commit msg.

Best regards,
Krzysztof

