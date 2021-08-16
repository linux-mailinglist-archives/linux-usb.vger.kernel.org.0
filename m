Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE793ED201
	for <lists+linux-usb@lfdr.de>; Mon, 16 Aug 2021 12:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235912AbhHPKcT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Aug 2021 06:32:19 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:22922 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235964AbhHPKbb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Aug 2021 06:31:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1629109852;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mzbDfyYw3ncYEhnroR5bMoEgbE3TMfpxaE1JM1E9ZCw=;
        b=DEkj5pTs+X0+BKwJYUVMk58lWPUoabp+Vg3axGFLgJ7sC3aJlqOVqccczQu/iFIin5aXNX
        1ckr1UJ67Tk097waTqgZjtLYQ8wWycHrLdWDG7WEKYXIEfjAFgI8oJUOY1kaYwUjVAfjDb
        XW4ZdQmRKAufFmtZznrVLH5Jnch4DeI=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-ywmQEM-iPX-83XG7VjURiA-1;
 Mon, 16 Aug 2021 12:30:51 +0200
X-MC-Unique: ywmQEM-iPX-83XG7VjURiA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epsnuUqAW4S0YWKvU7ozmvzAOKSiIBSz+yHbd/rq+ILWf3h426siCFkpPraaFcwQS4rZhUpkaw07Cp5YKIvZzCGnIRWZWgB/8CQu8Oyoj+2QXldPuEK66G02VCjzHub/PhxlvGKQa5KzQb+SUGdy/9U7jbVpj9+ye3r7H1cVJicHjSPnU8BGNS9ZgpDXoyDcs2HHBy1XNhYVtXHivvaGcUVg5IGhRTRqv7tu5mjE4FM0jiQpl64qakK8hq73LNn8rTnBrevFMPFnP3Cfm6gkPMBYz7t2yTfPHOi3NQzQgqVnQ60E03X1g1FNnSRW95DWrJEsFatoWrONeA8mCJkHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9dw7r9TSiUp/j41zyK2B9tNDtIax4FyRvW0NJAjFH0=;
 b=cMVqil39scKcPLqv2P0hdc/1JHq3wer2x3koxYeNEODNHyAUbHK6fbwkXQpOOkO7BkMGR2jgI1RM78pJ3zXb2VeJt+aPDxA/MsmvhucmNgdSxdRTR8AI/iCpldz4gJqGnpY0eNVwl37V4rNuH6czicMG824MmrYBvRaoySI9lm39K5CZCGLtFM2y45q0bXo8BNt930mOHT58+I6AtAqBO1P1JZEWN8gIvGQYXOVYHxfAKjGc4nucegJ5pEJtZs6vLE5+faPgKk6N+4SK9PaATBnOkK3lSAprS669K8MX09frmHMYphr3yyaE/HzhkMwT2tpmfHd5g9LbO1wIekNvOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DBBPR04MB7980.eurprd04.prod.outlook.com (2603:10a6:10:1f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Mon, 16 Aug
 2021 10:30:50 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 10:30:49 +0000
Subject: Re: USB hub problem
To:     Eyal Lebedinsky <eyal@eyal.emu.id.au>, linux-usb@vger.kernel.org
References: <3481f401-1d52-d5a1-d983-4b5f7046704b@eyal.emu.id.au>
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <00311c3e-9b32-792d-8320-d6080bc9585c@suse.com>
Date:   Mon, 16 Aug 2021 12:30:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <3481f401-1d52-d5a1-d983-4b5f7046704b@eyal.emu.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: PR3P251CA0030.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::25) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux.fritz.box (2001:a61:54d:a001:4350:a2b8:363e:9253) by PR3P251CA0030.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 10:30:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c72e33c-3009-4d89-a212-08d960a0ea7f
X-MS-TrafficTypeDiagnostic: DBBPR04MB7980:
X-Microsoft-Antispam-PRVS: <DBBPR04MB798092F1AF03EA0AC40B0A4FC7FD9@DBBPR04MB7980.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W0wnl9orvTwLVCZp1zwlA/6BnQ6hGJqq/yYImubO0usWlb3pQrb0sylbA25Rwo75y0h8Moia363y6TO00ixtT9JHNyhXXLVQindyj/7oYC1JA3LHkdyqvG/GCEqEMOBK271HWEGJVpebyUADS5riDX7VWrHCglHeMoWg1j2vtz8ywVhcW5QOYwZpQmlyF+M69Mhwc6amtqdqb0OpSS1bZg+B340LW7u9E5KvUqi2AbAL7bwmosxO0hmjtSffExRPpowV9ICMqOP4IYTxwXXyF1VTLrCOgvHvu4kCFzUJqSdA8xd3X7A5Ppm+l+qMTbsTh8yItWa2K+mAue958dnsBnkUYxiDSXGUTehC9DuwnNNRA6wlAYexYizywtsSi5YNSfDZGn5Qv3s/Vl+ZArTkVN8CNPxnwzCftYn1KtKhid12ulx51F6ViftDFiRomU2J74hb6isgqRGGpwG7LWJVluktbohP/WfPfYSkuEivu2lpdWnjJroNuWTvnTw+UtEuDipw4sgAbh77qPskrlPXMZr1AVb4kG3gDrQi7MkEbuvlUX62zXQnoFUmzS/QBUZqPj80exq/HNiqzBb/N1TgESAsabFstyoxb0PpxC/eklGOuz53XUd1IwLAoWWlcPL5L1nzbX+Qqb5ZGAiN+4qiggvwVakhNhpfsCP/Xq0x4t2JVc1JfOByMd94Hqnvt5TAw8poRP4XopzXWX8yu7gjD9/S1v80CtzjzienlAala+g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(396003)(39850400004)(376002)(66556008)(66476007)(478600001)(66946007)(36756003)(8936002)(2906002)(5660300002)(6486002)(86362001)(8676002)(186003)(3480700007)(53546011)(316002)(38100700002)(2616005)(7116003)(6512007)(83380400001)(31686004)(6506007)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Iyucnzg4gKvbavxBmSDbQMWeGwmruJlkSwbA6AJeC6MVEmNxph2BXXRai403?=
 =?us-ascii?Q?NITL++MRq/FOXg7he6J0gxx5essX88KHFA2nVRo0lVIPPFQYoklRvaWzjP9K?=
 =?us-ascii?Q?hAuv483RRw7n6ZnFUYWYcz3jQTc4HRL4BIEnkOewK+nLwGfU/9bF6ZRww+kV?=
 =?us-ascii?Q?ClFIFYvK5XVq1/zvT1Ib/Up3Ys4DpqcOg94S3yIwHPPS8ciordLPxpvJrN/8?=
 =?us-ascii?Q?rcpu4BQvkefzokJ3oFsVOXWCEmJAq2e0oJe64H2arflGNfNLIyoEag2Z5auE?=
 =?us-ascii?Q?sU3pzcaO1UU/nujfHFATHznLoQ9cz5+oBVkgX5lu4V/H8MeCesuR9c/lKcNi?=
 =?us-ascii?Q?CpKZZIJFf5Ik5DZ7NPmOkIwkWtw4b2VTUaNZQggEMK0Cp3qFTmM1uERwNc7K?=
 =?us-ascii?Q?xJi8H6sp1UIL+I3kajN6bi4qyMgsn+hQUbiv/ec8gL1v0m23/5BVNhzd1fEf?=
 =?us-ascii?Q?SDZB3gY5t1cSf7VMgZJpmbizwwKLzniXbbu1Ob9WK07qwHgL8wmCMU/QEYgb?=
 =?us-ascii?Q?c83tEqSXV4DUTJEo06A8smStXp0vLEXCDk9OjNF4cthLr9uBvYph9Ze+kOs4?=
 =?us-ascii?Q?JPPvTXTNNmbsSB7UWWQz3CIZxSHh/4ADbol5rBnEnbQz5z1J1kxWby2HS/ar?=
 =?us-ascii?Q?aUnzzHkZF+ODue8aljYYuiy9YXdbrXxhAMhV7wpH42uT88lFUqehk2KWKNVJ?=
 =?us-ascii?Q?trr2InPcxT79XwAxClXbL1R5rJ2lWTrRN0C0UOR8KF3YiwcA+S3lzQy2s2v9?=
 =?us-ascii?Q?stxKxKz6XtlTylDzHB4Ymoq8a9mE1+Q7meCy56T5UsJ4KSVFeNP8vraeL65P?=
 =?us-ascii?Q?QuezZHJfQ4cIcR+L+DDcZ9EFpymTBj0x90Idfu1h6fIBR2M4MuH1Mivwbuga?=
 =?us-ascii?Q?yCWkdrEPaeOo+N0nOFVyIG+RV4udbYE52adQvyp0CA6v/j47KcpO0nIibVAq?=
 =?us-ascii?Q?XIgDVLwG5dkEaXW6pCEuIYQD0ZQmIl4x41ApcLLUFIVm09xK+1UG2qOIPRu2?=
 =?us-ascii?Q?HQqHkatpj5263FTmgBTnv9MDmwihZzibp3MB/sW0nb5D+a06OiUlFOMo3VDQ?=
 =?us-ascii?Q?XkufhHuBjSZjNDU8QD5IfhKN7riq0rZDTC0n9R0gMDVlLbGxZaZAXKnQWl3V?=
 =?us-ascii?Q?cKHc0M7aIpX+s1qnmgRHr7Kjiakbjx1pR7psZsCEUqQ18lyWGMIiwuapuZc/?=
 =?us-ascii?Q?YEE93ubfP6WVc0KCLjjRdhga5tsp8FIH3jF/3ilhByBncMm+Aks+qBU+GKSi?=
 =?us-ascii?Q?t+I+A/SuhBqyjBlDXV0mEUBSyrcYT98rPKZgE8E0DbxKXhKAroZVmViodq++?=
 =?us-ascii?Q?Nkj9N2gRKiar6TgxOlRz2o84O6hzJLppgkqqERIWDq4s8oq8MnJSvE5UyH8G?=
 =?us-ascii?Q?p/OlNxhwSH2ge6v3dConYmrCSoDa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c72e33c-3009-4d89-a212-08d960a0ea7f
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 10:30:49.7411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLvUBLwLpkVCM8BOoNIfKksMrPx7gvL/mhQc+sop9ik/52/nOLOvs3wdXJQ+OCP6G5Lpc2V8iFO1gnxYNXh54Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7980
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 15.08.21 01:32, Eyal Lebedinsky wrote:
> I searched the hub model and IDs but did not find relevant information.
> Is there an official list of supported hubs (or devices)?

No, any hub by implementing the hub specification is supported.

> Attaching the phone does not add a device.

Just for the sake of completeness, could you post 'lsusb -v'
for that hub?

> ## plug phone:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (no new messages)
That suggests a bug in the hub firmware. specifically that
under unknown circumstances it fails to generate events
for connection changes.
> Aug 15 09:07:07 e7 kernel: usb 1-5.2.1: new high-speed USB device
> number 57 using xhci_hcd
> Aug 15 09:07:07 e7 kernel: usb 1-5.2.1: New USB device found,
> idVendor=3D04e8, idProduct=3D6860, bcdDevice=3D 4.00
> Aug 15 09:07:07 e7 kernel: usb 1-5.2.1: New USB device strings: Mfr=3D2,
> Product=3D3, SerialNumber=3D4
> Aug 15 09:07:07 e7 kernel: usb 1-5.2.1: Product: SAMSUNG_Android

In other respects it does work.

Based on a hunch, could you test whether the circumstances
this device fails under is related to runtime PM?

In order to do so you boot with

usbcore.autosuspend=3D-1

on the kernel command line.

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

