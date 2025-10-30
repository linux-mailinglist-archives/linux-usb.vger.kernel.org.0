Return-Path: <linux-usb+bounces-29907-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C42B0C20E1A
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 16:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47DA84065C9
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 15:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E9B363341;
	Thu, 30 Oct 2025 15:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="a2HBtMpA"
X-Original-To: linux-usb@vger.kernel.org
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D3C157A72
	for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 15:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761837568; cv=none; b=AqapdagmsgHW5wUj4c1nCuLk+mk6G+F/Ogdcd+RvsYgepUf8rAGbuexj517S//oR7Twjy6xUMFhhH+2uy5uAawlrk1K5bpAtv9mFojsmTWRG+4nq29Rzj9CKXW3rh3wFKPSYwQmasZ3yiKXV37wVF1msPBJLxHXuoi3wdgjbgQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761837568; c=relaxed/simple;
	bh=/PeuQhBpEVYGqHlCl67mgNxjKDaat1xNxW3GApcjxP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AqwMyOn1ppVYmpj7mWvafK6F4ab+VgpoYsd4czdUKKV5L/FoZhaoetbL8ALvsmMpmaokmjsGRLS3O/iCXz7snCOTur4wBxfqmQfKZa4Qr3mXob3V8B1wGiYFxXavcGERirfImkwLnnurtwmfNXEXxVUYRt7zqUBalSlLH/ydf38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=a2HBtMpA; arc=none smtp.client-ip=35.89.44.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id EQtfvAY33VCBNEUQqvKO86; Thu, 30 Oct 2025 15:19:20 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id EUQHvLXHuUBPCEUQIvr5mN; Thu, 30 Oct 2025 15:18:46 +0000
X-Authority-Analysis: v=2.4 cv=bspMBFai c=1 sm=1 tr=0 ts=690381f8
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=4oHATN8Nx7vVUZJYxp75bA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=7T7KSl7uo7wA:10 a=iox4zFpeAAAA:8
 a=jJ5KzP5AIZrX77DnFDkA:9 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22
 a=xYX6OU9JNrHFPr8prv8u:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=E4tfgHK3NIfdb0rndc8To8x0/MgDHVaU9b7G+gehlT4=; b=a2HBtMpA3myu5krVWVOzdpggtF
	IVtdgqVEgAIbLv7J3umFNtMcZuAH2Lm1/ib25xPH/lSADi4ouVXkoazyh5FsPVdf7NMxHFWE3hFuG
	nnI2kWAPVfaFPjxWVQgIFAhy3mbXqwozISWQ8553rXlDhkANz93Kf4zxN8gEf/Hp4MJyn8vvpfPTH
	4qy6f3KtcN8xrCAN6VqNVWqrdqXgEw2wW9Hxc+lwiZbCm4yODzkBQSnStY4g0vXhoCjfSBC7h08ae
	q0Uy8Wql9GFFa6vjNrYmuaxw740WLYcTTOTTu6vYWPpYnbUfA5epT4S78/RTtUMGQqHm9VY9HxM4P
	EDiFBJtA==;
Received: from [185.134.146.81] (port=38636 helo=[10.115.43.44])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1vEUQH-00000002nrt-1vmc;
	Thu, 30 Oct 2025 10:18:45 -0500
Message-ID: <e9d9842b-0fd9-4763-ab96-4d740299f4ba@embeddedor.com>
Date: Thu, 30 Oct 2025 15:18:35 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 1/1] uapi: cdc.h: cleanly provide for more interfaces
 and countries
To: Oliver Neukum <oneukum@suse.com>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org
References: <20251030132149.2575138-1-oneukum@suse.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20251030132149.2575138-1-oneukum@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 185.134.146.81
X-Source-L: No
X-Exim-ID: 1vEUQH-00000002nrt-1vmc
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([10.115.43.44]) [185.134.146.81]:38636
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfH/28CKs4rX1188K4mDQ6xwe8T8B8DKmvPwF7lrXNrPaxMKyFYJiwdE3Cwa53DUEIY/GYqvG8QvRigNVf19gKSGvMxH7/AYFHQ2ObmhYdqjlM/Um7KJ/
 eVE0/M5NnhxjIPHi4dZpY+Eba4UYDJ/oHbnKEOR+WLBGMrT8Fi9okbD8g3dwlW9U9hVNeajG74xgBXZmVIX0J36Qqt2r1Am5Tj4=



On 10/30/25 13:20, Oliver Neukum wrote:
> The spec requires at least one interface respectively country.
> It allows multiple ones. This needs to be clearly said in the UAPI.
> 
> V2: following Gustavo's suggestion to use an union
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>   drivers/usb/class/cdc-acm.c  |  2 +-
>   include/uapi/linux/usb/cdc.h | 12 ++++++++----
>   2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> index 73f9476774ae..c272b00b947c 100644
> --- a/drivers/usb/class/cdc-acm.c
> +++ b/drivers/usb/class/cdc-acm.c
> @@ -1475,7 +1475,7 @@ static int acm_probe(struct usb_interface *intf,
>   		if (!acm->country_codes)
>   			goto skip_countries;
>   		acm->country_code_size = cfd->bLength - 4;
> -		memcpy(acm->country_codes, (u8 *)&cfd->wCountyCode0,
> +		memcpy(acm->country_codes, (u8 *)&cfd->wCountryCode0,
>   							cfd->bLength - 4);

You should read from the flexible-array member, instead. Something like:

memcpy(acm->country_codes, (u8 *)&cfd->wCountryCodes, acm->country_code_size);

Otherwise, you may be reading beyond the boundaries of cfd->wCountryCode0.

-Gustavo

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
> +	};
>   } __attribute__ ((packed));
>   
>   /* "Network Channel Terminal Functional Descriptor" from CDC spec 5.2.3.11 */


