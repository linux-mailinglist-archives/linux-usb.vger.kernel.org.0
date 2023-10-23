Return-Path: <linux-usb+bounces-2065-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFB47D2D32
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 10:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07E032814FA
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 08:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21EE125B0;
	Mon, 23 Oct 2023 08:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUI0p9EZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1601A17E8;
	Mon, 23 Oct 2023 08:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8500DC433C8;
	Mon, 23 Oct 2023 08:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698051107;
	bh=Vd28yKOH0TRadp/QldDFl+VqSlMewckCgsfZOnDua/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUI0p9EZzW5EQp/km//8FhM3hOl8F71DPi8ii981Mbq3jGfx6KbDZfgHYIE9N3Fma
	 y1C72eMRXudKHFGy6p5vLVoPBe++MBVnYtceYYMJiNxjMWbDPwkggr3X1ZZyfJ4mlN
	 CtIz+9XY1TYLR1s2nVwRpPPxxZqBq56jcNz/QBNz46qQMrTRkhUM5ohkd75GyZ9dPr
	 pEEDAZ9P6kijjxpXJxJMLL4FMpKxkjd01TcMMapZvvr7u26nrkaeukndMaRob2ZbEH
	 2HQW1lYiiQSm+u+gRO6UK84Fmd/Ek7Tj0nLLJ/3Ju6VYjQfhZKdLAlL4l8jcdcZX5R
	 OxGLlZpRlDlCQ==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1quqfJ-0007hO-1Q;
	Mon, 23 Oct 2023 10:52:01 +0200
Date: Mon, 23 Oct 2023 10:52:01 +0200
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
	ahalaney@redhat.com, quic_shazhuss@quicinc.com,
	Harsh Agarwal <quic_harshq@quicinc.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v13 03/10] usb: dwc3: core: Refactor PHY logic to support
 Multiport Controller
Message-ID: <ZTY0MYmiM-WrA5B6@hovoldconsulting.com>
References: <20231007154806.605-1-quic_kriskura@quicinc.com>
 <20231007154806.605-4-quic_kriskura@quicinc.com>
 <ZTJPBcyZ_zLXbgE5@hovoldconsulting.com>
 <157d1c8d-5aa4-4488-bf85-7806c8fb00bc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <157d1c8d-5aa4-4488-bf85-7806c8fb00bc@quicinc.com>

On Fri, Oct 20, 2023 at 05:11:46PM +0530, Krishna Kurapati PSSNV wrote:
> On 10/20/2023 3:27 PM, Johan Hovold wrote:
> > On Sat, Oct 07, 2023 at 09:17:59PM +0530, Krishna Kurapati wrote:
> >> From: Harsh Agarwal <quic_harshq@quicinc.com>

> >> Co-developed-by: Harsh Agarwal <quic_harshq@quicinc.com>
> >> Signed-off-by: Harsh Agarwal <quic_harshq@quicinc.com>
> >> Co-developed-by:Krishna Kurapati <quic_kriskura@quicinc.com>
> >> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> > 
> > Thinh pointed out the problems with the above which were also reported
> > by checkpatch.pl.
> 
> I see that removing Co-Developed by tag for Harsh is helping with one 
> checkpatch issue. From what I know, although I made Harsh the Primary 
> author for the patch, should we still mention his Co-Developed-by along 
> with this Signed-Of by ?

This is all documented in the process document I pointed you at earlier.

You don't need a Co-Developed-by tag for the primary author.

> >> @@ -748,23 +781,32 @@ static int dwc3_phy_setup(struct dwc3 *dwc)
> >>   static int dwc3_phy_init(struct dwc3 *dwc)
> >>   {
> >>   	int ret;
> >> +	int i;
> >> +	int j;
> > 
> > These could be declared on one line (same throughout).
> > 
> 
> I did so in v7, but was asked to put them in separate lines:
> https://lore.kernel.org/all/20230502221100.ecska23anlzv3iwq@synopsys.com/

Ok, either is fine if Thinh prefers it this way.

The problem is usually the other way round where people try to squeeze
in too much (e.g. unrelated variables and declarations) on the same
line.

> >> @@ -1892,9 +1975,12 @@ static int dwc3_read_port_info(struct dwc3 *dwc)
> >>   
> >>   	dev_dbg(dwc->dev, "hs-ports: %u ss-ports: %u\n",
> >>   			dwc->num_usb2_ports, dwc->num_usb3_ports);
> >> -
> > 
> > Drop this random change.
> 
> The removal of extra line here done you mean ?

Yes.

> > 
> >>   	iounmap(base);

Johan

