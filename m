Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28E603FC644
	for <lists+linux-usb@lfdr.de>; Tue, 31 Aug 2021 13:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241225AbhHaKsx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Aug 2021 06:48:53 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:47054 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237852AbhHaKsw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Aug 2021 06:48:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1630406876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BgTTZzWzbHnsZL5H+489DW044hwV8i1nTsFBbI0N9Hw=;
        b=nQ/PWSnSq4/7NXM0pqv2l/xJe/8MtjntGQpF/zuLDkRJcpq2dtcShdBddL7XsV50QF8v6z
        IjPUbpeOrqqFGeNPcnDcLHxe4M+rW3VRfSMdWltlSxKrzq2885st88mFUMw6YIZC7YwD5Q
        Zk6+4KnBxcEntkWTA7+8u4gIaQqIHBQ=
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-446HavqsMg6qUz4e4iLhFA-1; Tue, 31 Aug 2021 12:47:54 +0200
X-MC-Unique: 446HavqsMg6qUz4e4iLhFA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8zpjyyvdxDH8p+Ka7ROqYWsonHvwxnDaGEJ5HRRojKcoZv2YcAzd4Zw8f+7J2rPZJYw4XZSEaK9oAPpm2XtKYKtkBbVd+p83KstKEoh+ccQblpqTPQmNDGmc80+q2m+8BY2+wBauG8mYZB1LsNXxK8nyEIJquTHb/1vgImKLetZBA+DaZeuBTKNz5f7lhTSjRZKRrzjumSRJ/C+Gd+IsP6WXwaXue4YtBnBcTp9LeaOulZwWW+iMTUCXIooZ1fffpcTUFPDmQR9xW/YAWVFf3wekSpGSQ3dWcumVID/wfZeIDJZ14kukcoVMhJt4cl5SEBUCIipThfloR5VGt8kWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsPtsSsz+cLvT/wdD5HvUg8jjFACqk+b9LUTrXpJW1I=;
 b=AsKCNYQ3wQ2hrZBXQSuvS5/0V8fqocH22x3URUkVzbhUCc7rGmD1SDrtFgcxg9D/KKtINoag4T4HWfTe/u1jQYuM8fVGm8x/G/KuW/Dd2jELuMaderm7vSYMh2UXEKrmsyScMxlDmgTZzvt0RhxqOnVjO327x+UM/k/IeTeoSE5iGnnzAYstQ9JnWPi4eS5MjXB/KkKwZG02y+fvtX2/A4mcogyNbK8YdvCKRLdIosxC0IzsuzvhvELJsInF9THv+AHi8BhlshNvFW/fIAFrji/qs4+sYaYky7HhNqx2ZcM3mqfXEWT45WsKKb+YSAvN/9xNuT/RsMVG80Bf8wodgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB8PR04MB6810.eurprd04.prod.outlook.com (2603:10a6:10:111::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Tue, 31 Aug
 2021 10:47:54 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 10:47:54 +0000
Subject: Re: [PATCH] USB: core: Make usb_start_wait_urb() interruptible
To:     Johan Hovold <johan@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     Greg KH <greg@kroah.com>,
        syzbot <syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com,
        USB mailing list <linux-usb@vger.kernel.org>
References: <20210828180358.GA291431@rowland.harvard.edu>
 <0000000000000f37f405caa41e79@google.com>
 <20210829015825.GA297712@rowland.harvard.edu>
 <YSyPQqMPHRiUvYEx@hovoldconsulting.com>
 <20210830144613.GA332514@rowland.harvard.edu>
 <YS3y14DBrg0+n/iI@hovoldconsulting.com>
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <54c4f3f9-412b-c093-6098-cbcc5828b320@suse.com>
Date:   Tue, 31 Aug 2021 12:47:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <YS3y14DBrg0+n/iI@hovoldconsulting.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: AM4PR0202CA0016.eurprd02.prod.outlook.com
 (2603:10a6:200:89::26) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:a61:3ba1:6d01:4428:c443:677c:c419) by AM4PR0202CA0016.eurprd02.prod.outlook.com (2603:10a6:200:89::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19 via Frontend Transport; Tue, 31 Aug 2021 10:47:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50a93528-adb4-428a-0097-08d96c6cc968
X-MS-TrafficTypeDiagnostic: DB8PR04MB6810:
X-Microsoft-Antispam-PRVS: <DB8PR04MB6810952DE68DBF544F1E0CC3C7CC9@DB8PR04MB6810.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lLSgPgCSwtBQW3qz1g5zXxcmKkopR3/j5kLGJ191uVcrdFfGPzjKPmZDwN7UeQ0G0F25txYRhDO4TsLMDS0Nz7srgz2w9F4EqXjJIgdt5Uq+WvHPyqFrHzf08qYB7uRVyoyT3gaQv96Xofmzbxa2bZZ2fZbeIhrLi2UvKgOlhoNm63onpLVvrxu70udRl4En1XphIa68vHzR2+093nJvGa2ww2x5IMjej5zSfJV1IBIifMzO6W/3ZpapjyDvbi9FizV0nIjeoAJmFjanLbQ68Co8KBz7oEhMjuzxqQt9R7LxqQLZpgyqT0Pl4JaOpeFftHESKNEQ4JY9MTnFXe2XgeInwE2Y8r0weaL65rL8Fz3OjDpDaeuJtLfLBjqRsMSrzaY4eTrgG4ieUwHbKIWb8kAyF7h7HE0N/wOrHuoreUB7J/h4j5HsCFx/4u5lDIp8BQaiZIz2Wbq1nE/TUF6Q5IM9u/ZEFfFBr+HB70ncOdXuLMI1gnJxe+tDXJAXcgfAPBUTRhvbDpdMrMLgqJugjT3JQBzmxbbTlwPCZqS3IvypW73elUe2Rr+TgmQ8fFL3OXCZXDGc7N2gZAR1JDvLYhjB3EwoK6XPT51NkEL79p9b1Nv4sKBOyVdX8Lj20vBsJo+EfGoPYpwv+GlAmgaqN4jB8gWX2VlSNuq9DRE0oAilsjCOxjnh+ldtRDhNpajwicnLEhoODxpVCaZ2kg5D1+ChIsosWQzx22cN4lz4IC4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(136003)(376002)(366004)(346002)(5660300002)(2906002)(8936002)(4326008)(478600001)(31696002)(66946007)(6506007)(6486002)(2616005)(66556008)(54906003)(186003)(38100700002)(83380400001)(110136005)(36756003)(316002)(86362001)(6512007)(8676002)(66476007)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EqqgPF7QyWwSfNmGyzFdHZJX/Jy9JKcSMMqikz4gN8Dw65srNHZSqW6DCzGs?=
 =?us-ascii?Q?5/62tL+6z/lrMYEp6MZQmfTjQSYdDixw8tozQyjOgFjQ+2L/Wx9oP5kdfWu0?=
 =?us-ascii?Q?l7mBDSgqDzAT4FfCGPBSmEkCc7Jl58I8qdycSv1I/RTjITJ1XnIRWd1qpeTd?=
 =?us-ascii?Q?V6xR+SSoq+Nm7907Bc4dRWc4P46PB6UoRarfpwYB6Vw7BLX0MPPuuBocakIy?=
 =?us-ascii?Q?q3T7CyBbIvr3SxIKqi4kdwG4il9f1AOg2VQxmP+/peWH9m0nhycGh5p6JGIa?=
 =?us-ascii?Q?577BE/CPb048KIiGkx8Xj0+nCQ4ztlAIM1AzWb2qs1/vREsNMRjj1A0BZnn6?=
 =?us-ascii?Q?8mygrH/j9kPUXfDrdLc6LFpcVJgI/s/GRQaGb6Y5J0DXYNsgctABLfgV//wJ?=
 =?us-ascii?Q?XSxK+Jslw3B4iV/MGP0oS3iiKsRD5Q3vhrr27PL4rJMto5yhSpBArUICooYW?=
 =?us-ascii?Q?AUtNk9PVAM0WVTomI8CJrggPPYZoqprslGOHd9EMHWVkav/IWezhJ5sHzQ0J?=
 =?us-ascii?Q?Lh3RZjkpa490BsKPRAZyo6/OuAbWZDGopHX+ErhRPn9IQS9QspuRGDjeuBc9?=
 =?us-ascii?Q?GPYwyf9x7SENAWBYNXClfRNN3etA/THNPEOtl/FgcvbepDzmP+mQ05m3zCpf?=
 =?us-ascii?Q?rUSx3SI4rVhYJaNMKUujcJFNPQwi7H7SbQdC12qAyk/ST8QeCx3LIuKetUPl?=
 =?us-ascii?Q?iVjk6HSTy3NHs/oTv2sGsMEPC+hZZKIPmYwuEEtd/y4YU7OfbXvMoTdgRj+M?=
 =?us-ascii?Q?S67RjNbjGKcMHcWkn3wr0rI7IIS1ZvDOtpgty8nHnC8tX5LuehXMDXc2qPm/?=
 =?us-ascii?Q?l65SZQVW2hCJODWBi1yaginwajU+yskQrc3+w/IQvXtDLSHFkEP+k/q8bbJk?=
 =?us-ascii?Q?15w1s8joiKSe71XVOSklVpKy9g3xHldDKJBEya/18k/Edq/SCLLuUTAIKzRt?=
 =?us-ascii?Q?9dlomA7FMYKy9ZB391ZcrgjA3W1S/V8DDchrpJ6wp50j/ZA6+0QeQn01/oSr?=
 =?us-ascii?Q?xuYZZQDNeQGKgWe7K8Jr/CnbH82wWpsZtkACuJRxkmwC/Qtu8zFSByEKUlZB?=
 =?us-ascii?Q?oH+GlZByAPZDjKDiV4DNQ+8aOOQn/sCpd4AmIqLtM0vxXmCeNidHe4bxQeAL?=
 =?us-ascii?Q?jWNUFjTd1il6gt4auLmTVKEI9UUVEk3uAISkNunNkx2qJpbN1P+Dv9l71E58?=
 =?us-ascii?Q?z58CSCOWQSAhjO0TJThEEwRdT2lmWpwZVH0MfFERPSeYYjkvBhdQavpJUjwI?=
 =?us-ascii?Q?XyfMR/kRfnhFqcE6JI/hpcyQ3uUCncTAsG5EaYKsElLASwdU/LDdoT4VSinL?=
 =?us-ascii?Q?18QMRxSp4LXMzBWGAdJklEH/nAX/93LK/C8GoZq3ld3FeVys32ni5bemyrBk?=
 =?us-ascii?Q?D0MF+9kVzXXT7wKXUZQfcZNfb9WD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a93528-adb4-428a-0097-08d96c6cc968
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 10:47:54.1919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ONs/CNdmMdJaRn0l9IwxS2o1n6ILvQIee43oplLqPtIU3LIJofo5zv7HuKo7VIXFtOptghEboLMTBXWDrUc2Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6810
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 31.08.21 11:13, Johan Hovold wrote:
> The comment above usb_start_wait_urb() (which also needs to be updated,
> by the way) even suggests that drivers should "implement their own
> interruptible routines" so perhaps this has just gone unnoticed for 20
> odd years. And the question then becomes, why didn't we use
> interruptible sleep from the start?
>
> And trying to answer that I find that that's precisely what we did, but
> for some reason it was changed to uninterruptible sleep in v2.4.11
> without a motivation (that I could easily find spelled out).

I must admit that I do not remember. But there are a lot of situations
requiring control messages that do not allow signal delivery.

Take for example a device that is HID and storage. We are doing
HID error handling, which can involve a device reset. You absolutely
cannot deliver a signal right now, as you have a device that is in an
undefined
state in the block layer.

It looks to me very much like we need both versions and as a rule of thumb,
while you would use GFP_NOIO you must also use the uninterruptible
messaging.

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

