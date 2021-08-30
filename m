Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B27803FB8D9
	for <lists+linux-usb@lfdr.de>; Mon, 30 Aug 2021 17:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237182AbhH3PMy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Aug 2021 11:12:54 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:32999 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229553AbhH3PMy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Aug 2021 11:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1630336319;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ecGYRXvjesMemRVlNy4JpX95tTjrGdCBZdqOy8Hoz9w=;
        b=KJOhJv95yvvqLhGeGXZTyLgv9sPfnd/2M0IWgHpmjp7+whJA0rTmu6jwd0uubUOvPFLYeD
        497B0FLfe2YF4ONVVsErryucyoJdotLzKJpQFlZMBJMbo+gOVhCq/KlwE7n/e8mgt3CVFk
        9Fak1g3oIMK3kANfre99ObJGmyH44Rs=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-h26ZumR6P0edVNagwuvhdQ-1; Mon, 30 Aug 2021 17:11:57 +0200
X-MC-Unique: h26ZumR6P0edVNagwuvhdQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVDDP4G4+Iapt+q2bEo7w1CtrVlfUxoq3XD2gQrXfpoTaxu8K3u+mf2ePZxU88w1EacCSmi4nTnIMwNprIfIU2GcWh8oaObOyNB9u54TkUQtFZPnXXApTIqnUb2wNwL6zRz3e+t8zvYUPHmYtCLFyWwzOSqTUyOoduN0obV6j3hGstW7k4jXuvl2clB+z03bfhG+ZI6N8hCfMjLg8TaaHgXa00AV71DcGxDAeBeGmbpqax1NkQ6NlLRtSNcxnt5lpJTPuUXxWeauFK5ykiQMIHWVfiL9H71iTu3/YqT5E1H8oybRlC2kXG7CotziawqIMBT3YPbqR6x5ZBhK3Hkyfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSlpWzsJBy/oX3cPt31syenQu094sPm4qQskLOwfOmo=;
 b=VLg0sgy/Y1uvcxIo/KcNbwXqhpSPjksVJJjuD3OpQQuOQYdwP2nq5J0OPTtxbsxXm+IVgj9kiNDCQLIWVnYULLiMvp9hb8SIohg5vVxbXGWAr6/ARha5PRwEkS1OpgGCF4AUDuC9DTFp3Vc2DG8MIgVWEX/7/a19krvylVGdFGMu7ur/CwrBwgKpc2jicwE06B6xt0l9YWLV4P3DHti7tUJB6j1lj5TTFZTpCcuMhI4OImrgk7rQb+LCWRd621AYlVqmcJcL9aSL+D/klayU+wtyFo3DVYwrv0ysmLGURwKtV9b/lRAvZSdUKWYYEsCO9Rcrtz3GXytlpTbS5+Z5aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB8PR04MB6809.eurprd04.prod.outlook.com (2603:10a6:10:11b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 15:11:55 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 15:11:55 +0000
Subject: Re: [PATCH] USB: core: Make usb_start_wait_urb() interruptible
To:     Alan Stern <stern@rowland.harvard.edu>,
        Johan Hovold <johan@kernel.org>
CC:     Greg KH <greg@kroah.com>,
        syzbot <syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com,
        USB mailing list <linux-usb@vger.kernel.org>
References: <20210828180358.GA291431@rowland.harvard.edu>
 <0000000000000f37f405caa41e79@google.com>
 <20210829015825.GA297712@rowland.harvard.edu>
 <YSyPQqMPHRiUvYEx@hovoldconsulting.com>
 <20210830144613.GA332514@rowland.harvard.edu>
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <0e3214c8-a82f-d117-962e-326817244c9a@suse.com>
Date:   Mon, 30 Aug 2021 17:11:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210830144613.GA332514@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::8) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:a61:3ba1:6d01:4428:c443:677c:c419) by FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.9 via Frontend Transport; Mon, 30 Aug 2021 15:11:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e8b2e26-b30e-4b85-442b-08d96bc88120
X-MS-TrafficTypeDiagnostic: DB8PR04MB6809:
X-Microsoft-Antispam-PRVS: <DB8PR04MB680930B06EC8F5C0106365D9C7CB9@DB8PR04MB6809.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 20aNe8mPvDpA9kCiLw2UCEt4EvquR1EKeI9TkY0cSdfkCqzb+zc7UgxYsy6ACjeF+gbjsPVTfxqiByYmAYB4Mfnpp/6BW04Oq+tP1ENcfnuJGVASyu4iJCX020+7JTPlBXYpsirTWvwFDApNnvwQhoWVW/Aide1mgld5d+R55fIoX9IND7Lu+4XP3LSihDWdVNHeozLLfgJro0pMJ3wDxKJbW7UmgzK08r1iV8HN5Qd4vIeEYhZB7wu/F4TK7L0PMzlYgpf/I410TVmub7qCo0iknTBz4koS7qXkxD3s4NRvRKM3N28SSXrTTMMIY2BvgiU14aaHFUoq0JniNOJVbJ4bCwxdnZouICV6K7FTakIRKLB88wvh+/yr0asxflyP2IioOJdotwdIbCLgNIMKhAQxGpaWJ9u4DqkQqyaUzlggkwa2q4iRBxqJwNeWqrvvEWpQIDn6uC435FncZB+DBn7pn74eWWX7xi91G/RAcm3T3E6mQ30nEgByF8uOAMhuw/zzLE7YFzkW0GbNVz5GDxFB229+0VsknN7/wWK531ozQJAQSYUhyI7T8jImui9TRtysaXOsJ+TzUg0lLhQF8/sicEXod2UJGWi9BL78l2+OOHWYgCkXn5OZMQiK+vuv0ibWYZI1DNGbjoNg+GTFsKw89xcoDemsSKMb3M1o5HhPNTWCx4dEDBZ9GWoS8cJLgI8mPrBnxljpDt1FWsj86E3vilBISKwVOiSrQW9WhIw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(53546011)(2616005)(5660300002)(83380400001)(66476007)(66556008)(558084003)(6512007)(86362001)(6486002)(316002)(54906003)(31686004)(66946007)(186003)(508600001)(31696002)(8676002)(4326008)(36756003)(110136005)(6506007)(38100700002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?foodsHTDlwOg2Q2SZfPSnN2z1lcYsZEpxhBrdBo87d95LpLWyqmw2f2F0GLE?=
 =?us-ascii?Q?y2ZQ0XR42cJBD1tqBrDklerh2Jl5kWtsW+1vZpeueMFrjFdFOgXiuty5x2El?=
 =?us-ascii?Q?415TH4eJPna4YAKIQzTCmhiYAZGcz5o+xNuvMsZPv1q4//x0NcqIkoCYRyhO?=
 =?us-ascii?Q?E1s1CJtfUvAQ9gPqDNLnF7jo9EhM5DKLjxxYBB4lkwiz27TrRSkO+BHDteXd?=
 =?us-ascii?Q?1yYtDE1H5lmxzMt+MpgdJr6Hg/NQVni/JNzKtcKFykBdcJHMqNsnyclVR0x6?=
 =?us-ascii?Q?rCCHoNAqa+wulBz/pEWU7MQL9U58FUT0VPOf/FGe/OIQe7FrL9PWtJChWprx?=
 =?us-ascii?Q?HxmzXowL19xoNIqisoru1YKuNeKbPn6spnMMmgRZR7/QUlDUB6uaW8GEhCu+?=
 =?us-ascii?Q?aGUoLg4yHJDFzOkmoP+gTi0u9Sm/+0r4TaGnraBNj+KbbBxUCXQRWjoqnGN8?=
 =?us-ascii?Q?7ULjF4Eu5228pxCtlmgqnuxV6B9zpn24fviBOudUxhKUHtFLo2PUTlpw+q1r?=
 =?us-ascii?Q?jlBWD1CukE856HG0Kdc9xSvJVdmrZo90T0dYMnQguIyLn3ALjewkJEwtTiTb?=
 =?us-ascii?Q?6HpJTE75UyWjCIckMLlcQh1codj50yiafD7UUqaaOwj2AnmWHYH1YI3l6Gkm?=
 =?us-ascii?Q?gPvDZXSPYWiOP3uoCN1/Jd6RM7MsP+l22BDCgqZ8uogrP8NAzEmJDH4HHXWd?=
 =?us-ascii?Q?FcTeho3WeAGE3pWp6gzvFT9ESqwxDg+FnZuM38yBN4oqQuZeoNozMsLFjptX?=
 =?us-ascii?Q?VP0ZkzetlJNii0HP2flfgjXTVVOngUDjelzxNNkO+8LBwMEMV3V0GPMtO8hR?=
 =?us-ascii?Q?YCYtBGPbMiFH9BOXMs4xrL7lR/qxsNnAzXRRi17EU6Epv9kZk892WEifz0Wa?=
 =?us-ascii?Q?ue9tFxXY+QkvifiyKs+ukv40zeI0uRVdcbjBHigCpmRlRwsNTfibnqxNYzSv?=
 =?us-ascii?Q?X7Lw/oGoc/2uGMVrA8HIxzkSThThqBaCZREawqfTJncsgEXkxvFPEVLAIoiW?=
 =?us-ascii?Q?wDh6TrZRmJnfF9oqsrA4rtZ8dWgzj7xGcyiCUmhNcfCrWvh9PzE4zFyqMh9h?=
 =?us-ascii?Q?lyXWsTd/yzgh+iIW2gpUBl03V0zSOJTl30GOUK6y4M+JmGf2oskeLwt9sTGW?=
 =?us-ascii?Q?JNS+hJF/27jEP1bnSsFFn0y3CWzIK8MUhzE0YgeTXlYmmLa7Pg2FIBaW4652?=
 =?us-ascii?Q?dn3Yr/ny1A7hclVPO39Ot+qFOsPmnRe3rDmYpj1EVMPj4xcbUfSkVpPhXYY0?=
 =?us-ascii?Q?imkYBkPgwzua2FSiNmi7odZC3f4nxSkl/8g6VJHTg8bAiBVb2KvU/ZrHAvyY?=
 =?us-ascii?Q?FbbeYUnEOPc0GJoU0KYZL6iWVowlMRas2VmAxhSI2ctrCj1nxyY1WMuwDjlR?=
 =?us-ascii?Q?iYdRU0uGK/R+BUCtjWcwLQdOalCG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8b2e26-b30e-4b85-442b-08d96bc88120
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 15:11:55.5851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q84kMns0do7+mWCqOHsqd4vl1/Zx/rlrAkuxnF7uDSeUJkQK5mWAgK+pwOn/C+DLTKFyL250AOw4He/I4FZTJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6809
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 30.08.21 16:46, Alan Stern wrote:
> Do you have alternative suggestions?  I don't think we want special=20
> interruptible versions of usb_control_msg() and usb_bulk_msg() just for=20
> use by usbfs.

Hi,

why not just pass a flag?

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

