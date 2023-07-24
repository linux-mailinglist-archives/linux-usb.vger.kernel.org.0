Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73BF975F9D4
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 16:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbjGXOZV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 10:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbjGXOZT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 10:25:19 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2088.outbound.protection.outlook.com [40.107.8.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7122C1721
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 07:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nO8rtZKCrcKGOtUQ13uC2+HMEI03l5bSD63ilPfC679UHUxiCEUqLHKEsqO7XsMgAv+1AoRr/xSbMU21XE5MN/nLvr1QSIuDeeLdK3FD1tEaLJ6LxeSjeB8edckZIpwTbL42GMwxppYI2C+dqqwzTd5RJY2YMdJbGGXmTiGfoRXnK8nQte0mNj0R1uJyvUDRuh99rftmDhxrK2//B3AT+RkSpXSsG7aZNKYm7ous3TR3EYX3Xl9QdtoFWAWIz1dDh+eS6bRm66JACI5pFWJ20hbAjymaQ4AppJ6dksfoob8BJKHHM7IZx+ieQ5sNWgRj9Hvv/ayUJCZ/AFwSUia/Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmwZSMekQz13KXATaKXfJ28yJsEUy7T7XQ/+VgS+4QA=;
 b=UnAwKjNomev9ZvYdkLFfYnDm+WP6vXErTlVIPj4PYOIfdGnCvtuzP7/op7MOpFIPAzBjYTQ/V8DyKYfKZYqVpuQtvBir1aOMLNmDhOuzdNAgdqaDs1XKlTLV9h1tJ+YG6MzEpqMQSGpNZWqO4zfgzEmeOp7K+UHAUG1pR+9UHrByNbvBXMjoAZBqHQSaCIuvOvwm2aXuZOqwO13N7rkqRY9cjLDXj2Uw7tzckaD99cVNIO1/IjUFWnZ7zKzT9qXvvyoH3zfQVEpA9FMoECMH5Pn8XaD1NgJ0MK5cEZ5myjD1ypo9IGqyFHblIu/vNQqSFY23fJ5mcE6ExxvYpOv7xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmwZSMekQz13KXATaKXfJ28yJsEUy7T7XQ/+VgS+4QA=;
 b=AO4bWU+62iEbi4ZXfQtRVjiT0YZZcPwPWSXBaOfaVHz4n3XL0GdRdeB0XWU1ycLm31KJCHEVGZ+XA7CA1b7G5c5EXJA8LvuPsftGB7GsDEsDbFZL5Z2dVYD4mZHmRihVVhgCVrVBvG1CP4PtPQQtcSAknCq0qNjOCHFw6ixKpNBEj23KMwemmb67tSNCOxTVlF7Ox1wQLqnoGG8J0KCmatcbv+1Go/fHlMB3CEa0EhakO3r+XzKMkIs4JS4F4YPNcbW0EwuqK4zx997dHY1VgtDJrAEG7+KXDmw7OFYjsSOx10tlRJOTkvtFS/JtL8Nxz6ob+/RGz1PqEafoqymbhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AM7PR04MB6952.eurprd04.prod.outlook.com (2603:10a6:20b:107::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 14:24:58 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::7ef4:97ef:66d5:f5b3]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::7ef4:97ef:66d5:f5b3%2]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 14:24:57 +0000
Message-ID: <1ae1ad1c-34ad-3a1d-baa7-529832ed42eb@suse.com>
Date:   Mon, 24 Jul 2023 16:24:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] USB: hub: make sure stale buffers are not enumerated
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>, Oliver Neukum <oneukum@suse.com>
Cc:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        liulongfang@huawei.com, linux-usb@vger.kernel.org
References: <20230724124057.12975-1-oneukum@suse.com>
 <ZL6CHnYEmxssGXRG@hovoldconsulting.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ZL6CHnYEmxssGXRG@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::18) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AM7PR04MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 654e92e2-a06a-4450-2dde-08db8c51c1bc
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lwx5+HVW0V3tFcwy58lzFL6ppfmH9eDv87kxT1ZSEiW6/8J3m2qP+Alesp8FlsIyLGrKLzcqAdybMZ/+r0eD4sQ2kwZf1Xw6o7L2S5b3vhMQrSLT+B5q/OZ/9f0WaIBgg8hj1xDFMCV9PS0lnQ3oHG23P2of9QALisPijfQLfBJa2CvBEAvWbFkqtLhCC+BhOjddg05m7E+K5iNUf4DFEMCWK4dFQepUL6/DtlTRE9zz1layIocUQKkqdkonNVLkUKqmzQVqX6VmqxsPfDAuO3ThsBZF3CFMl3ORSlpLmJEe7E+YFFAflL7/0RM3mX5djcesl+6r2GFAhJJJe/I8GD/w7oXTtjha2AvNp3taiKZRdtDHHTB+3PXgiYjauI+wjPet8gl2HgXKKJH1p0snojkRUaSVwXZ9mYdcd864C6ibVW1L/XdXcr9+UBL7UKU2t0qz+xST1OodMhR0ajE2ZUlvvkBlZ/6wwU9S98gxGSLxMrw25V2Hlf32A3e20ctI+s1mb7X5GmusXMt0kLQ8mhjWgMUrkGFugMzbQxHkc+JyAq0uO6JJzeAFw6+EbhMfrsLROU5B2PCjtYdNmjsLpnC6i75SXrxWDNPVByt72ky9QlWRozN2h5lh8AmngoIrlGxSoqil9HEEXKCdxLi0kg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(346002)(366004)(39850400004)(451199021)(2906002)(38100700002)(6512007)(83380400001)(186003)(2616005)(6506007)(53546011)(8936002)(5660300002)(86362001)(31696002)(4744005)(36756003)(478600001)(6486002)(4326008)(66476007)(66556008)(66946007)(8676002)(316002)(110136005)(41300700001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVdld1p1OGl4eGFpZGJSRWFXM1ZiRG9zZXRUZzVxdFB5UmhQL3hCQjUxYzdj?=
 =?utf-8?B?ME1pbllzd3dGVG5SU1ZyeVEzRFhMYy8ySEs1NTRYcEphVnAvNGN0dUp5Z1ln?=
 =?utf-8?B?TUVZam9JeGtCbFRPdjJwcDg5RUVLK1UyZ1V1WFZsR1lIM1F1S3Fxc0dEN2Zm?=
 =?utf-8?B?NkdLR0xmMEMyZmlYYmMvN3I5dDVMU25jOHRIbDU0L2xtT2prcnlGQ1FSYnNJ?=
 =?utf-8?B?Mnc3elI2dThiVGR4K0Naa29aNGZFZThsUFROYWM2Y3N6VFI2dUFEbkdaVHR6?=
 =?utf-8?B?a2pPZXU5MFE5RVFyKzRtQWVxeDFqQ3oxZTh2eVpQNEVwMjE4VDlITHlra2tP?=
 =?utf-8?B?UGVSU3ZCK3pwbE9IYm5EM1NzQWZjSytLb1FSanpvL3d6cHhlMEgxOEtSSkk2?=
 =?utf-8?B?Tmc0YldPU1BjVjVzdWNMSUdReWtnamhIQ2ZDZ1JZU1d6dGoyR0Izc2x4cXFE?=
 =?utf-8?B?RWhES2kyYUhvd0wrOEdZbCtnR2hydTRJMUNoZlNjUm9aZStGejJkR1RzTmpV?=
 =?utf-8?B?NHpzemdLWjdPRkRvTlBHc3A4QkNJS3NlVjRkaXJ1MG1mbjZUZWhsNHlwbDVx?=
 =?utf-8?B?bHo1QW1FQXFrWExkMkFZcVFmZWN3Z1d0WHBVcG1qRmhxWXR0UlRqMU5QTlBp?=
 =?utf-8?B?MmV3ZlVjSk9aSXVsRjZ5ZEF5OTMrTHlTZnluUVJsajNLWm5relZBWHJDUWNn?=
 =?utf-8?B?clZKdWRCVVgvZTBlbEl4VjhSdndKV0JzVWlEUGlPVGZRNC82WE40WUVNNXI1?=
 =?utf-8?B?dTZ1c3RhQW82eFNLV0U0WlhKZVc2ZndmbmZrU0p3VkxTb1R0aVJoczI0bnNq?=
 =?utf-8?B?WDFlKy9OUjRrd3FDRmcwb1ovSUVJWFpiTDdmbDlYdXlEZFFQSk8rcE0xS0RK?=
 =?utf-8?B?dkpoaGpNRFNiWkE0ZG5odWY1Z211TWRIb2R2Vng0SmIwVUZhN0JzcGlwOFhu?=
 =?utf-8?B?MUxIQVp4Q1MySDdkbkZiUU53dmNEZm5MNEdTVDhrR0hYN0J2ZXgybGRTOWNC?=
 =?utf-8?B?RExJNUlOUHFNT2FPRmpHYmxlWk1rM3diYThydWJ5VmdaK25kNVFubnhwSkN0?=
 =?utf-8?B?WlMrd1QwV3I0QzA1VHdCUkZBSEV1ZURHQ01Yd3FZUVlFMWhPdFZ2eVBVaHMx?=
 =?utf-8?B?R05tWXIrZEhvN05lMlBjWU0vd0VBdDBtWXI2OXVkZnI2SWI0M1k1YnQrTWQz?=
 =?utf-8?B?bDJDcTZLREFQMURKTWs1REhwNkF2UGdCem9JdjMvUHpOZ1VJRjg4LzhzOFl4?=
 =?utf-8?B?SG1Vb3duZFhrNUpGUkJsQW5GWWNYU1UvUGt6V0oxRlA4SzFLd0dWNjFOOC9U?=
 =?utf-8?B?WE1jdWFRc1JiVjV6bXEyb1dGbHQyTUdqOFlCSFJ2ZW9EYythempzVU5hc0l3?=
 =?utf-8?B?S1RMSGV6TEJkck1yR0haSG9QMVFXNVVJd0M5dGU0UmJlVExmT005WThZQ1Qz?=
 =?utf-8?B?SnpnRzd3cy9Xc2szUURRN0VldjF3amlkUlFPcGlrOUlaTWkzOHplSUxTdXBH?=
 =?utf-8?B?Ulk4T1ZTd2FSa2pNTEx4UEtsVW5OS2szSE5hRWZHKzhmMVBib2VOdk04ZTJM?=
 =?utf-8?B?dW5GaGl3V09Sd0tGN1E1NHNnUFFrVjMyUmEvRUJrQUdSejlwTEM4cU1sUXBi?=
 =?utf-8?B?ZzdHUEJUYzQvNnhPVktVOElkWUwwOUMwUWpTVUVrMGlROExYc0JMSzF6Rk15?=
 =?utf-8?B?aWZRajJuYWk2cUZaYXBPMll6SXpRY0Q1dGk5Y1FOUUE2cUFSNVM0S2N3T0pa?=
 =?utf-8?B?eTh0SWdvUUdsdFpldi9zQytPeXRLU1VERVBmK1NxbUtuVUNMc29yYUluNWVN?=
 =?utf-8?B?aG1YU0o5Z2NWVVBlamFWUHhFM1JjWkc1MnpQUGlPdFFJVGpudmdDSzY5NnVR?=
 =?utf-8?B?eG5zUTUrTlY4dTdBTWM1cEo4bEY0bFh1ekZSSXRGcmlLaEpnVER4WXJJV3Rx?=
 =?utf-8?B?L1Z1UHpObHZKWXJhSmxjWm1oY2ZwaFdtSXZnS2lQQThPZ25TUm1mRU8xRWEv?=
 =?utf-8?B?a1FqY0N0aEM1Q2VWUys3ZC9vRSt6ZzIzRmFOTmZOdHphYzdjUCs2MWt1ZDR5?=
 =?utf-8?B?OGpXaklZTkR4d2U2S2tqbzFBRzljc3FHVVFkalk2M2dxSjlEeGdLazR6MDRQ?=
 =?utf-8?B?WXNab3NVb0k1RXpJWnh5QTZ1WFE5d3F6eW43cGg2ZVN1ZHZRS1RhMHJxWW91?=
 =?utf-8?Q?Of6CG8p7fqrepL/y1F07fxo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 654e92e2-a06a-4450-2dde-08db8c51c1bc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 14:24:57.5842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFqK09n2okPV3RBafBbS2KI1VOvr7auP4k7MT+vyBvohMUeSXUnLMaSMRoT7A57m4Rj4CfEOYGr0hew0lmysVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6952
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.07.23 15:52, Johan Hovold wrote:

> 
> This patch is neither correct or needed. The current implementation sets
> 	
> 	buf->bMaxPacketSize0 = 0
> 
> before reading the descriptor and makes sure that that field is non-zero
> before accessing buf->bDescriptorType which lies before bMaxPacketSize0.
> 
> It may be subtle, but it looks correct.

True, but I am afraid not sufficient. It neglects the case of getting
a partial read. That is

buf->bMaxPacketSize0

can be genuine, but the later test
if (buf->bDescriptorType ==
             USB_DT_DEVICE) {

still spuriously succeed

	Regards
		Oliver

