Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28DC357BB5C
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jul 2022 18:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbiGTQY3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jul 2022 12:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233385AbiGTQY2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jul 2022 12:24:28 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2073.outbound.protection.outlook.com [40.107.104.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C10066171B
        for <linux-usb@vger.kernel.org>; Wed, 20 Jul 2022 09:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1Ix20cVJivBzJcNTQPKWFf/VW1NG/9IP9U8XOjDCVdL7/Ao4dJMFuI63yHfp9oXD82x7VcFHaDeP8jKNvN/U6wc7WXi8dEA0PWq834JF0nSBs5ogpHRlAtVpficn4xIzUf9JyK+uI4Gh5NzLSMc1aA6ekeIPc8DSK++CX0aFc4AgwFxx8eNCj4dK1gA1v5ozOeViu+0S0PYqQvAdyb7f5/4E9PHyCjjaxDgpms+69ud7mJAQFlI8OtOmJMRC7jkcHfTXIFK3cpaL8RLEza6mNRCKNtFVI10ZyG6mJyDoNdSmVPtwepx9bGLbDZjOLt9yN5cm4vl6wcdAPCulO3O1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6Gs6y2eyh8k9ZBzyVGxwtEy2eIhpfWc9X7KbecXdTw=;
 b=HocAo3xR3fURcbugouPk1FmY+wMVgcmja7MV3q2CfJttxUnJzPfRUBg0TTbWDv3LT9cR+Usmk0wDTbXXYMlnPpfePV+FTEIvE+NULubP2lhTyFc42gEXyXqMjpy+0ZczvGdknBim68Q1ujhfJ1UwYOhDgi4q7KZL0L0KszsHluvZ0szIeODTA5mx0bipA0GJA5gLbp50K7mPzKaewUgbqp69hpkGS7MZXLkt8zxZ2p56yrRbpC2nXyndpHXSfWsX2trgXLGLgpU15P6GdFmkLRjwUzfR8T8sLzlnVzikp4y6Ukl2QAhN1T952ibUpfGwiVuHTxqS+EMrfQfp9BByAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6Gs6y2eyh8k9ZBzyVGxwtEy2eIhpfWc9X7KbecXdTw=;
 b=x2q2RPxF3S0OQMiHBNQqnoB6/eQfdSu+OwTu09aHpxh0Vn0bAtPeJxvCDIwXrVGYK8FRRRdHEqJJbmXB/n1O0Ky+BZiXzLZ0ImxZ/i6vOmpVlgUMuSCjCdx0jKuh09iSckYxwjD7Ebhz+fASrNosVgsvUD9iXle/3SBeO/nTW+eOnOCAN4+AxKeQ0MwlsGxcety2Lmef1wmilTkYb81qQd5dThRxEF6DtR2RqZluSmGY7H3miXzfUD2ztO3vnAm/FSNZViwcyQJiPcwnzsmeP9QKo7c2I0IAD+OSbafvSD0WwQMR6yku1uRIrg+mlhvkGcQfyGCME/ayqetLy6EVSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by AM0PR04MB4034.eurprd04.prod.outlook.com
 (2603:10a6:208:63::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Wed, 20 Jul
 2022 16:24:22 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::21d5:a855:6e65:cf5d]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::21d5:a855:6e65:cf5d%12]) with mapi id 15.20.5458.018; Wed, 20 Jul
 2022 16:24:22 +0000
Message-ID: <0be17155-200f-ae12-57e5-72a2d7d82bb3@suse.com>
Date:   Wed, 20 Jul 2022 18:24:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: serial: usb: cdc-acm: OMRON B5L ToF, device probe failed
Content-Language: en-US
To:     Lars Melin <larsm17@gmail.com>,
        Chris Ruehl <chris.ruehl@gtsys.com.hk>,
        USB list <linux-usb@vger.kernel.org>
Cc:     Oliver Neukum <oneukum@suse.com>
References: <85ebf554-effd-c89e-6eb8-c149442b931c@gtsys.com.hk>
 <fc9986a6-0b11-d949-2196-1ad35d3f4d98@gtsys.com.hk>
 <1af7ff05-8558-9162-a0cd-ac140ddaf2e1@gmail.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <1af7ff05-8558-9162-a0cd-ac140ddaf2e1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25129bcc-18a1-4a5b-de3f-08da6a6c4d82
X-MS-TrafficTypeDiagnostic: AM0PR04MB4034:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: egBeMe46L6SomQa3AWYoMwB6JAyJkbGBbz3TvRE+Efi4I9dinOP674UaGWpiVX5zEi39biT9lqceWzDaMX9vgRIWy234ZY4fRxRaqw74FmFS1rYRjM38WyNxb8Fr0it0G9f4Wqsw1sxcXkncd+v0Ih7lYBaWRN8wuElKyyyZ5Mxj/AYKC1W/fJ2/xJRlvk/ie5x3ujQ6uSNXIZDHPm4JQzalC+9WkhQWs7ax/1etmU3vUiVo3wa5gKmB65t00H6q5t24ipe2Vtn/UmyaW4jYSE4FowzQQVpAyOiLNFYcz0txMbUk5x4b9OfIipSIyocShg8PS7zK2xYIjPWjBozSJGPf9TuWUJejfCyMQqIBD0u7kGKwZKNqKGQyF3cy37/sDejWQKLR1Zg3w+JTKNwdaVqW4PKX/XtOBvUb1OZnRZ+SqScmUIoCbSqeoS335kOFMSPdJYlLo4yv/PoAQlxHfzGDfk/OJYi7r+TCAodayRFE9U5vLXGjWKbAsaPOhBrRNysucREqVyIiOnhzc40wauAXSK6CXD7uHg8uZKZkVV8ZurqVzC+8v/RdNT6lFtwPhIzCMTUbfs4G6QT3N3PR2l9RToOzK3BV6jjH9BypNdCZOaoNR7NiVNAL0FMR4b2HZ18wLx39ZPy89DEGQP8OFFGu6uooJb5f3P8PnTNQrj2fJhbxDH9tF9VjARubd5RaA9/VMaAN5ia/r5KmAuqsSredH64+3U4UcS1wwVvctcUR8PaSpY/ol5qcv9TyL8XcyEG40d67LJ4P8tsEW8uJNaaSuMRVZtp6XQjGILOWl346REB8182txe6RlPNxTxEPxZ6o15JlWuk6EZPgRR8rSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(39860400002)(136003)(366004)(346002)(6512007)(5660300002)(8936002)(2906002)(4744005)(31686004)(66556008)(86362001)(110136005)(316002)(31696002)(36756003)(8676002)(41300700001)(66476007)(107886003)(478600001)(186003)(2616005)(83380400001)(38100700002)(6486002)(66946007)(53546011)(4326008)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnB3aCsyL2MrVkp4YVFFNG9QVlhuQS81V28zM001bXZmYjZVUmcrK1EzcEk4?=
 =?utf-8?B?RGZvdnFKU3NkRDVPelUzTWZxc2VJdHBncUxBMmFFS1psdUo4cXR4Z1JvUU85?=
 =?utf-8?B?V0pXenU3djExaUt1Yk8wQ3ltdi9GY3lpcGR2NUpMQUV2dVhxampybndQWTFN?=
 =?utf-8?B?cVhQMUtxQ3VqQ1cwa0xFckppU3o5Q2NoNUdvZDBWU2t3Y3laVEhETzF5VERI?=
 =?utf-8?B?cGI4UytVMVVLVUh4QVlyMlptMmNBSlVXQ0V2OHZockRzeUVxcUNUWUo1TVl4?=
 =?utf-8?B?Q3E1dVgvQVI1enFtV3hpTitRaUI1NkRlRHRUUTlMbUZuNDZGWTgySzN1bnBX?=
 =?utf-8?B?TUlqeTMvc25ER0o3STU2ZUYyTW9lVmMvaXlIWnh6QWJaV0REYUtBSEpZSzQ4?=
 =?utf-8?B?b0NlUjJmTDBZWVB1TWgySVIzclhHNnMwM3lvQURCV1RoNm9GL1RJWi9sNHNC?=
 =?utf-8?B?SEo2K3FvV2FXSHRtZUJqTFNVN0txK1FUUDJiaWtuM2d4WUdVaDBEcm5UWFRC?=
 =?utf-8?B?cDNodTFzdDBpMkpIWGRTYVUzUkpMMTE1OGdxb1VwVzZReEpQUDlWQXYreFFv?=
 =?utf-8?B?NUFvOHVheHdDa2ZWZGgzU1loMC9adFBxUkoyQWRpenpxYlYvVkhqT0VFMkFJ?=
 =?utf-8?B?NCs2ZkRPK0tsb2ZkV3hNUkxiaHp1QllyMldGM2lKTi9IdElJTnZRVWhVWGU5?=
 =?utf-8?B?RTlTSjhETUVpQ3N1c01Dc2dKNVlsdjJ3K29oWXl5cVJWVVY2MVlNVUlJZEZx?=
 =?utf-8?B?b3VqU2FUOFBmSjgxdDR3c2lNNVp2UFArOVBENzMwdVZMSW9mdGExd00vRE5y?=
 =?utf-8?B?N3ZCRUExK0RteEljbUdBWTN5OU45ZGtrbEtXcytCL2ptVWZ2TW9ydzdVOElm?=
 =?utf-8?B?M1l0WHliRFh2ZGtVemttQW5nUExyV1VTVWlFcWhrNy9nUXFZYng2MWpLNXlP?=
 =?utf-8?B?TEZlVmV1T2ZNSm0zaEpGUXZ4ZlNRaDFyVzY1WHpQUHpNWFc1RFZVU2tvbUdi?=
 =?utf-8?B?aTdjU2ZEOG1sU2FOczFKZkZxYnhSclFrTytzOW9nZC9UR0NXMWtJQ3lnUndU?=
 =?utf-8?B?aGR5cmVOWWxxRVFrcTc3UzVDcjBIVDRwLzZzMWRBSFdmdzFSU3JHc3FiL0RI?=
 =?utf-8?B?M0hwSFRPQ2M4YmZiYzFoY0Z3bm9CWVBYdkFsUVpTaUxjSzlXTFRHZHY0ZDEv?=
 =?utf-8?B?THVubzFvZkVaa2IyWjdod3lhS29KNjF5YlJoM01BR2dRUStEbXlKckZYSnJw?=
 =?utf-8?B?d1U4WmQ5Ni9QZ0ZYMnlUbER5clIrSDlGWGVLUVE3N09QcGpBLytvVkN5Q25o?=
 =?utf-8?B?Z2ZHQ3JMK3I4UlhTUlZGVlh2OVM4dU1PdExrWGdkS3RVa3RrZGU3a1VIM2Iw?=
 =?utf-8?B?WXdsNDBKVFRETmRDRUhvU2pRSzl5NWdjTWYrK2VONEJzN1FFa1BtYnNwL2Ra?=
 =?utf-8?B?RGpPQndFY0I5QnprckljdnZiaU5oTFdRbm0wYmlUL2hXbENqZk1wZHpuWmhw?=
 =?utf-8?B?aUZySENtN2xnYlZ6QjI2WkVLREtiQ2dVM0wwNVc0ME4wY1FaaUlZazB2eE5o?=
 =?utf-8?B?U0lhN1cwcENBeXdqa1NKZGxMcTNuOUFEUmxGK3ZJU0tucDlvczZkMUlsc1VE?=
 =?utf-8?B?eGZKaGp5KzMzczJFdG90ZHVwK0twTUxnVmt6WU5pQU1WRmRNZkZwWTR4UXpp?=
 =?utf-8?B?OWhFQzFRZm9DaGtQZ0VHR0RSalN0SnFHMFlHZnNGN2MwbXBWQ21FN0RMZnVr?=
 =?utf-8?B?M0RTZEwvYjhiUVkvZEpxekJiM0ZJTldwc2szUjlEVWhlNytEVnFVR2YydHhE?=
 =?utf-8?B?aEtybXkrVmNnbmszMGxPaFA0R3RrZFhDeXc2RXNlYVFVL1dtRVlYeTU4aVRF?=
 =?utf-8?B?S2lEWkdmMGorL1RveUI1eDlBYXNmVi93UEdYcWF5VUhxaU5veG9RL0NneC9V?=
 =?utf-8?B?SGU4dHNHS1RnVC9nbHY4K0VXMEd4cVQwbzRzS3dwZ1MwcFRzc3I5U0xwYVYx?=
 =?utf-8?B?VFI2Z2tHTDR2bXFRNTZCTVVEY2lnWkVnK3hMQ2REWnRiS3FnSFhWd05vZWEz?=
 =?utf-8?B?ZkdjS2licVBvOEora242clZHZWZtVEJYREhKbXRZMHdDcE9Hb2V4NjlVbU5B?=
 =?utf-8?B?eTd6aktzSHZUK2dKSXpMRUVzNW1BeVQ4Q1lUN3hCZWhzWkczOFNtTUFCeFNL?=
 =?utf-8?Q?3zS/A/I8KyPlTR1d39Ul9JvBVFvnoW8FXhiMi6v9kAHf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25129bcc-18a1-4a5b-de3f-08da6a6c4d82
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 16:24:22.1718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2X6GCV6idBQtOiFUbvAvsAwUsbp3Mw/3xVtoSsJj0nTxsjFpPGp3oK6zZvBVFQ6V0m2U6Fh62nWd5y7Vixrrig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4034
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 20.06.22 05:35, Lars Melin wrote:

> There is nothing CDC-ACM in that interface except for the interface
> attributes, the interface lacks everything else needed for it to be
> CDC-ACM.
> Check if Omron has an updated firmware fixing the problems or if they
> have their own proprietary driver for the device.
Hi,

that is not completely clear. It has the interrupt endpooint
that may or may not be intended for status messages.

	Regards
		Oliver
