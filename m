Return-Path: <linux-usb+bounces-32117-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D10FD0B114
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 16:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48C4F308B35D
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 15:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C679A35CBDF;
	Fri,  9 Jan 2026 15:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="D8z/sT5G"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3942635CB63
	for <linux-usb@vger.kernel.org>; Fri,  9 Jan 2026 15:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767973951; cv=none; b=izgeRD8jGtWYVWRqYFpflXE7pDxPSYkDbNeKLeuWNRfz1KXxCDwKtvjy754C3zztV+we/5mC0MWSv7kmxYrFhNM/tkEK1BIuy2w5Q4x421qXzgy/LGW/dNNhgBW6BnSdrxaN4942/wu+7j1ok9pUbXSyBpv4NHa1KFbbhuzWK1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767973951; c=relaxed/simple;
	bh=EfQcIux9+3jl86zBCJAt4VwUhb7W+TLwLqqWmqmUkiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TQCcHePKtEY6IJCSvBM+TCVH4iotqUUBTRNJ1Rq+8b5DEhsK53qdv3bcZp3acRN/Niwmj8cK/w2CxEnx92muw/KGuzf9XgTpay/lAl9IFwAWSukLRCv1OzogbsrxTOBrXvObmQlC3rndxYk59Vc5uApquoUsihAoyOEMRL8wJwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=D8z/sT5G; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <be8a566a-163f-4d20-b712-67de6f63a6b5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767973945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PmHlZRi4mzGX5Unx3kgK3MeyeJjaxOKWaTfJb6jpBF0=;
	b=D8z/sT5GzvDYXuVVUi5zo3k5Ccjd3GoRKJNvYUsQWo9pHJpIeMCwgEitWNWmNi+l+qEfdw
	uzKrZVdqMzMijMxurXwUbgUqsf7enZW1YERbuC8Oybgj/CaXUrV8cLyia9VMuJiHuY9y+G
	EujR+aU8Ts7tKxl1AQOaR41mP6sQL5A=
Date: Fri, 9 Jan 2026 10:52:18 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] usb: dwc3: Always deassert xilinx resets
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>,
 Neal Frager <neal.frager@amd.com>, Michal Simek <michal.simek@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260106171018.501612-1-sean.anderson@linux.dev>
 <20260109004901.ygts6mmcxy4vs3y2@synopsys.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20260109004901.ygts6mmcxy4vs3y2@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/8/26 19:49, Thinh Nguyen wrote:
> On Tue, Jan 06, 2026, Sean Anderson wrote:
>> If we don't have a usb3 phy we don't need to assert the core resets.
>> Deassert them even if we didn't assert them to support booting when the
>> bootloader never released the core from reset.
>> 
> 
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>> 
>>  drivers/usb/dwc3/dwc3-xilinx.c | 67 ++++++++++++++++------------------
>>  1 file changed, 32 insertions(+), 35 deletions(-)
>> 
> 
> This sounds like a fix. Does it need to be Cc Stable and backported?

No, it's not a fix since the bootloaders currently in use on this
platform always initialize the serdes. But I want to add support for
skipping this initialization and this patch is necessary for that.

--Sean

> Regardless,
> 
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> 
> Thanks,
> Thinh
> 
>> diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
>> index 0a8c47876ff9..f41b0da5e89d 100644
>> --- a/drivers/usb/dwc3/dwc3-xilinx.c
>> +++ b/drivers/usb/dwc3/dwc3-xilinx.c
>> @@ -132,21 +132,6 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
>>  		goto err;
>>  	}
>>  
>> -	/*
>> -	 * The following core resets are not required unless a USB3 PHY
>> -	 * is used, and the subsequent register settings are not required
>> -	 * unless a core reset is performed (they should be set properly
>> -	 * by the first-stage boot loader, but may be reverted by a core
>> -	 * reset). They may also break the configuration if USB3 is actually
>> -	 * in use but the usb3-phy entry is missing from the device tree.
>> -	 * Therefore, skip these operations in this case.
>> -	 */
>> -	if (!priv_data->usb3_phy) {
>> -		/* Deselect the PIPE Clock Select bit in FPD PIPE Clock register */
>> -		writel(PIPE_CLK_DESELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
>> -		goto skip_usb3_phy;
>> -	}
>> -
>>  	crst = devm_reset_control_get_exclusive(dev, "usb_crst");
>>  	if (IS_ERR(crst)) {
>>  		ret = PTR_ERR(crst);
>> @@ -171,22 +156,31 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
>>  		goto err;
>>  	}
>>  
>> -	ret = reset_control_assert(crst);
>> -	if (ret < 0) {
>> -		dev_err(dev, "Failed to assert core reset\n");
>> -		goto err;
>> -	}
>> +	/*
>> +	 * Asserting the core resets is not required unless a USB3 PHY is used.
>> +	 * They may also break the configuration if USB3 is actually in use but
>> +	 * the usb3-phy entry is missing from the device tree. Therefore, skip
>> +	 * a full reset cycle and just deassert the resets if the phy is
>> +	 * absent.
>> +	 */
>> +	if (priv_data->usb3_phy) {
>> +		ret = reset_control_assert(crst);
>> +		if (ret < 0) {
>> +			dev_err(dev, "Failed to assert core reset\n");
>> +			goto err;
>> +		}
>>  
>> -	ret = reset_control_assert(hibrst);
>> -	if (ret < 0) {
>> -		dev_err(dev, "Failed to assert hibernation reset\n");
>> -		goto err;
>> -	}
>> +		ret = reset_control_assert(hibrst);
>> +		if (ret < 0) {
>> +			dev_err(dev, "Failed to assert hibernation reset\n");
>> +			goto err;
>> +		}
>>  
>> -	ret = reset_control_assert(apbrst);
>> -	if (ret < 0) {
>> -		dev_err(dev, "Failed to assert APB reset\n");
>> -		goto err;
>> +		ret = reset_control_assert(apbrst);
>> +		if (ret < 0) {
>> +			dev_err(dev, "Failed to assert APB reset\n");
>> +			goto err;
>> +		}
>>  	}
>>  
>>  	ret = phy_init(priv_data->usb3_phy);
>> @@ -201,11 +195,15 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
>>  		goto err;
>>  	}
>>  
>> -	/* Set PIPE Power Present signal in FPD Power Present Register*/
>> -	writel(FPD_POWER_PRSNT_OPTION, priv_data->regs + XLNX_USB_FPD_POWER_PRSNT);
>> -
>> -	/* Set the PIPE Clock Select bit in FPD PIPE Clock register */
>> -	writel(PIPE_CLK_SELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
>> +	if (priv_data->usb3_phy) {
>> +		/* Set PIPE Power Present signal in FPD Power Present Register*/
>> +		writel(FPD_POWER_PRSNT_OPTION, priv_data->regs + XLNX_USB_FPD_POWER_PRSNT);
>> +		/* Set the PIPE Clock Select bit in FPD PIPE Clock register */
>> +		writel(PIPE_CLK_SELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
>> +	} else {
>> +		/* Deselect the PIPE Clock Select bit in FPD PIPE Clock register */
>> +		writel(PIPE_CLK_DESELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
>> +	}
>>  
>>  	ret = reset_control_deassert(crst);
>>  	if (ret < 0) {
>> @@ -225,7 +223,6 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
>>  		goto err;
>>  	}
>>  
>> -skip_usb3_phy:
>>  	/* ulpi reset via gpio-modepin or gpio-framework driver */
>>  	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>>  	if (IS_ERR(reset_gpio)) {
>> -- 
>> 2.35.1.1320.gc452695387.dirty
>> 

