Return-Path: <linux-usb+bounces-35541-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCRDG8RCxmlRIAUAu9opvQ
	(envelope-from <linux-usb+bounces-35541-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 09:41:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD2534124E
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 09:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAD7330459FE
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 08:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA073D75BA;
	Fri, 27 Mar 2026 08:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Klsg/bW4"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4CB3D170E;
	Fri, 27 Mar 2026 08:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600763; cv=none; b=dKNmitD5g8u3eqPJWyuGOHpwWah5SLDo3iNKN+K98t8QgtExtwZVfwNaOuwvE9asYNOjxH95t26n4TZ4DKi3nSLlOnTtZsynUqB0Labgpml2/8Ryy7sxfSkQx0ricvJXvVDJuWqDSbas/eYu2AMyIGdFLATwu9HXcqOnbKEhkrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600763; c=relaxed/simple;
	bh=CvjosGmgGWsamF6d4kfKKJ/lTth5SWPM72dubgAKses=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VkhXXNUWhbaGLlkINjfqVnD07EDwPpI7lDlDUDLz1C5j6fxR2W/YCCb613H6wCKFW6f+AStw9HHGZM0s4qz7KRHk6kLKHlpGgGMRqeul+U68M2m39QrpwloeQzk2S+dXPt6V6c28aUotNNytmmgaXs752DE11XlgyPoJRJu6p6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Klsg/bW4; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=fyBU2iBlutvJLKSem8Iq0QgalALwj/6TqQLJ365vS9Y=;
	b=Klsg/bW4LURwg5EYRAPiy5LsSVNZUFTGwgf57Gxuxw1Dmg88yj28Ki4z9F9SUG
	wq3QxduEJY6Qyx/aQ+jqwV1hlkkgzQdOL/X9SvWTkS1e8CXKRWUD/XspOFXolyCG
	p0Y4grldsYbJw8HV6HkdBWTAgRhj/czlXbBiOcvmZgseI=
Received: from [10.42.12.46] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgC3f94nQsZp+d6KXg--.16323S2;
	Fri, 27 Mar 2026 16:39:05 +0800 (CST)
Message-ID: <722d5e64-a4d8-4ab2-954d-22f9b67f8f4e@163.com>
Date: Fri, 27 Mar 2026 16:39:03 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: tools: Add usbip host driver availability check
To: Shuah Khan <skhan@linuxfoundation.org>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: i@zenithal.me, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 valentina.manea.m@gmail.com, Zongmin Zhou <zhouzongmin@kylinos.cn>
References: <29c03d8b-c73b-4393-95ff-bbf5c31df86e@linuxfoundation.org>
 <20260325022634.279624-1-min_halo@163.com>
 <2026032555-headrest-example-af16@gregkh>
 <1fdab10a-86f0-454a-af10-396a53169ea7@163.com>
 <2026032615-donated-chaps-9eac@gregkh>
 <1e974e1d-afdc-41a5-95a7-45e19e77a087@linuxfoundation.org>
Content-Language: en-US
From: Zongmin Zhou <min_halo@163.com>
In-Reply-To: <1e974e1d-afdc-41a5-95a7-45e19e77a087@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgC3f94nQsZp+d6KXg--.16323S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuFWxuryDuw4UCw17tr48Crg_yoW7CryfpF
	W8tFWjkrWUJF47ArsFvF1Ykay0gwsrtr4Fgr1rJw15Ww1qv3W7Kr9xtrn5CayxGr4Yqr1I
	yFWqqFZrGFyUXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTHqxUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC0QmmUmnGQikFkAAA39
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35541-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[zenithal.me,vger.kernel.org,gmail.com,kylinos.cn];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[min_halo@163.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[163.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email,kylinos.cn:email]
X-Rspamd-Queue-Id: DBD2534124E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 2026/3/27 02:43, Shuah Khan wrote:
> On 3/26/26 02:43, Greg KH wrote:
>> On Thu, Mar 26, 2026 at 11:10:02AM +0800, Zongmin Zhou wrote:
>>>
>>> On 2026/3/25 16:58, Greg KH wrote:
>>>> On Wed, Mar 25, 2026 at 10:26:34AM +0800, Zongmin Zhou wrote:
>>>>> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>>>>
>>>>> Currently, usbip_generic_driver_open() doesn't verify that the 
>>>>> required
>>>>> kernel module (usbip-host or usbip-vudc) is actually loaded.
>>>>> The function returns success even when no driver is present,
>>>>> leading to usbipd daemon run success without driver loaded.
>>>>>
>>>>> So add a check function to ensure usbip host driver has been loaded.
>>>>>
>>>>> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
>>>>> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Use system calls directly instead of checking sysfs dir.
>>>>>
>>>>>    tools/usb/usbip/libsrc/usbip_device_driver.c | 7 +++++--
>>>>>    tools/usb/usbip/libsrc/usbip_host_driver.c   | 8 ++++++--
>>>>>    2 files changed, 11 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c 
>>>>> b/tools/usb/usbip/libsrc/usbip_device_driver.c
>>>>> index 927a151fa9aa..45ab647ef241 100644
>>>>> --- a/tools/usb/usbip/libsrc/usbip_device_driver.c
>>>>> +++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
>>>>> @@ -136,10 +136,13 @@ static int usbip_device_driver_open(struct 
>>>>> usbip_host_driver *hdriver)
>>>>>        hdriver->ndevs = 0;
>>>>>        INIT_LIST_HEAD(&hdriver->edev_list);
>>>>> -    ret = usbip_generic_driver_open(hdriver);
>>>>> -    if (ret)
>>>>> +    if (system("/sbin/lsmod | grep -q usbip_vudc")){
>>>> What happens if the module is built into the kernel?
>>>>
>>>>>            err("please load " USBIP_CORE_MOD_NAME ".ko and "
>>>>>                USBIP_DEVICE_DRV_NAME ".ko!");
>>>>> +        return -1;
>>>>> +    }
>>>>> +
>>>>> +    ret = usbip_generic_driver_open(hdriver);
>>>>>        return ret;
>>>>>    }
>>>>> diff --git a/tools/usb/usbip/libsrc/usbip_host_driver.c 
>>>>> b/tools/usb/usbip/libsrc/usbip_host_driver.c
>>>>> index 573e73ec36bd..f0ac941d4f6e 100644
>>>>> --- a/tools/usb/usbip/libsrc/usbip_host_driver.c
>>>>> +++ b/tools/usb/usbip/libsrc/usbip_host_driver.c
>>>>> @@ -31,10 +31,14 @@ static int usbip_host_driver_open(struct 
>>>>> usbip_host_driver *hdriver)
>>>>>        hdriver->ndevs = 0;
>>>>>        INIT_LIST_HEAD(&hdriver->edev_list);
>>>>> -    ret = usbip_generic_driver_open(hdriver);
>>>>> -    if (ret)
>>>>> +    if (system("/sbin/lsmod | grep -q usbip_host")){
>>>> Same here, what happens if it is built in?
>>> Thank you for pointing this out.
>>> I apologize for not considering the built-in module case.
>>>
>>> You are right that using lsmod | grep would incorrectly fail when 
>>> usbip_host
>>> is built into the kernel (CONFIG_USBIP_HOST=y).
>>> Usbip has always been built as a loadable module (.ko) by default, 
>>> which led
>>> to this oversight.
>>>
>>> To address this issue, would the following approach be acceptable?
>>
>> Wait, what "issue" are you trying to fix here?  Why can't you just check
>> for opening the correct device node when the host opens the file and if
>> that fails, report an error?  Doesn't that happen today already?
>>
>
> The problem Zongmin is trying fix ish when usbipd starts, it looks for
> exported if any - if it doesn't find any it assumes there aren't any
> exported and doesn't detect that usbip_host driver isn't loaded.
>
> refresh_exported_devices() doesn't have the logic and it shouldn't
> include that logic because this hook is called periodically to
> refresh the list of exported devices. Starting usbipd and loading
> the driver are distinct steps and without any dependencies.
>
> This patch he is trying to add that detection so a message can be printed
> to say "load the driver".
>
> A message can be added easily to cover two cases:
>
> 1. usbip_host driver isn't loaded
> 2. There are no exported devices.
>
> refresh_exported_devices() will not find any devices in both
> of the above scenarios. It isn't an error if it can't find
> any exported devices.
>
> An informational message when refresh_exported_devices()
> when it doesn't find any devices could help users.
>
> Zongmin,
>
> Would adding a message that says
> "Check if usbip_host driver is loaded or export devices"
> solve the problem of hard to debug problem you are addressing here?
>
Shuah,

Your suggestion makes sense.
Adding an informational message when no devices are found would be a simple
and clean solution that helps users debug without being intrusive.

However, I plan to add the info() message in usbip_generic_driver_open() 
instead of
refresh_exported_devices(), because:
- usbip_generic_driver_open() is called only once at initialization.
- refresh_exported_devices() is called periodically to refresh the 
exported device list.
- When the server has no exported devices, having zero devices
   is normal and not worth frequent info messages.

Theoretically, we only need to prompt once at startup. Is my 
understanding correct?

I'll also remove the existing error messages like below,
since they cannot accurately determine whether the driver is loaded:

if (ret)
     err("please load " USBIP_CORE_MOD_NAME ".ko and "
         USBIP_HOST_DRV_NAME ".ko!");

Does this approach look acceptable?

Best regards,
--Zongmin Zhou
> thanks,
> -- Shuah


