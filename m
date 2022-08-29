Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7835A4D1C
	for <lists+linux-usb@lfdr.de>; Mon, 29 Aug 2022 15:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbiH2NLU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Aug 2022 09:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbiH2NLB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Aug 2022 09:11:01 -0400
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00047.outbound.protection.outlook.com [40.107.0.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982F82B254
        for <linux-usb@vger.kernel.org>; Mon, 29 Aug 2022 06:10:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEmuE0aDgHO0G3tP5S/1xH9ID2NJ5epEkly55zPt5bJqZIec97JV1yOgo5wP83DPnx/kll+ItAYWXAJzmKmgeEqmifZvXQpJJAqj2cUwbBE0QjVs0EYKDUFE7tBC9ms6GJx+JF425gRsjJfxvgXHzQBSzfXAwq7kg3jajcofF8+s/hhkCSZzH6r6AyUhv/1JRWFnsu8ZT8wJtPp1qPWbshkzNBUvfUQk1cpdYcc7WU8ww4AGcgy4egwgXnHPpqk1RmmNxnn6EedkcwTGg0+uA+5eLgK9ZbsMw2csx3AIs6OhDs052L0nh83q/PXZxaP4TdRhqrXMpyvkUEnDc2Icyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiGzbnF5qPoVlvtGtkCZU7YtudIXypx7WZZ3CKPIYHE=;
 b=WNlsrhf68YTuUE5rb/uMjRv5moM2vx/ZWabekXxioij/kfRjsLMKXrTO16uJ3Cr0qjnaJPKflc2/Lz2gqZ68pC94ihC+jbVWeRnt4qVmGkhTyXJGyxrdtUBFiVYOx5K2BUG/q/rztuX39UACCmcklrfqUvJX5trmAFxHZCgPvGp3Ibs7UCNgrI+3HWhlRcs8Nwrm+VWTCpdsBNxqD1SGP0T+/79RMgiSOoELyc0L/u9JZvhg6wpFdl0LqdIXlH+uhVplEYUzJq2unUILXREiDHSwLK8bg7sIk6dVaFGVyHVsyZgOT2eVv+VA2uNkmQqbUFSHnn0LdfjNd8WG17TxMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiGzbnF5qPoVlvtGtkCZU7YtudIXypx7WZZ3CKPIYHE=;
 b=w3/aLYJuRFh0EyaH6Eu7h+lS9XcbD1tvqlD9X30YqR19UljtdNmxEwyk1VFNqvuktZoCMhrJa0fr+Izm2L/CS964I0bA2tjCb9DErMlN8fywkxUf8OHUnsHmyz6GQcEEsY1c8v7d5qwq91cGtcN16DZsubLriHU194uQYWWB3TQ8i5kaig9CfbEjJhEmfBD8Z/rvGqlR86itpHmnZtkVnG7272KQVeOsXPEBv+9TDQ4DhAm+JnURhiuAbSMKeBUuBPo6KcYr5FbZyrz329mjaRn8LtV5s1pkGFgPgozUN3YudOvp0V9hdFsxFcyynlqoHD+2RbIu65Yfynq9IRdsyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by DB6PR0401MB2583.eurprd04.prod.outlook.com (2603:10a6:4:37::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Mon, 29 Aug
 2022 13:10:03 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::b083:534b:70ae:416a]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::b083:534b:70ae:416a%2]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 13:10:03 +0000
Content-Type: multipart/mixed; boundary="------------3Pzl2z6NaGbBem0xuu4eNSSW"
Message-ID: <78712d64-7bac-cc2f-4a99-52e35d12f46f@suse.com>
Date:   Mon, 29 Aug 2022 15:10:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Peter Chen <peter.chen@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
From:   Oliver Neukum <oneukum@suse.com>
Subject: Cleaning up bf88fef0b6f1 ("usb: otg-fsm: Fix hrtimer list
 corruption")
X-ClientProxiedBy: FR0P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::11) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0aab5493-443b-4bcf-1694-08da89bfc8de
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2583:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6WuaMz/zlzS1cay1R6xHdrMeUNT5w0TPQLW0E6fICFUvVFKG1zFC6QezI2su1GgU2F5BThZyn4ypYWMXnq7Qc1MdXY+HE4lNhNf+EvE+DxLNPW0NGlvUroVUfIQELMdck8ssXYDfEFK/DJHn2kNhR25Tg7f3Wt7xK8iId5X4sBbT0k6lwbGAHGV/I4SdF+7kbwlheUxDQGQOv52HxjwtIu0hlqsYVdCHIaknytRw98JG/48twqzUmX/WClF9wuTZDKzvOWu9j5F3qPGmj+DTmPMUVA0UA1S2nX4jnyfFzTh0lH8suoggxHxNEsnsy0K+vlAXA7FMB+OibhXVB7R9k5JktjDOby1VDb6mNHt3nz4mh6L2CtsUT/VapiHSatkc15Nr+cI1Kz86rFt2j4eXtk041soH6Dxr16HzfDlevNUTH0L9FVxYM+nKD7Vj8JoaU6073EuvMArtID9jnrOfYgyIDpqZ4CQoR1HjpTIqyeJZkTyko6rnC0fDdblUasAmcffbdvsx2HFiUwCmILgIJd5YjklKwG504HHMxFD9IHfBbOvMClj1SyS9dJCDrgLdfRsv1+bf4lFrOQUv7J3bqWYgUESRWlSPkObIaRhqHg6AUcTUZaArNIPd+1rcib5L83nTFrJ7ZGqZfiBkQCABTR0pIdWbetXa2B9IX1q3w5PEIHbubvV52HLqOJvBGY99uTytHdNaCxJpGDCcp2Nw5KryODX6Q+ltDnUGJWb9Zu1Kbkx88xUJAnDhRdQGyplU7J7horjKqVgnqQ/uKTxpWycdf5MEAPI8UhEhFi840nU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(136003)(346002)(396003)(376002)(8676002)(66946007)(66556008)(66476007)(4326008)(316002)(54906003)(6916009)(31696002)(31686004)(6486002)(86362001)(5660300002)(8936002)(478600001)(235185007)(41300700001)(36756003)(33964004)(6506007)(2616005)(6512007)(2906002)(38100700002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d25UM1VqNkxnd01aUG12ems4SFlMQVlJaWl3R3ZDMUtJNDhNU0Vrb2RlOUh4?=
 =?utf-8?B?U3ZBWUFPc0FPOTFaMDZ6cjltM3dibDJkTkI5RHhBcVVGeVd5ZzFDV1MxdGsy?=
 =?utf-8?B?ZVBRVUtjUjk3ak1YOE9xcldzMGFjdmhWOXBNQ0REWk5nQ05TREZPSEVaZnlZ?=
 =?utf-8?B?RkVEbnZmQjM4eDRYSW15SDlZTlVnTzhOWUswUkJLQUp3akNacDdFQjJVWlRz?=
 =?utf-8?B?cmxtUDhkYXZSTWxDTVFHYXRzZ2d4MjdLUGxNa1M0c0Znbys2eXZEM3ZjWEli?=
 =?utf-8?B?MzRRZGY5VGJYd3F4MXFIaHM1ZzZ0R3JnK0h6WG9VVWNKem4rb2NRZkFkS3hh?=
 =?utf-8?B?NmduS0w0S3ZVTWFHNWVZVDBTQTlHNHJnUld3NExwL21UcjJhUDM1TzlzQlF4?=
 =?utf-8?B?T3F2R3BKV1FIMG1KWE1UQzlkMEZKZ3BsVWFKcStiS0QvM3pMK0NNSWdDUldk?=
 =?utf-8?B?U2tldDlVVHFNOGhVaDlRdWNucTFGNk1qcW9rckFpWXR1amZiY2c5ZkR4a2wr?=
 =?utf-8?B?anFUQ3I1T1ljcjE0NEJwd1hRcEJWU04wYlZ6QkdQNU9hZHc5enRGSHdzWitZ?=
 =?utf-8?B?TlVxSFFVdlpVTXJoRUlFeWJzbUUxbk5ZWi90di8wUkE2L3U1SjUwekFJNml0?=
 =?utf-8?B?WElGN25xZCtsNDJyT0YxSEpnbmxOQTlBcE9iUTB3Mm1Pc1RUbWdiMGhUQXRU?=
 =?utf-8?B?WVEvV0JyeGMvOWUvUTNhWWc1dTlZN2xKUnEwRVBidkQ0M3NaMUNuSUlKMDJJ?=
 =?utf-8?B?S1lnR3Z2bDNXUkdYaGdzeDdlNlFHR0UzcXM5MTg1TUNTSGpnbHN4WWlnVWNI?=
 =?utf-8?B?ZWRFQzZHTkUzWjJJc3N4c2tLOHI3SytjZ0l1Uk1OMlNqYWxhWmhwMHBrZnJs?=
 =?utf-8?B?TDR1NStZMmM5bVlraTJ0ZEJIdFRFdlRkYjJiL3RLOGpwNDluK3pjTFA2ZTll?=
 =?utf-8?B?L2U1dUgzT0lzRXBoN0xRYmN0SzlGcitJWGdWQ1BaUXVpc0NvTFUrVjdoTk1U?=
 =?utf-8?B?TkRaK2FTR1grQkkzbHkrMzVYdmYrSTBDQ0dQd3AwM0oyWGZIV2hva3hkTER0?=
 =?utf-8?B?NXFpbGN6cWJJclBFOXlVVDFIbWRUVm9CYXIvMzVrUHVvbWticnpnWEV5aC9L?=
 =?utf-8?B?Skx0YUFDWUFXMjh5ZWtQU1gxQTN6TSsrclZxSEx4Y0ovaXNLSzBncy9zQlNR?=
 =?utf-8?B?OGY3eFIvVmo4dzg2Qk5QOTAyV1Zubm5TeFR0MDV0SVZjcTg4Sm14ajR4L3FR?=
 =?utf-8?B?NHlaaERzVmxucGRXK3ZHVDBTVlZNWE0yWHcvNEMycVFpem5QbTEyeDY0SExL?=
 =?utf-8?B?MFlvY3Mxajg5VVFtY01sSWdTUkZtK2VWYWJFcElxcXZwK2NWYzFzNytVUEtx?=
 =?utf-8?B?ZFV4UTluL29XZXlSOUpiMU5UcXpQQWE0eFg3L1l5RjBOMldCNlQ4M1JyL1A3?=
 =?utf-8?B?Rk9sMlpBazZNeHh1YUFnQmNZZ041QUJPSHZRNkc4YnJlVmxPQytpS1R4R3g3?=
 =?utf-8?B?UkU1N2J0NEtSSWZBbGVNRmtsN0xEVkYxUFJGd2FvRUlLMXQ0SlJVQUdJRGcr?=
 =?utf-8?B?UFY2NzFzSG14cFhkUEE2cXNhT3JYVVJsTzk0WGpKUm5GN1Jjc01vTG0wL05o?=
 =?utf-8?B?SC9nWFUvYmlZT0Q1dTVGWWg4VDVhcjlsWllFSVNGQTJMUDlGbGtlQ0FnVzlu?=
 =?utf-8?B?NWtJRjZyeDRnQXQ3S2g1N3A3OFljK2t6RTBpV3JVWC9PRzhTOC9QOFppMCtm?=
 =?utf-8?B?ajhmd0puOXh4M0VVbEJtN1lTTXpnaWdxMmxrcHJyY0JyWFZWanIvUVBHSHZV?=
 =?utf-8?B?QURwTkkveExtWW1iaHVEcXFhemVuMmZBUW9DSldHazlmSkhPMThZUHNRM2Js?=
 =?utf-8?B?bjhhRGw3aEhpN0ViZFF5WFNWWnQ4Slg4U1VPMkkyRDhWR2lkY3JmT0o2a0RO?=
 =?utf-8?B?Q0RxY2pFR1lCYzJWZHJBN09nVDdvZUVFVU51Q1ZNQzk4aWc0RVlzMEVpL2dL?=
 =?utf-8?B?bkxOSnMrc3lFVjR1bDNjamlONGpERlhJb3FpcWFnNVFkc3Bnb1VEM3EyMXJO?=
 =?utf-8?B?ZVBCZ1ppTUlkQ0xWWWRaZ2VRMkt5UUpPa1FqN3B0MlZhaXZpTGg1NVpNQ3VJ?=
 =?utf-8?B?WDJBdStTdy96WVZWbDAxVVJHanRrZ0twTEU4SnJFdHV6djJmRjFraWhCR093?=
 =?utf-8?Q?hpYkhuGKRkkWaMebVBGp0BM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aab5493-443b-4bcf-1694-08da89bfc8de
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 13:10:02.9977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQpDVLOjspho7xB6N2p96/B7E5czWIRAI0nGP3Qsq5IgOBxED+zZeXks1x+SwSHvOFZ90FcCC2VY+wpx8DqTVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2583
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------3Pzl2z6NaGbBem0xuu4eNSSW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I am looking at that patch and I am afraid, while it does the job
it is quite unclean. In effect you introduce a flag you set, but
never clear. That is just a kludge. It really tells you that your
setup of data structures is misplaced and you should just do it earlier.

Could you test the attached patch?

	Regards
		Oliver
--------------3Pzl2z6NaGbBem0xuu4eNSSW
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-initialize-struct-otg_fsm-earlier.patch"
Content-Disposition: attachment;
 filename="0001-initialize-struct-otg_fsm-earlier.patch"
Content-Transfer-Encoding: base64

RnJvbSBhMTFlMDY4NGYzMzhmNmNmMDAzZWI1ZGZiNTYyZDkxZGExODY2Y2M4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBNb24sIDI5IEF1ZyAyMDIyIDE0OjQyOjE3ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gaW5pdGlh
bGl6ZSBzdHJ1Y3Qgb3RnX2ZzbSBlYXJsaWVyCgpUaGUgZWFybGllciBmaXggYmY4OGZlZjBiNmYx
ICgidXNiOiBvdGctZnNtOiBGaXggaHJ0aW1lciBsaXN0CmNvcnJ1cHRpb24iKSBpbiBlZmZlY3Qg
aGlkIGFuIGlzc3VlIHdpdGggaW50aWFsaXphdGlvbi4KSW4gZWZmZWN0IGl0IHJlcGxhY2VzIHRo
ZSByYWN5IGNvbnRpbm91cyByZWluaXRpYWxpemF0aW9uCm9mIGZzbS0+aG5wX3BvbGxpbmdfd29y
ayB3aXRoIGEgZGVsYXllZCBvbmUtdGltZQppbml0aWFsaXphdGlvbi4KClRoaXMganVzdCBtYWtl
cyBubyBzZW5zZS4gQXMgYSBzaW5nbGUgaW5pdGlhbGl6YXRpb24KaXMgc3VmZmljaWVudCwgdGhl
IGNsZWFuIHNvbHV0aW9uIGlzIGp1c3QgdG8gZG8gaXQgb25jZQphbmQgZG8gaXQgZWFybHkgZW5v
dWdoLgoKRml4ZXM6IGJmODhmZWYwYjZmMSAoInVzYjogb3RnLWZzbTogRml4IGhydGltZXIgbGlz
dCBjb3JydXB0aW9uIikKU2lnbmVkLW9mZi1ieTogT2xpdmVyIE5ldWt1bSA8b25ldWt1bUBzdXNl
LmNvbT4KLS0tCiBkcml2ZXJzL3VzYi9jb21tb24vdXNiLW90Zy1mc20uYyB8IDcgKy0tLS0tLQog
ZHJpdmVycy91c2IvcGh5L3BoeS1mc2wtdXNiLmMgICAgfCAxICsKIGluY2x1ZGUvbGludXgvdXNi
L290Zy1mc20uaCAgICAgIHwgMSAtCiAzIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jb21tb24vdXNiLW90Zy1m
c20uYyBiL2RyaXZlcnMvdXNiL2NvbW1vbi91c2Itb3RnLWZzbS5jCmluZGV4IDA2OTdmZGU1MWQw
MC4uMGFhMmViNzM5NmNlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9jb21tb24vdXNiLW90Zy1m
c20uYworKysgYi9kcml2ZXJzL3VzYi9jb21tb24vdXNiLW90Zy1mc20uYwpAQCAtMTE3LDcgKzEx
Nyw3IEBAIHN0YXRpYyB2b2lkIG90Z19sZWF2ZV9zdGF0ZShzdHJ1Y3Qgb3RnX2ZzbSAqZnNtLCBl
bnVtIHVzYl9vdGdfc3RhdGUgb2xkX3N0YXRlKQogCX0KIH0KIAotc3RhdGljIHZvaWQgb3RnX2hu
cF9wb2xsaW5nX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQordm9pZCBvdGdfaG5wX3Bv
bGxpbmdfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiB7CiAJc3RydWN0IG90Z19mc20g
KmZzbSA9IGNvbnRhaW5lcl9vZih0b19kZWxheWVkX3dvcmsod29yayksCiAJCQkJc3RydWN0IG90
Z19mc20sIGhucF9wb2xsaW5nX3dvcmspOwpAQCAtMTkzLDExICsxOTMsNiBAQCBzdGF0aWMgdm9p
ZCBvdGdfc3RhcnRfaG5wX3BvbGxpbmcoc3RydWN0IG90Z19mc20gKmZzbSkKIAlpZiAoIWZzbS0+
aG9zdF9yZXFfZmxhZykKIAkJcmV0dXJuOwogCi0JaWYgKCFmc20tPmhucF93b3JrX2luaXRlZCkg
ewotCQlJTklUX0RFTEFZRURfV09SSygmZnNtLT5obnBfcG9sbGluZ193b3JrLCBvdGdfaG5wX3Bv
bGxpbmdfd29yayk7Ci0JCWZzbS0+aG5wX3dvcmtfaW5pdGVkID0gdHJ1ZTsKLQl9Ci0KIAlzY2hl
ZHVsZV9kZWxheWVkX3dvcmsoJmZzbS0+aG5wX3BvbGxpbmdfd29yaywKIAkJCQkJbXNlY3NfdG9f
amlmZmllcyhUX0hPU1RfUkVRX1BPTEwpKTsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3Bo
eS9waHktZnNsLXVzYi5jIGIvZHJpdmVycy91c2IvcGh5L3BoeS1mc2wtdXNiLmMKaW5kZXggOTcy
NzA0MjYyYjAyLi5jM2JhYzdlZWZlODIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL3BoeS9waHkt
ZnNsLXVzYi5jCisrKyBiL2RyaXZlcnMvdXNiL3BoeS9waHktZnNsLXVzYi5jCkBAIC04NDQsNiAr
ODQ0LDcgQEAgaW50IHVzYl9vdGdfc3RhcnQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
IAogCS8qIEluaXRpYWxpemUgdGhlIHN0YXRlIG1hY2hpbmUgc3RydWN0dXJlIHdpdGggZGVmYXVs
dCB2YWx1ZXMgKi8KIAlTRVRfT1RHX1NUQVRFKG90Z190cmFucywgT1RHX1NUQVRFX1VOREVGSU5F
RCk7CisJSU5JVF9ERUxBWUVEX1dPUksoJmZzbS0+aG5wX3BvbGxpbmdfd29yaywgb3RnX2hucF9w
b2xsaW5nX3dvcmspOwogCWZzbS0+b3RnID0gcF9vdGctPnBoeS5vdGc7CiAKIAkvKiBXZSBkb24n
dCByZXF1aXJlIHByZWRlZmluZWQgTUVNL0lSUSByZXNvdXJjZSBpbmRleCAqLwpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC91c2Ivb3RnLWZzbS5oIGIvaW5jbHVkZS9saW51eC91c2Ivb3RnLWZz
bS5oCmluZGV4IDYxMzVkMDc2YzUzZC4uY2MwYmM0ZWRmMjI3IDEwMDY0NAotLS0gYS9pbmNsdWRl
L2xpbnV4L3VzYi9vdGctZnNtLmgKKysrIGIvaW5jbHVkZS9saW51eC91c2Ivb3RnLWZzbS5oCkBA
IC0xODMsNyArMTgzLDYgQEAgc3RydWN0IG90Z19mc20gewogCXN0cnVjdCBtdXRleCBsb2NrOwog
CXU4ICpob3N0X3JlcV9mbGFnOwogCXN0cnVjdCBkZWxheWVkX3dvcmsgaG5wX3BvbGxpbmdfd29y
azsKLQlib29sIGhucF93b3JrX2luaXRlZDsKIAlib29sIHN0YXRlX2NoYW5nZWQ7CiB9OwogCi0t
IAoyLjM1LjMKCg==

--------------3Pzl2z6NaGbBem0xuu4eNSSW--
