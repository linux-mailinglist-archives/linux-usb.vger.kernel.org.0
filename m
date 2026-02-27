Return-Path: <linux-usb+bounces-33767-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBkeEOD3oGmboQQAu9opvQ
	(envelope-from <linux-usb+bounces-33767-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 02:48:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B11DA1B19EA
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 02:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FEE1304A56B
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 01:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1E52836B0;
	Fri, 27 Feb 2026 01:48:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C880187FE4;
	Fri, 27 Feb 2026 01:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772156890; cv=none; b=i4t9YZNSXOuM4TQ8XERRIdt7mRIBKoMxs7hYMUpYpeY0HpyW4ogCYEQe61nomqIAY4IQzZVQV6vEzJyCk2GrOi/W4AP4MY0QkGzO5MOg2uc97KGuAGZ35Sccv0y6cXpq/SOQ8hyiFyeYtabBKliBG+Tkn8w0TyS6uC04xema764=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772156890; c=relaxed/simple;
	bh=+mO29pY5xkAhBn8kXqyrbYAg4/tW5/wsxsbH+wECMhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KeNHx+mK+KeI6Hp5DeavtxkdwrvINKSNhnprIId3MVUTn01N10XQcYAue+yusdZ2HHOyPa0Z35h/te82qYjj4bRpnLTFNzSipEcMDBbOqBR8OVVhhzrPAUAa8WnUwprhM9sfvQIHJjVub1ch0g1QQrDOAaMLwe0Phl+rBzcVRlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 553cd078137e11f1a21c59e7364eecb8-20260227
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:49a8f971-2088-4adc-bd50-64f2e1f4dd31,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:8dd07d2af5a48bbe8854672c4fc5f2a6,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 553cd078137e11f1a21c59e7364eecb8-20260227
X-User: dengjie03@kylinos.cn
Received: from [10.42.12.246] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 989593087; Fri, 27 Feb 2026 09:47:54 +0800
Message-ID: <f7999b43-b6e2-44f4-b8e1-c2b5f5d04a5c@kylinos.cn>
Date: Fri, 27 Feb 2026 09:47:51 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: core: new quirk to handle devices with zero
 configurations
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260226094737.1306471-1-dengjie03@kylinos.cn>
 <69dfd06e-3745-463d-a634-c6eaf946d962@rowland.harvard.edu>
From: Jie Deng <dengjie03@kylinos.cn>
In-Reply-To: <69dfd06e-3745-463d-a634-c6eaf946d962@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[kylinos.cn];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dengjie03@kylinos.cn,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33767-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4]
X-Rspamd-Queue-Id: B11DA1B19EA
X-Rspamd-Action: no action


在 2026/2/26 23:30, Alan Stern 写道:
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
>>
>> Add a new quirk USB_QUIRK_FORCE_ONE_CONFIG to handle such devices.
>> When this quirk is set, assume the device has 1 configuration instead
>> of failing with -EINVAL.
>>
>> This quirk is applied to the device with VID:PID 5131:2007 which
>> exhibits this behavior.
>>
>> Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
>> ---
>>   Documentation/admin-guide/kernel-parameters.txt | 3 +++
>>   drivers/usb/core/config.c                       | 7 ++++++-
>>   drivers/usb/core/quirks.c                       | 5 +++++
>>   include/linux/usb/quirks.h                      | 3 +++
>>   4 files changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index cb850e5290c2..63e6d3ebbd7a 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -8183,6 +8183,9 @@ Kernel parameters
>>   				p = USB_QUIRK_SHORT_SET_ADDRESS_REQ_TIMEOUT
>>   					(Reduce timeout of the SET_ADDRESS
>>   					request from 5000 ms to 500 ms);
>> +				r = USB_QUIRK_FORCE_ONE_CONFIG (Device
>> +					claims zero configurations,
>> +					forcing to 1);
>>   			Example: quirks=0781:5580:bk,0a5c:5834:gij
>>   
>>   	usbhid.mousepoll=
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
> What if a device claims to have 2 configurations but the flag is set?
> This will cause the kernel to ignore the second configuration.

Thank you for your reply. I will modify the judgment logic and

generate a new version of the patch.

Jie Deng

>
>> +	} esle if (ncfg < 1) {
> -----------^^
>
> Clearly you never compiled this code.
>
> Alan Stern

