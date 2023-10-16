Return-Path: <linux-usb+bounces-1663-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C458B7CA6CD
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 13:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F9B4280EC7
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 11:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F350B2420E;
	Mon, 16 Oct 2023 11:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VLT64lpT"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3941B23775
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 11:36:14 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2086.outbound.protection.outlook.com [40.107.6.86])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E219DC
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 04:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VoWmAnzf4GQSILmeAXDjJKGEEInNcS574PslCBbPdc3CL+jFoZNi6kI4RA87eVOnoqloq2M8n6Py6qcUNuzG8JcSm0m+WqF849+HA8WdA+VpirXPCcIFLq0lESNkD/yu2cETTF101CPpMwMeQ/ht5CzFB4u0jAqfzKN0h9z5G1kT8Znodgfxuh6uchvNHxV/C1mIu28Bu4PMYDjCylZGyCzh9d0pcI0XdK1lPy95zDOgeXRSPePrZCYzJCfLoYA96awg3/+psuvm4Ir5YVgMlhYVP5QS2Rgmtgi7mPUICQbdweAsVYRrDb5UaHj7NL474h/ilARpHHnoExxatKPbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6puOt9uAgO5M9V9dJPIk/npDk8uXLQBoGnf8XunUoco=;
 b=drHjEdJWKdU4CFc8x9Prz/2E7bqdSV6FwppCS0SBV9HhhDJyW45NRsfzv03MFV1o8sytVaq3AtgRLeyDXS7pheoAap1N3Qtb9DRAyza0Xk6HViJKSQHCfZIiAZkuNow4y4hnwJtL/UHHRGEalC6y56ceS5wXlRCgXg6GtKqsqjfJGpJJep+44+eslOdrzorTUMAEwFgR8fCmFi4xqjBKnm+hDxqn5qNUdaCyoq7y3ZBjOodMMzIaMB6pasUIPXiPBcfBHj8WuHMY5Vs4fMAogKOIzQB2oVagAR3Pf+QvGDz+ik+G6GTdThgowGOqTTklyI4lcMG67zPP/HPDqpmN9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6puOt9uAgO5M9V9dJPIk/npDk8uXLQBoGnf8XunUoco=;
 b=VLT64lpTLtHqKq5paERV3zXI262RyUXxPNOAUmwo5IFKPpsYJQRhurmOlcMngMJnavVGbZf/0NQskfCRxn/hqf7Rv18ztD0FlUssNWpdcSLdACrZ3NP2/b7/BT4L0MjJf32H/dnfiaDMR6iQIOl+6wzjiH2TMSRZxOTJLGqqvon9u/ayhKPIeyJfD1AANipCIeV9EUu1cfHxJXircSvGyqtwoWIe5NRmExfeq+jDMgpJRijoJ8A7y3NOu7dyWvi8EK6OrlkwELkpsn/CaiL7OtJahOq1k30eGukMDDvuFlE3ZSQrZ3QyLiLTZgLXepCa0QBr/Jze60B9RRJW+QsXuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB6467.eurprd04.prod.outlook.com (2603:10a6:208:16c::20)
 by DU2PR04MB8789.eurprd04.prod.outlook.com (2603:10a6:10:2e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Mon, 16 Oct
 2023 11:36:06 +0000
Received: from AM0PR04MB6467.eurprd04.prod.outlook.com
 ([fe80::52bb:37fa:d297:2a7d]) by AM0PR04MB6467.eurprd04.prod.outlook.com
 ([fe80::52bb:37fa:d297:2a7d%7]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 11:36:06 +0000
Message-ID: <3f3c2d58-c962-4066-96ab-cca31eeba95b@suse.com>
Date: Mon, 16 Oct 2023 13:36:04 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: William Wu <william.wu@rock-chips.com>
Cc: USB list <linux-usb@vger.kernel.org>, "Ivan T. Ivanov" <iivanov@suse.de>
From: Oliver Neukum <oneukum@suse.com>
Subject: your patch to dwc3 fixing channel halt with unknown reason
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0198.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::13) To AM0PR04MB6467.eurprd04.prod.outlook.com
 (2603:10a6:208:16c::20)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6467:EE_|DU2PR04MB8789:EE_
X-MS-Office365-Filtering-Correlation-Id: 87bbc44a-6667-4b85-48be-08dbce3c15ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U1zmPdvjAfntk3WbpHWunZYfpTfKBrxooQkT9Y9GZQy26XzUSGrTuvlFYezbtrTAd+u6DYyh0D75OWzBr4chrfZhyNI0tbbJxr7B+OvXqAHsk/vRi7xShd5pWKVZIBZy78nQCmhnshMjoO/Ut2f/VHvH7648903DfJb+IGDcJvnLpde3hRd4Eyvw69rjxBALkD2pYr/qJVD3JtONbFR/2eAk00c3SBbWWNrJF/BFhJQpYB/LCwW8xX6mkTSwek9on0TkexhAyZEcIUVFt/mu1QfOmSfjGzC8FI9X0c1oS/L9wuexWfogWz+zoapl9ytdKUiS5DR3u1QHcQo5t0t79Q7ARjHPMcb7XtkYt4FmNwd55aTS9KZFdUJPkBKzBLOF6jkOeYwkd0c8w1GT/8n2Xyq9KGncjCb8HucZEEZvmFuWXxm+aFboja1Av1eCme9AuCO6CfajUCH12jacfPqPZWKthCMa7a6OWl3p4GSqPg1yZBt5xl66PWHrmoZsDaUSbcjpr990PLWGKStN3JR+eARFZKpAunOjfF6AouQenY0mcyFuhWHFOTsepvphTm+KSUEwgUHBr1imRF3ntwKCmpcydnEO77W6mX89giTzgUWkLS1NvlO8ag0NAMbQkLFoAj3exdpUea3Q2vrkdZZF6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6467.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(136003)(396003)(366004)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(966005)(6506007)(6486002)(478600001)(6512007)(2616005)(6916009)(2906002)(54906003)(66946007)(5660300002)(8676002)(4326008)(8936002)(316002)(41300700001)(66556008)(66476007)(83380400001)(38100700002)(31696002)(36756003)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmR6YzVVUWh1bHM4NUJFT25kV3c2VlAzVVIxcmk4SHl6aEVzM0Q4TFdCUW1Q?=
 =?utf-8?B?QkcxWXUzRC9VdFNkSVBNVTYxaS9BYXZqUXBuVDRVeVdnYWpTcWJrSjJqKzIx?=
 =?utf-8?B?eVlMdEZ5REQ5SjI0YXNKcEh3WTcxV2dNMzhXRXhOY3pxVEloc1A5QUZGam8v?=
 =?utf-8?B?ZDRsUXIwOFMvMnNEWE8rVDRxdmMrYmpmSWlsaVJsbUh0NGkxWXJMOTRUUmtt?=
 =?utf-8?B?MTZPaStpVmhPbTJWKzFFY3RONzlyTHJKKzBJM0tzTE04MmJJcWRWclBEZlh2?=
 =?utf-8?B?NXFxYW82VXJkTkdQZHE1aTFUdUdFVEhiT29mekZGb0E1YzVST1c3OXBCNVQv?=
 =?utf-8?B?cW1LZWpJRHFhbTlyMU8rSy8zamJETit3U0VjUWtvUG1LY2s0MUF2YnM1YlRl?=
 =?utf-8?B?OGw1WVlFRGk1NWY4OUZHMWpRUXRld1VoMXYrZFVsTWx4WXdSYlAvR3dlZ2RM?=
 =?utf-8?B?SUdJRG83bnQrMVFSQ1V1RmxtbTZxay9haVV6SDlLMTErN3RJbElTQ3FqZ2Vv?=
 =?utf-8?B?M2xEdHlBSUtxMFRXUC91NG5DOWFHZWNaVG02L0xrd1BTOXQyUHd3cjdLT2xE?=
 =?utf-8?B?TzFGRG9JcHlmaDlRdVhWQjd0SzhTSEg1YUZTNURhdWROd1FocWpOSWRZM2lm?=
 =?utf-8?B?UVRPVC9nVk82Z0JBbEhWUkp4dkYzaUZ5MC9vUXZQZTBHTFYvb1c2YlNYSjFH?=
 =?utf-8?B?b1NNNWJ4NHl5Q2dnbStndk5sY3FJQm5nMXVDeEM0dGI4ZjhFcllDcTd2Yk9B?=
 =?utf-8?B?MTZqM2ZHMFdaRjBwQkR0K3FCTHhNT0hQSnFuMjhlUEdlZHU1STA3WGFEbXdR?=
 =?utf-8?B?ODhidzBjc0dhVVV2RlJ1Qi9hOVptbDNSQTduODNwR082cWF2N0Y5NG4rcXFM?=
 =?utf-8?B?NUxVcThVNmVIMVNSOXFvMmhFL1dTYU5VU0hLVncyMFc4ZWczajlZOEgyVzVV?=
 =?utf-8?B?bVZ2VENab2ZzaTB6SFpqelF3TlkwbnlnSVJaRlpPYTArNnE1aEJmSVgrbHBy?=
 =?utf-8?B?WXJ4bzl1U3FNK2dMTUpGWnEyODVJMzN4VXJaaXM3UEY3NzhveGxKelBzeE5F?=
 =?utf-8?B?bE9NYVB4cy9heS9EbDNjZ3NKdzlaeC9xWi8rRTc1RUdKcS8veklNc1dmdVlL?=
 =?utf-8?B?eWJOTkpTemd1QWNMd1BveVZaMmQxc2hNR05VUEJPRmZpWVJxOW95cmh2ZjVX?=
 =?utf-8?B?WUI2NnVhbDVoY3ZBcWZSTHNwVWJMZWlIZVZXVTFOc01yWHBITkNUb1RTWkMr?=
 =?utf-8?B?SXJ5SlpnZm1iUG5sQ3R6TnNjWThXVFNUQjk4UTZWa1pzSDBNNFhZdFE1cUgz?=
 =?utf-8?B?L2phaW5YUEpnRVVlZXV0ek5sL2hlVURLUGZVNS8zQmoxTWhPTHMvdVFJTThv?=
 =?utf-8?B?WGFjRFFQZGxqYlR4S1k4K2pBQmtaZUpqdVduMTZ1Vm5XLzdLS2x4aDc3ZDJj?=
 =?utf-8?B?TTVTUDY5T00zVnI2NnZIK1M5T0p0dXlhOVVTVGpiQnNWTmFJcnpPMkpKemVX?=
 =?utf-8?B?cTFCSi93UCt3Ymlnbkg0eiszL0dxa1hFcVk2SENKdG5JZDhob3ZKRnIyRjdZ?=
 =?utf-8?B?R29xNGZMZk40YnFqYTV4V3VxUEFJaFk4K0Nkd2RhVnptc1NBdzk5OFJMM3Jx?=
 =?utf-8?B?dEVNVDBEOGJWNFVnOTlBRmlRVjErWVZYNXVzKzhtaFBGT0pYMHR3VGRuazRB?=
 =?utf-8?B?N1FCLzkzZUJHdWpZblo4RTY4c1I0ajkyc1N4ZDBoTUhLbEhQQitrbUZBZEpZ?=
 =?utf-8?B?WG5HUXRiZDBqQUVuRDhHeDhZTlN0empubEt5bUtMY29sSEdWMmdPY3Bpblpp?=
 =?utf-8?B?SUpUcGg4SFV3QTNSZzVJMmM3Zys0MnlFQm9qbEkzbVhTYXR3RUttdTM3djd2?=
 =?utf-8?B?dGJsSEpmbjJHVXZ4dDNSaFVqN2lyQzlhSzV2Ylo5WEI0bGlPcjc2S3FmRFhS?=
 =?utf-8?B?NzJXcHhoOVlDV0RRZ0xyYnBFUys2U28waTJGYjFkRHVYZWpGeWVGOFVmcGRT?=
 =?utf-8?B?YW81VzVyMlg3M1hWM1Z3WDB0cHpsS3FEMWgxd05IZ3hWVWhvQWp2WlAxNGJr?=
 =?utf-8?B?WGZjTCtVK3ZtMmZ0TCtuV3BKcmNHZkxMNzJmRzJsTGJQRnhuRmRWZmV2enV2?=
 =?utf-8?B?cTVLWTFkU21zSGJVZ2h1VXZsaEtwVkhYTnRBMENhekJETWRTUGFCQlFsOWFo?=
 =?utf-8?Q?RNq9cwQcJXCgIBX+tn8HFbtHNz/jEzR1ezYXHcOdakqH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87bbc44a-6667-4b85-48be-08dbce3c15ea
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6467.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 11:36:06.5678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iN5a6+8+/++I9lZKu7f75C5TjFSDIgIZH8MIP+8USctds5TYWXFg4LM3+es3/LCclnPgMsuspfKS+rjEsyYreg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8789
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi William,

we encountered the same bug you developed a patch against posted to
https://github.com/aosp-rockchip/README/blob/23c1487f8060c79f5ab73ebc7bccce10c6a8b655/patches-kernel/0001-usb-dwc2-host-fix-channel-halt-with-unknown-reason.patch#L24

We, too, are seeing this error case triggered:

[Mon Aug 14 10:51:07 2023] dwc2 3f980000.usb: dwc2_hc_chhltd_intr_dma: Channel 7 - ChHltd set, but reason is unknown
[Mon Aug 14 10:51:07 2023] dwc2 3f980000.usb: hcint 0x00000002, intsts 0x04600001
[Mon Aug 14 10:51:08 2023] dwc2 3f980000.usb: dwc2_hc_chhltd_intr_dma: Channel 0 - ChHltd set, but reason is unknown
[Mon Aug 14 10:51:08 2023] dwc2 3f980000.usb: hcint 0x00000002, intsts 0x04600001
[Mon Aug 14 10:51:08 2023] dwc2 3f980000.usb: dwc2_hc_chhltd_intr_dma: Channel 4 - ChHltd set, but reason is unknown
[Mon Aug 14 10:51:08 2023] dwc2 3f980000.usb: hcint 0x00000002, intsts 0x04600001
[Mon Aug 14 10:51:08 2023] dwc2 3f980000.usb: dwc2_update_urb_state_abn(): trimming xfer length

As this patch is from 2021 and the issue remains unfixed
in the current upstream, I was wondering whether it would
be possible to push it upstream, respectively what prevented
that in the past.

	Regards
		Oliver

