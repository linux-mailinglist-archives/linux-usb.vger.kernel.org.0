Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE1B59BD4A
	for <lists+linux-usb@lfdr.de>; Mon, 22 Aug 2022 12:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbiHVKDg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Aug 2022 06:03:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbiHVKDf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Aug 2022 06:03:35 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140051.outbound.protection.outlook.com [40.107.14.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC1626470
        for <linux-usb@vger.kernel.org>; Mon, 22 Aug 2022 03:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vuz384A8Onr0TN3Vf1sT6UOi11B22Dy62JIYqF6IedjyfPoUj10iOU1lcCx1kmBhrj60dJqAazPXr3Y/Q04de58ZSM7xAiTYpp71IVjgPT1G9Il1unP9VZX65/aXPjCWo9V8a1e29L7qIKenEKcc8TldxDNXfGGMzVaymv+DwYlQ/RQT2H8Px38b37lX/qd8oXeOgMTwkXF0Tvf9A4U9GrtyTS36RPeIgPHKkttlq53QxtjfO+Hn5iqlXm/02K03BeM3taOqqxeYi4bAtWP8NCNje7XQbHFl6yJcXUdvN7rh8Kpz2/emsUhr8yGa/pMgAjTIuQ+mF2pcKmSv3ZmI8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWFPGaaX6y18suXmHHq9cYh2sbhNCl7j1PK5JbitNFA=;
 b=Ovi8NXJSXdjXNf6li1KfgLMIsJA2WStbuiuIxZ5WtfRUO82skxiFHGlTJ3+n4m5So4sP95XZSM0SUjjCAJ00G8sXLZ61qgp7nELxpGqtoM+BQmxAww6yqadOjJ1FvxZnQ/HTrLAjIwb96X2T7hlgkW80KFSXBQuqNQQNK0kUO4pip/RdgksddnFNmOHntBDHozJonrykj0aeMplPOd7MIHgelEDqIagsBrPQrkhKPbBokeqr9iaWRNMantXY4ZoY14IDPJBv2MPbpaq30f22jIcPvELZK5oCsNHnd2Nm8D/ECBh9sUVhQ0je/Fu2i0oe5lcn9VmJ95lnpM2EVryNFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWFPGaaX6y18suXmHHq9cYh2sbhNCl7j1PK5JbitNFA=;
 b=Z0FCSJnhi2wZO5cd/6sWqeEC9WwlFfUW5LB7aueFg2s2VYDyZ4PhDFRu9K/qfY2LaROkF2utNTh1XAvrL5v3K1++ENNjYWy9UKOsOH36I4bJPUuiyMjktxLwB0Ts5AzGpImVB9czXcbL5brrPsmC6sT+1ovir5M/KloreCqPdXKR8aGdmxtD4x4xfcOwC+cgZTHIUQkB1vyCTHIZrL/OKyOygv+10qV2avfn6OIU1WCOufjodBD+s6LhHTd6Ru+F0Tru/VH3pAR7yaM/UwvmQdBNXDMWHjyxknmv210EwM+P10YOH1n3pAjHcOxiTZOXPKOEDdpzYrdJ4z2sfJvWPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by VI1PR0402MB3472.eurprd04.prod.outlook.com
 (2603:10a6:803:a::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 10:03:30 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::7ccc:8f18:a9e2:e1da]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::7ccc:8f18:a9e2:e1da%12]) with mapi id 15.20.5546.022; Mon, 22 Aug
 2022 10:03:29 +0000
Message-ID: <921cd023-3766-6eed-171b-7e5f954d890d@suse.com>
Date:   Mon, 22 Aug 2022 12:03:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: USB disk disconnect problems
Content-Language: en-US
To:     James Dutton <james.dutton@gmail.com>,
        Matthew Dharm <mdharm-usb@one-eyed-alien.net>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <CAAMvbhFJ+jdFPh5dMV+_jjYUYYgWhCpv5E43Bh=Eoo6su80cUA@mail.gmail.com>
 <YwJFZNUob3BtEM2h@rowland.harvard.edu>
 <CAA6KcBC+4c9JTAt6=HJOciVW=gJ0KsiRWJeNGx-X2g5s+aafFQ@mail.gmail.com>
 <CAAMvbhFWBhkdLW0i5pVsrkJpSKEpsN=9gbHHgaXSP2UavmwvdA@mail.gmail.com>
 <CAA6KcBAbHzvBbP5QzaC-aLKbq3T6J3VjahJjOssS1u++_DJqXQ@mail.gmail.com>
 <CAAMvbhE4N92eqihSuj_bUvm=aiC-q-sAacFRa6FJ51+RjDhj6A@mail.gmail.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CAAMvbhE4N92eqihSuj_bUvm=aiC-q-sAacFRa6FJ51+RjDhj6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::9) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb58e1a9-0d94-4df9-bf62-08da8425903d
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3472:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z6kQLPds9tWES6cy7WLrVHhdDRlH+cdkzEiYLz1s9vdtV6Wl71qSA2TYHd1MkxIuoe1GKcEjJLlGReEworZUg0wP/1h+Cy+EZ5sBeU0Jq12ymuG/kR1QA/LJ140EZHpG0eOdS07mj2KD5CFi1rT4xpTzirFI0/N/PBn0F+6H4WYfBFs18ojyq5MWXnF/C2w4GJcFLrJR6Vy3LXVQI+ZyU+bPA9bBeM9dlWW5gfh5kLO/IblVZzm323Yu4tTJBFmlVbULFeKWPL3NQfbsQOERr8NpLE7jbbDm5EArQLneHBIVqd8shp5flJktISrfbG9c+vaRRVRc0yGe1cDLq8bpIpwxM85wzfo9YadhAwmID4h5s9gEl4VHwHspPCD5d0Ex91QJnCTHaxJpQrKUJop398/QQjTH0zXbTj6AN3LQgDObvesgfYJcr8hVUFRm/KGvckyIQpuJa3qVPGFOp3hAsJ9qIyFQpjmi9xiVGS0O92APK7tJ7KuldNx/uLgZyuphBPAoFunbp58uUMoqxlXT+MBN2IOoBdytPe0rlT7sorqHQZA6/G1BA94eDvIBzXKyZaAKr8quB6hWheJ5iCXO6SNjzGwpaTgxIab8DKr1i5cjwK3EIa0OOEhswThzbLK95bDEz7o5rSXoWTobSKShD2HSWuOO1bziIZlYFgpNVlJ4rdx4xuNfoHaMn0tMYIdU5DXLPfvxtAZiXggNYd9a7eBAwVik1XBbyqzX67AltB0NfxfIo46l44/lNZgy4mkm5TCDDYjA7yuTc5BctHUYGhsKgW18Lbrk1Eo305zBZfg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(366004)(346002)(396003)(39850400004)(478600001)(6512007)(6506007)(53546011)(186003)(38100700002)(6486002)(5660300002)(31686004)(36756003)(8936002)(83380400001)(41300700001)(2906002)(31696002)(86362001)(66946007)(316002)(2616005)(110136005)(3480700007)(4326008)(66556008)(54906003)(8676002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cERsVW4vUC8zSkNTR1g4Z3IwOFFSQ0VSOGpIRm1sSXUxNzVpd1NJam9rZXV5?=
 =?utf-8?B?alZwdkt1U1dycEkxMlVMck5oMTJRb1I4Q2VvSlhDZXdHS1hXSFJNL2xOTnJk?=
 =?utf-8?B?RGpOOHoyT0t6L3Z1c2RQWUFtSUYwQUprTlhBczFHWktmZVVtWmtEOE55ZVRJ?=
 =?utf-8?B?dm5pdUJwUnRjYTVJS2VOY0k2RXZXZUFQR1lVcjdENmVtd0hlb0FRbmxFSDNy?=
 =?utf-8?B?aFNMKzA1NVlod2ZpeDNWOEZQcmRENGZ5b2dFT0VxWmhVUXF0T0Z5MlFHN3Nl?=
 =?utf-8?B?YldZd3ZLRDlhNWIzNDA0MzIzUFhRWDJieFNHaGpNVlNzNGtwbncvazR5UEE5?=
 =?utf-8?B?Qmc2VTZwMTJPaTV3cXUzQXl2NFR5L1RmQlZ6UytucHhsdmlsWDJPeE5XaGVL?=
 =?utf-8?B?L0JFamJFRkJOS3lJS0pFeGhna1ZxWDAvckdhYUNYMlkwL2xsTjdRaVlJNXZp?=
 =?utf-8?B?Z3NsK0VybWVPNjVnZXhhbUJMM0JlVUJDSVFxelVkbFJhbnhyS2hpaHA1WXU0?=
 =?utf-8?B?YUtFaXR1ZnZHRW1QODRoUDJIOUlsTjF0OWt1Z2puYmZMMmVhbm1UdjV3bDQx?=
 =?utf-8?B?N1hhRVJLK0NzVkUyU2R4Q1dpSE1vc3RMTUcvZ2pkYlMvMmZteGE0RmdqOEVY?=
 =?utf-8?B?bDFqa3RNcU1HVFpWanRuN0dXNm90L1BxRHpJbGQ2MUNMQXVJN0VpVkVsWjQ3?=
 =?utf-8?B?YlJ0b21reE54VnpuMDI5YmZRbmExaDBvbmxCRmxzcnpxSm5lSit2S1NuQVR5?=
 =?utf-8?B?RkhDWWRKSFNTd1hUemRaR1RzcDNBQnB1MFZyTDJmZFUwSlNVUWRpWE9idy9w?=
 =?utf-8?B?YWpaWXZGeGdVSXptMStJRXA3MGRGM2NYQ2ttTE9XRHE5TWJPVjVIWTNMbkFC?=
 =?utf-8?B?UElqTGptdVNUNThmMjhuOGVVV0FIYzkwV0RlSVgwQXFxTXdHQVJMa0ZxOUxa?=
 =?utf-8?B?bmZaZXhjcVZuYjlFWmM4NGNtUCs4VTFhQXI1K0ZYbEczZ2w5TG5aS2VhaHJO?=
 =?utf-8?B?UDZjbGRFZENjdFhKZWhML1lNMThRNm1rT0pTMmNyenZ4TGJsbkhlT0tYS2Ir?=
 =?utf-8?B?OUsvdXgra3J3alFlemJPRHpSTHQ0T3ZHOWtzOWxCMzNVVUdtU3lzdTRMK0t5?=
 =?utf-8?B?eExYcVhYbm1kWWpFWFJHaFBRMUFqbzRoeEFCbzhCRU1OekZuaXFHZFhVc2JG?=
 =?utf-8?B?S1JKcWlZcUdCVDhMZzRYV0RLdi9GVSttRmp1L0loT2ZUQnJDUVhDRzVPdk9t?=
 =?utf-8?B?MGF6TjJpTkR2OUQzTU1FUmNENzFIWHYyaTNyZUFNcG1sQkw2MFh1V3BXKys0?=
 =?utf-8?B?K2FrLzBxckcxWUJzT1lrVGRSK1hFTmQ4czA1SVpSRi9RYkcwY3pucnc3aFR3?=
 =?utf-8?B?QU8za3h6Yk1lNnk5bVR0TlhmNWNVRjAvNVNvL21IRG1TRTVRODBJM21MV25t?=
 =?utf-8?B?NXBNNCt6S2JtTXRJQWhLcE1IRmF4RWtGaDNzL3lvdWh3OUt2Z0YvT0YxUEVX?=
 =?utf-8?B?Z2tJbktka21pd2F0akdteDVQb0kzOXhjQktmZThSekphaWptZUpBMmFtSnB6?=
 =?utf-8?B?WElwYjZKYWZ3RDZYT2ZLVm0yaGFxaDVhYlJhR2xMa2o2U2hXQy9JaXRRWm1K?=
 =?utf-8?B?SktXYnFTc1UzYW95dnJMVSs1WjkwdnpCaERFRXppZXNVUnl6WERlNCtkUnVR?=
 =?utf-8?B?Ti9pNFV3RS9ETmNlSGY1YWdVS24weTlWZDFyMjcwZVFaZ04vQkxPTTh5bDZj?=
 =?utf-8?B?aG1mRVpySTRkVEl5K3p0R3FkVFRRWDlPeC9vekNDVjhWMGxGbGEvYjRkVzRB?=
 =?utf-8?B?b1h1cDFxTE5uKzA0RWFBRnM0ZHp3c2VyMHlhbXVGNGxFNnlHVk1oa2FReUIr?=
 =?utf-8?B?UTZRV1BFUVF3MGFubVJYdUFKMzZTQzRnd21IK3BxMjRGaVlFcFQra1N2RndF?=
 =?utf-8?B?QjBLNHFLVVAyVHg5cTR5ZHlUWWwvQUs5VldKbFNCZWxpblg2aGVEZGw3Q2xW?=
 =?utf-8?B?d2o5SktLL1BITzNrUTVhV0JoSTFZU05kbjd3V3RadmxXZ3NUVDJvblpGeG5R?=
 =?utf-8?B?MGpvQ1NESUtZYVNJUzNqVkxCenV5R0lRNVBrZXBSR1M4OTEySSsrNzlLOStX?=
 =?utf-8?B?NDFpVXlicHBrdlJCeWxRam85Um1DR21Id3lCR25LTEQvVHVlRWV4ZEpLWXlT?=
 =?utf-8?Q?OD++HuFJ7TAeMF/TcYA/UJg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb58e1a9-0d94-4df9-bf62-08da8425903d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 10:03:29.6687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 415sf4SPda6ECSl0UYYp6IQ3yT26AxVCAKXL+ahl0voF3nU5cD6yOX9WeiWLiyn0j4x8tZ7EMI6iDv7DPLxeMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3472
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 22.08.22 00:56, James Dutton wrote:

> I see these messages in the syslog during the suspend/resume cycle:
> <6>1 2022-08-21T23:18:57+01:00 nvme2 kernel - - -  [ 1127.688557] usb
> 4-2: reset SuperSpeed USB device number 2 using xhci_hcd
> <4>1 2022-08-21T23:18:57+01:00 nvme2 kernel - - -  [ 1127.782252] usb
> 4-2: Enable of device-initiated U1 failed.
> <4>1 2022-08-21T23:18:57+01:00 nvme2 kernel - - -  [ 1127.784263] usb
> 4-2: Enable of device-initiated U2 failed.
> 
> Is U1/U2 failing a problem that could maybe be causing the problems I have seen?
> The error is in the logs, but the resume works, and the disk is accessible.

That is power management. And for a disk to use only power
managementunder the host's control is not a problem.
> When the real problem occurs (not during suspend/resume), an extract here:
> <6>1 2022-05-04T14:32:53+01:00 nvme2 kernel - - -  [20782.100705] sd
> 0:0:0:0: [sda] tag#8 uas_eh_abort_handler 0 uas-tag 2 inflight: CM

A timeout has happened.

> <6>1 2022-05-04T14:32:53+01:00 nvme2 kernel - - -  [20782.100707] sd
> 0:0:0:0: [sda] tag#8 CDB: Write(10) 2a 00 1c 51 11 20 00 00 20 00
> <6>1 2022-05-04T14:32:53+01:00 nvme2 kernel - - -  [20782.115321] scsi
> host0: uas_eh_device_reset_handler start

At that time the SCSI layer does not know why a timeout has happened, so
it starts generic error hanfdling, involving a reset.

> <6>1 2022-05-04T14:32:53+01:00 nvme2 kernel - - -  [20782.248337] usb
> 4-1: reset SuperSpeed USB device number 2 using xhci_hcd
> <4>1 2022-05-04T14:32:58+01:00 nvme2 kernel - - -  [20787.463620]
> xhci_hcd 0000:00:14.0: Trying to add endpoint 0x83 without dropping
> it.

This should not happen

> <3>1 2022-05-04T14:32:58+01:00 nvme2 kernel - - -  [20787.463633] usb
> 4-1: failed to restore interface 0 altsetting 1 (error=-110)
> <6>1 2022-05-04T14:32:58+01:00 nvme2 kernel - - -  [20787.471524] scsi
> host0: uas_eh_device_reset_handler FAILED err -19
> <6>1 2022-05-04T14:32:58+01:00 nvme2 kernel - - -  [20787.471540] sd
> 0:0:0:0: Device offlined - not ready after error recovery

In this case the kernel does not think that your device has been
disconnected. All error handling has failed. It gives up on the
device but it is still know to the system.

> So, it is attempting to recover, but the recovery fails.
> What is error -110 and err -19 ?

-19 is ENODEV
-110 is ETIMEDOUT

Those numbers are to be found in
include/uapi/asm-generic/errno-base.h
include/uapi/asm-generic/errno.h


> Are there any "quirks" that I could try enabling in relation to reset problems?

Probably not. Is this log complete?

	Regards
		Oliver

