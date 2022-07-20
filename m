Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 835D257B521
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jul 2022 13:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbiGTLNR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jul 2022 07:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiGTLNP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jul 2022 07:13:15 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80050.outbound.protection.outlook.com [40.107.8.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0BF550EA
        for <linux-usb@vger.kernel.org>; Wed, 20 Jul 2022 04:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nf7Q72wnsmGM66RdbjDSHJpu7LSlBSMg81/8Y+hNBkLYP7iK2RkYGWrS9x5VXd0Jk6xn4CnMSncfTBYZAuU7tqDIW4aUW9eyA6+sWQ/IoakfmC1c2JFWv39WArxZNNxZOhkMn7SF5m2OYJI1O03bKo4RkY5X6n+XNvdASVhSPTjUN4WKdORXTs0kJ6KLHrv0pnZrMjVtBV8jiwa3t+9rzPS20PRJyUiCIzzjeRR8H287bLNyNxRkkHzCjNdFr/VXoWpihlZD/bp9BKf67VjApdxw0f4m8jXtao2gUnhvcYivAyrU1k05k5noIbVAnYoPCrCg8RkgQop6hm1oHxsGGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2c+DG/eBAP2cH6oHuAcwLgj4aCZ5Zy0StPGX9ShIeo=;
 b=XP7qS+nCVm9jd3oCGEQ8BDCDZuwrtcL06621KYI3YyhTUwMBRNlFjt7GkE53diG6KkipMzFdWZXRQgB/SxiF8GJm6XGcgxa+q4AWIjVWPbwgRj0tz7ZIJaLqOdFAfjdMaUQWInSvrK0vzMxgt8+9X7mUNFbfrYPqu4TPzKEIuHwHvyy9KRWu7ISn5IvGCSozCaedACcPM9Tb9Jtxr1uuer6q4/Ua3Ra9HwxD05sgA+u821uY8IKnr7IZwOf7qBq3lQiDpBnkIUTM8M+XdWlslj22+DS94axiwqUWPKY/FGPJaLZ13XiLlAV5tsf5WoVvenXBWDCZRdSu+OD2a6LGPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2c+DG/eBAP2cH6oHuAcwLgj4aCZ5Zy0StPGX9ShIeo=;
 b=VbfilSnSYvaTmwkP97ksg5RyYWHsBBggTJvmX+MDa+j0I6qaYkdJUKQ/xz5YHAQxiE0X+e8Xzudh7soXRxyr7AYB0XcYcTi6ds4m2dRJnaROPvPg84LW3fDwRnOSERlaTUPLgaCshYIfyrUamI0ybdYYw1iF/DY1yZeojgY5TFGI5jZhyPc8SDMxcl+KxOh/jky5BDAz5TL8tznxY0ZIzIQKdfQQtbA4Gu8eBQ17udsfYkvheng7ZH9+ephMfws3WzYk7kf6ISa6mEglMXxo2xdfezq1ag27z8ztyQ7NblfeHdsDFpypNdJX1CXZkoZSLjvx80Gh6wz5DJwYUbHbQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by HE1PR04MB3019.eurprd04.prod.outlook.com
 (2603:10a6:7:1d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Wed, 20 Jul
 2022 11:13:00 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::21d5:a855:6e65:cf5d]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::21d5:a855:6e65:cf5d%12]) with mapi id 15.20.5458.018; Wed, 20 Jul
 2022 11:13:00 +0000
Content-Type: multipart/mixed; boundary="------------yyDbxS0iMmVKPApiL49xIHky"
Message-ID: <bd2f1259-3cbb-fdb8-dded-ff2e99139a3f@suse.com>
Date:   Wed, 20 Jul 2022 13:12:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: serial: usb: cdc-acm: OMRON B5L ToF, device probe failed
Content-Language: en-US
To:     Chris Ruehl <chris.ruehl@gtsys.com.hk>,
        Oliver Neukum <oneukum@suse.com>,
        "michael.lee@omron.com" <michael.lee@omron.com>,
        Lars Melin <larsm17@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
References: <85ebf554-effd-c89e-6eb8-c149442b931c@gtsys.com.hk>
 <fc9986a6-0b11-d949-2196-1ad35d3f4d98@gtsys.com.hk>
 <1af7ff05-8558-9162-a0cd-ac140ddaf2e1@gmail.com>
 <cbcc2071-5b56-025e-cae6-5af0210e2363@gtsys.com.hk>
 <OSZP286MB1776CCBCBFE38B25C7DB9978E1B39@OSZP286MB1776.JPNP286.PROD.OUTLOOK.COM>
 <40395457-0927-c169-7d9f-47d1912e2c39@suse.com>
 <f3aaf9e8-07c7-2c50-48c3-723c51f9445a@gtsys.com.hk>
 <dc9f9c31-b72d-0895-544a-13764538d991@suse.com>
 <3194ea30-34da-3d34-6d4a-08dc7c8d683a@gtsys.com.hk>
 <4f4977bf-6096-592c-9c06-44aacb82ccd7@gtsys.com.hk>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <4f4977bf-6096-592c-9c06-44aacb82ccd7@gtsys.com.hk>
X-ClientProxiedBy: FR3P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::14) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b6984c0-3cf2-4c57-b9b2-08da6a40ce71
X-MS-TrafficTypeDiagnostic: HE1PR04MB3019:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /90+jb1uWAY7wKL7/f8gPFr9tmX0uQpLPvZb80bbs4NQPvPMQ0JRcdD5U7nxJWOamE744YrHjQFxt0X4/wleThSay3bYGziXeBo3CppEIynZ1/SbO8U0bWk1m2n+/6ROwNV7PB3gGsABRUN8T5iGUs6f3BN3qy59f6KTBG2/1ibGuWbCD/W+0fo5ANFgBwxrg8TU+Pmthj6F7qTAD6tjR5HeVEo1q6z3HmLeRWt9b8wIKP3f8505Ynb2gZg/PhnJxm5v6cCi3AvL6x0EnheYB9A/R81AiMfZW/3mYpHn/qE6FhB9AQREbXIvPU1BfnV77KEjg2Lj5znMgXJ/jdE0Whe/C6+v4sMTk9vQGQQZFQaQj06h/F30VUMCdFYWm6ul0JWPN1HETlXLaSywQ4H4v85o6IoSsLQaPnXiUutE5oeph23VgELBwd/Tjvaa8hbrukTUVd6BUSkPV4wzGfI7uCohHLWD+jueh9DEWiXouO+v71i4x5F7ocW7aj88yMjAHRETph2dAl00+uVrT1042fF/N06KrbWuk58APrj4lloYFtRzIFfPGO5qDNZIIBPZ4JT9UNATbFXWkGrqahad/a+0DSMAUDbo3eGWi5G6E65JM2pBZGI3m2MUBwtkYhdW+VFlXJcJKsEkC7nYac1l4apw1YHweK7h1oRxPBvuYAugI03UqdtedXzeSr4IYCZLVe3EkAlUKSKRw4XnwDEyLvRiKdx2EWxLR8+uQ5q7SXL/oMGqWsw7SAegvexEt/2yMbH904icgTdu3WZ6loKXMiIC3IS+pEClb0abZVAz8jGX4JkXL0hNE26gba+VCOKKLfjmLTWKygi1enyrFi5frw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(366004)(346002)(376002)(396003)(564344004)(316002)(31686004)(110136005)(6506007)(36756003)(38100700002)(41300700001)(66476007)(33964004)(66556008)(66946007)(2616005)(8676002)(186003)(2906002)(5660300002)(8936002)(53546011)(6486002)(478600001)(31696002)(6512007)(86362001)(235185007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djY5SXpCdHMrMnVQSHhNWUwvM2ZhN3R6cDQwZUkzMzZEVjRLVWNTNkR1bmRR?=
 =?utf-8?B?RlpueURnUVZadHcxa1N2ZnU4bmRFeUVsOUIvYmdNMkRiZWJwd0VOOVltTFps?=
 =?utf-8?B?WnRmamRHWDMyKzN3d0NPc1ZwRWl6Wjk1dVNBV3lEbHJjRUh6STdJcHJuVFZv?=
 =?utf-8?B?NERFZHV2N2FIL2JsVUtIZWxDZlBFZzdubEFQL0dqalJkUjYwNjBVNlNqNkU4?=
 =?utf-8?B?ODJPNXVoczgrTytrRlFYZklMT1p5Mlp2ZmszbDUyWWdkd3gyV1B3citNTWpF?=
 =?utf-8?B?cmFoaDZFeGRjazVVSGorQTNDMnZzMUtkNzB3UTk1TWVxQjI5ZXl1U2dZUE1G?=
 =?utf-8?B?WnJJcUk5WWRHMElBNGZjWkpQb0pHTS94Y2VwbXY3SnRNR0cvUW5yN3NZdTVJ?=
 =?utf-8?B?ejVSOS9jNmNRSDh5ZEx4aWFGYWZiRk5pMk5qSVBGcU1yNEh6TnNzMFNwYkFP?=
 =?utf-8?B?Q2lyOStHWlpxVEEwTzgyUzRhWklqVDRlTUpKNmQ1SVZ3eFU5Z05XTll6WTIx?=
 =?utf-8?B?OXA4UkdoaGFPak1rTVRUYWRBLyt2VlpOdmQ0VWN3S1V1MldvS2FPTUE5V0pO?=
 =?utf-8?B?OFNZS3FySStKSS9taHBmYW5TVnBqZ0krQVdoM3cwVXZEdUNlb2REaktmdWlJ?=
 =?utf-8?B?ZU9neGl1NUpjWGZ0dExUbnZieWg0VERNZGMvbkEvdFVIV283R0gxNHJtdE1i?=
 =?utf-8?B?d2M5KytjYmVabXllK3VLUlhZOEJsVlR1endXYTZoRXFzam1FNll3SmZkU1pa?=
 =?utf-8?B?Z2djUHdwQzNoV1JlbDJkazFXaUNFMVdRelNuQlVIMjdpTlBvVXpVWUVRTFQy?=
 =?utf-8?B?d3NDY1Zubjhja2VoMzJuTzVPbnRZVlMyOHg1Z3pkU2dkRDZ1akhnRmZzQU1R?=
 =?utf-8?B?NUdkYThUT2RLaGZJZkJsN2trcDFjU0lHL2tJb2xJQkMwdERDQUtKMHJvOFo2?=
 =?utf-8?B?NlR4bEc2OVV5dVN6eE9iYjhYRDJrMFh4ZkRLZ0FJdjF0OVIrSm1zbUMxN1hC?=
 =?utf-8?B?UU1PU0VJUHlJQWRwMXcvTExlWW1Mc0pXSVV3T1E1MXRlRmJMVW5aSGZ4SXlG?=
 =?utf-8?B?N01Za002VzVUc1J4c2dqZHFhUTVmbjVxZWMzdFFRem5TRmlaN0RpUC9wT3l3?=
 =?utf-8?B?cnRieFhMY3lVSEQ1Rk1sandwdnczOHVDcWlYWlJVK25tNHF2V3hNVjZ1Vitq?=
 =?utf-8?B?NWZiRERVOEZFR3hiUXlwb21TVmtiQlBxdnJCQ2s2NU1MeXlVV1dHbjRiek9F?=
 =?utf-8?B?YXJON2RYZ3RxTHYwTCtJR1RPZUxTK2VrTWRBYXlYbmNDRkk4YXYwdHJXZ002?=
 =?utf-8?B?K050aXpNY0JrQmJiNnE4TTZwUmloZE5TZHArWHBod042S1R2VTdsN21QVHpR?=
 =?utf-8?B?Z3RYUXZFLzhCOWpZWmZ1QzVlSTg0OVBBTVNuYlQzRzBwTTZieHRCZFhzS0NZ?=
 =?utf-8?B?d3RNV05yNC9Xc0JQODlxbGtDQTNxR1FEUmRUQWIwaTJtWU1VVmJVK3lSQU40?=
 =?utf-8?B?ZFozNDVIY0xuQTZHSis2c0lVOXRmLzBWYllaNld0cVBCdHhmV2VjZXIyUnA2?=
 =?utf-8?B?M1pjWWREc1JXdVprTTZweFRoUTFoVFhxZ1pUaEdGMlhhd3ZSUmJnTXYwdk5q?=
 =?utf-8?B?R3hUWU8wTzZ2TDVtQUVMTXB6aEFUN1NQTU1oL0wxNmNpbFJNckhGZ1BtZWFE?=
 =?utf-8?B?OVl1bU4zV0srN24wTXFZZzFsZ2Z4ekY2L21ENlFXQytuUUw1UWRrTEI2VG5E?=
 =?utf-8?B?SDdHd0J5NjB2d2N6VDVjK2xxSVVEbWEwc3V4RUhCRmZDc3VDYUordms3TmVa?=
 =?utf-8?B?ZjhqelZSN0VHS2NPL1h3aVI4ajBXd24xNll3UGxURk5kaW93K1ZyYXR4SDc5?=
 =?utf-8?B?NFBiaTRGZkRCZ29hQ3U3MWJTR2hnaHpTYldTMHZiOVNOYjlOSmMrV0QySDJx?=
 =?utf-8?B?dGhDZWl1MjNNWCtKOXBjeGpzK2YzbnJ1YVI1c2NsTTRQekFjK1NqeHpaSGZH?=
 =?utf-8?B?STgvK3UrWkEyR21pV1d1S1IrM2ppMnRndjN6RUNxdHlYcE5HS2VBTmp5dUM3?=
 =?utf-8?B?Z2o0U2oycngyL1I5UEdpZFFDRWNCVmFEYzFOWlhvK092d1R3elIrY0ZUSGZJ?=
 =?utf-8?B?aVF4ZmFQc1paQVhYOWxvYmVKdmNHVnI0UXc2SXcwbWU1RGR3Z1ZpV3JZeDF0?=
 =?utf-8?Q?KQI1pwX/SN8bksX3tl5kFpYvUPTz942DAvtl6UmqEPtC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6984c0-3cf2-4c57-b9b2-08da6a40ce71
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 11:13:00.5200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAsWe92Xtng3qeolt3XjOtjqOapASYqEocFIimILpri4fz+szYwYKbZrUYTnh8MQYZjnswYebkdZt6nLfkKI6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3019
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------yyDbxS0iMmVKPApiL49xIHky
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 23.06.22 10:55, Chris Ruehl wrote:

> Apply the patch ,
> still no /dev/ttyACM0 comes up.

Hi,

I am a stupid fool who cannot tell apart "&&" and "||"
Plesae test the attached patch.

	Regards
		Oliver

--------------yyDbxS0iMmVKPApiL49xIHky
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-cdc-acm-adding-a-special-case-for-OMRON-device.patch"
Content-Disposition: attachment;
 filename*0="0001-cdc-acm-adding-a-special-case-for-OMRON-device.patch"
Content-Transfer-Encoding: base64

RnJvbSBjY2Y2YTg2NTRiYzUwM2Q5ZTFjZDc1ZjAzOGY0YzRjNjE1NDcxNmUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBUaHUsIDIzIEp1biAyMDIyIDEwOjIyOjQ3ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gY2RjLWFj
bTogYWRkaW5nIGEgc3BlY2lhbCBjYXNlIGZvciBPTVJPTiBkZXZpY2UKClRoaXMgZGV2aWNlIGhh
cyBhIGNvbGxhcHNlZCBpbnRlcmZhY2Ugd2l0aCBhIG15c3RlcmlvdXMKZm91cnRoIGVuZHBvaW50
LiBXZSBpZ25vcmUgdGhhdCBlbmRwb2ludC4KClNpZ25lZC1vZmYtYnk6IE9saXZlciBOZXVrdW0g
PG9uZXVrdW1Ac3VzZS5jb20+Ci0tLQogZHJpdmVycy91c2IvY2xhc3MvY2RjLWFjbS5jIHwgNyAr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY2xhc3MvY2RjLWFjbS5jIGIvZHJpdmVycy91c2IvY2xh
c3MvY2RjLWFjbS5jCmluZGV4IGZlZGYzMDY1NjcwZS4uMTQ5OTAyZTMwMWQ4IDEwMDY0NAotLS0g
YS9kcml2ZXJzL3VzYi9jbGFzcy9jZGMtYWNtLmMKKysrIGIvZHJpdmVycy91c2IvY2xhc3MvY2Rj
LWFjbS5jCkBAIC0xMjE1LDcgKzEyMTUsMTIgQEAgc3RhdGljIGludCBhY21fcHJvYmUoc3RydWN0
IHVzYl9pbnRlcmZhY2UgKmludGYsCiAJCWNhbGxfaW50Zl9udW0gPSBjbWdtZC0+YkRhdGFJbnRl
cmZhY2U7CiAKIAlpZiAoIXVuaW9uX2hlYWRlcikgewotCQlpZiAoaW50Zi0+Y3VyX2FsdHNldHRp
bmctPmRlc2MuYk51bUVuZHBvaW50cyA9PSAzKSB7CisJCWlmIChpbnRmLT5jdXJfYWx0c2V0dGlu
Zy0+ZGVzYy5iTnVtRW5kcG9pbnRzID09IDMgfHwgCisJCQkJLyoKKwkJCQkgKiBhbiBvZGQgZGV2
aWNlIGZyb20gT01ST04gaGFzIGEgbXlzdGVyaW91cworCQkJCSAqIHVubmVjZXNzYXJ5IGZvdXJ0
aCBlbmRwb2ludAorCQkJCSAqLworCQkJCWludGYtPmN1cl9hbHRzZXR0aW5nLT5kZXNjLmJOdW1F
bmRwb2ludHMgPT0gNCkgewogCQkJZGV2X2RiZygmaW50Zi0+ZGV2LCAiTm8gdW5pb24gZGVzY3Jp
cHRvciwgYXNzdW1pbmcgc2luZ2xlIGludGVyZmFjZVxuIik7CiAJCQljb21iaW5lZF9pbnRlcmZh
Y2VzID0gMTsKIAkJCWNvbnRyb2xfaW50ZXJmYWNlID0gZGF0YV9pbnRlcmZhY2UgPSBpbnRmOwot
LSAKMi4zNS4zCgo=

--------------yyDbxS0iMmVKPApiL49xIHky--
