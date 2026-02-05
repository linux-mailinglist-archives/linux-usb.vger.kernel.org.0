Return-Path: <linux-usb+bounces-33116-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EBaIT1LhGm82QMAu9opvQ
	(envelope-from <linux-usb+bounces-33116-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 08:48:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9AAEF936
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 08:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A3803019190
	for <lists+linux-usb@lfdr.de>; Thu,  5 Feb 2026 07:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A84A35F8A7;
	Thu,  5 Feb 2026 07:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t6igMoyz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB65B31B836;
	Thu,  5 Feb 2026 07:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770277611; cv=none; b=O5H0P4yRgqXpFQSgCTx+hHtCrcVdL2PoQXXy6NJOdezvq15nhFs6dZtzS0Mp0OFcFLVJK3YR8N/OJKvrpinzYVsqcy2+ORGMxbL9sThDs4gi9vrn+jMrwUnz8EX1j5Y83WQDWpIn8KW32IXoa71a0sakSdJ8CmL2DGePN5RNs+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770277611; c=relaxed/simple;
	bh=s8L9I7EB/iuzJpgXM9qjt6ubKbWYNVz45wTmfz3GthI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPG7Dv4DEEcf/ko0e6tdKW59GbwVk3Ir5xdEWd85iSZk7W3GbA2WuA/lTPTXyTPeQKWifTEn2PC+vBT/3uJna7T9aykKL1D9kSYa5WPhIX2/4R0ynxa4WeNwd/CExCJbtCVAwm7To2PJ4HFrxytuohbQoXDkeq1kDGi3jDlwRko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t6igMoyz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2075C4CEF7;
	Thu,  5 Feb 2026 07:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770277610;
	bh=s8L9I7EB/iuzJpgXM9qjt6ubKbWYNVz45wTmfz3GthI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t6igMoyz6eWo1nPv4cLyjXLRWLPg8/PB3vTuTYgI2xScEVsoZiJaE+1WJ+IXsGND9
	 8hx+93uFFrtKimz/nIffCt2NCuDVLgNGx5RwQSrAimep0mI9RQahxyCI5An3qF9qMe
	 nYj1KMOvhnVZaSFZ9sXcvKtAwCMyftb6lTnAxjYJY3wDUL2kAuhjx4jaSgm8xauXuI
	 fl/aVRfsZIj0sEJtcqbCch3sz56NNNtK23Z0Ys6M7OinyDlwKkgjv6bYAmbaSfL6tt
	 //rVm3ne7WbAFnmZ4DfkE6hAaxkvsfB43ggAbmqC5PUftyrrqQU4zomzqGsuw8y783
	 WlJemxmRcrUaQ==
Message-ID: <82f7f4f4-6f88-4293-ae13-5da9d7252efa@kernel.org>
Date: Thu, 5 Feb 2026 08:46:46 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] usb: gadget: udc: Add UDC driver for Axiado Device
 controller IP Corigine
To: Vladimir Moravcevic <vmoravcevic@axiado.com>,
 Krutik Shah <krutikshah@axiado.com>, Prasad Bolisetty
 <pbolisetty@axiado.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20260202-axiado-ax3000-usb-device-controller-v1-0-45ce0a8b014f@axiado.com>
 <20260202-axiado-ax3000-usb-device-controller-v1-2-45ce0a8b014f@axiado.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260202-axiado-ax3000-usb-device-controller-v1-2-45ce0a8b014f@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33116-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DE9AAEF936
X-Rspamd-Action: no action

On 02/02/2026 14:16, Vladimir Moravcevic wrote:
> Add Corigine USB IP Driver for Axiado AX3000 SoC's
> USB peripheral (USB 2.0/3.0).
> The driver is based on the Corigine USB IP core with
> Axiado-specific enhancements including VBUS detection and USB link
> stability fixes.


This driver looks way too complicated for simple USB controller, so I
guess you just re-implemented a lot of Linux stack or other drivers.

Also did not pass basic litmus test for sending usu 15 year old junk
code, which disqualifies it from review IMO. There is simply no point to
review code from 15 yaers ago - you should never start with such code.

> +static const struct crg_udc_priv ax3000_plat_setup_gen2 = {
> +	.plat_setup_gen3 = false,
> +};
> +
> +static const struct crg_udc_priv ax3000_plat_setup_gen3 = {
> +	.plat_setup_gen3 = true,
> +};
> +
> +/**
> + * crg_gadget_probe - Initializes gadget driver
> + *
> + *
> + * Returns 0 on success otherwise negative errno.
> + */

Completely pointless and wrongly placed comment. Do not ever add such
comments.

> +
> +static const struct of_device_id of_crg_udc_match[] = {
> +	{
> +		.compatible = "axiado,ax3000-udc",
> +		.data = &ax3000_plat_setup_gen2
> +	},
> +	{
> +		.compatible = "axiado,ax3000-udc-gen3",
> +		.data = &ax3000_plat_setup_gen3
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, of_crg_udc_match);
> +
> +static int crg_udc_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	int i;
> +	struct crg_gadget_dev *crg_udc;
> +	static int udc_gcnt = INIT_ZERO;
> +	char udc_gname[10] = {""};
> +	const struct crg_udc_priv *priv;
> +
> +	priv = of_device_get_match_data(&pdev->dev);
> +	sprintf(udc_gname, "gadget-%d", udc_gcnt);
> +	crg_udc = devm_kzalloc(&pdev->dev, sizeof(*crg_udc), GFP_KERNEL);
> +	if (!crg_udc)
> +		return -ENOMEM;
> +	crg_udc->dev = &pdev->dev;
> +
> +	spin_lock_init(&crg_udc->udc_lock);
> +	platform_set_drvdata(pdev, crg_udc);
> +
> +	dev_set_name(&crg_udc->gadget.dev, udc_gname);
> +	crg_udc->gadget.ops = &crg_gadget_ops;
> +	crg_udc->gadget.ep0 = &crg_udc->udc_ep[0].usb_ep;
> +	crg_udc->gadget.dev.parent = &pdev->dev;
> +	INIT_LIST_HEAD(&crg_udc->gadget.ep_list);
> +	if (priv->plat_setup_gen3) {
> +		crg_udc->gadget.max_speed = USB_SPEED_SUPER;
> +		crg_udc->gadget.speed = USB_SPEED_SUPER;
> +	} else {
> +		crg_udc->gadget.max_speed = USB_SPEED_HIGH;
> +		crg_udc->gadget.speed = USB_SPEED_HIGH;
> +	}
> +	crg_udc->gadget.name = udc_gname;
> +	crg_udc->gadget.sg_supported = true;
> +	dev_dbg(crg_udc->dev, "%s sg support\n", __func__);
> +	crg_udc->connected = 0;
> +	crg_udc->dev_addr = 0;
> +
> +	crg_udc->udc_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!crg_udc->udc_res) {
> +		dev_err(&pdev->dev, "missing memory resource\n");
> +		return -ENODEV;
> +	}
> +
> +	crg_udc->mmio_virt_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(crg_udc->mmio_virt_base)) {
> +		dev_err(&pdev->dev, "mmio ioremap failed\n");
> +		return PTR_ERR(crg_udc->mmio_virt_base);
> +	}
> +
> +	/* set controller device role*/
> +	writel((readl(crg_udc->mmio_virt_base + CRG_UDC_MODE_REG) |
> +		 CRGUDC_ROLE_DEVICE),
> +		 crg_udc->mmio_virt_base + CRG_UDC_MODE_REG);
> +	for (i = 0; i < CRG_RING_NUM; i++) {
> +		crg_udc->uicr[i] = crg_udc->mmio_virt_base +
> +				CRG_UICR_OFFSET + i * CRG_UICR_STRIDE;
> +
> +		dev_dbg(crg_udc->dev, "crg_udc->uicr[%d] = %p\n", i,
> +			crg_udc->uicr[i]);
> +	}
> +	crg_udc->uccr = crg_udc->mmio_virt_base + CRG_UCCR_OFFSET;
> +
> +	crg_udc_reset(crg_udc);
> +
> +	crg_udc_clear_portpm(crg_udc);
> +
> +	ret = reset_data_struct(crg_udc);
> +	if (ret) {
> +		dev_err(crg_udc->dev, "reset_data_struct error\n");
> +		goto err0;
> +	}
> +
> +	init_ep_info(crg_udc);
> +	init_ep0(crg_udc);
> +
> +	EP0_Start(crg_udc);

Did you read coding style?

> +
> +	crg_gadget_irq_init(pdev, crg_udc);
> +
> +	ret = usb_add_gadget_udc(&pdev->dev, &crg_udc->gadget);
> +	if (ret)
> +		goto err0;
> +
> +	udc_gcnt++;
> +
> +	return 0;
> +
> +err0:
> +	return -1;

What?

> +}
> +
> +static void crg_udc_remove(struct platform_device *pdev)
> +{
> +	struct crg_gadget_dev *crg_udc = platform_get_drvdata(pdev);
> +	u32 tmp = 0;
> +
> +	dev_dbg(crg_udc->dev, "%s %d called\n", __func__, __LINE__);
> +
> +	crg_udc->device_state = USB_STATE_ATTACHED;
> +	crg_vbus_detect(crg_udc, 0);
> +
> +	usb_del_gadget_udc(&crg_udc->gadget);
> +
> +	/* set controller host role*/
> +	tmp = readl(crg_udc->mmio_virt_base + CRG_UDC_MODE_REG) & ~0x1;
> +	writel(tmp, crg_udc->mmio_virt_base + CRG_UDC_MODE_REG);
> +
> +	if (crg_udc->irq)
> +		free_irq(crg_udc->irq, crg_udc);
> +
> +	platform_set_drvdata(pdev, 0);
> +
> +	dev_dbg(crg_udc->dev, "%s %d gadget remove\n", __func__, __LINE__);

Drop all such debugs.

> +
> +}
> +
> +static void crg_udc_shutdown(struct platform_device *pdev)
> +{
> +	struct crg_gadget_dev *crg_udc = platform_get_drvdata(pdev);
> +
> +	dev_dbg(crg_udc->dev, "%s %d called\n", __func__, __LINE__);

It's really pointless code.

> +
> +	crg_udc->device_state = USB_STATE_ATTACHED;
> +	crg_vbus_detect(crg_udc, 0);
> +	usb_del_gadget_udc(&crg_udc->gadget);
> +
> +	if (crg_udc->irq)
> +		free_irq(crg_udc->irq, crg_udc);
> +	/*
> +	 * Clear the drvdata pointer.
> +	 */
> +	platform_set_drvdata(pdev, 0);
> +}
> +
> +#ifdef CONFIG_PM
> +static int crg_udc_suspend(struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static int crg_udc_resume(struct device *dev)
> +{
> +
> +
> +	return 0;
> +}
> +#else
> +#define crg_udc_suspend	NULL
> +#define crg_udc_resume	NULL
> +#endif
> +
> +static const struct dev_pm_ops crg_udc_pm_ops = {
> +	.suspend = crg_udc_suspend,
> +	.resume = crg_udc_resume,
> +};
> +
> +static struct platform_driver crg_udc_driver = {
> +	.probe = crg_udc_probe,
> +	.remove = crg_udc_remove,
> +	.shutdown = crg_udc_shutdown,
> +	.driver			= {
> +		.name		= "crg_udc",
> +		.owner		= THIS_MODULE,

Do not upstream 10 or 15 year old driver. Why do we need to repeat all
the same comments as we repeated for last 15 years? Take newest driver
as starting point, not 15 year old code. You just replicated all old issues.



Best regards,
Krzysztof

