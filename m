Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9FDC7260B4
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jun 2023 15:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240445AbjFGNKi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jun 2023 09:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240429AbjFGNKc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jun 2023 09:10:32 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2043.outbound.protection.outlook.com [40.107.15.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DED991FD5
        for <linux-usb@vger.kernel.org>; Wed,  7 Jun 2023 06:10:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUPVuV2kbYdCfNsvPEk0Uk6uFcH6eYacKkGhTXWm2g0n9dg6sWtVdJexhUifQe5+LCFjkrDCSSYROskykkgNNylNnN2QJ51EtFGONpkYHhCdYTTnFjK+nJAUhIJftT/s1AcX7NnLJV4b587ogiahP+K3wYibbFcbm/JGvrJuHX9n5XEJ53NEpZ+/cr5IWF5nx8xggz8RZnqzY/9a+EFrVw1u3AsVABLcbHSXMIM/6wjdl6O5FqWd6hKzh9uco1m8tvZ0QfUnvkN5oo61d+jFTa7kjzTK0sX0iN3yYe4NgVNBRVqgf42TLrmirZPORycaF42imjSMk8oLk8ypRMVk1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7cLLDheeZPH5drmvCL+DImk7NODYT6wDNAts8ZV//k=;
 b=ISTYkBkxJ6hiXl30FMjnmPa8sCkXIH96mOxInRVT49vopZpUFwj4vD+Pl5aNB4K/geEsnD9uQZRGVH9o8iEyApR2h3iM6mPk3aanzJFGm4uvM9R4nGpoOD5+qjvNLFb30HvdEcegcP06VNDyv0/Q1d8uNw1za/kWFBshUSTHEhi84/C4oLnx/QeHi0ivsRWiPjy3LtDz6tcI+Iz1M+/xECfODbEZajf6RuSLfYLXl9JYkeACclQKp98cftSPVwBJK31LX5Sj7yYhVfwzQJ29EHynXdQarm7gcU7cCTSqRvP6HDc/0Zp+1ms2D+ZZV4XZ2gicmW+ykuYlomR0tY7ktA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7cLLDheeZPH5drmvCL+DImk7NODYT6wDNAts8ZV//k=;
 b=xP9TMAWFmWIgGuqaEF9cUr5IpnYlGuui3HtTJl9n676TIJjJ9hBoJ18C6fmMj0fj5O+/nQefcYHVW8C1D5+kLSWbdNkNYgb3iOEPrMbh4R769PZ4fj6YMEBUp9iMOMn54S9ju6XQHNdpRYNh3hwuGAxdkHvTXa1AYCs+qWs2k/flmXvhsBlzL7f88gHIvS2Bv6cJIvRUg997YoKmtLN8AHZLsElifDlLeLEO9va1L5sYCkq6oK7gDgubI1TsJdjdjsyJl07pU2cPIPKlYNb/ucuKgeeTRcaEctgdVIsMQIujyn5k83Fd6NLhYjZYEXIxgFePiDbeQlxuilTaS2s0Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by DB9PR04MB9476.eurprd04.prod.outlook.com (2603:10a6:10:366::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Wed, 7 Jun
 2023 13:10:18 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::db34:4ec1:a01c:951b]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::db34:4ec1:a01c:951b%4]) with mapi id 15.20.6433.025; Wed, 7 Jun 2023
 13:10:18 +0000
Content-Type: multipart/mixed; boundary="------------uVQ1p0J14e05ZVpp200BdQHD"
Message-ID: <3d485cd9-e31c-20ac-e595-3000ada983fb@suse.com>
Date:   Wed, 7 Jun 2023 15:10:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: Cypress CDC ACM serial port not working correctly with
 autosuspend
Content-Language: en-US
To:     Warren Togami <wtogami@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        =?UTF-8?Q?Michael_La=c3=9f?= <bevan@bi-co.net>,
        linux-usb@vger.kernel.org
References: <8be9b56c6becd0981d1cd9c13742df6ba2975b56.camel@bi-co.net>
 <0db2a0a4-6ed4-fe06-217a-cb564f1d4a8c@suse.com>
 <bde43a1913cf55e580e77ac0e059fff3c26dc093.camel@bi-co.net>
 <2f98290f-995b-89ff-8ba2-1463fcf78297@suse.com>
 <9a1381abe0e2b605786bc9c3b2daa3f7bdc3b64c.camel@bi-co.net>
 <e977c0e1-4604-47cc-9c53-619bc897d418@suse.com>
 <646eb1bb5218b9ce5df21e89081b09b84dbd46fd.camel@bi-co.net>
 <46e50745-63e4-7e97-739c-338f9a6445d2@suse.com>
 <c93512db198b14ff8892102cfecec3bea8688aaf.camel@bi-co.net>
 <9f8df0d2-f2af-8e62-fe34-7d826678ac7e@suse.com>
 <b748359d-b116-6354-036c-94679bc7b306@gmail.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <b748359d-b116-6354-036c-94679bc7b306@gmail.com>
X-ClientProxiedBy: FR0P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::8) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|DB9PR04MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: 87cc855f-0365-4c3a-7818-08db67588a6d
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iNQAUkeGW//7vOCKmt2Ay4Rgkga7iRG33rEBP3rf1MezhTVKaC4IDzo0bfjBRoUHd6sIXroHtaRUZZa4UzTO+y8w9fT7A0Or32ruVraSzS5RdnnuQqg51qQxbwkwk43puJZKwuyZEKUA810UP1JrxTX646ZFKcNPZlW31ioKvw6bojAHSZt+vi42xZLWAknSCQi5Yy9gFtPeu+GAbOc6E12+9SPCplJpey9a/ntdrEJJUzAM1fm1RERtkLpQRD48sNyVjqgxDANvqbXuYvrHaKSZDx+IC48r40o7n5K6Ejd7KviRcXMo13lVz9zqSXDDLw20ZnfI7y2BNwakXvFUQNW4/lrV4tzE0yKSQaoASThs8vsavhGxSG0yB8WZLQRDMe5a3D03J4AR+dQRzczaMkiCUkykGkX5U4f6/IIQcGPj9nQFuYMfvtXZW5s4zqWfW+9tkXKl0PPkKJBAs7+q3Wn92Oq1imQ6rylgo8wRY/rbHgEbM+Tl91r+1wGJW1LoOjNCRAL7+6hWUmKwK8/pqKMx0Wn6GIIIx3h4Kg8NEUfIzVp+/JjW1MVOfp+w2Wt2hU3oFsoqHVFbJ6gTZbufBKIdYlTLQYQpozdx7QnC30DAJGEK/K+o+4P2GDjX+z2qdGrhos7dgf8uXv12F3g/aA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199021)(41300700001)(31686004)(6666004)(966005)(36756003)(8936002)(8676002)(5660300002)(235185007)(110136005)(66556008)(66476007)(66946007)(316002)(478600001)(2906002)(38100700002)(6486002)(33964004)(53546011)(31696002)(6506007)(186003)(6512007)(83380400001)(2616005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2gyRU1ablFBSGxwTDVaU3dDdFZ1Z3NkQWVYV1VIREJ0OC85TWNEYUU2Y2c4?=
 =?utf-8?B?NVBzRitOTUdwQk5NUHBoNGVBY2dvMHNlb0lFMXRSVjczRzJHZVlQRnd6ZW8x?=
 =?utf-8?B?WVhzV1VaN2Z3Ukora2twOWtjNkY4RzVzSGhuSDZIMW83b3hOYUFHcGJ3cTJP?=
 =?utf-8?B?YlJhbFdGdnM0bDZXbzh2cWtWUUZzYXBmV1ZLTVZ3TXdJN3NoaTMrR3NKNmt3?=
 =?utf-8?B?RUgzVTI1M2I3dnluM0lUYUdkc2R1eW80ZGZOYnBsekNCVVJtWTNiZXJldHNL?=
 =?utf-8?B?S2ZTaHBoYlVOSUt2Uk1aaFBnbHlPOERBYWxFZ1MxRGdUZUNseC94TXB3enZD?=
 =?utf-8?B?aHoyMkJhTzl4ZjdsN29HTkZaT3UzRUxNV1hTdDVuYXZtS0JKOTV6ay9nbnVh?=
 =?utf-8?B?aEtBRjhoclZyVFpnVjZicldVY05QcnBsMVZkOHNHbGlZUnY0ZFdMY3JqSlFD?=
 =?utf-8?B?bnN5d0JjOWRBSFkvRDE1N0h6NjBwNmJXSEdkQVhJQzlBeDRwTFNNcUdQQWdu?=
 =?utf-8?B?WmZRU3hrbjdWSnc3TzBndnBxT3pzOWZCc2FKSUx2dXpHNmNZeDNvNDNSYUlW?=
 =?utf-8?B?K0ZEMDJvT0pVRjdTQTlueW9aYkY5RVFvMmMyaXZQdzJDQ0YybGpWc2FEbU9i?=
 =?utf-8?B?c2lKcitrUVlneUxzNGRBWWdrVzdIbjVHWldxbi9VZnIvQStHazFnZHpkeEtW?=
 =?utf-8?B?M0hvYXJtNGI4STVqeHY4Qk9oaWFnK2FRUis0bDVkR1Z4eDdobXFtVjNGWm90?=
 =?utf-8?B?eTczZXdNSzQ2K1N2OFRyS1VVWG1FRG51RndUN3VFUy9QeHpvd3VtWkI1cmgr?=
 =?utf-8?B?WlU5aTdNMklvQ0ZNSHJzSGpRTTJ2N2ZMbmhucERsWjY5RTc3ZjlRci9uQldV?=
 =?utf-8?B?QlFoTFhmMVVuLzhUaXFYSWVMOXpqdHd5aytrMWJYb3BoYXFJQXdkTFd5T01C?=
 =?utf-8?B?eVpKVjhsb01KLzdEcWRpMmY3eWFQNklBeHlyNFIxK29IZnRncmdVNWtMVHBs?=
 =?utf-8?B?L01zdzNXT1ZsTmNNMFFUNk1sT3VGeHhMRzI5djBjL01rSFNuakdVTlBDb2Fx?=
 =?utf-8?B?WXRaYnFwak9rM2FiMWFTb2NickJKRDVpUGxOMVQ4b2VIeklwS2E0TS9GSzdE?=
 =?utf-8?B?WTAwOEcwVThhdVR0eUE1K0UyaGI4UXVvUlAwbXAySmhUdDJTOWhOZjVOR0dv?=
 =?utf-8?B?QmF5U1A0aDZjajB4MGMvb3IvQkdYRENPYWFZVFY0OWhWM0t3UFljbXZrZnhu?=
 =?utf-8?B?VXFnZnl0a3JVTXlYRUN0aFZKR3h2VURzZUcwSTZDZkx2RlFXbk1mMXJ1bFR3?=
 =?utf-8?B?SFdTcExLVUVDOG5udnVlb1JPK2NLcGo2MFR2SEE1VHdtWjZQak5NWENseVRm?=
 =?utf-8?B?SG5ya3ZxZHFDYXVOcDJ4WGI3M01xUlg2WGtvVkZRNmFXMGZ6Vk9TWmtMeGl3?=
 =?utf-8?B?M2hCN2w4c0RzNVVHcXhWR0loaVBCdXdvSGpzVEtmNitiY3JHdkYvNi9yY2N3?=
 =?utf-8?B?QzYyK0ZXajRkdzNRWDBPOURTd1pRN3pGNmk0eXl4cjArOEFQVWZ1eXlXRmdn?=
 =?utf-8?B?QStkRmhGWmJBMnZxVTVlczI5cW83WTBxYlNBR3grSFpsM2dWa2taSUhDakhn?=
 =?utf-8?B?MDN2anhMMysrYkIvdDR1dWYwK1RUMTlnRDRaSEpkR1E3c0hSR0wyUjlIa1FE?=
 =?utf-8?B?cTV4WWdpWHpKRXpqenl4eFpaY0VFQjYwV2pJZGhXRkpnUVkxcDlNSU5HNW9u?=
 =?utf-8?B?MCthZEVsYzhveWxFOVBWMzZZZlFrYUdib2drR0wxUHpMdEE1aTlGWndMbmdu?=
 =?utf-8?B?QjQ0MWpMOXVGQ2tKbnNSdnY3VXdJMlFNcTFRcWhjWXNxYzROdUVJM0xFNFJh?=
 =?utf-8?B?QzZJNTB4UFB1UGgwQXlUK21NMFNXd3pGTitTaDZ5Z25vZDJzbDJ2MDRLRVdR?=
 =?utf-8?B?U0dVUWR5UzVnVjBid095YTgrRTdhT1lLWFhSVUZ0bWhYR1hwLzhNaTh5Sm53?=
 =?utf-8?B?bGxJcHhWeFo5cWkreEN3ajY0c1l1RXJaa2tmVmdWS0krMVBjdyttZm8vbmd6?=
 =?utf-8?B?dGp4enhvLzFyTzBkSlNtUDJheXpVK0psQjFsVnpKbUoxc09Eb3c3Zy9UZCsx?=
 =?utf-8?B?MUdRMTRJVDRRREZZZ0w1b25ISWFpR0V2dE85QmVWaVYvbXYrM0kxNWJiSE1m?=
 =?utf-8?Q?FWWhegAx6aqk1/fDjAoejKo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87cc855f-0365-4c3a-7818-08db67588a6d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 13:10:18.4049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAq+FzQ517KUBjeWHr6XpCRiknkJekhrkje9b03Qnw5uI5ZcF04scEkxLIYj/QT7waKHZsQNV/qKT0dfTeXFyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9476
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------uVQ1p0J14e05ZVpp200BdQHD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04.06.23 01:59, Warren Togami wrote:
> On 3/27/23 03:05, Oliver Neukum wrote:

Hi,

> 
> https://blockstream.com/jade/
> We have a mass produced device Blockstream Jade with USB serial chip CH9102F 1a86:55d4 misbehaving in the same manner. Tens of thousands of this device were manufactured and sold worldwide. This board fails to communicate with Linux cdc-acm unless autosuspend is turned off (power/control set to 'on'). lsusb -v similarly reports "Bus Powered" and "Remote Wakeup". [1]

OK, then we need to do something about it.

> Either of these workarounds allow this device to work by disabling autosuspend:
> 
> * udev rule: ATTRS{idProduct}=="55d4", ATTRS{idVendor}=="1a86", SUBSYSTEM=="usb", TEST=="power/control" ATTR{power/control}="on"
> * usbcore.quirks=1a86:55d4:b
[..]
> 
> During the pandemic supply chain constraints led to some switching to the CH9102F which is described here as *almost* a drop-in replacement. Unfortunately the pinout differences might have mattered. I am uncertain if the board design could have been better but that is now in the past. Too many were mass produced so I am hoping for a USB quirk to stabilize this going forward.
> 
> I have confirmed USB_QUIRK_RESET_RESUME allows this device to function for the same reason it works for the Cypress. I am uncertain if a narrower new quirk "ignore the remote wakeup bit" would work here. How can I test that?

Please test the attached patch by giving the new 'p' quirk
as usbcore.quirks

	Regards
		Oliver
--------------uVQ1p0J14e05ZVpp200BdQHD
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-divorce-RESET_RESUME-from-broken-remote-wakeup.patch"
Content-Disposition: attachment;
 filename*0="0001-usb-divorce-RESET_RESUME-from-broken-remote-wakeup.patc";
 filename*1="h"
Content-Transfer-Encoding: base64

RnJvbSA2YzYxNjBiYjllMzE1Y2FmMjAxNmRhMjA3MDk1NTNlZDRmM2NhMmZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBXZWQsIDcgSnVuIDIwMjMgMTU6MDM6NTcgKzAyMDAKU3ViamVjdDogW1BBVENIXSB1c2I6IGRp
dm9yY2UgUkVTRVRfUkVTVU1FIGZyb20gYnJva2VuIHJlbW90ZSB3YWtldXAKClNvbWUgZGV2aWNl
cyBmYWxzZWx5IGFkdmVydGlzZSBzdXBwb3J0aW5nIHJlbW90ZSB3YWtldXAuClN1Y2ggZGV2aWNl
cyBmYWlsIHRvIHdvcmsgaWYgbmVlZHNfcmVtb3RlX3dha2V1cCBuZWVkcyB0byBiZSBzZXQuCkdp
dmluZyB0aGUgUkVTRVRfUkVTVU1FIHF1aXJrIHRvIHRoZW0sIGhvd2V2ZXIsIGNhbiBlcmFzZQpz
dGF0ZSBpbiBjYXNlIHRoZSBkZXZpY2UgYWx0ZXJuYXRlcyBiZXR3ZWVuIG9wZXJhdGluZyBtb2Rl
cwppbiB3aGljaCBuZWVkc19yZW1vdGVfd2FrZXVwIGlzIHNldCBhbmQgbm90IHNldC4KClNpZ25l
ZC1vZmYtYnk6IE9saXZlciBOZXVrdW0gPG9uZXVrdW1Ac3VzZS5jb20+Ci0tLQogZHJpdmVycy91
c2IvY29yZS9kcml2ZXIuYyAgfCAzICsrKwogZHJpdmVycy91c2IvY29yZS9xdWlya3MuYyAgfCAz
ICsrKwogaW5jbHVkZS9saW51eC91c2IvcXVpcmtzLmggfCAzICsrKwogMyBmaWxlcyBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jb3JlL2RyaXZlci5j
IGIvZHJpdmVycy91c2IvY29yZS9kcml2ZXIuYwppbmRleCAwMzlhZTk4MTUwM2IuLmNlZmYwYmI3
NTJlNSAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2IvY29yZS9kcml2ZXIuYworKysgYi9kcml2ZXJz
L3VzYi9jb3JlL2RyaXZlci5jCkBAIC0xOTEzLDYgKzE5MTMsOSBAQCBzdGF0aWMgaW50IGF1dG9z
dXNwZW5kX2NoZWNrKHN0cnVjdCB1c2JfZGV2aWNlICp1ZGV2KQogCQkJCQkJaW50Zi0+bmVlZHNf
cmVtb3RlX3dha2V1cCkKIAkJCQkJcmV0dXJuIC1FT1BOT1RTVVBQOwogCQkJfQorCQkJaWYgKHVk
ZXYtPnF1aXJrcyAmIFVTQl9RVUlSS19SRU1PVEVfQlJPS0VOKQorCQkJCWlmIChpbnRmLT5uZWVk
c19yZW1vdGVfd2FrZXVwKQorCQkJCQlyZXR1cm4gLUVPUE5PVFNVUFA7CiAJCX0KIAl9CiAJaWYg
KHcgJiYgIWRldmljZV9jYW5fd2FrZXVwKCZ1ZGV2LT5kZXYpKSB7CmRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9jb3JlL3F1aXJrcy5jIGIvZHJpdmVycy91c2IvY29yZS9xdWlya3MuYwppbmRleCA5
MzRiM2Q5OTc3MDIuLmZmNDljNTVjNTEzZCAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2IvY29yZS9x
dWlya3MuYworKysgYi9kcml2ZXJzL3VzYi9jb3JlL3F1aXJrcy5jCkBAIC0xMzgsNiArMTM4LDkg
QEAgc3RhdGljIGludCBxdWlya3NfcGFyYW1fc2V0KGNvbnN0IGNoYXIgKnZhbHVlLCBjb25zdCBz
dHJ1Y3Qga2VybmVsX3BhcmFtICprcCkKIAkJCWNhc2UgJ28nOgogCQkJCWZsYWdzIHw9IFVTQl9R
VUlSS19IVUJfU0xPV19SRVNFVDsKIAkJCQlicmVhazsKKwkJCWNhc2UgJ3AnOgorCQkJCWZsYWdz
IHw9IFVTQl9RVUlSS19SRU1PVEVfQlJPS0VOOworCQkJCWJyZWFrOwogCQkJLyogSWdub3JlIHVu
cmVjb2duaXplZCBmbGFnIGNoYXJhY3RlcnMgKi8KIAkJCX0KIAkJfQpkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC91c2IvcXVpcmtzLmggYi9pbmNsdWRlL2xpbnV4L3VzYi9xdWlya3MuaAppbmRl
eCBlZWI3YzIxNTdjNzIuLjdjODFhZDQ5ZjFhMCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC91
c2IvcXVpcmtzLmgKKysrIGIvaW5jbHVkZS9saW51eC91c2IvcXVpcmtzLmgKQEAgLTcyLDQgKzcy
LDcgQEAKIC8qIGRldmljZSBoYXMgZW5kcG9pbnRzIHRoYXQgc2hvdWxkIGJlIGlnbm9yZWQgKi8K
ICNkZWZpbmUgVVNCX1FVSVJLX0VORFBPSU5UX0lHTk9SRQkJQklUKDE1KQogCisvKiBkZXZpY2Ug
ZmFsc2VseSBjbGFpbXMgdG8gc3VwcG9ydCByZW1vdGUgd2FrZXVwICovCisjZGVmaW5lIFVTQl9R
VUlSS19SRU1PVEVfQlJPS0VOCQkJQklUKDE2KQorCiAjZW5kaWYgLyogX19MSU5VWF9VU0JfUVVJ
UktTX0ggKi8KLS0gCjIuNDAuMQoK

--------------uVQ1p0J14e05ZVpp200BdQHD--
