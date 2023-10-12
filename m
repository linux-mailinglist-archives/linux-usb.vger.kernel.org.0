Return-Path: <linux-usb+bounces-1515-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DDA7C7339
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 18:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 704CF1C2112E
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 16:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9988D20E5;
	Thu, 12 Oct 2023 16:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jh0kjXqU"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48524266C6
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 16:40:15 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 500FFCA
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 09:40:12 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c503da4fd6so973621fa.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 09:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697128810; x=1697733610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oWO94gUYYbgFYpZi/S4rt4kc1CR6230PtdfFhraso7w=;
        b=jh0kjXqUamh6aVpbk1nt+KzL0+z3CaCBqotLZcHybrKkrXG4iPdzoaoeURp5ztoz0g
         cJZy7zkEAPdNAS09oJL7dYzGUGcOhvmHqW/wv/9r1t7gElxFUmxorf7hu5SAjCFjrr36
         KTSDN00n+YAT4t7Oe+Qlhzcm+HfOo/yFQQNbi7M1ak1Qe+K1YiYnJLYyDeOHUI80rgJ+
         vRa9T+6EzrqAQZnci6qgGAyHsIDQB5lM0KIuVCMgGnxPOpyX8YPt01BwKcZs66hgl7jt
         V/APUJ4mRbcpWkl4IYzVhovlc6cgXGonaVPGjcYnrW78jGGctGbdZqhTmsnPcUxQ3ify
         askQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697128810; x=1697733610;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oWO94gUYYbgFYpZi/S4rt4kc1CR6230PtdfFhraso7w=;
        b=VUP08n/lfo456TqaOUZUW+pMDnu4mraaK79kBIxMAReoKPyXnSobYmb/5kObBil3I9
         2C/gVqxSIhIC6QvfxO0LwQHcCPZdbs8CFNMKY7dnsZ+8CnH9Vcvpy6hPV9p5ynS8jl1B
         zS7eGkrtdenirL0LIaldw2TgcGDS/ruRCDmO4DhM5TvV5L46X6rC2chF0IsjfppVe1TB
         dtF8rRseX4dpmM4rebVaW8TmyDHJb75N9mq0676F3dsqNGa6cWTwFaQh10LivCPFt+xE
         r3wkb9IpWLIB1fU/a4kJF4J5XFSvZ4tJoByh0ul6AfKj5o3YizEFb0VgzFK/HgKl30Zo
         NdEA==
X-Gm-Message-State: AOJu0YzCI636A0fmKffWSBuaaC13JLg1IzGgfImwITubRXIPAttssWRS
	Kke015VJqKVXCJFaI4z2kvEq8g==
X-Google-Smtp-Source: AGHT+IEYH8hBoN/7cTp7puXpUYmr5Xg/tD8Pp3yR7oEc8+89bjqPg5QHPIIa55HkW5/PuUtCf0tgsQ==
X-Received: by 2002:a2e:7c15:0:b0:2b6:e2e4:7d9a with SMTP id x21-20020a2e7c15000000b002b6e2e47d9amr22634688ljc.38.1697128810439;
        Thu, 12 Oct 2023 09:40:10 -0700 (PDT)
Received: from [172.30.204.175] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id p9-20020a2e7409000000b002bfe8537f37sm3633373ljc.33.2023.10.12.09.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 09:40:10 -0700 (PDT)
Message-ID: <467dd1cc-64af-43d7-93ca-be28043e2765@linaro.org>
Date: Thu, 12 Oct 2023 18:40:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 08/10] arm64: dts: qcom: sc8280xp: Add multiport
 controller node for SC8280
Content-Language: en-US
To: Krishna Kurapati <quic_kriskura@quicinc.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Felipe Balbi <balbi@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com, quic_jackp@quicinc.com,
 ahalaney@redhat.com, quic_shazhuss@quicinc.com
References: <20231007154806.605-1-quic_kriskura@quicinc.com>
 <20231007154806.605-9-quic_kriskura@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231007154806.605-9-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 10/7/23 17:48, Krishna Kurapati wrote:
> Add USB and DWC3 node for tertiary port of SC8280 along with multiport
> IRQ's and phy's. This will be used as a base for SA8295P and SA8295-Ride
> platforms.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
[...]

> +
> +			interconnects = <&aggre1_noc MASTER_USB3_MP 0 &mc_virt SLAVE_EBI1 0>,
> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_MP 0>;
Please use QCOM_ICC_TAG_ALWAYS from 
include/dt-bindings/interconnect/qcom,icc.h (like in sa8775p)

With that I think it's good to go :)

Konrad

