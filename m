Return-Path: <linux-usb+bounces-5110-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8686A82EF3D
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 13:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81D5D1C232F5
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 12:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22381BC30;
	Tue, 16 Jan 2024 12:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d6LCvaY4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7FD1BC35
	for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 12:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5f15a1052b3so89152847b3.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 04:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705409782; x=1706014582; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qPvAzx+acIKZbhCoWwT8OSWs5JRbg5iaUFTYttPLGXE=;
        b=d6LCvaY4SkmWU5YNL682LM4UXvW0vCI32O9aQZyCkR5s/MdxuPDmBk9EZxdKkVlBhD
         vOn/lyr8093oyg6qreV6CxiL1JOx3L4jmic5JJOQNgY79ChnZcV4vb3j+f5MvGzPd3bg
         V82PLm8HjmLDQVnyAoUDbCLYnrHc6x7FfhRhQaMHmQUYS1tyDc0MUe/UnYcomqq714vG
         nDhIXww8XOC9Me6A/ssHT/qe0w48T3ms0Fczclu1jEAZkBm8QGYOYQI6yhw/9+4uza7q
         pBzOzUpLuFeXolNL9uR9yexuYqUWyLpIm+jC7Gu5ehd33DQSR0J9Dtu4/e33GlplbAXK
         6WKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705409782; x=1706014582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPvAzx+acIKZbhCoWwT8OSWs5JRbg5iaUFTYttPLGXE=;
        b=gjIAi4EkiEVtu437Upteu6+JEn/GFGq0yMGtJ1CXLGYOThK3HB8vwlJjLGAeUgP/Ap
         ruWW/i72Q+bUPeLpPvOxmNABw7KUiWxmihOUfOJD7/spTJt7Vrg1Fxlft5NEPNEopvFy
         ErBzK8D8x0DZ+b3JQXZG4eC38UBp16OjuogUHgWxaK8k7uTvvd0DxXwS/P5h9ZinqUr9
         nlcf5woG7EDg/BHKqglRWGnb0qhxhNWFZ6ZmL18WYOPXCpBO1oy6ibenTHWaN2bt4jZ5
         mcAV/HExKDZ0LZhdPqVmbLBM/IPx5+iXgiMg3lGlTxSMjTBFccOSNNliRgqd4r2EWfXp
         MJ6Q==
X-Gm-Message-State: AOJu0YwiPa+YvE8fAxlYoh+s6VO24wU2sNrDaPbTZI1pFGgXAZWE95B0
	0AH4Jm4n1igoy/t514XM8CafRnhEKTbS/O12sV6IIIEoCAK2YA==
X-Google-Smtp-Source: AGHT+IGjE5GhtOos1P0amM4JQFu3eKw1tqmWIYnsnq3XqIvhlz9Y2t2oFk9YyYvvD1PT7sgkLdzkQK3eFQUVOOf4dFk=
X-Received: by 2002:a05:690c:b98:b0:5fc:d36f:b9a0 with SMTP id
 ck24-20020a05690c0b9800b005fcd36fb9a0mr2829729ywb.80.1705409781910; Tue, 16
 Jan 2024 04:56:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-9-182d9aa0a5b3@linaro.org> <2e07f014-0884-49ca-babd-b89cc90a16b7@linaro.org>
In-Reply-To: <2e07f014-0884-49ca-babd-b89cc90a16b7@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Jan 2024 14:56:11 +0200
Message-ID: <CAA8EJpqPqV_nHxxbo2Vzwcp__hvREjF3bhduGhM=7UpuOgBxTQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] usb: typec: qcom-pmic-typec: add support for
 PMI632 PMIC
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jan 2024 at 14:32, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 1/13/24 21:55, Dmitry Baryshkov wrote:
> > The PMI632 PMIC support Type-C port handling, but lacks USB
> > PowerDelivery support. The TCPM requires all callbacks to be provided
> > by the implementation. Implement a special, 'stub' Qcom PD PHY
> > implementation to enable the PMI632 support.
> >
> > Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Still not a fan of stubby stubs :/

Me too. If there are better suggestions, I'll be pleased to implement
them. Greg, Heikki?

-- 
With best wishes
Dmitry

