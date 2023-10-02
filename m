Return-Path: <linux-usb+bounces-961-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D877B58BA
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 19:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 9F562283909
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 17:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3751E50B;
	Mon,  2 Oct 2023 17:26:34 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A9F1A73C
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 17:26:33 +0000 (UTC)
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0EEB8
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 10:26:31 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d81f35511e6so4204155276.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Oct 2023 10:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696267591; x=1696872391; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cWIcP9wX0mT1aYX41AeZZPoQ0U59y7qnUZSn5QwnCXg=;
        b=KpBC4mKlNPmqoL/3NXbFUrF4WjyZoOQuqaPC2/NtMWHZcdum1LR2u1PN5anOAr2K0F
         DH/bacF/gV15eYLhZqzVsTMzyKuFUsGrbdykJOVN9z3e4VeTGq/1K59fzcwd85aD1bPu
         a1dW4y1ithLa3Y2gICai9X1bDfRuRJwqPafrnmrtBVWG6RQzPvELXet88ZZhRuO0/QPn
         EHxEk8310syqMqvtOzVz8s9OwBxXGQJP4s/BaDd+dlMe451r/325mERSLFuGACZ3XzNi
         QetBsB4U4vgQGLlRSOPUv3nfFjON4u9asyRXMrT8Psxo+/4vjbr6uxB+D10u7qH1vrIN
         7Vxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696267591; x=1696872391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWIcP9wX0mT1aYX41AeZZPoQ0U59y7qnUZSn5QwnCXg=;
        b=YxePdB2rQbCzAh/fwkge48mdJiq3KqXbSP2lzmG3fl+RipaVxpEjBVrIUXw8DGpQ9m
         mPUaYdevMAYKS58gnUavPI/4bfZN6TASmbHPZ1A4AgzFK6s6h358oFfa0z1G4KBm5rUb
         7DjIjiXxT8pSALLuRLV5MAkqj/QRqJvPjdlXmulHtTKSjGz/Hl3QmPqIziTeZiHP6RYU
         HuluGvpBXKpXcfqSJYrRlnM0Qd0k1xzQt0YL/A+hLUjOnxHJZq2iF/hJmNq0L/lMace9
         2ulc08uo/Mf7/yfEGiKpQpqq4gsgWbQ21BIM8KxXs8aUqHLdqFmlUtjH1Rc0Lo4uQ3i/
         CQIA==
X-Gm-Message-State: AOJu0Yx8IG3StnE8jGOFlyfSaYfBtphmIH5qQH4XuwjQV2jIgbBwakBR
	IyaYD5H0OwkWqqxijjmi1vGrzg+8X0Eqgw2ROaZXlg==
X-Google-Smtp-Source: AGHT+IFssR1DQ3n6Ot+X24EoXCpTIhEqGvK257G4k1IeGTBppDIe2H1NqvRflZMEtb/Ibet2AS3AiXbvBb2Iw7TdOb0=
X-Received: by 2002:a25:6903:0:b0:cb2:7e6:191c with SMTP id
 e3-20020a256903000000b00cb207e6191cmr287905ybc.20.1696267590732; Mon, 02 Oct
 2023 10:26:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231002-topic-sm8550-upstream-type-c-orientation-v2-0-125410d3ff95@linaro.org>
 <20231002-topic-sm8550-upstream-type-c-orientation-v2-2-125410d3ff95@linaro.org>
In-Reply-To: <20231002-topic-sm8550-upstream-type-c-orientation-v2-2-125410d3ff95@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 2 Oct 2023 20:26:19 +0300
Message-ID: <CAA8EJpp2_eW+YukTq3eAFGXxtZ+YWYVkzEP9Qhs20TxoXy-v7A@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] usb: ucsi: glink: use the connector orientation
 GPIO to provide switch events
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, 2 Oct 2023 at 13:21, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On SM8550, the non-altmode orientation is not given anymore within
> altmode events, even with USB SVIDs events.
>
> On the other side, the Type-C connector orientation is correctly
> reported by a signal from the PMIC.
>
> Take this gpio signal when we detect some Type-C port activity
> to notify any Type-C switches tied to the Type-C port connectors.

Have you checked, which UCSI version is implemented on SM8550?
Is there any chance of GET_CONNECTOR_STATUS / bit 86 actually
reflecting the correct orientation?

>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


-- 
With best wishes
Dmitry

