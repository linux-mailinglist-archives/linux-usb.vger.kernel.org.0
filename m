Return-Path: <linux-usb+bounces-3495-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DF27FEDF4
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 12:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A885B213DF
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 11:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC593C47F;
	Thu, 30 Nov 2023 11:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Sj4r4kt4"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2054.outbound.protection.outlook.com [40.107.22.54])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E5351716
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 03:31:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bj26aNO6/k79z5GSOAxKvRNXZlsZzdsbCfQPj6WoWPEhgwEgK4AMIJUSz6GYMfYucaYEyJNa4t5Uqo8m/AqZOVb+Aryb+2vYLZD4XX20aQqle0kf33/o0GIzs6u9ojhK7Drn7mu+yvLilEyCnundo7lIq6skqMdNUEo7z6UM+RfhD+NT9Ji7ug64Jd8zUGywYq+TDYEN8nexWgvn+zUJPsgfiVkf9WGXwpoqDb/7e7x5/JJSzojWbrvI1GkWN62mu8ywt7ZeizFferQxH3fbJxdc0cGGUlugnRudd5zJUsP6GPPBd5fQamA6F38FfOD9f+BmIQfEdqv4i5MXuGuGug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SnQVEC3XWcBNRQIkvkAq6D9K9pZDNXsbeZA5v5KcGM=;
 b=ZHBBLcDrBhGHrTrqBq535V3qnPPsyTnb00viAqJfHfOqEf83vpQ4F2dmd/arXGoDsou28T9F2ukYi4+387PQsAWzzstSb057kAIf0l1p+wwmVc5E7HtoBpGt53wW1x29Yra8iD3SiOW04vS33Y23d0AeOiFFT45WEp+D25O4oXtluqRt1GvPEvUJzcaBTz2K4GnGMwD4QZciQuKVNVWi5eXUWTB245wBpeE6Yn+5qYTGAMFJaLpXaTFnIwr4xMMc1joWzZtxTDSIEHT/YNPwSWavjUhuxo+o00/w4W6q7bpdZzQlhmvMIuufsGBbXm+h7laj+dxL7Na2YwLzMc0r1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SnQVEC3XWcBNRQIkvkAq6D9K9pZDNXsbeZA5v5KcGM=;
 b=Sj4r4kt4dRne7l6r6SzopcFfk1irJEsrmzYMh6ztQIV/BpabqZhdWr+X7GCRYGemsiIunPquOEq3Q5gyL6cg453I5IPdeAKtonc5lsV+tUfwVy3cKbiAyFiCyHKEjt465JHWbvXSJBawnNLGpBnfl8XtkItPT5aGSSMjOm5VyfNaxTeD9cOUKpsKniSioPzLUDr5WAPMmOLCA7u3aM/KKVVwPjW9h/+0jpi1pFJXkBHZYzAQZcRJY8F7w2KYNnWh6No5O7qWgidMz6bgf7h/xHy5TeDPEiqQd5QjMmAKxHXByXlbXOhOz4Tg0iOax+43EsB3dptcJ4IxGGmh0M7z1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB6467.eurprd04.prod.outlook.com (2603:10a6:208:16c::20)
 by AS8PR04MB8452.eurprd04.prod.outlook.com (2603:10a6:20b:348::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Thu, 30 Nov
 2023 11:31:09 +0000
Received: from AM0PR04MB6467.eurprd04.prod.outlook.com
 ([fe80::5c46:ada1:fcf3:68e6]) by AM0PR04MB6467.eurprd04.prod.outlook.com
 ([fe80::5c46:ada1:fcf3:68e6%7]) with mapi id 15.20.7046.023; Thu, 30 Nov 2023
 11:31:09 +0000
Message-ID: <802913d7-88d8-42cc-a775-493a7a426882@suse.com>
Date: Thu, 30 Nov 2023 12:31:05 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>
Cc: USB list <linux-usb@vger.kernel.org>
From: Oliver Neukum <oneukum@suse.com>
Subject: return type of usb_endpoint_maxp()
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0353.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::16) To AM0PR04MB6467.eurprd04.prod.outlook.com
 (2603:10a6:208:16c::20)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6467:EE_|AS8PR04MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: b1988b78-4564-406f-8aa9-08dbf197d8a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7oS71bUDNSHxOBwfQAzSZ/pojEJ2U7Ct9kSziohXiSzhAeOYX4hyjds2StX/e3jxDtAsSTuJKN1RteOoa+Jcv/twMr0h9gtWwdwfLM7oRk6CZrX9SyyDQkLXE3GLe9ce98OrZut+OCLF/e9VYWwWZYrZLgV9w/tFobIjcr1TXQT767h00h03+D5wc6KD3n6i3zVyFMhJppfZghL3NMI68Y1qmGNm2lvpjI1qa7q3xiO0+rhXjn+SveV6HtrELxw/0YkHsmaAjRjNMBOUlmanRdJv+Q3VMOqdm+YlX+8pTUuwtyOOgqdDgGu/3gvIaD3+visnNGUn+NNzNK8HrSWGkJjuQABWXmvTBeMKi0jCy7EC3yc2WofSt4B6NyD1YRQ8bastKpwEBXiZH/2rHkO/+7ayRyOvIIA0nCySXKRpIGM9kgqin0vKhtxrwP9LdrtVq3F1oHYZACk2AYlUlAF29cAfOcBIvaXBZErW/GYhU5K+KkFgCYbNMvCUIK9WZmjvHPXAU9sO9wFFyHRHpYQl89yhsFKkrs/kR2ucgVsYpfi54zMl26pPy6Yf+oj0ZNE7TthaR0usNMPXoF8b3a9RMKfqtbbPLExY7UKkiyH07WtoA6HWOayZE3oHEghH9lpspk1A1Fw+Yng4zy84anu+YquqWCXLeK0J6UJN89YI9coNZLG/EHMD43eQpY3jY0Dl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6467.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(396003)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(38100700002)(41300700001)(66946007)(6916009)(66476007)(66556008)(6506007)(8676002)(8936002)(316002)(6512007)(478600001)(6666004)(5660300002)(36756003)(2906002)(4326008)(558084003)(86362001)(31696002)(2616005)(6486002)(202311291699003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFN1NjYyK0NFTEd3b2kvSWNGc2N5eHc3aE9VKzM3QXEvU1UrZmQ0L2dwTnBt?=
 =?utf-8?B?d0k3M1NUVStmMVRCcXhVQ21zeHd0ak45M1lXT1IvWUQwL2E1Zkd6eFRvZXFx?=
 =?utf-8?B?WlFMSHh1NkFnUnZ4MnhxOHg3VU9WQWQyVld6eXBoTTJXUGYzeWJTckcrOTF4?=
 =?utf-8?B?cE5XUGViZ01ab1JteVdSMWxFNWNST1ViZGc5cVZJYms0QnFJRnJwRndsWFNr?=
 =?utf-8?B?Tnc2OFFVaEVNRTlkLytBSkJDUzAxZkNQNkh6d2poYTh0ZDNrZUdDMzN3WmRs?=
 =?utf-8?B?SWFwdmpzdmlyclI2dFV1MWZKL3kxaW1uaHRKOHFNTzQrd2JuYzJVQlBlbk5y?=
 =?utf-8?B?Nmdwcm1oQ0V3ZUgzSTI2K0xOVHRqQ0RVQWxMdFIvbW5lVDlMM1pwakdZN3FM?=
 =?utf-8?B?eEJmcER6c2hxdUcwUVU0cm83amF1MFJqV2x4dy9ISk9QemFRY1JnYS84UHIx?=
 =?utf-8?B?Q3lscWMyaUhKVTF2aTZ1RHNxZ3VaRDM5QSt4UGxURjlpWlVPSHA2OFJUZkFG?=
 =?utf-8?B?YVREb2MwZi9pNW5hMkFKY0oxQjF3aHI5MmRBUmFlNFh4M0xIS0Z3THZCOHZn?=
 =?utf-8?B?YnFIZEQrUHN4eUhxREtEQ053QmwxSTFubmZTRU9RcWxDQTZRYlc1VzA5VXpE?=
 =?utf-8?B?dzRLRENYVVg0RzZPc1V6eXJnTG1HRUtqS3NpeDRoVHc1WXpRdWJKUmw3Nlgv?=
 =?utf-8?B?cFZtZkpFOVlaeHRFZG93dVNtWEhpV2JDRmFEQy9MYlhrR1FOUDFCUW9LRFR0?=
 =?utf-8?B?cE0yV1B6L2lFNkVMSHdZbks3T3FiRUc1ajM3VXdwZkpHQWszeThxbnpYVFpa?=
 =?utf-8?B?R1RiRGltd1crUHA5Yy84VzBhL2Y1L3FzWU5MaEx5NzgzTXhiQUwxdU9kbEl4?=
 =?utf-8?B?cWlCcnI3TTk5eHhtOGtJV0wyY2R5VXhkcGZxT2xuL1pPUEYyazJQeWJIc0Er?=
 =?utf-8?B?bERvM0ppTGxzVU8wc0ozcklvbStMUEkvd0VrYmFYd04zZ1pjam10MEtDV2xr?=
 =?utf-8?B?Y0hmM3pSTTYvNVBPME9mYmJ1VGZVNlhnckR0SEttRWRnQlNHNU0ybkM1bjBO?=
 =?utf-8?B?ZzVmSXdhY1BWSDBhM1RCZno3bUV2dmo1VWp3ZTNSQklsTmdEZis4Y3FYd1VX?=
 =?utf-8?B?ZjhHZVFsTXFMTkp4UkhteWYwNlpxaXZsZEYvbDZaUXNBRWUvT3F0b2ZQa1Qx?=
 =?utf-8?B?aUVMVTZIdkFQY2dyZUkvSHdDMDcySW9CVFQ2ZVl6V09vZHUvY2FPdVhrRWdt?=
 =?utf-8?B?ekVZNUYvVmhBcjJISjNaSkZOd2w5a2RsR3VYcndEeEsrdEdEVTFXdU51ZFB5?=
 =?utf-8?B?Z2c0dXpYMWlBWlZRV2dUcUV2SU1QZExtZTMrRGF1MCtXWXF0M25XVkNobUk3?=
 =?utf-8?B?VC90WStnL1N0SnRKNmJGZ0ZmWnYyNE9CcTZ6dm1yV2xsTklwUnlZK05RQ3o4?=
 =?utf-8?B?d2RmOFdEN1BZU212YWNFWG9FU0d5VW5wOUVaRVhJVG5kdllOVTlqZ2NOMzVq?=
 =?utf-8?B?STkzWmhtQzV0c0EyU0duRzNsbTBwcDdnUVlzeU11MUJVNEFhKy9Xb0h1eFBx?=
 =?utf-8?B?UVh1am0raUtqcCtKZU9oNTFwYk80bGlWODlQV3dMeEFFQzhqaHI3aVY5SE05?=
 =?utf-8?B?Q0Q3b0dydjVTYXNkMlJtdUJJeHB5U3doTWdZVmxJRHlXdUpIeStVOXpSbjhJ?=
 =?utf-8?B?MzF2czRVaWY3bWV4ZGRFckxTVm9DRGhlZXN2UlhXMzVwNUNBK3U4T0JKdlgz?=
 =?utf-8?B?ZHVsQVR4b05QMmhMdHM5RUJCWkNUUFJEcGRxcTVPbVEwZyttcGJvVWpCMnRq?=
 =?utf-8?B?V3FPTExqNHhEdkp0U1VobGVGZUozOVpWK3RtTitGejNaOTIzbW5MWjdOcEFY?=
 =?utf-8?B?c2NhOTFzdnpGMWNVYzg5K3NqT1R6bDdJUW9CMDZFTjRTMWtDampZWHFzTGY2?=
 =?utf-8?B?bmh0bGM0M0JUQkc0NmhHMnZMZFoxTStQMlAzMmtsbS9TK05WeUZjNnljVVN0?=
 =?utf-8?B?bHAwMEVmZGN3anN3S3ZlcTR1UWZhOFMvMnkwVkd0T2hvajNaMEdrVEhXaHpD?=
 =?utf-8?B?ZityR21GN204SFBpUEhudFBtV2dmNFIwdStqRUMzZDBEaVJ5dE9sZ0hsS2JI?=
 =?utf-8?B?ZTV6djRGVkdCcm5ibzF5NTg1bURMZkVUMHRWQ0lZWUhlNUd2VDhzRVlMdVo0?=
 =?utf-8?Q?s+AN+gZ7BPU2BWm7AEW7/r3yMIe+x8FvHbHhF6XXJ6Pa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1988b78-4564-406f-8aa9-08dbf197d8a4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6467.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 11:31:09.3524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwAn1Xrzfqn9o2HGvWIPL9FFYu2DjXToexZm+ABnmCnXPExWESzna+4gp7kjN6tJEEHBUvhs9yKg8JfwVzj+fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8452

Hi,

looking at usb_endpoint_maxp() it seems odd to me that
the return type is a _signed_ integer. Is that a deeper
secret or just defaulting to "int"?

	Regards
		Oliver

