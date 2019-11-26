Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C69771097E6
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2019 03:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbfKZCuc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Nov 2019 21:50:32 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:15900 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbfKZCuc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Nov 2019 21:50:32 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ddc92fb0000>; Mon, 25 Nov 2019 18:50:35 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 25 Nov 2019 18:50:31 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 25 Nov 2019 18:50:31 -0800
Received: from [10.19.108.118] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 26 Nov
 2019 02:50:30 +0000
Subject: Re: [PATCH 01/10] usb: host: xhci-tegra: Fix "tega" -> "tegra" typo
To:     Thierry Reding <thierry.reding@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Jon Hunter <jonathanh@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        <linux-usb@vger.kernel.org>, <linux-tegra@vger.kernel.org>
References: <20191125123210.1564323-1-thierry.reding@gmail.com>
 <20191125123210.1564323-2-thierry.reding@gmail.com>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <d5fcfb0c-7c2f-7d1c-b7e7-20977d60f062@nvidia.com>
Date:   Tue, 26 Nov 2019 10:50:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191125123210.1564323-2-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1574736635; bh=1H+dEd1NafKkz8/NDNK4+pWjOWEcyCrUNoNf0H+F4FU=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=EXzB2l7ddoOb3O6rWpRg53hOCr32QJ5dVlZ9kaiJdzIIkSoJQsv2HbzK2928k5SKW
         RBVKOuQUUypOufwWKMD9xfVkW90CqY+E7ohEQV19DS8/j7ZFx0g1vj3A0WQSphk7MD
         Pge5TFL88Bswhz5XjzAeruKQpKdOOVrmogW3GeQZgVpvTKAQvTbCt3YTCsNGoFGoxM
         Haqdn/rE1nIVILBRdiAoR5mUCiSdMROaqygDpA0kT0aktvWuEQEQSDx5JkrlTX8FOl
         2yZQeRbZQ8dfGc2LhtCVu/zbln1rQIwPIf1hx3p8+jPjANuLV4YBM7CGhM2gIMbbMi
         bRvcRru6cj10g==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Reviewed-by: JC Kuo <jckuo@nvidia.com>

On 11/25/19 8:32 PM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The tegra_xusb_mbox_regs structure was misspelled tega_xusb_mbox_regs.
> Fortunately this was done consistently so it didn't cause any issues.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index bf9065438320..aa1c4e5fd750 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -145,7 +145,7 @@ struct tegra_xusb_phy_type {
>  	unsigned int num;
>  };
>  
> -struct tega_xusb_mbox_regs {
> +struct tegra_xusb_mbox_regs {
>  	u16 cmd;
>  	u16 data_in;
>  	u16 data_out;
> @@ -166,7 +166,7 @@ struct tegra_xusb_soc {
>  		} usb2, ulpi, hsic, usb3;
>  	} ports;
>  
> -	struct tega_xusb_mbox_regs mbox;
> +	struct tegra_xusb_mbox_regs mbox;
>  
>  	bool scale_ss_clock;
>  	bool has_ipfs;
> 
