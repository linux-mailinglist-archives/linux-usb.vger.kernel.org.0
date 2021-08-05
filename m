Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40BC23E165D
	for <lists+linux-usb@lfdr.de>; Thu,  5 Aug 2021 16:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241853AbhHEOGT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Aug 2021 10:06:19 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:27180 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241843AbhHEOFQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Aug 2021 10:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1628172247;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=ZU3Y3l+VkcxoHcyvKtRnbWnbTFtjDISTLSxl2X9jeW0=;
        b=MwtdZFg/TblBOABX27bLj3CTpOJZRmD4QFPK0HZvbYyUxShUWZrgmdYCB/vf7tB8p5cSYV
        AS0dsJ8Qbu0mFMlFCMrvLjn4Bt4xoQpJoJjTijoFWbAEfcoucIoVY4AVjL/m/fBirVColE
        /l1lTl7xVxyR21s6XT7BVWeQp9L8Oc0=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-Uql30BoMMuuUkDJ29sHpVg-1; Thu, 05 Aug 2021 16:04:06 +0200
X-MC-Unique: Uql30BoMMuuUkDJ29sHpVg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLBQo51ME91tRvwqIRxPCnmz3g503UtT3tVDKH/xYE5L2Z+xSjQIKLczD3qcuhqjzClwD3EGhuNPb/xhhBiTY5n0ZN3WxpIgX3dZ75UVenc3fZJXNXcNNh8WIotArgGOyL1lWGoM5CVX05EMX8F2PL9hC0NUhFAsfJhqmYdEcCRNDOvPuF0YRIQAsKkUdjQvfxEcylptyAFgvHgoQkJ6SdDmtQdP5qWU2JOf1jIyRD2iaK2Xmz068w8VQ62XMJEy3RvhnOo4Kc31EA0gtgbqznv5TxTWgEnTNh3IkSthNm09kmWQwUnB9x7fUR7LeR1XfiJ3MWg+YusQDuuyK2+Bwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eAqZvMohwQw29pLs9RqxEQISnCj0TH2gRhBfM0/lbM=;
 b=oBARgFtvM9xCIl3dIeARb6/bs3PCbJj5BOZhHBRu6YZLC4dpNQu7+8Tsr5+Tqo23WG9G75ynrzkMNxPIj+HP7w2ZgC1s+a1Tj9rOP5GkmgE0xc3Od1yIbpoAzrhw12hdCXSWs1CuXj4KUk0q1uGUGm3Dp6AKlK6P3HMtAsHLoqWYLUvopiOT6YRaVqO5e624YmKGg/mPCBwSztZUJDaE95+P7GH6s1OFTKOgB7x/hh5Fw1O46ri+1Zq87AV1xw4ZO/ORq+4uN+SVNoOXqZQda9qeJ0R0pE2RG6Ae5/Do5i//BfdFZzTGRlhmdxiNl9BFuaKRqE/ljO9NXJRYAxvjyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=suse.com;
Received: from AM6PR04MB5047.eurprd04.prod.outlook.com (2603:10a6:20b:8::18)
 by AS8PR04MB8294.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Thu, 5 Aug
 2021 14:04:05 +0000
Received: from AM6PR04MB5047.eurprd04.prod.outlook.com
 ([fe80::d021:dea6:f6f8:f32f]) by AM6PR04MB5047.eurprd04.prod.outlook.com
 ([fe80::d021:dea6:f6f8:f32f%7]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 14:04:05 +0000
To:     USB list <linux-usb@vger.kernel.org>
From:   Oliver Neukum <oneukum@suse.com>
Subject: UCSI failing due to probe() getting version 0
CC:     heikki.krogerus@linux.intel.com
Message-ID: <db9e63df-80cc-6dae-89ae-23cb1cd09425@suse.com>
Date:   Thu, 5 Aug 2021 16:04:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: PR3P189CA0031.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::6) To AM6PR04MB5047.eurprd04.prod.outlook.com
 (2603:10a6:20b:8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:a61:3b82:3e01:c3c9:c93b:1b8e:a220) by PR3P189CA0031.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 14:04:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 414cfebf-0605-464d-a121-08d95819e29d
X-MS-TrafficTypeDiagnostic: AS8PR04MB8294:
X-Microsoft-Antispam-PRVS: <AS8PR04MB8294FCD84B594FD206CFCC18C7F29@AS8PR04MB8294.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1wIDhKtTX5iIagmBB6bkm8oAedcb9tWdnC0As/XYL1ezySAjmdg/UbmMvURjqMJzJl192FPDPqW0HbG6hO66PtsrrJED4UDd8qxb3bKxeSKqEuZSqyhxJHXZUtqfOTgXjhCCO1Y94rhuuvmM4u6kmN5ZFXRtCZC1y19uVwQVH/v8LO6BueDYMA5p4KR4fPCpoj4dAsiwVrJbXJLkNEkH9UhkVis3lfV2Wa882BQRNL0NnjoMLG6izIsnz+Qpo2XjoE92E/6loQbMQtggp06yvSontEo5fsiwMC2VSoIi+nWxJ91hsu+qAZiqDeCb2AhR2S0bN00R+EaesX8zW1fivtIp214e5ScmiWqySFCkpHViFom2ectcdvsq8sd5YoszJ2/xs668sce/kP9cneovBwp2my5Z4w5+Sp6lcNzl1vYWTCJeCjJ1xwpxuaXy2gn7fd2xngIxiuZhti9D22IY+2F+BxN+xrj0wmdQ2HP2NIf7Cy5eX+hclEoOn+irtubRPb6j9Zcc1bgBH94ZTZCJf8jI8ElxHNsZO5t53hK4ofwYqvk2QMUqLXYnTkJreb0X2jodYW9J5qmewEd1xuOVQ+7bzNJjO6KYbVb2b+llQIMdjq+/pTeDapOOJ2OeRCOGcF6WAOPe7kVu24qA6uUSsKz2/bGK/mFH19PtRgKe9HSGUUqACz2TUx2dIah77oOh8O9TbzhnpMDomxFPbfXwF6/4CeYkQVLogLudzhPZuHL2gZ4RRo91sLdtAilTSrIli6KNwtn/FqyNrsmTwfxOfKRIIH8JvpPLzmUU/tzX1jQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5047.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(39850400004)(396003)(376002)(36756003)(4326008)(31696002)(6506007)(86362001)(38100700002)(5660300002)(66476007)(2906002)(316002)(6486002)(478600001)(66946007)(6916009)(66556008)(2616005)(4744005)(8936002)(6512007)(31686004)(186003)(8676002)(45980500001)(43740500002)(505234006)(554374003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8QZ15t+lnsPP8odcHashki0anZCTYk6qUt2723zf/IcpjxGl1tAH8YZoAkKf?=
 =?us-ascii?Q?aSMGv8WThdviC4o9OCua38QsT14L7qWJ0zSPataQwBlkr+ZZXVC7n7UHeEEG?=
 =?us-ascii?Q?gVlnw/FB7r4JAj+TWILUGOM5vtblz1TFNKgFLwdY8quWmrwbSULdO1cnjIZN?=
 =?us-ascii?Q?eJ8G8orZbbp68kRx2jxArFfFAUs06SOwFCMHs5rN3IaLzYK9ic/zMKIbjkk6?=
 =?us-ascii?Q?9G4zUeBYgWo8zQ0wSNXJGgvRuSIUtSCdNmKoAYCKeox16+TVNAOXbnchwTW4?=
 =?us-ascii?Q?VItr8PQqEB/V7AVxVYjJv03vzjyZ5lJWjwEBt0o3tVQsTUbyzsHy9N4G3V8F?=
 =?us-ascii?Q?XTm6oEz9Dz1SuDofbrWgaSVQgbkHFGnEKxFIYTxluIWBazEb0jEVCljtyaMj?=
 =?us-ascii?Q?CJ8NtddFIb9m99egCWa8xUiqIM2VywWixG/Gb0Pm8OJxIFPt55oZe2Nys3rs?=
 =?us-ascii?Q?NaQBizbL0XAc22KGYW8ak1fuZUN3GWkkcXcJVi7e8HLqaRSlBQPMBThQf+BU?=
 =?us-ascii?Q?YmoixviVcqh4YmJ7dUba9mj0ucbmuLafB7vBY1R2kGksE/gfwBBU8a4eRfcG?=
 =?us-ascii?Q?BE7ShpCn876mENvNU+IUEPOSB6xXQpptyiARvQzFJzdHOYrP+aAf0/GwfFjB?=
 =?us-ascii?Q?2TmLbct4ukgHVa8QQ9hizGP9ppC7ccd2L4konmQ4fJOLGcEXZ2844x3C567W?=
 =?us-ascii?Q?uQrOFRjpe35S0TCH5HJsjgEKfv7C9A2Q/RKj4K3dI6a92xg6hhhdTdal2sVN?=
 =?us-ascii?Q?JwCH+A2RQx1sT73arZ81lTXbaB9nslQF+TcvrDZlb0duhZcImqH8qFrtLUx1?=
 =?us-ascii?Q?FkAR27JB4Kt6GknFb6+/qLiNT3YS20WEoN/O3sGZH6JVlVSAP8spptJd6ZfL?=
 =?us-ascii?Q?RG7TNEj/equjeDTvy7LxjazlkbUh0oPZBCYgXW9xiEK6RYirDTijF8k/M4e7?=
 =?us-ascii?Q?pw0fe6M+wNofUqAj4ytdqcyVIu+iseL/C59UZ6jJ2fWnvzLjR0ImC24QgGfK?=
 =?us-ascii?Q?2py7flj4Poe8cyJQG9OaacJUd9xCiFgh5pTTsPnwlBc/IQp/cH/tipK+tOLV?=
 =?us-ascii?Q?8DpfzMGV/E+DFi1GlGgiflHDluiofiu9qCZgIpe8Dkjhavz05Wc9k5V4HioO?=
 =?us-ascii?Q?d6pUOdL12le2aHDVuOPsqyBnyWJKpnL4+LmXoRMBru8vFyHK8temDVEUwrIW?=
 =?us-ascii?Q?YlDoUT405bv6yF+E18il0dTBhzFNXaParkfgjnfmrreIPoxAbR+ddM9PrTvV?=
 =?us-ascii?Q?TuTf/6r6ERsyXyeJrzw/QlJVRriKAa84SuZot6SnQQ3YpfY96/PPSM27KnMl?=
 =?us-ascii?Q?FErCRBuD8pgsRUZ20o4u043J903fkhLOKTGDFbW+V2JIeKcWE/kyrSAD45H6?=
 =?us-ascii?Q?Ih/iC4oaveaTvZow4LdlmEfaadL9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 414cfebf-0605-464d-a121-08d95819e29d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 14:04:05.0792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8Hf+qA2yt3lqg0uGPHrPEs9oyF8hRc3TO5+bcOMmWRTPMd4jJR+cBAkv9uuwtQDNbu+RAR1F6Pay5HoEoBy/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8294
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I am trying this on a new laptop, but I am getting a result I do not
understand.
ucsi_acpi_probe() is called, but ucsi_register() fails with -ENODEV,
because ucsi->version is 0.

If I dump the ucsi_acpi buffer I get:

00 00 00 00 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

And, frankly I do not understand that. Why have the ACPI device
but show version number 0?

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver




