Return-Path: <linux-usb+bounces-10556-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC81C8CF15B
	for <lists+linux-usb@lfdr.de>; Sat, 25 May 2024 22:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47C181F2282D
	for <lists+linux-usb@lfdr.de>; Sat, 25 May 2024 20:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B83128834;
	Sat, 25 May 2024 20:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a1Zt9xuE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69E8127B75
	for <linux-usb@vger.kernel.org>; Sat, 25 May 2024 20:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716668249; cv=none; b=Fn7gRqAcmMGDPv6Kw9m/KKVQHxn6PChPeMRI9k82jxBSwe2j0jN+TXa2QudsFfCcZ3gg1CyiabeCVIPbT8EJxwqgYASc0AuGCTRxg50HYbIAgGt40O/68bQAn2k8nmoXQgXOwRH59gCeSX7mnv1FTFyox4bqcz203aBTeWzWst4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716668249; c=relaxed/simple;
	bh=QHSmgW7osBH+KHXlF1/WzNWwE9eqv8p67wUx/Ts4k+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LG4B4ji8Ikke15cvxuFS1Cpqgp6NRLAigTGjutMLZT19npp5WtnRH8mZA3TQVM6LNTBQVYnKFWJ5uRlS0aWP1BsXaKnmXcnab9HRhVGixEXUWXZWWvFMI6Zgozy1hnhklrYnPVbxl/+9GvlpiBjqj5ESTle1LA5oMry29wRvGBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a1Zt9xuE; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e724bc46c4so76648791fa.2
        for <linux-usb@vger.kernel.org>; Sat, 25 May 2024 13:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716668245; x=1717273045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eqkkaAhB5zodAiahm8ADezWoNphieJvlbxZ1nCfU3mY=;
        b=a1Zt9xuEhGY7mqVaV75M8sfydzfi2SwzfyQu9V/3H2laKtqxUCcXbjmAQsQK2qLHQs
         HZRqG2EWtd7oPS+8Q15rOnmICwsj2Gr2ZNaTXzQ1l5r9FKXgrwEoovEeV7pDHTR4j+dX
         /USe3NPzsI0SsQU8w/AYgQW9Wwzhvy+j2rXwnQoXNpRV5tlPtEFDPRO9fhuPS9Jr03Mh
         K/iTKymmjHGFzm3Qd0eXV0y4DXy+Dkp2KjPg/lqOCPPW9oj8dIuhed53nM1tZMtJo5Ns
         9wO0v2E12NXjEqZlW8dT3tPza2BieAlGrb7SJCV7OqMGfaWzg8OuHeAcfavU3i2nYspv
         pdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716668245; x=1717273045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqkkaAhB5zodAiahm8ADezWoNphieJvlbxZ1nCfU3mY=;
        b=BjxxwI1cICpQQz+7xNdvQKeNqxr6tLUNI/oG9P4QwDeEFgnXHYo70HETGZ5QIQFRZh
         oUJRerG6vpim+zlFSLEnHiL8lxHwOSeMWEHJJAPaD6bmwTyC/UjB6lteF9Dttl4qZTYZ
         UkU0P1XJMxMy/iKopI5ye/KUHhBYWL1B5PNquWGWuHs12eQFgoZ3o/fk27ehZlApEXrW
         pyZD2EL4HO3Elf9OCzaEghSrBzDqjhjU8VCca/nG/rXZQN8Qao/blq5kpx7uWn6PvE0C
         dbiKjjsUnl9JqzPI3vHrgeL70fWKbhkiYtrQ2WqOy79I36THFgcLRMOykJTk13EVMENi
         dheg==
X-Forwarded-Encrypted: i=1; AJvYcCVuq6SYqLU/R07ZL/lrSt3UM+CM/SlKHUEuKJ9Z+qpwI+3lnSEuEOsmUwSoDLj8/eKNd8+zDBp+devufW8UrB7n0EYYSGIpVU8G
X-Gm-Message-State: AOJu0Yynpch+ChbU/LTAyAN7MxUc2swf7XIBKDotCbALRIe/qd6fmlYt
	VMiZBr+nBFuuBob0stro0F1rNi5QTyR0NPvr5O9G++XYu1a+Rn1zvS8DCb1hvTA=
X-Google-Smtp-Source: AGHT+IHXljxuGalAvmyjvzrcNfI1wbojmx0iYFgMUe8hBfLdt+A/BD1AGKqWABqy13mTAz406l/ehQ==
X-Received: by 2002:a2e:a178:0:b0:2e2:1a8b:e2f with SMTP id 38308e7fff4ca-2e95b0bcf29mr34404251fa.2.1716668245179;
        Sat, 25 May 2024 13:17:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcf4bdfsm8686871fa.63.2024.05.25.13.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 13:17:24 -0700 (PDT)
Date: Sat, 25 May 2024 23:17:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 10/10] arm64: dts: qcom: sc8180x-lenovo-flex-5g: Enable
 USB multiport controller
Message-ID: <dazmvgycbywpsbgtrnhi4hv3jgi6lt7dpws4gn2du7z4q4ygr2@ph44udnljkhr>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
 <20240525-sc8180x-usb-mp-v1-10-60a904392438@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240525-sc8180x-usb-mp-v1-10-60a904392438@quicinc.com>

On Sat, May 25, 2024 at 11:04:03AM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The Lenovo Flex 5G has a camera attached to the multiport USB
> controller, enable the controller and the four phys to enable this.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry

