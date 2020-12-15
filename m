Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5817A2DAAFC
	for <lists+linux-usb@lfdr.de>; Tue, 15 Dec 2020 11:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbgLOKfV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Dec 2020 05:35:21 -0500
Received: from mail-eopbgr680057.outbound.protection.outlook.com ([40.107.68.57]:43141
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727914AbgLOKfV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Dec 2020 05:35:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiKd7Fb4vSadDWsHSRQYyrX507jFuOGUF5KPy5h1Dc13yRkv/vlUQAvXwdAPBTIPQulJXkXvDNhIR99hr9ECO/6CW0LVK556JAEhQBwL5/G8RY2W5TRNXqTwwhmboF4wCt4XFVyextCEqjNofrgRwxBnfB8Oen33c0a0BdxE2Y5WTRgQpcjkGOGGt8rKAwGbyfJjSqTPszSI/At8kzX7jDNTtvCjpePX0hDKhaJQKm3THp7qDU9swP+TEaqEi2/VHE/EL8RnFkhWwuIMPSqr7u97wRfuHDwHCqtdIYey3MtHSOBYtLAzQ/1OYtlaCIp7gyt6E9iSbt0mEiL23/i7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVZv9qDpYjLpw8YA1zB6mgN86EX12oWgxl4IYUOjeLM=;
 b=UhCrBxt5Ea6c61xfO/uBTHQwdyUHSd7fo0H2v2n4/V/3FdlQNrZEw9RxSImgRgCX0VLjYA2v6ZAdSgcPw1nKSKP6zoEe/5BdZkGwntZ5TzqVkWM7v7MrXIy5h7nSwkj36cUkoDa4o4MJef+ft4xQjSggBcEZw9B6ZqeorD/SFPJiciP+9RRkuR41L9N6cSg5qjDZrTv5M9qpt1AUYl45lYb//hyhwmLyboBfLJMHdcb8ev3OQEK96KKgdy4G+twV6SkFPa4QYhBqYMYBqgciUBdBJ6v5tv80LEbEENwYu91BnbZJtogdGi/CK5Z2smeBdK8SKDlYdvwVi94o9k2izA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVZv9qDpYjLpw8YA1zB6mgN86EX12oWgxl4IYUOjeLM=;
 b=D8ny7LuGjvOnOyO+6hbT9ZP4RYUaJR4NCKkTArqFBkEMmJz1Sf32tjuJ8kstuZ0M2xUtXztrSWcanqQ/NBuMbmfMt7I2YU+Fx/rVUJvkgYSsvdINURDH2JIkRWX4Bas4lCx1AAf7AYUU7kYiR+UuCXeafbnRZfddsM3TmTl/ZV4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BN6PR1201MB2467.namprd12.prod.outlook.com (2603:10b6:404:a7::8)
 by BN6PR1201MB0260.namprd12.prod.outlook.com (2603:10b6:405:50::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Tue, 15 Dec
 2020 10:34:31 +0000
Received: from BN6PR1201MB2467.namprd12.prod.outlook.com
 ([fe80::d942:b0a2:f2ad:a33d]) by BN6PR1201MB2467.namprd12.prod.outlook.com
 ([fe80::d942:b0a2:f2ad:a33d%5]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 10:34:31 +0000
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
From:   "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: DWC3 controller Runtime PM
Message-ID: <049dc0b1-1c3c-de1f-f788-ab1cc0dba3a4@amd.com>
Date:   Tue, 15 Dec 2020 16:03:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [165.204.80.7]
X-ClientProxiedBy: KL1P15301CA0018.APCP153.PROD.OUTLOOK.COM
 (2603:1096:802:2::28) To BN6PR1201MB2467.namprd12.prod.outlook.com
 (2603:10b6:404:a7::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.76.236] (165.204.80.7) by KL1P15301CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096:802:2::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.2 via Frontend Transport; Tue, 15 Dec 2020 10:34:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a1de9113-89c7-47ae-3d2c-08d8a0e501f3
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0260:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0260F831A2DD7436D142C8FEA0C60@BN6PR1201MB0260.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hywaoiR95/GcUPDBw6oNq30GX5IcSfMyh1kxv/HimoPs5OL8he8w8nNx2BPxm7Mo5KkG+F1xGZOO47EGbwgTIaJUvl84fYYD4agxOGOo1uQvXmQ2FFd5M0M9UlkwUcGxxEy9Nzv1Ibibce8o+q0Df4fJUCXn5EdChVtXqSQKTdWchxIubYo79pl1AEXBTGhVHGUh3r3J+H4kCBlqetnCSxAV82eiA6+lvGSaZ5f2lvSgPOKwyix3ozR9F5w1nvLvTlPI77g8eZfvsYXqZuKmTMKDCq53F0OllyJ726d1LWjUi+2HxKl8ZNkh9eZI9HOmyOLOgQI9nafX6QXdI6VsiR9PuWaGio+pLoIZHwNuHCcT5trhpbIKHwF4BhkGxGu2r36ONekF0IgWSTMHaXH8tAgFo36LuOF3ApwCeVtaVcQcYcco5wBWH8DubId4QYO6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1201MB2467.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(6666004)(86362001)(16526019)(66556008)(66946007)(186003)(2906002)(110136005)(36756003)(83380400001)(8676002)(508600001)(16576012)(66476007)(6486002)(52116002)(8936002)(956004)(5660300002)(4326008)(31696002)(4744005)(2616005)(31686004)(26005)(34490700003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y0hLV2VHei9hM0NJUFhkazk2MUU0ZUpiY0FLd2lDOUw1cFdyak1uUDhhck5D?=
 =?utf-8?B?M3MzTWdBbCtQTFhQYmtQdWpyYllmQlZPTWU5V1ZRb0VORHozMklTUmdKcnpt?=
 =?utf-8?B?UUJHQ2pyT0J6L2dwRnQxYU5hNmtweVRLS1Zyb2doSWpTUmJ4MzQxbkFDdXpj?=
 =?utf-8?B?Tk4vYjJqKzNpL3NyYlA1K1F4aUp0UElER2dWT3FZWk9rZ1FENnRmTWtnSnpS?=
 =?utf-8?B?VFJPd3liSEl0STNmT29xQkliSks5amdweEt5NHo5TWVhRWd3RnAyaGpZZnYr?=
 =?utf-8?B?V3lIcENTampLc1N4MitBQzFjZjZIMUNEWGFpamVocHJZRWVKWGJBUjFrdGV1?=
 =?utf-8?B?Q2U1N1ZBK0grM1ZCdTRIVXFBWFlvWUR6L2RneEhSV21POWRLaHJSWHk0R09o?=
 =?utf-8?B?YWRqOStmL0k0TTNUL3JJNUFjWjFGeklMOVQ3SWVzWGxkaVVwMm5oNWx2SU81?=
 =?utf-8?B?QTloY25HdjRsbkhFMVZHajRmKzV0alZlZksvK291Q2FEWHRvOGFTYmJnNVVP?=
 =?utf-8?B?MldhdFB4SWNIdXkzTjFsbFZvSGR4K3A5U25nZGt6ejFiMGl4WFpxbnlBaVhF?=
 =?utf-8?B?dXByQ1RIK3lFQzh6bjkvejFuZUp4U3VnWi9CTkE0aGtQaXIwS3FHeEVvNXpM?=
 =?utf-8?B?ZW1ONzNKUXlFZEFNaFJBUXkwVEtKVXEwc05GUWtQdzRoMVBZNHI4SWE1NGdV?=
 =?utf-8?B?bnNHQVRVT3hWWmR5QVdCZ0VCRTFTZ1M1cnZ5RGZ0NTh4cDdzN1gxeHZ0Qmti?=
 =?utf-8?B?RE5GYkQ5MC9iaWFoSG9OV2ExNDVXS3ZiMlBpUXJJVFRHeWZQOXAxU3RDM2NU?=
 =?utf-8?B?RVJ2SmdlWmM4V3o2YzhnK1gxWjJTU0w0aytaRjlRcWxqMHlETnB5bk1Ud1R5?=
 =?utf-8?B?d2p1ZERoNTY1SFZHc0VUTXcySjF6R2pTbld5d09GWTNtK1FUdHczUnRrNlp0?=
 =?utf-8?B?Rjg3aUUrb3NHQnNsbzZZVk9WR0VSeFI3Z3QyS3JBci94SFNPRE85QmZjeE04?=
 =?utf-8?B?MTZSUEp6UmVJMytBbGtaaVJKMmlpa3NqM2xtQ3ZqNXRWQXl5RHdqR0ZlbHIr?=
 =?utf-8?B?Q2RyQ2RtclhMVE53Z01BVzBsN2xtR1VpSi9RZTI2cklOdytYMkJ0MEY3QUVq?=
 =?utf-8?B?YlpnVHFCYkNVb2JtbjBWNmRUdFR6SXc0cThXY1BSL1JDOWtQMU1GNG5yM3BG?=
 =?utf-8?B?SUJuMkQxeDlFTWFJY3MxRWt5ZjBZZFBVSmJBQWxYT2s1enpkaGQwMXQxbFFk?=
 =?utf-8?B?UEVyUW5qdmJjeUdSQU1wUXBsUm56VkdRZTlGY05uOW1vTDFJUWNkNXJ3UHdZ?=
 =?utf-8?Q?mAo4ugxmjh6AQzf++tmCkBz2Z3iqP5Ldht?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB2467.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 10:34:31.2338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: a1de9113-89c7-47ae-3d2c-08d8a0e501f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLRfZH52q6lRW4nvxHvBccbD/rssnHJVKnuyN6plAIFjmE7Fm6uKQ7AZcBKAAsza
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0260
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikkie and all,

On one of our platform , i have added pci ids in dwc3-pci.c file.

Now when controller is switched to host mode and nothing is connected to port all ports are showing run time power status

as "suspended". But controller on PCI bus always shows active. The xhci_plat_probe function already sets pm run time enabled.

Anything is missing?


thanks

Nehal




