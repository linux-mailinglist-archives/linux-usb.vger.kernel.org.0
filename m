Return-Path: <linux-usb+bounces-35478-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE+aBaqjxGle1wQAu9opvQ
	(envelope-from <linux-usb+bounces-35478-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 04:10:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 694D032EA2E
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 04:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BFDE302C6E8
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 03:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FFC39022E;
	Thu, 26 Mar 2026 03:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="a9kkf4Ys"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BD633A9DB;
	Thu, 26 Mar 2026 03:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774494627; cv=none; b=d89REMYC9VBqUOWmtY+hilJubBWjDZmmXzzyk7aXaW312/czbM/W9/CHJRF+W0SogOGvXdaUXNElaOOxTGKh980qPCzm7hC6s/bRJQUYBtugnhL7gyoJEaeuzpZAvYI32NJAYF6Wz1P83d9CuYpm491zq+sT3ZnJuufccHBFGAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774494627; c=relaxed/simple;
	bh=bUkjN6tRmZrx2FMoPZmycxvtOCKvZb6Y+Rltbv5ZFT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBg72H6w3xmTv13q7p0/bOrEfNfzxyca62jwagW1v1P10L4CX3B1DO3QkeEKQuE1FHV7k02jiefRwbxjd8NB+AFd3FlACbXZn9hM7HH9xicyTJmfjnmPkwRCtNiIENSnPbAM9V25HTYcY6B3883kkeH9vVZckva1kDtK97nDZyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=a9kkf4Ys; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=EFGf0/tBlHnnfINhRfFASuEvPBsDXiDiPxRw5SoKVvU=;
	b=a9kkf4YskQD5iFqO8+ZIul+XXWsZGrlopJx6O+jV6Bhos5L6yyapFJlLMjKs0b
	CZon/ap+vSK0jy8Nqx5TkLMYnAUAJcX5+Q8EdMkTvDI/rQYx+XRMB+Aq1RS+FVrD
	ZQkx6KkQMPOrgzE3ralE60M81F0p0QrQyWtjdF6GYgzJw=
Received: from [10.42.12.46] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgB3b5eKo8RpisjaAw--.84S2;
	Thu, 26 Mar 2026 11:10:07 +0800 (CST)
Message-ID: <1fdab10a-86f0-454a-af10-396a53169ea7@163.com>
Date: Thu, 26 Mar 2026 11:10:02 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: tools: Add usbip host driver availability check
To: Greg KH <gregkh@linuxfoundation.org>
Cc: skhan@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, valentina.manea.m@gmail.com,
 Zongmin Zhou <zhouzongmin@kylinos.cn>
References: <29c03d8b-c73b-4393-95ff-bbf5c31df86e@linuxfoundation.org>
 <20260325022634.279624-1-min_halo@163.com>
 <2026032555-headrest-example-af16@gregkh>
Content-Language: en-US
From: Zongmin Zhou <min_halo@163.com>
In-Reply-To: <2026032555-headrest-example-af16@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgB3b5eKo8RpisjaAw--.84S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF4DWF48CFWxJr18JF47urg_yoWrJF1xpF
	W8tFWFkrW8XFs7XwsFqF1fAFW8KwsrtrWFgF1rJw15XwsrZw17K3sxtFnYkFWxGw4Yqrn7
	tFZIqa9rGFyUJw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTHqxUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC8w+XQ2nEo4-YaQAA3Y
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35478-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,zenithal.me,vger.kernel.org,gmail.com,kylinos.cn];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kylinos.cn:email]
X-Rspamd-Queue-Id: 694D032EA2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 2026/3/25 16:58, Greg KH wrote:
> On Wed, Mar 25, 2026 at 10:26:34AM +0800, Zongmin Zhou wrote:
>> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>
>> Currently, usbip_generic_driver_open() doesn't verify that the required
>> kernel module (usbip-host or usbip-vudc) is actually loaded.
>> The function returns success even when no driver is present,
>> leading to usbipd daemon run success without driver loaded.
>>
>> So add a check function to ensure usbip host driver has been loaded.
>>
>> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
>> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
>> ---
>> Changes in v2:
>> - Use system calls directly instead of checking sysfs dir.
>>
>>   tools/usb/usbip/libsrc/usbip_device_driver.c | 7 +++++--
>>   tools/usb/usbip/libsrc/usbip_host_driver.c   | 8 ++++++--
>>   2 files changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
>> index 927a151fa9aa..45ab647ef241 100644
>> --- a/tools/usb/usbip/libsrc/usbip_device_driver.c
>> +++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
>> @@ -136,10 +136,13 @@ static int usbip_device_driver_open(struct usbip_host_driver *hdriver)
>>   	hdriver->ndevs = 0;
>>   	INIT_LIST_HEAD(&hdriver->edev_list);
>>   
>> -	ret = usbip_generic_driver_open(hdriver);
>> -	if (ret)
>> +	if (system("/sbin/lsmod | grep -q usbip_vudc")){
> What happens if the module is built into the kernel?
>
>>   		err("please load " USBIP_CORE_MOD_NAME ".ko and "
>>   		    USBIP_DEVICE_DRV_NAME ".ko!");
>> +		return -1;
>> +	}
>> +
>> +	ret = usbip_generic_driver_open(hdriver);
>>   
>>   	return ret;
>>   }
>> diff --git a/tools/usb/usbip/libsrc/usbip_host_driver.c b/tools/usb/usbip/libsrc/usbip_host_driver.c
>> index 573e73ec36bd..f0ac941d4f6e 100644
>> --- a/tools/usb/usbip/libsrc/usbip_host_driver.c
>> +++ b/tools/usb/usbip/libsrc/usbip_host_driver.c
>> @@ -31,10 +31,14 @@ static int usbip_host_driver_open(struct usbip_host_driver *hdriver)
>>   	hdriver->ndevs = 0;
>>   	INIT_LIST_HEAD(&hdriver->edev_list);
>>   
>> -	ret = usbip_generic_driver_open(hdriver);
>> -	if (ret)
>> +	if (system("/sbin/lsmod | grep -q usbip_host")){
> Same here, what happens if it is built in?
Thank you for pointing this out.
I apologize for not considering the built-in module case.

You are right that using lsmod | grep would incorrectly fail when 
usbip_host is built into the kernel (CONFIG_USBIP_HOST=y).
Usbip has always been built as a loadable module (.ko) by default, which 
led to this oversight.

To address this issue, would the following approach be acceptable?
1. Uses /sys/module/usbip_host to check wehther had been loaded, which 
exists for both loadable modules and built-in drivers.
2. Attempts to load the module via modprobe if it is not already loaded.

for example:
static int probe_usbip_host_driver(void)
{
      struct stat st;
      return !stat("/sys/module/usbip_host", &st);
}

static int usbip_host_driver_open(struct usbip_host_driver *hdriver)
{
      // 1. Check if driver is already loaded/built-in
      if (!probe_usbip_host_driver()) {
          // 2. Try to load the module
          system("/sbin/modprobe usbip-host > /dev/null 2>&1");
         // 3. Check again
           if (!probe_usbip_host_driver()) {
               err("please load " USBIP_CORE_MOD_NAME ".ko and "
                   USBIP_HOST_DRV_NAME ".ko!");
               return -1;
}
}

       // Continue with normal flow...
       ret = usbip_generic_driver_open(hdriver);
       return ret;
}

Does this look reasonable to you? I would be happy to submit a v3 patch 
with this approach if you agree.
>
> thanks,
>
> greg k-h


