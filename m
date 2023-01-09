Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED366624F5
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 13:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237004AbjAIMDA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 07:03:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234840AbjAIMC7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 07:02:59 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2050.outbound.protection.outlook.com [40.107.8.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 927FD1A05D
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 04:02:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dS9Itd6x/Ug8i9+10KfcnVN/+8uiieIx4COELaYJN4jnsrIkCwgmoOxiAlKwZr7ZeNVXeVwnm0vq5B32T9skJcQey95/tkJJeD41V/PORUjI4C72YB1euQwBoUc2zEDGwtL6MAQy7QIroSp72yCVCv5YWyFhUqMLDWS6EBzgx0y13uCXSSEadXPQ0XtQQK6pD1wPonniY8pp6cLdxbKx1uvv689QNJIco1piWSAW7iZ1b3yRnapc5LznVuE7duQsxcWBp6kQSmTTz9QR9m7e+Na9NF3gedluBK/QM0ucozLc0x2Y8/P+pHptKPf/VLITOZr9kQK9DGs3LmMuB5z/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwDAEYOgHmveWWrzLAVTdudXMXSxJzqAEstQeNZSeC8=;
 b=jjscbcDJsuhXBqcF4rKYdLzFKou+K2Lq4AJxCbVx+LI/hw2dGwV5mwOzrlsImiHciClUNPYM8XnrQLRebCUZfND2bovhzfVv6zhTVcT60yTThx/3SO3JAOnKXQ5Xo0i369IIO2sC98+WaJf3fht3jldGpRnN2u4gC2lME22li/cCbUD5HN9eX2KBImGc445qwIICnWd5SvRR9o8ooWB7BlJ+HhGWe9SUXLL/Tlua5NN6zADk9vB8YQhpOPS+aKiiXoGoEyN+LUPfP336D7Gqr3f/kEDxJb1fam1EJq09pSB+ghFUQbHj4V3fzuFaZQ8Iqvjy0ngonnI09FIUhofuAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwDAEYOgHmveWWrzLAVTdudXMXSxJzqAEstQeNZSeC8=;
 b=PPgfgcSLcko5bgu8ZzmDFLceZgpUcwooYYyZZaUhOY4zUpWF4QbghLUhep9bodEiS1+H4l/7TjN0j2CWiVRU0xLYg/9fcBWS+fliYC2aNC/BPIA1ebtjsWCx4c8U9FXuLR7IgDkVQzrUKea7oxFharajTM+myAIQcBuVGXzu5OOUMOmwT+4rgYM3tPlhhF96UsoEp62Jfa1CUExoTOixlANQ5csek4CGPgMBDiRHfCXLQzfvnQf2UaI1452BKT9aBvTbpEkP66vbK8KQDk3EKJERHfPs+wvvRQtLo8RyPrcfzEgdXs6Zq+CY2I/n7RzB6UPr2BBjWEnJc5xhLxSz3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AM9PR04MB8891.eurprd04.prod.outlook.com (2603:10a6:20b:40a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 12:02:54 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::8d51:14ac:adfd:2d9b]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::8d51:14ac:adfd:2d9b%6]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 12:02:54 +0000
Message-ID: <a8c19717-dcd5-74b6-be4b-57616ea88ab0@suse.com>
Date:   Mon, 9 Jan 2023 13:02:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] Revert "usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS"
Content-Language: en-US
To:     Juhyung Park <qkrwngud825@gmail.com>, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, gregkh@linuxfoundation.org
Cc:     stern@rowland.harvard.edu, zenghongling@kylinos.cn,
        zhongling0719@126.com
References: <20230109115550.71688-1-qkrwngud825@gmail.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20230109115550.71688-1-qkrwngud825@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::11) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AM9PR04MB8891:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e9a1eeb-9438-4336-9e55-08daf239705e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gwsV+BiCHiv3NSfxn3vriJDQrOQYRHC/vJrUG2hQUNjUte1C9bXPuvcXtSdI6OWzER4L/6Z0MYorx6wr2gB7NxjTd7Ve9sVwKYQ9s7IJGKqLj4t7DU59x6N41tttkF1gs4ELYlNC4p5ePH8qEdC2xWHujuD6Qp+9vvY4Wg4U2lopCyB03g964844xIAqlRcnccsOpAIIbk3FlNUiES8ZKGJji8bNEptUm+olhUyAV+sOEldA3cgoC4ytoSBbJmWnLjbc/hHTAHxhR0p/Q3OICI5T/Y7JYCDYVDercmlBh15AfXrvUMvwN8BeWMJxz7vZO8gZke/1pjZrrR3dANfmHnvWyFsXr7nlctm1c+6IRG2lV+Q1odl6GOJrK8Yl4oaQeqhl9BJfMOM1gZ60onB7WokNAxNHh0OVelf450s+w8uAQB4YLeeNS259RFFPmU/ABNXHaYbpBMfbImNUHZZLjdhBdS3I5BT8qyHk4dNk6A7dWHxXp6RWtMUG67ZqA0BMsvZDPf2KX+1Kao463UHVQHvcdfr0PplraDU4xkUzuf72dnTEb9MHrjU4rqRlEU2i/40RtGiTxnuz52pxqkH7LsqaR1Mui9ZFxAdRDu3Xb+Eafe2BvuEeqglT5ZG5PPyO+NVkzbqC264Ec+Qk/C/EH+uZ1bq5xfvemTVLjeYAXoT7n7c3km3krzymjJaU2scYx58ndtr8CJZuDn+G+Bp8lebwm//po+pTbOlURzVZKp0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199015)(8676002)(4326008)(316002)(66946007)(66556008)(66476007)(4744005)(2906002)(5660300002)(8936002)(41300700001)(86362001)(36756003)(31696002)(83380400001)(53546011)(6666004)(6506007)(6486002)(478600001)(38100700002)(2616005)(186003)(6512007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDlxVWFKczhEdm5FeHYvS29BQVZRUSt2dlpBMVpWRU1UOWpObEExQWV4QUJC?=
 =?utf-8?B?VytObTI3K1pldmJmK3EyZGlvU3RGZ2FmYVA1Tm5STkxaSkk2NlYxTzVvWVpk?=
 =?utf-8?B?cnd3ZExPa0RGcTVxcnhHNDNqTDJPUUxWbEExSDIwNzA5VW9TYVZud0xXczQv?=
 =?utf-8?B?eVdIR2U4VkRET3VpU0FqdmJHZ1ZEUHBRS1QxSFhEbWo1Skk1cW4zejREeGZT?=
 =?utf-8?B?Ry9nZW9zY29RQWxEN1BMandLVU84amhLTDdlbFVLTnVhK1FCUEs3ZDdkVFJQ?=
 =?utf-8?B?MmM1MkFwYS9IL1JxeEhUeDRBZ2xCcGIxdGVOckpWL25QR3M4SEp2Mi8xUVR5?=
 =?utf-8?B?K0FrTTRZaUM5YWZTMWdwbzltT2ovcHpuYUVnb1BQTHc2YWpYWVpVNGl5VWlh?=
 =?utf-8?B?Vjc4bFFoNGJFbTFzQjkvUStLRlgzaWR5bnlwY25sL3FHdjlORThHQVhRYUNE?=
 =?utf-8?B?M1QrUnN3MmZINFFiWHlJem02elRiS3lNeDh2UzJhbnZ6MTZkU01NRkt3RVR4?=
 =?utf-8?B?Y1VPYjJYK0xCWkhmb1RLNlRjcktwK1QwUm5DV2N3dk11eXIyUEFWQzlLcjR4?=
 =?utf-8?B?M29rbDd3L0E5cVc3ZHVQZ0xvSDlGWVZtQjBpT25EV2tHT2h5L0g5NVJydDZU?=
 =?utf-8?B?bDYyQ0JVK2o3ZVBDNnBqVUVxaFdqSms1eVRpdDQwWFhwZEJUY0xBSTlvVWFU?=
 =?utf-8?B?Q1g5eEdGQkR5ZFdML0FyajdpaVlmdUJiTjdTdWNGK2poMVYrbFJDTy9GRy9H?=
 =?utf-8?B?S3ZyRXpDTEpQZUhVVVhGSlRkRmg1bDlORGdsbG9QVDVsR2VuL0ZjU1YycG1T?=
 =?utf-8?B?VkpqcDBsV0o3cVY1bU5lMGgxdVhqTG13RkllTFZEVElUM2RTTThEMUtJQzI5?=
 =?utf-8?B?TWw3YU1rWENmL0lQZkJnVCtpWTJjV0c3bXRYVVhONXhjL1pNdnN3bCsvYjIx?=
 =?utf-8?B?VEM2dEsyck1PQlRtNUZlNk9aeXBRSEd0WWY0NUZPS3Z6ZmFveDVBU29DYlZX?=
 =?utf-8?B?K0VRek5KWGg2ck53VmxCbXZKV1kvSUtvdXdDcSs5d2ZvZ1dVb0hEUS8xYTlN?=
 =?utf-8?B?U3pmRjhJbFBVS0dCVFUrU2VWNk00TnB5YW9sRGs1a2szMnhBYnhJbmIrU3Ur?=
 =?utf-8?B?cHQxaStMYnRxb2NVYnVZMkFnUkJhZFN4YzFwSkdQc3d2bkhlSlBiZ1Y3dStV?=
 =?utf-8?B?TmU3N05CeEp2bVBneDR2bGJkVjUxYlRGUVNxQk1EaVBwTVB0a044bHI4K3Jj?=
 =?utf-8?B?aVFPUWhxWVM2SnZDK2VlN3V6Qkk5c1JZdThCR0pMem45VFBrd1N1L0FYVWlz?=
 =?utf-8?B?eEMwNHM4TmloWStSRDgxWlF6NmQrU1I0MVB0djNTOXpZdUV6b0NFd3J0VW5M?=
 =?utf-8?B?aHJzQkFucnhIQnErSTUwcyt4eXZJbVJVd1N0Y01wRFpzN3ZXdkJ2QzYzVEVa?=
 =?utf-8?B?WENRTVhUZDd4aE15ZEhWY3Q4empLdFIzRC9neUpMRUJERVZiS1hwM0k5RUV4?=
 =?utf-8?B?MEZGZFVNREdzUi9HZDZyWWdCaVZ4OEdiNUR6RFVONnNMT0FjcFdmQ1VUVXBi?=
 =?utf-8?B?cDJXMDlGak5JTTNQSVdvYldsWFFWT2lvYkN3VTNXYk5jaWRGZnN5ZE5ZUTdE?=
 =?utf-8?B?ZEdkQVZlTlZZbllCSkFBRi9vVTJ2RWpHakwyc3Z2RWtOTERCbEFLZVRmaHUv?=
 =?utf-8?B?OGtxTEpPRXJnQ2lNUzdZTjVqd29rclZqbkVkUUF6S2E3NFNnZEJPS2VvZk53?=
 =?utf-8?B?UHNQanRHL0xoSG9vdk1ja1pqczY5TnRSak96RTJaYUQyVzRBVERHeW94ZG5L?=
 =?utf-8?B?UEN4cjAvR1Q1a1FnNG1DRVhaWXRuVlBhamNzeENxMlllMEhyaTN0RWNSNmNQ?=
 =?utf-8?B?U0pYblVvcjhXSWhGVkNkaEFReGNUNzlxc0V6VHByeDdON2lnMy9YTGtmVE9l?=
 =?utf-8?B?ckVYMDUzbVV6TXY4bkVmU0VBV2NKZXltbzdZN2YwWDJQWnNaTFJXWGljczRu?=
 =?utf-8?B?SUlidUo5NTNaUE5sczM4elg0UUtWNmpCTHBqcTNsZit6ZVhLTHRGMDRnRFFh?=
 =?utf-8?B?dUx2QWRZTUxYc0p2R3FNWEUrcWVoTHRwSW9zbmRTSVNxbWR4aUxuVDcwY3Nl?=
 =?utf-8?B?anBoN01TSFpGaW5VUXNjN1JVaEMxTjBoUWQ3S0o2dWp2S2ZoVTh0SkdPSmJG?=
 =?utf-8?Q?rS39zHVD1odIfC76UVqfwYVqVWACp+0wcXWmmCCnIfTG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9a1eeb-9438-4336-9e55-08daf239705e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 12:02:54.1777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlckE9d+uawbhGaODqET+joNMygRvnV0auy+ffIynMZHI8r/B7pMFvxGq+DoAhLFouF6QCZlAnMszEkhvKXnkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8891
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 09.01.23 12:55, Juhyung Park wrote:
> This reverts commit e00b488e813f0f1ad9f778e771b7cd2fe2877023.
> 
> The commit e00b488e813f ("usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS")
> blacklists UAS for the entire RTL9210 enclosures. Realtek's VendorId is 0x0bda
> and RTL9210 enclosures reports 0x9210 for its ProductId.
> 
> The RTL9210 controller was advertised with UAS since its release back in 2019
> and was shipped with a lot of enclosure products with different firmware
> combinations.
> 
> If UAS blacklisting is really required said product (Hiksemi USB3-FW), it
> should be done without blacklisting the entire RTL9210 products.

Hi,

I see this the issue. Do you have an idea how to limit the scope.

Hongling Zeng, do you have an idea, respectively if not, could
you provide "lsusb -v" for the defective device?

	Regards
		Oliver
