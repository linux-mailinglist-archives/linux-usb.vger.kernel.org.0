Return-Path: <linux-usb+bounces-33775-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Lwq5F5lZoWl2sQQAu9opvQ
	(envelope-from <linux-usb+bounces-33775-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 09:45:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F231B4A3B
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 09:45:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDF4A30659CC
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 08:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A6A39A808;
	Fri, 27 Feb 2026 08:45:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B576F361670;
	Fri, 27 Feb 2026 08:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772181906; cv=none; b=uwqehIQjU1HnElhxrFiJ3Zm0K+aMrWlZhD6+upLO9NlMUTLT/qQoqU4JV/DQUrMNGhKz+aXpyJIcXfxN00cQlB/vRj6T2UTawG8XwErVgJUbnNyrfNqfo60U1zJxuv61MwqrzowLHyE1KmHKNYPjHRVZRIV2nePXKRHS0T87Ny4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772181906; c=relaxed/simple;
	bh=pIOddvEITzOfqHqjvgCbAXGUHeVjrl752YPYZ7YbZ+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QuPCfoFz/G8PuGPPrmMh/4MsMkOYgYPmxCyqIjuiXtkpGl2eVoK6sVfGLhDIKnm8kHqfe3LdWV0mZNqWybvCvDYzkFBS0hbUfX5XlvCb3ne4i3bOmTW6/8EasIAUEWz8pWSPy5dYtk1B+L17TNLOQ0jia6zVEnzrhpxG6iRgUMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 973a60f013b811f1a21c59e7364eecb8-20260227
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:20114614-882f-4c08-883c-1cb005f86225,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:deed5c3dcaf6fde12721b604826e895a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 973a60f013b811f1a21c59e7364eecb8-20260227
X-User: dengjie03@kylinos.cn
Received: from [10.42.12.246] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1341646736; Fri, 27 Feb 2026 16:44:55 +0800
Message-ID: <f8e1a916-f26a-4bb7-85ff-d4d4f0190db1@kylinos.cn>
Date: Fri, 27 Feb 2026 16:44:53 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: core: new quirk to handle devices with zero
 configurations
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260227060400.1480039-1-dengjie03@kylinos.cn>
 <2026022652-padding-backlight-ae49@gregkh>
From: Jie Deng <dengjie03@kylinos.cn>
In-Reply-To: <2026022652-padding-backlight-ae49@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	DMARC_NA(0.00)[kylinos.cn];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dengjie03@kylinos.cn,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-33775-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4]
X-Rspamd-Queue-Id: D7F231B4A3B
X-Rspamd-Action: no action


在 2026/2/27 14:06, Greg Kroah-Hartman 写道:
> On Fri, Feb 27, 2026 at 02:04:00PM +0800, Jie Deng wrote:
>> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
>> index 1cd5fa61dc76..832717549515 100644
>> --- a/drivers/usb/core/config.c
>> +++ b/drivers/usb/core/config.c
>> @@ -927,7 +927,12 @@ int usb_get_configuration(struct usb_device *dev)
>>   		dev->descriptor.bNumConfigurations = ncfg = USB_MAXCONFIG;
>>   	}
>>   
>> -	if (ncfg < 1) {
>> +	if (ncfg < 1 && dev->quirks & USB_QUIRK_FORCE_ONE_CONFIG) {
>> +		dev_info(ddev, "Device claims zero configurations, "
>> +				"forcing to 1\n");
> Do not break a string like this, make it all one line please.
> checkpatch should have warned you about this?
>
> thanks,
>
> greg k-h

Thank you for your reply. I will make the necessary revisions and submit 
the updated patch.

Jie Deng


