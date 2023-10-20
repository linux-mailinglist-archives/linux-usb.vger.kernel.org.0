Return-Path: <linux-usb+bounces-1961-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 106757D0A90
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 10:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37B701C20F53
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 08:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8DB10A34;
	Fri, 20 Oct 2023 08:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odWlbFAl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C637A10A26;
	Fri, 20 Oct 2023 08:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E84C433C8;
	Fri, 20 Oct 2023 08:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697790718;
	bh=l9qV989JwaBiiJEzdeKJlntVo1EREOKiVHaZsdwHnJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=odWlbFAl7nFcaG6RVc59qHHDTE03y7C5RVLLzVqY7BcsH/eKUuqi5QJqQkX+DjdwI
	 MGqJeRYmQdvcSRri1kX3RgvV1r55817E6yF41wrXWIqo5pIlNcXsjKeToLo6uY9ABW
	 UxYMUZ96W4r3EENLUZY8CALyLETey9uFMBhkT5xxUmU4VFoRszx+PMFQHFLkBjMIvT
	 FW2cLYwr0ufo2kK6ijcppybmTvgPGluMjf7tr71bBpwCaB+vm4m9Ze9BXwgg4vIYP3
	 Zt1UoOfGnJt/jHxIp1PFWjQADpaEJhQVF6FOdx/cdngfKLYmWDl9DectfttbwX66k6
	 cWDca6gXppdOA==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qtkvK-0001jy-13;
	Fri, 20 Oct 2023 10:32:03 +0200
Date: Fri, 20 Oct 2023 10:32:02 +0200
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
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
Subject: Re: [PATCH v13 01/10] usb: dwc3: core: Access XHCI address space
 temporarily to read port info
Message-ID: <ZTI7AtCJWgAnACSh@hovoldconsulting.com>
References: <20231007154806.605-1-quic_kriskura@quicinc.com>
 <20231007154806.605-2-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007154806.605-2-quic_kriskura@quicinc.com>

On Sat, Oct 07, 2023 at 09:17:57PM +0530, Krishna Kurapati wrote:
> Currently host-only capable DWC3 controllers support Multiport.

You use the word "currently" in a few places like this (e.g. in comments
in the code). What exactly do you mean? That all current multiport
controllers are host-only, or that this is all that the driver supports
after your changes?

Please rephrase accordingly throughout so that this becomes clear.

In any case it looks like the above sentence is at least missing an
"only".
 
> +static int dwc3_read_port_info(struct dwc3 *dwc)
> +{
> +	void __iomem *base;
> +	u8 major_revision;
> +	u32 offset = 0;

I'd move the initialisation just before the loop.

> +	u32 val;
> +
> +	/*
> +	 * Remap xHCI address space to access XHCI ext cap regs,

Drop comma and merge with next line and break it closer to 80 chars
(instead of 65).

> +	 * since it is needed to get port info.

s/since it is needed to get/which hold the/?

> +	 */
> +	base = ioremap(dwc->xhci_resources[0].start,
> +				resource_size(&dwc->xhci_resources[0]));
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	do {
> +		offset = xhci_find_next_ext_cap(base, offset,
> +				XHCI_EXT_CAPS_PROTOCOL);
> +		if (!offset)
> +			break;
> +
> +		val = readl(base + offset);
> +		major_revision = XHCI_EXT_PORT_MAJOR(val);
> +
> +		val = readl(base + offset + 0x08);
> +		if (major_revision == 0x03) {
> +			dwc->num_usb3_ports += XHCI_EXT_PORT_COUNT(val);
> +		} else if (major_revision <= 0x02) {
> +			dwc->num_usb2_ports += XHCI_EXT_PORT_COUNT(val);
> +		} else {
> +			dev_err(dwc->dev,

This should be dev_warn() (as in the xhci driver) now that you no longer
treat it as a fatal error.

> +				"Unrecognized port major revision %d\n",

Merge this with the previous line (even if it makes that line 83 chars).

Use a lower case 'U' for consistency with most of the error messages.

> +							major_revision);
> +		}
> +	} while (1);
> +
> +	dev_dbg(dwc->dev, "hs-ports: %u ss-ports: %u\n",
> +			dwc->num_usb2_ports, dwc->num_usb3_ports);
> +
> +	iounmap(base);
> +
> +	return 0;
> +}
> +
>  static int dwc3_probe(struct platform_device *pdev)
>  {
>  	struct device		*dev = &pdev->dev;
> @@ -1846,6 +1892,7 @@ static int dwc3_probe(struct platform_device *pdev)
>  	void __iomem		*regs;
>  	struct dwc3		*dwc;
>  	int			ret;
> +	unsigned int		hw_mode;

Nit: I'd place this one before ret.

>  
>  	dwc = devm_kzalloc(dev, sizeof(*dwc), GFP_KERNEL);
>  	if (!dwc)
> @@ -1926,6 +1973,20 @@ static int dwc3_probe(struct platform_device *pdev)
>  			goto err_disable_clks;
>  	}
>  
> +	/*
> +	 * Currently only DWC3 controllers that are host-only capable
> +	 * support Multiport.
> +	 */

So is this is a limitation of the hardware or implementation?

> +	hw_mode = DWC3_GHWPARAMS0_MODE(dwc->hwparams.hwparams0);
> +	if (hw_mode == DWC3_GHWPARAMS0_MODE_HOST) {
> +		ret = dwc3_read_port_info(dwc);
> +		if (ret)
> +			goto err_disable_clks;
> +	} else {
> +		dwc->num_usb2_ports = 1;
> +		dwc->num_usb3_ports = 1;
> +	}
> +
>  	spin_lock_init(&dwc->lock);
>  	mutex_init(&dwc->mutex);

Johan

