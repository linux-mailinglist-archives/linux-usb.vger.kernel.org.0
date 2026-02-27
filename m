Return-Path: <linux-usb+bounces-33768-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMmUDvEIoWlXpwQAu9opvQ
	(envelope-from <linux-usb+bounces-33768-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 04:01:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7653A1B2277
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 04:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FA843042625
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 03:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71AC13033DD;
	Fri, 27 Feb 2026 03:01:02 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CE02AD2B;
	Fri, 27 Feb 2026 03:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772161262; cv=none; b=fI2/LYN3DW2Gtph4ECKoQOhmJtN+Afjoawxkms3ho9Imc8TltYAcc9z5vpjuryq0xyI+ccjJxlSC0KlYXeaGBoDNGk6j4uy9DAMRc9Y6eZBzujK+a0l6QTlUDZdCJ75goD6/t/gVCqTJEejQvvtHHmU+Bkc60YpCaBGaphanx/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772161262; c=relaxed/simple;
	bh=k8uyJxXsVM9xW01EPPPqln/FhyAypLJMpZtseMbPf7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UpVLkocoXwTwkDROZRoFBmIal55Ou0Wzhjqjo7T/nEUjkzq60T9hKa/+z2YH8G5tK5CNH4j3sRbWpZ8mxHxPift9m8yoJKTTcK+gV0CzfIltvfNH92M/gEEkUv9cxSW3e+CvK7wvKs2rFlO5ooeNELINoy2666g4M2+k2CJRkMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 887237b2138811f1a21c59e7364eecb8-20260227
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:55760e7d-aab6-45b5-bb33-a302ff86109b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:eccfbb7d64ffaa8646a1906c4eda4d36,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 887237b2138811f1a21c59e7364eecb8-20260227
X-User: dengjie03@kylinos.cn
Received: from [10.42.12.246] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1263758377; Fri, 27 Feb 2026 11:00:55 +0800
Message-ID: <b677a0c9-74d2-4a37-9b09-587ffe5061c9@kylinos.cn>
Date: Fri, 27 Feb 2026 11:00:52 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: core: new quirk to handle devices with zero
 configurations
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260226094737.1306471-1-dengjie03@kylinos.cn>
 <2026022600-employee-unjustly-3db4@gregkh>
From: Jie Deng <dengjie03@kylinos.cn>
In-Reply-To: <2026022600-employee-unjustly-3db4@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kylinos.cn:mid];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[kylinos.cn];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dengjie03@kylinos.cn,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33768-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3]
X-Rspamd-Queue-Id: 7653A1B2277
X-Rspamd-Action: no action


在 2026/2/26 22:28, Greg Kroah-Hartman 写道:
> On Thu, Feb 26, 2026 at 05:47:37PM +0800, Jie Deng wrote:
>> Some USB devices incorrectly report bNumConfigurations as 0 in their
>> device descriptor, which causes the USB core to reject them during
>> enumeration.
>> logs:
>> usb 1-2: device descriptor read/64, error -71
>> usb 1-2: no configurations
>> usb 1-2: can't read configurations, error -22
>>
>> However, these devices actually work correctly when
>> treated as having a single configuration.
> Really?  Don't devices like this violate the USB spec?
These devices do not comply with the USB spec in terms
of uploading the device descriptors.
>> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
>> index 1cd5fa61dc76..f60fed224cbb 100644
>> --- a/drivers/usb/core/config.c
>> +++ b/drivers/usb/core/config.c
>> @@ -927,7 +927,12 @@ int usb_get_configuration(struct usb_device *dev)
>>   		dev->descriptor.bNumConfigurations = ncfg = USB_MAXCONFIG;
>>   	}
>>   
>> -	if (ncfg < 1) {
>> +	if (dev->quirks & USB_QUIRK_FORCE_ONE_CONFIG) {
>> +		dev_info(ddev, "Device claims zero configurations,
>> +				forcing to 1\n");
>> +		dev->descriptor.bNumConfigurations = 1;
>> +		ncfg = 1;
> But is the configuration descriptor actually present?  This feels odd to
> me.
>
> thanks,
>
> greg k-h

The configuration descriptor exists. I connected this device to the 
Windows system,
and the device worked normally. By capturing the data packets during the 
enumeration
process of this device on both the Windows and Linux systems, it was 
found that when
the bNumConfigurations value was 0 on the Windows system, it would 
default to using
a single configuration to continue the enumeration. However, on the 
Linux system,
the enumeration would be terminated.

Jie Deng



