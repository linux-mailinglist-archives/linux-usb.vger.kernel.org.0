Return-Path: <linux-usb+bounces-1312-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4597BED67
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 23:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF1AE281B71
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 21:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C8E41E46;
	Mon,  9 Oct 2023 21:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sensoray.com header.i=@sensoray.com header.b="o+17f4D1"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76074156C3
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 21:31:23 +0000 (UTC)
X-Greylist: delayed 90 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 09 Oct 2023 14:31:21 PDT
Received: from omta033.useast.a.cloudfilter.net (omta033.useast.a.cloudfilter.net [44.202.169.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A00ED92
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 14:31:21 -0700 (PDT)
Received: from eig-obgw-5010a.ext.cloudfilter.net ([10.0.29.199])
	by cmsmtp with ESMTP
	id puZhqy4eeIBlVpxoYqrvZX; Mon, 09 Oct 2023 21:29:22 +0000
Received: from gator3086.hostgator.com ([50.87.144.121])
	by cmsmtp with ESMTPS
	id pxozq7OueX2l7pxp0qAfOc; Mon, 09 Oct 2023 21:29:50 +0000
X-Authority-Analysis: v=2.4 cv=Ut5wis8B c=1 sm=1 tr=0 ts=652470ce
 a=qMXOcmIMY6YlrKEg1GzxDg==:117 a=QsTHvn2EeHXCImuSLmd++Q==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=kj9zAlcOel0A:10 a=bhdUkHdE2iEA:10 a=6kiSLZGAxYIA:10 a=wXneSEFuAAAA:8
 a=KrKaH9jlvh_lqae0ggwA:9 a=CjuIK1q_8ugA:10 a=YVKGGmaMxpnpCiYzuRtG:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sensoray.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QDvvkI/tqtDHv07CTOgzlxywf+1YKQpzel2ccOaDw7E=; b=o+17f4D1juuD7jHlDOwoc4IC5i
	FRJwvtr9uLzCYQZ4GoxSZugX5uMnguJTJgDFD7dozM7Fu3cFAapnak2E+5N/tFZvXtnSkQM8tQ0Sj
	vBVJMl+8+CSsDDikU/Evet1nxHO71SmhNwYTizsgKwsKFevurdA2KTYqVjGMOvsOocEo=;
Received: from gator3086.hostgator.com ([50.87.144.121]:11974)
	by gator3086.hostgator.com with esmtpa (Exim 4.95)
	(envelope-from <dean@sensoray.com>)
	id 1qpxoz-002Qwh-4l;
	Mon, 09 Oct 2023 16:29:49 -0500
Received: from mail.thomaswright.com ([50.126.89.90])
 by www.sensoray.com
 with HTTP (HTTP/1.1 POST); Mon, 09 Oct 2023 16:29:48 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 09 Oct 2023 16:29:48 -0500
From: dean@sensoray.com
To: Greg KH <greg@kroah.com>
Cc: linux-dev@sensoray.com, balbi@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb/gadget: function fs req_match endpoint address fix
In-Reply-To: <2023100506-veteran-foil-cec0@gregkh>
References: <20231003221103.1607964-1-linux-dev@sensoray.com>
 <2023100506-veteran-foil-cec0@gregkh>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <b08c24f9021b5c2fe1917cac18d65422@sensoray.com>
X-Sender: dean@sensoray.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator3086.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sensoray.com
X-BWhitelist: no
X-Source-IP: 50.87.144.121
X-Source-L: Yes
X-Exim-ID: 1qpxoz-002Qwh-4l
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: gator3086.hostgator.com [50.87.144.121]:11974
X-Source-Auth: dean@sensoray.com
X-Email-Count: 5
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: c2Vuc29yYXk7c2Vuc29yYXk7Z2F0b3IzMDg2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDsHFU0g13nR7XNePaaFFPyPFWhFpKxhXc/H64ZOPGdGti3/EvsPorC2JmXWPMvFP5YLcnN+p5JnbYx5TDZfgrENbCVRbN+1WPgdH/HsnN/jVSIvq2CC
 N6EfiGnNlPWLML4YRIBPLDvYbJ6+IrvlA3hgq41qKcMgxkil8dFz3af/6bY0RFaSlYsh/MCtR/o3sM2coe1f5i3PwXB7Sk21Tlo=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 2023-10-05 02:20, Greg KH wrote:
> On Tue, Oct 03, 2023 at 03:11:03PM -0700, linux-dev@sensoray.com wrote:
>> From: Dean Anderson <linux-dev@sensoray.com>
>> 
>> Fixes f_fs.c handling USB_RECIP_ENDPOINT request types incorrectly for
>> endpoints not belonging to it. f_fs.c needs to distinguish between IN
>> and OUT endpoints, not just the endpoint number. Otherwise, f_fs may
>> handle endpoints belonging to other functions. This occurs in the
>> gadget/composite.c composite_setup function in the req_match callback.
>> 
>> Signed-off-by: Dean Anderson <linux-dev@sensoray.com>
> 
> What commit id does this fix?

It's out of date. I'll resubmit with the suggested changes.

> 
>> ---
>>  drivers/usb/gadget/function/f_fs.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/usb/gadget/function/f_fs.c 
>> b/drivers/usb/gadget/function/f_fs.c
>> index c727cb5de871..fb95ca4aa025 100644
>> --- a/drivers/usb/gadget/function/f_fs.c
>> +++ b/drivers/usb/gadget/function/f_fs.c
>> @@ -71,7 +71,7 @@ struct ffs_function {
>>  	struct ffs_data			*ffs;
>> 
>>  	struct ffs_ep			*eps;
>> -	u8				eps_revmap[16];
>> +	u8				eps_revmap[32]; /* 16 in endpoints, 16 out endpoints*/
> 
> Can't this be two separate arrays so you don't have to do fun masks to
> pick out which is an in and which is an out?
> 
>>  	short				*interfaces_nums;
>> 
>>  	struct usb_function		function;
>> @@ -2847,6 +2847,7 @@ static int __ffs_func_bind_do_descs(enum 
>> ffs_entity_type type, u8 *valuep,
>>  		struct usb_ep *ep;
>>  		u8 bEndpointAddress;
>>  		u16 wMaxPacketSize;
>> +		u8 addr;
>> 
>>  		/*
>>  		 * We back up bEndpointAddress because autoconfig overwrites
>> @@ -2870,8 +2871,9 @@ static int __ffs_func_bind_do_descs(enum 
>> ffs_entity_type type, u8 *valuep,
>> 
>>  		ffs_ep->ep  = ep;
>>  		ffs_ep->req = req;
>> -		func->eps_revmap[ds->bEndpointAddress &
>> -				 USB_ENDPOINT_NUMBER_MASK] = idx + 1;
>> +		addr = ((ds->bEndpointAddress & USB_ENDPOINT_DIR_MASK) >> 3)
>> +			| (ds->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK);
>> +		func->eps_revmap[addr] = idx + 1;
>>  		/*
>>  		 * If we use virtual address mapping, we restore
>>  		 * original bEndpointAddress value.
>> @@ -3403,7 +3405,9 @@ static void ffs_func_resume(struct usb_function 
>> *f)
>> 
>>  static int ffs_func_revmap_ep(struct ffs_function *func, u8 num)
>>  {
>> -	num = func->eps_revmap[num & USB_ENDPOINT_NUMBER_MASK];
>> +	u8 addr = ((num & USB_ENDPOINT_DIR_MASK) >> 3)
>> +		| (num & USB_ENDPOINT_NUMBER_MASK);
>> +	num = func->eps_revmap[addr];
> 
> That's messy, again, 2 arrays would make this much simpler I think?

It's similar to the approach in composite.c. v6.6-rc4, line 1013, but 
yes 2 arrays would be simpler.

BTW, should composite.c at least get rid of the magic numbers?

composite.c commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa
line: 1013

addr = ((ep->bEndpointAddress & 0x80) >> 3)
      |  (ep->bEndpointAddress & 0x0f);

> 
> thanks,
> 
> greg k-h

Thanks,

Dean A

