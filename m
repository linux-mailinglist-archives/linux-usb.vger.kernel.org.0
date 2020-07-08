Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2881D218654
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 13:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbgGHLmE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 07:42:04 -0400
Received: from mail-bn7nam10on2042.outbound.protection.outlook.com ([40.107.92.42]:60384
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728592AbgGHLmD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jul 2020 07:42:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQ3TBDzGf44TGL/rO3vsHYn7SGymNDkh+Cb4nDHGfE5vYldDC8hTuIpY46/60yQ2/dIinAmOFZndzux+9V9WDAbxXT8B/IqdIroPoncdwItKdFFNmiZqEbYeVxFLow4XwlawHV9kII3FjM6vD736gvX7Iwf6KM2YofNHxgFdjmB6iV3NM7Gk+Ls6xRRfBCwS005Q4cXpaM5jpSlMYPNh6GssVhVnHZGkFduFYu7krOIGpJHoj2W7VCWGajp1Sek4YKiMT1UGkHdHkk3V9yLPrMm1x2wg3gU6423QtOmlfzk6gjYa32HVKQrbFYahY/2++ZUllcSDU0vtIsPC592FdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Tpe54S5Hq9YPEeZI1E/x1D1LWvgyArqVfNonIccfGY=;
 b=ob6DjbpbTrx48UzNI3+izTSAzPoyAevBzU4/pafUnnTkzRc6PSRGbCPPbick8Gghb2AEdtSAXQUciC+OLMr0VYCOV3tittWmNJ+FOWU9BdB1ck7Bjl2pZPtZfSv4eb396dgArQCaCOg/sJUmawcAwnNw+R/WqcGUmsq++upC5JAZ2JZJB+KEUpMiiUZv5kSAa4Mx/AjX04vnf7vxVBUAG15Irf4csOXtEoV98G0+Bdn15f5slZBxUNoZfy9vjt38jgj8uN6laRkvuYJH6pcmfdSB18Ch3gMPb8e6GEV9hmpS3onNPmZNbzogmJLKvLNQlizW1JMRtYVqXoFO7ySLTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Tpe54S5Hq9YPEeZI1E/x1D1LWvgyArqVfNonIccfGY=;
 b=Y+M63GopZWTKQPvPCzSMvqAW3+3kf/wQ/0nRk1NgVsatp15khRd0+b/w7GODr0l1sInwQWCI99EbAgAKUBJRDHzPxnZEMb+DRNqvg5oRCfBjT319QaoTMPECXIR7ifv6eJDihOxD494M3BSBcdgcZGZ44NzYMwTFhGToCyUffWY=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from BN6PR1201MB2467.namprd12.prod.outlook.com (2603:10b6:404:a7::8)
 by BN6PR12MB1297.namprd12.prod.outlook.com (2603:10b6:404:14::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Wed, 8 Jul
 2020 11:42:00 +0000
Received: from BN6PR1201MB2467.namprd12.prod.outlook.com
 ([fe80::20e1:a2a0:370b:aee8]) by BN6PR1201MB2467.namprd12.prod.outlook.com
 ([fe80::20e1:a2a0:370b:aee8%11]) with mapi id 15.20.3153.020; Wed, 8 Jul 2020
 11:42:00 +0000
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
From:   "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: Role Switch Driver on DWC3
Message-ID: <f3a4c488-a5bb-8698-dddb-7ab9cfc0f304@amd.com>
Date:   Wed, 8 Jul 2020 17:11:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 BN6PR1201MB2467.namprd12.prod.outlook.com (2603:10b6:404:a7::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.223] (103.241.227.161) by SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.5 via Frontend Transport; Wed, 8 Jul 2020 11:41:58 +0000
X-Originating-IP: [103.241.227.161]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 86dcc89c-faa9-4977-8c34-08d82333ecea
X-MS-TrafficTypeDiagnostic: BN6PR12MB1297:
X-Microsoft-Antispam-PRVS: <BN6PR12MB12976C5D741C294B84EC0D35A0670@BN6PR12MB1297.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OIfecESk5mVns4jFyg6xC/zdD8K/pkLCidlrn/3Zhfd3R+RAEilfFcEzytHhnkA/KD22PtLU/JthZ4xl3NaewUaX09ghMyNYhudlNg87DPttMm6DEwEkAythC+wmX6y4HeMJVcg6wUhec1p/OwiwGt5Ls9PeuPyQqoKWEr3XvISJjStwUB0DGIFeezmSUAL1yCMdyfJv7lYk8OZ4AJgbw5WjS8lIZ85fXIw6Q18LeH0A6f6AZWpLw5J6M+lSYacEOc7JJM2O8Au3xEMl8qTRAt8unkV4EbTIQfTr74Y/4ryYgnelD8KLKxtzQu1lB6ceiqtN7seEFPzH36UB8BTqlP9Lwxg9kUQHUX7JIF9gEgfXAx4R6Fq8UiFk7kxycNEy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1201MB2467.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(8936002)(26005)(478600001)(66946007)(66556008)(956004)(66476007)(16526019)(186003)(2906002)(110136005)(316002)(36756003)(16576012)(6666004)(2616005)(4744005)(31686004)(86362001)(6486002)(5660300002)(8676002)(52116002)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ja1ockltiCJ9HXzwFxKJ6whHJSghxMfVy7EJGjbAqvV4PiLgN7VUKuTtxtDxzMUfUTXTFFLz5VZOcW5ybUYZEl7/aRCYQIU/XKunMtvTtNt6m8a81bi+6Lju4foEvpNAVIX8YVrmU5WGSltHNp+EcbvVHlLmu/9gRxNJmxH/uEpdZ91EA6GwI7r2CLZ+waGPLxORhmaFTlYyDSguDMVmQ+9y4QuX4txOzJyWorHLIA+sHJzZeImmHvnr2iPz7Omk8j/lc83LNkPmLs50MHVTW+LcDDiDrnIxyvYt3vJhT7LniKdl9mF52VUS25FkGtdeJhrDvmoqcdIcPoxd0kmtfzaFTHRTUyvSsl+N526YcIZMVvH0oeVOCM0e/p1VyozvvyN/lGyQbeiUoIG/dmUDttnskJy73lzTVQ+qXZarEqRnRVwGHCI9BVNTbRK5N4gX7q07mF51XqnDrVJVF1ew4KqURHTEU1Z/6LscNWxnJweMvReVUZJgA4Zl/eJ3HlIH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86dcc89c-faa9-4977-8c34-08d82333ecea
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB2467.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 11:42:00.1732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MiNA8qAT0aCPATH9aD4MdyhyBZ/hrFHfc4IakiVRrMghxO+ssDGLu4wfwA00oIC7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1297
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

As per my understanding, role switch interface for DWC3 controller will be called in dwc3_drd_init.

However, dwc3_drd_init is called only if mode is USB_DR_MODE_OTG. However for USB3 V3.3 and above the following code exists.

/*
         * DWC_usb31 and DWC_usb3 v3.30a and higher do not support OTG
         * mode. If the controller supports DRD but the dr_mode is not
         * specified or set to OTG, then set the mode to peripheral.
         */
        if (mode == USB_DR_MODE_OTG &&
            dwc->revision >= DWC3_REVISION_330A)
            mode = USB_DR_MODE_PERIPHERAL;
    }

Hence, in this case role switch interface will never will be called.


Please clear my understanding, and in such case how can i use the role switch driver?


Regards

Nehal Shah


