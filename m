Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE36B4398F5
	for <lists+linux-usb@lfdr.de>; Mon, 25 Oct 2021 16:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232385AbhJYOs7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Oct 2021 10:48:59 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:37784 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230128AbhJYOs6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Oct 2021 10:48:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1635173194;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I6tm+Jn3+gAhqgMRfVrGF7LDd/YQmzbjXnfThZ5yif0=;
        b=QKvidvqMeItVaJYU7GinbdJRwhtaWwT+Znsn4AAyxdkbzzhs2BBjimSx5/l07f4gLP9/6k
        o8GOV0iq2w13N8gF0//rYWXDt/3AIS+Kae7pfy5Ul9cte2ewHhZAQaJcDYPxH3JmUJfC9X
        D7ZfTuJv2w0YSk2kqMDy9LWZf/b81+M=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-37--R1X3q1cMqq46NZ8uTcbDw-1; Mon, 25 Oct 2021 16:46:33 +0200
X-MC-Unique: -R1X3q1cMqq46NZ8uTcbDw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=By5jqaKcAB2Qf5rnjv1uKU+YlZdFLdo1pBww4Hpbs6fdaCpB14Fsyys09oQY8vuQL4zD1XAEPXYetSxUCs9eaaDgQ6kkTIminqVSSlCxPlmsnXsJNHWfN9XSgjiVfliPD3GmN7mvxci7qgRIWtQR5IhjpM5XjtaAInzbAmhoS3GgMKHzaWxSHbtXNegx4yQggo0sUFywtIwwxnRgw59WCNfR6N4VMKBfmvjRfEmKLwpoFa3XdIWQKWVoSyjQOLw0UkiyZVfiXFnGAADYAWKp57NQL3jYv1fK7tTI4zkoOoV0SI4Xvux1kzPOhKZPuUoAMvYOIrPbJojmFb4JD4bHYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YehwzR2ULDBmUnn1SmPSNymc9vLGq8DAqo0LrJrQlow=;
 b=bsXvtr+4HgHlUYpdcUtQhQoBIGAIccu40MfkkfSRRwyjFXp8gD71cqaPRxNLGl+In1u7zz0QE1HdAjCqs/H1nlUhSZgJXnUQk23subiKU92Iz2ATu9q5ETjcExnuG8QUsMMuADwA8tKI9vj8zwlak76xMkZ6Nm8DR0V8cgKRaxtV6iUu6hOhLCvD2ie2sR+DzKrze7AHtQ5z1V0uAil96paKTas/1E9TuvEymky9X3FcXRrwSPNn/mcNlg8GBrhV7Rd0NGQd78IP1YvNX7kvEh+yeyCdsuI6vM/tFlrMm3r4F7FhTCZEuDviqfYZDhtmLDOHPQlRWwYuq9MQt2lGhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB8PR04MB5724.eurprd04.prod.outlook.com (2603:10a6:10:a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Mon, 25 Oct
 2021 14:46:32 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::61c5:2592:9e7f:a390]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::61c5:2592:9e7f:a390%5]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 14:46:32 +0000
Subject: Re: Disabling intel-wmi-thunderbolt on devices without Thunderbolt /
 detecting if a device has Thunderbolt
To:     Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@outlook.com>
CC:     linux-usb <linux-usb@vger.kernel.org>
References: <e21981cf-fef0-b73d-8fe4-4e1fab0d3864@redhat.com>
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <ca92b94f-f715-babe-98aa-e9d3c37569cb@suse.com>
Date:   Mon, 25 Oct 2021 16:46:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <e21981cf-fef0-b73d-8fe4-4e1fab0d3864@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: AM6P191CA0048.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::25) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
Received: from localhost.localdomain (2001:a61:3b0d:4601:21ab:d1da:15e9:ca07) by AM6P191CA0048.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend Transport; Mon, 25 Oct 2021 14:46:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cefffdb-6fa3-424c-fc60-08d997c63c72
X-MS-TrafficTypeDiagnostic: DB8PR04MB5724:
X-Microsoft-Antispam-PRVS: <DB8PR04MB572428DAC7877D63613E2E6DC7839@DB8PR04MB5724.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wkB9PLF4ZnBGR9wOhbJSsgE3559CD0bY3WSL8TGuthOu71Pdz4JXEz83YfPjUgSpEFA9rVDchrVei+lhjf/COBmZ5ILuQE4W+yIuOm6JLhuyboHtxaLCEDjOIFqoyLZYnYjUW2eiHCE81QZl/GKOOZFPnC/6Cxd0CNSUlHxWJMQyMIBP9JKLglNTE5Ld+xAiySxhEGC6OvuSGiGy941RhAsr0Q7RD8VP43b14UD4odz1CMVFkXjxIcm0QqfMF8cK1venKi0NWZBLM5XoC9yz+WVws+yWckBfZ8jvV5UydV+KJ5zDfucuWqg2qkp8NGMroehtNYEmDRLxTBEpgpIgvb9DBOB4SJB6E5AUADQkim5eFXgvb7QX/Bc5hIq9iK0gKHMndisUxWYCYeYHCqBxkL+AfEvvnq8WDuEDAe7Q2EyvDWXu99DR7Nmv1PpGW6r2AWJ94WWHRoWb9BiwxM2+xr2JCv0xqGYspo5bvrrVRmS2iBGsAPyrwoaVsGnDWGhW0yZ2/3SRyK27NK0WoH3fLFo1gAiXPvNVhTaRlPlpbipNeWCjJET6WvuvHI9krOhMO3c93Z3Iml85Oi+MOrafnTQ0oilkrAeNCPveOuGWdv9/wIysAMIAEIxDzGbTVf+Z/2p39tqeOEkmBDzQEeohbHdRqK4ll8OLOsNYFF5SThSLue1TsvOw6ErTLHHFQgbhI7Cm9HRFXHiRVNYeOW/TSZreDTPjHABRv3w5wvsg2t4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(2906002)(6506007)(86362001)(31696002)(6486002)(4326008)(316002)(2616005)(6512007)(4744005)(66946007)(8676002)(5660300002)(38100700002)(110136005)(508600001)(186003)(36756003)(66556008)(66476007)(31686004)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PvhoK7so0uod/i2vNjonrZRTkx4AKapbvjOvQvXCeasBer9U33UnQZpvkNls?=
 =?us-ascii?Q?29aBAslz4g1KiFMpiL9B32RYuZ7X5N2xhC52UoVy3NCSrbdOWH6B5VbZ0olx?=
 =?us-ascii?Q?kA5DyjsK0DlxWJVwZ2npzI+EsXmqc4S3+rkYu+sb8SIBRzX0SVVQFR6hrmIW?=
 =?us-ascii?Q?Q8mPxLBDhxEdSzIXbrSsy26SAA6sX2Nk5doyCeiaLRUJQD6ZHiw/7h1Y6UMa?=
 =?us-ascii?Q?yjli/5bnpfisvIkIlMlxD1OVUPfShWfHLMixGgPirP8758LvjqZ3IeCdiEFP?=
 =?us-ascii?Q?pYh0SxKz6+cHTWUaNUuew2vZDy5O383z1L0TU/SpHQ0VkwfIRLU5zr+ZUGLS?=
 =?us-ascii?Q?R6wgxm2MZnbMCzX0hSO2IlwDJBpaaOTnU4EYaWOQoQTloqWW3jjzKDoqNanK?=
 =?us-ascii?Q?XGyw45uAEff9WqtoQpJHXfmb+HBOgKBE/No8aM1vyAJZRuNII/qb1YBLJ+Lo?=
 =?us-ascii?Q?mkDdblPtJu7uEHh1LMCp9IUTyM/ibi3YXtl7obIHHLxZqZQic2xgXdK2sj2O?=
 =?us-ascii?Q?KMQSlxvcx8R6fm5GcZ7Gzj6Uzo3PawgjgRiWeugFsjx3/FQ8r2JTJpoD+rnD?=
 =?us-ascii?Q?RSTASGB1XVUxhL1J1KYXsXuCvZoh+jiIEuaR1YfhMR4EPMh/OtUJ2WXBYWiM?=
 =?us-ascii?Q?thfYJrZus2NaRhUQ/z3Kstfr/VDcGP3rBL8H7s7vQPD8y5uqbYh69z+xM34H?=
 =?us-ascii?Q?B2yPy9Y47pROlJ/ZtO3dTwB6Dn2Tg8ldSgarYdMfbtEctHN0CHmcspSyDbx9?=
 =?us-ascii?Q?qxWcSOvadlTbPXc82QLPyDW4gqH0pi8XT9L07ssjDk7cK2GBAPwD7bh+kOca?=
 =?us-ascii?Q?O5cXTZH4j96T9GMQh64HgaW3CDr7wh2J+8qYlglorrqerG4O8ZEBfWbalePw?=
 =?us-ascii?Q?fPAGhpsVGpkrl8d+8kvf0rKVLVBaZiC99pibr6kOvQsK5AfqO2PJAAJa6zNJ?=
 =?us-ascii?Q?/1nXI5VZXB0fckRLA9H7mtYiK+CDxQBrPzb/jyW43KNneh8fkGY1HUFp95pU?=
 =?us-ascii?Q?vFOu1KJb1DJ8dSj9drdss8J2JhSEhmmD1k62EAFoy80hB+HPrSPSkdlr56aZ?=
 =?us-ascii?Q?Lg9ymfs25L+1FAqKXrnQm5vS2bDv9v4/qTatueal8+RGuDgeLstsZczVnmyv?=
 =?us-ascii?Q?yqXDBZK27DK9vsDykcGlu9Yl17MoMGIiFLabTkWI/g4FFqvY9BGgk2edC8gS?=
 =?us-ascii?Q?rf7uuqP7+5gSVDa8fZaoSEJcrzwwccW5VWDZbauCg1eUHXuKNytuGkvDOOGH?=
 =?us-ascii?Q?VtkWq9dFkpZCrqXhN1iSTwwjKKthGpoeZyERwtq5MOEtF+Rq+ydaOKAGNhPu?=
 =?us-ascii?Q?K/s5zpTuIUToY0RTqnfgjpxkG1EwTTZBcYxa4L399ADKbeDfbrctgYDzKsnh?=
 =?us-ascii?Q?Ud7uQ0FlKlFHAc2v2kYRpu6f5xI9u4QbGrC48fu7s53eR0FZJQMZR65EzvWs?=
 =?us-ascii?Q?im6gKGwnzzkSoDWFGuYUTI0nPA2QdagDCcqDWM7oXe8uLVOzF3M6E/KSiTGs?=
 =?us-ascii?Q?esOQh7wRMVn3DVWb0YEAppoW7ulv0DHxa2Kpdczy+6lZh80vZUcF9tO4Gct6?=
 =?us-ascii?Q?CBCfoLISzpsyTNaTCWatRBwKWYDPStAVkFncvwwmgZzF0uv7IURdKZ1pRqt8?=
 =?us-ascii?Q?huLxIfcWYcl7FrBiPECuVlynirzKetUGVurCDNVKaNGlLO6JxXKbEIohcoCO?=
 =?us-ascii?Q?ioMsgZCQlwRNPAIZlQCsVUci+2g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cefffdb-6fa3-424c-fc60-08d997c63c72
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 14:46:32.4312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jz7FZj149IQcpVpkV9EDB1m2rkpmxLMHF8geTsGaKrnvcU/QKu1yKzVKXl6Ruv/IEpoEB+q8DFueDWbqwrc/Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5724
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 25.10.21 15:48, Hans de Goede wrote:
> This makes me wonder if there is a way to see if there are any thunderbol=
t
> controllers on the system at all ? (with as goal to make intel-wmi-thunde=
rbolt
> not bind if there are none)

Hi,

as far as I understand the driver and device exist precisely because the
thunderbolt does not exist on the bus will unused and will virtually be
hotplugged together with a device.

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

