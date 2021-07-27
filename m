Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 527183D7651
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 15:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236621AbhG0N1h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 09:27:37 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:53964 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237219AbhG0NYo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jul 2021 09:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1627392273;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1jCB3jgzayUH019ZzwJif8BOvsMzvLchTnDy6IoGsoY=;
        b=DJ5UrS47OMidF+nQKJdHLCvTMH5GY52git1ZC3tU2aDSKPKaeolMVvvZtdtEjcNjLLjeAA
        VWytxUdixjb6C93FkUwuUhA2mI9K4xFkrur6ODmQXo/1aqruQdA92Yb6/eJYlMW06dTRlu
        qnfP9LanqOb/vgXJ7RT8APpy+we0Mjg=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-AxyupDrVPG2urmqCbSkdfw-1; Tue, 27 Jul 2021 15:24:31 +0200
X-MC-Unique: AxyupDrVPG2urmqCbSkdfw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ausTjSa+sVKqhpVqnbXFf2jGn9RJrbOE+by54xL++gcJRa8mWxmM8khRQ1EM3bPsMMfrwZhLHNCMGw9QyO3KDkfq7j3RZbL3AoLvf8GXdypBBF836jYvjupD1CwaWMgeZmWt/DEcC5uxGxrZkYg/4DP5ez+IecPGZKu6sM5D+tiAODWzs7dwNY9azzbPpSPAcB8rWWiUB8PiGXrDSwhvfC1geleaaQndcyYjx+gdfXh/3Qhwg5bhboLguCK11hcHtWtNFHzxzrZLs8xQAHUZsjlEVkDMaO23JH9XWb4/fS0dsoxXgqm6kasdFshicvJf2F7LJPbjWyhmw24Gqron8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ROvtFTSkbaqLBWc0A68RSJz1RQ2EX/Z8WUE9hVRTv0=;
 b=bRKZvhMxetFmWPg0lPFzwHeY8RISGJ0whCozy/KvD2ibIPDyuzan0dEf79iyqEhbQrsgETUtNM8MZf8ZwJvDkM9n83lZZPDERxfxFYgw+Ad01qHCDMl8wsyU2ixF+YISjmKLn4JPUyvPmUFvyuvnOEZkfhG/TSvl2VgFbu5B+67CWgkxRApvwhBDWfxYUmi4MPJLE36OG7J2x9DLB1/ZArdUktON2H2UYG1SH4/nrwdRmjdY/9GYTasj1lMM6DkPCQtz31A7XDF9QJhM5M1a65tVoxXUlaT1Sh7Gu/zeurD64ahlk5HEBGezniksn4OEixb/LFz8V4epVWVfO7NkfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DBAPR04MB7398.eurprd04.prod.outlook.com (2603:10a6:10:1a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.31; Tue, 27 Jul
 2021 13:24:30 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 13:24:30 +0000
Subject: Re: pl2303 : unknown device type
To:     Chris <chris@cyber-anlage.de>, linux-usb@vger.kernel.org,
        johan@kernel.org
References: <2560053.x2KRyp2eMa@cyber-bucket>
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <870cef37-ac7b-42b7-5691-088434c3b558@suse.com>
Date:   Tue, 27 Jul 2021 15:24:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <2560053.x2KRyp2eMa@cyber-bucket>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: PR3P191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::11) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux.fritz.box (2001:a61:3b82:3e01:c3c9:c93b:1b8e:a220) by PR3P191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.31 via Frontend Transport; Tue, 27 Jul 2021 13:24:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ff432f9-027d-4ec8-b4a3-08d95101ddaa
X-MS-TrafficTypeDiagnostic: DBAPR04MB7398:
X-Microsoft-Antispam-PRVS: <DBAPR04MB739846B81440BAAE96EEA5BBC7E99@DBAPR04MB7398.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lXBKe5OSaOHw1reqxW7AVRnZQoekVMmuvM0xeTA2w8B5mqHGhZHDLaA7ZYINhkddSHJBGWXmU0DfTjVWI7WZdkyH9LTxEFYuV7JQBxGbwGGWgNX6lYs6MhdzfTBBL/AWaI1PEXo6msBT5UqMV6thq4e/kZDhSekTwGbsPu36kgsx42Y62EGd/ySpIu4r2lByERo17N/1CJjpshI3tTz8kI37uJXHKl0OGqfO0rh7eI46FSv0dQgZt1JBNuPrphd0XMQF6vLIs9TfcQzw6aibn9/n77PF8WNb35931ev6UV2XGr3vICIJ8jYz9/Qr9wMJv7svA03809B63VjECdN9aErtxLlg85hWeXzP3OVFM6RMiuW/aZwCXsvgzIrK2VltyhgeFFLOqfzNhBBBFKkcptX8JiID4rza5Ue34pOfbRpNmTORNVqOe+aMejYWjuArnBKsMT7KNQJb0RPm3s0pDao7ohApDef16m/Rt4OYql6VdOKhhaHt1g6tDSxTZcwaMZYSTAeupP/k1p3NX/hYrjyhe5V/CTz9+NAv+1BpALokqZAY+ccJ8KPFu7RWSVwZvGEgwpz3iMGx9qshnWLoEJ0LAcQJVXmoXnn0PVRC6dQg63AYJlW6sq3Ib37ySgQxJb6YYpTggUk/qqetvWmPeVQJmrGKRuKo+Mo/OFgjlZB/ConrBqifC08yLalGqIOtzEfLCJqOJ+cOzeLULOgEoJslOo1UzjrY6+V4kOPWSkY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(39860400002)(376002)(136003)(396003)(8676002)(86362001)(36756003)(186003)(31686004)(66476007)(66946007)(6512007)(38100700002)(2906002)(316002)(6506007)(5660300002)(2616005)(53546011)(6486002)(66556008)(4744005)(478600001)(31696002)(8936002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MIoKjwgs+liUmMHv1tUd4om7UVb3KncIV7tzil4Lf8HXnSAt7gH5MFilnIgY?=
 =?us-ascii?Q?qR3fi1J1KDpIDha5RojUYD2oqfwGepXrJBeX82dahPifOKdMagMmsYSNmIFE?=
 =?us-ascii?Q?n8Mgyo9arjZZpFZwWYvAK7BUsW3dbXfV8B6xA/DNSMqj/BpfkScNbovrABmh?=
 =?us-ascii?Q?bL/OVCfUHbEz+JZIoOYHm3nNyIq9hiBZ+FMMvoE0FEkIHxfAftidJZvuucMK?=
 =?us-ascii?Q?qBJY6jRDdy7UAbe2EZJrWls9wPJ9DADJMQuJ/pxJS7sv4fGZqvRliYxeUdJh?=
 =?us-ascii?Q?jVAvuRaFdNL98ICvDXJ4QDD/+UKkAvMAPxHGXSOH0E34lcBsaLFmYu18UOZV?=
 =?us-ascii?Q?DP4XdwS7Rw890rz7TQVNJH2YEZOhfvHxgfmDBOQkbl8kT79qa1NMKeUDgGGI?=
 =?us-ascii?Q?DYNrXBlMz+t0iWIBBsCLJd+WuguE7Jns8mIZvZnHYRViDmxhIGE4V5VHHRcj?=
 =?us-ascii?Q?YKHSoeiEvXrrv1F751HL014FQsAmoccT7iuymda6+oansrUqia3fiBXfcGIJ?=
 =?us-ascii?Q?jQVQjLhmaIXkD2le/ISEeBc9AHhfeTD+V4EL+lyE5fP5saxZlO0QeOZ61y0W?=
 =?us-ascii?Q?J054jcAgtGnTvzxjmv6w7bKP902LdBjPt2lXje2TFRT+rztZVM9RNGXYmVZy?=
 =?us-ascii?Q?dp2qunT/DWXhqAKohD6m9dOCs1hAf1xDmmTzHRt+gqHhVk4CM4QOZ2YSVLfh?=
 =?us-ascii?Q?EJXxtZ9vzegtvzO3telO2emkUNMcLdBUGR79zrfq83CVC8gpGkvPFI3CevQZ?=
 =?us-ascii?Q?c4XI/YsfohVd+8FjD13N7C6ibIcMXc9h5pZVHqH4QWeUS1qh9Ed9ELS6q0O4?=
 =?us-ascii?Q?dMdBcUlIliNE/xg4ELnQKKJbjGbmd7J4jvqY2lrluYNENNhLslcVbHHHK7iG?=
 =?us-ascii?Q?eLG24FNPFQjQyBdSRuSFojk8tfN8RLmf1/Bo0/h2hMV7X/iI42tsjs8T4SfR?=
 =?us-ascii?Q?Lnz2KlSXp6Dd+geCi0JZMGUZQIvmhCLTpmhQfrdYZ1d8ZVqlZrVfe5/Gv1aJ?=
 =?us-ascii?Q?UZI+F+yVadvoOCcFODlp+FgkO7EHIFT+Bsni+rpxqDWjIZ7SyZq5k/ukN2xc?=
 =?us-ascii?Q?hDyKXhTabxhYQ2ja8ssx7PMTJ3TrLKzfUc5sHYrTGdAmoIz0WvdDzQexikxK?=
 =?us-ascii?Q?FMjwYzklhon25C/pTvIK6EiJQDgCEAraZdEQStbY+ZA6RdmTi9kru0UxR8GR?=
 =?us-ascii?Q?n4l05mMA3j9tNIW4viUiiGqb6xMm+c9g8XEOceKBfhfT7DQR8re59oO5V263?=
 =?us-ascii?Q?+b0Q+IxR/VKrWgBhkz+vMVMatKNlbAgGaKX3xHECZytR1VR+/6b95zLdLfmn?=
 =?us-ascii?Q?ATVT+SxWcQyf5p1hlPX+fCQ0Sdv8teQaMiOKubH5IUv/TK8QSInSsiHwJ4ZX?=
 =?us-ascii?Q?B071h5slFTYhgm2cOKmNB+DQg/8j?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff432f9-027d-4ec8-b4a3-08d95101ddaa
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 13:24:30.6614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZ1jobFfcBineC4HbH3OqxKdB2VvFslWoMk+t+KUMrpbV6fNK7GPgAKJw5/IK+3TJYwSMpyUi19DASPZCjZqwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7398
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 27.07.21 14:37, Chris wrote:
> This problem was introduced with 5.13 and still persists in 5.13.5
> After downgrading to 5.12.x, everything works like expected. Tested on=20
> archlinux. The device is an "ICP-DAS I-7561"
>

Hi,


this is almost certainly 8a7bf7510d1f43994b39a677e561af4ee6a1a0ae

("USB: serial: pl2303: amend and tighten type detection")

Your device just says 0 everywhere:

=C2=A0 bDeviceClass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0
=C2=A0 bDeviceSubClass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
=C2=A0 bDeviceProtocol=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0

We could add a default type, but does that make sense?

Getting Johan into the loop.

=C2=A0=C2=A0=C2=A0 Regards

=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver



