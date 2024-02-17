Return-Path: <linux-usb+bounces-6664-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E20768591AA
	for <lists+linux-usb@lfdr.de>; Sat, 17 Feb 2024 19:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 208461C20E39
	for <lists+linux-usb@lfdr.de>; Sat, 17 Feb 2024 18:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697217E0F6;
	Sat, 17 Feb 2024 18:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uJowWFHS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FBB7D3F6
	for <linux-usb@vger.kernel.org>; Sat, 17 Feb 2024 18:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708193888; cv=none; b=Po/+de47SivGQyJBf8sAqzXFAeImEswAjHlNSWkiP1KtqATpVO1LbV26240f7Xsob/O5mv6YhAqzMJEIlnlg+A1quFOlYZrMcR5cTkUgelp1Vpvje9qozX4UevVeptc3lsTwr6izVQOFEohxW8IY5WW6AIzALFAuXqdaEHemWSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708193888; c=relaxed/simple;
	bh=Qzb3J1w292mYeic6Z5BobktYBhZzdTBYI73MRYlqTkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uje+BKWPQTVdv+5+GF8rPZQZCsu+I+F7AxCPifBM0b9lG2yEHC+Ha/iUTcfT8moMM2xuzoQxsJIQSACjutKsm7vbplRTonfSCb296Ex7iDD0A77Guokmhyh+fXsahdtvZxJcmj4JbqYmh9v+VJwUKQsXrUE4rR3ri8slyklKMYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uJowWFHS; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc742543119so1845979276.0
        for <linux-usb@vger.kernel.org>; Sat, 17 Feb 2024 10:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708193886; x=1708798686; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jbyO0DKsw6wXpJbxjwS7LuEbfeSrnfaky7pY4pa8Iro=;
        b=uJowWFHSJ1P2USUNXbh/zxGJ/QO55sPlMfi/4QkaKQLURCJgqMlbZJnwy2RryLTxWQ
         YrEe9z8OP+yYWARHRuCN+LS2m3hZn85H9SGmP3SLx89Cr+Pp4Hy514hsAoa4UX2Toh/O
         +ojjUSS1DX120V81zQC3xDlKz0CjRiNlEa8urvFtB15hoV0CUZDZMUhkSxkpIpWkiSPf
         EtU5D3Lzj0LKKc6PbmahFHMSxob0NocBjuYZwsi9sohSi4sHXJ2bV1KR6I1JCYrpdfNf
         kYAX/K6/5DL2KeWzlHsg21aAql8CD0uKFlnpplicBGJ/z7c3uv7osJ2cRDQprg5cfQbi
         ViZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708193886; x=1708798686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbyO0DKsw6wXpJbxjwS7LuEbfeSrnfaky7pY4pa8Iro=;
        b=weJ8InYBVYomojxwAxH68zvWMfCsJx/2pEWgED5oaZkbQo4O+3DrVycIIoBnNgI3dm
         8vkdQboesDqcePvWFiD37/uq3x+nwySEQ6RupGPCxxNlJtYSS6gb6BhnQAlsi2wqgz+7
         nTuWT/nrg90fX5BFlhYKoDc21DKB9DWPpOq4lm/yxs0aQPk0m/i4QsS5ERQ+71Zb4W/J
         szgc4a1DyZsUQUnOnawbAqVpfT6nVVO46G5/cbSFRbO/B3qDgV+nLGE3A6D2UhMjXvyw
         TW4qMqWsT7G6Bz9eYiBXa63DSsl4ev75SlBtQkDtdeJd7PxlFfOPCHTHruFsltBYHuSY
         5bgA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ1FanD3IgB6uJ/8XpYCGJ7PD5EyZt67BRkrj8BkOamq206BZ594fhlGOjeHLk/xnqkr8nFQ9HWqHbMfeDzVUCaCoOlCBcTQ+f
X-Gm-Message-State: AOJu0YxV0Ll3W/96ijNf8a+l7gNzSu3N+DJmNZZTagLrl/2/pH3+3o9x
	yZuvJky0omvzNEawaD9f7MtfwrBAmQzkl0iFf5t3fDQch+gxKHregU3xdBmmnGqKLc//8UZO0eJ
	w8dEmJCz8wfwLuaa5IKjpucFtLsN5RLAr6AAdBA==
X-Google-Smtp-Source: AGHT+IHR2aw5Fq9+f+b6J2C+oHZ3lJAwIW+/0JnzTfJsNAWuf5xhYkTrzi03iYoBr9x5+9kp7hFsJqSP9BmXYDW/Jdg=
X-Received: by 2002:a25:ac93:0:b0:dcc:2da:e44e with SMTP id
 x19-20020a25ac93000000b00dcc02dae44emr6454894ybi.61.1708193886191; Sat, 17
 Feb 2024 10:18:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217163201.32989-1-danila@jiaxyga.com> <20240217163201.32989-4-danila@jiaxyga.com>
In-Reply-To: <20240217163201.32989-4-danila@jiaxyga.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 17 Feb 2024 20:17:55 +0200
Message-ID: <CAA8EJpqRZiUU8fmGswwvegq3uTR_8RGu4L=LHiT5TRsShQHgWQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm6150: define USB-C related blocks
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, lgirdwood@gmail.com, 
	broonie@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, bryan.odonoghue@linaro.org, gregkh@linuxfoundation.org, 
	quic_wcheng@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Feb 2024 at 18:32, Danila Tikhonov <danila@jiaxyga.com> wrote:
>
> Define VBUS regulator and the Type-C handling block as present on the
> Quacomm PM6150 PMIC.
>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/pm6150.dtsi | 46 ++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)



-- 
With best wishes
Dmitry

