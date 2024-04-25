Return-Path: <linux-usb+bounces-9780-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7EA8B291A
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 21:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F431285583
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 19:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C785415251C;
	Thu, 25 Apr 2024 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="nT4RwQjZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBAA152515
	for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 19:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714074041; cv=none; b=frYBN3VQ2jDEnvAPlGj49OrALCxluAlH2V8jQ0I8l2eJDYYmxxUQIY/kzKVPYNO54Bj2k+Y6XezanlQd0+Ek+bhXcxy7HugYTGwXczmUj8kZNc+2uh/t2OHgZ/O8zrlLE3XFrVg4L4gnX8pjM+YT59OjjTEOEzsvQIJfXOrifw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714074041; c=relaxed/simple;
	bh=NxRn6wwHeZl2W6m95OUrYBSMLuu68n9JunWUCNzxpKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=A28AKOJypOwQSFTqURPy5GDWQxEpiVGYK/p7LNDxvob2LHQGCTDdiMX4PjKluyr5iH5/tQjq0n90V49s/qntDSCZEKSY37okXZaBdYSr/YJ4SypnBtnEwrf9tTogo8SZTiqcskJZgWQlrpVfBZjUXvlDoG75UJdHhJj0b+aNmWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=nT4RwQjZ; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240425194035euoutp026a1b2d0cb2829f38b6ddc4bb30ba0724~JnUDjtjha2348623486euoutp02k
	for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 19:40:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240425194035euoutp026a1b2d0cb2829f38b6ddc4bb30ba0724~JnUDjtjha2348623486euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1714074035;
	bh=+ve4YzZPSzdZ+iyibvf0yaqAhYlUh+0zk0V42/Z+YIg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=nT4RwQjZLbNKK3ZXH8LXA+L749MfFdKG9pEfyQ68SB1/pZDi4aIlVBXooQyu2TVg8
	 qHZgZHzS0Kno0EI6VuLpcSHLJUAeN3qp3YrV3+nKVj9FE4b6qwk87ccn6i6mHEqtq0
	 Ec1CD4srUUuUu106509GC4eX+jE9RG4kLsDwgFmc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240425194034eucas1p10c61dbd2c10c7bb4da3435267dc04cf7~JnUC0H6uU1754517545eucas1p1K;
	Thu, 25 Apr 2024 19:40:34 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 3C.01.09620.2B1BA266; Thu, 25
	Apr 2024 20:40:34 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240425194033eucas1p2c1e98d1c55c970e246087e2dab180e84~JnUCPRHI62101121011eucas1p2T;
	Thu, 25 Apr 2024 19:40:33 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240425194033eusmtrp227da945401031d3afe99d684284ef0d5~JnUCOzDG_2742827428eusmtrp2U;
	Thu, 25 Apr 2024 19:40:33 +0000 (GMT)
X-AuditID: cbfec7f5-d31ff70000002594-a2-662ab1b26f49
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 70.AF.09010.1B1BA266; Thu, 25
	Apr 2024 20:40:33 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240425194033eusmtip17d3bc8e97a0af5fefdf5d9fdf2bcd9d2~JnUB2lUxd1368613686eusmtip1X;
	Thu, 25 Apr 2024 19:40:33 +0000 (GMT)
Message-ID: <21ea292a-b1d1-43e2-92ab-9f1f63aaf729@samsung.com>
Date: Thu, 25 Apr 2024 21:40:32 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: chipidea: move ci_ulpi_init after the phy
 initialization
To: Michael Grzeschik <m.grzeschik@pengutronix.de>, Peter Chen
	<peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20240328-chipidea-phy-misc-v1-1-907d9de5d4df@pengutronix.de>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleLIzCtJLcpLzFFi42LZduzned1NG7XSDE5PF7ZoXryezeLyrjls
	FouWtTJbbGm7wmTxa/8mFgdWj02rOtk89s9dw+7R/9fA4/MmuQCWKC6blNSczLLUIn27BK6M
	tfvPMxbMEK34umAFcwNjj2AXIyeHhICJxIkDPYxdjFwcQgIrGCXaF11ih3C+MEqsP7oGKvOZ
	UWLC2V5WmJYNS59CVS1nlNg18RAbhPORUWLb7ktgVbwCdhJnZr1lBrFZBFQlGp8/YIKIC0qc
	nPmEBcQWFZCXuH9rBjuILSwQInF51RmwQSICnYwS21u+ADVzcDALWEv83JcPUsMsIC5x68l8
	sDlsAoYSXW+72EBsTgEvie9Nr1khauQltr+dwwwyR0LgBIfEzS0bmCHOdpG4NHs9lC0s8er4
	FnYIW0bi/06QoSAN7YwSC37fh3ImMEo0PL/FCFFlLXHn3C82iIs0Jdbv0ocIO0qsbL3MDhKW
	EOCTuPFWEOIIPolJ26YzQ4R5JTrahCCq1SRmHV8Ht/bghUvMExiVZiEFyywkb85C8s4shL0L
	GFlWMYqnlhbnpqcWG+ellusVJ+YWl+al6yXn525iBKaZ0/+Of93BuOLVR71DjEwcjIcYJTiY
	lUR4b37USBPiTUmsrEotyo8vKs1JLT7EKM3BoiTOq5oinyokkJ5YkpqdmlqQWgSTZeLglGpg
	kj/PK7vd4ZWx9Q3BOdMPLriXN+VkXX3ulkM/xZzvzr7VdMZ37sNTZ7IjCvYIbldbktL98NTs
	Ci2xvtTntrWCbm3hErZr9sUu3/xa82jb5xR77zmCi+6n5bzazSDFcpBFSoFvr9WG5FXhctGb
	OIJaljeK/OnkNZr49N2NeL+rInnL1sw6bPJasGLS3dJHCzb/DujcsX1yUFix4r/rCxIkOJcb
	Xbl1Oud89JWL0qdLVV/7SnbkZTTqlHve/LVHvq/0LH9balSjzfnLOzJaBQ5sdJvv4p0Wuvq0
	walDG8z38PcouBxVDWfWMf5t7bqKx1tJ0tRKqZjlM3N+TPAlf/PW31/OXV7n6CUVZrFs4ey7
	SizFGYmGWsxFxYkAegJTe6IDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRmVeSWpSXmKPExsVy+t/xu7obN2qlGWz+pGnRvHg9m8XlXXPY
	LBYta2W22NJ2hcni1/5NLA6sHptWdbJ57J+7ht2j/6+Bx+dNcgEsUXo2RfmlJakKGfnFJbZK
	0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZa/efZyyYIVrxdcEK5gbGHsEu
	Rk4OCQETiQ1Ln7J3MXJxCAksZZS4v2MOI0RCRuLktAZWCFtY4s+1LjaIoveMErfez2ADSfAK
	2EmcmfWWGcRmEVCVaHz+gAkiLihxcuYTFhBbVEBe4v6tGewgtrBAiMTlVWfABokIdDNKrNjX
	CLSBg4NZwFri5758kBohAU+J/qcQi5kFxCVuPZkPNpNNwFCi620X2F5OAS+J702voWrMJLq2
	djFC2PIS29/OYZ7AKDQLyRmzkIyahaRlFpKWBYwsqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3
	MQKjatuxn1t2MK589VHvECMTB+MhRgkOZiUR3psfNdKEeFMSK6tSi/Lji0pzUosPMZoCw2Ii
	s5Rocj4wrvNK4g3NDEwNTcwsDUwtzYyVxHk9CzoShQTSE0tSs1NTC1KLYPqYODilGphi9ix/
	PfMGA/97uePT+evNtIK3sFYfvFivW3fzdu/J2u3rO716f9qqd0+55OAoubdlkgRj776I71sW
	ZJ1TNDBr3762eY3+PtPg7dcyZ0gf7J60appK4/UiP5d6n6J19+cuL9foOB0R9MB7ZsHKuZEM
	xW9S5lZtZ5qZfsHwvk2RmSyPd6XZ4pxP1W8WuWpF8ebc1C+o3ff89dII7dLtqbzm9w98PK5h
	edt5cdCDlACFilfCn6s+lr3ZcDFQu/EHc3e9wkwNIVeZVxc2fqp4EH+z6XNSuBDDdHfmFVO1
	HT7fsWIXYqqMX9gzy7Jrve7ibyvPsZpOv+cdnB+8eP6ltz18r7iWvzJ4+PDr6opv4TeUWIoz
	Eg21mIuKEwEY5nfmMwMAAA==
X-CMS-MailID: 20240425194033eucas1p2c1e98d1c55c970e246087e2dab180e84
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240425194033eucas1p2c1e98d1c55c970e246087e2dab180e84
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240425194033eucas1p2c1e98d1c55c970e246087e2dab180e84
References: <20240328-chipidea-phy-misc-v1-1-907d9de5d4df@pengutronix.de>
	<CGME20240425194033eucas1p2c1e98d1c55c970e246087e2dab180e84@eucas1p2.samsung.com>

Dear All,

On 02.04.2024 08:23, Michael Grzeschik wrote:
> The function ci_usb_phy_init is already handling the
> hw_phymode_configure path which is also only possible after we have
> a valid phy. So we move the ci_ulpi_init after the phy initialization
> to be really sure to be able to communicate with the ulpi phy.
>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

This patch landed in linux-next some time ago as commit 22ffd399e6e7 
("usb: chipidea: move ci_ulpi_init after the phy initialization"). 
Unfortunately it breaks host USB operation on DragonBoard410c 
(arch/arm64/boot/dts/qcom/apq8016-sbc.dts). There is no error nor 
warning in the kernel log besides the information about deferred probe 
on the chipidea controller:

platform ci_hdrc.0: deferred probe pending: (reason unknown)

Tomorrow I will try to investigate which operation during driver probe 
triggers it. If there is anything else to check that might help fixing 
this issue, let me know.

> ---
>   drivers/usb/chipidea/core.c | 8 ++++----
>   drivers/usb/chipidea/ulpi.c | 5 -----
>   2 files changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 835bf2428dc6e..bada13f704b62 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -1084,10 +1084,6 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	}
>   
> -	ret = ci_ulpi_init(ci);
> -	if (ret)
> -		return ret;
> -
>   	if (ci->platdata->phy) {
>   		ci->phy = ci->platdata->phy;
>   	} else if (ci->platdata->usb_phy) {
> @@ -1142,6 +1138,10 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>   		goto ulpi_exit;
>   	}
>   
> +	ret = ci_ulpi_init(ci);
> +	if (ret)
> +		return ret;
> +
>   	ci->hw_bank.phys = res->start;
>   
>   	ci->irq = platform_get_irq(pdev, 0);
> diff --git a/drivers/usb/chipidea/ulpi.c b/drivers/usb/chipidea/ulpi.c
> index dfec07e8ae1d2..89fb51e2c3ded 100644
> --- a/drivers/usb/chipidea/ulpi.c
> +++ b/drivers/usb/chipidea/ulpi.c
> @@ -68,11 +68,6 @@ int ci_ulpi_init(struct ci_hdrc *ci)
>   	if (ci->platdata->phy_mode != USBPHY_INTERFACE_MODE_ULPI)
>   		return 0;
>   
> -	/*
> -	 * Set PORTSC correctly so we can read/write ULPI registers for
> -	 * identification purposes
> -	 */
> -	hw_phymode_configure(ci);
>   
>   	ci->ulpi_ops.read = ci_ulpi_read;
>   	ci->ulpi_ops.write = ci_ulpi_write;
>
> ---
> base-commit: 5bab5dc780c9ed0c69fc2f828015532acf4a7848
> change-id: 20240328-chipidea-phy-misc-b3f2bc814784
>
> Best regards,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


