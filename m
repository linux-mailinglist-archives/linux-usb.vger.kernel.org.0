Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B24E2F3599
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jan 2021 17:26:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406343AbhALQWd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jan 2021 11:22:33 -0500
Received: from mail-dm6nam08on2081.outbound.protection.outlook.com ([40.107.102.81]:50359
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2406242AbhALQWc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Jan 2021 11:22:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpmpGKbFsvnMuV5B+OAQWR1355yNDJMvdDXOiJdUD8ar8PVmdTFn54+HltL1XLzbfvp7DjbvNGG05A+DUERoEab+wwCGy13o5/lqsu+uPO7fsCw8ZDEKuD9p2kNSxxOtAEGzo3GMeDxeikywPCtaooEPu6gYLEGjS3V3Ib+1Eai2UwO8l7lyoZnpV74GUYKGJ/W7Snsy2dA1brGQsa8bHO3TKKXFNFg1B1YUXO2jXAgcYvkCv3Oc60FiDSSG8g3gQ+f5+pgO4Q55PtD6Dqulra+u1cWbtjk0hiZJNZyviC0NXMQGdKs3WdL0vDwz0Zu+rbPsS0lNf3ZH1Jae6NCAcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJB//3Rv0YfrlfSxYX4s4BlgPNwDN5rU5aGQ2e1qHuE=;
 b=Af/1NHof9+Omn4pJt9sDqQhobSqsTsYhbCy6WAfYkHH72mM7ML2UxNDe1JLOLQX3mB01CUqJqW8A+h5xep2iEGVWzlFZbUUJLiZsdRu/ZYEcAH0pwCtAx/BYn9160E9n3sQgzm0ObMqbfPDe4B27oSh2URh+YQ5rp4z1Yx5XgwoJ0OucwtrX+RgNR32s6AYMh0rKfyVS3Uanbi7BaGpZqgkIo5E1+Fo/FxjViW0wQhlLoHsU5vqP/zvFJm5MyF0CjE3Fiq/KTsIesHdmFuAs6NrfVEfRIS8DL9gjWw7TDzTz3Im3Uj/xxZ4Tu3yod/Z/uuwJ/wOx62znIElummOw6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJB//3Rv0YfrlfSxYX4s4BlgPNwDN5rU5aGQ2e1qHuE=;
 b=FxlD+xYmi/zYarTeFugeYGSPSYZgIi5JdYxWhXos9iQWmFujTcVBrAJviKEUboTSbPxfpIqA7QrGkhWkb/qMZiZVIyx5nxjrsvZOphGudAtqvFqE+F9+yYpOyqrbrPU8Rw7XsMavgqwUo2KvuBj0F4TCcBYlfiDJnVR+/CMUxLA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BN6PR1201MB2467.namprd12.prod.outlook.com (2603:10b6:404:a7::8)
 by BN6PR1201MB0194.namprd12.prod.outlook.com (2603:10b6:405:59::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Tue, 12 Jan
 2021 16:21:39 +0000
Received: from BN6PR1201MB2467.namprd12.prod.outlook.com
 ([fe80::d942:b0a2:f2ad:a33d]) by BN6PR1201MB2467.namprd12.prod.outlook.com
 ([fe80::d942:b0a2:f2ad:a33d%5]) with mapi id 15.20.3763.009; Tue, 12 Jan 2021
 16:21:39 +0000
Subject: Re: DWC3 controller Runtime PM
From:   "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
References: <049dc0b1-1c3c-de1f-f788-ab1cc0dba3a4@amd.com>
Message-ID: <887ef415-4d15-062a-361f-f55c8ce5c351@amd.com>
Date:   Tue, 12 Jan 2021 21:51:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <049dc0b1-1c3c-de1f-f788-ab1cc0dba3a4@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: MA1PR01CA0121.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:35::15) To BN6PR1201MB2467.namprd12.prod.outlook.com
 (2603:10b6:404:a7::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.86.172] (165.204.159.242) by MA1PR01CA0121.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:35::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 16:21:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 22ff6ade-2748-465f-a521-08d8b7162438
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0194:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0194BD404F4C6E03A5D8F579A0AA0@BN6PR1201MB0194.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YXQcwFVg3AxoqHC4nS1jnpWPrS0/usnK3sbr84s+F/Zm/lCDQLwg4GoNs3p3bu2Mia7LhqIFA9M57hncFFTZKs0che508w2PAALM0hT5wYG5Jpp1Va0ornxVr6m8jkLhIpLMo9DPC+FmXiCPzcb1gjg0MpmaEv7qUA7/Pt5pFosLKDzfz7DMB+P5wdXiE4eyMvvtHTkguEhMxi/Sd10ElkRDMeCmhAuGUFHEVs4wiw8YcB5LaRwPornJzPdJIAYTLw8gjsZCnz/O2mOcnGeBUhQNFB9JidodP74nbXuPtlbXzwyjNXaPVY8WDXrlZYftgSzZ9lEPZeAQ27wXh5oQDPO02gYuLs+aX54uB9zkPQeyk/h1yHvoxeAAYGeSwC0I9QEt10wFzX1kXS5I/ZTm3xR/AYVrTStvwxhsGVf/divVJfKF9cl/+9yRt1f7N0SgsbCNDiDdPP+dxngFSxPe3zo/ZCrvJA8bM5CvpTdsb9Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1201MB2467.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(956004)(26005)(186003)(2616005)(53546011)(16526019)(66946007)(16576012)(2906002)(478600001)(6666004)(83380400001)(8676002)(8936002)(86362001)(31686004)(66556008)(66476007)(4744005)(316002)(5660300002)(4326008)(52116002)(31696002)(6486002)(110136005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K3k0c1RYQUZSV1QremVzbjZFRVErUUdzcElXMjVZUnZvRmlTYXFHTTFHbWdY?=
 =?utf-8?B?bzNsWWk3MWEyeEhJTmVIZmgwN0swb2VueHpVTGtTSldnV1d0SmZjVTErTW1B?=
 =?utf-8?B?V1FKb3ZKZllBeTg2ZWs5M1Y3RlN1WTJGeWUyRmp0OTdsNy9VUHZTazl5SGE3?=
 =?utf-8?B?YUpCRzN2Tm1abHk5WnRuMTFBc0tXeHFCa0V4Sm5TcFliTmxReXUxTmF2b2Z2?=
 =?utf-8?B?c2dmWWdXSHA2cVNhWXRZZjM2OWd5eDAwTFBBU2c5NklSQ2RDcUU5UlpBZWpK?=
 =?utf-8?B?ZmVLR3pxa3NtYitYTy9rd3BEWWFOZTk4RGd5ZERoM2tzdXJDYVo0V3pRRE1Z?=
 =?utf-8?B?ZTVKMmlnV3kvalYzSW5pbU9UZ01UMTYwTUV0aGVyMVVKSGtZNXNJR0hyOGc3?=
 =?utf-8?B?TXE0WE1ZY1lRU0JYUHFDcTI2Yzc2b3EvOGhCVitYUDlnUzZlMmRIaDFsSkdS?=
 =?utf-8?B?RzB1RUxDbWkxK0tNTHEwcUkrZHRaenZCWGI0aXF6M01XMFEzWUJiNHhlNEUw?=
 =?utf-8?B?SnRIZjI5NzFMNE1yUlJUckVhODMzUHZtaHhnZHNCTGwyMWt5TWZXOG5sKzZL?=
 =?utf-8?B?c05TME9nekFFWXJocnRmVjBxLzM1ekFzQzhjYlRiU1c5TGZLdDFyVUR1cGNt?=
 =?utf-8?B?aVZ0aFlwRjc3RkhNaTRZNFNHVzJTd3dNNVBUVjJpdmJWWWlEU3VMMEh4WHZD?=
 =?utf-8?B?MUhZWXgvNE5RNWg5ZTY5MFFYSWszd1dDbHhEaXdBdnQyUEdYOURrRTQ0RHU0?=
 =?utf-8?B?bjR2cFpmaTM5eStQMWx6ZzBCbVdnZGlmalB6SCs4RHlRQm12ck44WG50Q05u?=
 =?utf-8?B?OVpQRkVaR1kzSFdpblhKUnJMa3FQRVVRdWRqc2xaMWdnc2NuOXpUSm1vRjVB?=
 =?utf-8?B?SFJ4c3dLbzVJVTdta3BoVDU1YnM1eGY2UXJKUGsreDB6WmdNMlNIUitmMlpJ?=
 =?utf-8?B?dktCTG8vbkNTWEhUQzRNUjZUSWIwVTVIbnBPK3lBOGZqWW50WFcxTTFUQWpz?=
 =?utf-8?B?SHVFRFR6eGE4VUc2T0RHanpWNGhkYmc4OUg3TTgzb1lqckl1TTMyeHA4ZG5V?=
 =?utf-8?B?Y203MFp5MjhycXBHa0NxKzZnQ2RtSWtrc0RHQTIxZG9QczBLSmRxa0RDb1Y3?=
 =?utf-8?B?ZTlnYzZhT2dXVWpzc3NhYVdMa0FLVG0xbUkxZnA5ZHM0RUNFY2F6N2hINTZ2?=
 =?utf-8?B?L0NSelBLcHN5OUJPbjFTa2tDSmVHdFg0VERCU3lrTVJSUHlnZTVFZWpzVDVW?=
 =?utf-8?B?ODRieHVKbUZCdUNjTGVhby9pMWI3TExFZlNMdVlEczlLTFBOaDlDajNHbVNo?=
 =?utf-8?Q?gGXOKnsCJCJkc8QonS4aNbTm6Tuw7k3wbF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB2467.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 16:21:39.6951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ff6ade-2748-465f-a521-08d8b7162438
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1jc3867Wn/3XlIxo7Kp0t+brY1FqAsfTmIoRqfKmLzkwgI1S1M95rLSnIPpNAg3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0194
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 12/15/2020 4:03 PM, Shah, Nehal-bakulchandra wrote:
> Hi Heikkie and all,
>
> On one of our platform , i have added pci ids in dwc3-pci.c file.
>
> Now when controller is switched to host mode and nothing is connected to port all ports are showing run time power status
>
> as "suspended". But controller on PCI bus always shows active. The xhci_plat_probe function already sets pm run time enabled.
>
> Anything is missing?
>
>
> thanks
>
> Nehal

Can you please guide here?

Regards

Nehal Shah



