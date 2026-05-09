Return-Path: <linux-usb+bounces-37171-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODy0E8uq/mkyuwAAu9opvQ
	(envelope-from <linux-usb+bounces-37171-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 05:32:27 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FBC4FDE3B
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 05:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 425A2300A583
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2026 03:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA04313545;
	Sat,  9 May 2026 03:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="NFkYzey8"
X-Original-To: linux-usb@vger.kernel.org
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A252F8E8D;
	Sat,  9 May 2026 03:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778297540; cv=none; b=OchujP+fbnuZ9fpHsd2+muyvzHOdc2fd4jwHd2jz9NlLKMSGCoxKec97P5k6Rhj482IlaaTQG7zyT9iRoQVSq8M7ilXmVL8xo0Xt6gnxxiQ4dJZlarMESkYT0n0LWC58sPb1LpH9kkLoUBlPOAkZmWsezoFModXcnBTJVZYperk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778297540; c=relaxed/simple;
	bh=SV+S+jGCR6NJme2X8FVpwk5Jzzd54kbMZuqsCiMESS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Xinytp4LfvyHgJXYLDRrbUGyn5A/ThHK5DPlFZAZuuxEzAu/xRiCxBUVBXEwnPNV7cKXf/vSbvNekkO2c9tVTB4e8YrfdemCXXIGQIVLcmziv1QVYhx/7+hWrvL2jjVRN4xuJ3yH8hDYRp8i0owTUevWhwdIS3Y7zqTbR6U4mJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=NFkYzey8; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GeJwAWUsuo6YofUlIY552rjGchdy1YoTIcfI8upqc+Y=;
	b=NFkYzey8diP/YuHPAsMeIlp5DfmVkGzuIBNWrWOhanVbmE2uW2fnZrgjF19LZKBqF3QGoXBYK
	JjGAlBRbCSmaxsbo5MMpRoo3AXMYM6RhdxChIV+IJHMOEPqI76gvTz9bUCCYQV1YzREcw2C4Ucc
	ePJ48fcp6NyLRVDmSWQHPBc=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gCBDg5B0bzRhT1;
	Sat,  9 May 2026 11:24:35 +0800 (CST)
Received: from kwepemr500015.china.huawei.com (unknown [7.202.195.162])
	by mail.maildlp.com (Postfix) with ESMTPS id DEF1C4048F;
	Sat,  9 May 2026 11:32:09 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemr500015.china.huawei.com (7.202.195.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 9 May 2026 11:32:09 +0800
Message-ID: <d6cd0a90-526c-4dfb-8677-3b0d4e48e210@huawei.com>
Date: Sat, 9 May 2026 11:32:08 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 & 5.10] usb: typec: ucsi: validate connector number in
 ucsi_connector_change
To: Greg KH <gregkh@linuxfoundation.org>, <heikki.krogerus@linux.intel.com>,
	<nathan.c.rebello@gmail.com>
CC: <kyungtae.kim@dartmouth.edu>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dmitry.baryshkov@linaro.org>
References: <20260508092026.1364820-1-lihongbo22@huawei.com>
 <2026050843-denatured-bonfire-6337@gregkh>
 <1886be01-2dcf-4aa7-9aac-067634db4ce7@huawei.com>
 <2026050857-blanching-clapping-db2c@gregkh>
Content-Language: en-US
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <2026050857-blanching-clapping-db2c@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemr500015.china.huawei.com (7.202.195.162)
X-Rspamd-Queue-Id: 43FBC4FDE3B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,linux.intel.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37171-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lihongbo22@huawei.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Greg,

On 2026/5/8 21:04, Greg KH wrote:
> On Fri, May 08, 2026 at 08:59:06PM +0800, Hongbo Li wrote:
>> Hi Greg,
>>
>> On 2026/5/8 19:03, Greg KH wrote:
>>> On Fri, May 08, 2026 at 05:20:26PM +0800, Hongbo Li wrote:
>>>> Commit d2d8c17ac01a ("usb: typec: ucsi: validate connector
>>>> number in ucsi_notify_common()") and commit 5a1140404cbf ("usb:
>>>> typec: ucsi: skip connector validation before init") add the bounds
>>>> check when do the connector change both in pre-init notification and
>>>> the forward notifications. But they are difficult to backport to
>>>> early stable branch such as LTS 6.6, LTS 5.10 due to many dependencies.
>>>> Instead, we choose to validate connector number in ucsi_connector_change
>>>> directly to avoid out-of-range issue.
>>>
>>> Why just these 2 branches?
>>
>> I only noticed these two branches, but in fact, there are more.
>>
>>>
>>> And what specific commits are needed exactly?  Why not just backport
>>> them all?  that will make future changes apply properly as well, making
>>
>> Commit d2d8c17ac01a ("usb: typec: ucsi: validate connector number in
>> ucsi_notify_common()") use the ucsi_notify_common helper which is introduced
>> in 584e8df58942 ("usb: typec: ucsi: extract common code for command
>> handling"). This commit refactored part of the code and involves many
>> modifications to USB ucsi controllers (such as stm32g0...), which were
>> introduced after 6.6.
> 
> So just 2 commits?  that's nothing, we have taken hundreds of commits of

No. This is not an issue of the number of backport patches.

For commit 584e8df58942, it refractored the logic based on a higher 
version (higher than 6.6) which introduced new ucsi controllers 
(yoga_c630 for 6.6, yoga_c630, glink and stm32g0 for 5.10). So we should 
remove some extra code and resolve conflicts if we backport this patch 
to the target branch like the first way I mentioned.

But I looked at the modification logic of the commit d2d8c17ac01a and 
commit 5a1140404cbf, and I think it can be made simpler (like the patch 
I post), of course, this requires the maintainer to help review it.

And we need Krogerus and Rebello to take a look.

Thanks,
Hongbo

> backports in the past.  Please try to stick to what is exactly upstream,
> it is easier for everyone overall.
> 
> thanks,
> 
> greg k-h
> 

