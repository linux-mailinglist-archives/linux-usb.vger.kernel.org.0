Return-Path: <linux-usb+bounces-15251-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ACC97CE1C
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 21:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FAB61F23F33
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 19:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D92225A8;
	Thu, 19 Sep 2024 19:19:18 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCD62B9C4
	for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 19:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726773558; cv=none; b=IGG9fEq+DgYGt/srEKZpSMpFHdSDM9QR06QCcAq83Lt16OAyNvVA8ZXEf7NpAXP7Kwum0MtJ8EFS/7cBoCny6T3S11lBAV1Aa02RV2k5BnzG1rQ9N1vp37GNGobHnb92hlECcPsz/tGVmAgzMkhFPbpmUGX4Ca8x3xu2/WiOWdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726773558; c=relaxed/simple;
	bh=/1nwadqNo7kXE6qNpA4ZpZVwhhd5AEqbi9FZanbBHQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j8pgpGFuauh56v5xxGv8dO0E8r5QbnfzeAH0v604PoZFnv0dwp3NGLOQIs5K+RKpue1Bvq2CY4mUV2cA43zym+rwKjfc5wW4mlyVW+YtwRJ8RXTIHWo1KIwBrZKUk3YOKZDwUa/ptGdS27NWumBXxDByr6WwE0y9QdCf7Pf6DGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.111] (31.173.81.63) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 19 Sep
 2024 22:18:50 +0300
Message-ID: <2544903d-26c4-ca4f-b67b-5ef68e7c2e21@omp.ru>
Date: Thu, 19 Sep 2024 22:18:49 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] usb: Fix problem with xhci resume from suspend
Content-Language: en-US
To: Jose Alberto Reguero <jose.alberto.reguero@gmail.com>, Greg KH
	<gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>, Mathias Nyman
	<mathias.nyman@intel.com>
References: <20240919184202.22249-1-jose.alberto.reguero@gmail.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20240919184202.22249-1-jose.alberto.reguero@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 09/19/2024 18:57:59
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 187870 [Sep 19 2024]
X-KSE-AntiSpam-Info: Version: 6.1.1.5
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 34 0.3.34
 8a1fac695d5606478feba790382a59668a4f0039
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.81.63 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.81.63 in (user) dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.81.63
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/19/2024 19:00:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/19/2024 3:09:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 9/19/24 21:42, Jose Alberto Reguero wrote:

> I have a ASUS PN51 S mini pc that has two xhci devices. One from AMD, and other
> from ASMEDIA. The one from ASMEDIA have problems when resume from suspend, and
> keep broken until unplug the  power cord. I use this kernel parameter:
> xhci-hcd.quirks=128 and then it works ok. I make a path to reset only the
> ASMEDIA xhci. 
> 
> 
> Signed-off-by: Jose Alberto Reguero <jose.alberto.reguero@gmail.com>
> 
> ---
>  drivers/usb/host/xhci-pci.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index dc1e345ab67e..8f075ab63f65 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
[...]
> @@ -447,6 +448,10 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>  		pdev->device == PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
>  		xhci->quirks |= XHCI_ASMEDIA_MODIFY_FLOWCONTROL;
>  
> +	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
> +		pdev->device == PCI_DEVICE_ID_ASMEDIA_3042_XHCI)

   Hum, please either add 1 more tab here or start the continuation line
under pdev jn the broken up line. The *if* expression should not blend with
code in the branch.

> +		xhci->quirks |= XHCI_RESET_ON_RESUME;
> +
>  	if (pdev->vendor == PCI_VENDOR_ID_TI && pdev->device == 0x8241)
>  		xhci->quirks |= XHCI_LIMIT_ENDPOINT_INTERVAL_7;

MBR, Sergey

