Return-Path: <linux-usb+bounces-3007-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FAE7F0BA4
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 06:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19031280C55
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 05:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF833C29;
	Mon, 20 Nov 2023 05:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQMf0xcb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97A520F4;
	Mon, 20 Nov 2023 05:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84432C433C8;
	Mon, 20 Nov 2023 05:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700459085;
	bh=xMwd22goVNx0T6tDO3m4JjyUIDZiEW0Rduv+odROm9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQMf0xcbls1MTU8bgulVhh9gj9GLtEDuCuqqGFi/H+xj8tOcl4CSt/zdM6W0nVU8Z
	 IXizWTy0vBfPt1LnX6gD98br/oI7LsfZz1D8Uk6PtdY1Gfs2cvTwg6/gbrNTWB1QKL
	 oISVuegEoa31Af8qizAqcL3SDaNCiTTL9VNOyEebnCuvWoJNRNXMacp/aerOMJ6QPM
	 pV4UVQhlwcm5vmYQgQTukENVMBf0u1J9AcnvT0eRLMAb1RPBkaM8iZr+jaM9q8jN7K
	 6LthYoE9VGf76PQLkUeLBgDhDzm+R6zBapN0LVgB7XuuQElK0Aj4X0orXswwxnua4M
	 wAZVMBnZ9F6BA==
Date: Mon, 20 Nov 2023 13:44:34 +0800
From: Peter Chen <peter.chen@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] usb: cdns3: support power-off of controller when in
 host role
Message-ID: <20231120054434.GA518673@nchen-desktop>
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
 <20231113-j7200-usb-suspend-v1-4-ad1ee714835c@bootlin.com>
 <20231114083838.GC64573@nchen-desktop>
 <CWYHLRBFE1X1.15330WETL2R7U@tleb-bootlin-xps13-01>
 <20231117033814.GA485583@nchen-desktop>
 <CX0ZY6JPH6HP.3JWUAN8KZ2SZB@tleb-bootlin-xps13-01>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CX0ZY6JPH6HP.3JWUAN8KZ2SZB@tleb-bootlin-xps13-01>

On 23-11-17 10:58:12, Théo Lebrun wrote:
> Hello,
> 
> On Fri Nov 17, 2023 at 4:38 AM CET, Peter Chen wrote:
> > On 23-11-14 12:10:18, Théo Lebrun wrote:
> > > Hello,
> > > 
> > > On Tue Nov 14, 2023 at 9:38 AM CET, Peter Chen wrote:
> > > > > +	if (cdns->pdata && cdns->pdata->quirks & CDNS3_RESET_ON_RESUME)
> > > > > +		cdns->xhci_plat_data->quirks |= XHCI_RESET_ON_RESUME | XHCI_SUSPEND_RESUME_CLKS;
> > > > > +
> > > >
> > > > If you set this flag, how could you support the USB remote wakeup
> > > > request? In that case, the USB bus does not expect re-enumeration.
> > > 
> > > We didn't support remote USB wakeup. Only S2R mattered in our case and
> > > USB remote wakeup wasn't a possibility.
> >
> > Without this patch, will below be hit for your platform:
> >
> > 	/* re-initialize the HC on Restore Error, or Host Controller Error */
> > 	if (temp & (STS_SRE | STS_HCE)) {
> > 		reinit_xhc = true;
> > 		if (!xhci->broken_suspend)
> > 			xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x, Reinit\n", temp);
> > 	}
> 
> Yes it hits. The warning as well. How big of an issue is that?
> 
> My understanding is that this is the expected behavior with reset on
> resume if we don't explicitely pass the flag XHCI_RESET_ON_RESUME. I
> don't think we should be having the broken_suspend bit set as its
> mentioning some specific quirk on AMD hardware.
> 
> Is the only expected difference inbetween having CDNS3_RESET_ON_RESUME &
> not having it is resume time? For reference, the status read is 0x411
> ie STS_HALT | STS_PCD | STS_SRE. xhc_state is zero.
> 

Yes. I know some xHCI controllers have powered off during suspend will
hit it, just would like to confirm if it is the same with yours. If you
don't want remote wakeup, it is most probably the same with quirks you set.

-- 

Thanks,
Peter Chen

