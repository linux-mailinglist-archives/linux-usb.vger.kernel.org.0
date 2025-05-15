Return-Path: <linux-usb+bounces-23972-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBC1AB82AF
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 11:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECBED189408B
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 09:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC397296FC5;
	Thu, 15 May 2025 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bLTfuhwU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4991E990B
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 09:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747301507; cv=none; b=InM97CS68zvCzLCZfGKobZHuuict5gkz8dephDZQD42iT5q4G/QKtS3FV0JAQSz1YwfInZ+cLvoh39NotgOhraygw/0r1VE6FXJ9QLPEu/9AQkrMFtGs5TdAZSrF8BB/O+MnFACxmgb7ClcrsthmzUFfd1DZKDvV555IhucAV48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747301507; c=relaxed/simple;
	bh=YcwcSP4GpUhbon0JNK8WVl9Ad7krJOLYr8vo8j/dyfA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=ub8YpO/JvWulndoAdkFaN/eeM3YfGucMCUbObUOeyWLI57PV4oWO8tHjIY5/Bz7eMLIQG86eut4utkSOR+5HteO0bu+AkTd+Pf6ooVIKvcMf45DXn9cfvKVz7r7IXOTA/WGT0OvqiM/HgM7Hg/8iNUX6NMiSz4yPfSMUxXMeddY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=bLTfuhwU; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250515093143epoutp02a01fe887f2129584ad9b1f91e3718775~-qXXIHv_c0928909289epoutp02a
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 09:31:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250515093143epoutp02a01fe887f2129584ad9b1f91e3718775~-qXXIHv_c0928909289epoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747301503;
	bh=P5VLAojzpnIxDBE6zPAULs5TyBvsQa4MKoJmkjGV5zA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=bLTfuhwUoi/ZOLE1iXg+ioM4p54mZsCMui4ElYk/ZqXxGrIR6KbgqLLl2whkcHo7A
	 E8qrxu7SmfAVCZ6Ha+lEnud404Fk4TPK3QGdQQDa+w+aCYQjA8yAoREeppZ54DEHFk
	 hChpcvRxgG+pWvvDL6AkdAaODuWtaDqmYcPH0Jks=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250515093143epcas5p2409f7bc212f1f6c8fbe25b72f73f6208~-qXWuzwPM1138511385epcas5p2Q;
	Thu, 15 May 2025 09:31:43 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.177]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZylMx0zR3z3hhT8; Thu, 15 May
	2025 09:31:41 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250515093140epcas5p1c735205578916f52954430b1db18f5e2~-qXUKreQ80539905399epcas5p18;
	Thu, 15 May 2025 09:31:40 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250515093140epsmtrp2e3c56fd7433b4343ddad05abbccc6505~-qXUJ1cDK2264422644epsmtrp2G;
	Thu, 15 May 2025 09:31:40 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-78-6825b47c083d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	23.34.19478.C74B5286; Thu, 15 May 2025 18:31:40 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250515093138epsmtip21ebcf2ce07b9046da78413250900fa0d~-qXR--lqR0096500965epsmtip2y;
	Thu, 15 May 2025 09:31:38 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Pritam Manohar Sutar'" <pritam.sutar@samsung.com>,
	<gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>, <faraz.ata@samsung.com>,
	<muhammed.ali@samsung.com>, <selvarasu.g@samsung.com>
In-Reply-To: <20250514140741.415981-2-pritam.sutar@samsung.com>
Subject: RE: [PATCH 1/2] dt-bindings: usb: samsung,exynos-dwc3: add
 dt-schema ExynosAutov920
Date: Thu, 15 May 2025 15:01:37 +0530
Message-ID: <0efe01dbc57c$29955270$7cbff750$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHb4atmIwpdDAkGWt442tTNHGskkAKMImHcAsHMHkuzqMU0AA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRmVeSWpSXmKPExsWy7bCSvG7NFtUMg9V9shZr9p5jsri3Yxm7
	xfwj51gtrt1YyG7RvHg9m8XLWffYLDY9vsZqcXnXHDaLGef3MVksWtbKbHH+RRerxbN7K9gs
	/u/ZwW7x5ecDZosjyz8yWaxacIDdQcBj06pONo/9c9ewe2xeUu/Rt2UVo8eW/Z8ZPT5vkgtg
	i+KySUnNySxLLdK3S+DKOP5Zu2ASe0XDqj7mBsZFbF2MnBwSAiYSOyf/Zu9i5OIQEtjOKLF8
	0nlGiIS0xPWNE9ghbGGJlf+eQxU9Z5R4cucpWBGbgK7EjsVtbCAJEYE9jBIdCx8ygjjMAvuZ
	JKb9XsYE0XKYUeLO5vssIC2cAvYSP66dAlsuLBAj0XJuOhOIzSKgKjG56STYWF4BS4mFR9vY
	IGxBiZMzn4D1MgtoS/Q+bGWEsOUltr+dwwxxn4LEz6fLWEFsEQEniTP7+lkhasQlXh49wj6B
	UXgWklGzkIyahWTULCQtCxhZVjGKphYU56bnJhcY6hUn5haX5qXrJefnbmIER6tW0A7GZev/
	6h1iZOJgPMQowcGsJMJ7PUs5Q4g3JbGyKrUoP76oNCe1+BCjNAeLkjivck5nipBAemJJanZq
	akFqEUyWiYNTqoFpcS+zi/KnTk1PAY77wq97osJz5NcvFWjKapWe4TQleLXWlt4ZnD1iKx1c
	+zZyzenZJ7I8JDpr+mXb2PVJT88//PW7dpe5xH7fxXEmGY0BCQLnTGL13q/+XrDw4LWvq1UF
	Fyd6rdv5af11iwupa0Nnz5hjevjYlYgTmw7MYZ3+SfDBjL2O/7WPHCo4NP2NcMeeX35bgzP3
	li7I5hdOXWppOe9c949G9y8fr1hXuluUSdlGNUWkNP97N2211Y7YFx+XLn6/bsnLUma7gxIy
	28O+V66Yyv+xx7p4RkdUTtF935x1ezvcHDszzfgntf7k+jLnE/MchZjT+/ffsfkd+ulwmrUc
	6/lVziZu+x+9OL/9lhJLcUaioRZzUXEiAPTyNRRFAwAA
X-CMS-MailID: 20250515093140epcas5p1c735205578916f52954430b1db18f5e2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514135755epcas5p41291579e7eb266d92b91b82621e0fa5d
References: <20250514140741.415981-1-pritam.sutar@samsung.com>
	<CGME20250514135755epcas5p41291579e7eb266d92b91b82621e0fa5d@epcas5p4.samsung.com>
	<20250514140741.415981-2-pritam.sutar@samsung.com>

Hi Pritam

> -----Original Message-----
> From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> Sent: Wednesday, May 14, 2025 7:38 PM
> To: pritam.sutar@samsung.com; gregkh@linuxfoundation.org;
> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> alim.akhtar@samsung.com; Thinh.Nguyen@synopsys.com
> Cc: linux-usb@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org; rosa.pila@samsung.com; dev.tailor@samsung.com;
> faraz.ata@samsung.com; muhammed.ali@samsung.com;
> selvarasu.g@samsung.com
> Subject: [PATCH 1/2] dt-bindings: usb: samsung,exynos-dwc3: add dt-
> schema ExynosAutov920
> 
> Add a dedicated compatible for USB controller found in this SoC
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


