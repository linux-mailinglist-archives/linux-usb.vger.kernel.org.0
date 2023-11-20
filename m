Return-Path: <linux-usb+bounces-3012-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E597F0F3C
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 10:40:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2C141F230B3
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 09:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD9211C95;
	Mon, 20 Nov 2023 09:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tnKBTdqT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C468FFB
	for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 01:40:11 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9dbb3e0ff65so553329366b.1
        for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 01:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700473210; x=1701078010; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CV6jnuj0MIJn5B1cSBOWhgza7MPZBJRiYSVUNCCfxoQ=;
        b=tnKBTdqTH2v5QIK/8edrvzQFZb8apHTEAfY+wELANUcP85EWRU6FKdoInsFm2HiZzc
         hEelushABY33DtQO5HoRg0ZZX+JwbKmXktlT3f7vYALWMk9An5kIE2MuVfRs0Qw2MugE
         tKdSBBmfJOVg5MBNV5SB1bqOmaRtqRgxnVgFvGAiIo5bE1lfarRG8ABSybfl7tJ+qp42
         BiGTMnip3Y0Bc/dZhDoQZzceWcblOysCuYe4/EeltHLTV4RomX7i7BQhXFymP89KP4ES
         0TnEP6BD7TL9DXRQqy4asHudx6ACdh5UiHwMOLlg4hnTyY456LTD5NmiXbHxCrvntYgX
         9/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700473210; x=1701078010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CV6jnuj0MIJn5B1cSBOWhgza7MPZBJRiYSVUNCCfxoQ=;
        b=G2Ay6d1b1fL1Wcfw9/vNQHbUBjYgvn/85nBJFj9UqZXSu4Ipjs/+dCWdiOaFCFxgo6
         7Yl784jx1erK8dN9i1/qYIMvFQMao1USAX7pu5BP1ksKO3Dzjo9lRJJa1m2QA/LrurQR
         aKBBQRZLNdcc+xf+edkCI7N7jLejnYZRVAbBOytBL7l99QWxLoqa54NgdS+ZoMFtK6x+
         qOsHm8rnB0012yNbKJh51Yj/Ic9fUAnvrWCKQ7N8JCTihXRCiUHAB2rtZpTpzAfsBNFP
         fc82dI7JstsXDgXjOIsTZDGdyfTt8IykloIme8jSwz2ftI+KB/qsfAqy9+blpXlVV3lr
         +4tw==
X-Gm-Message-State: AOJu0YxwUGlE1S6BPDVqeY6vO006uFgChBdEKHpdBpcY0WfM8xmq8OmM
	4nOpcK4J8ztF6Dq+t6XIwfuCj/3FrhO47QkCR/66jg==
X-Google-Smtp-Source: AGHT+IHpuPkkpzf6HvIRoyFCjRddB6IaTOcD9D4X7AuwnDGekaJENUnnI2Ieq7XREu67tB5Cf1SPCBLE6vU7Bq9YmRk=
X-Received: by 2002:a17:906:41:b0:9bf:6200:fe33 with SMTP id
 1-20020a170906004100b009bf6200fe33mr4386460ejg.16.1700473210292; Mon, 20 Nov
 2023 01:40:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231117173650.21161-1-johan+linaro@kernel.org> <20231117173650.21161-4-johan+linaro@kernel.org>
In-Reply-To: <20231117173650.21161-4-johan+linaro@kernel.org>
From: Shawn Guo <shawn.guo@linaro.org>
Date: Mon, 20 Nov 2023 17:39:59 +0800
Message-ID: <CAAQ0ZWTbAqnX2te5SEMT+q_FyHY5jopDciqF6sY7a9nr76f0QA@mail.gmail.com>
Subject: Re: [PATCH 3/3] USB: dwc3: qcom: fix ACPI platform device leak
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 18, 2023 at 1:38=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> Make sure to free the "urs" platform device, which is created for some
> ACPI platforms, on probe errors and on driver unbind.
>
> Compile-tested only.
>
> Fixes: c25c210f590e ("usb: dwc3: qcom: add URS Host support for sdm845 AC=
PI boot")
> Cc: Shawn Guo <shawn.guo@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Acked-by: Shawn Guo <shawn.guo@linaro.org>

