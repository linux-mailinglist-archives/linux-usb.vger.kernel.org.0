Return-Path: <linux-usb+bounces-19907-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 354B4A23F8A
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2025 16:18:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1CFD188338F
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2025 15:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2AD1E47B4;
	Fri, 31 Jan 2025 15:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ZGXNxBYD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEF91CB9F0
	for <linux-usb@vger.kernel.org>; Fri, 31 Jan 2025 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738336720; cv=none; b=Jw2OcUXz02iJVF7C/8cCkxDx4plsvKt2BC9Qv4rm79iTt9cdUUw9QEag5lusRm0w4eCis6d51MgHQdqqng5Yyn6NsfCXdP93a/ysI9JBcBIW1gNwNDhW1NzOdeGB7ha6eBruNCZtsno9WdCi4jT/OQON4o0Ol1bkFZTglYVzJQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738336720; c=relaxed/simple;
	bh=Yh5e9pbZP2iUSKUl6lXSpqBSTfy6QZ+CAV1PK4bL86w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okKTldYZL/C2Syv0ftenrKQ9bty5a6QNJBNDDmu3hO/6mrB9ndednwtfMnKlok8M9V37YWIjowsculsCoqwbs8D41tr84ARkmDf5KqU0DN7vyIKgLRfCFQsVj5//wd4CyL7BrPKCsuu9PLVC7YKXxNNgd+0SYexAqpwAH6vr5l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ZGXNxBYD; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6d8f99cb0d9so18017006d6.0
        for <linux-usb@vger.kernel.org>; Fri, 31 Jan 2025 07:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1738336716; x=1738941516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HmcAvYq6Plh35o86lvrX1/5xKi/MyFR+UUUELwg5ZtQ=;
        b=ZGXNxBYD5FVqegfYExCp5yMZ1Ytdg8CWzNicdlQMO7rlkl5ikF3XHpbRNFSDtf/UQ2
         iF3z4IiFCHYed9NsjDdOHFMRknhdJX56+AH4lmQHVoKedwgaQcKDD37ixRVtYLLa9k9o
         A3I3PTiisvK6dxIdGj8tEChDr3FAEjNagLajq11MmPRQqSNg75eZlNhoEK2sfR/Zodtw
         Xd8itCQRw1l4TdwPvqnSUtuap3foo6P70Asv6cv788spHg6Ca1ykuo8OTDwEKxQ+wlRx
         lmJNYo4QXfML0h/JDF82r8+rPuggQsN3AOjAq5IlAFHQdqifya9vaLO8bHNtrbuiOjYi
         YHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738336716; x=1738941516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmcAvYq6Plh35o86lvrX1/5xKi/MyFR+UUUELwg5ZtQ=;
        b=sgCDE2NWh7h57tCbC6+YLG7Q+GgcIYqdH+fImkqvA0yRouP8lJ6kqQodcFld9c5P/B
         p9s196K2l8djlfyymGKXBYW/jHBlsVI1rBizZ/2iALB2JHGlbFvdJNKO4BOm0Xi9AFKa
         Z9+yKYtQ7d2KPIoEIP5GPEuJ9RBDfVmn3S1gTZAiO50QBews2WK32pFNrT0Rgg5X4F9w
         q/kcnkOOYTqy7FUrNSm9roVgpKao/ruJuJCWiO/cSIs7Mg4t0ZfPmup38JiUFlgatbVq
         YOgeAsENi33Vei5gMaU1uJRBBOwWBaJWjzHF8Xmyrs4Ap4l9x5iWwIlM2JvBDeKVYdfI
         WHpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnsbaN0IEwk+PGnRQQ0USvRAmhalLZGqjIwcEzxza8dovOQq1DUX3As+iekv/zhP/HgbB6MIC33vA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU+OecG663fNPK5Mbl2y4iBrCuNUvL5pWQlhejR5QoSQDugG1A
	4SLnc0lDDWNdzHbQApakEKPIMu8onpY+JcgI5jopTPt3q0sOx38cFDC7bgAa/Q==
X-Gm-Gg: ASbGncseFoebsPu1TNee8KWHMcx7ueG/CiiqkjXcHTntwjKuJLjALjkd5Ce2FLWaaxj
	ecGUk99x5D4IxocqUgOVCmdQ0hMcp+dL1opCuhPIrTuUlLgCo1g36NOgKrObtH25hwplzg3KCnz
	QyUBnmN4GtbuGLKLOWlTBao0s74kLRRKAgfBZfVwLApg54cZ1LwdtUPf7vew5bOMvr6oDFECTSA
	apgRLoUG8wui9qMBNrygfqsftL2dA2jxZDMUBsyvPoW2BJybl1GBvuAVaSm+gxQAZJM5Nj7MJm/
	fJEOjsOwC9sWRdAS+ghxrh8ao/Pn1iYxlMZNcIxP+uGzR6ojcNCfmMHpkZBSAOoznY/bSuJt0im
	zA43B5UaV
X-Google-Smtp-Source: AGHT+IG8wug4eUsfhl7wm5KfInzfu9XEQSA/gmnsobwKMmAHW07VMT0SCDK4Yklh8p3e2g3kXNnO6A==
X-Received: by 2002:a05:6214:3112:b0:6da:dc79:a3cd with SMTP id 6a1803df08f44-6e243a7f135mr158297156d6.0.1738336716566;
        Fri, 31 Jan 2025 07:18:36 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-51.harvard-secure.wrls.harvard.edu. [65.112.8.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2547f3e17sm19028426d6.22.2025.01.31.07.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 07:18:36 -0800 (PST)
Date: Fri, 31 Jan 2025 10:18:34 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Baoqi Zhang <zhangbaoqi@loongson.cn>
Subject: Re: [PATCH] USB: pci-quirks: Fix HCCPARAMS register error for LS7A
 EHCI
Message-ID: <b6a18bab-b412-443a-b39a-2194596ec79d@rowland.harvard.edu>
References: <20250131100651.343015-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131100651.343015-1-chenhuacai@loongson.cn>

On Fri, Jan 31, 2025 at 06:06:51PM +0800, Huacai Chen wrote:
> LS7A EHCI controller doesn't have extended capabilities, so the EECP
> (EHCI Extended Capabilities Pointer) field of HCCPARAMS register should
> be 0x0, but it reads as 0xa0 now. This is a hardware flaw and will be
> fixed in future, now just clear the EECP field to avoid error messages
> on boot:
> 
> ......
> [    0.581675] pci 0000:00:04.1: EHCI: unrecognized capability ff
> [    0.581699] pci 0000:00:04.1: EHCI: unrecognized capability ff
> [    0.581716] pci 0000:00:04.1: EHCI: unrecognized capability ff
> [    0.581851] pci 0000:00:04.1: EHCI: unrecognized capability ff
> ......
> [    0.581916] pci 0000:00:05.1: EHCI: unrecognized capability ff
> [    0.581951] pci 0000:00:05.1: EHCI: unrecognized capability ff
> [    0.582704] pci 0000:00:05.1: EHCI: unrecognized capability ff
> [    0.582799] pci 0000:00:05.1: EHCI: unrecognized capability ff
> ......
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Baoqi Zhang <zhangbaoqi@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  drivers/usb/host/pci-quirks.c | 4 ++++
>  include/linux/pci_ids.h       | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
> index 1f9c1b1435d8..7e3151400a5e 100644
> --- a/drivers/usb/host/pci-quirks.c
> +++ b/drivers/usb/host/pci-quirks.c
> @@ -958,6 +958,10 @@ static void quirk_usb_disable_ehci(struct pci_dev *pdev)
>  	 * booting from USB disk or using a usb keyboard
>  	 */
>  	hcc_params = readl(base + EHCI_HCC_PARAMS);
> +	if (pdev->vendor == PCI_VENDOR_ID_LOONGSON &&
> +	    pdev->device == PCI_DEVICE_ID_LOONGSON_EHCI)
> +		hcc_params &= ~(0xffL << 8);

Can you please add a comment before this "if" statement explaining why 
it is necessary?

Alan Stern

> +
>  	offset = (hcc_params >> 8) & 0xff;
>  	while (offset && --count) {
>  		pci_read_config_dword(pdev, offset, &cap);
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index de5deb1a0118..74a84834d9eb 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -162,6 +162,7 @@
>  
>  #define PCI_VENDOR_ID_LOONGSON		0x0014
>  
> +#define PCI_DEVICE_ID_LOONGSON_EHCI     0x7a14
>  #define PCI_DEVICE_ID_LOONGSON_HDA      0x7a07
>  #define PCI_DEVICE_ID_LOONGSON_HDMI     0x7a37
>  
> -- 
> 2.47.1
> 

