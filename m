Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC4235EF520
	for <lists+linux-usb@lfdr.de>; Thu, 29 Sep 2022 14:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234954AbiI2MUK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Sep 2022 08:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233488AbiI2MUI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Sep 2022 08:20:08 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2067.outbound.protection.outlook.com [40.107.104.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8A6145993
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 05:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ux9FD9KsXdsPvgKYlkNUAhok4ABIX5asceaeu75QYPfqqP9EIcar4VZ+seutkNEEiuvgJGZvW9cVd1vc+C53KGQuITJFqAq8gNZ9gX2v58Pm00f4fAFzaXoNen1TumHP8U2/LgorAwWfp8tXwh2gSG6kbdGmCOAqbbw64jXNBIKuL9EohpkHESpBAGBPcNju60ubDbugwDsy56EyopiuR1UD7jDi6s3HpY7TrN+RLTiuH+BwpV3XND7VwqLyZHtUTpDazLStSgyI3SPrEmeLexd3Wl0XtZeURk+FMi6jQyVcI1gMSOq2KgZWVM52hwEXEdW8MlckB/ngK5a4v15XSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VT3IGGBGahjZVPQ/uKCCfq0KhZwCZRS8QaBG8Cor7Ug=;
 b=B4z+edFr6LDnGkKkzbA/V8ue3DWA8O465phLDF/WAabdGOlL7R7AosS708mjEz5Hw0zLw9AFul4j682TxjewA79wVpyfJ/LmuPpUXyAvF8cfgwbSYw/CdU7Xq4/iMOO6qg4yCG2LgEYXeiHKxytgTlijHZCLjqdKpDvlyn+LpLHpyHU0YEW8pjtAaw3YG6SNCMmiW7zuEAKcb5p6C973zFLuTmH/Ir5hRIrQnLDj+Ws3wZSSawLTo5XFJ0TmVg1f0I+Zg8nnMg/FMpnsqpLVeO3nvJOrurYT2vbNrDfW3gp6oC1DYp/WG7RAvlLengsPAOsVqIlC56SUCH1rr9kTIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VT3IGGBGahjZVPQ/uKCCfq0KhZwCZRS8QaBG8Cor7Ug=;
 b=10akct8hPDUhubxIhHsIU4GmyUxz7vuE1kT2h0klpLKG/mdeULIMwWW/rVim5W28yeM46wb02yF5mMOBKkvjdaJ8KMml4FM9qOkYCfJlERd6eHgum0kPSJPzIUlWLehKEHyAR7Hm9yG9arflH8mz3Y/d+fPNcLBPLkYvph2oIvaGMkGjKcFJmu0dyq2FlAljs2oG/ZO1LUfW0YR5lBM7VmQbaBjixu51k9SB1jZ8xHI5xdwf5ijXByzhWn/siSe2klfsdA9ZrAQkSqj22ILWJEBknZ3+RZV7OJNGxotc2FCLWwHLQmb6zXgd9gsNCgYGGI+AGJh3h36VD/lbN9bpPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by DB8PR04MB6810.eurprd04.prod.outlook.com (2603:10a6:10:111::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 12:20:02 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::584:c4ea:a4f7:af1b]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::584:c4ea:a4f7:af1b%7]) with mapi id 15.20.5676.019; Thu, 29 Sep 2022
 12:20:01 +0000
Content-Type: multipart/mixed; boundary="------------soIhfpD0mr8GpSsnhI08e99W"
Message-ID: <09f1f632-57ea-93e7-46c7-2065744c768f@suse.com>
Date:   Thu, 29 Sep 2022 14:19:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
From:   Oliver Neukum <oneukum@suse.com>
Subject: Re: [syzbot] KMSAN: uninit-value in idmouse_open
To:     syzbot <syzbot+79832d33eb89fb3cd092@syzkaller.appspotmail.com>,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <0000000000006f6f8f05e90366aa@google.com>
Content-Language: en-US
In-Reply-To: <0000000000006f6f8f05e90366aa@google.com>
X-ClientProxiedBy: AM6PR08CA0003.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::15) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|DB8PR04MB6810:EE_
X-MS-Office365-Filtering-Correlation-Id: 254d115c-e378-46ac-5750-08daa214eec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zjtbKPmzpjy5IJfUU9OFy639sJexHCNm2+nXWuzpfJ8uHRw4Q5fel4AtYjubo4V6ceOorR4d6enDwRmzaKP9C10R+osN92yPSn1ey9xpd7NtQKJD7AudaHWDn5+POoB7Ze5nPOiwd6Fi8Ed5pkm7/QDttpAonnPZWPxh5por1y88v+VIY3H5YORwrUFzXWtS6SJ7TJlQhSNLUdl6LYvcCP0NmalOmn7j7JnPeUutrl/x3+o6mbf3PaAvtfYPp9yykO1CCwr9FX+KWebngAXi1iMkIT7daoqnKaN17Pg6qD91EAwhJZWHsuPuLWR5Oa42awLl5R/di8t86Qp0g+yHtl9d3kbFS8w0sBQZR+3baHKwDv+9VtntI6wJLs7H8SKBQmtTWp+HFE3PSIe2UfvCWhfRIRsChChUsNlz2chs7yzIugocRyiouqLfY/yYCwOSuZ7QFim5BADAoPF+2sSGe8VZpjoEUPxWGSflW9+QnfX+l6n9NyurWbBe+M3Bybqi4YRRZ2Iq4hz5ePkuKx2vSLFKlkUd5hEpKlW2i2A1j2TLGA9wMeQVfE03B33VMwAfdZrvDawZO+betut6LRi8CYdPsRsXyFCZmBsQ5Atmy7FgZkDrogA+7U3IcgAhaDH9OZtUxFjeYOewB8aDIheAxTyY5ITAwDjKoiUlXZeRth7YS50nLA3zUb7rkJfWwz/jB0ZtE+4ZsfQIzJdqQ1c81aadVD4FWOKcTRwf6hbjeNlY2cOcTkVwnZuLnz6Ol6BPfklOpNBZvAxfpHLz1OF0ueAz3ZGvOVzfBHxHsvy7zKtgh1pvFE1axx69NCSUDlPuRWQnB74PHYbmQWlgt2FxOh7SpsaXQj6/E+g7Qbr9xv/4/MlHpOQeXrmaLxLuENDU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199015)(2616005)(31686004)(2906002)(186003)(8936002)(6506007)(33964004)(316002)(41300700001)(6486002)(38100700002)(36756003)(8676002)(966005)(6512007)(66946007)(53546011)(66476007)(478600001)(235185007)(5660300002)(66556008)(31696002)(86362001)(99710200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2dGWSt3VWxUUUM3K0JnRGV0MlArRWdzbUI2UEZocnl3L2dXQVlJUmdOT05W?=
 =?utf-8?B?YXZJb0pVa2Y4MFJVQmdFbEVaZWRWbVcwb1RSNDZqVDNPYWdRQnYzcWtBd045?=
 =?utf-8?B?alJtakpjRjRhT0tnWWZSTTV0SEtRVmRNeWlZSk02ZUZ5dTd2YzJCVVRKc3p3?=
 =?utf-8?B?RGROWUNaWWdzZHVrbWxBS3BvNHVpNlVXeFpPVG5nL2lxM2VzSTRwSEM5ZEtF?=
 =?utf-8?B?NDdYNERSankyMnVuZStJbTV6elE4OEE0cks4K3JPaUt3ekhSYnRvcWtSYlk3?=
 =?utf-8?B?RjlSbDlZKzdvd0htUmp3SFo3Vmw4akhBYmhoM0JlRVpnanYyVXR3UWpaUjMy?=
 =?utf-8?B?RjBUbEhBbDBNV0VPTmV0TFpzMXJ2VzJoSUhiVlcxZEhNb2QwK3FndGd5SmE5?=
 =?utf-8?B?dExpbmwyNnpOT0tiK0hPMDBiUEJxdEgrc2RCdjNnVUl1dGdQL2FKMy9lcWFR?=
 =?utf-8?B?R2NjaklzNkRGdEN1MjlDSUdnMVRrNVg0OTd0NDl2Z0dvZlZ4V2k5aU5qbnRl?=
 =?utf-8?B?a2tjVmE5L2l4S2w1WXNSVC9zQ01XVENWcmt0dTNNR0FDQ1lmY3NRcEMwdGd4?=
 =?utf-8?B?YnZ6eGpZNWl6dlVJR2wvMzNwRkdFaUNuYk1NMUJwZlVvVUpqN0xNK3FNblNy?=
 =?utf-8?B?YTMxejRTRlBkcTlFbVRkM09ldVZudlRpQU9OMXMyaVgrSlFxeE93MnpZNERr?=
 =?utf-8?B?bTdYWVp0ZFRjWnozSkZ4WEFtK0c3QnY3M0w4c3BUcWMzc3JqbFBvYVo3MDZr?=
 =?utf-8?B?WW9OYWJSWlpzR0RVcVhoTDRVam5hdHF4N2dZTU1vMzBoRFRpWEt1Z3V2OFBE?=
 =?utf-8?B?NXdnVEF0VVhham1SMm5icTBZN0JobFpBUjNEeTdIdnU4Qjl5RkNhNDJCOWJw?=
 =?utf-8?B?TWUrT1Q3TmxSeVA0c1NDNDZZdDR3dUdMOTE1L3JzTVM5cjZka0twcXgybm9E?=
 =?utf-8?B?MzgwRUVDYndxeGJ6Wjk1cEpEYWtESHVOZWt1Q2xQLzB4b09WMVJXcnN0SFVK?=
 =?utf-8?B?UEwwVW5ra3M4SjNtTkpSY1lWdG5JdTRLclRrNUloeGlrK3I4TnNIVGtscjgw?=
 =?utf-8?B?amR2OWNpSVhLQWp6c2FSUmlOV0dUbXhaWXBZYTdBWFJ4Z3M2cWIva3FFb1VL?=
 =?utf-8?B?Y0FXRElzMlZjb09kTVVoNnEyNUVpYU5Dek9UWVVBVkhmVjUwTHdVYnNsT3cw?=
 =?utf-8?B?Vno0dlVybGtiRUt4d29LeUN3ODB0SzFaTmRDSXFrREdhUTlJM0swWlN6U1pq?=
 =?utf-8?B?U3ZaajRpb0tFS0hlb09sZWdKZ01ETGZZbkFOTlBWZDhoY1BzM2FFeGM2MUhj?=
 =?utf-8?B?dzhYV2ZtYzNReTlobHFPeFAxVTg1WXBVT0ZGYm8ySm5IZGFuemlnZkFCQnZV?=
 =?utf-8?B?TDlPRjJ6d2ErTTh6Tms4OHF4Zzl4Njl3T0ovblhMMlF1NFVZemV4SE1sR2U2?=
 =?utf-8?B?TlEzbm42RjB2ajVmMlp5NmJhNHc5YThXcXNSOWNxODFKT0RTTTc4TkZmYTlx?=
 =?utf-8?B?T0hmbVFjeGVNRGQ5TlJMZ3hoOG1SWElyNXJuc0QzWWYvN3pFNUVmUXp4dnRU?=
 =?utf-8?B?UkFCQ1ZUcG9zV2luU0F0d2hoak42cHB3T1dwMUNvUllxSkR5bDJFeFJuZ0E2?=
 =?utf-8?B?c0NIODV0anlFSFNOaDFOVUZWZzQyeDBCZ1AxcmgrY0RDTDM3SU9aZ3dXdmJm?=
 =?utf-8?B?YU1udmpYN1JUL3ErNjVQUXVJMDg1QXBna1o0dWZEWWYxNHpxQXVaL3V0OWpn?=
 =?utf-8?B?RkdaY254U1ZERGhvbWpKc3JINk9uUXVPaVdtcm5pQ25vSk5mOGYyWngvU3d0?=
 =?utf-8?B?djhxSW92ZlZ5QzZuZmVDYnErZkYvSUNEUFdHbVZ2ZUNNQ2NvQnRINTFHMWxy?=
 =?utf-8?B?NFdtaThyUXZ4K3A0OTg3Z0taV1dVWXhPajRtZ0J6N2RJc0lmeXJVd2NZSk5F?=
 =?utf-8?B?ZnNVNUZZaTI2UEJlMHhYbW1LZXJ5REQ2L08remNKRFpXUWxtWk03TEZxWnZL?=
 =?utf-8?B?Wk1sUStncU1oRU03NjdyR0pwM1hxUnQzeC8xeUYzLzAwcEdTbG1TVHBLMjlK?=
 =?utf-8?B?TlZUeTZpZ0d5Z05DS1hBUDJQTC9tNnpwWmc0RFBiYVZzd3BqbkphMXNDRkxC?=
 =?utf-8?B?ZkptckRuT2JlZkgzNFlRd0lUd0N2ZFhvcGVXUjdISlFQUkhmaStiNEZGR2pC?=
 =?utf-8?Q?Wop2ivnyHex9nGGAbo2T2BIQqKFYCjyWL0G0jKE5YyGa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 254d115c-e378-46ac-5750-08daa214eec0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 12:20:01.6380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mtxz4kFkspZnGujY+tu3uHvq6jssLPkY+6hYa8LRQXvpLR6clrZrQntaTOXaMgLCniSaS+u6kbH+kAgc9E55pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6810
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------soIhfpD0mr8GpSsnhI08e99W
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

#syz test: https://github.com/google/kmsan.git master
--------------soIhfpD0mr8GpSsnhI08e99W
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

--------------soIhfpD0mr8GpSsnhI08e99W--
