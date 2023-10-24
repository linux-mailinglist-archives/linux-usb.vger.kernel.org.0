Return-Path: <linux-usb+bounces-2124-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F957D4C3E
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 11:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 408B4281944
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 09:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D221A241F5;
	Tue, 24 Oct 2023 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cC0UEiL1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF2F23749;
	Tue, 24 Oct 2023 09:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6989C433C7;
	Tue, 24 Oct 2023 09:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698139741;
	bh=UZqrmiFyMb6iqj6CEJfrDan6NO1zF1ytYhlleAz7Zd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cC0UEiL1k7DyE0KNQjYurtMYHM4qXlM+gG/UHQ6QuaXfo/L0CAmjZeRTLjvcott4W
	 WO7L+wlp5ixc4eKL0KekOYwy4Xzp8D/U1UUZPMydxEA4oWQ5gyTE6SZtWePOyZxozk
	 2IbsoIgHCnN1QNTwe6gHv+YV59WAa39VtLB/L19ZraaJ3fj3SJoYcSU1otuChayijA
	 VkBHTD3apxEO3/DMClob8moR71I4y576/sW7OgBpxrBcpR2bZww77O9KfIs1r36TEb
	 twQ3WGAMPM+35FVe8h/CQdIPaZRjjtWzfRuSs6GFh25A+X9zfECbLDce9KGkXgsvKO
	 kVkZykHUqd4Sw==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qvDiv-00044j-0D;
	Tue, 24 Oct 2023 11:29:17 +0200
Date: Tue, 24 Oct 2023 11:29:17 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
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
Message-ID: <ZTeObdjSSok0tttg@hovoldconsulting.com>
References: <ZTJ_T1UL8-s2cgNz@hovoldconsulting.com>
 <14fc724c-bc99-4b5d-9893-3e5eff8895f7@quicinc.com>
 <ZTY7Lwjd3_8NlfEi@hovoldconsulting.com>
 <cabf24d0-8eea-4eb5-8205-bf7fe6017ec2@quicinc.com>
 <ZTZ-EvvbuA6HpycT@hovoldconsulting.com>
 <fb5e5e1d-520c-4cbc-adde-f30e853421a1@quicinc.com>
 <ZTdqnSHq_Jo8AuPW@hovoldconsulting.com>
 <196601cc-f8c6-4266-bfff-3fd69f0ab31c@quicinc.com>
 <ZTeL4nSw6dMGKODm@hovoldconsulting.com>
 <2023102429-craftsman-student-ba77@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023102429-craftsman-student-ba77@gregkh>

On Tue, Oct 24, 2023 at 11:23:19AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Oct 24, 2023 at 11:18:26AM +0200, Johan Hovold wrote:

> > And we may even consider reverting the updated bindings as it appears
> > they are still not correct.
> 
> If you can tell me what the git ids of them are, I'll be glad to do so
> right now, sorry for taking them "early".

That's

	ca58c4ae75b6 ("dt-bindings: usb: qcom,dwc3: Add bindings for SC8280 Multiport")

and

	eb3f1d9e42b1 ("dt-bindings: usb: Add bindings for multiport properties on DWC3 controller")

It's probably best to just revert them now.

Thanks.

Johan

