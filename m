Return-Path: <linux-usb+bounces-2924-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FF37EE04D
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 13:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1151EB20A15
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 12:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1262F862;
	Thu, 16 Nov 2023 12:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SuKBqNHs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778C52EAFE;
	Thu, 16 Nov 2023 12:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 005A4C433C8;
	Thu, 16 Nov 2023 12:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700136076;
	bh=c7gMUttZFyHHQ9COrEEKH4SS+vncMf6Y8hrZnTRxLYg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SuKBqNHsU+fNNgXSXPII1Osj2l1CDoO4VvhdYjyiNcPr/CKLB8/IgHL+sH2Zi5Vd3
	 OF9GVwgC+Iz1tDkjBPH05TP8xf9cUZvJP27FLs6guK6hcXe+QitVEfeRxycjlrlUHC
	 bB0J7i4JVzw0lbczlYUP1gxsDzeA4QFkt0zl2iuQr1J21UAka2f35Gl0hUARiLxa8d
	 LRMyXZY1B/HP7oyspTrzBF36zEYurikArcAf6C6+ObpTdJRrqhbO5h4zkkhfRV5Xri
	 asFvYLhnhuQaawuRRVLPA38RvdGCETNY6o1wTdnNgYHD8D/fYTKPAmFnROS/p3Z/iZ
	 Rt8ZgxgcGVmMg==
Message-ID: <79f3beef-1afe-4b97-8f6e-435c0419b513@kernel.org>
Date: Thu, 16 Nov 2023 14:00:46 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] usb: cdns3-ti: move reg writes from probe into an
 init_hw helper
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Chen <peter.chen@kernel.org>,
 Pawel Laszczak <pawell@cadence.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
 <20231113-j7200-usb-suspend-v1-2-ad1ee714835c@bootlin.com>
 <aabf618e-9352-4555-9059-f213cb16c84f@kernel.org>
 <CWZGC158AQK7.2XQXIEEH6WO2J@tleb-bootlin-xps13-01>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <CWZGC158AQK7.2XQXIEEH6WO2J@tleb-bootlin-xps13-01>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 15/11/2023 16:23, Théo Lebrun wrote:
> Hello,
> 
> On Wed Nov 15, 2023 at 12:33 PM CET, Roger Quadros wrote:
>>> --- a/drivers/usb/cdns3/cdns3-ti.c
>>> +++ b/drivers/usb/cdns3/cdns3-ti.c
> 
> [...]
> 
>>>  static int cdns_ti_probe(struct platform_device *pdev)
>>>  {
>>>  	struct device *dev = &pdev->dev;
>>>  	struct device_node *node = pdev->dev.of_node;
>>>  	struct cdns_ti *data;
>>> -	int error;
>>> -	u32 reg;
>>> -	int rate_code, i;
>>>  	unsigned long rate;
>>> +	int error, i;
>>
>> Should we leave rate_code and get rid of i?
> 
> I see your point about i being usually a temp variable. Using rate_code
> instead of i means the for-loop becomes rather long (column 87) &
> should ideally be split.
> 
> How about moving the data->usb2_refclk_rate_code assignment up, closer
> to the computation of i? That way we don't reference i three blocks
> down the road, seemingly out of nowhere.

That is much better. Thanks!

-- 
cheers,
-roger

