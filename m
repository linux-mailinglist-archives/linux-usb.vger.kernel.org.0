Return-Path: <linux-usb+bounces-23249-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB81A9486E
	for <lists+linux-usb@lfdr.de>; Sun, 20 Apr 2025 19:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22DCE3B1AA6
	for <lists+linux-usb@lfdr.de>; Sun, 20 Apr 2025 17:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E61320C470;
	Sun, 20 Apr 2025 17:17:18 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ED34A11
	for <linux-usb@vger.kernel.org>; Sun, 20 Apr 2025 17:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745169437; cv=none; b=f5awSWPjn1LE/4/ZYhlwebJRdZibKqmb2VsDkGpBU2XRUfAnvAqT5+41EMJtTboxdP21H7HqJN1JeQPOYXvsU03cDtA0x+L0cyuMS4Zk417+p35XfFPhj735jxjNCLzk9IcA0vyahMxkkLN+UwIcuTzLni9IKMRsI5ZHzydUK+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745169437; c=relaxed/simple;
	bh=lXPPfM6pseQGexkOJ0A1RrB0Vm1IG+cgsDvA6iEReGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P47+wbwGh4jBVpdhbq5/UA+/XDPdtogJk8YcM9DBMlqnS064MfVkuhVzcx2gZ7anbyozLNT5Rzk556DC/OM7lZcnvgMOQawkzy+bnmE8qF3B8NXqWVoWEI5XWx8S90T+kpRE4Kv4rdqzwpEgGvftOlmvBG2y5CxsP5Rito2/StI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.102] (213.87.162.85) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Sun, 20 Apr
 2025 20:16:42 +0300
Message-ID: <9330492a-39e3-44c4-9c76-12bde069eef3@omp.ru>
Date: Sun, 20 Apr 2025 20:16:41 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] usb: xhci: move doorbell array pointer
 assignment
To: Niklas Neronin <niklas.neronin@linux.intel.com>,
	<mathias.nyman@linux.intel.com>
CC: <linux-usb@vger.kernel.org>
References: <20250416134510.2406543-1-niklas.neronin@linux.intel.com>
 <20250416134510.2406543-7-niklas.neronin@linux.intel.com>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20250416134510.2406543-7-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 04/20/2025 16:06:35
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 192774 [Apr 20 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 56 0.3.56
 52db7f275cc9b6820389ba9ab2ac225370e1c244
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.162.85 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.162.85
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 04/20/2025 16:16:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 4/20/2025 2:12:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 4/16/25 4:45 PM, Niklas Neronin wrote:

> Move the assignment of the doorbell array pointer from xhci_mem_init()
> to xhci_init(). The assignment now utilizes the newly introduced
> xhci_set_doorbell_ptr() function.
> 
> Doorbell Array Offset mask (DBOFF_MASK) is updated to directly specify its
> bit range as 31:2, rather than using inverted reserved bits 1:0.
> This change simplifies the mask representation, making it more intuitive
> and easier to understand.
> 
> Remove the "// " prefix from trace messages, as it is unnecessary and
> distracting.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>  drivers/usb/host/xhci-caps.h |  4 ++--
>  drivers/usb/host/xhci-mem.c  |  8 --------
>  drivers/usb/host/xhci.c      | 13 +++++++++++++
>  3 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
> index f6b9a00a0ab9..4b8ff4815644 100644
> --- a/drivers/usb/host/xhci-caps.h
> +++ b/drivers/usb/host/xhci-caps.h
> @@ -62,8 +62,8 @@
>  
>  #define CTX_SIZE(_hcc)		(HCC_64BYTE_CONTEXT(_hcc) ? 64 : 32)
>  
> -/* db_off bitmask - bits 0:1 reserved */
> -#define	DBOFF_MASK	(~0x3)
> +/* db_off bitmask - bits 31:2 Doorbell Array Offset */
> +#define	DBOFF_MASK	(0xfffffffc)

   I don't think parens here are really needed...

[...]

MBR, Sergey


