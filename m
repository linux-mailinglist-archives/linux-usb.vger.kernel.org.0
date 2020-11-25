Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92F312C42C8
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 16:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729839AbgKYPVj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Nov 2020 10:21:39 -0500
Received: from mail-mw2nam10on2081.outbound.protection.outlook.com ([40.107.94.81]:45409
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727980AbgKYPVi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Nov 2020 10:21:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DEFUlMOZVfJQZkAeJRnzVPzduhn2JZTLgcD0Yd4rI1S3RvoWo+RPHLLuWq2DtRNr1fJZ0DRk18rWDpPJ//EZmJxrrApJbOYQybU5kKAXy2ymlLoE6bszgCEXunXpRVMmIv8mMG0qgJOrXUW7U46EH2+xQ4KapzPh6WBp4nrDy/WRTVJZIGNcJqHPbkS6tpihVAdNuIIB8aMdmvPzYaGBFll7/ZwDDvTkytkMwUmojw+9+CgHO/gCNX2I4n4k4YIYyDpeh2z0Hei4nm1sFWVS3ylpDzC/a2mizT8c/B1BLIiieHCavkVPWiBgFTQDXYrmLEdR4vVNYaxuWBA5V765UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MInyi4bLxiZRoHKmPxC/vGBoWWDDpRReh2kT6Wa5dWU=;
 b=JDfDij380lb5Gw7XTd9zWnxI10kncyE19TflWii0dL3QUYVtGFxr8s9CHVu7ZImAqeZ03PhCJqR5uvytlI8EWgJ8kQ4PrpOY7AMJxeUP34neLoosw5inX5WIyqwNkqmCcV0avKD/wz6CoHf9LblonN0YjUQhnpGJXvbRmxz0EbRygqk/8pJDUR+lrBSYFLP1Ncy30/FYrHBhsQaq7zG5tckcJkzQ02LUqLe0DoqVHi8wvb3d+GKVKBht1p/T4gXqL21aRS/SMNzvPpd52T49yMfDeM6FF7F/dZ8XHX6Pvpv5vDoKC3cc2kOjKsPMRAmlQyswAC8W88U9FQmElQcAOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MInyi4bLxiZRoHKmPxC/vGBoWWDDpRReh2kT6Wa5dWU=;
 b=LAkj6lqc3F7xSZ0/4rC2bShH3EEAHeufjeR5rIa/duRbitlMd368WzN4ww32K6I+1foALvPL3dnAkuqIGmlPY9pnOWPjyQer34/XNumIFAO4Y/oyWZhLguHI7bCJ3lp4NpbNkBBNSvv5VUPU73cIKzQGBYZCsXR4cK+WRNKkv/4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BN6PR1201MB2467.namprd12.prod.outlook.com (2603:10b6:404:a7::8)
 by BN6PR1201MB0051.namprd12.prod.outlook.com (2603:10b6:405:54::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Wed, 25 Nov
 2020 15:21:33 +0000
Received: from BN6PR1201MB2467.namprd12.prod.outlook.com
 ([fe80::9921:3410:274b:3d17]) by BN6PR1201MB2467.namprd12.prod.outlook.com
 ([fe80::9921:3410:274b:3d17%8]) with mapi id 15.20.3589.030; Wed, 25 Nov 2020
 15:21:33 +0000
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        harry.wentland@amd.com, linux-usb@vger.kernel.org
Cc:     Sandeep Singh <Sandeep.Singh@amd.com>
From:   "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: Display Alt mode with TPS6598x driver
Message-ID: <bf85cdbb-23a1-107d-4e7b-679506810248@amd.com>
Date:   Wed, 25 Nov 2020 20:51:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [165.204.158.249]
X-ClientProxiedBy: BM1PR01CA0164.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::34) To BN6PR1201MB2467.namprd12.prod.outlook.com
 (2603:10b6:404:a7::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.255.84] (165.204.158.249) by BM1PR01CA0164.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:68::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 15:21:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 400089e5-75e5-4eae-e651-08d89155ca71
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0051:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0051CE4D1926FAD22119FCCDA0FA0@BN6PR1201MB0051.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N1VGRkKS7IBTi6gRnXbzsIAvQ4WIKQE1WvOMFbIiiACQUqqDfRbhc1ukzJ/M+Ld38eDIFitcvilrgDNPHKCpI39XgC8o9cWoZ9DjZ38LuxSvWs8lTWeU8PwZKm+4S00oDJYxhq4EDn+DHNbP3VEnFOCCLV2HAEP6i0u/7VndlRYCAxT15fQhtREMx4hBMv3crsiVjvefCBZdRsDK2UEfGtfXDCXZcy0n9fmDsGgmBYgO0EWvUU+hGeMcBLj57CW/reU0NQS0M8IKIddRNu/8BBR/v8CYIcvQd0nRv9qHICdiGYKhi5jzQ7ulnAr6LkvUKWm9OEAy4uE/+T3ax71WP2Q5l3owxs5QYCOShiLkZidxqXKb+Y/3YxVT8+oN8Ghr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1201MB2467.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(5660300002)(558084003)(956004)(316002)(66556008)(8936002)(16576012)(66476007)(478600001)(31686004)(6666004)(31696002)(86362001)(2616005)(66946007)(4326008)(16526019)(26005)(36756003)(2906002)(8676002)(6486002)(52116002)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a3U4a01kWnU5QVEvbU5CVWNtT1lPRGhHcWhJK2kvaVE5dW81cHIyNGorWUpx?=
 =?utf-8?B?ZmZqbTZ2MHpoOHViVy9SNFl0R2dOeE1MRThiNEVEOXZPcEhsQlVjbndvVHB1?=
 =?utf-8?B?Q1RTTGJZK0Y4dmxCcTgvU09BeGFQa3NuMjFpTG1xWFZOWllRajEwTzlYY2c4?=
 =?utf-8?B?aTJHNCt6a01hOXhUK21wZVE1WElaOC9GWnk2Qm1ZaU04c0NhSnlzRE50V0NT?=
 =?utf-8?B?TFNiL3oxeEQ3RUt6NjBBWWFTbkdCZ0dCeFNaN05wUVQzS1dYa0pCZkNDQUU5?=
 =?utf-8?B?VDRvNXljbDdXeXlUS25mRVJjVUQ1S2pHdmUzbFlCTDg1TWxpS09pU2o2a1Aw?=
 =?utf-8?B?U2JnamUxUXpVZUQxeHJQckhJbWN0K2hDRE9kWWgrcGdQOVBmOUZUSWpjZUJa?=
 =?utf-8?B?ZnlNRVdrMldNaUlNc2VubzlqYmVUWHQvL0d3S0hqZXprZjR4OFlEb3laN0gr?=
 =?utf-8?B?b1VUekkzTFNrdmE3SGhBZWtJVzdMWTFUaWp5UDlFTnZQbHRSems4N3Rwc3RT?=
 =?utf-8?B?MFF1eGF0T2t1cWNqNGZrdm0xRjhaeVYzZlR4SlI1eEdkc1VBQm9kbEVEa0Nw?=
 =?utf-8?B?QXk4SWJsZVkrdFZxZkNkVnB3YjFwenJEUkUvS1krVkIyZ1kwS3pmQkhGV0Rl?=
 =?utf-8?B?Z0FKbCtZdGRScG1UakZRTUZjakJ5NklyS1Yxakp3SEozbGdkcmQ2My9HSDQz?=
 =?utf-8?B?Nm1XS1B5aE5BaSttK2hUQk1ia3p5dGc5VjQzVkk2M2ptNTJwVllleUxQR3Ar?=
 =?utf-8?B?RTdBN3kwTXZHV1kwN0pwb2w2cml5VVlqNTh2TGJvdTdGMEN4VmRZb0NyZ28r?=
 =?utf-8?B?WGpBZVBLRTFDMWFGYUJjMXFRdDdUZFdsRHNwdUdMRXRjckpFR1ZTQ25NQ3Yz?=
 =?utf-8?B?VkF3NFZHY25GRDlXaStKZC9tcExJb0lSRTViQzVZY3dsVGhYZEQ0Mm04OXdz?=
 =?utf-8?B?YkNHVGRMRit0VXN4ODN3b2k2Y3pLZHcxdHYvVW92WW5XRDdSVmxmejFESUcz?=
 =?utf-8?B?S0xRT3ZEUjJYeTYwcU9pL0ZjdjJjNHRVbmJiWGp3QlBGU2YrT3FJRnNZOVln?=
 =?utf-8?B?dk5uVWZ4Unk3U0ZuNUczUkQvU3orQWtQL2M4QkhxbDNicTRRc1l3b25JZkJG?=
 =?utf-8?B?NXlzd3dTZFB6VzVaRk03cGRnSjdpVTZiYUFwYXAvK3ZaNG5ZNTBoaHZvOU5U?=
 =?utf-8?B?Zm50YUhyS045UW9vMld4cXQra3BhakdDM0ZvalZyN3VVZVZna05ZWXZwTFR3?=
 =?utf-8?B?VE9wdE9ZZTBKbVdZc1QraVdXNVRCeUJUVk9BQ1laczlqYVBndGN3NnBkNWY1?=
 =?utf-8?Q?OKJ7FRZFwSZjYv0EGO2OD9m93ZcgonbxVL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 400089e5-75e5-4eae-e651-08d89155ca71
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB2467.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 15:21:32.9054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JAEevfcIXdP1+21rnmwDcsc9TUDo9vUAt1BXtLDXHt5vRv0UVLhKkePXcdgg5jXv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0051
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

I am working on the project with PD controller as TPS6598x. The current implementation of TPS6598x does not invoke display alt mode driver .

Can you help me to understand how to achieve this?


Thanks and regards

Nehal Shah



