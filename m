Return-Path: <linux-usb+bounces-1971-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E08097D0C69
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 11:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CE65B215AF
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 09:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42DD81549A;
	Fri, 20 Oct 2023 09:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cnv5bBGr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F4615488;
	Fri, 20 Oct 2023 09:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB53DC433C8;
	Fri, 20 Oct 2023 09:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697795841;
	bh=8/3Mm/s+5mfGxjNsgZ92fL0tT02zsm5ukwZkUVOz8fM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cnv5bBGr9VIi0j6jLXALUbaa464rEO7jQIXhrRckYRR6Gg5OPb2zzR2eLRIAuaUuD
	 gRmuvjKDtAm6n+qj5ZwGUiEXrWYgiJZc4kfUEv2MInmeAuSQweS/OQxBLFAvwLBRJl
	 eoOdJz0gFV2uOEAxsFnZrkuPv0YuxKIuIGaJgI3wDPxwWfOiaRJbOvNMV27sABO7Xx
	 VMUfO1mHC6ufHcNAdEEQx/NOShSoe7hSnds2jI0Ngpvy3nHZjEPu3+DrfSXUyktVgH
	 M8B0b0ZBi7yhRlkIwg+BBqfOEqDXk1baZDnAfjFs14udEPESB6nJ5ItRQggJMDQ2kP
	 XI66ij5EXgAjQ==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qtmFx-00023X-1n;
	Fri, 20 Oct 2023 11:57:26 +0200
Date: Fri, 20 Oct 2023 11:57:25 +0200
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
	ahalaney@redhat.com, quic_shazhuss@quicinc.com,
	Harsh Agarwal <quic_harshq@quicinc.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v13 03/10] usb: dwc3: core: Refactor PHY logic to support
 Multiport Controller
Message-ID: <ZTJPBcyZ_zLXbgE5@hovoldconsulting.com>
References: <20231007154806.605-1-quic_kriskura@quicinc.com>
 <20231007154806.605-4-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007154806.605-4-quic_kriskura@quicinc.com>

On Sat, Oct 07, 2023 at 09:17:59PM +0530, Krishna Kurapati wrote:
> From: Harsh Agarwal <quic_harshq@quicinc.com>
> 
> Currently the DWC3 driver supports only single port controller
> which requires at most one HS and one SS PHY.

Should that not be "at least one HS PHY and at most one SS PHY"?
 
> But the DWC3 USB controller can be connected to multiple ports and
> each port can have their own PHYs. Each port of the multiport
> controller can either be HS+SS capable or HS only capable
> Proper quantification of them is required to modify GUSB2PHYCFG
> and GUSB3PIPECTL registers appropriately.
> 
> Add support for detecting, obtaining and configuring phy's supported

"PHYs" for consistency, no apostrophe

> by a multiport controller and. Limit the max number of ports

"and." what? Looks like part of the sentence is missing? Or just drop
" and"?

> supported to 4 as only SC8280 which is a quad port controller supports

s/4/four/

Just change this to

	Limit support to multiport controllers with up to four ports for
	now (e.g. as needed for SC8280XP).

> Multiport currently.

You use capitalised "Multiport" in several places it seems. Is this an
established term for these controllers or should it just be "multiport"
or "multiple ports"?

> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202309200156.CxQ3yaLY-lkp@intel.com/

Drop these two lines, as people have already suggested.

> Co-developed-by: Harsh Agarwal <quic_harshq@quicinc.com>
> Signed-off-by: Harsh Agarwal <quic_harshq@quicinc.com>
> Co-developed-by:Krishna Kurapati <quic_kriskura@quicinc.com>
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>

Thinh pointed out the problems with the above which were also reported
by checkpatch.pl.

> ---
> Changes in v13:
> Compiler issues found by kernel test robot have been fixed and tags added.
> So removing maintainers reviewed-by tag as we have made a minor change
> in the patch.

In general this is the right thing to do when the change in question was
non-trivial. I'm not sure that's the case here, but the robots tend to
complain about smaller (but sometimes important) things.

> @@ -748,23 +781,32 @@ static int dwc3_phy_setup(struct dwc3 *dwc)
>  static int dwc3_phy_init(struct dwc3 *dwc)
>  {
>  	int ret;
> +	int i;
> +	int j;

These could be declared on one line (same throughout).

>  	usb_phy_init(dwc->usb2_phy);
>  	usb_phy_init(dwc->usb3_phy);
>  
> -	ret = phy_init(dwc->usb2_generic_phy);
> -	if (ret < 0)
> -		goto err_shutdown_usb3_phy;
> +	for (i = 0; i < dwc->num_usb2_ports; i++) {
> +		ret = phy_init(dwc->usb2_generic_phy[i]);
> +		if (ret < 0)
> +			goto err_exit_phy;
>  
> -	ret = phy_init(dwc->usb3_generic_phy);
> -	if (ret < 0)
> -		goto err_exit_usb2_phy;
> +		ret = phy_init(dwc->usb3_generic_phy[i]);
> +		if (ret < 0) {
> +			phy_exit(dwc->usb2_generic_phy[i]);
> +			goto err_exit_phy;
> +		}
> +	}
>  
>  	return 0;
>  
> -err_exit_usb2_phy:
> -	phy_exit(dwc->usb2_generic_phy);
> -err_shutdown_usb3_phy:
> +err_exit_phy:
> +	for (j = i - 1; j >= 0; j--) {
> +		phy_exit(dwc->usb2_generic_phy[j]);
> +		phy_exit(dwc->usb3_generic_phy[j]);

Try to always unwind in reverse order so in this case move phy_exit()
for usb3 before usb2 here too.

> +	}
> +
>  	usb_phy_shutdown(dwc->usb3_phy);
>  	usb_phy_shutdown(dwc->usb2_phy);

> @@ -783,23 +829,32 @@ static void dwc3_phy_exit(struct dwc3 *dwc)
>  static int dwc3_phy_power_on(struct dwc3 *dwc)
>  {
>  	int ret;
> +	int i;
> +	int j;
>  
>  	usb_phy_set_suspend(dwc->usb2_phy, 0);
>  	usb_phy_set_suspend(dwc->usb3_phy, 0);
>  
> -	ret = phy_power_on(dwc->usb2_generic_phy);
> -	if (ret < 0)
> -		goto err_suspend_usb3_phy;
> +	for (i = 0; i < dwc->num_usb2_ports; i++) {
> +		ret = phy_power_on(dwc->usb2_generic_phy[i]);
> +		if (ret < 0)
> +			goto err_power_off_phy;
>  
> -	ret = phy_power_on(dwc->usb3_generic_phy);
> -	if (ret < 0)
> -		goto err_power_off_usb2_phy;
> +		ret = phy_power_on(dwc->usb3_generic_phy[i]);
> +		if (ret < 0) {
> +			phy_power_off(dwc->usb2_generic_phy[i]);
> +			goto err_power_off_phy;
> +		}
> +	}
>  
>  	return 0;
>  
> -err_power_off_usb2_phy:
> -	phy_power_off(dwc->usb2_generic_phy);
> -err_suspend_usb3_phy:
> +err_power_off_phy:
> +	for (j = i - 1; j >= 0; j--) {
> +		phy_power_off(dwc->usb2_generic_phy[j]);
> +		phy_power_off(dwc->usb3_generic_phy[j]);

Same here.

> +	}
> +
>  	usb_phy_set_suspend(dwc->usb3_phy, 1);
>  	usb_phy_set_suspend(dwc->usb2_phy, 1);

> @@ -1346,7 +1410,9 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
>  {
>  	struct device		*dev = dwc->dev;
>  	struct device_node	*node = dev->of_node;
> +	char phy_name[13];
>  	int ret;
> +	int i;
>  
>  	if (node) {
>  		dwc->usb2_phy = devm_usb_get_phy_by_phandle(dev, "usb-phy", 0);
> @@ -1372,22 +1438,36 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
>  			return dev_err_probe(dev, ret, "no usb3 phy configured\n");
>  	}
>  
> -	dwc->usb2_generic_phy = devm_phy_get(dev, "usb2-phy");
> -	if (IS_ERR(dwc->usb2_generic_phy)) {
> -		ret = PTR_ERR(dwc->usb2_generic_phy);
> -		if (ret == -ENOSYS || ret == -ENODEV)
> -			dwc->usb2_generic_phy = NULL;
> +	for (i = 0; i < dwc->num_usb2_ports; i++) {
> +		if (dwc->num_usb2_ports == 1)
> +			sprintf(phy_name, "usb2-phy");
>  		else
> -			return dev_err_probe(dev, ret, "no usb2 phy configured\n");
> -	}
> +			sprintf(phy_name, "usb2-port%d", i);
>  
> -	dwc->usb3_generic_phy = devm_phy_get(dev, "usb3-phy");
> -	if (IS_ERR(dwc->usb3_generic_phy)) {
> -		ret = PTR_ERR(dwc->usb3_generic_phy);
> -		if (ret == -ENOSYS || ret == -ENODEV)
> -			dwc->usb3_generic_phy = NULL;
> +		dwc->usb2_generic_phy[i] = devm_phy_get(dev, phy_name);
> +		if (IS_ERR(dwc->usb2_generic_phy[i])) {
> +			ret = PTR_ERR(dwc->usb2_generic_phy[i]);
> +			if (ret == -ENOSYS || ret == -ENODEV)
> +				dwc->usb2_generic_phy[i] = NULL;
> +			else
> +				return dev_err_probe(dev, ret,
> +					"failed to lookup phy %s\n", phy_name);

Continuation lines should be intented at least two tabs further.

I generally suggest adding brackets around blocks with multiline
statements to improve readability but if you move the string to the
previous line and intend the continuation line (phy_name) one tab more I
guess that's fine.

> +		}
> +
> +		if (dwc->num_usb2_ports == 1)
> +			sprintf(phy_name, "usb3-phy");
>  		else
> -			return dev_err_probe(dev, ret, "no usb3 phy configured\n");
> +			sprintf(phy_name, "usb3-port%d", i);
> +
> +		dwc->usb3_generic_phy[i] = devm_phy_get(dev, phy_name);
> +		if (IS_ERR(dwc->usb3_generic_phy[i])) {
> +			ret = PTR_ERR(dwc->usb3_generic_phy[i]);
> +			if (ret == -ENOSYS || ret == -ENODEV)
> +				dwc->usb3_generic_phy[i] = NULL;
> +			else
> +				return dev_err_probe(dev, ret,
> +					"failed to lookup phy %s\n", phy_name);

Same here.

> +		}
>  	}
>  
>  	return 0;

> @@ -1892,9 +1975,12 @@ static int dwc3_read_port_info(struct dwc3 *dwc)
>  
>  	dev_dbg(dwc->dev, "hs-ports: %u ss-ports: %u\n",
>  			dwc->num_usb2_ports, dwc->num_usb3_ports);
> -

Drop this random change.

>  	iounmap(base);
>  
> +	if ((dwc->num_usb2_ports > DWC3_MAX_PORTS) ||
> +		(dwc->num_usb3_ports > DWC3_MAX_PORTS))

Again, continuation lines should be indented at least two tabs further.

> +		return -ENOMEM;
> +
>  	return 0;
>  }

> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 2ea6df7e6571..fc5d15edab1c 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -33,6 +33,9 @@
>  
>  #include <linux/power_supply.h>
>  
> +/* Number of ports supported by a multiport controller */

	/*
	 * Maximum number of ports currently supported for multiport
	 * controllers.
	 */

> +#define DWC3_MAX_PORTS 4
> +
>  #define DWC3_MSG_MAX	500
>  
>  /* Global constants */
> @@ -1029,8 +1032,8 @@ struct dwc3_scratchpad_array {
>   * @usb_psy: pointer to power supply interface.
>   * @usb2_phy: pointer to USB2 PHY
>   * @usb3_phy: pointer to USB3 PHY
> - * @usb2_generic_phy: pointer to USB2 PHY
> - * @usb3_generic_phy: pointer to USB3 PHY
> + * @usb2_generic_phy: pointer to array of USB2 PHY
> + * @usb3_generic_phy: pointer to array of USB3 PHY

s/PHY/PHYs/

>   * @num_usb2_ports: number of USB2 ports
>   * @num_usb3_ports: number of USB3 ports
>   * @phys_ready: flag to indicate that PHYs are ready

Johan

