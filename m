Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6216680E67
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 14:03:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236768AbjA3NDm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 08:03:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236379AbjA3NDl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 08:03:41 -0500
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2085.outbound.protection.outlook.com [40.107.241.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DE251724
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 05:03:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eB30ofJdxh7EH/yTsZx93FAXXfIz5qGp7e9P1p82yqPZTdYsz3SLxwI1BT5zde4yFz4JpTl7GEipOuCCbjc8IZCm/6oTXqG4b7QQpWcptVcJQSXV+ckRh/93LiRjtgUVoJ3UhfHJhF2CxBDsrh706aF5hHfyQhdftYFvmnB8WWI9+LBMIqdRUA8pT4EIScPLPMVQ98jUvRgTabtIXdJIQuH/U85LLzUNc9cCTOKLdqfrc4mWZtctXF2qj95JqZqIGaI1WNx7dd7BJ7I6xhdPJYQ4/sWvL2hf1VNN02+ytUCXJ5zYzrtfRe8ELkK7Rw5AFU+/w9xWfiWVLVQ7LSs4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6KEfjxE3ruWKfQis7nv54FDcTtxClvMAAwTHFyHQ8c=;
 b=iolYvIzVmAwB8W9CVYLRZ0BgTZh6vZJErJZ1KpirARjNsh6P+4WfqHHwK4acNT3DbbH/aWex21dN/cCmriBqily5FMj9uKNBEZO298QO/c0hLrj+/XCq+FLcJtiVmN/IpwBjVDdKCzRdgansaWpZ9bslAtPkk43mjmL393HMnezU/7qRIGQNAKQRxGoa5qv5i9GaIgQJ+A2+vsLgEQXm+8ZYCHnamrqDlqeQrFccRyILMyeK3NEAaDWFRX652fqTamfJCqSxr5sHv76PGAIXaog2RWDVGRd9Q+7YYKwh426wbo6H2sOk34WnyAj4OliLHhwoKmR05qpuzlt4LOeOXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6KEfjxE3ruWKfQis7nv54FDcTtxClvMAAwTHFyHQ8c=;
 b=kK1pLJ6EgI22VC10s1y2me9Tw6WuV56a3yELbNsS8E89ide4zFdYXal+PntCCqEcN4DnGsOrJhH1uGqoVwJ53+XqgTpNOcEyj3SPhPJBNF38Nsh7ghSyC4a8obeA3ODDUoFVlhxRqkLlVyJgPMDdys4lLtFNENc9/LZCGkadvep5J26U88fth+CK95nhOoW3/cQOqW/Nn10/xBbOZQulbROwWeHnnXLUi0DvpVK2ECxWWYkFqPp3j38Uo/KY4F4RN5srbmvIZZETQgHm7Cur6A7eVSatUuj/zzfWM/ubPwUFpF77tMpU7ROWJ3rDoY3Lkn3o8RKhjSx/SLxviE9U7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by PA4PR04MB7504.eurprd04.prod.outlook.com (2603:10a6:102:e6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Mon, 30 Jan
 2023 13:03:34 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::2191:53f7:4a90:c7cc]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::2191:53f7:4a90:c7cc%4]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 13:03:34 +0000
Message-ID: <74ff01d9-dc12-0c3c-932f-9ccde5370dda@suse.com>
Date:   Mon, 30 Jan 2023 14:03:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Cypress CDC ACM serial port not working correctly with
 autosuspend
To:     =?UTF-8?Q?Michael_La=c3=9f?= <bevan@bi-co.net>,
        linux-usb@vger.kernel.org
References: <8be9b56c6becd0981d1cd9c13742df6ba2975b56.camel@bi-co.net>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <8be9b56c6becd0981d1cd9c13742df6ba2975b56.camel@bi-co.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::16) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|PA4PR04MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: 40a3a4ed-7b07-455c-cd16-08db02c2647e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z3cwt/Oowqut8B+a2BTa96jS5lmnU6UGJwjXYqBkypEn7mKOnigvipu5ba5zoUQQ1EV8amUYypbxOO5x7P6M4kDZRmq4lIQDyO35j18uFR0aeEV3zmHOOih38kF4w7xlVYJGQv3U1ZvsCXkfYXxD6BL+XsrwpIiEP+rEddlIBF9XnR9wMGQkB8R9YGLbR8g/Wg5qhEa5WZmFCNdzIgGj30U1APd8kl/KNsHta2lv1J09+A/vIB2kvaWh+VsJERgUDEcMfXTalp8Nrd6nMrLd6W4o/PFiMYOTopbiRW3E9c3SXjSOCks/A6oj/x82P+GqJTljpf+jCjQ454r2Ht0AamtW7iqsBXHVSyMVGX6AaXoYm0qI5nq8pdiopVaIQX8rpDuxwQZV411/gs3p8qFPxhmjC57x2rMkhQcxYfAjpa0dKTgaE+HGFZKd0B+dtMz4eX8N3E7lyxDppQi7Ep5BsxceU35Yc0BemI7cdlxRysQFD7rH9jTONImPW9z2tT1yZGO9nWLMpITpI+Gkkm3iuP8VLa208iF3dBLDjrViHZYAQArmkBygHz0FhcAd4Oaky7gmvYA3xIGRPbqwFSiWJQFr2NjCWOlwOCZGBj+MI1obDvE+BcN9boDok8iYXFAAqmRQWg5niOVynD2w7vIKXmkeVsfmKCHBI2cBgKxdqDBVH0ITodRXMg3QWNYBOQF2rlUA2yccktUh68SdmwSzxFEU0w7x9VU0oELUhWdUaHM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(376002)(346002)(396003)(366004)(451199018)(66946007)(5660300002)(2616005)(31686004)(8676002)(66476007)(41300700001)(8936002)(186003)(316002)(6486002)(19627235002)(6506007)(36756003)(53546011)(66556008)(6666004)(478600001)(86362001)(38100700002)(6512007)(31696002)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTNDWUMzekZ4Nk1XbFFKdE1sSjVQSmI0ajgrcWZZRE1oWjZNcmw4V3VkcDl6?=
 =?utf-8?B?RUl0UUhVcVhmTG56ZFBiaDBBd2hCNEFLNjlxR3ExZ3pTYjB0YTd4N0JBNFFL?=
 =?utf-8?B?TG1VUERNR1NTYTFwNm56ajlBN1pKSzhqdXF2T1JGUTM5d3Y0WU1neWRmNnhX?=
 =?utf-8?B?bkY5dTg0UXZmRlV5a0EyVmxSTmc4c1VwblJmd1RWU1ZsVFVhbSt3NFcvd0tH?=
 =?utf-8?B?bFd1MDFCUXVaUTh2alVPWHJod2xmYURpSHdneTc4M1BhS0EvUG40cGI0L29h?=
 =?utf-8?B?NS8rNXZxMVdOMzlQRWt2R01oS3hadkdiMXpyaGRsbmNBSndtZGE2WDgzNU5v?=
 =?utf-8?B?eFRYS0owak9jeVR2L0sxa2l0LzhlNGNBMlBrWE1yU3BHOWlnaUh3aC9rQVdT?=
 =?utf-8?B?K1VpWUJhRzBVMjIrb0tNWnBTcFZQODNmOWE5azYzUHVpblpnL0ZGSlpDOWxW?=
 =?utf-8?B?RkFLYThodGJiS3h0eEs0WjQ2VGYzZlN1Rjk3bHloZlFoSWVKL1BHZ2ZZcXpv?=
 =?utf-8?B?TlBjU2xQRlRldnRsMXZpaUNkbkdyNmdjUW05a2F4MXo1UWhOSWwrK0grZWR1?=
 =?utf-8?B?eVdJK2ltejdKQzhPdndXYXBNNVVUZVJwNmgwRjJ0VFBrdWVIM3BNTWZlcmFL?=
 =?utf-8?B?dk1aRnFzY3E5dlU3NTVOUDlMZUVmR3NHNUN2Um9JYTRGWmxhcWFOTDhGMzl5?=
 =?utf-8?B?aFJSOVJsUTVWeHJDQmxCREhXMGpnV0V3VHQ2ZmM5QjlXa3BMZWZBZEQ0WVJu?=
 =?utf-8?B?dWsydExldUFrUlIvbTZBT05wQ2o0TFQ2MTJGK25YV3lTMnVmZ1FsUlpXTyti?=
 =?utf-8?B?aWd6T1I3Z3pLZ3pMZHk2SGFTY2thMVNKYmdTT203T0RWY3VaSVlpdHpoVlhU?=
 =?utf-8?B?RCtacHhPWUE4aVFwWTN5dWNPa0FDOC85cy9BSXYveWpQK1RrQmU1dHV0REpp?=
 =?utf-8?B?cTNCK1FsSU9XQ2Q4ZW5qVHozUHUwTGw1ZDRyS3cwaWJSS0o5TW1HSFNpZ0RJ?=
 =?utf-8?B?cmt2YXpsbzZ3bk1KRFo2Z1AvRWVJbFcwOGZFb1BsQ2ExQWlhT0JSTUxJVUM2?=
 =?utf-8?B?RldkNDFCb2ozV09nR3RKb1JiMldsNkdLQlQxV05rcFJuSzRtTXRYUEFxOHVW?=
 =?utf-8?B?eXFYdFJnVlhJaXN1M1A2UHMwSFhPWWhTYU1FU3NCRng4Szc2NlJIVDBTYlFy?=
 =?utf-8?B?eWl0d0NHaFU2WGZLa0FoVHNtd3JPNlN3Zmd3bng1N3o3Rk83YUgzWVRQZFZw?=
 =?utf-8?B?K1ZlamZaSVE3TzFZYVR1bzJVbWFmZmR0M211YnJPK2U0bFVObUJXZDVZaFd6?=
 =?utf-8?B?MXQ2SXlRQ1dDMWtqK0wxeHlib25FSm9wS2JrdElCQjVzZHZyT1A1VTFrTExJ?=
 =?utf-8?B?dmFwY29aclRMMGNFSUd3UVNNNTBjRklpcnJBeTV5M2kxZkVaN2llREJGT2FI?=
 =?utf-8?B?QUg2U2hrcW9vQmhSTGhUSzNlbktpb1pOT3EzdDQyUnJxbFduKzgyTUN4am41?=
 =?utf-8?B?UmhPNXZPNUx4bFJpME8rcVRhYWQ2KzlCZXVjSWZOWDcxQ1lGMkYzYWd3VlF3?=
 =?utf-8?B?Rk1VaWZ3V2NNWjdQVExaYUo4bk0rVjN6LzM2TDBHazQwQ3hmZGpJWjVvUnd2?=
 =?utf-8?B?MWxkK2t5UTAwVXJUeHVGZHJycndyZkZ6MGIzT2VBd0lPd2hpRldOd0Y1Mjdy?=
 =?utf-8?B?R29GS3YxV1pmMFU5cWxlVVJMV1NqeUkrR1UvblhaTzFwYk1QRFNvRmtzL2or?=
 =?utf-8?B?dzluYkQ3VGZMOEdZZVUzUmdaamFHMFp0cUREK1dPTHo1c0ZDNXl2cXFDUjlI?=
 =?utf-8?B?N3BiV1JMVGZvb3Fyam5KK2pTUjdEVUFaUFBmS1RBeEVqemRyVDZkZUYrZGpL?=
 =?utf-8?B?SlZMN2x3d1BySHE5RFl6R1pYbk9GajB2bUZ4OEVESExCWmMxUjlLcVgvS0t3?=
 =?utf-8?B?YWFLRnZJUmQ5UmloUFdPNzIwcmRMV3pXSDllZE11VzVsYU14d2RqTmJIRGhD?=
 =?utf-8?B?Qis5bmNITmJwR2E1dC9VYmNGU0dKNkNXNVVjT2dqaVZBRjdYNjdjMUpUcXdL?=
 =?utf-8?B?T3Voc1d4NGg4Q1E5UFRPR2ExZlhYdEtMM2VGVzhRZzVZYWkwQitkVzJydFVl?=
 =?utf-8?B?b3U4YU5jZ2RSekhnSFo1ODhSeDBiNEc1QVUwcGgxeWlmWmc1bjhpYWpzTm81?=
 =?utf-8?Q?87du/mfZ41FSniCcjG37PPbTlXCNadEoYN/3aUxBSmgq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a3a4ed-7b07-455c-cd16-08db02c2647e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 13:03:34.4123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nF0Yc1phqBibwz4rQjG6Mth/QeRDRxewcwlWt0NyzNCK9ZRJ1UAMk00sxd9Fmbz1oW4RL2xoTM2n5SFH+A+Z3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7504
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 29.01.23 12:44, Michael Laß wrote:

> Bus 006 Device 010: ID 04b4:0008 Cypress Semiconductor Corp. CDC ACM serial port
> Device Descriptor:
>    bLength                18
>    bDescriptorType         1
>    bcdUSB               2.00
>    bDeviceClass            2 Communications
>    bDeviceSubClass         0
>    bDeviceProtocol         0
>    bMaxPacketSize0         8
>    idVendor           0x04b4 Cypress Semiconductor Corp.
>    idProduct          0x0008 CDC ACM serial port
>    bcdDevice            0.00
>    iManufacturer           1 2012 Cypress Semiconductor
>    iProduct                2 Cypress-USB2UART-Ver1.0G
>    iSerial                 4 827211C2091B
>    bNumConfigurations      1
>    Configuration Descriptor:
>      bLength                 9
>      bDescriptorType         2
>      wTotalLength       0x0043
>      bNumInterfaces          2
>      bConfigurationValue     1
>      iConfiguration          3 USB-UART Configuration
>      bmAttributes         0xa0
>        (Bus Powered)
>        Remote Wakeup

The device claims to support remote wakeup.

There are two possibilities here
1. The kernel fails to order remote wakeup to be enabled
2. The device's claim to support it is false.

What is to be done depends on which possibility is true.
Can you check an usbmon trace of the problem happening
for the control request enabling remote wakeup?

	Regards
		Oliver
