Return-Path: <linux-usb+bounces-2125-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B35D7D4CFF
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 11:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF959B21006
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 09:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5942250E2;
	Tue, 24 Oct 2023 09:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rU3EL63s"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C64024A0C;
	Tue, 24 Oct 2023 09:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF3BC433C8;
	Tue, 24 Oct 2023 09:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698141259;
	bh=W+0QNqrgDZnOgi+hua/M9Ooqieg02b9bat44s6CqMUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rU3EL63smcyw4DW29cAE87yiTKhtpmVZoah8oPz++M+9CngOTdXHOpiDWm6zB8G0P
	 cxWLL5j2Unb+zvM2Ztic/IytOdi+nrfwR1KXcK0YKDQnppva8BZE15ST8L7AjJnLYO
	 1ZmSZVPjy8VGBg+EQ6GxSTZQhUniGjXogo0c4iGY=
Date: Tue, 24 Oct 2023 11:54:14 +0200
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
Message-ID: <2023102408-deodorize-frequent-184e@gregkh>
References: <14fc724c-bc99-4b5d-9893-3e5eff8895f7@quicinc.com>
 <ZTY7Lwjd3_8NlfEi@hovoldconsulting.com>
 <cabf24d0-8eea-4eb5-8205-bf7fe6017ec2@quicinc.com>
 <ZTZ-EvvbuA6HpycT@hovoldconsulting.com>
 <fb5e5e1d-520c-4cbc-adde-f30e853421a1@quicinc.com>
 <ZTdqnSHq_Jo8AuPW@hovoldconsulting.com>
 <196601cc-f8c6-4266-bfff-3fd69f0ab31c@quicinc.com>
 <ZTeL4nSw6dMGKODm@hovoldconsulting.com>
 <2023102429-craftsman-student-ba77@gregkh>
 <ZTeObdjSSok0tttg@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTeObdjSSok0tttg@hovoldconsulting.com>

On Tue, Oct 24, 2023 at 11:29:17AM +0200, Johan Hovold wrote:
> On Tue, Oct 24, 2023 at 11:23:19AM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Oct 24, 2023 at 11:18:26AM +0200, Johan Hovold wrote:
> 
> > > And we may even consider reverting the updated bindings as it appears
> > > they are still not correct.
> > 
> > If you can tell me what the git ids of them are, I'll be glad to do so
> > right now, sorry for taking them "early".
> 
> That's
> 
> 	ca58c4ae75b6 ("dt-bindings: usb: qcom,dwc3: Add bindings for SC8280 Multiport")
> 
> and
> 
> 	eb3f1d9e42b1 ("dt-bindings: usb: Add bindings for multiport properties on DWC3 controller")
> 
> It's probably best to just revert them now.

Now reverted, thanks.

greg k-h

