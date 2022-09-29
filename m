Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C497D5EF1F0
	for <lists+linux-usb@lfdr.de>; Thu, 29 Sep 2022 11:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234962AbiI2J1s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Sep 2022 05:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234886AbiI2J1q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Sep 2022 05:27:46 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130041.outbound.protection.outlook.com [40.107.13.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86DE51449FD
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 02:27:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dySe80ZJelb+1DmkI0go7+wMGR3SyGG5Maqtl9+dCi1tGOZXTsaSjqCc0HS4B4RXQlLQrHfT/OVz1L5rORgTZV4BdKRvSRcNDk1FNV3eaieHIq/XwBlSz7+MYZJQyVp9ObcZjDbAfvViU4hll1UZqwOaIePgo1+EYa3l+HNbwZrn+N/YZ1Q2Hnv+/X1znDtjCsbbQEomv0/oRJrZ19xzI0lJFItbhlnxcuQeBx5Z2xS3rIs1ks0TWL+AcbQoUMH3pjcSxOnvZ8b02vjL/OQQ+0gY94abEZ/0MbVBV/+QQ5r03LDNBMJZiPqLvWwOEWHNr3gZgUtR3cTDi+fVLExWgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ty2sqEBq3PM0YVHtVZ6EhEDVObqKQAECWoODsykPuG4=;
 b=k0Qa80ZLKDiq+eJElcJlTMHwodOyDsxhnCRqd+kFXTRda4aK9EdgVTZ7N1/BPqEWbWKA8flue46ZdMwSFK0RWchZNGoQ6tXYL+GT5BDQ1DTRPhfilR/r+az6s2XquvRmcGUj2rN9M0tZ6ue1x1FXLpY6w6gz1ZBp9jUjyl6ZRVNrbW9kKTL3BTT+MQHimgxbFIkO/pIJC/D/f20OnoSMPhyjmN57s6dq1Z44FYIMMvuhnM0y0iZ1ZV2qSS4W+/fbpJUB0tXpPSfrqZaTMd6xKKyMi2/lINxnqUHayF/vZAMEnj5D/geDFQrTmxjJMb/e05ic4/YvePOneiv3lOTL8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ty2sqEBq3PM0YVHtVZ6EhEDVObqKQAECWoODsykPuG4=;
 b=3cUu3AqpVi/7Psz2orWlIU5AEd4evy0LioSe7DGUI71u2aXjvwMcKLANMj34J0llneUAxvTEcqPM5LcLgRK38uQP0vnhaKBjz0LvWqDNzKciEIikzKYrTOpwQoqqNKCBYDE4WRyBIcqB1ziQrl5/eDg9GsEhAytaPIZCrS7GmlOx+IDf4EQm8zZcomuTPz5ZEPn2M9z9Vzkknik47EPGMIqO9Gz8U3+fnUw9yYY98wgXUC3MevE16PiBGLSWsgIJgddMDYKkGM9EwlxWHVS5Sv4HZDOb/FdyXfFXT10UpWZT40FTzpnoLbOVgJD+fWmI78JG8RaU2eL/kG3jK0eEaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by PAXPR04MB9059.eurprd04.prod.outlook.com (2603:10a6:102:220::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Thu, 29 Sep
 2022 09:27:41 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::584:c4ea:a4f7:af1b]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::584:c4ea:a4f7:af1b%7]) with mapi id 15.20.5676.019; Thu, 29 Sep 2022
 09:27:41 +0000
Content-Type: multipart/mixed; boundary="------------BsIdtau1ph8Fq62hI0Wy78xq"
Message-ID: <673033a0-de29-f05f-b7c0-abf3d108b9e6@suse.com>
Date:   Thu, 29 Sep 2022 11:27:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [syzbot] KMSAN: uninit-value in idmouse_open
To:     syzbot <syzbot+79832d33eb89fb3cd092@syzkaller.appspotmail.com>,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <0000000000006f6f8f05e90366aa@google.com>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <0000000000006f6f8f05e90366aa@google.com>
X-ClientProxiedBy: FR3P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::11) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|PAXPR04MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: 1122893c-119e-4918-88c2-08daa1fcdb4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 48AWIuBRY/Bc8ZoU5g71yfD9uKeho/4dMb1wviidDr7Ita7eQRvsfMHY03s7Tm6td9gPbKf015ECjlZKuXm32XFE+sOcxQAfsqWT1ybflDLaRF0Qtv2TPI0yeG8gweTVeGB1gHidBR2hEOnTmQ7sQOEoP7m27yGaObT7L+uN9cXSlk46uMJpsRHVcG3Dsv09GHtUQmKLbXYdeT3lmIYbPntSf+cOxWbqPNCTlD5RivcREYz9FsSe784H2bXcNe+ZcgCaQUAvfMSkSE0kefSVzhI0KHdLajFfJw1atRH5uOVwBTI2sfw6Gr0v0mifbnuDFi1DEdiHAbXgUSD07HaKDZ/eR0sYREgbjSWolbaFPQN1y5eNd2OkOfggf3nPkzp9RHBebui3vix9mPvG+ipLoGVrq22zo9uHCO67RbYJ0+wgvCrgCsrBnY+SR9QM6WPDVUu4aKP5GnzzJnVo0oiWNDG/ctnFOuiCeJ8ZLkjYoQUnPlqBv0vF1T+5XqO+FWSwn4fILAIt6zfcldYy5jHfMORyRtlI4oAOnrgI9uwUSRTzO1MmhxLsO5o/F5kzau2waxP43f7C0XzGAe7EqHs3LbKX/PqlHQlHt8EAqHItnDuzrajOAV6MyI7o/HhgmOn13G388TODW+WWtdTwrIz+mwCINKdeWgI6IGeN+AcqIWiolTBJ9AobI2mMNHsPJrin3JHXZcXp/3AGeo6/AjsZ1AMxovCRI0pmZhepsTYbbMgu1TPz0jH+MeLQ0FuYnr/ZYKnY+vaZGWTZsnmEvK34xXJ6OMygrsXTcMgqlQWLNSfQJbc8CeM1P1LU8AvnyspeG2BWEXTvfH+ySuXJ4uDNOJ6foGPCu3xOV3AtFhjDJopTx3O2Nhy1lIqyLN/b0mCn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199015)(41300700001)(31686004)(36756003)(316002)(66946007)(8676002)(8936002)(66556008)(66476007)(478600001)(2616005)(31696002)(186003)(6486002)(38100700002)(6512007)(235185007)(5660300002)(2906002)(6506007)(86362001)(33964004)(53546011)(966005)(99710200001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXFsaHBXVTlrekxsVUdZRlAzUHZ3WUYzTEt2VnZrRzNUY0ZEMTJ4SE5MSWJV?=
 =?utf-8?B?VnVPQXJ1TGZQRlQ2M0dkbjl6ZFRUTnlsQng0Q2F3aVplMi9SWmU1clNiZlhD?=
 =?utf-8?B?NXEwQUs4V3d0MGVDZ3V4ZnM3T2ZVNFpkRTlpY2lXNTFHaWp3eXdkMHNoUmIz?=
 =?utf-8?B?QXhpL0k2WGNnenBuNFZ3RHRSOHAxN2pkTGkvYTNjZnlxUlluZUlKQkNJc3M5?=
 =?utf-8?B?ejdzQytGeHB2bUxJMk9UckI1OFZ6WDV5cGdzVms1ejlnVElLNkdmSS9mTTFW?=
 =?utf-8?B?SlNQdlc4QWRYZWw1L2xGN3MvRXpzLytaY1dQaW5XWHQyM2VXeG5GNUIxY1JO?=
 =?utf-8?B?SFVrTWdObUNtNlMraCs1dEZjRGpMV3RhTHlmczJZY3cvZFpiRS9jM0c4NW5U?=
 =?utf-8?B?UHVLcHlxZGJjOUJnQkNkREJ2UGc1UFlrdmd5VzYvaUZJSUI0NmZCN0cvNEZ6?=
 =?utf-8?B?SG1WVVBuL0RjRVhxRlRXVENXc1lrNE9yVWY3NSthcitIaXdzWVBaV2c2Z3hj?=
 =?utf-8?B?cTljZmZveG5HUCsxOTVOeVJFTFFVTDZzc0hJNjh2WU1ZU1BnUDNJYkkya1dT?=
 =?utf-8?B?amJKVHRudUhucHlVVENwZHJidzduYmRBclhaT0gwMlVNaFluNDB2U2JGUjZm?=
 =?utf-8?B?Q2pNczk3K1Q4U0dKZXY5OFFXUUxtalNCNXhUeDcrRTBDN0VKcVI2WFB0UzNo?=
 =?utf-8?B?UlpVSnJZbmdrUjhvRGpTbi9Edk5ZS094NkcxMUt2aHd3Z1NwQ0pvZmo5Nkdz?=
 =?utf-8?B?Wk9DUWVRKzltWHY0NkRoNXlydld3Y2VUTWRJQWsrSnRnMk9YSU5HK1VKeENC?=
 =?utf-8?B?OFFtYkh1bFBIVzVRZW1rUlhoa08xV2FSb2tqbjZXVzNYMW56cUplT0hEcnNP?=
 =?utf-8?B?RVJNMTE1ODV0bm56YTBQcTBxZTRraFB1ZUIyOFhhTDVURm1pbENsNi9Md1lG?=
 =?utf-8?B?Mkg5RWlrb3FTOHEvVW1CR0lGUDB2VmE5WUp4MW9saGdkSGFXWUhGZS9MMUFX?=
 =?utf-8?B?RjB6MWE1WWQ3Q00ySFhVRmllT1U5N3NFZFJJMkN5RkoyS1dEOFR2UUVudzlZ?=
 =?utf-8?B?Tkp2OXg3c2FXcFllRkxkdmlkU1NNemlyZVpTT083MmtsNVQzVkVkOVIwVjNj?=
 =?utf-8?B?V0g4ck5nU0tDaFlEZ1FHZkRkaG1ETkYrQW9laURVMGlONWZqZ3ZIZ0RDMnF2?=
 =?utf-8?B?SHBxV2dFUERVeXJ5VDEwZzdLTWs4cHV5TmtHZkNKSExCU3hJVURBQ2tXTCts?=
 =?utf-8?B?dDRScHhydDVGQ2FwbXVybTNneGN6bWUxSDlneVpIUkJ2OUEwUkdsM1hBWkI2?=
 =?utf-8?B?aXhvNzM2d2M2b2F5eEtPTE9RcVM2U2NLb2NFWSsyMDlMWFNEWkFWbXYweCsw?=
 =?utf-8?B?b1hNMkxmQjA5VnAvZFRNeXFwM1Y5cWpINDlUaWZEMitUYU1XeVNYT25nZE1v?=
 =?utf-8?B?N3djRFg0cTdTUlIzMzB5VXRFZTdoY3VpN0k5TTE5NjdMaEJVOGUvZndrelM3?=
 =?utf-8?B?WGwweFhPc1REd1psOUNCV1NyTWZkK00wUlRGWHNYMkFHSnJ4ZGxLSUhlZW8r?=
 =?utf-8?B?eGhmeExwVGo0d2p4clhDNWNCRmV0bHZ0QWR5U21KZWN1T3k5QndtU2RRbmx2?=
 =?utf-8?B?QTEzQXZXbnRLaVRRR0dWR0Y0TVdFaDJUK2p6OGNHNWFlN0RyaG1SZEZIQlpO?=
 =?utf-8?B?WE1XdFlaL3NLV1RCd1R0Sk9oTkw5cjBrQk92ekpTOHVwS3drYmNGQWxTdlU5?=
 =?utf-8?B?ZEFjZncwNXd5alVMK0tmMCsvdSt0a25rdm1kM3V1cU4ralQzczBkaldzTmps?=
 =?utf-8?B?WldxbUMxQnJyRThWcHNYbHlybzVXNDE2NEREbTdaZEJCb3hEckRzWmlrS1hv?=
 =?utf-8?B?UXpzcGdZYUNQRnNpZjhUa1BKNnhYUnYwRzJCMm1LY3Nxb2orK1NKeWFwSTJH?=
 =?utf-8?B?SEdLTXc0dGs2MEY1NWQwcUEvcUxxd081NUM0elRUdk9YVzVmVHpKenJhdEdJ?=
 =?utf-8?B?MmpWcFhvV1lrcnFoZkhib2dqNnNEMmkzRGtLTjNxNnQyVjNNLzF5V1A2Umha?=
 =?utf-8?B?d3NMZThVVSs2ZHFpd2NBb2prR3hORmpzL041VVBsSkJXaHR0MVR1Y1pkMXNQ?=
 =?utf-8?B?clRGU0xOQW9qSjJmZWhpWTQ5L3gzSFJzeHY5WC85cHp3TFplOHlTN1ZUMUZp?=
 =?utf-8?Q?rAzHkSVjapZV4IOhJS9xjaeF8Si65B4EEyffb17iigYw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1122893c-119e-4918-88c2-08daa1fcdb4f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 09:27:41.1317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sEPwDbj/a8Z/nz/tCQT92OQUf4j8oTZTvK/69DS8Vgyh2sDjWCJ3KhvGd5AE//7eTp/EuZhGYwXvFIquHdmDuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9059
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------BsIdtau1ph8Fq62hI0Wy78xq
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

#syz test   https://git.kernel.org/pub/scm/linux/kernel/git/greg/usb.git 
ce8056d1f79e
--------------BsIdtau1ph8Fq62hI0Wy78xq
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

--------------BsIdtau1ph8Fq62hI0Wy78xq--
