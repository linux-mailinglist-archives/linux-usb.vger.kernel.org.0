Return-Path: <linux-usb+bounces-6891-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E949485FB79
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 15:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A063A2882E6
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 14:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640DE1487C5;
	Thu, 22 Feb 2024 14:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="mu39W8tL"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2114.outbound.protection.outlook.com [40.107.7.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2C7131720;
	Thu, 22 Feb 2024 14:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.7.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708612955; cv=fail; b=DEufqlG3i0Lmmni+7q20UFFfmnLYqlQ8I8J7rkGc/qbqpLFJI40fMi73AmUvr6pE5PcMQlsPWd9RSiQDFMe3DNKmfhqSGx8HXfJ9kA5HKMxK3RJjbPR/ePq9gFYS67AS02v+nlKUrp6Le37S+m8qYOTW0ysaBR7FxCWHydWR/1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708612955; c=relaxed/simple;
	bh=GfFLhoqOSiy3kE20033I96DOAqmWPCy+1EEKS/+M8DU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nbkdR1/+fd++IcTJPLiOHTfJHWWBsEfvnLVF0PBq0ysLw0jBtDkBjF51rXX6hpuBBDQ8++uxND780Dipr4yEjzpH1XM3zCpyKy1mzzhRTjNc73XCTEYy8eHJXZnni/Jx1Ntk1tolovWZD5d7WxINxto3Fq8sNhJr6TLC4THQKsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=mu39W8tL; arc=fail smtp.client-ip=40.107.7.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/3YBWpo1SGM0aX3EqHjJZy4lDtouZAgxu4ju298a6VqxyCrN4lpAP/Ho7axekRZbRi1VBQ7KXzMeTlCQTR3hH0zlDP8H4MuoQFjttdKVNobNnn/f5P6RAUy1xgPaV70xxejAJEYriENxvDpRb/2Wrdc7qODwbbJ/hiSfZEG4I0V3ZiHwmv6un6FkhDlcWH81DdlxyIG3ghF/JSE1KlI9bGbROTmsTTXkcGoZh/D8tztUzLEeQodTMGLfad9IoGKI3xVnZimlTjAuvYXOfqA9wri6DIIze/oc4xq27fHfzPhsTL4dt8Y+kO0g7l/FuoEI0Ba3UB7roLPUJVD9TVfpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=go9Ggaf0fd9eoKpMFE+BybQ4PfyHyIzIfSgRDk+Cl0A=;
 b=XHF8kFKczdJ5LcWQOqaYXGI7BhjVgAj8e3hD0YsKmDll/w/ZfTEzoqEQDkxEuk0ZsR1yr0qQkyRPadiwea73BSSnsZvEddkF7vmR31uWl+3ryQg2So7ercYS7Sq7pFKLVclFGwApYLfZTzskOANw4cZQyjLSeiwpwkvNFwAAqL8IdFPZgQFlAftar7ZljHf3R2pBG5TB+UncRhp3M8mZZ+DfOYa1XCxymjwjwsTYBYafG/IEKCrq9BQ/+ixrbWZlJiMKsL9eLYvc+R2y3QXNwCYZW/3iOv/qa1zvYHqfEfcXyRSZoE1FWtP1EqxmrZOcJEhcRIz4Jm4l9X47i/NKxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=go9Ggaf0fd9eoKpMFE+BybQ4PfyHyIzIfSgRDk+Cl0A=;
 b=mu39W8tL0R7imQ4SwAkJ1T/kbLEza17Ya7PH6jbnQKl7bvXbpbJ+yHkrvsoCziUd7Zb0JCy9VrhIiUJ9Y4sWbyWedRnleOwVRAcUPII7MTgaRD/mrRpE0g0D6lLU3ihNkw5t1WWYQio/ahSs4+knHD5wbfdlVrm/iHif/xaedlU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by PA4PR08MB6093.eurprd08.prod.outlook.com (2603:10a6:102:e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 14:42:30 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99%6]) with mapi id 15.20.7292.033; Thu, 22 Feb 2024
 14:42:30 +0000
Message-ID: <174ce57a-3197-4251-831f-205ec5cfeae9@wolfvision.net>
Date: Thu, 22 Feb 2024 15:42:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] usb: misc: onboard_dev: add support for non-hub
 devices
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
References: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
 <20240220-onboard_xvf3500-v4-2-dc1617cc5dd4@wolfvision.net>
 <ZdZN3FIS4zcKe4Kw@google.com>
Content-Language: en-US
From: Javier Carrasco <javier.carrasco@wolfvision.net>
In-Reply-To: <ZdZN3FIS4zcKe4Kw@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0244.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::13) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|PA4PR08MB6093:EE_
X-MS-Office365-Filtering-Correlation-Id: b937cc37-f9e5-4b56-743f-08dc33b47ef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v1PsdiyNXoCdf53/giRx9bAm/e3cyIJMB7A6rTFcZfxMpwN8WOvgy1OD8jw1u1Gq432TxdHqqJtcgu6I5JiAEBK+wTayr3jP8KQ/0uRjigbn/bavudleDojzuxThwIbb11Q09J6PiHMb3pGAz//saQqaBjiGlcnzbOwXALhHRljAueyJyyjmZiA+/AEaiJIzEXo5CjdPTEQXWld3PrRzuVqR2wCdhVfBmb3q523+g53fl7SdaajVIeQSeAReMksTdfjpAliwC0yWFXj8vVdizUxcPa2Xq1ihB1YYcHeijLi1UNnQeSXuTsurSg0wX3zP80z3M1qU3yB1kw0ysNRtDDXww7ND96sKiQo3a3m5OGu854cBHwhdY0hBauxE9yg056UkMN/O3uCPUJocWnxxXMhwl+gh3TiPJQw5iGWi59f3P4MxHDrc3O007MKGAxAG3SOQcs14mCYj2LBptEnbYtxmmAKDoVHmneQu5JggAThYwe5VGrN7rmJGSihoYUleC7hfnd3DL7y5tEujsmxDQPyZlDSIiUG6Rjm4LKF5qoE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4974.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjVDMDZoTEx2dWxLWHNBeDQ2Vkh0aGZPWFVxQTlQd01nWHVTZmpaN043RWtR?=
 =?utf-8?B?Tkx3aElxbkM2R3RjUXhhTW1zOFBCUzA0V1J1WFF6NTMrSnR4a0JqSDNtWVB3?=
 =?utf-8?B?UklOS3VxMU9LT0FUK2FUYm1TZ2RrVHBteG5UaWsvMTZyanN5Y3BGeUZDakIr?=
 =?utf-8?B?aUtTdnd3VTFvYmNNeTA0M0k3eVhFU3pMRjFGcEdPT1NoUlVuM3k2QS93bWc5?=
 =?utf-8?B?MkFJbndvZkxOd20wamwxaVNpQ2lPamdqK1V1L3VZMnhXQlQ0OUdYaHN1NWcy?=
 =?utf-8?B?K1BXYW9LbitzRENxVDlhZk03UFZWbFVXZXZQNkJXVit4MUx4M3dJQ0k3L2Ex?=
 =?utf-8?B?bkxSbUxIS3ZGUzM4R0NUdHZ2MFUxYVpONkFMbFBXUHBuU0RKQlRUdDRXNDlW?=
 =?utf-8?B?cW1oSmZLZksyYmJGYnJWN3JseGdZK3lNNzJCUTB1dVdualFzMWQ5S0k2V0NX?=
 =?utf-8?B?WVB0b2VjZ1VHcWpZNWFiUit5eW4vbHlsbDhLMWdPbWtuS2tCNXNQOFZBL0FS?=
 =?utf-8?B?Zi82ei9GT0JuajBuc3A5R2NCRUhTMlo0aWtrdlFIbmNFM2w3dFRvc21Ld3FL?=
 =?utf-8?B?OEZHR3NaN3hIbEp5TGFlQWNEbTdxdTA5SUsvR0grclZuNmUvbGpXRjZ3aVM4?=
 =?utf-8?B?RjFBYlcwQis2Y3AwRjU1Q2hWaUoreUE3b2tnbTBOUHpYeEVuRWhMMGNMbHJ2?=
 =?utf-8?B?azg0SDBkeXFVL0VGNnlwazE4TENOWnB0a2NYejFaNDZVem9ackNBeSs2NTc2?=
 =?utf-8?B?WEduYk1KTDhIWGtuem43MWlFaXVLNWc2a2JYWEdQN2d3WkpxVnpMaGFrQi9j?=
 =?utf-8?B?NTZIcXM4SDExMDNzREFSR0JRSlhyRU4vcjZ0T1QrOHFTNGFkbjh3V29kTThM?=
 =?utf-8?B?cXZQTUxUWmVKZURTL3I3Q2NhcHMyL2ZYZktMVC9LeUdPWGJzVGZYbzU2YjdN?=
 =?utf-8?B?aDhDZkRwMXJzM1NQOHVCbEJEVWhGSmxGRDFlRHpUdkJDTGV5LzhzYnk4M1Qr?=
 =?utf-8?B?Ulg1MnIyaFN2SmRERndDdDQ2VjZac3oyMGlVYURSUjVwN1p5MzczcHdtUWZW?=
 =?utf-8?B?L2U1UHdvb3hZOXc5aDBTZjFTcnd4WlVkdkFyN0g2YWkzYk1IVmE5VUVUdTVr?=
 =?utf-8?B?bmQzQklzSkVQYnlDaktUL2ZEL2w0YWR0ZlFzMnNGR1d1QkxibzhoRy9VSVJX?=
 =?utf-8?B?a1VCMUVvUkZ6NkxQR2dxUkF3dytjZ1hUcjZIandLVWZ3VzNlWVB3V3BZUlFh?=
 =?utf-8?B?bVVuRVh6NjdxbDZ4TzFmZXg1WGFVYyszaDhZRERRL0NocmNVNnZESFhEUUVL?=
 =?utf-8?B?Rmd4RCsvZTRrcklHUUQ2L1dueG44NklqdXZNby8yZmZMNVZLaEpsWlJNOFp6?=
 =?utf-8?B?d3FZeDJnNWdFZHplUUJNcEF6UkhpYmhxbWcyelJHeDFkVFh6WFBGWG52ZEhz?=
 =?utf-8?B?aEFmbndTaVZ6UHVvTzhZSTJ3UzZ5ZW0rS1NMbzF1aVcwelZ6aENxNUpqUmY1?=
 =?utf-8?B?NXpNMklPTUd6Vkt1UTBsTlVFemFtY2poUzUwYlZpbHJlSEdTRXoySUhQV25Z?=
 =?utf-8?B?a3hJUTBYSUNvbnBJTnQwd29ramZhcTd4S0Z3N0lEUW9zQ2t2TEdCQ09DMWVX?=
 =?utf-8?B?T2g3TTgwVjVmWW94YXpLN3BOajA5Tlk3eEJPQ21ISEh3bHBCcmJsNzBRT2Vt?=
 =?utf-8?B?NVovaWpvSXplZ1FsdU9HWWh4V28yZHZxdUdyMjBtVUdRUHJKanBCRlpVd2tV?=
 =?utf-8?B?Z29hUnRYME9FWWk3SzROS2h6TkF0NTJ4RFZBN2JIN1N1enFFZG5jclRGSll4?=
 =?utf-8?B?Y1FXQnJaNDY0dndhL3pLdENVeGZxREpRN2prMFpqbGhEbUQvYVhtY3cxek1n?=
 =?utf-8?B?dW9OSHpGZUVhUnhvSDhnbUZoQUQxWVBOVlFDbzVrU0w3QXdyR2JEckJrdWQw?=
 =?utf-8?B?U1FsTXFYZDM2QU1HRnJtcEJkcTlwZmdBcklFc0pySjE2cE5XdWZJOXpyT1dN?=
 =?utf-8?B?V0hpb01BaWlXbG4yVEFKY0NXYWV2amF3TmkxZit1TWxyWmFNRTdTVC9CZEdl?=
 =?utf-8?B?anRCZjNwMUZZTzlTSWFjTzE3RHBEWU5YRHZoRmdPMnRta3pmZFVUSGVsaEtj?=
 =?utf-8?B?YkNDQ1hjNjk1RHoyZHA1VjlnUU01aW9acTFocWNNc1lXRUdDenBNVzJMS3dy?=
 =?utf-8?B?WlE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b937cc37-f9e5-4b56-743f-08dc33b47ef5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 14:42:29.8744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jA18zFhKZ4/Oze986zyMwG3S2pnYtHkPIf3MsXL0EO7gLQBRTq6ybQcYo9ZFfEQ6pj6k0FXLmaXZI7Ne04D4dEW/oWGda1L0iAbRdGot9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6093

On 21.02.24 20:24, Matthias Kaehlcke wrote:
> On Tue, Feb 20, 2024 at 03:05:46PM +0100, Javier Carrasco wrote:
>> Most of the functionality this driver provides can be used by non-hub
>> devices as well.
>>
>> To account for the hub-specific code, add a flag to the device data
>> structure and check its value for hub-specific code.
> 
> Please mention that the driver doesn't power off non-hub devices
> during system suspend.
> 
>> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
>> ---
>>  drivers/usb/misc/onboard_usb_dev.c |  3 ++-
>>  drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
>>  2 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
>> index 2103af2cb2a6..f43130a6786f 100644
>> --- a/drivers/usb/misc/onboard_usb_dev.c
>> +++ b/drivers/usb/misc/onboard_usb_dev.c
>> @@ -129,7 +129,8 @@ static int __maybe_unused onboard_dev_suspend(struct device *dev)
>>  		if (!device_may_wakeup(node->udev->bus->controller))
>>  			continue;
>>  
>> -		if (usb_wakeup_enabled_descendants(node->udev)) {
>> +		if (usb_wakeup_enabled_descendants(node->udev) ||
>> +		    !onboard_dev->pdata->is_hub) {
> 
> 
> This check isn't dependent on characteristics of the USB devices processed
> in this loop, therefore it can be performed at function entry. Please combine
> it with the check of 'always_powered_in_suspend'. It's also an option to
> omit the check completely, 'always_powered_in_suspend' will never be set for
> non-hub devices (assuming the sysfs attribute isn't added).
> 

The attribute will not be available for non-hub devices in v5. However,
if the check is completely removed, will power_off not stay true at the
end of the function, always leading to a device power off? As you said,
'always_powered_in_suspend' will not be set for non-hub devices.

>>  			power_off = false;
>>  			break;
>>  		}
> 
> Without code context: please omit the creation of the 'always_powered_in_suspend'
> attribute for non-hub devices. As per above we don't plan to hone it, so it
> shouldn't exist.

Best regards,
Javier Carrasco


