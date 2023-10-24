Return-Path: <linux-usb+bounces-2122-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ED47D4BE8
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 11:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 712502817BC
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 09:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE8022F1B;
	Tue, 24 Oct 2023 09:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="K3TWxY/m"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87F822EF7;
	Tue, 24 Oct 2023 09:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF454C433C7;
	Tue, 24 Oct 2023 09:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698139402;
	bh=5BOfFTioUJ8IpZCnLdaN62MO+jIWJf1nCYWGm67cq/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K3TWxY/mSp7p8NMVDwongsMDYppo+lMc0l2edIfizOsJCNCWK5D1nrULPM4fzy1bI
	 u+9PSAJQCbcdXYn/gdibcysAoCV/lmK9kMkJMSHC3CbCCnk7/u6hVd5fKydCZ32HN7
	 kPg6keKhfZVhnFg/DGvnwPaffEX6wO52pVc/kKLY=
Date: Tue, 24 Oct 2023 11:23:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
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
Message-ID: <2023102429-craftsman-student-ba77@gregkh>
References: <20231007154806.605-6-quic_kriskura@quicinc.com>
 <ZTJ_T1UL8-s2cgNz@hovoldconsulting.com>
 <14fc724c-bc99-4b5d-9893-3e5eff8895f7@quicinc.com>
 <ZTY7Lwjd3_8NlfEi@hovoldconsulting.com>
 <cabf24d0-8eea-4eb5-8205-bf7fe6017ec2@quicinc.com>
 <ZTZ-EvvbuA6HpycT@hovoldconsulting.com>
 <fb5e5e1d-520c-4cbc-adde-f30e853421a1@quicinc.com>
 <ZTdqnSHq_Jo8AuPW@hovoldconsulting.com>
 <196601cc-f8c6-4266-bfff-3fd69f0ab31c@quicinc.com>
 <ZTeL4nSw6dMGKODm@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTeL4nSw6dMGKODm@hovoldconsulting.com>

On Tue, Oct 24, 2023 at 11:18:26AM +0200, Johan Hovold wrote:
> On Tue, Oct 24, 2023 at 02:23:57PM +0530, Krishna Kurapati PSSNV wrote:
> > On 10/24/2023 12:26 PM, Johan Hovold wrote:
> 
> > > No, you clearly did not understand [1] at all. And stop trying to game
> > > the upstreaming process. Bindings and driver patches go together. The
> > > devicetree changes can be sent separately in case of USB but only
> > > *after* the first set has been merged.
> > > 
> > > If the code had been in good shape from the start it would have been
> > > merged by now. Just learn from your mistakes and next time things will
> > > be smoother.
> > 
> > I agree that bindings should go first. My point is core bindings are 
> > already approved and merged and just wanted to check if core driver 
> > changes can be merged without glue blocking them. Core driver changes 
> > have nothing to do with interrupt handling in glue. If we get the core 
> > changes merged separately after fixing the nits mentioned, we can take 
> > up this interrupt handling in glue in parallel. I am just trying to see 
> > if we can start merging independent portions of code. I agree that my 
> > glue driver changes are still not upto mark. But that has nothing to do 
> > with core driver changes.
> 
> Again, no. The dwc3 glue and core bits are not independent, and ideally
> the bindings should not have been merged either before having the
> implementation in a decent shape either (e.g. as the messy
> implementation suggested that the bindings were incomplete).
> 
> You're again trying to sneak in an incomplete implementation. Qualcomm
> has a terrible track record of doing just that and leaving others with
> the task to clean up their mess.
> 
> This should go in as one series, when it's ready, and not before.
> 
> And we may even consider reverting the updated bindings as it appears
> they are still not correct.

If you can tell me what the git ids of them are, I'll be glad to do so
right now, sorry for taking them "early".

thanks,

greg k-h

