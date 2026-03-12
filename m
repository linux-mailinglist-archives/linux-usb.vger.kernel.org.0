Return-Path: <linux-usb+bounces-34636-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE/bJoMismnlIwAAu9opvQ
	(envelope-from <linux-usb+bounces-34636-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 03:18:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C6926C25E
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 03:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD07E3054215
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 02:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA124352C35;
	Thu, 12 Mar 2026 02:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KHjXsa7J"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813F51A680F;
	Thu, 12 Mar 2026 02:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773281897; cv=none; b=uo4VpoAb6lnTxRGs0Rv3/ThQ7aXHYEEfSg7UAsdLFRq5rW7j62GA3WOebAhMp4zCheLaYvVw0r3iINMMBZSIqFBFIwV7tU8oeI/povKstcVGh//o1XDgwrcthZS80/1VfMwZadrGd2FmivQ0f0BJudvWZBogAQTWQKhHBdXjJ3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773281897; c=relaxed/simple;
	bh=G3qhTtVi0sLXEkDmgEgKp+6H6ytiMms2w0cMBOyA9+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yg9e5yHaiuP4SQxldZ/0tZHnkrskrm8m/QvUQj8l8jw0x/Benvd65C/8JwKIl2uRbF3Bjm0/GZbBlOWbsDcKq2Beq66KHDHZjMVpPh4R6pyb9knqLEw6Wj3YqzJhTaLQRpn1ajtCHpIvgzuqmm343YR0zZtlRW2kdHdlxeI1Wgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KHjXsa7J; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=Wh/cG5WuehZBjOv/XDOCO3VMceoWbs8HaJ5OagqfHeU=;
	b=KHjXsa7J0YvlNtgYTwZHF3eofU7ECrm586UzpRZs2HAbkNx5vvCPOUHu90BYbB
	3Zzyzh2IEFgHC5jpAC2SY4AcefqRSyRLJccuoqjeQ+VD6y9Gfe7D4JCqwNVGYVCc
	BenWyeXuPDXMWHIr1tNn5rBDVN0BzraS+E3JjI5o/f++E=
Received: from [10.42.12.46] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDXrOdMIrJpDUEpSQ--.27S2;
	Thu, 12 Mar 2026 10:17:51 +0800 (CST)
Message-ID: <bf5faa3f-6b59-4977-a29f-811049289b14@163.com>
Date: Thu, 12 Mar 2026 10:17:48 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: tools: Add usbip host driver availability check
To: Shuah Khan <skhan@linuxfoundation.org>, valentina.manea.m@gmail.com,
 shuah@kernel.org, i@zenithal.me, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zongmin Zhou <zhouzongmin@kylinos.cn>
References: <20260303081720.84868-1-min_halo@163.com>
 <190cf50b-7b1d-4b97-9f9c-86242cff1391@linuxfoundation.org>
Content-Language: en-US
From: Zongmin Zhou <min_halo@163.com>
In-Reply-To: <190cf50b-7b1d-4b97-9f9c-86242cff1391@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDXrOdMIrJpDUEpSQ--.27S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3AF1kZry5Xr45Zw1kCrWDCFg_yoW7KFWrpF
	WUJFWFkrW8JFsrXwsFqF1rAay0qwsxt3y0gr1fJw15urnFv347W3sxtFn5uFWfGr4UWFnF
	yFs0vasrGFyUG3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UseOXUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC8w+iTmmyIk-E0QAA3z
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34636-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com,kernel.org,zenithal.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[min_halo@163.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[163.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 06C6926C25E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 2026/3/11 06:28, Shuah Khan wrote:
> On 3/3/26 01:17, Zongmin Zhou wrote:
>> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>
>> Currently, usbip_generic_driver_open() doesn't verify that the required
>> kernel module (usbip-host or usbip-vudc) is actually loaded.
>> The function returns success even when no driver is present,
>> leading to usbipd daemon run success without driver loaded.
>
> Doesn't usbip_generic_driver_open() try to refresh exported
> device list and fail? It returns error if it can't find fetch
> them.
>
> usbipd starts and the when usbip_host is loaded it works correctly.
> Doesn't it?
Actually, refresh_exported_devices() does not return an error
when the driver is not loaded,it consistently returns 0.
It only results in hdriver->ndevs being set to 0 if no exportable usbip 
devices are found.
Consequently, if the driver is missing, usbipd will start successfully 
in silence,
but subsequent usbip attach operations will fail.
The lack of explicit error messages makes it difficult for users to 
troubleshoot the root cause.
By adding a check to verify if the driver is loaded during the usbip 
daemon startup,
we can prevent these silent exceptions and ensure users are alerted to
the missing kernel module before they attempt to use the service.
>>
>> So add a check function to ensure usbip host driver has been loaded.
>>
>> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
>> ---
>>   tools/usb/usbip/libsrc/usbip_device_driver.c |  2 ++
>>   tools/usb/usbip/libsrc/usbip_host_common.c   | 31 ++++++++++++++++++++
>>   tools/usb/usbip/libsrc/usbip_host_common.h   |  2 ++
>>   tools/usb/usbip/libsrc/usbip_host_driver.c   |  2 ++
>>   4 files changed, 37 insertions(+)
>>
>> diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c 
>> b/tools/usb/usbip/libsrc/usbip_device_driver.c
>> index 927a151fa9aa..6da000fab26d 100644
>> --- a/tools/usb/usbip/libsrc/usbip_device_driver.c
>> +++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
>> @@ -147,6 +147,8 @@ static int usbip_device_driver_open(struct 
>> usbip_host_driver *hdriver)
>>   struct usbip_host_driver device_driver = {
>>       .edev_list = LIST_HEAD_INIT(device_driver.edev_list),
>>       .udev_subsystem = "udc",
>> +    .bus_type = "platform",
>
> Why are we adding this here - user-space shouldn't need to
> know what kind of driver this is?
The reason I added the bus_type and drv_name fields is to
construct the specific sysfs paths required for the availability check.
Although usbip-host and usbip-vudc share the same 
usbip_generic_driver_open() interface ,
they operate on different bus types and have different driver names.
These fields allow the generic open function to dynamically verify
the correct driver path in sysfs based on the specific driver type being 
initialized.
If you prefer not to expose these in the this structure,
I'm happy to adjust further based on your suggestions.
>
>> +    .drv_name = USBIP_DEVICE_DRV_NAME,
>
> And the name?
>
>>       .ops = {
>>           .open = usbip_device_driver_open,
>>           .close = usbip_generic_driver_close,
>> diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c 
>> b/tools/usb/usbip/libsrc/usbip_host_common.c
>> index ca78aa368476..900370095b61 100644
>> --- a/tools/usb/usbip/libsrc/usbip_host_common.c
>> +++ b/tools/usb/usbip/libsrc/usbip_host_common.c
>> @@ -164,6 +164,31 @@ static void usbip_exported_device_destroy(struct 
>> list_head *devs)
>>       }
>>   }
>>   +/* Check if the usbip host driver is available in sysfs */
>> +static int check_driver_available(struct usbip_host_driver *hdriver)
>> +{
>> +    char driver_path[SYSFS_PATH_MAX];
>> +    struct stat st;
>> +    int ret;
>> +
>> +    if (!hdriver->drv_name || !hdriver->bus_type)
>> +        return 0;
>> +
>> +    //Check if the usbip-host or usbip-vudc driver directory exists 
>> in sysfs.
>> +    snprintf(driver_path, sizeof(driver_path), "%s/%s/%s/%s/%s",
>> +        SYSFS_MNT_PATH, SYSFS_BUS_NAME, hdriver->bus_type,
>> +        SYSFS_DRIVERS_NAME, hdriver->drv_name);
>> +
>> +    ret = stat(driver_path, &st);
>> +    if (ret == 0 && S_ISDIR(st.st_mode)) {
>> +        dbg("driver '%s' is available", hdriver->drv_name);
>> +        return 1;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +
>>   int usbip_generic_driver_open(struct usbip_host_driver *hdriver)
>>   {
>>       int rc;
>> @@ -174,6 +199,12 @@ int usbip_generic_driver_open(struct 
>> usbip_host_driver *hdriver)
>>           return -1;
>>       }
>>   +    //Check if the required driver is actually available.
>> +    if (!check_driver_available(hdriver)) {
>> +        err("please load '%s' kernel module", hdriver->drv_name);
>> +        goto err;
>> +    }
>> +
>>       rc = refresh_exported_devices(hdriver);
>>       if (rc < 0)
>>           goto err;
>> diff --git a/tools/usb/usbip/libsrc/usbip_host_common.h 
>> b/tools/usb/usbip/libsrc/usbip_host_common.h
>> index f46967c0aa18..cf9bd60846cf 100644
>> --- a/tools/usb/usbip/libsrc/usbip_host_common.h
>> +++ b/tools/usb/usbip/libsrc/usbip_host_common.h
>> @@ -40,6 +40,8 @@ struct usbip_host_driver {
>>       /* list of exported device */
>>       struct list_head edev_list;
>>       const char *udev_subsystem;
>> +    const char *bus_type;
>> +    const char *drv_name;
>>       struct usbip_host_driver_ops ops;
>>   };
>>   diff --git a/tools/usb/usbip/libsrc/usbip_host_driver.c 
>> b/tools/usb/usbip/libsrc/usbip_host_driver.c
>> index 573e73ec36bd..e8f9d2ee2497 100644
>> --- a/tools/usb/usbip/libsrc/usbip_host_driver.c
>> +++ b/tools/usb/usbip/libsrc/usbip_host_driver.c
>> @@ -41,6 +41,8 @@ static int usbip_host_driver_open(struct 
>> usbip_host_driver *hdriver)
>>   struct usbip_host_driver host_driver = {
>>       .edev_list = LIST_HEAD_INIT(host_driver.edev_list),
>>       .udev_subsystem = "usb",
>> +    .bus_type = "usb",
>> +    .drv_name = USBIP_HOST_DRV_NAME,
>
>>       .ops = {
>>           .open = usbip_host_driver_open,
>>           .close = usbip_generic_driver_close,
>
> I need more to justify these changes.
>
> thanks,
> -- Shuah


