Return-Path: <linux-usb+bounces-32116-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABCAD0B0F6
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 16:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4BE2302BD2F
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 15:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C160315D40;
	Fri,  9 Jan 2026 15:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="huRN57f+"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA9F50096E;
	Fri,  9 Jan 2026 15:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767973932; cv=none; b=bPXcWlA4pWxfiyWQn9b32xDZMVOWlWNNzgtK8TLKwFO7GZOUhh+Qv3s27DtvlThEovyLaG2cXYwikAHo9NMSq0Nv2QeRY7ylUa2A9bkpZD+EhHNBsLT3JPe52xhZ96zztDVSQFxaUjCLVbHOP89XJHvtEGIhI2bcLdhZEb58tww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767973932; c=relaxed/simple;
	bh=TXxA7b3no4fXH8lwJ7ip5cnTGG2i4NNH17rObzNH5Rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELbNe1Me4B3jQ9LuRxhLCWlreY+xP+Ua0xVxCJIuNp5fidm6aFzwSyXYsgQ4KJaw2HT0IV0yBMHPjCRjszTezPURomv3FiVlhbyP3eb/TPUorWkgtJ7XdXIWbJPcJcquZD2FYM1lBGEtzvxWSrHPoa0Ij1iq+Rezj3Qgt12/nrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=huRN57f+; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <8f0e04a5-49df-4fe3-9c76-9a1c0bd822a0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767973928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wi70aGQUny7jTI3BL/ypcK7E+JBzUAPyJOtcq90snEs=;
	b=huRN57f+71pJi/jLSM4hVz5bddWdpKLtPz5pmViKyGPv0sAG7PLI4PoIDS7YQ5Zfumpmi0
	9p396OM5OwSdZtiGGGoVUU54izXji7PwijCdBeZ7gqq1fB5uffwqw0Q3HVpVgtsraZCEe0
	2Xa6B2/jNDnOw5ntZgKB+NeEaf6h9Rs=
Date: Fri, 9 Jan 2026 10:51:55 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] usb: dwc3: Always deassert xilinx resets
To: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>,
 "Frager, Neal" <neal.frager@amd.com>, "Simek, Michal"
 <michal.simek@amd.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260106171018.501612-1-sean.anderson@linux.dev>
 <20260109004901.ygts6mmcxy4vs3y2@synopsys.com>
 <MN0PR12MB59538C2F8613A9C0641BEAFBB782A@MN0PR12MB5953.namprd12.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <MN0PR12MB59538C2F8613A9C0641BEAFBB782A@MN0PR12MB5953.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/9/26 01:01, Pandey, Radhey Shyam wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
>> -----Original Message-----
>> From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>> Sent: Friday, January 9, 2026 6:19 AM
>> To: Sean Anderson <sean.anderson@linux.dev>
>> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>; open list:DESIGNWARE
>> USB3 DRD IP DRIVER <linux-usb@vger.kernel.org>; Frager, Neal
>> <neal.frager@amd.com>; Simek, Michal <michal.simek@amd.com>; open list
>> <linux-kernel@vger.kernel.org>; moderated list:ARM/ZYNQ ARCHITECTURE
>> <linux-arm-kernel@lists.infradead.org>; Philipp Zabel <p.zabel@pengutronix.de>;
>> Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>; Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org>
>> Subject: Re: [PATCH] usb: dwc3: Always deassert xilinx resets
>>
>> On Tue, Jan 06, 2026, Sean Anderson wrote:
>> > If we don't have a usb3 phy we don't need to assert the core resets.
>> > Deassert them even if we didn't assert them to support booting when
>> > the bootloader never released the core from reset.
> Is it a customized bootloader ? i.e it assert reset but don't deassert.

No. Most peripheral resets are asserted on PoR. So if the bootloader
doesn't deassert them then Linux has to.

My goal is to make init_serdes() in psu_init_gpl.c optional and do all
serdes initialization in the phy driver (and in the consumer drivers). I
have this working for DP/PCIe. I'm working on SATA, and I don't think
USB/SGMII need much special. This gives the following advantages:

- On some boards (mine) the reference clocks may not be configured in
  SPL/FSBL. So ILL calibration will fail (and take a long time to do so)
  unless we defer initialization to U-Boot/Linux where the phy driver
  can request the clocks.
- If PCIe/SATA are not used in U-Boot, ILL calibration can be deferred
  until Linux when it can be done it parallel with other initialization.
- We will have flexibility to switch between different serdes
  configurations at runtime. For example, this could allow the
  bootloader to fixup the devicetree to support PCIe and SATA M.2
  drives, depending on what the user has plugged in.

> I think ideally core /APB reset should be done independent on
> MAC 2.0/3.0 configuration.

I agree, but I think the existing code does this optimization to reduce
boot time when the bootloader has already initialized USB. I have
preserved that in this patch.

--Sean

> Not sure where the recommendation is
> coming from to only do it for 3.0 MAC. Let me check the IP spec.
> Thinh: Please chime in with your thoughts.
> 
>> >
>>
>> > Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> > ---
>> >
>> >  drivers/usb/dwc3/dwc3-xilinx.c | 67
>> > ++++++++++++++++------------------
>> >  1 file changed, 32 insertions(+), 35 deletions(-)
>> >
>>
>> This sounds like a fix. Does it need to be Cc Stable and backported?
>>
>> Regardless,
>>
>> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>>
>> Thanks,
>> Thinh
>>
>> > diff --git a/drivers/usb/dwc3/dwc3-xilinx.c
>> > b/drivers/usb/dwc3/dwc3-xilinx.c index 0a8c47876ff9..f41b0da5e89d
>> > 100644
>> > --- a/drivers/usb/dwc3/dwc3-xilinx.c
>> > +++ b/drivers/usb/dwc3/dwc3-xilinx.c
>> > @@ -132,21 +132,6 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx
>> *priv_data)
>> >             goto err;
>> >     }
>> >
>> > -   /*
>> > -    * The following core resets are not required unless a USB3 PHY
>> > -    * is used, and the subsequent register settings are not required
>> > -    * unless a core reset is performed (they should be set properly
>> > -    * by the first-stage boot loader, but may be reverted by a core
>> > -    * reset). They may also break the configuration if USB3 is actually
>> > -    * in use but the usb3-phy entry is missing from the device tree.
>> > -    * Therefore, skip these operations in this case.
>> > -    */
>> > -   if (!priv_data->usb3_phy) {
>> > -           /* Deselect the PIPE Clock Select bit in FPD PIPE Clock register */
>> > -           writel(PIPE_CLK_DESELECT, priv_data->regs +
>> XLNX_USB_FPD_PIPE_CLK);
>> > -           goto skip_usb3_phy;
>> > -   }
>> > -
>> >     crst = devm_reset_control_get_exclusive(dev, "usb_crst");
>> >     if (IS_ERR(crst)) {
>> >             ret = PTR_ERR(crst);
>> > @@ -171,22 +156,31 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx
>> *priv_data)
>> >             goto err;
>> >     }
>> >
>> > -   ret = reset_control_assert(crst);
>> > -   if (ret < 0) {
>> > -           dev_err(dev, "Failed to assert core reset\n");
>> > -           goto err;
>> > -   }
>> > +   /*
>> > +    * Asserting the core resets is not required unless a USB3 PHY is used.
>> > +    * They may also break the configuration if USB3 is actually in use but
>> > +    * the usb3-phy entry is missing from the device tree. Therefore, skip
>> > +    * a full reset cycle and just deassert the resets if the phy is
>> > +    * absent.
>> > +    */
>> > +   if (priv_data->usb3_phy) {
>> > +           ret = reset_control_assert(crst);
>> > +           if (ret < 0) {
>> > +                   dev_err(dev, "Failed to assert core reset\n");
>> > +                   goto err;
>> > +           }
>> >
>> > -   ret = reset_control_assert(hibrst);
>> > -   if (ret < 0) {
>> > -           dev_err(dev, "Failed to assert hibernation reset\n");
>> > -           goto err;
>> > -   }
>> > +           ret = reset_control_assert(hibrst);
>> > +           if (ret < 0) {
>> > +                   dev_err(dev, "Failed to assert hibernation reset\n");
>> > +                   goto err;
>> > +           }
>> >
>> > -   ret = reset_control_assert(apbrst);
>> > -   if (ret < 0) {
>> > -           dev_err(dev, "Failed to assert APB reset\n");
>> > -           goto err;
>> > +           ret = reset_control_assert(apbrst);
>> > +           if (ret < 0) {
>> > +                   dev_err(dev, "Failed to assert APB reset\n");
>> > +                   goto err;
>> > +           }
>> >     }
>> >
>> >     ret = phy_init(priv_data->usb3_phy); @@ -201,11 +195,15 @@ static
>> > int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
>> >             goto err;
>> >     }
>> >
>> > -   /* Set PIPE Power Present signal in FPD Power Present Register*/
>> > -   writel(FPD_POWER_PRSNT_OPTION, priv_data->regs +
>> XLNX_USB_FPD_POWER_PRSNT);
>> > -
>> > -   /* Set the PIPE Clock Select bit in FPD PIPE Clock register */
>> > -   writel(PIPE_CLK_SELECT, priv_data->regs +
>> XLNX_USB_FPD_PIPE_CLK);
>> > +   if (priv_data->usb3_phy) {
>> > +           /* Set PIPE Power Present signal in FPD Power Present Register*/
>> > +           writel(FPD_POWER_PRSNT_OPTION, priv_data->regs +
>> XLNX_USB_FPD_POWER_PRSNT);
>> > +           /* Set the PIPE Clock Select bit in FPD PIPE Clock register */
>> > +           writel(PIPE_CLK_SELECT, priv_data->regs +
>> XLNX_USB_FPD_PIPE_CLK);
>> > +   } else {
>> > +           /* Deselect the PIPE Clock Select bit in FPD PIPE Clock register */
>> > +           writel(PIPE_CLK_DESELECT, priv_data->regs +
>> XLNX_USB_FPD_PIPE_CLK);
>> > +   }
>> >
>> >     ret = reset_control_deassert(crst);
>> >     if (ret < 0) {
>> > @@ -225,7 +223,6 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx
>> *priv_data)
>> >             goto err;
>> >     }
>> >
>> > -skip_usb3_phy:
>> >     /* ulpi reset via gpio-modepin or gpio-framework driver */
>> >     reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>> >     if (IS_ERR(reset_gpio)) {
>> > --
>> > 2.35.1.1320.gc452695387.dirty
>> >

