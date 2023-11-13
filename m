Return-Path: <linux-usb+bounces-2813-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C74A67E9B4C
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 12:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D88BB20B9A
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 11:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0391CA90;
	Mon, 13 Nov 2023 11:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HMqmxSjl"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B265018C0F
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 11:40:22 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2048.outbound.protection.outlook.com [40.107.13.48])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE31D6B
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 03:40:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUiNHYRzWu6HuTn7f2TA5lpDTq7XWFhXf0qntYqlNqHgo4B7Uhl+YdrRUjNSOLf6VrV2tuJU1YUxcqUfRbj/EJsUwCOvK1MNClB1hEV503E/QKY3zVHxS2ST3LOnooSLifb+FJvOwluId2zSRhVXnpTfaHlsuDBCKBnlEFtiJPtYPwqDBRqw9BzpnL9+xEjwFrMM/QGDXCr03W0jwvHimQRX9Xk+hege2cUVoEu/ITXmLn/yFabwq4p2wF5hDtVmwhOLYkDOXDKWGhZa9JGbU0CirU1NgYTAcmrsn25pDGtoz6Vhqc0cKPMlJZEpKDXGL6hnSNjEWBVu/dym9fp4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=On9n6UWe80wxyhnmhYAbBtEKk9SLnBOVqW26BRwHa1s=;
 b=iKAdHbMA+4gEYxX3uIV07BbRaTQNjXP35D4TnoyIeatxAHMwj3JVaCY6ypS3HcKqNTEjKaVkQ6l/VG/MX50HqSyLWX96OSAWSpzix3VHGExrIRic/zH3MI+98oNqlp594nSygx+qB0+Fau5tb8/w95Gw+TqLA4VMdKyEM8tJH/1GS1QEUabagXcSqNdWwNQUV/Xgz03tp2gB73cy0KlkJ4JzTEuA2fIlHzl8Ols5cEpJZmaiqwPfWUKS0h5z/frN62dTuJR6exmMG8NxTbY5nO5ncF1IQvdqXMFCTdTvpGq+4JzsqqiWVxKGIIQF2AeIytl2wQK8bZB3MW7XEuQOsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=On9n6UWe80wxyhnmhYAbBtEKk9SLnBOVqW26BRwHa1s=;
 b=HMqmxSjlhn5ROSOeorWl+lzJKklPSwaUVIkAFjCz582VxAM67QxAyx5pSm+Zb9CWvNK5j+FRbm2HxFU/WY8YOsFhL9/hcgmKbrCRsI8AEbWAZA7OvWQENtethXF2wuaRrsKMEC0iBA0bbsNdk96HpQYGjMi7ia9c7uwGfAklhmrbgNojwwhwx5zi+WodDLNDAnTd+v85MHd1HV2SwFzJd31PlI0GSnHSxhs0/Nt0q+TDyauWR7a0wK8BRwHW2uvexsjkWr4Ea8J7BKOu4xekGY1xfJIvaTRzJwPtpHqWuTTyvuf9aAILUySAHRA/mmR/1VlporTJ7o2TU4uJrhbkwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB6467.eurprd04.prod.outlook.com (2603:10a6:208:16c::20)
 by DBBPR04MB7562.eurprd04.prod.outlook.com (2603:10a6:10:1f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Mon, 13 Nov
 2023 11:40:18 +0000
Received: from AM0PR04MB6467.eurprd04.prod.outlook.com
 ([fe80::5c46:ada1:fcf3:68e6]) by AM0PR04MB6467.eurprd04.prod.outlook.com
 ([fe80::5c46:ada1:fcf3:68e6%6]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 11:40:18 +0000
Message-ID: <f85ecc36-8e05-4595-8baa-5f4b48afc8df@suse.com>
Date: Mon, 13 Nov 2023 12:40:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Slow enumeration of Creative Sound Blaster G3
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
References: <ZU-xz52-1QMregso@ryzen7700x.fritz.box>
 <df282d44-b11c-427d-ae69-cfdfb21d1565@rowland.harvard.edu>
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <df282d44-b11c-427d-ae69-cfdfb21d1565@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::10) To AM0PR04MB6467.eurprd04.prod.outlook.com
 (2603:10a6:208:16c::20)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6467:EE_|DBBPR04MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb6399d-b6ce-4257-3818-08dbe43d4d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W7q+7BeGdZweBJC4bt2XToRMmimJCL+ViSsrjp5BRG1uJEdzNs9TtlOjnFV2mjEKjbeGcPIihXLu9L8DHKDAXAB2Qcre2vdUWpJB37Dyr3OaTs74s8o6ruFPHhLr2IQY7EBjgnbQys1KXZiPswZUgyMk9dCW8WYmQ873bPhtmYAs30aiyd9/otNOr/m3VLe5zY67xAizhuTMuVw4tHpb3enKqrKDwtD0i1e/nNlM14/a0kKhB6EnJrYidT9cH1EMzfs8ApuZOy3X6B17tyZipc1lUSN/GyzpzZFyXAAbw2rDa3/g9LPfI9elvx1/pyWliscXcuB7K++qbRk9H1mdZ/rleBb/q43+3oF1ckxIwNfytPlqUgaGq0cOZris4mXD6/nC5e/9EygI++EZ/yBBt2qcUHOLv9bQFmLQnKJf+Mgr0o7noUftZMr6uxcjkpR9Or89fdXkmROjq3iJbaNFxj9/XKMizxou8rMMveTcSz6sD4x/OPFgkzpyOXrdGSO/4kFs4s/y7nAcr5wc9bg7Up3rsqqYVPGh5bMypTF1XYV4n/AYYRpohZlp51AgHM5SolyTQUM2bvhcrPMr/eFZFoKyWQbC/wNsb+j1ITEhwUkr9scEvHWkZev4bXAuWoZKPe8JsXzziGawBaHDvX2HHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6467.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(136003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(53546011)(6666004)(2616005)(6512007)(83380400001)(5660300002)(8676002)(8936002)(41300700001)(2906002)(6486002)(478600001)(66476007)(66556008)(66946007)(31696002)(36756003)(86362001)(316002)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qkhub3dMU2tHMkM2RjhKTHlSUGlCR3dUdVpyMmMzSHBnY3o3d3hXTDRxR25V?=
 =?utf-8?B?blh1Vk00aHdjWm5vc2w3VVpuVXVYY0hmZU5DZFlhTnY5MVNNVkhSVWpHc2Rp?=
 =?utf-8?B?MGhLVForanlBVnVibm90VHBadTlyQjJDa3BESElSai9WU0tiVFZaUHBTdUpR?=
 =?utf-8?B?SitXQ3h6WXlkYTNCUFdpcE9uQVMyK2hMYllvRFJDSTNUWnJ1b1UvWTNUcFV0?=
 =?utf-8?B?cWhlUFVGcFZnb2dVRXZMMk53T29ua2owSmREck12ZFMwSE9mWENwUmFOaEhP?=
 =?utf-8?B?TmE2ZFFXTjVLYmgyRjhtbFRzMXZBbXlaSGUvd094bTMvZTdHcVR4c3o3OXBU?=
 =?utf-8?B?QnlQOVVTNzlwR2hBaThyNWhIdUJnL2ZBS3Z1SEQ0ZFR2eXlTMVhqSytOb0tF?=
 =?utf-8?B?c2dmZTFqSk9FM2ovbDE2cit6SEoxU0hFeDNnekhyWjJzRTUveHJldVhTMW90?=
 =?utf-8?B?TE96SjV1QzUvK214NDlaMENLNUh3NFBpakFsMmtXMnJKVWtFVC9uT3F1UVhq?=
 =?utf-8?B?SnpVNDh6TzhVL1lHMU9KcEYwdEVaRFdwb3I1MDRIRkdTWHA0bUZXS0RJcGNJ?=
 =?utf-8?B?OUtsWkZVNitkU0dhMXVjbEpGVUxOeTlUVStlK2xWVGhNaUZ2ZEZmbU1helJS?=
 =?utf-8?B?RjgxNmdHQi96OFFjZGthYkVhUC9FSlp0MU5DTU1XZnJYQit5NlhEMFppaStE?=
 =?utf-8?B?aTV1ODgybnhzRCtZNUkxd20zeXF3dk5xbGtNeXVJRUxoWWh6N3NYQ3hwaFdz?=
 =?utf-8?B?QjJMLzE4MitEZGF3T2dCM3NVWmZxSGU0YU9OSWVXNFdSUE1ZcU9yazlna1RH?=
 =?utf-8?B?ZldXaUl6NCthMklnamF6dkZFRnVFYzFkRGVxRWdNSHNESnoxcm4wcmNBelNx?=
 =?utf-8?B?QjQvVERHR2NLNzZkRUdTVjUrNUtsc0pLeUxRMm5QbUdGTktHRll6cFpKMHps?=
 =?utf-8?B?TlkzUVhkc0dMUlRFUFZqV3k3WE0venhFVnVpbzZhK0hTZkp1WXJEVHAvRTRj?=
 =?utf-8?B?SFVLU1BSS2pPVTZsVkVJUEFWa1phUjlTS1NyS0RRRVlML0psLzU2akJoMUxl?=
 =?utf-8?B?NWtCUWtXYUlJZzlyWTZHQ3hudE5jcU9WaGdCM2lSS2oxR25zQkFDQ0RSTzBR?=
 =?utf-8?B?bzRCK3pWV1JHclc2Nnl6SG1kdFlwaDNTenY1aUlCOFJyeDBwR0VBZ2tpcUJ1?=
 =?utf-8?B?UzAxS2VwdGlsUnFoaTE0QjY5ODVCU0Iwa3ZjYWZOZS85VlQvd3ZjbEE4R0Rq?=
 =?utf-8?B?Mi9reFlsQkNiM0NsTGNrTFdHYWFJRlNSSHUvbWMwVmIvTERzSHU2MUg3cGtD?=
 =?utf-8?B?M2pUZUIwSjdpWTc1dkFqZDNpTDExdEZQdDlTbDgvWVU1SmxnMXJLN0pzSXBN?=
 =?utf-8?B?UWRzWng2UDlOSnlxR0FxMzBiR29uTnlpQThxR05UV2ZEQndpT3AwS0thQm1E?=
 =?utf-8?B?TlN0WllzeU5GYnFYR3BvOTZqczlqdjBwSjk0dDJJdnA2RDM5SDJ0T0treUZo?=
 =?utf-8?B?aVZ5N0ZWMkc1WVlOKzdVNC9LYVdWU09ObDlnMkhYSXFsR0NJOGNsUE1ERVB3?=
 =?utf-8?B?d25iRTUySnpQRHlDektmSHllYkFFZXViRkZNcGp6Slp3ZWQ4OGkzWGQvNVNm?=
 =?utf-8?B?K3RqTFNwekFqWnZ6amF1d01EckJ5Wk9QWnRzVzFoVDN6RElCMHAwQStxR3Nl?=
 =?utf-8?B?OEFtaENBZkc5NUk2NlFZTGQycTJvMWMzU0l5bFc3V2RwbWEvOGhCQnJESG5R?=
 =?utf-8?B?RWRFbjV4WWtvMmFjT2pER0I0dXVwdU9XWmt6MlpmdTBoelE4U05Vd2dVbHJm?=
 =?utf-8?B?czVpOUFHMkx0WEJwUEVDMlhHMGVpTUo0ZG85T1RNQXBOcDZqK1hyZkVwbnAz?=
 =?utf-8?B?ZDVNdzVWc1BjajRpN3FDcnFOaTIyQy9TV1Q3K3NmRUljb2lzV1RmNzVzUzQ3?=
 =?utf-8?B?Nm14Y1VScWxBZWlmaXVTVjFqdnhGaUxjck9IaXFwRnVHeG1wbnFuMVV1TDlw?=
 =?utf-8?B?bThscTBFRnVrUWxmUFIvVVlkZHNpUVZuN3IyYm1PTk55eWZqczhqTkQ5WUdG?=
 =?utf-8?B?amg2MjJVenZmb2NsOWdSU1pVR1Vsc01tRDlkb3lIK2hMcXhtaDUzSE1pYlp1?=
 =?utf-8?B?Ujg0a3JKNXRKV1plOGl4YVdaeWlUN21rcy9qL2g0Wk9Kd2N1Y3lJNGc4enc1?=
 =?utf-8?Q?yqTyExMRs3XCIVC8F8I0359Jpq8Rq1OjFMsNqI+YTR1g?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb6399d-b6ce-4257-3818-08dbe43d4d2d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6467.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 11:40:18.0675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLOR4tfCWAFHvCVFACQrJk9ZygJgjN7M3WOX5GcnXOBwdDOONsspb2AKfpq5WvzdlnTI2ExoqSFsCvlke43WJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7562

On 11.11.23 20:56, Alan Stern wrote:
> On Sat, Nov 11, 2023 at 05:58:08PM +0100, Andreas Kempf wrote:
>> Hi,
>>
>> I apologize if this is the wrong mailing list but my investigation
>> led me to the USB subsystem and I do not know how to proceed.
>>
>> My system:
>> Arch Linux
>> Linux kernel 6.6.1 (-arch1-1)
>> Motherboard: ASRock X670E PG Lightning
>> Device: Creative Sound Blaster G3
>>
>> I have a Creative Technology Sound Blaster G3 USB sound device that
>> seems to work perfectly on Windows. It used to work just fine on Linux,
>> as well. However, at some point a few weeks ago, it started behaving
>> oddly. Unfortunately, I cannot pinpoint exactly when the problems
>> started happening because the symptoms did not immediately point me
>> toward the device and I did not immediately figure out what was going
>> on as I only noticed hangs when shutting down the system.
> 
> Did you update your kernel between the time when the device was
> working okay and now?

If this is a regression the obvious suspect would be

5fadc941d07530d681f3b7ec91e56d8445bc3825
("ALSA: usb-audio: Fix init call orders for UAC1")

I'd suggest you try reverting that.

	Regards
		Oliver


