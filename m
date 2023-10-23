Return-Path: <linux-usb+bounces-2067-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB9C7D2E04
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 11:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D8B71F21C8B
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 09:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1556812B94;
	Mon, 23 Oct 2023 09:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ublXkvkm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6761C12B9F;
	Mon, 23 Oct 2023 09:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5ABFC433C7;
	Mon, 23 Oct 2023 09:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698052897;
	bh=uGmAHWWEHuC6CtTkdGrPEy+s20iQcX/+23N0QeT0Bkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ublXkvkmewNO5+joVQ7EinSOUJ+/TGCa+HaP+yUl7fR8fEzCZKnjEGTQamdf4s6Tu
	 Eq611qj4Qv3n0bbj+bg6idQApdlwc8PYP7f4/8xHaFbmGBmLpRb2ohKubgYYZq//gf
	 iV2p0AnKrzU6hM6NXgqxC/a2OzXb5KV+t/zZ0tkStoa03ZJCHlmL8WnnkC9AQzvLe9
	 cAagHjNUonEAtB1egSy7/YwfmoEPSwx+ouI25HgdsVATWkUNE1LMFqDellVLOHdN2A
	 w/APbQM3fBYOLOOw0o4IPiMEV/2yOupLhjEFkWVBcsnXvLNNoO1Rl+E/4ErOlCEtw4
	 4w7D/PJ02BAcA==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qur8B-0007vL-2p;
	Mon, 23 Oct 2023 11:21:51 +0200
Date: Mon, 23 Oct 2023 11:21:51 +0200
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
Message-ID: <ZTY7Lwjd3_8NlfEi@hovoldconsulting.com>
References: <20231007154806.605-1-quic_kriskura@quicinc.com>
 <20231007154806.605-6-quic_kriskura@quicinc.com>
 <ZTJ_T1UL8-s2cgNz@hovoldconsulting.com>
 <14fc724c-bc99-4b5d-9893-3e5eff8895f7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14fc724c-bc99-4b5d-9893-3e5eff8895f7@quicinc.com>

On Mon, Oct 23, 2023 at 12:11:45AM +0530, Krishna Kurapati PSSNV wrote:
> On 10/20/2023 6:53 PM, Johan Hovold wrote:
> > On Sat, Oct 07, 2023 at 09:18:01PM +0530, Krishna Kurapati wrote:

> >> +#define NUM_PHY_IRQ		4
> >> +
> >> +enum dwc3_qcom_ph_index {
> > 
> > "phy_index"
> > 
> >> +	DP_HS_PHY_IRQ_INDEX = 0,
> >> +	DM_HS_PHY_IRQ_INDEX,
> >> +	SS_PHY_IRQ_INDEX,
> >> +	HS_PHY_IRQ_INDEX,
> >> +};
> >> +
> >>   struct dwc3_acpi_pdata {
> >>   	u32			qscratch_base_offset;
> >>   	u32			qscratch_base_size;
> >>   	u32			dwc3_core_base_size;
> >> +	/*
> >> +	 * The phy_irq_index corresponds to ACPI indexes of (in order) DP/DM/SS
> >> +	 * IRQ's respectively.
> >> +	 */
> >> +	int			phy_irq_index[NUM_PHY_IRQ - 1];
> >>   	int			hs_phy_irq_index;
> >> -	int			dp_hs_phy_irq_index;
> >> -	int			dm_hs_phy_irq_index;
> >> -	int			ss_phy_irq_index;
> >>   	bool			is_urs;
> >>   };
> >>   
> >> @@ -73,10 +84,12 @@ struct dwc3_qcom {
> >>   	int			num_clocks;
> >>   	struct reset_control	*resets;
> >>   
> >> +	/*
> >> +	 * The phy_irq corresponds to IRQ's registered for (in order) DP/DM/SS
> >> +	 * respectively.
> >> +	 */
> >> +	int			phy_irq[NUM_PHY_IRQ - 1][DWC3_MAX_PORTS];
> >>   	int			hs_phy_irq;
> >> -	int			dp_hs_phy_irq;
> >> -	int			dm_hs_phy_irq;
> >> -	int			ss_phy_irq;
> > 
> > I'm not sure using arrays like this is a good idea (and haven't you
> > switched the indexes above?).
> > 
> > Why not add a port structure instead?
> > 
> > 	struct dwc3_qcom_port {
> > 		int hs_phy_irq;
> > 		int dp_hs_phy_irq;
> > 		int dm_hs_phy_irq;
> > 		int ss_phy_irq;
> > 	};
> > 
> > and then have
> > 
> > 	struct dwc3_qcom_port ports[DWC3_MAX_PORTS];
> > 
> > in dwc3_qcom. The port structure can the later also be amended with
> > whatever other additional per-port data there is need for.
> > 
> > This should make the implementation cleaner.
> > 
> > I also don't like the special handling of hs_phy_irq; if this is really
> > just another name for the pwr_event_irq then this should be cleaned up
> > before making the code more complicated than it needs to be.
> > 
> > Make sure to clarify this before posting a new revision.
> 
> hs_phy_irq is different from pwr_event_irq.

How is it different and how are they used?

> AFAIK, there is only one of this per controller.

But previous controllers were all single port so this interrupt is
likely also per-port, even if your comment below seems to suggest even
SC8280XP has one, which is unexpected (and not described in the updated
binding):

	Yes, all targets have the same IRQ's. Just that MP one's have
	multiple IRQ's of each type. But hs-phy_irq is only one in
	SC8280 as well.

	https://lore.kernel.org/lkml/70b2495f-1305-05b1-2039-9573d171fe24@quicinc.com/

Please clarify.

> >> -static int dwc3_qcom_prep_irq(struct dwc3_qcom *qcom, char *irq_name,
> >> -				char *disp_name, int irq)
> >> +static int dwc3_qcom_prep_irq(struct dwc3_qcom *qcom, const char *irq_name,
> >> +				const char *disp_name, int irq)
> > 
> > Ok, here you did drop the second name parameter, but without renaming
> > the first and hidden in a long diff without any mention anywhere.
> > 
> I didn't understand the comment. Can you please elaborate.
> I didn't drop the second parameter. In the usage of this call, I passed 
> same value to both irq_name and disp_name:
> 
> "dwc3_qcom_prep_irq(qcom, irq_names[i], irq_names[i], irq);"
> 
> I mentioned in cover-letter that I am using same name as obtained from 
> DT to register the interrupts as well. Should've mentioned that in 
> commit text of this patch. Will do it in next version.

Ah, sorry I misread the diff. You never drop the second name even though
it is now redundant as I pointed on in a comment to one of the earlier
patches.

Johan

