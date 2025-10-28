Return-Path: <linux-usb+bounces-29832-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24198C18CF1
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 08:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C39D1C24FE5
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 07:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311C0253B71;
	Wed, 29 Oct 2025 07:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="XAvM3fa1"
X-Original-To: linux-usb@vger.kernel.org
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CD3278E5D
	for <linux-usb@vger.kernel.org>; Wed, 29 Oct 2025 07:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761724598; cv=none; b=DTSdAezMZGLn5TgQltrYFLZufNM1AO8a0JbLyQutyDGZFxFbLSC42QvjtL1pMlO0iG5wOaXmPYEWeltig3ITJdP+IM1eE/kLeyO7KD3xwIiCb+FJ0tkoE370ATdx4clHX/90Q+4AmM0ibL5hSvt9D4sedApXTuwgDY6I6RphKgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761724598; c=relaxed/simple;
	bh=TcqAfWFEiFBcSNbPlqwNDfXFwkUKEiArkoH/xUIA7n0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VxWkJ8jbc18mhoU/sJzCNjsjo5fUuB9vMXHbS3hvPvjn1LfOdO2VgU3rdC78R9hXyEn36ryQ/zCgt000iExyKDmwvBlI7djmDXeBYZ2QhplvVs6rLvSgwXkrolutcHMXlMDkDZG7wwGQRy0fxpzmg9qEgDWcIKNJBTgZ7CZIm64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=XAvM3fa1; arc=none smtp.client-ip=35.89.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id Dv99vKXQZZx2iE12kva816; Wed, 29 Oct 2025 07:56:30 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id E12ivwUYse5vdE12ivRm7g; Wed, 29 Oct 2025 07:56:29 +0000
X-Authority-Analysis: v=2.4 cv=PI0P+eqC c=1 sm=1 tr=0 ts=6901c8ad
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=4oHATN8Nx7vVUZJYxp75bA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=7T7KSl7uo7wA:10 a=iox4zFpeAAAA:8
 a=CJyRVPjjBR1MBHXF4zwA:9 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22
 a=xYX6OU9JNrHFPr8prv8u:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5J5C6qYMZNYrU7M3sfVdtvNKg3LL38S/NJb2d99zbh8=; b=XAvM3fa1trYexrpBn4JWU8fxjc
	Kfvh4mACmELw5YsmSIOXmzAwIR7Z9NSo4nUMm73tDMI8CgGyH03h3dcJzIsH3Z/OpW1+bYqUtXG5k
	ldTlU4ge+e+8A9UrOWUhWFx/tPT3nbb8or+a+ClMKsP1DcK+XfxFL9S7ZMTwkpfYb17iAzL3Y1C3g
	/7v++TaFn5tSnbFw5zUplspiZSTO0RVrOlO+ZCWURqKCItSYPa7bspi5mdxv/pnw4r3p6uO3RSf7x
	r5mo/iHCY9YWGJlVPLCWqsIcHWaQyohX0qP0WjtCAiviU+dNEe1dv4nDZUPSmxIddlwZ4rPGdQY/r
	gUrGBx4A==;
Received: from [185.134.146.81] (port=41320 helo=[10.35.193.44])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1vDmnm-00000001MY7-2C5P;
	Tue, 28 Oct 2025 11:44:07 -0500
Message-ID: <1564d2d8-7ed5-4599-b9e7-21fb7e887616@embeddedor.com>
Date: Tue, 28 Oct 2025 16:43:59 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] uapi: cdc.h: cleanly provide for more interfaces and
 countries
To: Greg KH <gregkh@linuxfoundation.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
References: <20251028123254.1888303-1-oneukum@suse.com>
 <2025102858-doorframe-canola-e6c0@gregkh>
 <16a3c8ef-dd3f-48c4-afcd-42ab4b14c429@suse.com>
 <2025102857-surfer-atypical-2857@gregkh>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <2025102857-surfer-atypical-2857@gregkh>
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
X-Exim-ID: 1vDmnm-00000001MY7-2C5P
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([10.35.193.44]) [185.134.146.81]:41320
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBY0S9ERJdFC/N8CcLzRwdV/i67Pju8DkSTBnhHAtK/4X0ctj84SHuoZBD+UM5vAq/z+O43o6bhUBS5RcbIV0OqCGym1dr8Xzi2XsxhhYknFTARWiEvC
 hYoiditopp83E1e+4d30mL0WT2Frh5/XoZ2s+rBR116JlW/4CawQdxre8zHB8MFz6YYnbtM0q4qnXH8wHQQ+dIyU7o8dd/TNKys=



On 10/28/25 14:40, Greg KH wrote:
> On Tue, Oct 28, 2025 at 03:34:40PM +0100, Oliver Neukum wrote:
>> Hi,
>>
>> On 28.10.25 14:32, Greg KH wrote:
>>> On Tue, Oct 28, 2025 at 01:32:22PM +0100, Oliver Neukum wrote:
>>>> The spec requires at least one interface respectively country.
>>>> It allows multiple ones. This needs to be clearly said in the UAPI.
>>>>
>>>> Signed-off-by: Oliver Neukum <oneukum@suse.com>
>>>> ---
>>>>    include/uapi/linux/usb/cdc.h | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/include/uapi/linux/usb/cdc.h b/include/uapi/linux/usb/cdc.h
>>>> index 1924cf665448..5fcbce0be133 100644
>>>> --- a/include/uapi/linux/usb/cdc.h
>>>> +++ b/include/uapi/linux/usb/cdc.h
>>>> @@ -105,7 +105,7 @@ struct usb_cdc_union_desc {
>>>>    	__u8	bMasterInterface0;
>>>>    	__u8	bSlaveInterface0;
>>>> -	/* ... and there could be other slave interfaces */
>>>> +	__u8	bSlaveInterfaces[];
>>>
>>> Can this be combined with bSlaveInterface0?  Feels odd to have 0 and
>>> then "more".
>>
>> I am afraid the C language does not allow you to specify
>> that an array must have a minimum length other than zero.
>> In this case bSlaveInterface0 must be present.
>> I don't think using only an array would be the right choice.

You can do something like this:

@@ -104,8 +104,10 @@ struct usb_cdc_union_desc {
         __u8    bDescriptorSubType;

         __u8    bMasterInterface0;
-       __u8    bSlaveInterface0;
-       /* ... and there could be other slave interfaces */
+       union {
+               __u8    bSlaveInterface0;
+               DECLARE_FLEX_ARRAY(__u8, bSlaveInterfaces);
+       };
  } __attribute__ ((packed));

Just adjust any related code to account for the fact that the
"other slave interfaces" will start at bSlaveInterfaces[1].

Something like the following is preferable, but this syntax
for flexible-array members in unions is only supported starting
with GCC 15:

--- a/include/uapi/linux/usb/cdc.h
+++ b/include/uapi/linux/usb/cdc.h
@@ -104,8 +104,10 @@ struct usb_cdc_union_desc {
         __u8    bDescriptorSubType;

         __u8    bMasterInterface0;
-       __u8    bSlaveInterface0;
-       /* ... and there could be other slave interfaces */
+       union {
+               __u8    bSlaveInterface0;
+               __u8 bSlaveInterfaces[];
+       };
  } __attribute__ ((packed));

So, we'll have to wait until that becomes the minimum supported
version before we can use the above code.

> 
> bSlaveInterface[1] ?

No, please. One-element arrays when used as flexible arrays are
deprecated. It took us years to transform those into flexible-array
members.

> 
> I'll add Gustavo here, he's done lots of work in this area.
> 
>>> Also, what determines how many, the overall length?
>>
>> bLength - 4 is the number of slave interfaces, which
>> must at least be 1.
>> We cannot use counted_by in UAPI, can we?

Yes. We _can_ (and do) use __counted_by in UAPI.

The problem is that currently GCC doesn't support expressions
in __counted_by. So, something like the following is not possible:

__counted_by(bLength - 4)

-Gustavo

> 
> I don't know, Gustavo?
> 
> thanks,
> 
> greg k-h


