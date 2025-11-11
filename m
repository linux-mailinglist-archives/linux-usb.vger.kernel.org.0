Return-Path: <linux-usb+bounces-30424-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 806B4C4E258
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 14:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3DBE44E8656
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 13:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E1F33ADBC;
	Tue, 11 Nov 2025 13:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="LmC8xt6A"
X-Original-To: linux-usb@vger.kernel.org
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247F5331229
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 13:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762868299; cv=none; b=uemlmfBgDdp6a1+jaU4347XgEt2odpcseaycdHbGIWHCE63KNBHNrxA4sgbkV18qsWUGFm6qnzetgc8R6A4nTqJ3g41OcM7tIMTrhOYowMOeO27PRvS0hOm0wcunRhns5Yclz+6Jo+oC3YuxFnbRicsnYf54Z9X2i8zPNSd7YHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762868299; c=relaxed/simple;
	bh=UbV5GgpqMZVtxRiSozJeUwSKdIsNrm55FmFRqAkDoFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XsVd4XU00njB0dMdwDrxd+ywSZOQPWh+RMZy31NXHUzkwX8a+M4m4wtt5jwtM4WWcSGlhN62aHrYihFtD9bNbjYWxSBLh4sG58PMPPzxSTpEgWZgOn/qmpa6mVklje1eaMxboNC03m98oFOwf5js5WANLksnDjS25qIwK9CZfCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=LmC8xt6A; arc=none smtp.client-ip=44.202.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id ImBfvPK2lKXDJIoZdvW2kP; Tue, 11 Nov 2025 13:38:17 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id IoZcvuCRouWNOIoZdv6lQs; Tue, 11 Nov 2025 13:38:17 +0000
X-Authority-Analysis: v=2.4 cv=N+gpF39B c=1 sm=1 tr=0 ts=69133c49
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=F0GicbU7tRTSLTLZ85HXVw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=7T7KSl7uo7wA:10 a=iox4zFpeAAAA:8
 a=JiBNKyHRPkDJVqF4oxEA:9 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22
 a=xYX6OU9JNrHFPr8prv8u:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pFq8pmJjW6kNRLtBVTbAYS2Q+XWVZ6FYBfTZebwqu5g=; b=LmC8xt6ADv/9EzrfLZVPt2B3vq
	uhqb8eddFwsN/BQ44W5XnXlja0Uaw1vsJga98cc6m5i2RPoUroRwzIo2TvjVmv+yCOvSA/cplWppn
	kSSsjsYV1Jo5EaEx7BAlLlj1ZM9TOQVmOkvJGxbu8XghUXWrnp3PLD9NHIFrsU2X/ileWYN1e6Yb1
	iiRHXwZBvljbhHzNlTitBQdNTQJ5Kn1+XfyHL7ELrD9DKmrEVMmib2NAIWddHQw7nTE1IIIv7j9gJ
	/xwVZw5cSux7cYOaDiS/K2LSsuqR1t9ukSvdv5TNhnHOaWDyQnBZKoAvuohmOt4tPlVwrbKKVamas
	E/7lD4Ng==;
Received: from m106072098064.v4.enabler.ne.jp ([106.72.98.64]:12345 helo=[10.221.86.44])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1vIoZc-00000000o96-1KrX;
	Tue, 11 Nov 2025 07:38:16 -0600
Message-ID: <bde0cd94-10bf-4ff5-a450-5160b67c9d2e@embeddedor.com>
Date: Tue, 11 Nov 2025 22:38:13 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 1/1] uapi: cdc.h: cleanly provide for more interfaces
 and countries
To: Oliver Neukum <oneukum@suse.com>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org
References: <20251111133228.4114536-1-oneukum@suse.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20251111133228.4114536-1-oneukum@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 106.72.98.64
X-Source-L: No
X-Exim-ID: 1vIoZc-00000000o96-1KrX
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: m106072098064.v4.enabler.ne.jp ([10.221.86.44]) [106.72.98.64]:12345
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 7
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFS8W2nkQ+MoBqwQkxx+XNmAHXDIkCdu2SmU4RmTgxGOuqUwpxRQaJy+33uJssdqmKP9DEOroS3Bn1EAClXUHyNK72YF4QXxQToKsqnPRnxeElneiG2d
 3iN9v1vTLsQGz/4Zh3tgUKI2vdSucj8AbqMXNfHQp6OniNvkJYG56FAObe3XywdDF4dbKr4yEV+duOMTNkxPcMmg8Rnl/S1+beQ=



On 11/11/25 22:31, Oliver Neukum wrote:
> The spec requires at least one interface respectively country.
> It allows multiple ones. This needs to be clearly said in the UAPI.
> This is subject to sanity checking in cdc_parse_cdc_header(), thus
> we can trust the length.
> 
> V2: following Gustavo's suggestion to use an union
> V3: following Gustavo's suggestion on safe copying
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>   drivers/usb/class/cdc-acm.c  |  2 +-
>   include/uapi/linux/usb/cdc.h | 12 ++++++++----
>   2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> index 73f9476774ae..54be4aa1dcb2 100644
> --- a/drivers/usb/class/cdc-acm.c
> +++ b/drivers/usb/class/cdc-acm.c
> @@ -1475,7 +1475,7 @@ static int acm_probe(struct usb_interface *intf,
>   		if (!acm->country_codes)
>   			goto skip_countries;
>   		acm->country_code_size = cfd->bLength - 4;
> -		memcpy(acm->country_codes, (u8 *)&cfd->wCountyCode0,
> +		memcpy(acm->country_codes, cfd->wCountryCodes,
>   							cfd->bLength - 4);
>   		acm->country_rel_date = cfd->iCountryCodeRelDate;
>   
> diff --git a/include/uapi/linux/usb/cdc.h b/include/uapi/linux/usb/cdc.h
> index 1924cf665448..0208b2f76bf1 100644
> --- a/include/uapi/linux/usb/cdc.h
> +++ b/include/uapi/linux/usb/cdc.h
> @@ -104,8 +104,10 @@ struct usb_cdc_union_desc {
>   	__u8	bDescriptorSubType;
>   
>   	__u8	bMasterInterface0;
> -	__u8	bSlaveInterface0;
> -	/* ... and there could be other slave interfaces */
> +	union {
> +		__u8	bSlaveInterface0;
> +		DECLARE_FLEX_ARRAY(__u8, bSlaveInterfaces);

For UAPI code, __DECLARE_FLEX_ARRAY() should be used.

> +	};
>   } __attribute__ ((packed));
>   
>   /* "Country Selection Functional Descriptor" from CDC spec 5.2.3.9 */
> @@ -115,8 +117,10 @@ struct usb_cdc_country_functional_desc {
>   	__u8	bDescriptorSubType;
>   
>   	__u8	iCountryCodeRelDate;
> -	__le16	wCountyCode0;
> -	/* ... and there can be a lot of country codes */
> +	union {
> +		__le16	wCountryCode0;
> +		DECLARE_FLEX_ARRAY(__le16, wCountryCodes);

Ditto.

Thanks
-Gustavo

