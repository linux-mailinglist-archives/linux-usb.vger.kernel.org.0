Return-Path: <linux-usb+bounces-31399-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4BECB7F4B
	for <lists+linux-usb@lfdr.de>; Fri, 12 Dec 2025 06:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9039F300B83E
	for <lists+linux-usb@lfdr.de>; Fri, 12 Dec 2025 05:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C5428DF07;
	Fri, 12 Dec 2025 05:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=natalieee.net header.i=@natalieee.net header.b="DxeD3YuD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.sakamoto.pl (mail.sakamoto.pl [185.236.240.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460E2248F6A
	for <linux-usb@vger.kernel.org>; Fri, 12 Dec 2025 05:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.236.240.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765517711; cv=none; b=bbkHf498w/PY5gQBg6qdTxPhtHhxbd3i76nQyeNuhi8eZsWr+g8CyZBYEByy0EkH2p9RVQaFXmSo6jQR3vV2sRKQ5dq3CCSi37rV+pPLAtk5New6TKo52AGSOrNSoqoJE0Gf56pHrnUKyxCxsA9ad1tb6Md6UymsSMWLS2f1fJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765517711; c=relaxed/simple;
	bh=iFMHFgT5lL7gx1RxtbruztoJYKdpM/fshbDFlQGhOXo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=VK7cT7ZzwRSF48oTKWYvxOJJC9cysdceLmaALb/g2nfOX8l565yMtkdWRPFcFxzHFrXukPbu0aSRQAd1TBaWoeGtBoTTXH/7s5PGlnp0tfMq6GpaHumRlyqa/zfY1vGdh5Kwb4HRgqz/GuoImZqAMfcGMekBrA5q2DWRLVtHrW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=natalieee.net; spf=pass smtp.mailfrom=natalieee.net; dkim=pass (2048-bit key) header.d=natalieee.net header.i=@natalieee.net header.b=DxeD3YuD; arc=none smtp.client-ip=185.236.240.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=natalieee.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=natalieee.net
Authentication-Results: mail.sakamoto.pl;
	auth=pass (plain)
Message-ID: <9c4491aa-88d3-4c9a-843c-2f0d471263e0@natalieee.net>
Date: Thu, 11 Dec 2025 21:33:51 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-usb@vger.kernel.org
From: natalie roentgen connolly <natalie@natalieee.net>
Subject: Trouble with drivers for Epson Moverio BT-40
Autocrypt: addr=natalie@natalieee.net; keydata=
 xjMEZyF+dhYJKwYBBAHaRw8BAQdAuh3EVhqODqs4DQasm/jUILG+4cNj0Q3Gb8SITEhqNNvN
 PW5hdGFsaWUgcm9lbnRnZW4gY29ubm9sbHkgKGJlZXAgYm9vcCkgPG5hdGFsaWVAbmF0YWxp
 ZWVlLm5ldD7CmQQTFgoAQRYhBJo0/NsX3ToM9ZBiC6HD1we8+QjlBQJnIX52AhsDBQkDwmcA
 BQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJEKHD1we8+Qjl0VYBAKrJtKM2bJj6hsU+
 kTt8HXxDNdCY37eSL6GxzQ4fGBqJAP9NuysVDyyFVL7HOkUa3XbNFkxgSNNfDSXnyXG1/JnZ
 Ds44BGchfnYSCisGAQQBl1UBBQEBB0CebBBPcowxbCbOIAM9aJAe2kHbNZ4bIxZT7klRjf0+
 WgMBCAfCfgQYFgoAJhYhBJo0/NsX3ToM9ZBiC6HD1we8+QjlBQJnIX52AhsMBQkDwmcAAAoJ
 EKHD1we8+QjldDoBAIj3f2uA6AWu08lWSBkEDKrzKMduShD/Pv8jvDyznHvHAP0VskOMQSFg
 9MBrwZ+7azZzgnCs2FSiZvHJW7HTo4v9Bw==
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Haraka-GeoIP: US
X-Haraka-GeoIP-Received: 2601:1c2:880:14b0::6234:US
Received: from localhost (Unknown [127.0.0.1])
	by mail.sakamoto.pl (Haraka/3.0.3) with ESMTPSA id D7FCA2CD-A946-453D-B0A8-7BECB6EC1806.1
	envelope-from <natalie@natalieee.net>
	tls TLS_AES_256_GCM_SHA384 (authenticated bits=0);
	Fri, 12 Dec 2025 06:33:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalieee.net;
 h=Content-Transfer-Encoding: Content-Type: Subject: From: To:
 MIME-Version: Date: Message-ID; q=dns/txt; s=s20250406155; t=1765517622;
 bh=cN4Fxguzec83feOiPfXtrA1sgfYQGoseWL5MY3vkhFc=;
 b=DxeD3YuDcEAFDF3DTaBPryIdZZHUaIpimDjFDx1xjdQkIroLuW1LPitQB5ooLUBq0mnG7cKkW
 6dzMEwulJP8WwEx6bFhibwy/+RteeGoRYBKMr94/CGkLE1qFmDloAD7Dz56Gsg/sMOiYVcB2MKb
 1DZldw49Qj6z1GmxnQIHdZSOEQQzC3Is2uwIzshXCBPvIE0KPQ5DAuDcJgnoJQBGt+o9qg7d6hb
 t0nMSiQnr+fbuPmQGrNEPCV57VnWnIMIdUqrhUpCvJNGUXmCX9qqu7wV03h8ok5uJnriAc/mUK7
 ryNXaEGBd7JUG6bvx9S0giFj6FdmKb5bgmZci1txpNoQ==

Hello,

I am attempting to get linux to recognize the serial port on an Epson 
Moverio
BT-40. I initially found a means of doing this with the generic usbserial
driver, however upon reading the kernel log I was directed here.

I found a thread regarding this same device from a few years ago, in which
someone stated:
 > The proper driver is cdc-acm but your device has to be defined in the
 > driver with the quirk NO_UNION_NORMAL due to the flawed Union descriptor
 > in your device.
(https://lore.kernel.org/linux-usb/27d60f61-77cf-46d5-9e60-8f60e8469008@gmail.com/)

accordingly, I added the following code to `acm_ids` in
drivers/usb/class/cdc-acm.c:
{ USB_DEVICE(0x04b8, 0x0d12), /* Epson Moverio BT-40 */
.driver_info = NO_UNION_NORMAL,
},

I then recompiled and reloaded the module. The device continued to not 
appear in
/dev/ttyACM*, and the following logs were present in dmesg:
[74979.083657] [T14633] usbcore: deregistering interface driver cdc_acm
[74982.121760] [T14686] cdc_acm 7-1.2:1.1: probe with driver cdc_acm 
failed with error -22
[74982.121771] [T14686] cdc_acm 7-1.2:1.2: probe with driver cdc_acm 
failed with error -22
[74982.121799] [T14686] usbcore: registered new interface driver cdc_acm
[74982.121800] [T14686] cdc_acm: USB Abstract Control Model driver for 
USB modems and ISDN adapters

The same invalid argument errors occur upon disconnecting and 
reconnecting the
device. I determined the errors in dmesg to originate in acm_probe() at 
line
1326 in the following code:

if (data_interface->cur_altsetting->desc.bInterfaceClass != 
USB_CLASS_CDC_DATA) {
   if (control_interface->cur_altsetting->desc.bInterfaceClass == 
USB_CLASS_CDC_DATA) {
     dev_dbg(&intf->dev,
       "Your device has switched interfaces.\n");
     swap(control_interface, data_interface);
   } else {
     return -EINVAL;
   }
}

At this point I am unsure as to what to do as I have no experience 
working with
kernel code. As far as I can tell, cdc-acm is indeed the correct driver 
to use
here, as others said so in the thread I found.
(https://lore.kernel.org/linux-usb/2023112652-scowling-submarine-5071@gregkh/)

Here is the device as it appears in /sys/kernel/debug/usb/devices:
T:  Bus=07 Lev=02 Prnt=10 Port=01 Cnt=02 Dev#= 12 Spd=12   MxCh= 0
D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=04b8 ProdID=0d12 Rev= 2.00
S:  Manufacturer=Seiko Epson Corporation
S:  Product=EPSON HMD Com&Sens
S:  SerialNumber=NPH269690136
C:* #Ifs= 4 Cfg#= 1 Atr=c0 MxPwr=100mA
A:  FirstIf#= 1 IfCount= 2 Cls=02(comm.) Sub=02 Prot=01
I:* If#= 0 Alt= 0 #EPs= 1 Cls=03(HID  ) Sub=00 Prot=00 Driver=usbhid
E:  Ad=83(I) Atr=03(Int.) MxPS=  64 Ivl=1ms
I:* If#= 1 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=02 Prot=01 Driver=(none)
E:  Ad=84(I) Atr=03(Int.) MxPS=   8 Ivl=16ms
I:* If#= 2 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=(none)
E:  Ad=01(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 1 Cls=03(HID  ) Sub=00 Prot=00 Driver=usbhid
E:  Ad=82(I) Atr=03(Int.) MxPS=  64 Ivl=1ms

The interfaces with "Driver=(none)" remain that way regardless of if I 
load the
unmodified cdc-acm driver, the cdc-acm driver with my addition in `acm_ids`,
or if I echo "04b8 0d12" in to /sys/bus/usb/drivers/cdc_acm/new_id after 
loading
either version of the module.

Apologies if I have missed something obvious, as stated I have no experience
working with kernel code. Similarly, apologies if I have broken mailing list
conventions in some way, this is the first time I have interacted with one.

Thanks,
Natalie

