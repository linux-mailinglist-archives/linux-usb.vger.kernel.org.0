Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515483E93EB
	for <lists+linux-usb@lfdr.de>; Wed, 11 Aug 2021 16:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232601AbhHKOrn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Aug 2021 10:47:43 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:36955 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232487AbhHKOrn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Aug 2021 10:47:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1628693238;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Fcv8wMDOusluTasRYy9Ce+z5h/DceuuMF0jJM0Fvd1E=;
        b=i085FbbCw+0Jhpl3uQqiWaUNrQlHDi7f6QPzdvSj5DQtvelBRryU9pzdzYftEsyas4/L7t
        X73maWK9UH6XC0y4D2E3a0uv+ZdVKiBpGv2yUO0gTSnUEnYZRv867BjgqIoS8qVdbiP0Nm
        7ylrKfZv6abNLWD2REjAoV5W2v8ImcE=
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-_TPpOIn-PaegKiz0A96F3A-1; Wed, 11 Aug 2021 16:47:17 +0200
X-MC-Unique: _TPpOIn-PaegKiz0A96F3A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gm1LoqbCkpWi6AjlG6pU8MQfqvUu5yngHc7FwGhZQ6uadQfETisYYpWJw91vNz2efutUBEt7jggCXCz/0AyJAZhStYgqpOqvQxR8/qv4U8QHAfHcHCsGqOOVwZgU3x6PjJhKBDlNXD9rjF8FMpoJZ+8mjec8ks7qQUTL399HfhZh8qr1apFYdjm6AxtkpVbNIA0utzwKDIEQtBKFilL79p7cSdoLIQMlP0n+fmyRl44LheEAbAtPhl1YFRqmjjejMdI82FU/JwHFnH4qvxOrHtguDdKhgjC6csDlBHCfezTWKoJygpJBtOGGBpZqbfVXRKZlFrh6cQXScsZLFJBRDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64/e+z0c4Iy6mTt9lX4twfSc7BWD6vCAYocX5D9AaL0=;
 b=AXtiTGCTP6Lu+zozWKLgFZsek5yhBXxtNjsuk4Ot5/moorje9pfIDEa7h9eIBg0mh/pDOxtagKh6W5UdjM/wbGwlj0cDg2L8/FHsrIV4ihfLrEzVG1rFdncHzTTDOzODMcxwHToyDUgUV9ZoUcUgNy15NptzButBSreh4gEJ7SOWXz/7C9jWPIP9sleLx+yVzmuSfQqaPhXKKSJ+9xc+/yqu9LLjLfjFXuSt6nkopSYG5rfo13wS023ZJqCt35bxMdk4GudNr9wfJXAzB75jvor3u5OTX33s8Wqq9PsRWSzLhZMFFcZFSm4YXRzYPK0/lsJAstdADtkYmOO26+Yx2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB6PR04MB3144.eurprd04.prod.outlook.com (2603:10a6:6:f::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.21; Wed, 11 Aug 2021 14:47:15 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede%7]) with mapi id 15.20.4394.023; Wed, 11 Aug 2021
 14:47:15 +0000
Subject: Re: UCSI failing due to probe() getting version 0
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     USB list <linux-usb@vger.kernel.org>
References: <db9e63df-80cc-6dae-89ae-23cb1cd09425@suse.com>
 <YRPPTjaFLy5t5HsP@kuha.fi.intel.com>
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <3207f6c5-db56-d38e-66ab-42d6b6166cae@suse.com>
Date:   Wed, 11 Aug 2021 16:47:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <YRPPTjaFLy5t5HsP@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0082.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::22) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux.fritz.box (2001:a61:3b0f:ce01:6142:66c1:effb:a0be) by PR0P264CA0082.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 14:47:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d25196b0-b258-47a6-1658-08d95cd6e932
X-MS-TrafficTypeDiagnostic: DB6PR04MB3144:
X-Microsoft-Antispam-PRVS: <DB6PR04MB3144BC2306D1A17F17AEE2FCC7F89@DB6PR04MB3144.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w5VsOvd9yPqM0zHVPL2i2HM9tA4X/5UGOti40tT/yRs+gMG7QNEvEL7GvIad11X2OyKnK6j0K9W1NhpDMkGvOqSXcOfmbvvASqLlUSg9SKLU2fl/DZaiAhjVt9o7dSnIIfDOmIoouJdFGamtXWea1AmpI/x0huuNPI5Q7oqCr9mJ2G/pCjjW3RXLeTlSVEyl+SUxu4E/GiA3vTvcjPAhpMvRILW8aVeF7FmrDcOq0IV3iAO7SnCO00HDGocPranaVJGKQwQ+ljdgkdFk3xTLQoXt32l7wQSRpzrpVkkR77LMoFzPGC1VuBFscHokQRacjiEFOB2GedJjEUaWTyNH2LYDHwpIvhMDofEHjAvhM5vx8NjR27hzxOGAOl19wxdrwHbzQlY4jVPxE7/HAXi8ZCTp8QfNVUw5K0WhoCRY8yvm0xziKGZM0Dppa1rxScGk/p+LDaHHGYewMk4iWeZXYKkBM2Vj8JcX2Oh33xHePwln9pcOgJ+PESgY9BcuO4SO0xv09chF8cstdcLBhSzk0Qhxo+XiBul6N8eTUBGgvX3lq9Uu1Nl3wx7VyNGlqFxEh+Fs3bVTvJpeWHFxu1m+8+Nrhk5JLAeuclsUlIdIkRCPDl1a6up3Ma7/HsJU/yqoqT4w92HzMPULpe2dMm/uLWO3fVzm/c4zBgNsmhF7W9LhA1+2p9LCE3EyRkWvBwjg7DPDy1yN4M9fc8YWGJV2DMvn1TlT7S6ji2rJzVxl1n8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(396003)(376002)(39850400004)(53546011)(31696002)(4326008)(6506007)(478600001)(186003)(316002)(86362001)(8676002)(2906002)(6916009)(66556008)(66946007)(66476007)(8936002)(5660300002)(6486002)(38100700002)(31686004)(6512007)(36756003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yZ0Cn8UNb3/cUUhabZqZuUKDFzdvYUZjl+fdj+iY4JTl7XOSAnhLTErdrmf0?=
 =?us-ascii?Q?+WdmqvSe2TY1+OvJxmxNGaQSpJaHlBTe4qVY1SexQzQ6Az9InUx0LrGk3ftU?=
 =?us-ascii?Q?alnsybSmKS48TwMz77SqJTIYDUa1hfDPm77VAvI3d+ALSL2tuzy2v9WQH6bi?=
 =?us-ascii?Q?C4XnkAPLpm5aKG7VVCMDxY9kQ3MKFssken9TxKM114p5EHePZ4yI7QPffw/i?=
 =?us-ascii?Q?cGW3e94lxItzN+MbjjbSttaDvc7x9JQ+llDJ9ZUYOVLIOr5T/3cTxMgXb83h?=
 =?us-ascii?Q?UYYfsl5DYQhA2Muaz05BYW++atODiy9KSy1hHYgSAvl129AoZFKJU6TXJAGn?=
 =?us-ascii?Q?yCT6gDeERLHASGjEVekswl2BA+luoXb/73Pvhc1BptOIJ2tuu8QeckaLK34r?=
 =?us-ascii?Q?hthk5nrC0inwZUGyg+AdDGWjcpi9D65vusHuu+9KY46ydpXfQMJIBAkzhIMK?=
 =?us-ascii?Q?cC2AocgrJNWzYa1Tx7fz6xVts0etVl0N76WJPqvlQXzyTjCWW4mX2iLPKpYw?=
 =?us-ascii?Q?oIVsOUeWDTN8ED6MRqMPHRDXsS5PSXiKr5EBFrpvbt5vHPyD0eEJp+xjgTzf?=
 =?us-ascii?Q?8bpODw4xEqk7sAMJsVGBhr1LIw7qJ1Zu3eoMa7eEnQSaIMXcbxWi1R71kIvk?=
 =?us-ascii?Q?Mnn7Wq3KGEDZhspj+HtvsZAvKCeosSnhGOYMpArJvppdx7X7LewyLfcM3oof?=
 =?us-ascii?Q?aCa9iDkKCslspgetmihZ+Lwc9Nf9lj/n5O+pPgbA5v7lT27jCa1K+uR+Je4h?=
 =?us-ascii?Q?e45zKd4ve9lzfsQtju6C6XFZMjyz1AQIsn9tk3l8WTX8S8+fPO396foMAuIx?=
 =?us-ascii?Q?0pN+hmIhAsFSqB+BN2tB8spj2naeWse5I5vOsH9zryOnXPG3Y4gehnrJNMG8?=
 =?us-ascii?Q?qx81Vs5Nih87dYyed5lecm62OXQLGciMQELdEp4yBnxfuWdsBSArmYNJmLwy?=
 =?us-ascii?Q?Ykhl9C8Xw/rkXDJrff0GNA5eJb3Trvz+7fX7ESNQcT6brzRoepVvaEPsNZJ7?=
 =?us-ascii?Q?9vqeSZRXxsGuU7T4i0pqOBXWrXAtUTRTuSEDxBFXlwGows57R+bD+8X4ja+R?=
 =?us-ascii?Q?PQ8vkauIb6SmKqyaJaxk+lVR7FNNVi7nmQsL0gdLXqJZNRYrRaSw6wQTWo7D?=
 =?us-ascii?Q?UnNSq0PDfTq1+2z37/1Pqa5rliaPg5T1tf2Qaw7DT39MQ8sQ8jOvK9Pd+Ay0?=
 =?us-ascii?Q?RPKGXgovvTtnzn/s9QABRg2TDYJGn9VJst9W0URPlTVlvk0mn7PJuLFhjk4d?=
 =?us-ascii?Q?6yIszCOaUU8mvyBGifJ2ADdTxezlZagNe7GyePRqVNISuynQiJk3Vk4D2Bru?=
 =?us-ascii?Q?KFRdgm5lU2PjiVqzkIS5HaYJ25Ne80T9FV0R6qmJDvu513s7YjyKlMU8/Nmw?=
 =?us-ascii?Q?Ws/hQ7DCRo8d8R+zR88VzsTqELOY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d25196b0-b258-47a6-1658-08d95cd6e932
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 14:47:15.6125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JfT0RXbEYKKlXKq0gyaovoDoSBT26UUaS0yIw0bEiEF73uY27WRJHg635T69Hvah4wxqIZuPrjLIISnfaPiQEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3144
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 11.08.21 15:23, Heikki Krogerus wrote:
Hi,
> Because of BIOS bugs.
>
> Ideally we should be able to rely on the _STA method of the ACPI
> device, but unfortunately with UCSI we can't rely on that alone. On
> some systems the BIOS claims that the device is enabled (based on
> _STA) even when the platform doesn't actually support UCSI at all.
>
> If you remove the check, does the driver work?

Unfortunately, no it does not:

[=C2=A0=C2=A0=C2=A0 4.657715] ACPI Error: No handler for Region [ECSI]
(00000000862594d8) [EmbeddedControl] (20210604/evregion-135)
[=C2=A0=C2=A0=C2=A0 4.657734] ACPI Error: Region EmbeddedControl (ID=3D3) h=
as no handler
(20210604/exfldio-265)
[=C2=A0=C2=A0=C2=A0 4.657754] ACPI Error: Aborting method \_SB.UBTC.ECWR du=
e to
previous error (AE_NOT_EXIST) (20210604/psparse-531)
[=C2=A0=C2=A0=C2=A0 4.658812] ACPI Error: Aborting method \_SB.UBTC._DSM du=
e to
previous error (AE_NOT_EXIST) (20210604/psparse-531)
[=C2=A0=C2=A0=C2=A0 4.659646] ACPI: \_SB_.UBTC: failed to evaluate _DSM (0x=
6)
[=C2=A0=C2=A0=C2=A0 4.659657] ucsi_acpi USBC000:00: ucsi_acpi_dsm: failed t=
o evaluate
_DSM 1
[=C2=A0=C2=A0=C2=A0 4.659665] ucsi_acpi USBC000:00: failed to reset PPM!
[=C2=A0=C2=A0=C2=A0 4.659683] ucsi_acpi USBC000:00: PPM init failed (-5)

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

