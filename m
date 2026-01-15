Return-Path: <linux-usb+bounces-32390-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE3DD2461D
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 13:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B5E230393C5
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 12:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036643939A4;
	Thu, 15 Jan 2026 12:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEkSErFN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA0C318BA1;
	Thu, 15 Jan 2026 12:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768478752; cv=none; b=MZmQ4J5wWtPJWy7VNgNRTAemXlPROOv9gZwX1HHbcXVTNFovGOb4hEnUQf6mxOHsWPzuTEZ0nDjBeMxURwgFq6lWGw/WRNbyUKQGZf2S3pwadkhWXaGhKmb0vQGUKgf4ZudP6K3Y2BPkoVEjxoF38Fr0tbuSXuLJOcYByPi5xRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768478752; c=relaxed/simple;
	bh=gyEcUiyPUyExWka3HAxwmztaJczxw+a1BT05wunTPkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIaZfhQ7Dkysnq/6zxkWAAmoucGSFy/FcO3H1kGFDga4DlCktB0TcnqxjG79C+3kNCJD1sKXoVyDkwX5eEey62NdUSUk2YAj7xhTlsVcg8n+V/PmEPSqH/tanFrCW6Jajzdok5bgbjexHl8oS1VthBYrNza03PTZ0v/sHU5PKEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEkSErFN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96987C116D0;
	Thu, 15 Jan 2026 12:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768478752;
	bh=gyEcUiyPUyExWka3HAxwmztaJczxw+a1BT05wunTPkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UEkSErFNcunZoacCd9uro5tSYp9gBbvzRrbtzj+hB1FU9Srw2ig44fCLEcDduLYNm
	 HF3igZ69i5imQEaAjZPfl3/3onhQWzn8qyJNdd50Z821iJ7BKC/fhmRr8a9m+vA+Og
	 ocfbCmuIFwdk81Qn+TjlkHxexg2n3Sp1Eqq3ssZSAV8JgbXxLhojez3UHFWbGzhswN
	 mzvTq+qBU79Muu6k2YfzqyQS8ZjbqWC5kec2c6WPX1dZ3X1LGDNOkB9F3LvYD1CHZY
	 1CHueLYlmiUG4ty5Xw2FQ/lX+Io/DhIYt5iDKf+UYMlhyNm0lPlcU80G7ku+OeDadt
	 aGHrxrReyrmEA==
Date: Thu, 15 Jan 2026 17:35:48 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: conor@kernel.org, neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, 18771902331@163.com, cyy@cyyself.name,
	TroyMitchell988@gmail.com, kingxukai@zohomail.com,
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, gaohan@iscas.ac.cn
Subject: Re: [PATCH v2 3/4] phy: usb: Add driver for Canaan K230 USB 2.0 PHY
Message-ID: <aWjYHK1cTj8Dbz2B@vaman>
References: <20260115064223.21926-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260115064223.21926-4-jiayu.riscv@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115064223.21926-4-jiayu.riscv@isrc.iscas.ac.cn>

On 15-01-26, 14:42, Jiayu Du wrote:

> +static struct phy *k230_usb_phy_xlate(struct device *dev,
> +				      const struct of_phandle_args *args)
> +{
> +	struct k230_usb_phy_global *global = dev_get_drvdata(dev);
> +	struct k230_usb_phy_instance *phy_inst;
> +	struct phy *phy;
> +
> +	if (args->args[0] >= MAX_PHYS)
> +		return ERR_PTR(-EINVAL);
> +
> +	phy_inst = devm_kzalloc(dev, sizeof(*phy_inst), GFP_KERNEL);
> +	if (!phy_inst)
> +		return ERR_PTR(-ENOMEM);
> +
> +	phy_inst->global = global;
> +	phy_inst->index = args->args[0];
> +
> +	phy = devm_phy_create(dev, NULL, &k230_usb_phy_ops);
> +	if (IS_ERR(phy))
> +		return ERR_PTR(PTR_ERR(phy));
> +
> +	phy_set_drvdata(phy, phy_inst);

This seems wrong place, why is this not done in the driver probe?

> +
> +	return phy;
> +}
> +
> +static int k230_usb_phy_probe(struct platform_device *pdev)
> +{
> +	struct k230_usb_phy_global *global;
> +	struct device *dev = &pdev->dev;
> +	struct phy_provider *provider;
> +
> +	global = devm_kzalloc(dev, sizeof(*global), GFP_KERNEL);
> +	if (!global)
> +		return -ENOMEM;
> +	dev_set_drvdata(dev, global);
> +
> +	global->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(global->base))
> +		return dev_err_probe(dev, PTR_ERR(global->base),
> +				     "ioremap failed\n");
> +
> +	global->reg_test_offset[0] = 0x70;
> +	global->reg_ctl_offset[0] = 0xb0;
> +	global->reg_test_offset[1] = 0x90;
> +	global->reg_ctl_offset[1] = 0xb8;

Where are these magic values coming from?

-- 
~Vinod

