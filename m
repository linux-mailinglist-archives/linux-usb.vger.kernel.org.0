Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3CA146E924
	for <lists+linux-usb@lfdr.de>; Thu,  9 Dec 2021 14:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237972AbhLINeH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Dec 2021 08:34:07 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:51143 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233327AbhLINeG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Dec 2021 08:34:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1639056632;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Hk9D5T5EQr6KPq5wAU6PI3GYrWqltInIXBUhrzKz4ds=;
        b=FqKoAD9Awpx9hWzQvUNVWuLJ5hZ5aHRw4qxb7OeTEx4FFOle9UhydQcM/CuNoWYY0mv5wL
        xu0okLxm1eFeaNEg1DFMvKfX5yRH0e0In5eKN0pydrHApQOQuHmympWBz/94LIJrDRlbp5
        pcc+4F5rtBMllqcA4MFt46dN1WpQxy4=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-ejExIVd5P4yhLl68nktteg-1; Thu, 09 Dec 2021 14:30:31 +0100
X-MC-Unique: ejExIVd5P4yhLl68nktteg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQ7NYrvGuLg2ttUMf/MAvgt8Wxxh7nH7ecIbEzipK55pfWy/iWNAopQ+cl+ptg+kbVNnqqJwT5FPlQkNaAL39iCC0ylhlksAiOkEscUnAbj0WfyfEadGGK5esSJiFYdU6ngJHhbmicPK2dNR55+Rxnn+xaGbo8YO+PP6USGQLp4GQqN5i8iHNLM6/UnfyiF2q2erFFq4CzQ0YORRevrxEnlg+Sg63XucpIRZZ7XPIB+bwTcTlGa1o7q4TaA3zlZSwkcTAeDxdFakU3wR3gGXdp6pvzzshP07auO3unmhbCR8dqIotdl6p9f5T03Xg2sJmkuMVdCVN6DKqHxeUqZ26g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieGyrtqeuGh7fRqfwYNGmHGaLwCFfAhidLrsASPYksw=;
 b=f/1Nx5gAqFxwcBkKz89CT5fCkPtqblCViCxEd3QVB9pawy9W6E92FgS5H/XE4G5hxRJqma37HsQR2pDaN9/0H5sufHpPNmqNfSKchQ5KGvgxisdNSP/UIN6EBTfGOnlP79MS/Rfu1rfWoiLv6d1wcE2yQ5KHSHIMJ92b0HgRmDQ1sNgr9/dEz2p0ys8M5KQpgSSS81Uql/kZLcDLE6HgcguFMaxHfXoYFvtbdIzZgqdWy/mIvXdzOYkLE4DRSYzgtSFQUtVFO3zMBRtMMt5oDUoNSGaqWG9x3FW4khqbI2wx0ynuCs5QNL28iDcFm9BVO9mqbote7YmskCrpHwF3tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DBBPR04MB8059.eurprd04.prod.outlook.com (2603:10a6:10:1e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Thu, 9 Dec
 2021 13:30:29 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1%7]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 13:30:29 +0000
Subject: Re: An inquiry on supporting USB CDC ACM on Host PC as USB
 Host/Master
To:     Maggie Maralit <maggie.roxas@gmail.com>, linux-usb@vger.kernel.org
References: <CALgCfKVfzS27XB0AufBUhb8xnfq5dWhESuu1KfxycQ=EnUnp+g@mail.gmail.com>
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <984b7409-caaa-8ba6-8d5c-beff5f107628@suse.com>
Date:   Thu, 9 Dec 2021 14:30:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <CALgCfKVfzS27XB0AufBUhb8xnfq5dWhESuu1KfxycQ=EnUnp+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: AS8PR05CA0026.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::31) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
Received: from localhost.localdomain (2001:a61:3b82:1901:9d6b:5ffd:1b6b:2163) by AS8PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:20b:311::31) with Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport; Thu, 9 Dec 2021 13:30:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68d58e02-7b07-4e38-861b-08d9bb181183
X-MS-TrafficTypeDiagnostic: DBBPR04MB8059:EE_
X-Microsoft-Antispam-PRVS: <DBBPR04MB80592D469370A2273EF2BD98C7709@DBBPR04MB8059.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IIYBe9Pb82K8hSwXaBCWS0YkoITsD7vZUzGgaaf1Ir5YFPqnvtFy5ZeW62U/dIC15KrPfU1HxLtZboG5v2IK36BsdNuhRYghZhevd75uOabjkg8qy8E/wXqhHOf/86NyHaIIi93bM1CxExBCY+WpJ0tUrofb80s95zEAYVgaxOwNtFTnhk1jFRWdV98A8Iww2gG1nPFZwqsOPTu/Yth35EV9bwrNJya/5AjUbyJ/JxZh1J7dFZNqTV2dDbUu7QA+5g9Q4rzptQzNx0qov61I4c6VzPfO8sKDp/M55IQl1MU242cRJQ6yWipFnITvoAlossd2KDhzOrpY7wAPFW+h5bXBBzx6pQmEnZ4VgDMubaig1byFMuWf8NoZFKdDi1BIdynJ+yZ/PRrbO52cNHaKet4NXJtzSgQGhlU3Y+O6D1SLPOpqNQnvY0Y23iAZVeBiMIkIvwhKjpJuZnh1zBfBriCb577dOMkF7y4C6DiSTzSJGb/vdOWlne4x9cYuw5aTtZtdO5EiTZhkeUGN+BpPFiJuLggRb4l0ambtUEa9aquNUuOYpomEcZonyQq1gPfeOimHhPK3t+/hU0fp1uur6siuq9OrPyJCYbaVoPNSuWMw3grWMvr6sp7jFaC8TlnayyLLGS8XlofTPM8YVMf4HL3QoUqA8uaGmStN1SW4refLQBicy9h4zfGVhYC3xPu+YijWYGvzeOslc7dh70lTl9zGpgl7tQIynowLqch4S2g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(31696002)(6486002)(36756003)(508600001)(53546011)(5660300002)(186003)(31686004)(6506007)(8936002)(6512007)(2906002)(2616005)(66556008)(38100700002)(8676002)(316002)(66946007)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xT1A2wHUtmdAk28TGxn54asWzvTdSgDRkBjBmV+9b/cG5GMJl+npBPQg8J3y?=
 =?us-ascii?Q?uAzvoCPoQr5ePgknSeYRli3Q0ko1OFHihUMqsiBj2Ffpe3lMFK7whrMNFUH0?=
 =?us-ascii?Q?A7TueaGweVyrvxpAhkYef9ateyJ6ArLOZ3frHi1APHpSoZZNPC4lQmGxYnzR?=
 =?us-ascii?Q?3WIxC4Db8Zm7nY5fGnMmR3EhMJdflM/1OndpjT3m5T1sn9souUJMGgJ6S8sK?=
 =?us-ascii?Q?Ol+AN13LDcJPcjuqKI2kt/1imTeWDTJhyrcR1QTIiAWc6wNj0UBPcC8RSIa8?=
 =?us-ascii?Q?dRnG7128FtsDJomrSkQVWHNB9SVPE1NhtUaFPh07JcjNBfMEsTLN1Hhbx3be?=
 =?us-ascii?Q?PyG+PcjMNhmZiZ4L1LU3tNA0Y2QJ7KoTkkKNY4gf0V2lwnP4ZXpt+B4ub2z2?=
 =?us-ascii?Q?t7Veq04mRW7uWWgBRETIVgV29KJywwSbQw5xao8zROXx7FhiOcT2PcNGY/3q?=
 =?us-ascii?Q?eVGuYWWjEZRHolbwuigJVNKnKxCpQo6jYWofH1UqPdqvVsHYVnO1dou8Ex2v?=
 =?us-ascii?Q?e3iS/s/F5ymIlgfPffb+6NCXVoESHea4NcgM7ID1vIftXIUf/QkKjC34Cedz?=
 =?us-ascii?Q?Cie+zibjYlMn/QEHSzrX6a/mBj6w2ea3aB+2jPGviCqqgnjlYv/+DkmjjXY5?=
 =?us-ascii?Q?XAhCZ1OB3zqcBuZEZUy3Ptxk0qmLXI5gC9+fnB7grJ64xlDT5+yLGPvu/1YO?=
 =?us-ascii?Q?Q/NGQm2sd6oNpEsg16ZR7SPpzpHFYGDy/gnjwK/1JhTQXhqHBVpjL87XE2Ct?=
 =?us-ascii?Q?/3tyd4/HTAH67XB3xDzKOIfCBqzUNa8GxF9rTtRGu+snw63NvZHDOMxJP7LY?=
 =?us-ascii?Q?InzOwLOi58MWSHUEcHxqez1jr70PlbYGWfjXDdsLst8d3QSlsX+fSIV/jsZY?=
 =?us-ascii?Q?jW+SsvsINttbUHG8uwTxgqGdUzLbOkorVbNdkuzpb/Xo/QNt82lKFrjhBldh?=
 =?us-ascii?Q?v4qXzJuGcGFXe7TIbKMkIGWT8ahBHtiYU71uEWJBhZsMC/rBpkZg50bVjOA7?=
 =?us-ascii?Q?iyG7EbeWh1UlAygykLgwLpAElIlCuEl9Pn45jCgh3TdJFZWyHgbAfex30mb1?=
 =?us-ascii?Q?2mZ03VdJ39N1GSkPOojLAF3nbnssq4y9E/+46ey5DM6wnEYUSJqpWEkA4p/q?=
 =?us-ascii?Q?unGUrjyQR0U35ro9N9NmHLy/zKPAUEEQkaNtJc0e/ZeIfHzzDRtOIlr1Kf7O?=
 =?us-ascii?Q?0I8ibTZtE4LI+8rvtqmzASZgB/UBE7EQlAVTuptFa8hoaGvdEvMDinq1MrdB?=
 =?us-ascii?Q?ZElYysOW2XsWmh8yUFbW4f2WXbvIG0YsjI7vrMJrZXH5L0lTq1Hu6uZOiy+N?=
 =?us-ascii?Q?yrTFeFnBiMe9lUtvy2+E8C0DP2zU391O9egBHLY0j5xLd0jZl1CtYT4FU4XM?=
 =?us-ascii?Q?J6P1vQL5xDb4rWJqi4J7YJhepHZN1rafebQYlafiKdVAnu8m2x5XdtwaWe9h?=
 =?us-ascii?Q?II2WJvkWvfGgoZdnPtjypuZMvd1SYWAJJ3eeteinDnJKUu5UXHIg8z3uaLnu?=
 =?us-ascii?Q?NOhMlVwEYRTgR0/NVHe0ghON9KZgu27oH1fhwGct6OjxjK8HyaKWXLSDApnV?=
 =?us-ascii?Q?OrhN9M8U1R0CBB36OUNekR7cEnUHis2NQwrZ/0R32F6dqyjOl+7jq6Bpl2RQ?=
 =?us-ascii?Q?KKZ2ScA8H8U9D1KT4elGjtnn3ViLj/CcoGNg+xw6MgYCl7mv2a+LufXPQb5W?=
 =?us-ascii?Q?s2c7KIKZSaZaIljuUcaMlDDO2Jc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d58e02-7b07-4e38-861b-08d9bb181183
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 13:30:29.8086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PbMn8dey4rycfFhsdB8B4Jd5FMYo9lig8KqiMfB6RBJMyjbT/NtqWinpDxf3OwhWbb5pIk83n4i8R5SAqCMKQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8059
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 09.12.21 14:09, Maggie Maralit wrote:
> From my understanding of:
> - CONFIG_USB_ACM (reference, how to enable in kernel) that produces
> cdc-acm.ko under /lib/modules/<kernel
> version>/kernel/drivers/usb/class
Correct
> - CONFIG_USB_CDC_COMPOSITE (reference, how to enable in kernel) that
> produces g_cdc.ko under /lib/modules/<kernel
> version>/kernel/drivers/usb/gadget/legacy
Yes, though that driver is the older of the two versions available
> CONFIG_USB_ACM is the one the user needs to have in their Linux-based
> Host PC's Linux Kernel  because this is the USB CDC ACM handler for
> the Host PC side (having USB Host/Master settings).
Correct
>
> CONFIG_USB_CDC_COMPOSITE seems to be the USB CDC ACM handler for the
> device side (having USB Device/Slave settings) which is on the side of
> our Product.
Yes
>
> We assume that as an outcome of enabling our users enabling
> CONFIG_USB_ACM in their Linux Kernels, the Linux-based Host PC don't
> have to install any extra USB drivers to communicate with our product.
Correct. This driver is for all devices which advertise a the correct
interfaces for the CDC ACM class of devices.

=C2=A0=C2=A0=C2=A0 HTH
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

