Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6536A557575
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jun 2022 10:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbiFWI22 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jun 2022 04:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbiFWI21 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jun 2022 04:28:27 -0400
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10047.outbound.protection.outlook.com [40.107.1.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF6C4553D
        for <linux-usb@vger.kernel.org>; Thu, 23 Jun 2022 01:28:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NeLzVrmW4S2pbvQl+SlRf6vgEmZnDuodjO6s+n4oLpo74h37SDLngoVf0CfIIY90Y3NtG1hYmJ5pAM7pvBjnyFX0QQSW0+xJ0+r92kBcg05hRquve28eMEhgJt/xJy53iW0ZC3cmCPChTUE8KzycZjNpBt+rPSWOQTD2wOgoL31a2S7eUBQ840UNjOuSNeDblXeMooyvdXPl0m3Q+8/JQV+yskngI/FaUDim9MhyN2JkztRNWBRwfUlqgH/dBJfFmVLWdM1/zefQAa/i7rwNXGEN3VApy0G2HLmMzsHszheOkcZjO9PrmP1Mv7k7umsl5P+xhIl55ANYOtR3RJkWxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=drG5I+C77cN/CEwD7AjmHE9JfH6jl5nz8ePl0qeGSTg=;
 b=SmK9E1VCp5JEGyu50oZOT87tFIIDeqKLkm+zfyOIzgzCkLim84LRkq8OTNJVmXnFapMvi4pgSWCxGQAgllzug6w6OknIsHo2T/nUUqkq/ra2WOacoofACQEge3Koy5JNqEeiUejK8jWfv2PjnsY2+DWNf1Rt9qAf2QbZMrvLfDG0lir8aVcsS275wRShnAlEhBtRO+6iLNoLHt9UtwljRddJBa2dgGnNwkqVpco2rRI5s1wBSANcZYU8xns5NQwn5VfVEAjrQfxGNJnSevxc5/aLzcbSl1Gz1+rYL9uA6tnMSB7RB3ZMx+mCvkX0rpjZ/xcBpPoP/dzBdf5ErUtWAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drG5I+C77cN/CEwD7AjmHE9JfH6jl5nz8ePl0qeGSTg=;
 b=PDa5NgX2f231bxCrZrOTg6TKddPNX5EGQydwvgk9W7AhhHK3Xv79XlMTrS7mmjD8TCAl2acAUs+ALB/qPFIY4WYtxPYjH7v/DKmRAd9AeUroL4ssBOMGUWXgaRGvnJT61cpoocN1XbrkzqAiVG3vTKFx6eY4KmhzodILRDFYQgo+r0Rrft0Z0DZ8npsLpbivcI/1NJRaTvB9A21ldj9EgME3MFTXnB0ha1Eet6bDVu1XtkZsta9cqYlay/hTLr1/epaiOcHR1uttgciehYHvI09fJ95q7Xy8cUdNfMDvqo8rSMQmjwyJVBC2XKuhxyV13psKRkNagRy6LPQd7kAmkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by PAXPR04MB9090.eurprd04.prod.outlook.com
 (2603:10a6:102:227::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 23 Jun
 2022 08:28:22 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::21d5:a855:6e65:cf5d]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::21d5:a855:6e65:cf5d%12]) with mapi id 15.20.5353.022; Thu, 23 Jun
 2022 08:28:21 +0000
Content-Type: multipart/mixed; boundary="------------O0MpOjkGJKvBNOIaEYmb9YjG"
Message-ID: <dc9f9c31-b72d-0895-544a-13764538d991@suse.com>
Date:   Thu, 23 Jun 2022 10:28:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
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
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <f3aaf9e8-07c7-2c50-48c3-723c51f9445a@gtsys.com.hk>
X-ClientProxiedBy: AM5PR0502CA0014.eurprd05.prod.outlook.com
 (2603:10a6:203:91::24) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7375c4f-09ab-4fb3-e3f1-08da54f25542
X-MS-TrafficTypeDiagnostic: PAXPR04MB9090:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <PAXPR04MB90903C5A5FDA7826F63EE458C7B59@PAXPR04MB9090.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5oMhDG5IC/P/prn72qM1Aw165N3dtd+IfO4E2dZxvYI2LkMqWHhD48Hd4ScU2p/5KgGNcyzA01OEYDYL2t7Bj4+JD2iy2kY6VdhYYNq6tl/m29BzK6mLKaPlGOr0waB5eZ+Qo4yL7uGM17DGemIcCpCTlyRon2iobPMXZFOfVbrLLNTgq6u8NANv/WmbY3yl4C7jHBdqfCTo7i7eg90Am8mD0Rt3N7fUtMktJ0rRqhGAt6zuYskHaLxiKsfIX2+F4xmF9rQAcb4TH4Q0ZcTOojmsfPEPudCaznf4EyiY1Vao8huyxUOaCdtkcx65UytIeTaAR62cRlvpBi3oCrN6M2RgmaCuuiOxr9YgDjlmNMCAyeVsFkKj2PvaKKiGPkZpP5CRPhzECq3KDQVgs63D3rqRbVjRtIdF6jfCOnXJDjooVwOVQSqVOf9+zpXG0erT6qSkI/ivQTx3vlYWA4ToZzEq2Ph0Fmm/cOFh61h0MpdSLh1Zbg+jtTXb5btd/DewMfT/p+ly0R98S6FRaRS8Xdj8uuU2alunBU3uRo4xLFiDGBO/HZjwLEgkQoTHVsls65nh1Qyaar9A0rYlYiA/ck3TJesZatYRjK0ZyCkwtU/mZdO10D8l8t6B+jBeMIpKwou/85H1YJ5MI8UIeDwUKIzsJ2m6sK8AdoLdxv5UTa1k0k91bfujwjalzmncrFMyN1s6dZEbsBGsupIWuTqu4TggCt2GDGxVHdoIJ2NxS62ao+G5WprGn/eLmhf2qS0w8WQbJO3gpB98y5nE/96XBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(346002)(136003)(39860400002)(396003)(41300700001)(53546011)(235185007)(83380400001)(31696002)(6506007)(2616005)(2906002)(66946007)(5660300002)(8936002)(186003)(6486002)(8676002)(6512007)(316002)(33964004)(110136005)(66476007)(478600001)(36756003)(38100700002)(66556008)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0QrL1ZMa0lXOVpWRncrQ1NXM05lQzNpaFk5OEd3UUJacDJ1c1IyRjUzWC9Y?=
 =?utf-8?B?bC8ydGxhT09iTmp2K3puRU44MnRnemRqcVZCaU1RNGlaZUl4eGhtbHFtSjE5?=
 =?utf-8?B?M01sUEFqRkRycWVUMTNQWEpUM1p3MThoUVlkTkdoRVJWeFlJQ3YwRk9hK2Y3?=
 =?utf-8?B?RHNRTDQwU2RDNktkWTBUK0dhV0FuQWR0Z2NjK04yUG5nVE1HSm5YYlhtdEdW?=
 =?utf-8?B?UlVhMU1xWXFDWFhVZGVCanNycHlGRktjd2QwMUpGTWprdTE3em1BRFJta2k1?=
 =?utf-8?B?STlYVXBxSUpncEpldktnZzl0eVR1OFE4QzlWNHB1bFY3MElCbXZ2alVraU1Q?=
 =?utf-8?B?UVZEUnlZbkJoeGdNaERxV25qRlJ2YTBodU5aeWhtY0llQUhsSzRKRTVldkt2?=
 =?utf-8?B?QnFjLzZBYkRSNXVOWEtZamdDTnhOR0N3dmJsbmdyOHcxY3l2MTJUM3pjanNP?=
 =?utf-8?B?N0gzSUNXLy9ETUwxSnhjNEdGZ0d3RTN2K24rNW5lQkJacmEySUVVVklnQmdr?=
 =?utf-8?B?Tmw3Sk1OMHMwNVRjZjU5VGdWb2JzNkRva2p4K1krbU9HOTNTbW9lV281VGww?=
 =?utf-8?B?TGtOdEZ2VkRMVkgvekFvR3VOTDhUZGxrSnZQVGRVU09ZRCtXbjVxZExqeDla?=
 =?utf-8?B?MlJmTjhKNzFQNzVwV2tCcXp1enRaSXNmL01xN2JFa0U3YXJ5U0lWZ0lSNWlk?=
 =?utf-8?B?Vk9nejcvR0Zxc2k2cnZ1TjFld1dhS0VFTTA2Q21Mbm1mMHNhWVladEk3QUhV?=
 =?utf-8?B?WlNLbU5ndEZNZkdTWHRNWXNWSG92SzlLNWpWRmhPNnBqTlZLNDlxdXAybTFr?=
 =?utf-8?B?Ukd6RVd2ZjBJR28wbkVYV1l5eFZyU3Y5RllqL2NmbW9ZenRsNVN1a0pHbnpG?=
 =?utf-8?B?bEVKM3FqMmJqc2pqR05uWC84VEFXc2JrR080N1JaSHNPaVMvbWpRb3d1c2tW?=
 =?utf-8?B?cUU4T3J6WGRnM2U1TEpmTWd5U0ljbUQ5WDRONnpKRUZWQWdncldTQThkZUFK?=
 =?utf-8?B?Z3NqemIrM1hrc3I0US9BOWtGSVh1aHVKR1JtcGtsSEtkZTU2UzZpU2o1RU10?=
 =?utf-8?B?OEpXK1ovNHJMR0ZPNkp5Vm81UWhUOThmbEdmelMwQnYrOS9Hb3BQSHAxSVoy?=
 =?utf-8?B?L1ZDcjczcUIwWUtPbGl4V0NQZ1VleGp0MzdlU1VHMWh2WVRtSDNHc3E1RGJH?=
 =?utf-8?B?YzhQNTNFYTdKbDFIdHM4SVFWdW0rK014QldnUlQ3M09xMzM4Nk01azV5NmU4?=
 =?utf-8?B?c0xzd3MyeTRsMEhuSnJWUDBVNlFOOHI5cW5Sak4za2dENnFFVWxRSUlGbUNX?=
 =?utf-8?B?WnlZbEdJSWFNeWcyVTBQZHhvUUdCMUFSbWdYOTlOZGNxcUtFTG95L0ZhbnI0?=
 =?utf-8?B?SmxmWWxsNnRoMklWNzVxTnoyVjhrN1BMSnJ2R29ocGpzcXE5WGFhZWJUOEVR?=
 =?utf-8?B?YTRRbHdSaS9QMUt0SHM1aWpaUzRkUHFjd3h1RGM5cmtmRStWWmUyM2FrWEEw?=
 =?utf-8?B?Z0k2NUFLUXhCL2VzK1A3LzhjWC95VXhzY05JTnBiVlI0ekdDQ24vbGZsYTZI?=
 =?utf-8?B?TVJWblBlMWhEdHM5VDZrbGhWTWVybFN1d3N5RnZsd1FQSjRxUXdybFNLVFVj?=
 =?utf-8?B?L3BkMlNtOUlLNU9SbEFudzQzTGFKNk5Hck1MYTZxcHhOSGo0aklPRjFkOFRp?=
 =?utf-8?B?aFhFVGdCMU1hT3Z3RGxLQW9UTzA4OFBER1RZSXZtQTk5L1R6b2JPYzlTMEVj?=
 =?utf-8?B?WG9IY0xHd05CNzVudm81VHpFRlJNWUs4emNpNGhkWU9jZDF0Qi9MVFl3eDVG?=
 =?utf-8?B?TC94QjBnTk9GQXk5b2xPOEZXRGZYdnYxS1BJZ1pEVURrendua2J6ckJXVkd3?=
 =?utf-8?B?UVoralppeUZUYkF2NGMwN0doTHh3OExVK3YvdlhNM2NBRnpPTXBqUEZmVWVD?=
 =?utf-8?B?SlB0aFJ0bEFiVkd2bkxRUmZnK3ZFQ2N4MlV4STlhRytrYXJtTVVDejB2dDh2?=
 =?utf-8?B?dUxsRzNLWW5KVVpuN0N0WXpMcmJTdExnQzF2YjhRak1qcHNtTThtWHd0WUwz?=
 =?utf-8?B?eEVFczdGSXVmRnU0L3BKU1BDaWhoTVoxQVQ5SVBsd0hVRFZHSHdpU3lKbVNp?=
 =?utf-8?B?S2QvZjk3T0w1dGk4MWh5Qng4bU5JcW0vTW9KNEI2bkpMRVZXcUJiRkpRQTh4?=
 =?utf-8?Q?ga9eHDmorsCb3fRwNzGPLT9y4IhDpH8ipK8ftKq52978?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7375c4f-09ab-4fb3-e3f1-08da54f25542
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 08:28:21.7643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4i4Fp1rW2V8lSdjoq+g+4kQTCCyW86y9rnVQcediPaLJtolLtbTx/SJLSvur40meAsC6FHFZq//LKJJXFTmiRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9090
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------O0MpOjkGJKvBNOIaEYmb9YjG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 23.06.22 04:26, Chris Ruehl wrote:

Hi,

> thanks for that patch, I can confirm it works for me. I have the ToF up
> and running at B921600 8N1.
> But I would wait, not apply to the kernel, because I noticed that the
> team from OMRON is working
> on the CDC implantation.
> So this patch is only a workaround for the moment.
> 

if you absolutely want it to be driven from CDC-ACM, try this
new attached patch.
In your original patch you used NO_UNION_NORMAL. That will allow
a device to work without a union descriptor but with the normal
two interfaces. This devices has what in terms of ACM is a collapsed
interface without a union descriptor.
The driver provides for that but then it checks for the exact
number of required endpoints, which is three. Your device has
four endpoints.
The patch ignores a fourth endpoint.

	Regards
		Oliver
--------------O0MpOjkGJKvBNOIaEYmb9YjG
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-cdc-acm-adding-a-special-case-for-OMRON-device.patch"
Content-Disposition: attachment;
 filename*0="0001-cdc-acm-adding-a-special-case-for-OMRON-device.patch"
Content-Transfer-Encoding: base64

RnJvbSA0YmUxMTA1MmM2ZTQzNzcxNjI1YWY1NGE2NDQ3MzYxMGNlYWNkZjc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBUaHUsIDIzIEp1biAyMDIyIDEwOjIyOjQ3ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gY2RjLWFj
bTogYWRkaW5nIGEgc3BlY2lhbCBjYXNlIGZvciBPTVJPTiBkZXZpY2UKClRoaXMgZGV2aWNlIGhh
cyBhIGNvbGxhcHNlZCBpbnRlcmZhY2Ugd2l0aCBhIG15c3RlcmlvdXMKZm91cnRoIGVuZHBvaW50
LiBXZSBpZ25vcmUgdGhhdCBlbmRwb2ludC4KClNpZ25lZC1vZmYtYnk6IE9saXZlciBOZXVrdW0g
PG9uZXVrdW1Ac3VzZS5jb20+Ci0tLQogZHJpdmVycy91c2IvY2xhc3MvY2RjLWFjbS5jIHwgNyAr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY2xhc3MvY2RjLWFjbS5jIGIvZHJpdmVycy91c2IvY2xh
c3MvY2RjLWFjbS5jCmluZGV4IDliOWFlYTI0ZDU4Yy4uZWU2MmMxM2E1NTMzIDEwMDY0NAotLS0g
YS9kcml2ZXJzL3VzYi9jbGFzcy9jZGMtYWNtLmMKKysrIGIvZHJpdmVycy91c2IvY2xhc3MvY2Rj
LWFjbS5jCkBAIC0xMjE1LDcgKzEyMTUsMTIgQEAgc3RhdGljIGludCBhY21fcHJvYmUoc3RydWN0
IHVzYl9pbnRlcmZhY2UgKmludGYsCiAJCWNhbGxfaW50Zl9udW0gPSBjbWdtZC0+YkRhdGFJbnRl
cmZhY2U7CiAKIAlpZiAoIXVuaW9uX2hlYWRlcikgewotCQlpZiAoaW50Zi0+Y3VyX2FsdHNldHRp
bmctPmRlc2MuYk51bUVuZHBvaW50cyA9PSAzKSB7CisJCWlmIChpbnRmLT5jdXJfYWx0c2V0dGlu
Zy0+ZGVzYy5iTnVtRW5kcG9pbnRzID09IDMgJiYKKwkJCQkvKgorCQkJCSAqIGFuIG9kZCBkZXZp
Y2UgZnJvbSBPTVJPTiBoYXMgYSBteXN0ZXJpb3VzCisJCQkJICogdW5uZWNlc3NhcnkgZm91cnRo
IGVuZHBvaW50CisJCQkJICovCisJCQkJaW50Zi0+Y3VyX2FsdHNldHRpbmctPmRlc2MuYk51bUVu
ZHBvaW50cyA9PSA0KSB7CiAJCQlkZXZfZGJnKCZpbnRmLT5kZXYsICJObyB1bmlvbiBkZXNjcmlw
dG9yLCBhc3N1bWluZyBzaW5nbGUgaW50ZXJmYWNlXG4iKTsKIAkJCWNvbWJpbmVkX2ludGVyZmFj
ZXMgPSAxOwogCQkJY29udHJvbF9pbnRlcmZhY2UgPSBkYXRhX2ludGVyZmFjZSA9IGludGY7Ci0t
IAoyLjM1LjMKCg==

--------------O0MpOjkGJKvBNOIaEYmb9YjG--
