Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B64995EF487
	for <lists+linux-usb@lfdr.de>; Thu, 29 Sep 2022 13:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235165AbiI2LnV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Sep 2022 07:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233190AbiI2LnT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Sep 2022 07:43:19 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60057.outbound.protection.outlook.com [40.107.6.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5870E14F812
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 04:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mB62KsGAmKLXJgoEhK/w2uvDDnO5AmRLjAQNv2vVUULa3+BO0VnbxetNlRMbF2ed+ZoFlv6rB/o3jnYInVPdN9fTkro2dkR3rnAVO+r04Us1VjFiKQRJMKsMJVb9TXH7BwjPNtzYxrrRX2lkhV+5nBTRYP6GmEVE9nYNqvS6mkf+mz/eSTB6YdFNshUDInlL47Buv0iZH+Xxk0s0rtbPIgFzouY6JI7GuokuCrasvJ0ymUqdbOqDsN9ZkAw2lvtUYZn5GbAgrZuHbgI/5jNB9nPwoGeDt7ekg3vRj2I5X/nPQ23yBhsN2ju16AYc8nznNNAlrXiak7cziftyrfHstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbGSo7dUOsC2Z3qKt5OLpaPYujGt/ORZOePTZtCoDcw=;
 b=P5sia5P0zCuS3irOi9pdhA0GPU44t6wBQYCW6oVn4Fer4HdLYG6aViU4xfj09+3x2awsCJShyjOd6bTwL0qXJu0PVzanYP/roP/emtxQ/Q2liQjivQeR0Oti1wCPehBeFNYDkAgj4Xm1l6UR+zd9UOl9+4Kw2IpPWrwr/Y73hhgHnlZdFdZHOEV3Zt49byN35mzKgZhfRKV77Az4cnnuFsozRvQzyXWCsl2s0r5TuD0enNkW6pfSAHr2SK1QYkkRKxwc3m+sm6Hw8+ROcVmiZtV+CzRlwUJ5PB4ncux+qAEzsvfOIey+1bt+3+EKL8InrUTJ2eYe73vC80+nbwdN6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbGSo7dUOsC2Z3qKt5OLpaPYujGt/ORZOePTZtCoDcw=;
 b=DoWkfuq68NvhEOQWLaVgWWhNz6Xv1fJdYjV2iOwO612JEZoPGRhJ8MmsIEDXX3Gh47lvbV7wTtMF9EhzTSlMAX06Wzou6cXde3tgS/Ks8qvaxJe/1R2w5xDbXPEKe7Jhke0+GvAjD/zqJzJWXpADyaFv1nPUEciQHXTFF72JRHgO8qcd7wtquzZnTtJV5OQxcMm/DN2jH1jhHMVJjohcocoiz798VfbKWCknLxkQd8/8Occd0cfJ+nx25y2cj/SA3j2As2ijj7B5TS9b0vy070top0qcZyBqDsmMZ3WOkTxB43WwBfiw1k1UkvXND84zaHYdWB647wzF8csvlg2FCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by DB8PR04MB7148.eurprd04.prod.outlook.com (2603:10a6:10:12d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 11:43:16 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::584:c4ea:a4f7:af1b]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::584:c4ea:a4f7:af1b%7]) with mapi id 15.20.5676.019; Thu, 29 Sep 2022
 11:43:16 +0000
Content-Type: multipart/mixed; boundary="------------m1UP05beoNohxMqZ5UmmGeeC"
Message-ID: <fe289e7f-dedc-a0bd-f79f-72c80dbd5028@suse.com>
Date:   Thu, 29 Sep 2022 13:43:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
From:   Oliver Neukum <oneukum@suse.com>
Subject: Re: [syzbot] KMSAN: uninit-value in idmouse_open
To:     syzbot <syzbot+79832d33eb89fb3cd092@syzkaller.appspotmail.com>,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <0000000000006f6f8f05e90366aa@google.com>
Content-Language: en-US
In-Reply-To: <0000000000006f6f8f05e90366aa@google.com>
X-ClientProxiedBy: AS9PR04CA0124.eurprd04.prod.outlook.com
 (2603:10a6:20b:531::11) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|DB8PR04MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: cfbec2f9-f617-44a0-7ba7-08daa20fcc3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P0d3cqMbBZ6mRDyKbcMt3wwCxwu6e/NKgH0fPg9Xp4S7sWuv5vV9Hm6EZ8d1BMJvSKOhU9U2/NrTQ33Br1QPyOCuTajtWgRuN/QZld4K52yub9t6wVGcYlRx11hi9KoNEgHeEKMADd8mPy/UCcmg8X775lEWyHELRExAsN2sMnl8ItUm6KUN7OlD1aV8AmyouYI68Xms4NKLI/teG8CMP4NChBF8QsLDJRUS8H1gw9ZPPTmRpiS+pkrbNeYSAVWI21qMhQidPT/cP26Y+2tWYCeM1UCxXgRr96X3vIW62AtdYpilVy6KDh1nK5tuk39SIRH+HRMUOcVUoCH4AgyJaDqbWyuyAU7kEUiIEBBbbFAtDjnPl19wrRXBERu+6QeRxA0j/+4ELvmxtG2ZT+nIGv3uoWSinBmcCY8ZHQsdn8AV8oOpKyLoASSwf4ohGO0AKZDwkrj47bZaq0bmztQ+HVsmpWdazFs5/Efs0X1W68NshpaOXdIRtxmgXa5MY6DlCaC/oO+tNM42DIePkYF/ErM5Gn9VhZaRh1aFlQfEamQ1dv2O/Br6yEAc0Wu5KeVk25WCNChA2A/Yax428Db835JfEZ+E5sFpNH502y48Tga9fgj4vPig3VQQjYIALXQ9hzm7jUIMPLdFr53pq1I+E/AL/VF6kN/vVnpAZkU0fFKB67TOQX/yZIgexY2dgICMXcZx8nriPEu44iKxDr/Ul7AeSB1onacOuIbuTeNGyc9Jdx9tgv6Ogi1zTPSXS+Mxe8Nb/mZdCNroTo9se8zI2ToqRbKBD/HRzv0QYT6Euv+OaYYOq7wF+sBkYlDUNgp3e+NiV0h127R0icsVOh2uc9OhsQo6W69LG4vhri0sIqwIFxr2/Kp37pCycWhufGw/Ci2IUUV9kqkKr8AAjPj6bA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199015)(53546011)(36756003)(316002)(86362001)(31696002)(31686004)(5660300002)(235185007)(6512007)(38100700002)(2616005)(186003)(33964004)(6506007)(6486002)(66946007)(66476007)(66556008)(966005)(8676002)(2906002)(41300700001)(8936002)(478600001)(99710200001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nmt2UGVmYkt4Y0QvRDUvYmc3bWc3L2F0RHl2L09WMktVZmdTU2VJVC9YUG9i?=
 =?utf-8?B?eWh5T0U4SGZpbnhGOEZyQklKeml5TUV2aHVseUhCWHE4TUVOSC9mQkpRRVVk?=
 =?utf-8?B?MmFXV1lsVmlqQjVwOHppT2phaWJFMjRTRlZ2d0pMUDFXa1lBYTcwVlBPYSts?=
 =?utf-8?B?VE1mc3FnZ21PWFV0d3dTR0pmREIxcEFPOVlIV0l6dkFTWE41ckd0eFZ2SkNv?=
 =?utf-8?B?VHJUMWM1RHJFVmh2TDNvcUhNVUFVU0ZPWlFIVTEwQzlkd1NZYlRiemNRQU9X?=
 =?utf-8?B?UXljeStKQUsvMC9ZYzZ5dW5zWHpPNjkyZFh3RVY0NU1Rc3pab3hJVC9wOXg2?=
 =?utf-8?B?VTN6WGlnOTlzaEZ5K1BTUGMzWVVEY09FQXRKeW0yOTRNaVRaWTNCVWllOVYw?=
 =?utf-8?B?dUdMT3B6Z3RoaDRUM2ZPODN3a2ZpdGtTUjkwZUF4S2l1eWRPYzhOQXlIKzBM?=
 =?utf-8?B?clBxRHAzNWtITHhlZTFQUTB1V3BnWjBRb0dCRXY4SFJlZEc4WndTMFFuN3ZO?=
 =?utf-8?B?SjVlZE9LZjh1aWdRMEpQREYwVFRxQ0ZpeFNjYU5MeVROVGZjKzR2VUw5Sm5M?=
 =?utf-8?B?b1Z0MUV4WTFtZWRZbFF2STM4aTlZU0pYSVFUZkVSdWZsRXpaVXVueVZRYjBC?=
 =?utf-8?B?VDdPRnRQT3AxNFFUZUQ1MWtnU0N6YTE0aDlHOU1LcTFGU2MzQU1sUFY4ajhM?=
 =?utf-8?B?eFplUEI2L0p1TU1jNCtKTVpBVDlxbmttbm5BcXVpNUdZYlBINmdwamswOGhG?=
 =?utf-8?B?SXZQRXo5MTJQQ3NUSDRqUzY4WlkzTUlXTnc1Yk9sNitQWlNpdUlWcFFBdFpX?=
 =?utf-8?B?MDNya3poeksrcUdCYnZLYlpSb296VzlOWG1leEl3eTRYaTQxOEJmUERNbElP?=
 =?utf-8?B?QzJGd0dvcFFzb1VyS2N5VU9iT2hOU002OGh3VWJweGJUK0c2NjJFUlhkdHRP?=
 =?utf-8?B?ejh0UnZYYmd2OTBJT285Z3V2MjJUT0JzcGNxNUM0ZE9SSjhHc2YrWmUzZUZW?=
 =?utf-8?B?RjhOamNtVkhDWWdBVjZMQmxKVWJzWkNWbTVVZHV1VG4xNWQ3WnBwUEJzUkdw?=
 =?utf-8?B?MnM4NGplY0dBbHUzOW1LNSt0ZFlpWmxoQ3BtNzlnM1BZa1VkZlFPdkNrSHpk?=
 =?utf-8?B?STR4bkR5T0s5WVVCTkVSMG9DdmF5ME93TFhGVGMrQ0V2QzN2VXRTNWJrbDVE?=
 =?utf-8?B?YWFVdEM3ME1BcldRS2NMalhZbzZlR1dZYjczRTRtelNnZldRS2Z0a1ZYUlhJ?=
 =?utf-8?B?NFp3OTBSVDJYdGN4cWFVQmZtNHhQZ1RlR1U2Sm9IMVZ5blhHNDM0S3UzVUFx?=
 =?utf-8?B?UWR1bUl6NXdOaW4wTmxvYzRtV0JtNnZCbkNHTmM1MU9nYVRHQkNaSk51Tkk5?=
 =?utf-8?B?WmlQditHRlFNc0hpWnlZR0VWdXQ1NjE1aGE2RlhiWG5uOHBMd2Y3aHRqNzVN?=
 =?utf-8?B?MG40a2hBQzl1ZWdvc0N0SXJ5VlhuMkx6L09VVG45US92Tkxac2FLOXh4U1Z3?=
 =?utf-8?B?eUNobENPczBZK21hUFM0V2gwUHZpUUFraWNRWjR2Ylp3VDNkWE03NWIxM1pS?=
 =?utf-8?B?RXhMM0lTeFBZRitNWGk0Wmw1VUI3aHZ0c04zSU9XOXRMUHlscVY1R3c4R0hP?=
 =?utf-8?B?TTFQaFA3YjZqSVIydVNlTDJYYTBUdnA3WWN4YUlsc0t2VHZNdnIwOEd3Z2Yy?=
 =?utf-8?B?Z3F4eEhVMXNwSXRUMS9YcVlNVVBtOFpmMWM1RzJlSmpqdmFrWEU0YmVET0E5?=
 =?utf-8?B?TFRaMGdpaGh5YThjeUVtZ1B2eDZraTZjY0ppR2d2SnVxcDZGalp2VGROUjlx?=
 =?utf-8?B?ck44dkxUWDJsUnpRSTdORUtYeFNtbzA5N0NFWDloNDY4MjFBckFWTGpkODVQ?=
 =?utf-8?B?bUk3NFpUY0YyWnZST0lneU94ajlEZ0NjeUpCbTJOWmRydUtRRnE3VGFKeXlm?=
 =?utf-8?B?NDA1aXZhZ0JrcDZLM1J6OHBBcHRUSmI1OFN0SmNiSjJzNGduWDlidEkrWjNE?=
 =?utf-8?B?NWdpOTM1R2Vlc3dmMlZEVHdyY00ycDQvOVdCeU4yaTRESEFvV1VNdmFHZXNx?=
 =?utf-8?B?YzNyRGFCOGtkdlVlQ04xT3RHUHdwdWhyWDVUbVlSQ254Ty9SQ254Zzd1SDJx?=
 =?utf-8?B?dUswMEJHNzBuYkp6MXpOK2VIK3A3ejhRY2pKNTRESG1EMTUxdVh3UmMyUHFv?=
 =?utf-8?Q?HLZBjgS42FXi/EjGqcC9K5C4uQgkk252z9ycfu/oU9Mx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfbec2f9-f617-44a0-7ba7-08daa20fcc3f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 11:43:16.2205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0agptXmLIpcsfeYY8gZJ2WZZUyhkOEBitt0yQcMcbDM/v1wL66bVGRuYwScnoMc18Pv4aCnDqYerX39SMZ18Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7148
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------m1UP05beoNohxMqZ5UmmGeeC
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

#syz test https://github.com/google/kmsan.git  master
--------------m1UP05beoNohxMqZ5UmmGeeC
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

--------------m1UP05beoNohxMqZ5UmmGeeC--
