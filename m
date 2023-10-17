Return-Path: <linux-usb+bounces-1747-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5047CC867
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 18:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCC92B2108C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 16:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E212245F4A;
	Tue, 17 Oct 2023 16:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZsHDtaFC"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0956D45F62
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 16:08:15 +0000 (UTC)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA62F9
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 09:08:11 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c509d5ab43so60490881fa.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 09:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697558889; x=1698163689; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DXUVFLuGWe++aoZT0wJj36hT5pM9P4ypUZCtPuexOjw=;
        b=ZsHDtaFC4jqbz0k2U0XYVY5Ugpp5Vx3dNvixSgq2lGFIfQPjBFbCiOoSzDQZngWRjC
         iLlVME80l3QJ44TFlTbdlauMZiAVj2YnL5hHKO5RoEmcJVVXXj/6jd4HCkTJO1wd0dt6
         nC7Co9Qx9lxCQo6kR4kdu8Y88mwUvYSHMe7BPVx5L/P75YsNjNNOEc9mKRoALxR3N+zU
         zMeFgWpstfb2JdnpRghi6V8R5U+nWFn8v5fG/4hOQPIhTeZfonB0psIiqWHl6tIzMQQy
         fDePddXo4lpY7lOtxIftgZ90pDlhopfNKINi8I0Y7DheTEkldFdf6Qiv0fdellD2bSS4
         qcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697558889; x=1698163689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DXUVFLuGWe++aoZT0wJj36hT5pM9P4ypUZCtPuexOjw=;
        b=BspVq9ZY1xfDMUDXQezNlg4TL2akVU+Up39w66nHuTo58M5ZPRQb7+YRSwnsr/rCT3
         4ssd7ETBAO8pEilLE1PuctEz3LxJRiLG/VomsSRFZuusmvut0m3pZapK2deI32wnb6E/
         goDmMcKYz2X/fvL+s1nUKyytI4NIqZzT4YXmqFe+nt6s2qgmRqxMrCRiCkUjUtFDnML8
         zKvfre6t65oYOJ8IBWFZO86/Roz8lAa40B/26UWrVJbrfric/gAmF6PXs5TG/gWteHzr
         6+JFzY7pMBQW2s2fM6DdaG75LSU61R1LIRwkVqfa94lZsQPkeXDqS46w7kQTk+HbvVzO
         BMng==
X-Gm-Message-State: AOJu0Yz4bWGPRgSgXzS2AgFbYo9bUOXrhDBOlQLrXsm4wPskZxXwz9Dx
	uJBbh5sig+n0PGRE+aw17uxqHw==
X-Google-Smtp-Source: AGHT+IHh5FeDbyGyeVnlphOki8VZ9lFsnG2X0Mgs4+Vrv20Krkq5G5q3XcJAERLYzPkoSS+n65D84A==
X-Received: by 2002:a2e:a793:0:b0:2c5:409a:a901 with SMTP id c19-20020a2ea793000000b002c5409aa901mr754407ljf.49.1697558889419;
        Tue, 17 Oct 2023 09:08:09 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id l6-20020a2ea306000000b002c123b976acsm320345lje.76.2023.10.17.09.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 09:08:09 -0700 (PDT)
Message-ID: <e2e8c78a-98b2-42a9-a472-fe0c3332a2d7@linaro.org>
Date: Tue, 17 Oct 2023 18:08:05 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] usb: dwc3: qcom: Rename dwc3 platform_device
 reference
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Felipe Balbi <balbi@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>,
 Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
References: <20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com>
 <20231016-dwc3-refactor-v1-2-ab4a84165470@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231016-dwc3-refactor-v1-2-ab4a84165470@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 10/17/23 05:11, Bjorn Andersson wrote:
> In preparation for the introduction of a direct reference to the struct
> dwc3 in the dwc3_qcom struct, rename the generically named "dwc3" to
> reduce the risk for confusion.
> 
> No functional change.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

