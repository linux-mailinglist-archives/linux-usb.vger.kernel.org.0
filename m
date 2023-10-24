Return-Path: <linux-usb+bounces-2109-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 658A77D47CA
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 08:56:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9589D1C20B8F
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 06:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F8912B8C;
	Tue, 24 Oct 2023 06:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IV6DlaEA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB861170F;
	Tue, 24 Oct 2023 06:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C924DC433C8;
	Tue, 24 Oct 2023 06:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698130573;
	bh=EV4VOJE8vL5U09j1FWreOW/O4tPUOMNuDQvuEyy9q84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IV6DlaEAIJr9GrDxMfFMEbjQMrcJvLcsy0GuqAeJN080WDLom6NDCL+nVn7+eudl5
	 hkO49bsu+tzH0wXYnpbY9DKa1NnNBA/KjdX5M630I2Ut5N9NEUkAHZsQfMMhKCd6cx
	 WseiUXJJtBp7gqkkRi9AuWayM+PYG+VwK6MSJV1qXwIl9lqjwoaHTa9e6nmocZJrnD
	 fNIHAfbETiDI5Vjw5CLNp1oI+z7d2kqBexPb/xlzStqqNRMceBRdM4O5/CKMIutdXm
	 K9C1wvvYfWAuY826aPYbS8pPHUUGKWRElfG7k/PiXh3Re6EpnSubweH0GbZuWpNU/8
	 FoQo0ZYsW4+7w==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qvBL3-0003aq-0n;
	Tue, 24 Oct 2023 08:56:29 +0200
Date: Tue, 24 Oct 2023 08:56:29 +0200
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, quic_pkondeti@quicinc.com,
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com,
	ahalaney@redhat.com, quic_shazhuss@quicinc.com
Subject: Re: [PATCH v13 05/10] usb: dwc3: qcom: Refactor IRQ handling in QCOM
 Glue driver
Message-ID: <ZTdqnSHq_Jo8AuPW@hovoldconsulting.com>
References: <20231007154806.605-1-quic_kriskura@quicinc.com>
 <20231007154806.605-6-quic_kriskura@quicinc.com>
 <ZTJ_T1UL8-s2cgNz@hovoldconsulting.com>
 <14fc724c-bc99-4b5d-9893-3e5eff8895f7@quicinc.com>
 <ZTY7Lwjd3_8NlfEi@hovoldconsulting.com>
 <cabf24d0-8eea-4eb5-8205-bf7fe6017ec2@quicinc.com>
 <ZTZ-EvvbuA6HpycT@hovoldconsulting.com>
 <fb5e5e1d-520c-4cbc-adde-f30e853421a1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb5e5e1d-520c-4cbc-adde-f30e853421a1@quicinc.com>

On Mon, Oct 23, 2023 at 10:42:31PM +0530, Krishna Kurapati PSSNV wrote:
> On 10/23/2023 7:37 PM, Johan Hovold wrote:

> > Right. And I assume there are hs_phy_irqs also for the first two USB
> > controllers on sc8280xp?

> There are, I can dig through and find out. Atleast in downstream I don't 
> see any use of them.

Yes, please do post how these are wired as well for completeness.

> > Can you find out anything more about what hs_phy_irq is used for? It
> > appears to be an HS wakeup interrupt like the dp/dm ones, but there are
> > not really any details on how it is supposed to be used.
> 
>   This IRQ is really not used in downstream controllers. Not sure if its 
> a good idea to add driver code for that. I did some digging and I got 
> the reason why I first said that there is only one hs_phy_irq for 
> tertiary port of controller. The hardware programming sequence doesn't 
> specify usage of these 4 IRQ's but the hw specifics mention that there 
> are 4 of them. Adding driver support for these IRQ's is not a good idea 
> (atleast at this point because they are not used in downstream and I am 
> not sure what would be the side effect). For now I suggest we can add 
> them in bindings and DT and not handle the 4 hs_phy_irq's in the driver 
> code (meaning not add the hs_phy_irq to port structure we plan on adding 
> to dwc3_qcom).

But there is already support for these interrupts in the driver. You
work for Qualcomm who built the thing so surely you can figure how they
intended these to be used?

You need to provide this information so that we can determine what the
binding should look like. The implementation would also be simplified if
we don't have to add random hacks to it just because we don't know why
the vendor driver you refer does not use it currently on this particular
platform.

> Also I plan on splitting the patchset into 4 parts (essentially 4 diff 
> series):
> 
> 1. Bindings update for hs_phy_irq's
> 2. DT patches for MP controller and platform specific files
> 3. Core driver update for supporting multiport
> 4. QCOM driver update for supporting wakeup/suspend/resume
> 
> This is in accordance to [1] and that way qcom code won't block core 
> driver changes from getting merged. Core driver changes are independent 
> and are sufficient to get multiport working.

No, you clearly did not understand [1] at all. And stop trying to game
the upstreaming process. Bindings and driver patches go together. The
devicetree changes can be sent separately in case of USB but only
*after* the first set has been merged.

If the code had been in good shape from the start it would have been
merged by now. Just learn from your mistakes and next time things will
be smoother.

> [1]: 
> https://lore.kernel.org/all/d4663197-8295-4967-a4f5-6cc91638fc0d@linaro.org/

Johan

