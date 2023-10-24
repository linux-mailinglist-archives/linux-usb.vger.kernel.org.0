Return-Path: <linux-usb+bounces-2110-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D857D47E1
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 09:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6D90281694
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 07:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8022134A8;
	Tue, 24 Oct 2023 07:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJPpMnAX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C43D7474;
	Tue, 24 Oct 2023 07:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E37C433C8;
	Tue, 24 Oct 2023 07:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698130972;
	bh=+EyzEkEY5OgBH2+OQ61ZdJ9Ly/9FG10TFtNjEehjNsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJPpMnAXVejeJbmmYluzR5PJz6rlNHaLzBN4ufDFZvdwpp/V3H0bT8NtYbNoks4Pv
	 sG8nNxxIZFu358PTCN6c6OfCurLkDSK8AP0SIgTiU3WhpvPoi8swif7Fw3lbb/b0XM
	 X2+WKS7nuApX1oJM1Wx73opQL0FN3M0GPSGA1YkvDOTL8xtsPTb9ZLPksI15tlCiVk
	 Pie6uzcSaEmamahNNKPbvBhDLYokik2RlnVvvHMq1Y96tS93OGHN8rqa2uVECZ/dD6
	 XA63YyKwtmKW7c/yyhU2Lx+SzxGYkuk90aWVv8nV4YntKec+guahN+0nldoEo/A+EJ
	 B2eo/rWmp0uNg==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qvBRU-0003bz-2A;
	Tue, 24 Oct 2023 09:03:08 +0200
Date: Tue, 24 Oct 2023 09:03:08 +0200
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
Subject: Re: [PATCH v13 07/10] usb: dwc3: qcom: Add multiport suspend/resume
 support for wrapper
Message-ID: <ZTdsLMT9PNcnroHC@hovoldconsulting.com>
References: <20231007154806.605-1-quic_kriskura@quicinc.com>
 <20231007154806.605-8-quic_kriskura@quicinc.com>
 <ZTaYNjRyT1Fn4QWX@hovoldconsulting.com>
 <73168f4b-0dc2-4060-99f2-c5e9973dbf52@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73168f4b-0dc2-4060-99f2-c5e9973dbf52@quicinc.com>

On Mon, Oct 23, 2023 at 10:52:38PM +0530, Krishna Kurapati PSSNV wrote:
> On 10/23/2023 9:28 PM, Johan Hovold wrote:
> > On Sat, Oct 07, 2023 at 09:18:03PM +0530, Krishna Kurapati wrote:
  
> >> -#define PWR_EVNT_IRQ_STAT_REG			0x58
> >> +#define PWR_EVNT_IRQ1_STAT_REG			0x58
> >> +#define PWR_EVNT_IRQ2_STAT_REG			0x1dc
> >> +#define PWR_EVNT_IRQ3_STAT_REG			0x228
> >> +#define PWR_EVNT_IRQ4_STAT_REG			0x238
> > 
> > Not sure these defines makes sense on their own. You now only use them
> > via the array below.
> > 
> > I think I already asked you whether these offsets depend on SoC and you
> > said no, right?
> > 
> There are only 3 QC SoC's today that support multiport.
> The offsets mentioned here are for SC8280 based platforms.
> 
> For Sc8180 based platforms, these are the offsets:
> USB3_MP_PWR_EVNT_IRQ_STAT	0xA4F8858
> USB3_MP_PWR_EVNT_IRQ_1_STAT	0xA4F89DC
> 
> These would translate to 0x58 and 0x1DC
> 
> And for SX8380 the values are as follows:
> 
> USB3_MP_PWR_EVNT_IRQ_STAT	0xA4F8858
> USB3_MP_PWR_EVNT_IRQ_1_STAT	0xA4F89DC
> 
> So here also, the offsets are same. 0x58 and 0x1DC.
> So these are not SoC specific (atleast looking at the controllers 
> present). But there is no mathematical pattern to denote this as in the 
> following form (x + (port_num) * y). So made an array like this.

Sounds good. Thanks for confirming.

> >> +#define NUM_PWR_EVENT_STAT_REGS	4
> > 
> > You already have MAX_PORTS, why are you defining a new define that will
> > always have to be equal to MAX_PORTS?
> > 
> Do you recommend using the same max_ports ? If so, I can remove this 
> macro altogether.

Indeed, and perhaps also some (compile-time) assert as the driver breaks
if they ever get out of sync.

Johan

