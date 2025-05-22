Return-Path: <linux-usb+bounces-24229-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CEBAC0B93
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 14:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 561A41BC60B3
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 12:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B054828AAFB;
	Thu, 22 May 2025 12:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F7GLlyr3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76453268682
	for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 12:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747916722; cv=none; b=sbrB2uPXz2ZR8tD/McY2t8sD6qVqA7KhDRfpx56Ptv72Pt29qMZqumMXavY6/ZmaDr27/QaY2cBntKtrtgaC73+pYxCYoTiF14wla9kP+NfLKAJU7HNP7o9UGQnTAmNsQ6PepJI0VyzB3kG+llkzzWxtzhKmibilFDvd/TDOBvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747916722; c=relaxed/simple;
	bh=sFWdLCw1yS6Oixnql//xrLxtUNnFBMyddbYGl5qZkwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QiZujMXlbvVlXLZ0VwvtIc4+8W38hcHh6VfLbhIIC9XBD5G33viWVuPo1Nw1r7ri4oTaVOHojHbNSyfuoRpBMiSojlsM157k1xN83D5TuNT6KpIGZ56dO/BVXB0+fcka715PQlnb/Qrgvs5Qp0Re958LrVH1YWlZIh6i0+EJqOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F7GLlyr3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso1417634066b.0
        for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 05:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747916719; x=1748521519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WZuijAJRPJZ+p2n09IvIvH7D3TfvZOkc/364B+Mx6Yg=;
        b=F7GLlyr3J8I40iVu60gieSuE6EbHSf5P8bEd5b9y7xNgXExSYfOww2aW2J4RyX+UQW
         VfNRN/kQ60w1uGwoGxbnXJx91atiOkfRB4dzfd/18P9SbuTQ6EAoEcDFxUzTuZ6q7TmW
         CARzeBbGxoe1r6zaGr79btguMPIhjLV1mvSqUh6GVD2eKO+x0csYVWSlQDGwXl4p4zOm
         a0u2hENVBcZLDU/qBXzcLn6hR3Vikxo0IeqqEp+A8Muwxvb9x9LoLVWpC89FE+Gu7pGj
         Tqq/jtwVGaTKlTqGrC+olkjp2EYfHXdeEbaNpuzkbq0cxv8AjEyks1Q42+2VkZipNHDe
         IItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747916719; x=1748521519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZuijAJRPJZ+p2n09IvIvH7D3TfvZOkc/364B+Mx6Yg=;
        b=td3ibe8qR+bqyDNuB2PZ6E21OVYTmRsKfiPQijGaCZNomP9dgZwoksfYnbSWpOdRdh
         UYcrVLontXHoBpxV8GpWZTzIOJDTZgU078PNdsYBe8wD7I63cjQTkFJCKxoc0yblRCXB
         F53n3ffuiStHi8yepX3Pf3kYgFNfPws2qEGVC/ubff3TzH0zt7iTxOCP61+yY8hacWe7
         6PcxdvYhHLjrx9Y5NbD1ptbVcE+ieXfKrVQODnjL7jPPlYpQc43niJY6tTGvsPHvvbmF
         74kGQx0sC5sQuuJDqnfVwJFLfhbOnesBtAE1Bi1kReSCPJSCZxXHpOS++7AUclrC5aPW
         96yw==
X-Forwarded-Encrypted: i=1; AJvYcCVwfyYQ1ZrkftfIcncKb++eYv4xCxPaqYe5tK2tsA+DnRZKvGWNvAyn7f5H118dmJV0aLprqxXBJ6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGyE/o16aT254OKTx9c6VZtRcx6SA88orRvUww4IlvZBE0c50l
	uSDpgPZHhf0FO2U5Om+s3m5uZ5jg07+g2j9LKyF9v6GiMyeQjz+dSQ0gYtTKL5V5XXM=
X-Gm-Gg: ASbGncswhGW0xu5Km0qDjZ27Z35AI+HfGLv10maNAkVEK16/zlvQb/XtPEpsg8lznzh
	Hukqv1JIkBbhQDqVx9cg4E8C4kA1E1pyssEMIetODYJqMKMbshMhk1yV5A0GoeCOwmQ5ogaX0/u
	YyYE5voNSPROek5F+/fpCnCRUlD8/xt9hkEhTk+0alm6ZKKzU0iM9VrOKxBTflMetrTXa/B1ZAE
	U12sg+X7Oe8Rgg9lXo9mDXy4uhCJicnhoPKQVAXJ2coQKPCyizJbE7MB6Asx1Hf7RJqpyAouZPI
	3Qwl0/GFb4Oq2v/ErUzquK6PqoK3W4uhxPWu19ggPyJmnpay
X-Google-Smtp-Source: AGHT+IHcT2PY89g15o0bxhhQt0NPg7NGUlq73S+uSn8e6SJg6l2RRfQQixZwQtfKRbnT5KPfhf/pwg==
X-Received: by 2002:a17:907:8690:b0:ad5:4fdb:a2d6 with SMTP id a640c23a62f3a-ad54fdbb14fmr1991573666b.43.1747916718712;
        Thu, 22 May 2025 05:25:18 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4ea7b7sm1081211266b.177.2025.05.22.05.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:25:17 -0700 (PDT)
Date: Thu, 22 May 2025 15:25:15 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <aC8Xq949p6NNDXa7@linaro.org>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-6-25c79ed01d02@oss.qualcomm.com>
 <aAswZg9s41s/m/se@linaro.org>
 <f7de2bbc-4925-430c-b263-226a633e4bfb@kernel.org>
 <CAO9ioeXzzSBy+wYFATeckKZ2641GaTA1dB_1HOb238DdB7ACoQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9ioeXzzSBy+wYFATeckKZ2641GaTA1dB_1HOb238DdB7ACoQ@mail.gmail.com>

On 25-05-22 15:18:00, Dmitry Baryshkov wrote:
> On Thu, 22 May 2025 at 14:05, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 25/04/2025 08:49, Abel Vesa wrote:
> > > On 25-04-21 15:00:13, Melody Olvera wrote:
> > >> From: Wesley Cheng <quic_wcheng@quicinc.com>
> > >>
> > >> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
> > >
> > > Nitpick: Drop the double space from the beginning of each phrase.
> >
> > Sorry, but why? That's a correct grammar.
> 
> 
> Being absolutely nitpicky, this depends on the country. In some cases
> (US) typography settled on using double space after full-stop. In
> other cases it's a normal space.

Okay then. Please ignore my comment.

> 
> 
> -- 
> With best wishes
> Dmitry
> 

