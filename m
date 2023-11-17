Return-Path: <linux-usb+bounces-2950-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAC07EEB79
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 04:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F071A1F24328
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 03:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3CA6AD8;
	Fri, 17 Nov 2023 03:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0Bbp8Ae"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DB563C1;
	Fri, 17 Nov 2023 03:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4256BC433C8;
	Fri, 17 Nov 2023 03:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700192307;
	bh=pT1BzgitY92OrK+bcmiH4d/YlOWx34mfM/YbnLtCb3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m0Bbp8AeEm3UxtlqyPQPLRXg82ZM0TQdcnipmtkwDsW+4DZZ50ef9wqoevPWRMyOG
	 NBSYb1Z9XXmbs5+n7QfFGUO8kgfQLZWvV9aDb29YrpsIr2iACm0euhAKpAp/OEfPDl
	 AgsmzhqcQB+jAWtbYKx0229xVosdWvyY6DH4jKPCHNRbl8UlzbuKk3pNhxXmuuglC5
	 1psVDWzt8iYqPiYmUeyXKmo0e7i0w9WRB5jgyG+FwAm13aI0LQdkOB8EFVEhvv+Y06
	 5M9zzp4DvSz7C0NdWKBdufjSxOG2ItZyIgjiGZewM6zkksVTCzN48QyWHT8+NrNCtJ
	 gnypkcvrJuraA==
Date: Fri, 17 Nov 2023 11:38:14 +0800
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
Message-ID: <20231117033814.GA485583@nchen-desktop>
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
 <20231113-j7200-usb-suspend-v1-4-ad1ee714835c@bootlin.com>
 <20231114083838.GC64573@nchen-desktop>
 <CWYHLRBFE1X1.15330WETL2R7U@tleb-bootlin-xps13-01>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CWYHLRBFE1X1.15330WETL2R7U@tleb-bootlin-xps13-01>

On 23-11-14 12:10:18, Théo Lebrun wrote:
> Hello,
> 
> On Tue Nov 14, 2023 at 9:38 AM CET, Peter Chen wrote:
> > On 23-11-13 15:26:59, Théo Lebrun wrote:
> > > The controller is not being reconfigured at resume. Change resume to
> > > redo hardware config if quirk CDNS3_RESET_ON_RESUME is active.
> >
> > Current logic has power off judgement, see cdns3_controller_resume for
> > detail.
> 
> Indeed! Thanks for the pointer. I had not noticed that, those patches
> come from an older kernel which didn't have it. That'll make for less
> changes; patches 4 & 5 can go away.
> 
> > > +	if (cdns->pdata && cdns->pdata->quirks & CDNS3_RESET_ON_RESUME)
> > > +		cdns->xhci_plat_data->quirks |= XHCI_RESET_ON_RESUME | XHCI_SUSPEND_RESUME_CLKS;
> > > +
> >
> > If you set this flag, how could you support the USB remote wakeup
> > request? In that case, the USB bus does not expect re-enumeration.
> 
> We didn't support remote USB wakeup. Only S2R mattered in our case and
> USB remote wakeup wasn't a possibility.

Without this patch, will below be hit for your platform:


	/* re-initialize the HC on Restore Error, or Host Controller Error */
	if (temp & (STS_SRE | STS_HCE)) {
		reinit_xhc = true;
		if (!xhci->broken_suspend)
			xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x, Reinit\n", temp);
	}


-- 

Thanks,
Peter Chen

