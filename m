Return-Path: <linux-usb+bounces-2927-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E837EE102
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 14:03:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE042B20CBA
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 13:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28FD30646;
	Thu, 16 Nov 2023 13:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9BbamjX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0EA2E419;
	Thu, 16 Nov 2023 13:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F53C433C7;
	Thu, 16 Nov 2023 13:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700139799;
	bh=H7q0Wr5l0JMqXvnR6UaqS3RUHwhyrxsJfVtztg2F/+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d9BbamjXFqHpFD69Bz+JK5yHAzRg3YQZp0q2nkYoiM3hkzHjACM2j7w0bklyXX3b8
	 fjTDjqP6jqxBJrx1R19QnJPh/jnNbtyXYzwLrrGSqTaLoaq5FdOJmsuojmG5pWJ5tb
	 MAgAo1zKfOVH6q/paVgZG1r4xOfgZ+jfVVBqGMiNs9Qv8WhGu98f91psBO5iU9sfrw
	 qtxJ8czRSj/ztZf46PK4dwUOamW95CRMAo3Wqp8jKw4LNhY6xmWmkGGqSIobeo8Qa1
	 DXiJChDlv2LQ93mp+wkEcBryIld+GILsy29gT5KF69zn/nFYKY5IDy1K+bBDniyEQS
	 236D9Hu6bSmAQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r3c1e-0003Y8-30;
	Thu, 16 Nov 2023 14:03:18 +0100
Date: Thu, 16 Nov 2023 14:03:18 +0100
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
Message-ID: <ZVYTFi3Jnnljl48L@hovoldconsulting.com>
References: <ZTJ_T1UL8-s2cgNz@hovoldconsulting.com>
 <14fc724c-bc99-4b5d-9893-3e5eff8895f7@quicinc.com>
 <ZTY7Lwjd3_8NlfEi@hovoldconsulting.com>
 <cabf24d0-8eea-4eb5-8205-bf7fe6017ec2@quicinc.com>
 <ZTZ-EvvbuA6HpycT@hovoldconsulting.com>
 <fb5e5e1d-520c-4cbc-adde-f30e853421a1@quicinc.com>
 <ZTdqnSHq_Jo8AuPW@hovoldconsulting.com>
 <04615205-e380-4719-aff1-f32c26004b14@quicinc.com>
 <ZUz4RD3MjnLlPn6V@hovoldconsulting.com>
 <6d4d959c-b155-471b-b13d-f6fda557cfe0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d4d959c-b155-471b-b13d-f6fda557cfe0@quicinc.com>

On Wed, Nov 15, 2023 at 11:12:16PM +0530, Krishna Kurapati PSSNV wrote:

> > Are you sure there's no support for hs_phy_irq also in the "femto" PHYs
> > and that it's just that there is currently no driver support for using
> > them?
> > 
> > And why is it defined if there is truly no use for it?

> We had an internal sync up with HW folks and here is some baseline 
> suggestions we received:
> 
> If DP/DM interrupts are defined, then that is the preferred path to 
> used, irrespective if HS Phy irq is defined or not / or whether it is 
> Femto / QUSB2 target. There is no target that has femto phy but misses 
> DP/DM today.

Ok, but just knowing that it is "preferred" does not in itself mean that
it should be removed from the binding.

We need to know that it's effectively useless (i.e. that the interrupts
are defined but cannot be triggered) for that.

We can still use the DP/DM interrupts in favour of HS in the driver
however.

> For cases like sdm660/msm8998/msm8953/msm8956, these targets use 
> hs_phy_irq only and don't rely on DP/DM. So we cannot remove the binding 
> in entirety.

I fixed the binding for those specific platforms last year:

	dd566faebe9f ("dt-bindings: usb: qcom,dwc3: refine interrupt requirements")

But as I mentioned in that commit message the following platforms do not
have any wakeup interrupts specified in mainline currently:

      - qcom,ipq4019-dwc3
      - qcom,ipq6018-dwc3
      - qcom,ipq8064-dwc3
      - qcom,ipq8074-dwc3
      - qcom,msm8994-dwc3
      - qcom,qcs404-dwc3

It would be good to get that cleaned up too (i.e. add the missing
interrupt definitions and update the binding to match).

> > Also, if hs_phy_irq and dp/dm_phy_irq were mutually exclusive, why does
> > the following Qualcomm SoCs define all three?

> HS Phy Irq is redundant or functionality is mutually exclusive in this 
> case. If there are targets that define all three, then we need to update 
> those to only utilize DP/DM interrupts.

No, as I wrote above that depends on if the HS interrupt is truly
useless. Otherwise it still belongs in the binding, even if the driver
uses DP/DM in place of it.

Again, the binding should describe the hardware, not what a particular
OS chooses to use.

Johan

