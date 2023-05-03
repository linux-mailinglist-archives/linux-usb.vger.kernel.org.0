Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB4A76F5743
	for <lists+linux-usb@lfdr.de>; Wed,  3 May 2023 13:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjECLhx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 May 2023 07:37:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjECLhw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 May 2023 07:37:52 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2069.outbound.protection.outlook.com [40.107.105.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A9C23C01
        for <linux-usb@vger.kernel.org>; Wed,  3 May 2023 04:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FArSevIelH8WHY4DbQsF/M6X4TrxCiVSsYpPTIiu2ayKBfHxhkLB+se5eUqnZzxdAcA7SBNdIxE2hzucqmFPqSPvn+jyxcwYYO4HVTAkHBl0/hOoILupP3KXpjZVY7yabE6/HVeZt8i5lVFB93+iD2iQ6TuQ85+aq504oMFsFiXuAhBA+HKWmcOfukfFhkLLaDlVhMJ9kI6vNW1lwi7swjceaP9gC6f+HrY8pTOuyHUTAloCxxtVcKCco91VL51S0j0OBIQB7MJAo5+L4p4/R8cgc1tsetYjdeg2fysA7t+Y8Kxmy1kEtzaifXHgo/3Mt68yrGNYAZ8tmgBFZBtILA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MV5BdT+gQfl+CBRN+V0DFFtFeFTPnnyfTySwJ7a+3s=;
 b=e3CW6tva92qT6w+ka6i4/eP884eGQq7SseT7H4HR7PPCXTknM7d/0eeRwNCZYFEecJaNmXgfwDs/s49C+Qbi1Uc+FfSQHrURreT2K/93/TDH86sH4lcIw9r9enNzz9AX8rd8fvjL0b6E/J6PCtRbGoMISlE2CeSSm60DwK1FmHJD7TVtqi4yOMm9kaCGwFPfonbp/kdK3t6fw5EdOqqJdls8h0ZJo4cF+qJ+aawZMdY0y42+1JBR2K39n0wmjqMl3l0wdM/+NpqUF9DyZ7WwmpvXyvuRu2QXRBdsLYbCLYZ9PoXZUBQptvSpHJlcDmhsjpASx6a3F3LDWco/s+rNTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MV5BdT+gQfl+CBRN+V0DFFtFeFTPnnyfTySwJ7a+3s=;
 b=w68t1UaPPXJduniPBmDKXuY0yQ+RDTs6akA50Hz3Iw2WLVojvNgnT6zSNUjBD+S9pLZjWSkfJWa1z+IuZPwxzSCpXF00ldZ/wFYFihaFDn3f7FBN4uEdCwcnhI5FU1U9J9BF+85xZjieKbwi/y8m9yhRUNG7BScHB1tG7VCRWqF9o9u8uV1H7iexUcleO+zRR1OrzTsl5Ms8Xt56WMm+DwQmbyh0y0cQQ83RbtLqZDAShT6UKUO/DIlJsz3BRrBny9e0tK0e5vTzEUuWzBBi0EVn088/om9oQEXXDmZ8FesiCa+VUm/zA8XGNsgYZgeKSdCwQpTQkZ+YFYETHBmNFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by DUZPR04MB10061.eurprd04.prod.outlook.com (2603:10a6:10:4df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 11:37:48 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::6c14:307b:6fd3:3bfc]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::6c14:307b:6fd3:3bfc%7]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 11:37:48 +0000
Content-Type: multipart/mixed; boundary="------------F2Wa00YspVWTBlEOxkDS8To5"
Message-ID: <02366b3d-0dcf-2e13-579f-3da3726175f6@suse.com>
Date:   Wed, 3 May 2023 13:37:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: USB driver assignment request
Content-Language: en-US
To:     info@kaufmann-automotive.ch, linux-usb@vger.kernel.org
References: <40a1a3f4-46bf-1f3d-34a4-ff5c6f67dbaa@kaufmann-automotive.ch>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <40a1a3f4-46bf-1f3d-34a4-ff5c6f67dbaa@kaufmann-automotive.ch>
X-ClientProxiedBy: FR2P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::14) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|DUZPR04MB10061:EE_
X-MS-Office365-Filtering-Correlation-Id: e35b2158-ff99-4d7f-d418-08db4bcad197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HUWAXgRAH9kEr1pcC/lKCzr0s/a3C6g/7nCO+B8W+PyrIAX50Q85pY+eREn2jDfprmI9cMS+jH6O/ez4RDbjg/jSe9QD94VxcUosPwGSm7fqItV4CJjrZ+WVdjMzz10gzmXwR5iseSwQ2IPbcQnP79n+mQNDf/Ki+DLlxo2SeiKXaF15J+TkQvNgw71tnNySH+41KxpkXqGRXDkJGHdma9MOWe15CMDLI4Mq1Tw1xeq68AnCYJTXiAveVk9t2RCyB9nw7N8CnfESz5idFulkF4QfMO89nCj+YsMQNpHIIsbe5FyV341YOGMWQfkLXpbc+dHpuatDABaBcUs7zpP4J2HoC7E1gpCsOOIsbwPb+KU7tYm7Jj3J87Mh0eJVi13KEu7hrC+tBgcFmz7FJgn+Qg0heH3erR4dc3vpV7PyOWUQKenki8+Wawzo6r5YT8XXA7HNkAr4WZnG4lqhDJ30uWyN1Mumhun41CXTfZRwr3lWmxuB8/Y1Ab9pxwkNrVvXiYUSru56oVygEQZtYvDW/g5H7GpiZAmsTssu19EFqzbMhfvgV2H+3DU0bEJQhyrVrb1mK7wavfKIAwzlUn9Jo2QGayq+5EPBHmmWkYyWz5U+3okYOP7cz3dZfuL9zyEGAikVMG7EB68j95e2GcYirQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(39860400002)(136003)(346002)(366004)(451199021)(6506007)(83380400001)(53546011)(2616005)(6512007)(186003)(2906002)(3480700007)(478600001)(41300700001)(66476007)(66556008)(316002)(6666004)(66946007)(6486002)(235185007)(5660300002)(33964004)(8676002)(8936002)(38100700002)(86362001)(31696002)(564344004)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1hYNlNCazVPWDVmejZqY3orL1QzRXcyYno0Y01USkNHbGNWeWdnRVluZEE1?=
 =?utf-8?B?QmkvaEFjUE0zUzFtRnlPTXRXUlh1Q1ExaEo3VXJybHN2djNtaHZpMlpnT2Ri?=
 =?utf-8?B?VjFwVVQ2ZldDcmZ6TXdCUXRBR0MvQkFaQmRFK2U4LysydVhrenUvMHV3Nlhi?=
 =?utf-8?B?VG1DSlBubVRQcGQzeUlvQkJmSnJxN1NyVktWOUtTOENhejBnTmIraSsrRzFS?=
 =?utf-8?B?WVNKWTdFQ3VCMi9PK1UyV0xlUGowL3R6cm1JdlNremJFVUNzVWJYZUJKWFE1?=
 =?utf-8?B?SVg0WGZESXpubGxJcXB3dUpFa0NyL1RBcG50bmo4T3haTWFJU09JcXQwQUcr?=
 =?utf-8?B?MjJseERNRHc4RHRzM0ZwRmZJMmtTMkRZQm9YUEpJbU1xTHRBSjBHejJrOGx3?=
 =?utf-8?B?QUdXZGVQSXBzWFN2czdwMlZrYndUcFN5YTJwS3FnTGV5MmtBWlJpeDhHLzJQ?=
 =?utf-8?B?R1NLUmM2aHpaanU2QU5CMUNkVktWcWVEbVdSdzBhVHRhSzJhTzVrM3YxTGtr?=
 =?utf-8?B?cGZPQmJFZ1BjbmRmVmFVRmZuZ3N4Q1Vtb3BiV2N3OExWVXB4d2FuMDRKRlhI?=
 =?utf-8?B?VzVoMDBvQ1NGOUNKd0Y4dW1mOHJhemFKRUV6RU90Tk4zOUFCRzI2MWZsUTRE?=
 =?utf-8?B?aGJUZ3ZwaVBhR0lLdk5BV1Blbk9YLzEzRHhoVUFYWGM3ZXYwNk11d3JKTUtD?=
 =?utf-8?B?SWNSclFpYUtsYkVBR2RERjhyaHlEd2MvRFg5SnZZb290bUFLTldpYVpCOExS?=
 =?utf-8?B?aEREZXgzRFV1RHZrZVg0SWJnVy81dFNUNzl3dWxIak8xa2c1Q1hWS3p1eDRE?=
 =?utf-8?B?cWdvNzI5dWVLczhSM0htRkljUzJVRTBtZitDT3BEbXNUVGx4QU9vSnhGRVIx?=
 =?utf-8?B?Q0ZTQkVXNEJKUjhQd3hBaUVnN2tOa2RMTFJ4S09JMDE5ekd4UmdscFE2ZTJq?=
 =?utf-8?B?Ui8zbk9rYXFxa0YxaGh6WFFFa0RRdFNaZlE5UWZRcXZIZXdYNHVRVmNSZCsw?=
 =?utf-8?B?SDgvcmVPbFZPa3dyaXluWlRNOW9Ob0dUaVl5YkhSeGZGL2tpRFVhRllUQVR1?=
 =?utf-8?B?NHU1ZCtHSjVidEtvaWwrRS9MaWNOTC9QZ1ZpVll5MXV5UFB0YjZ4ZVUvN3h3?=
 =?utf-8?B?NnAzM0gwVXhmT3M2SHhCZXVFT0Fsa1JqRUlHVkRWdUMycGs4TmcrNjFiNU5B?=
 =?utf-8?B?MWIyTjMvNzQwY3c1aTZNTFhLckYyV2Z1Z1I5dDBtOGtmUWwxYjloQmFyVFVt?=
 =?utf-8?B?Nnl4SHRCOG1weHQxdWlqWkRxY0hQVCtGTzF4SWZBN0RhVU5hNkRJTGdWMzZN?=
 =?utf-8?B?UkxjaGh4RWNPR2hRaENaQ2JZWEMyak1jTGRCV2NLV1U5NlpBVndVVzlrMzNM?=
 =?utf-8?B?aFlEaUZqWnVIQTA4R2Z5ZGVtdmh3VUNRK0liZmpWUE5xNGNTV3J5R2Y1ZGZQ?=
 =?utf-8?B?bEdZU3hXUU9QWjZocUtHY1hXUnZkK09DWTVIcnBFSG15ckk3QUpLS1BsMTVL?=
 =?utf-8?B?VVNJZGVIbHJFek1CZnZDRE02SkpzVE1pdktPZEVWclpvWlJIMUo5SHFVdnhk?=
 =?utf-8?B?RTNLaHNTOERQQUgvdGd6ZWNQRFdYcldlYk1yWXIvbUNHb20yem1pM001enU4?=
 =?utf-8?B?ekZJMXFwSVhMN2FaU1NLdTI4aStSQnBQM29iU1BHWG1MUUxYNDd1S3RmcW12?=
 =?utf-8?B?eCtUUWcyYUZUZklxMWM0cHdhbmFIM3g4eWZvN0JFM0o1OENBeGRKU1NFQitu?=
 =?utf-8?B?WFVXY1JBME1laEk3Mm1XTXpTZEcwZEdDQldrZlRGWlBiUVg2UkMzczZSVUZS?=
 =?utf-8?B?bnRadktDVXRNSng5Zktrdi8zMUhWUk56RXdOdy9HQTI1VkVxWFZLaytmNnFC?=
 =?utf-8?B?MXhzTU5vR3pneHl4a2o1UWZET3lKdWVpNERPcUY0RmJpUytSb1BzdEdLTk9O?=
 =?utf-8?B?cHlIZHhaak5oNmhHTURVc3R5OVhCSzlETWhEaGhWc3Fkemt6RHZXRkV3SCtB?=
 =?utf-8?B?NVFDR3NncXdGeTJDYVc0ejRLejdCS3V1WHlQV2daNStOdW5vOHRQRWt1YnYw?=
 =?utf-8?B?M1BkVnpibVp6ZlBYaVY4b2srYXBuMFlOYklmZ1c5VmhiSml4V0JXK2kySkdZ?=
 =?utf-8?B?U0xlUmlRdXNaOHlzM0lZOS9RV2YrODNqSktreVc5R3FHOWYxK3QvaWR2a3Vx?=
 =?utf-8?Q?zG11s6iMefUjCIRo9C5lGOPvuqsgAaH3ke5d0OeWB0l/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e35b2158-ff99-4d7f-d418-08db4bcad197
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 11:37:48.0735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BbsC/jHjpoFckncnJmrouRRhVwpC2ITx6xSGt5uxehl7o2bb3NidNd8a0Q8jZMeCgfl047mjGUO4iPJHikmnGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10061
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DEAR_SOMETHING,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------F2Wa00YspVWTBlEOxkDS8To5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02.05.23 23:43, Kaufmann Automotive GmbH wrote:
> Dear sirs and madams,

> 
> please assign idVendor=16d0, idProduct=0870 to be used as virtual serial port.

Hi,

please test the attached patch.

	Regards
		Oliver

--------------F2Wa00YspVWTBlEOxkDS8To5
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-USB-serial-simple-adding-Kaufmann-RKS-CAN-VCP.patch"
Content-Disposition: attachment;
 filename="0001-USB-serial-simple-adding-Kaufmann-RKS-CAN-VCP.patch"
Content-Transfer-Encoding: base64

RnJvbSAxYmI4Njk1OWI2Njk3NjhlMmRjNjkxZWU4NGFiMWU0NDJmNTZmODI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBXZWQsIDMgTWF5IDIwMjMgMTM6MzQ6NDcgKzAyMDAKU3ViamVjdDogW1BBVENIXSBVU0I6IHNl
cmlhbC1zaW1wbGU6IGFkZGluZyBLYXVmbWFubiBSS1MrQ0FOIFZDUAoKQWRkaW5nIHRoZSBkZXZp
Y2UgYW5kIHByb2R1Y3QgSUQKClJlcG9ydGVkLWJ5OiBLYXVmbWFubiBBdXRvbW90aXZlIEdtYkgg
PGluZm9Aa2F1Zm1hbm4tYXV0b21vdGl2ZS5jaD4KU2lnbmVkLW9mZi1ieTogT2xpdmVyIE5ldWt1
bSA8b25ldWt1bUBzdXNlLmNvbT4KLS0tCiBkcml2ZXJzL3VzYi9zZXJpYWwvdXNiLXNlcmlhbC1z
aW1wbGUuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3NlcmlhbC91c2Itc2VyaWFsLXNpbXBsZS5jIGIvZHJpdmVy
cy91c2Ivc2VyaWFsL3VzYi1zZXJpYWwtc2ltcGxlLmMKaW5kZXggNGM2NzQ3ODg5YTE5Li4zNjEy
MDMxMDMwYmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL3NlcmlhbC91c2Itc2VyaWFsLXNpbXBs
ZS5jCisrKyBiL2RyaXZlcnMvdXNiL3NlcmlhbC91c2Itc2VyaWFsLXNpbXBsZS5jCkBAIC0xMTcs
NiArMTE3LDExIEBAIERFVklDRShzdXVudG8sIFNVVU5UT19JRFMpOwogCXsgVVNCX0RFVklDRSgw
eDkwOCwgMHgwMDA0KSB9CiBERVZJQ0Uoc2llbWVuc19tcGksIFNJRU1FTlNfSURTKTsKIAorLyog
S0FVRk1BTk4gUktTK0NBTiBWQ1AgKi8KKyNkZWZpbmUgS0FVRk1BTk5fSURTKCkJCQlcCisJeyBV
U0JfREVWSUNFKDB4MTZkMCwgMHgwODcwKSB9CitERVZJQ0Uoa2F1Zm1hbm4sIEtBVUZNQU5OX0lE
Uyk7CisKIC8qIEFsbCBvZiB0aGUgYWJvdmUgc3RydWN0dXJlcyBtdXNoZWQgaW50byB0d28gbGlz
dHMgKi8KIHN0YXRpYyBzdHJ1Y3QgdXNiX3NlcmlhbF9kcml2ZXIgKiBjb25zdCBzZXJpYWxfZHJp
dmVyc1tdID0gewogCSZjYXJlbGlua19kZXZpY2UsCkBAIC0xMzMsNiArMTM4LDcgQEAgc3RhdGlj
IHN0cnVjdCB1c2Jfc2VyaWFsX2RyaXZlciAqIGNvbnN0IHNlcmlhbF9kcml2ZXJzW10gPSB7CiAJ
JmhwNHhfZGV2aWNlLAogCSZzdXVudG9fZGV2aWNlLAogCSZzaWVtZW5zX21waV9kZXZpY2UsCisJ
JmthdWZtYW5uX2RldmljZSwKIAlOVUxMCiB9OwogCkBAIC0xNTEsNiArMTU3LDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCB1c2JfZGV2aWNlX2lkIGlkX3RhYmxlW10gPSB7CiAJSFA0WF9JRFMoKSwK
IAlTVVVOVE9fSURTKCksCiAJU0lFTUVOU19JRFMoKSwKKwlLQVVGTUFOTl9JRFMoKSwKIAl7IH0s
CiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRSh1c2IsIGlkX3RhYmxlKTsKLS0gCjIuNDAuMQoK

--------------F2Wa00YspVWTBlEOxkDS8To5--
