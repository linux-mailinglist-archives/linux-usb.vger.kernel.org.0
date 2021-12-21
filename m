Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79E7247BBF5
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 09:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235696AbhLUIgm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 03:36:42 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:38861 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232308AbhLUIgl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Dec 2021 03:36:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1640075800;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2cVkJUbaUnwE5N+5g7xH4nTDOSfm38XtCHSbefCFP9k=;
        b=JYd0MxSisKt3vOgfyDN1sLIjvfRq1SDlbE9koK9VE3jXTxn3FHejMZwC8rBIDiWNue2UCJ
        v2SohPaiON21kxEXLfGkUwiktCl68Oxy7/eKOPUNU5XgPSNAsVMNiNNbZCMLXc4WA44r71
        qVnr9avyUwj3aIUbJQHu1KOBaoLHNbw=
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2059.outbound.protection.outlook.com [104.47.4.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-JLznd1kdMh-rjEltGSf4pA-1; Tue, 21 Dec 2021 09:36:39 +0100
X-MC-Unique: JLznd1kdMh-rjEltGSf4pA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jz2z9cPWspTTT5/U5HFhB6ICSHG9jmO3tSgkdV5vR9q74EO+ZzPD7Ykg4vKug4045/gL+zKYebnB1kQbWIt/PceXvPTO1y7iMchhQNmeDiK2SVXVbEOdy6yCyd/rFFadUR/pKmm2SnmQTYiYK/Huj8GIHvFEmo/qtOLeeYR13rv6aPaHopfLGSKGfS8cecuEivTn3x/dNNX9MkfhiD14VunOHvgyxnDxIAgdtcDWRYL9EOsfEQaB08QloFbjnR4DkP1TSPEzb98AFfRwg0Qr5Uw1dC99FZd3nYcnpljusZDC7VA5v/adRXWpPtRLgRMr7umLPfAQ4SGRU8gU4Mnh8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNnJ2tIpJpXJaj6sOBPOpjr1lSLso9Eg2kb96Utng/k=;
 b=IOUuw1WidxJ2dRlE6cLY1NDMeUXgr8A8I8JJ9eBSNC02pllVMX+qUBGoaQQf+dXcaTuDn0NMLtxzOhHEOUF/970byfGeGgoDKPhj6LlbRZVsLsGSfsIv/X6Kih1FzHjtEquUBU2pnFfDQKCTs9lXngtQNUs6nnD2yit6xeF+tomxXDBBVy4CqQS6mp+lfoS+CgshzPQBnkipiiWln4MOULF4eNQMVFaOk9GCLKN7JnTT4ybOEt7UleYpj9ogPAdQ3bDpQjs/fGR6TYQbKht3bfNDMJCYB6RyLuRDduq9pi2uQ0dn4x0lohRtl+kt4wEPs2TgwbskgPiujcbrJAOPiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB6PR04MB3239.eurprd04.prod.outlook.com (2603:10a6:6:f::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.20; Tue, 21 Dec 2021 08:36:37 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1%7]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 08:36:37 +0000
Subject: Re: [RFC]How else could a malicious device sabotage endpoints for
 usbnet
To:     Greg KH <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>
CC:     linux-usb@vger.kernel.org
References: <ad1ee829-401a-d051-1da8-f9e01caa7b85@suse.com>
 <YbIlBl8Ay1rIED8p@kroah.com> <71bfdff1-61d0-881e-a201-e91920750648@suse.com>
 <YboCTzOTp49HuCxa@kroah.com> <4739899e-54c9-c28a-502c-e3a85118c301@suse.com>
 <YcGINEZn1NyYbtbD@kroah.com>
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <7d37b5df-ec22-e6b8-476e-eb8394d80fd4@suse.com>
Date:   Tue, 21 Dec 2021 09:36:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <YcGINEZn1NyYbtbD@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0286.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::32) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d2f2349-1b92-44a0-ff11-08d9c45d00f7
X-MS-TrafficTypeDiagnostic: DB6PR04MB3239:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <DB6PR04MB323983081BCBDCFA572BAA4EC77C9@DB6PR04MB3239.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O1SrIuOSNpthZ+hRpPxHQ0WfE2+cEARYosV3jZ0drqD6hCbykaoTWCZHvHD+DtE6R0MtBLbvyFUXP/xCDcpaLHrB0UoMvxtTAzShyDOsH+Z+R6pufPHepuqwHxa78kQJfH1oCUhPVxVkS7+wcffzUaHIanR9kuvbeE+/8Tui9H/PnyJQpvTVyXmtcCk22a3atO9rbtnePusZNPnP04naIjYQKXN9iZead7FNmqd9Xs1UP/e2sNTJ0yabVeGIGyUccyOM6FQ6NN/JfjwvYufbVI2yubvKPY+04HIOQ3GWO8wH+4o3J4qHXrWLpUE02nmuM4zMIDJIswPgTpxbkKCGECfodr9t0QcaSW4TfLrPvaquAVS2TAXxAHMxTd2IHjorIQvcUYX+hbgZBsKDrBmT4s5ZFbRYd5EQhrNKKLZv/35ZL6/JdjawuvYfqIuw4OcXEEH7ZICzCMpPKfP+yzvqGL2mEXvn6NZd5uqtI32EnRVBcHXlBZMW1y0kRjlgCm7st2rhIuPKVC6khsEJgCUa4lQIGUzBTqEs+VcwZE/O7PhOGe0ZV0+a0UbnMYVfdSQ5ocs+vsPAsw95Warr8mBG6fUpLbt6oTaPA6MHU75V8M2L2KxXA7muP4eBz/Fsw/G4XKkdDh9AoXFIE218XvkxPMnVYWsUHX03gtHWviHvZFg/EYprDMrSae1wV8CHyzxD6Mtgc8UJ8KZhDGQmV07naWV9OjclMXU1B6bk/1WNDg4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(36756003)(8676002)(6512007)(53546011)(316002)(2906002)(86362001)(6506007)(508600001)(5660300002)(110136005)(66946007)(186003)(6666004)(83380400001)(66476007)(6486002)(66556008)(31696002)(4744005)(4326008)(31686004)(8936002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ei/jlUJidL8rcNA5yYTPLpmqOosNdpEeq/cvC8BYtlfd/U5h6h+7NlvTjxDH?=
 =?us-ascii?Q?6l5Z8+71afIYAWi5mhA0nbzhGifDDFsF+wDjLz3qLgCF++lm/BXARKcmYarH?=
 =?us-ascii?Q?s/2U/bSGNUKEzsHXuhtlNRjZumCz9OECEaB7qTTpYoU+K5L+NwEbud6m97PW?=
 =?us-ascii?Q?+94ubXf9DUII/leNjGlBugFQDu1Ufg2ktxFtEOf/bzXdytnaZKQgK9UrSVU+?=
 =?us-ascii?Q?lYjbkDK7YkI3q/a/U7uUFS1ifLMMgGCFzhCIPfpG13EeHLRg/Msmi4XjP5dq?=
 =?us-ascii?Q?n2zjkK3oA54BC1aXph39PhOPoxgZNOeWJkzEVuL+eC6OaP+G4sbrQ6miJM+4?=
 =?us-ascii?Q?72FxYGLIgLQxt+HmXa6rzOgCzGV99ml95QpPzMOEGEjH3MuQ1Ansdxcm8RXh?=
 =?us-ascii?Q?2Qx6Ir5Xaj/XXLalzR5iZ8/ZAc0L8cWPU77uEmzg3aor/2ctimr3yFGcmvKZ?=
 =?us-ascii?Q?zDzkga4WVxfNEoksn246fHqNCGonC3YUU+hlM2ClSI1+/LXjebNhisOJ5KnQ?=
 =?us-ascii?Q?yBYQWagvWywUJWjgTGOsSkuo0GuAKGvSsz5Jpj+bv1l3/NX1GU+UvPYhVVft?=
 =?us-ascii?Q?OSugIJtzP1OYum2maIPdMO5Fj2WIWLi2Np1MxSC2yWxPNNNl1Z71nLCE+lzc?=
 =?us-ascii?Q?Tf1JxXWyNUM59uikaYbnEgF1UvutrwHG77TGWxHeXV0VPlmP0k40AEtEMXla?=
 =?us-ascii?Q?Q7O/cwnvg5mMTO+ykxT14KCDi2T7xy1+FiDwB7e8WdHMEnzdm6mfm3whgjLm?=
 =?us-ascii?Q?o6Tupeh3n3qW211+UNb0NKwYovkSlG0ic9zzfPM4vglLy0i58w3Z20eXir2m?=
 =?us-ascii?Q?AXdzBQmz2HKFPqE3CuR8f4urjLm1DICTx3nZ6PmAViWbT4DUgF4xvZxgCx80?=
 =?us-ascii?Q?Xn4GyfLDwxkLgILKDyyHPAo3EZjyUQFRCyeONa0VWc0h/R5lE7aaPzI/X8Ne?=
 =?us-ascii?Q?NzMvh94koifWcDQy9EV9AMV3UFoW4L4hXcCgGtoCFwlkHaMcln+nAtDeKyKF?=
 =?us-ascii?Q?Sj8rafTbCHrpyyO2x9l5F9rtiFmZkWFfFNpvaE97BkiSsOqbO3U26h+O2vBR?=
 =?us-ascii?Q?MBbjHEKS5HFEAVefWFgTezzTao9H2+H/7KbWzCourAAoi27PZwIpGBujw4Oe?=
 =?us-ascii?Q?UYKhozEH4tQXB5+rPG+NpPB9gNX9SVDsO+bBN8l8sxEmjkVi8hPYSJPmjaJo?=
 =?us-ascii?Q?x0hlVLCpt2unnYMHLJUWiw2jaW+2+s29dDjswQQqM75Hi7XfbDjaNpPLexie?=
 =?us-ascii?Q?VenbLdS/d7fjaGjiDMUVwL7IPW39w0v24NjmDyVqvBRj6hM3FL8/ATwYJ0mr?=
 =?us-ascii?Q?63pKTsFqX2ex+U7TriP3IRupGlJ1HcYDf595T28/Rlc99nPE1hn7hVl67RRs?=
 =?us-ascii?Q?HNNyuOKMtOOfWg9CSqGEJxllk/2AplB0GFMCoCZeu/JwNw5BvYCOMLWnEmzV?=
 =?us-ascii?Q?9bC8ZRoX8zDiMuSSvQhx34d0nFuvKyEJJH7kMW2gCR6/DnRH1/Wv/8Xvod64?=
 =?us-ascii?Q?4LpFcNtU1Obiu/t9LaEplNQhPa4+KtruCWGwlLjPkvC2mzm5xGcnFnC2pd/6?=
 =?us-ascii?Q?yx16I/+5wcb1CrsdIhhNCUfT9azCoIgQoWkClCwmMDWYZEOzDDKwRHscmFob?=
 =?us-ascii?Q?EKA4nvqM181sIvn8+VmciXWwj7NU11sWKLOwJgqixxtG2Fb0JnFrdCYAYV6W?=
 =?us-ascii?Q?Z8krcZMtmCmt0VKPYKUPdUULEoU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2f2349-1b92-44a0-ff11-08d9c45d00f7
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 08:36:37.8400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bxtESq4F7i3WHns7j1M2gTOEnN8MxZ5zI5+Udm/vESa2O+5CHVdUVzLEikBHRy/T/uJjeda9A3oyRw0tbJHvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3239
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 21.12.21 08:54, Greg KH wrote:
> On Thu, Dec 16, 2021 at 11:16:26AM +0100, Oliver Neukum wrote:
>>
>> 2) a heuristic to find the endpoints is used (that should be converted
>> to the new API)
>>
>> 3) they are given nummerically by the subdriver
>>
>> It turns out that #3 needs to verify the endpoints against malicious
>> devices.
>> So the following questions
>>
>> a) should that verification go into usbcore
> the usb_find_common_endpoints() functions are in the usbcore for drivers
> to use for this type of problem.
That API insist on finding the endpoints. It is a heuristic, so we need
to have a fallback in case it fails.
>> b) what possible ways for a malicious device to spoof us can you come
>> up with
> Start with:
> 	- invalid endpoint sizes and types
> 	- invalid data being sent on valid endpoint types
> and you will catch almost all possible errors.
>
OK. But I still need a way to do verification _only_.

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

