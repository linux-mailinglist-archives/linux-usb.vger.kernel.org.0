Return-Path: <linux-usb+bounces-346-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C71BE7A53CF
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 22:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A6301C21062
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 20:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABEFF2868D;
	Mon, 18 Sep 2023 20:19:23 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6183710969;
	Mon, 18 Sep 2023 20:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADCDDC433C7;
	Mon, 18 Sep 2023 20:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695068362;
	bh=X7kwZ3TaTSXZSuCjOV84yfHdO+bVy+oMxS+rAHOQWPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h3YG6lWk02r1tfJbfvF5Z9urTiFDS9eZQvPym6Mv0l/Ii3s6kCa7Y87K7cMFeUnzc
	 vSar99B0Wteuy3VgaYTiHg2ZxMvdp5x71saEnITgAltvUkRFpmIG3+SKiJM6mS5IRc
	 U5HLyZj98Ue6hxqECFBJM8XSUeTlmk5l2yt/eYN9pEIvvrA0uSs4j+c5Czpjn7HhRn
	 CVz+AKzUucioqiS5VFzbzaQ+QETkTofdfqnXMvYl5+ZAdncivHrtV/BLqFmOvT17Ry
	 +TVTtS/qo+avh4W1uFpO8SfSPWWLIA0AJ0kNjfMcGj4LEFFn4FupPF33H9wzFHg0PE
	 CELsXmGQ+l5Ew==
Received: (nullmailer pid 1711180 invoked by uid 1000);
	Mon, 18 Sep 2023 20:19:19 -0000
Date: Mon, 18 Sep 2023 15:19:19 -0500
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, mathias.nyman@intel.com, gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, agross@kernel.org, andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, Thinh.Nguyen@synopsys.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 13/33] dt-bindings: usb: dwc3: Add
 snps,num-hc-interrupters definition
Message-ID: <20230918201919.GA1694628-robh@kernel.org>
References: <20230916001026.315-1-quic_wcheng@quicinc.com>
 <20230916001026.315-14-quic_wcheng@quicinc.com>
 <6e66d821-1275-4830-a898-bb82c333dcc5@linaro.org>
 <ef3731af-5b58-3dcb-9a6f-7e8755a13895@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef3731af-5b58-3dcb-9a6f-7e8755a13895@quicinc.com>

On Fri, Sep 15, 2023 at 05:43:45PM -0700, Wesley Cheng wrote:
> Hi Konrad,
> 
> On 9/15/2023 5:35 PM, Konrad Dybcio wrote:
> > On 16.09.2023 02:10, Wesley Cheng wrote:
> > > Add a new definition for specifying how many XHCI secondary interrupters
> > > can be allocated.  XHCI in general can potentially support up to 1024
> > > interrupters, which some uses may want to limit depending on how many
> > > users utilize the interrupters.
> > > 
> > > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > > ---
> > Any reason for a DWC3-specific property? Why not just
> > use the XHCI-common one from patch 14 and error out if
> > a value of more than 8 is found?
> > 

I'm pretty sure I said use the common one already...

> 
> Not every XHCI plat user is going to be DWC3.  In case DWC3 is used, the
> DWC3 host driver is the one that populates and adds the XHCI plat device (no
> separate device node for XHCI), so that requires the DWC3 host to also
> populate properties for the XHCI device. (dwc3_host_init())

This binding references usb-xhci.yaml already, so any property from 
there is allowed. Linux needs to handle that regardless of what the 
driver structure/division looks like.

Rob

