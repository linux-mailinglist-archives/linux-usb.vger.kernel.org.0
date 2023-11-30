Return-Path: <linux-usb+bounces-3520-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E4C7FF939
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 19:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E91BB20F77
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 18:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C276584FF;
	Thu, 30 Nov 2023 18:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aOJMOkNH"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2043.outbound.protection.outlook.com [40.107.15.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D8710C2
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 10:22:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGCRgvCmcJNlM5q7IglRJ5FeYfSozDVj5mQYpVFsuFVqWzHsaVZh7W5dE5XxBdnriLL/mSuW8TqkFy5VbySIb4jjCAfSjGyB34mz9tj4C88+hIUEmZt76Meu0gJ5qTxti/ZjEYbTZKCGwOqNKsC4GOp4WUCz/e5HtHmvxi/xOG9qVp/09yUyrHaY66XrXLkIJL7qc4tnkae4bFIeD37LOutsRSbsmjm3vewBA1/fI6CSLV/xc7LRHVO8rUMLfYm1vb+p6a7H8EsKOmoYv/cccYc2Hl3FHP7Cv3OsK8+ks01NBzaDRqB56UiRYlNDFQGu/4zeUiheYgagiZpSmABlEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbQ3ixIT25BAhgQd91GJtPlpXLFvyE5FYtb/gF6XrRw=;
 b=aC6PLc9xekU813X2QkXx8gvcdz4+bYZ6ownA9a6TgQarv8Zi1UDvnLp9kN21oDHA7BFpZ2NUYvaMhykaKRm0RFf4KGCckN7jrhRyIpOTCtJWM5JhyHg/iCqmz0W5MJQmtvrMJ5OAssdEMglyBaun9Oc1wLj4jTq8EJ4seM7XP2Cs8lcrBadMnVRQasWCjZ15xZ/A8SiQZuM+JQG6PIoqdi0VpPGalPCAuyLCDSettFKNHHcyu6pArWMzTM5NcAXnO0664fDdSSshPL92EF2XaFIwDuDDdCrQhwF3L+eMSsjJQqZIcyIycHeg2s38UotBxj3RSnNlgTeRVuiwVLKy8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbQ3ixIT25BAhgQd91GJtPlpXLFvyE5FYtb/gF6XrRw=;
 b=aOJMOkNHne/FuDMG8IIY1BtnE4mgwiaGqYQWmAHhfJYRGNzqJ5MOJACc7DzxbPRIh9viRejoBQXx45ijFn1SpcJTiSl9b7ulpRzPGaKurQlkpx96zG2GBRGuV0l/E4LpJkccgttp/6OBf56fM/ixaeYAUNod185dCxSMxrv2hjC6rxWnnMLBuQGwup9iFTNU/2WESbiJ5OPJsil3KJXev81ttb7MXJKEBe5azGacE+w5N9TUn+oVrzC0Qv0qZECwnA4WQJ4X2eptQHc8d2yOgXJ5lCgBeptjPMkNcvJk+/fEWWNieWt4oBlzU2Me6BL1FxVsDaSX1KdyoIGAwzrQoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB6467.eurprd04.prod.outlook.com (2603:10a6:208:16c::20)
 by DU0PR04MB9466.eurprd04.prod.outlook.com (2603:10a6:10:35a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Thu, 30 Nov
 2023 18:22:26 +0000
Received: from AM0PR04MB6467.eurprd04.prod.outlook.com
 ([fe80::5c46:ada1:fcf3:68e6]) by AM0PR04MB6467.eurprd04.prod.outlook.com
 ([fe80::5c46:ada1:fcf3:68e6%7]) with mapi id 15.20.7046.023; Thu, 30 Nov 2023
 18:22:26 +0000
Message-ID: <96735459-e1b6-492c-9759-70c97ae52f3d@suse.com>
Date: Thu, 30 Nov 2023 19:22:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] USB: check for transmissible packet sizes when matching
 endpoints
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
References: <20231130114006.31760-1-oneukum@suse.com>
 <dff34e08-446e-49cc-944f-7b2c50908095@rowland.harvard.edu>
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <dff34e08-446e-49cc-944f-7b2c50908095@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::9) To AM0PR04MB6467.eurprd04.prod.outlook.com
 (2603:10a6:208:16c::20)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6467:EE_|DU0PR04MB9466:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6b574a-cddd-418b-8e94-08dbf1d14dde
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9aqdKSDdcNm8t2sVw1YytieJinbRUoa7tOr8mieUSpmLGweW3C87Vj5J+T5smGvO4bV0DVnDb7UdCxU+waRtlz9+mjBE+FAwmHeq5l5WQ03oUJiyOk53dst5pDwRLuzl5zV7YE+6lrOfzuhZrZs3oRX+NW2Ly9KH6eM9D9IJw9oklOnu5tCLfwkuJrRQ19deNHB6alEspHfvVhdOEAnvaCyoySRR4ZJbWmRgPrYDzKhD5yoAo3RFmZHBZat1dxUmkZye47VgRpa58dho/qJcre2z6/7ZMKpP3EQAXiCqC0Whh27oZqouQ+q5psCKYioGutZk9+Hnoy3abZvWVo3lAVFA+IyPXz1zUH7rMzaZzDmrL/BAuJswB+LhPdZELUA9ocEu/WiupK4EM5Fjs+uK4dHsPV/cNIvbWbuMSp29sn2JabllXpqfuUCiCQkefx2bN5G86Ymq8MmdRa3UDgQlKIqxcuWp1vduB3eTHoBWVq8zTMoZWHMUQbbQ7lAJ4NgVYv1v5pRRVSbaL4wHCF50Lp4mtYGySK4Y2npYJLq1osaJMtiROXP0kvMxUHtSw1zoHFBVOoLivkQ+c6c9XsCU1s0rBc68lq3ZNADO9ftxN7CJ779+Wqpwb3IQuRvUSnn7tzEvDQaX3lQGXDlbefzsJw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6467.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(39860400002)(376002)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(4744005)(2906002)(31686004)(5660300002)(6512007)(2616005)(41300700001)(8676002)(4326008)(38100700002)(31696002)(8936002)(478600001)(36756003)(6506007)(6486002)(66946007)(316002)(53546011)(83380400001)(110136005)(66476007)(86362001)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjQ3R09XNERHK0hjRlQ5QlE2bGFWK0pJN2YwU1FvaDlBcE9FeWZqa2MzbVZO?=
 =?utf-8?B?ckp0Y3Q5MWJxOG1rRjdCNTJEdzVsdkRkSVlkT0RHalBzK1Ava3E0VDAxT0dq?=
 =?utf-8?B?QTMwbEczRFZZS2wrS3haeThrU05yK3N0cy9jenp3dG9ubURTdFUxUE1mSUs0?=
 =?utf-8?B?aUpBME51cWVBYnFadkhzTWlzTEVCaWM4WjhpVlR5UEM1V3pmK1lOOGRMcnBB?=
 =?utf-8?B?bEs4TWJGVUZ0YTcxQ2swZndTNHpCbzNhM1dvTndSL2NVYUJ4dnVtZVk4VURh?=
 =?utf-8?B?bVpmQUdWeTZsNmE5VDBRMnFtbHVCd2RQamw1UlpuK2dZamxhalQ1eFp6T29h?=
 =?utf-8?B?bTJTbzl2Kyt0cXJzZUVJSEZ3NzdZRkFnbU9Ud25CSFgrdXJ3RkFUKzUyZVI0?=
 =?utf-8?B?Q2tXZVoxUzh5eHFSUEtwc1JEamdmaW1UWFRLOWR2RzV2bVlvYnN6K2tEQ2Zu?=
 =?utf-8?B?bElYUmcyR0U5VjE2SzdxY1hBUi8zNVhMc1pKV1NaeW5zYWhNMHpzZTNQU3Jh?=
 =?utf-8?B?dkhCNXZRUHd5VUV5TXZ2ZzFqMkhtZWo2eGRId2R4ZWVvSnRheEtqNmQ0UkFr?=
 =?utf-8?B?MXl6Q0NNL2Q0YVV6ZDhnV1dJRG15eUtwUzhBYkVEcDh5VFBaeVZsMVJXV0pT?=
 =?utf-8?B?NlpZV3BWY1F3djB1K3pFUENnVU9weWhTdTlhZlErV25XdGVoU1NtMTZTbVhy?=
 =?utf-8?B?QUhidnFCcmdhUFBqUnY1L3dGZUVyMGFHZVo0bWtncW5ZTS9xUlVyY2hUWHlq?=
 =?utf-8?B?SzF2VEE2bGNlY0czb0wrcWtrL0RnY0hhZ0MyYXlzWkxabFhLY1E2ZlcrTlds?=
 =?utf-8?B?aWQxc3pwb25kdlEyR0x2Vm5RTzN6NEE3dlR3d25hMXZ5RmZYQnFYUnpENUpy?=
 =?utf-8?B?K2JRenljRjZEaTMrenpITEpxK1VneGt2VUV6ZEMwblJ5ZkdDRmtaRE9WRkNI?=
 =?utf-8?B?Tm9Ba05VZTNUTTRTU0dRWUNkNVY4SkFaVzBvZHh2TXZxQXQ5LzlzaUFPK3Nj?=
 =?utf-8?B?elZFQW40N0ZoTHNBSjNId2pQdFlodCtkbHZidTlWYmVPbGxMMlluZ2RQSFlF?=
 =?utf-8?B?Wm1RU1pqVmIyYUpuQXJpSVYvdmJSNGJnenova3FSUCtldlRpVTNKNThuUXpk?=
 =?utf-8?B?amJqcUJHTFVveS9EUkNMMnlTMWpGNVZoU0VUSHQreCsrWTJJU3BwMnJCaUR4?=
 =?utf-8?B?K1Uvc0N3MVBEQUM5ejF6cTBhN3pEOGpoazFLclVrQTVvVUZaaGdCSXVsaGtr?=
 =?utf-8?B?RWZydGxER1ByUlptdENicFNXK3cyRk5Dd3BUOXFyY3Z6T000SVVSMnJSRlFV?=
 =?utf-8?B?eExDNW13RzMyS2E0N3VvVTBLZFlVeUZEejl1RmtOakMrdjNhRDJMc2tTN3NY?=
 =?utf-8?B?VnBNMGtVRnJRV2VYbUF2bGxyRDJJdmcvNEx0dENTbHlGQTI5V2d4VGhpOTdF?=
 =?utf-8?B?elljUlJ1TzYxbjR0U000RVhucDB3cHY2ZXBYM2dtTDFyeHR3NzFwaTVPVzl4?=
 =?utf-8?B?ME5ZSzVGcHUra0lzeWc3V21nMFFVa2pPZkxzUUJKRmtMR1EwOHVXOTRiVG11?=
 =?utf-8?B?ajhxdGQxbENRdGNsR3l3MGtaRENFQjlkeDN4c3RlTFF6c1lGSjVCYlBkdHVu?=
 =?utf-8?B?NDhLYnBCbHpyZStYdjc4UDAvTDRwM2NvRGV6ZHVqSmpEajF2YWwzeElRZDYr?=
 =?utf-8?B?RVcxZVVOYkxYZFZtSlFNbHV4T0dXZjUwVVBmYnpWWDBNRmR5ajFBcXFha1ls?=
 =?utf-8?B?T0lZZ1FOTUh1TjhrODY0RFZ5UE02VUV1OE1rUFdHQU0rbkhNZ0YvY3hUY292?=
 =?utf-8?B?ZGswVjJFZjNxMmR3K05wTFdlQU5QcW03bnJnTFVpS1hVTUNqd0pmYlBFeDl1?=
 =?utf-8?B?VEF0aTM5OUhaRkJIUldseEdJeUJrQzNRRFhZdHQ3bjcyeDJYTVBmM0RPK3VD?=
 =?utf-8?B?MkJodHRsZEpEYXJFMXk4UVJLckRuMnRwN25VbXQ3Rm5jR2hPc0FNcTBRc0hs?=
 =?utf-8?B?QzM5N1g1bDVSSFkvYkltQ0FrK1RTbjJhYjRzNWUrRkRNNXAzVHUxcDFSSUEy?=
 =?utf-8?B?elFqeVRoUnlCM3ZiS2ljenBYSlA5V0tzdHpaVENXbVVlRUR4QVZPSlVWNVdy?=
 =?utf-8?B?QmFwRE1va05iYzNqcDBLb1NuWkZtOG9uVjFieHd5VEdQbGtsWDB6bzlnUmZV?=
 =?utf-8?Q?WuSEGsDI5jI7/6k1idvUB3GkC4r1GdjPUdJ1j6fVk+0c?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6b574a-cddd-418b-8e94-08dbf1d14dde
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6467.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 18:22:26.1868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ji+lLyKwkL/7QewXjw6jjTYLSuQjqrTSVw6mo6cp9mPJmqDFwR06IG8L1mnmelKHuLIV1SZ0mHipjomNVEC2vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9466

On 30.11.23 17:52, Alan Stern wrote:

> Why would a bulk endpoint descriptor's maxpacket size ever be 0?  Are

Because evil people connect evil devices to nice computers.

> there any devices that have such a thing?
> 
> If we do encounter one, it will trigger a dev_notice() in config.c's
> usb_parse_endpoint().

Yes, but that does not change what drivers will do when they
try to use the endpoint.

	Regards
		Oliver


