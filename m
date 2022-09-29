Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFE45EF25C
	for <lists+linux-usb@lfdr.de>; Thu, 29 Sep 2022 11:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235214AbiI2Jmk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Sep 2022 05:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235554AbiI2Jm2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Sep 2022 05:42:28 -0400
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10089.outbound.protection.outlook.com [40.107.1.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B86133C85
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 02:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6s1ajsvMmHs47KpuuMn5Ztn4xGPtBRwfm4K7KaZFZNWVay837HFGc/EvM4OlFXrxcp/JmB1gm2KXeDtq2sumDa7W0qFB78toXaLxL7OUQeRDJ/0KmSyk1hO+/N8umKgOAdmdQXeSZCXK7n+U68cWgibGWAKtXWQxWgdGIH41hImtrHKEd6OohnrvacqAJ9ocBeKIuubgvRZ7mvNVtzLHHGJL38178xdblJFwyhCpuJBXaKI4c1+ykLYHU8WUedTnCknuf82JSr7vP6QPUyi7vbOPZuKQLVBSlxCEQr+fBH2rF6jPcRknTokN5AvQHDV9obif76b4GX5Phzccg+G8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/WWMBcMPZztqhXW98LdigZuNAvRaCkZBZof2P1GXQo=;
 b=Sv9WT1yg6MgumvjWoTgP3dcSH000d+yUKZDCCCZLNUpnI23i7Y3Hg2OGXfzhabFTz5txkvpRZMepl8C/6hHSkgcW/Wuw7CVYEk2P8bX8b0BMLKhpoQZ7umBZmRMg/R5G2bTGt582C43GrGuxx6lBlaTaDJmIRLgOctqvWtUndVrC/sibwngaLu1YzpaJGJYR3AtZTwKSwSaS1BOeu2l4HGhD9JSGDaAMqiA7Vn3EczuOVQAJLp+2yzSyjpqfDHS7s1CWZ4Qo2wgoUikzohEXL48684Uog/ws1B9Y0mgMzayGZCbfdf0SyyAU9EtgxxS+xg9BGu8KWIrXmPITHbOcUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/WWMBcMPZztqhXW98LdigZuNAvRaCkZBZof2P1GXQo=;
 b=yH0BB1pxa6JttPHRSOByIiJk8D0AOYIW9JlNJlcvxVqGfyyFoqxfFpmhSJKdwYpjbruAydJHT5vb9dMvuEcBAhpNs/xFECh+AUFDTcBswonEMib6kB/ENXxK9RAO6yHBa67bhHesIDXLI+Fw6cf8vnFob32SyREjEz9DMlRCo5ybbYfoI/tbQGLzJw6Nr52+Riiy6VB0V9UIS6E+nH7WNPl0e2mUrxVPRXJAfXIwupqroBw6BYeP3zCf5PV0yVMj6N8V4NOAy8d/WhzBWj9oqXIE/5poyKFanrhm5+g8krF7EWj08daD0+TxeUrokj2kTk9WXMktdZrHJMaXMtH9jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by PA4PR04MB7677.eurprd04.prod.outlook.com (2603:10a6:102:eb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 09:42:21 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::584:c4ea:a4f7:af1b]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::584:c4ea:a4f7:af1b%7]) with mapi id 15.20.5676.019; Thu, 29 Sep 2022
 09:42:21 +0000
Content-Type: multipart/mixed; boundary="------------VLn2ZCsF9gGX987Z9xQj0vDa"
Message-ID: <a93ab7b9-668c-149b-8fdf-3c2d0eebabd3@suse.com>
Date:   Thu, 29 Sep 2022 11:42:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
From:   Oliver Neukum <oneukum@suse.com>
Subject: Re: [syzbot] KMSAN: uninit-value in idmouse_open
To:     syzbot <syzbot+79832d33eb89fb3cd092@syzkaller.appspotmail.com>,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <0000000000006f6f8f05e90366aa@google.com>
Content-Language: en-US
In-Reply-To: <0000000000006f6f8f05e90366aa@google.com>
X-ClientProxiedBy: AM7PR04CA0027.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::37) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|PA4PR04MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: 94492eac-f3a4-4f16-dbe4-08daa1fee7fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7dbteAGMB/cqWLY3ux3ofgY5G4XfnUY39CZ1pKH3vLagZOKhj1gNpTnHVM5joVi8BI8CK01XmV2NibLGWqTEj6VjB2LzzC6Yv/f+zDWH4LTfpO8pB3HsN8jc6JgksHqxf9XdPR28GOSNLBYezqX+ajtgHLdWfuZxl8XefQD9S0u0doB9R2ZPgHVMphci5fKnKo85NbaEN62oH8vs3rXfcM0WV0i2bmG8kQsW6csUtsCMdmJzdovEIujJP3/JZibaRgiCzutnwopPYodh8JVVm7sUyG4nCQHv/fmn5l5T0libGtd0MdcZ0KnS6JnD7e3PXaIuZ8CoJS4Q7oR/o9XuF85tVkRRuUZxbeNLffvJWsWhv3V2MBvDOaOMWjwsBQLC6n4XnQUV8PE1zws9Bdj3ryXFZ7U0zNF+o6e75ZYy44t1uyMUeRXdqsI+3AHLTu5ElZ8JcFYHOSOZ6Bk5r8xu+uGNrZw9JSgs0b/vXIu5parlpOoGiuz0V1KNvYF68Gk8W9aZIIq80tce8GerslCeFothHJi2uYw1s42Qd013V7H0bvOl660wGoAOjbSEOAKT6heuXcrSwMGsfzS0sUdka/d9+S0Wy61Ib8XO/gL4pJfTOgnZUs0lixc5Hv+Fdm8CVv5wczDICvon7PBg3RE0qQMz60fLE2a/6TkM4vn6QnLIQ7p+B+ibw4pgplXGpIYn3+GO40rxMck8lwOlZwpnoUPL6xF2B42F4ketRgsqOZjFCFT6goGbolhYjZOoJN48H7X2TdoEivICaMtU8c5ipHrAcJ7TjKxNWSSSF9bMyLTSHzEfD5rypUtL0PJp6hU9tAk0Jd1THWfFEdfRFyD7eOGozauyvH21nTLvleMdZmr3ZBVRaw7puIiKahwrFJIM0J3d7fhgDJkVzFp3ns+hHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199015)(2616005)(186003)(2906002)(38100700002)(86362001)(31696002)(36756003)(31686004)(66556008)(66476007)(66946007)(966005)(316002)(6486002)(478600001)(41300700001)(33964004)(6506007)(6666004)(6512007)(53546011)(5660300002)(235185007)(8936002)(8676002)(99710200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVBHU1lOMlJnemhET2x0UDV5ZStpRjZkelBCSDV2L0YwQmdZUExNZ3A5czNP?=
 =?utf-8?B?YjQ2SkpoVDZlaUF4UjNVd205T1J1bkNMcGFIVEdQRWQzTGFESlNpcjNKcXdy?=
 =?utf-8?B?d1lNS2VZK0NET0xWbHR2NUhkN2N3UFpqZWFtME1nektQMzltTDN2TWFEMWk3?=
 =?utf-8?B?VERPc1ZUYW9OYk9XTDFQbVpEWnpEUjVTZXhLRjZKTWJtNDArYmJLTFY2dXF4?=
 =?utf-8?B?RDFCKzY1QnVuNmVtT1FRRDBSdlZJTkRFaXhPcjByOWU1TEpwVGJsOENNdmFJ?=
 =?utf-8?B?OUFLTlcvYUVtU1VIblFaaDJYb1dRcDYvUEppenpBajlPaHJlMHhoZ3hvUGFj?=
 =?utf-8?B?UFJ1UUxORUQ2anRYMWx6RXFkMlhXOGt5UVhsNUl6d1h1ZHZVMFd4ME04YXdC?=
 =?utf-8?B?ekZheWUvbDR5MldobTVtRUNTNEVWeTUyY2pvemtyZnpBaW5LN2U4bjB2eUs5?=
 =?utf-8?B?L1JCOTZ1ekxlZklDV3pPSm13L0RMZEY3bXp5V2dscGRzeHIxTk1IMVBKTmpI?=
 =?utf-8?B?c0VYMGZrMDY5eFphR25yTXZ0UEVpYnhMYjlMZlpGVVJSM3RxYVpQTWhYUjhs?=
 =?utf-8?B?czVBUTFHNjZWTisrbzZQWGVTQTNmTU81VlBTV283RFdnZ2gxZG5RcUIxeStG?=
 =?utf-8?B?eXVKS1FrcnJTa1hQTkpsbGxPeFh6VHlQdHdYMTU0NVFxb0toRHp6ZnRHQ3ZS?=
 =?utf-8?B?VVpWbEdXekNNeVE1K21peC9paGg3c3F4Y3lCcnNhYytMdmszREhMSTRydXFD?=
 =?utf-8?B?VUsxd2RkdDl1NjFldVB3dndXLzAwUkt1NDE5NUwvUW9XYUo0OVd3M1RjSHhT?=
 =?utf-8?B?c2VWcXU2aVIyWFhZVGJTUGsycnRTZHVIV3h4M1R0RVE5eEVydUNJS3NGRDdo?=
 =?utf-8?B?bHgvWi92SzZxS3pvVVhNMGZPY2JBc0djb1RIQkRvVXRraFYxQjZWNk8wMk04?=
 =?utf-8?B?Y2svZ1hhcWJoNVpBdXZtaHVOVGtRM1F5dUtjU2NJU2lSemg4SjJTR09xL0gw?=
 =?utf-8?B?YVJ2RWdKdWlMV2hTYXZ4djZmd1lqalhIT3ltSVdSd25KMFlqTTFwSDVOYkNW?=
 =?utf-8?B?NGtUc1AvZzJSTXY2S2NKWHNINkNBL3NudENjNWpxLzdUbWxQQW42aWxWVVNi?=
 =?utf-8?B?cHI5ZkpoaDR0ck1yNzZieFZacVN6UG5Fc25lV0VEMTcxWi9hVGM2ODV6aXpl?=
 =?utf-8?B?MnVTM3pEeGRUUllSZ25IcFMvcVhKNU5PMTJ5bkczNkFIaVpCRGR1ZC9GSWNv?=
 =?utf-8?B?T2c5endyK1luNFRBQThYQnB4eU1JKzR4N1hMSGJMT2laYVV2eG9ITXZMN3ZF?=
 =?utf-8?B?QlBJL0REVFRKR0xuOEY3ZEgxZU0xSldVVkdRcGgwRXQ1OGtQODZlSHJXRExD?=
 =?utf-8?B?UjJreStyQUNqT0pQRDA2eGRqM1lESkkzRld4ZHBIa3FQRlVBVzZjWVdKaWVu?=
 =?utf-8?B?dE9McjlYY3pqUVBFSkpmRndvK3lUTnRhT3VJKzhHWXh4b3JmeUg0YUVrZVhY?=
 =?utf-8?B?VE5iaFd2MjdnaUdkNnRMeUNFT3lvYTY5V3lmUmJjVGpZNFY2WG9OL3pxdFNB?=
 =?utf-8?B?N1hkR0FXbTFwNWZPZzNmd0V6YVBwN2tpTUVUelg1dmNXQ0xVdXRQejJzV2w5?=
 =?utf-8?B?N1l3Rk5MWThCcW8rWlRPbWk2STRvdVI3YnB3RUVOSXIxRGZRcUlNZzREeXpI?=
 =?utf-8?B?emcrRnVzaWwvZnkwRnc5ZWxVVXBGcHNWekpleGE4MUh3TzFWclQ4cWMrZnlo?=
 =?utf-8?B?S1h6eGVwblVUSnpqbkRVbTBsbTNGakJWVFByaG1GOXpvaU9mb1lQNHFHVEpi?=
 =?utf-8?B?RVpoMnY3UXZWOGlZbGEzbHNwV2owTVlla1BoYXErMk5pbzZaRGZncksyOW1w?=
 =?utf-8?B?MDVLYnpnbElEdHZ1M3ZIaFFmVVo2clpPTUxoVG12aURCc1gvVGFadGVxVGRn?=
 =?utf-8?B?MGszVG5EVWlLbzNOM0dwWFVLL2FBQ2Z5YUdEcWhuTnlDZzRPU1JMeDd2dlBM?=
 =?utf-8?B?ZGpQeE9kaDA2Vkl1ZDVJazFPcFp1aEYxR1h5WThqU0lvdDhtZXYvTGVZY1l1?=
 =?utf-8?B?K1pkYWhQYkxqMlhscENmdU5jUnM0dGQ1L2JXUXlKNkVXdTR4SU56TTI2N3F1?=
 =?utf-8?B?czJCUW5xMWdKTG9SRk8vWmNjeFBKT2RONjNpdGdtclVwdnlZRThxZjgyZC9O?=
 =?utf-8?Q?50jYmHqAD19FlM6tqp+9g/+YkF7PJ02b9EgwfUXqZB5A?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94492eac-f3a4-4f16-dbe4-08daa1fee7fe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 09:42:21.3600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+B0EI1UcBV86LiLBYrX/FcZ3k/paAGBPTvL9/pgAfVqY5Yk2zlR4P1tS2qs1TImbiwIC83MQM1bpNbMEwJEWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7677
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------VLn2ZCsF9gGX987Z9xQj0vDa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19.09.22 10:21, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    ce8056d1f79e wip: changed copy_from_user where instrumented
> git tree:       https://github.com/google/kmsan.git master
> console output: https://syzkaller.appspot.com/x/log.txt?x=16a02941900000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3afe005fb99591f
> dashboard link: https://syzkaller.appspot.com/bug?extid=79832d33eb89fb3cd092
> compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=165e850e900000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=123a8c96900000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+79832d33eb89fb3cd092@syzkaller.appspotmail.com

#syz test https://github.com/google/kmsan.git  ce8056d1f79e
--------------VLn2ZCsF9gGX987Z9xQj0vDa
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-idmouse-fix-memory-leak.patch"
Content-Disposition: attachment;
 filename="0001-usb-idmouse-fix-memory-leak.patch"
Content-Transfer-Encoding: base64

RnJvbSBmOTA3ODU5MWRhODU4NmQyMDMyMTJiNTcwNzljNGEwODY0MDM1ODBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBUaHUsIDI5IFNlcCAyMDIyIDEwOjA4OjAwICswMjAwClN1YmplY3Q6IFtQQVRDSF0gdXNiOiBp
ZG1vdXNlOiBmaXggbWVtb3J5IGxlYWsKClNpZ25lZC1vZmYtYnk6IE9saXZlciBOZXVrdW0gPG9u
ZXVrdW1Ac3VzZS5jb20+Ci0tLQogZHJpdmVycy91c2IvbWlzYy9pZG1vdXNlLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9taXNjL2lkbW91c2UuYyBiL2RyaXZlcnMvdXNiL21pc2MvaWRtb3VzZS5j
CmluZGV4IGU5NDM3YTE3NjUxOC4uNmMxOWU1ZDJiNGQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3Vz
Yi9taXNjL2lkbW91c2UuYworKysgYi9kcml2ZXJzL3VzYi9taXNjL2lkbW91c2UuYwpAQCAtMzQ5
LDcgKzM0OSw3IEBAIHN0YXRpYyBpbnQgaWRtb3VzZV9wcm9iZShzdHJ1Y3QgdXNiX2ludGVyZmFj
ZSAqaW50ZXJmYWNlLAogCWRldi0+b3JpZ19iaV9zaXplID0gdXNiX2VuZHBvaW50X21heHAoZW5k
cG9pbnQpOwogCWRldi0+YnVsa19pbl9zaXplID0gMHgyMDA7IC8qIHdvcmtzIF9tdWNoXyBmYXN0
ZXIgKi8KIAlkZXYtPmJ1bGtfaW5fZW5kcG9pbnRBZGRyID0gZW5kcG9pbnQtPmJFbmRwb2ludEFk
ZHJlc3M7Ci0JZGV2LT5idWxrX2luX2J1ZmZlciA9IGttYWxsb2MoSU1HU0laRSArIGRldi0+YnVs
a19pbl9zaXplLCBHRlBfS0VSTkVMKTsKKwlkZXYtPmJ1bGtfaW5fYnVmZmVyID0ga3phbGxvYyhJ
TUdTSVpFICsgZGV2LT5idWxrX2luX3NpemUsIEdGUF9LRVJORUwpOwogCWlmICghZGV2LT5idWxr
X2luX2J1ZmZlcikgewogCQlpZG1vdXNlX2RlbGV0ZShkZXYpOwogCQlyZXR1cm4gLUVOT01FTTsK
LS0gCjIuMzUuMwoK

--------------VLn2ZCsF9gGX987Z9xQj0vDa--
