Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED70A3FC650
	for <lists+linux-usb@lfdr.de>; Tue, 31 Aug 2021 13:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241177AbhHaLDM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Aug 2021 07:03:12 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:22839 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231304AbhHaLDL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Aug 2021 07:03:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1630407736;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T1WULFoAu14cxE1mydvYelNjjRE/v02H/U6kj9qpOFw=;
        b=Xn3juXbvGNuheSMjcy+Cl09ADajOTwSRtKIRlDrmH0vohr83iCFuV35TJ73vn7EXLRwkqU
        HHrwZ5y/7hMeHduVbxi0SVjE9pkuMpYF/dn9nyt3b2Pg9cyNwQ1djWSUjPvrjKGssv7hiB
        oraLh5s2uATpjJnZ+RSjvawtxXQFIJg=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-eTa9KMG3MdemWvLdRXn9QQ-1; Tue, 31 Aug 2021 13:02:14 +0200
X-MC-Unique: eTa9KMG3MdemWvLdRXn9QQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awvivIL7XIaIJiKj874eCd7H/hIjiL8LXGzYPFApXdWmgbhWm50z7qSe2lXGlGqhI3BPRDdCCJDmf2fMuungYy5+sfpqovYmC8miy9qz1UFBVpq9fCNOiFV9GDF2B2S4mtx9GGZ6ivMLIaajsISuWve0WegFSvzrD3PhWp76VgQAxd3XIK3nhKCypYyqf8pe6TN49HD5yiU5z2QErYYTBGIVH5LByX8kme1Mwrbfhrw4YTzVOtW2a13UV3RAwmPC6KqwK0Uan6q5Jweznj9jz7v46lssPZcYNDkVVTDCwVOGqdzTb5xrzJQ4GKyi5RRdEnf3R+67ShrtYq9vU75DNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6S5nnQVMwUOcF/OiluA8n2JipPYxSmAG5uyP7TLtA3I=;
 b=JKV+SK42u78gUPToCqsj2pNuvdPSZ8JIh9wJ9I+wXkSXfIOTqNL2uTjWTRNSl7sapCwvPoE8xRPrx2+OSBywygBYtmO8bMWNDTGcOlnW7grF1PRG7kQ17rOATWfcUbbRy1R8SceHnDwl+QltKq9yDk9T4FyO/+c+E47T3ArlJkYmQ+p8R+aj2qEE7MhTbGtxR/pkzau3NjvM3WSDEGkPscJ1M3DjHiAD6weVVkKvU1a0OCWkTcUaR4TJ+aui/i31QMXwSbaLQfJBVWUZfQh0J0FTP+KBMunMSCAieHy6AeLv1kHsuVN1Gjp41IdqZUBHGDeI1+89Xe6YT5pJ/QMI0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB6PR04MB3144.eurprd04.prod.outlook.com (2603:10a6:6:f::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17; Tue, 31 Aug 2021 11:02:13 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 11:02:13 +0000
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
Message-ID: <ce5a267e-7d3e-a2ac-fd59-f72029ee5c02@suse.com>
Date:   Tue, 31 Aug 2021 13:02:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <YS3y14DBrg0+n/iI@hovoldconsulting.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: FR0P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::20) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:a61:3ba1:6d01:4428:c443:677c:c419) by FR0P281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.8 via Frontend Transport; Tue, 31 Aug 2021 11:02:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 324ae347-bd7c-4f3e-6f1f-08d96c6ec998
X-MS-TrafficTypeDiagnostic: DB6PR04MB3144:
X-Microsoft-Antispam-PRVS: <DB6PR04MB3144F38C3DE518FEF3EAE896C7CC9@DB6PR04MB3144.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K9kvOjgEyg7g6uMdHAG32+KiWCXZNBbsvwHiOUd0F4fkbzT/BmkBKEc4XT+f3GYRKfePihZDLWBGErcHx+gVoOTUo9kB1aG7FmN8iDydciys4R/Fd1LCs0NhfdpnLVQcnuafqkdM2Fe2H0W3lMbrvLRXdACi+fGbV9r6h83u4n5mFJqKhn+1trHgAkA8XrRZbAcWAzLYa1Vx8tP8OfexIEn+DOf88DW11k+L+IGLWL+D21iDsv2zrU2CSmy+HXPF40qI3KPO/uO7lHdu6o4W9+t7zmN5sFB9xqLylBsscTQpkHV6s8yaNEiuIuoSBTGJTid9J35f32WHruEzC1K1fxKWQWA893hx5r5sI6lXHtiYV8lkOWl4Hn0XnXJGVeF+xHob/dsIwM2/ToY9UaGKzeBklu+EVNQyoS1RQy2UccOVR3wjNH9vbKmmyQXB2FshaTNDylvtdaT4IhqFJaJEUK3gexysHJElhAOuqXLjmscJ/dvkJdf3fUJiyGr0e/048k3mgnf3SNOAeFc5WozYibT71VyVPZwo4XCNXrJ5wtQY2a5dmcW2mjuXmxJ8J1EFRJ4T76vvnMUlIOQZ9N6tcg5I9nNCq5Gb3otO/fwRWleNGlzZlBvlCXY4vlD41LR/1upy+yG368tjk9ToemEAI/rCsnlnrRIFAdCNOnpbyk/xBfbqd8sNnDhXfx5ql3F7QwQt2XMXGiKI7BfzYSu5btl8jGivReZdVpSlCn3Ovl0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(376002)(136003)(366004)(39860400002)(6506007)(66946007)(31686004)(53546011)(110136005)(4326008)(66476007)(66556008)(186003)(2616005)(6512007)(478600001)(5660300002)(86362001)(31696002)(83380400001)(2906002)(54906003)(36756003)(8936002)(6486002)(8676002)(316002)(38100700002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+UtIBG7c4jqw6dHwi7VOa71tdjR9CelyMY0kWfSmD1KRMUjJHy2O0R6F1NLW?=
 =?us-ascii?Q?gQjOvx03S7aZePkOgqAfeWW9yVmPrtjVOD41rCsx9hDh/RpQxrd8iKh7k5ax?=
 =?us-ascii?Q?22bLIefTx0oqBCsKrNhWvbebKFgK4LdoC+fXPAT8BpIs/W68o57LGqfMIHFW?=
 =?us-ascii?Q?Ro5bqWStlRolonn2tECaR8f9cdJO0m8dE4GBZxuNa5q8GlUt9p1HPVTn0h9S?=
 =?us-ascii?Q?HA3VN0Pky0wkpWlcyMmnhNCzOkGZD26r2VJy7ZHrlOz81QSZP2K1LsoXgCvb?=
 =?us-ascii?Q?2iopFMbz889NLar2F4SuP/wHJw3DtXcy9FH5fZSHZ49OnQUsi6PCOwc6qaG3?=
 =?us-ascii?Q?I3H/tghLiWUlM/Knpp9ymIn3/KDYhdipU7MasNYvJV+ZKMl9LcLebCAqHKdx?=
 =?us-ascii?Q?gjvs4/6icpNx/MO/iajqc8Rc3Z/JK24aLefzkZPdq/aBWmYOgSoIMkbtgXb1?=
 =?us-ascii?Q?iWIkx96+sh7ABYKLLbsdBt+nXaPeEUysY0ABhnp09n60h3sy90cnOmDZ9910?=
 =?us-ascii?Q?oLePfHEMe/bfEcZ1DITfHJsXCtWp+9LQgpQKbFW22OjQfSLLrIxdDMlKN4I+?=
 =?us-ascii?Q?/HfH9ljNJGF4/sH7tuWn2h/ywOVAVRAY+ihLRsJAPNqOIrBSDsrWWRhtkzyP?=
 =?us-ascii?Q?ektCjv6Gx7npTUIH5Zd5P4Cta2GgP2QMeO3D445OPexlqIknq/1J6WIUn2Jq?=
 =?us-ascii?Q?z0dABkGc1+TZlgjDJuyEpczX4QJg8pADf7oDqtLeC2a2HbDbOfiVgMCZNvja?=
 =?us-ascii?Q?NKV58giCm6DCcKXVvHEXCeab8Ed68ues7Q3QLIpMj0KRKT+3l/KRjzuuJGOW?=
 =?us-ascii?Q?mEk/Hexx17wcUcyg5iWD4Ma89xWZ6n/B6KKA5H6yPAvsYxoUolN5oMfhtk1I?=
 =?us-ascii?Q?xNPRY3rdgVv/b2rvmQLBFx2LDWZ0dl7RfSoN8oB6taaa5nyvXXY43F3B/4yI?=
 =?us-ascii?Q?c3PBz13ZgXxm0Lbd7eTueQ1XbLIraEU55GzETWqZZ2f7q3F3HR0aJYUF20HX?=
 =?us-ascii?Q?jc9AjUf+Mol97Mc179NG9qYlYwTh0QXAXSYyGy0jSq7+a6ou5kA1lK0+T4d8?=
 =?us-ascii?Q?ziU4hTEK8pjdmtEY9xDO9AsRh9erW2BfBa8wIDtdYBrYsaOaf1bh4bkqbZeU?=
 =?us-ascii?Q?X0xKCFnvBhC0L7CD15QBuGiH/B30WVjHjI29pTAeRPBUGu5Es6NuCgiWnXR9?=
 =?us-ascii?Q?w48pqGcEyPN0v7ct4Zc6sRo6ApghCRcTiZWM7LRwvtwgYJXFBMU35PhGWL16?=
 =?us-ascii?Q?ETMA8bN+g2oTIjjxuBiR6zCOaOExVHdiqIozY9GHhgjGRqrZNLApW3rnttMi?=
 =?us-ascii?Q?ap2gwQkjCai1tl4tWnHA57iC+UJqwN6LzD2BOWWjByeNI7NEDUto881wsAV9?=
 =?us-ascii?Q?IfsX/iRn01kwBK5lcoTnvcJVYIvz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 324ae347-bd7c-4f3e-6f1f-08d96c6ec998
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 11:02:13.5137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZU0bghq1BGRKgB82RP+H18OFv3btAoujXsC5Y/NrJvK+3yNPWQbyS15F/gZKBA0x6+1UlhiFYQ0t9QB7rS094A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3144
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 31.08.21 11:13, Johan Hovold wrote:
> On Mon, Aug 30, 2021 at 10:46:13AM -0400, Alan Stern wrote:
>> Perhaps the stable backport could be delayed for a while (say, one=20
>> release cycle).
> That might work.
>
>> Do you have alternative suggestions?  I don't think we want special=20
>> interruptible versions of usb_control_msg() and usb_bulk_msg() just for=
=20
>> use by usbfs.
> usbfs could carry a temporary local implementation as the documentation
> for usb_start_wait_urb() currently suggests. I assume we can't limit the
> usbfs timeouts.
Upon further considerations forcing user space to handle signals also
breaks the API, albeit in a more subtle manner. I'd suggest that we use
wait_event_killable_timeout(). And do it the way Alan initially disliked,
that is code a version for use by usbfs.

Thus we'd avoid the issue of having an unkillable process, but we do
not impose a need to handle signals.

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

