Return-Path: <linux-usb+bounces-11458-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D31D90F73E
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 21:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0683728304F
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 19:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FBA9158DD1;
	Wed, 19 Jun 2024 19:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="cUMIEkC5"
X-Original-To: linux-usb@vger.kernel.org
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5034954FAD
	for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2024 19:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718826982; cv=none; b=VAh0i72r7YBJ84XKFpmZajPRD934mEA/abKsH4TBRkthUDIJVNoN9jjYw1TC2oThPnvnHVakSmxEmoF0xRVzUr+re09lD8Sh5sSO/O8LRPoJVNbRWRFS9GpbfE7xSfcLTTAhlBsQo531hL8PpjpKsr7kJHz1EwMgDS+SfcSXOVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718826982; c=relaxed/simple;
	bh=7CwnBP+4cGwZQuJJW8YWaPRddYGkYIrG+c5Kwn0f9Kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QPTCEV8jXml5obN5GcHPKDDaWYKAhcdIfIZTOYCmOpmMSWtLS2DiiOZWhjoCnaBBJSr2TS40wYbzeGIgd/vJqInvdjBN8WoVc+wJue+W0PxaDcrNRscO8pWIbIVtmXGbqfrZJDTAV13Klwo1jqvEN+O805m1DaVQyu6yzclI9EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=cUMIEkC5; arc=none smtp.client-ip=35.89.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-5008a.ext.cloudfilter.net ([10.0.29.246])
	by cmsmtp with ESMTPS
	id JvawsJEOTkQe8K1PpsQcet; Wed, 19 Jun 2024 19:56:21 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id K1PosTwCkibL1K1PostafE; Wed, 19 Jun 2024 19:56:20 +0000
X-Authority-Analysis: v=2.4 cv=acFnnwot c=1 sm=1 tr=0 ts=667337e4
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=frY+GlAHrI6frpeK1MvySw==:17
 a=IkcTkHD0fZMA:10 a=T1WGqf2p2xoA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=KW3gg0Ai8grSkJK8CL4A:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eaO3vrXA39/v4UfFM5hBURpZQ31SpLg2lD0Yrk2pD1U=; b=cUMIEkC5zHTWZZXiy0tXc7hYzi
	OWyMSq9Scd1Ksz9HwbsYhLsOQNK/EcnsZgXSyY38ZGdg67fnNGp3gBYYzjPZhM9r/s1Dm0iZP8afv
	uBXklAcALPZKj8P0TB1+YA6Fl/S+ZI7b5UnsBDmd4jseLOvwh9X+vYpN2lnP9U87OEi0e89IhV0/N
	381JtgxVJjsvJfde3UYI0pgoAV0ExYNgaH8QI9IG7X4DZYrlyMsbc8olXLkJ8bznehXyeDwcSFy+T
	gJ5pnjUe8OIZe6vF3tGFjOUx12XcmxPU9SniQBMTDhhLWEHINNsOCAjMNVqN5Ndogndnukp7EsQ24
	zHcfqa6Q==;
Received: from [201.172.173.139] (port=46726 helo=[192.168.15.14])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1sK1Pn-000y00-0f;
	Wed, 19 Jun 2024 14:56:19 -0500
Message-ID: <62ab07f5-3d09-4f84-b917-f7e16fdfd32d@embeddedor.com>
Date: Wed, 19 Jun 2024 13:56:17 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] USB: serial: garmin_gps: annotate struct
 garmin_packet with __counted_by
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Johan Hovold <johan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, llvm@lists.linux.dev
References: <20240619-garmin_gps_counted_by-v2-0-f82f10ebbf28@gmail.com>
 <20240619-garmin_gps_counted_by-v2-1-f82f10ebbf28@gmail.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20240619-garmin_gps_counted_by-v2-1-f82f10ebbf28@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.173.139
X-Source-L: No
X-Exim-ID: 1sK1Pn-000y00-0f
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.14]) [201.172.173.139]:46726
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 17
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJL5KusgMSSH7wTv/QfhKL4URlO25+0USx7QoT9ZNWp5kfd72prCIoXFCt/aVj2/6u6kt/KidlrBxfd9syOR+qdLTSQvBfy9+sc6itdruX6Unb3AdteT
 90Vlm6Mh9XqxRc50ZpzyzPppTDCEdIzclyqvjt91LgfxJ9D//2qTWt8GVNQ04+hU9lNfZSXJiT54PqUkkY0uBf0RXLWhHX4oW/M=



On 19/06/24 21:42, Javier Carrasco wrote:
> Use the __counted_by compiler attribute for the data[] flexible array
> member to improve the results of array bound sanitizers.
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   drivers/usb/serial/garmin_gps.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/garmin_gps.c b/drivers/usb/serial/garmin_gps.c
> index 670e942fdaaa..57df6ad183ff 100644
> --- a/drivers/usb/serial/garmin_gps.c
> +++ b/drivers/usb/serial/garmin_gps.c
> @@ -104,7 +104,7 @@ struct garmin_packet {
>   	int               seq;
>   	/* the real size of the data array, always > 0 */
>   	int               size;
> -	__u8              data[];
> +	__u8              data[] __counted_by(size);
>   };
>   
>   /* structure used to keep the current state of the driver */
> 

