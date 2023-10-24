Return-Path: <linux-usb+bounces-2120-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2C47D4B80
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 11:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 828BEB20F85
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 09:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D60F219EF;
	Tue, 24 Oct 2023 09:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ih3HhdbX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDA514017;
	Tue, 24 Oct 2023 09:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E790FC433C8;
	Tue, 24 Oct 2023 09:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698138380;
	bh=tw6phL3njg7Zk6Ua/WCHEM58n0W8/AyOMzwRfIKowRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ih3HhdbX31Wkgy27F6HRxpE3Vm4JjuchCIypVYEbrbnA8YRbLzAiB7A2fiBP2wdrK
	 1S/zRb2vbKl1dnGwit5YKRJrR2u6yRSGQ5nibOzEf4mBGmmmPc5O/Q486wt99rp4JD
	 QjQCRo2/+c/UOk68hLfeaZUKbK+itH++tMsYLU+0kVQk3SXOzELtqpT5w1tZcGpptj
	 /MzFG1suRqBg6R7rCuklotyiTOhFW4oAqiMo0pA+OUtzhrl8T31ygyAoKVYbYInHEd
	 LlPlXdiR+MAvv9bi+bNAhdxjnm2qsKjz0ZysBXhCU5Lm23HR1vBoBWFANDYaE9AV6v
	 y/lB3Nd41rjTg==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qvDMy-0003zs-1N;
	Tue, 24 Oct 2023 11:06:36 +0200
Date: Tue, 24 Oct 2023 11:06:36 +0200
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
Subject: Re: [PATCH v13 06/10] usb: dwc3: qcom: Enable wakeup for applicable
 ports of multiport
Message-ID: <ZTeJHMJYMQWVIbI7@hovoldconsulting.com>
References: <20231007154806.605-1-quic_kriskura@quicinc.com>
 <20231007154806.605-7-quic_kriskura@quicinc.com>
 <ZTaViatsRY7LCbIX@hovoldconsulting.com>
 <7e9bdd65-35b7-43c2-810a-2cd81f736084@quicinc.com>
 <ZTdt-wyCHh3i0SlK@hovoldconsulting.com>
 <00044364-9a6a-4138-9c17-7b0b801e9f10@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00044364-9a6a-4138-9c17-7b0b801e9f10@quicinc.com>

On Tue, Oct 24, 2023 at 02:11:31PM +0530, Krishna Kurapati PSSNV wrote:
> On 10/24/2023 12:40 PM, Johan Hovold wrote:
 
> >>> But perhaps this should be done using usb_hub_for_each_child() instead
> >>> as that may be more efficient. Then you use this function to read out
> >>> the speed for all the ports in go (and store it in the port structures I
> >>> mentioned). Please determine which alternative is best.
> >>>
> >> Either ways is fine. We would have qcom->num_ports to determine how many
> >> speeds we can read.
> > 
> > That's not the point. I'm referring to which alternative is less
> > computationally expensive and allows for a clean implementation.
> > 
> > Please do try to figure it out yourself.
> > 
> I don't think its much of a difference:
> 
> while (loop over num_ports) {
> 	read_usb2_speed()
> }
> 
> read_usb2_speed() {
> 	while (loop over num_ports) {
> 		hub api to read speed.
> 	}
> }
> 
> The second one would avoid calling read_usb2_speed multiple times. Will 
> take that path.

You need to look at the implementation of usb_hub_for_each_child() and
usb_hub_find_child() to determine that, which you now forced me to
do; and yes, you're right, this shouldn't matter from an efficiency
standpoint.

> >>> [ I realise that the confusion around hs_phy_irq may be partly to blame
> >>> for this but since that one is also a per-port interrupt, that's no
> >>> longer an issue. ]
> >>
> >> I don't want to add support for this right away [1]. I would like to
> >> keep hs_phy_irq outside the loop for now.
> > 
> > No. Stop trying to take shortcuts. Again, this is upstream, not
> > Qualcomm's vendor kernel.
> 
> I don't think it is a shortcut.
> 
> The reason I said I would keep it out of loop is I know why we need 
> DP/DM/SS IRQ's during wakeup. The wakeup signals come in as 
> rising/falling edges in high speed on DP/DM lines and LFPS terminations 
> come on SS lines.

It is a shortcut as this interrupt is per-port and some SoC's already
use it. So you're making a mess of the implementation for no good
reason.

> So we need these 3 interrupts for sure in wakeup context.
> hs_phy_irq is not mandatory for wakeup. Any particular reason why it is 
> needed to add driver support for hs_phy_irq's of multiport now ? May be 
> I am missing something. If there is any reason why we need to add it 
> now, I would try to learn and see if it has any side effects (like 
> generating spurious wakeup's) and if nothing, I would add it back to 
> port structure.

As I've mentioned a few times now, the hs_phy_irq is already used by a
few SoC's so you can't just pretend it doesn't exist and mess up the
implementation for no good reason.

Just find out how it is used and why only some Qualcomm SoC's use it
currently. It appears to be used in parallel with the DP/DM interrupts,
and it has been there from the start:

	a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")

Sure, the wakeup implementation was incomplete and broken for a long
time, but I'm not going to let you continue this practise of pushing
incomplete hacks upstream which someone else will eventually be forced
to clean up. You have the documentation, just use it.

Johan

