Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 347CD496572
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jan 2022 20:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbiAUTGd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jan 2022 14:06:33 -0500
Received: from mail-eopbgr00077.outbound.protection.outlook.com ([40.107.0.77]:3558
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231367AbiAUTGd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 Jan 2022 14:06:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGLNIaoqBbS6Qrdu15j6/eXpqQZl7gCIwHYe2U44cCnnAuVrkz6N4isKB2tPER9NFr+PqJ5MWj0YCrI0VMgOf0GHf9XC8WBVHrHj4PcQfcSryDBKpPrMPZhX6XbVWHo9yFC8I6VxWqhtkDnRUsPPD4sVK/bKuhF4qOmEbpN+0yvpOCcbP89V3tfuEuzsUrlnuMvHOhnTH9kCKne26dPgj3/xHVT/hJbM/oJC8DNYAc4a/p3Zxq9iaU2xMY+8H9at6C140YTszeC6hcspF4pmibmZIJVwMIfWtPdC7El65nGNzleNFhMyV6YIANuStAjOsTkf8h34BoWdGV4/MBFVjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbOpXpgReQL610G9kNyN7c03+1WVGTHpCN0R8rBGa2U=;
 b=PjUjGYDdeXGDA5/LphV9mYfRomlPB94iNneC/baAi3hQWlYYeEQcHXRNYNB00ySQrbYqnIRXX4S5nAsrSOZ5yJTCJG9tKnQhzhk5g727sMOQ+VhGJ037+rwlCJ4GVhE/jOicefvrbxlupaV7EXgAdr699vKemyKUtayV8L83hj6mms1dd5aBdu9kh1G7zhmopToBGSjBWO+5SBISJ+sJewp+BbKmmsToBrM6j9jZBxLs++r3RXUefPLylI9V2y2uCck0tSEh1r8hmQuKLNGeTHvsp2JuLObUVIieyV1DRZFUX+1t1M25aSrNuo85grvtICqM6sAqKEJjB7oqtq3hYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbOpXpgReQL610G9kNyN7c03+1WVGTHpCN0R8rBGa2U=;
 b=AsSCTsDjBz0i7uRqVwtPk2T0e3Km3Ed0bfOhbMKpHIPC66RausWRDw0cwkFZKh41Kwva+kBJ82obfbtAk07XsRHTgFw5Y3mswcIo4oDc/HTng8dTS75TOoz6kZF9QSpUKaIt4aVPoZb/YVM08lQGILtbsqPBSG287LHsNz4vuApF8hyhWB4AKgGwnndfDOjcG+n30x0aSvh05OSBLxy94SYuS2aeior8mGoZO4dMR1pqXEbHtEi088W9UCNObQ0v1esz6kqGf0mC5d9zUEkz5z9+Ae1FtihfM8623/CKyw3cyMyhB2/RI9ebvb7VX7GnqHrpeyvBgyMeFEBE2zWUkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by AM6PR03MB3637.eurprd03.prod.outlook.com (2603:10a6:209:2f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Fri, 21 Jan
 2022 19:06:29 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::2d1f:654e:f946:1a95]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::2d1f:654e:f946:1a95%5]) with mapi id 15.20.4909.011; Fri, 21 Jan 2022
 19:06:29 +0000
Subject: Re: [PATCH v6 0/2] Xilinx ZynqMP USB fixes
To:     Robert Hancock <robert.hancock@calian.com>,
        linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        michal.simek@xilinx.com, manish.narani@xilinx.com
References: <20220121181841.2331225-1-robert.hancock@calian.com>
From:   Sean Anderson <sean.anderson@seco.com>
Message-ID: <e59121d8-0636-b6b4-53e8-b4a62e67941c@seco.com>
Date:   Fri, 21 Jan 2022 14:06:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20220121181841.2331225-1-robert.hancock@calian.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0254.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::19) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 396b5369-95cc-4549-57ce-08d9dd112190
X-MS-TrafficTypeDiagnostic: AM6PR03MB3637:EE_
X-Microsoft-Antispam-PRVS: <AM6PR03MB3637099CF71188480914419A965B9@AM6PR03MB3637.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QpEtrZot7xA6lcM9aQ+ZDRdhd5AISBqW+ztNEIKCiYxFrQbtDbbKi4oaFRGcHObQ8lLmk2VN3bIUAazteOuqPl+x0wrc3ClOltI0AQT9ww2KxFTrN5QXnY767ge06MN4eK4f/n3mC5D+9kNWMLi87m9fVIGzh7RFjz0KxuhNGxjHF4rVOh6V0l67kIlckUStPpPtP9u4qdtoQn0ZHo3m1BcK7xl8Vr9/T88aRhd0ylQPjHVo4VHELiJPmjtkKEUC67Ly5uxNvP+iJH5rH+CvZ3xixGiTIdDeKVbSJ6SUnTQXKZi84/NyenGGS8yDdApB+QcIH1h/pxfaTf9VeSOhHZgd+k4Ce4YolYxkyuUEQqsOPTUDIdxyIuLPIVv40I+o137Eu0Sd4KFwbGqkrrHJgaDBGYb9svVAulYymj6BizecT0+IonPgyuQ796DhbGKcQtPMKJ2nmX8KHZtCOB4DbyBh9pCpWD8RCUAGCM/Yk6cX23XX69l7GFkBjI6541ONXiFxnVvKbN36jrIq5Qw2OlN/bAJqhHd6B+yObD3UM/ztiFABSmz1Hh4RjC1SRtGeEwV74iCvXq+k3WKZ7kYwdfNFNsPESsdJ52DhwQVOUjhr7OYqttzEVcv0t1T6R+7yua+ngJxqc385m5LzzFS7u1xei1FciniagKfJWt3SEwtl2wJrYsFZxTXnHw05ZG5FCrDEx80ZcHdfTpzEGH6eQ0UCVGAqHqVrijoOVte5QIG+UwVrdjzUOXQPhmho7COTKTr9fZYSo0ISCBHl0LpLiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(2906002)(4326008)(66476007)(66556008)(8676002)(8936002)(2616005)(6666004)(44832011)(83380400001)(508600001)(31696002)(66946007)(52116002)(86362001)(53546011)(31686004)(6512007)(5660300002)(6506007)(6486002)(316002)(38350700002)(38100700002)(36756003)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVhWVGtrSEZJSkkxYW9ZYnFKQm0vdnMyMk5SRzRaVXBCd0VxM1psN0tIQVNl?=
 =?utf-8?B?NUtod1lod0xiZnVxVFV2VCtUWFB1VzQ2bXBrWkpyRU5zYXlMeGhMbysvNjFh?=
 =?utf-8?B?S0ZPaXJqcXkrbStwc2diNGtOTUd3ekkvQUJtZ0FnY2JNZ09iU3pwUTdtUFUy?=
 =?utf-8?B?c09ldWdxY2dBM3dlZ1Vvb011d1NoSDlHSDF5dnhILzE1RCsrVW04eGtGaStC?=
 =?utf-8?B?YWJnMGZYenVPTys1VGJjVHJYNEtXeDhxVDJqREh2YVZvVFB2OU5hUGFCbVZz?=
 =?utf-8?B?L3k4aEsrQmFFa0hMQ1VIN1dqbU5RTWZyYWExRGpKcUUzMEo3cFp3a1ZjQ1BC?=
 =?utf-8?B?NVlWcmpJUVFpUVdkeUN3N0tLN1FaL3Jub1VaNkdLZ2ppZ1hUNVM3OFdpN3hL?=
 =?utf-8?B?bmhTSXl3S1pRbTUwNm5aQUk4MDNOSDM2WHFXbGxVZmROalF3U3FWbkRsdm16?=
 =?utf-8?B?SGY4TDlGTlphOTQyRll1ZDF3ai9zMG5ZZzFOMndQS2xiTjhvdkpGWFF3cUZl?=
 =?utf-8?B?bDFONVF6MmtWYkVnbzZHS1YxZFpwMUt0bUF3UDhjWjZoU2FRU1Qxc29EaFBv?=
 =?utf-8?B?aTU0NTlSeURzbGdYNEFaeHkrMWMveFg4R3ExWVZZd2NuQmVUWDRyUmxoODJP?=
 =?utf-8?B?SHJnQVZVMTlNSHdaalBCa2hiQmVVN05tV1BtSng0UWJkVTZzWUJ4YU1yNlBp?=
 =?utf-8?B?K2dPaGZJY2NqN0QybGYzdmc3M25oM1RucTFIQzV0VWQ0ZzFoRDlLRTQ1aGdu?=
 =?utf-8?B?blp6MU5rRExwbkJJdVB3UHEzbDF4WmQ3a3ZSZE5XL2t4eUJ2eHVjMUJ2a1V4?=
 =?utf-8?B?Z2ZYOWNzNnM0NFJEWCtJd3llSnZXZnVRdmRWRGhGMnZnUmVOMDcyOWVRZUsr?=
 =?utf-8?B?ZHVjZnh2TmY3ZG5vcHowbFVyYVpuRlZLVlUyY3l1aHpkbjJyT2ZKWlpERzls?=
 =?utf-8?B?bE45VmtQOUdRSWdEaUhOejl1a1dZWnp5Zkx2QUhLSXFjVWp0dWFtdVY2dmRG?=
 =?utf-8?B?b1dIbzZtNjcydUp2akdXdGtJY1R4eFZpUG1NRWxIRWZYblBlbDZTL1hNdEFN?=
 =?utf-8?B?SEE0TWJhR25zaHNrWDRvOS9FMXllSHpwY291bUNxNVlSZ0J0VnRkSER5eDRt?=
 =?utf-8?B?TXUvZjBUS2czaHZHbG4xT1ZMV1hicG1CblVDUmpJZlV3Z1lmbVB0M3lrbjkx?=
 =?utf-8?B?SDE5S1I4SnEwY2pxN1JNN3pEcWZId3RaSXdpSnJCSVU1a2VHRllpRlEva0Ix?=
 =?utf-8?B?Zkw5MzBqbWVDbHZlUGI4R2d4OTRWQlJqZGRjcUtKMEcraTNidUpVc21FZUkr?=
 =?utf-8?B?bmVDd2luRG1YQjFsYkhLSGQwUko1ZzkySEtiU2doRUdkRG5paldvVVFlRzlM?=
 =?utf-8?B?aXpydW84c1VUS2VMSlJpMUtINXZ2eWxjN2lGUTNyeGNzNXZUQk9jWmJSb2lI?=
 =?utf-8?B?NTRUalNNMG93bWh1QTdZWXBaNGVneU1tZm9ERmxSWE55SzNQd2V5Y1RpZ3VW?=
 =?utf-8?B?RkYxYVE4citqemZQSm1rbmhtQW4yQjdJQjNGQVI3aDRLNTBVK0VSSHVibmpM?=
 =?utf-8?B?bUFqSlllNS84REhuZ1RMSE03elpCMXBnMW9La3krOXFFcFJONjJ3cjRJa3hx?=
 =?utf-8?B?a0JDR2tiNWZUdEsrZ2dBZUQ3bS84SGJ0T1Y1MzhwYTA0MFVZdisxSk45eGNE?=
 =?utf-8?B?UGRrZzYvYWpUMVVDRGtHTXZCTkVpY2pBRUhFQ0ZQbmxxQlZoS0cyeUNiWCtB?=
 =?utf-8?B?QWlXdUxsUnZYY1QzQ01DbDdpZ1YwWURadjdOSlN4dFRFTkRZVzlwNVNuMzgw?=
 =?utf-8?B?YWI0RnFxL3h2STFibFRBRHk1MExaNU5zZlVCYW51L29XdHBib2NDdFJRT3ZC?=
 =?utf-8?B?RzVsUmRCMHdvNCtVS3E4KzhqalRVQzR6UnM3RVV6SFUxVTNNVzNlYUZMS3JU?=
 =?utf-8?B?UDNRUUExcGNKN0ZWZjIwNmFJWTdFTzVGNnU5Y2xLZk9xMTcrUk5EOVVTMTY2?=
 =?utf-8?B?MTBSSGh5TXVXR2hHbk0xM3JLYUlGQlFZbGkxUGwrQjVMbDZrMytYRkJFTDhy?=
 =?utf-8?B?d1RHZ2dITUV1ZitpMm5KMkNnanJYb3NNUmt4STRJKzFkMTJISjdQc1pFY21t?=
 =?utf-8?B?ekJkL25MdFRsaE9QZ29LZElmUnlCM2dWUWdmM0R1ek5wOXNoWll4Rnl1KzJ0?=
 =?utf-8?Q?gJOMY9hR4b+N4Fk0/9N3Gts=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 396b5369-95cc-4549-57ce-08d9dd112190
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 19:06:29.8332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aa4BKOfzMLJvsoqozyKFG941m5XYliprh/AdzLgEd3TSzcZMnZW/YAD5fg47f7zaToDbJtDQygWvpNhe2mh4nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3637
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Robert,

On 1/21/22 1:18 PM, Robert Hancock wrote:
> Some fixes related to the Xilinx ZynqMP DWC3 wrapper driver to allow
> ZynqMP USB to work properly when the hardware is configured in USB
> 2.0-only mode.
> 
> Changes since v5:
> -code formatting fixes, no functional change
> 
> Changes since v4:
> -dropped DWC3 core patches as they are superseded by Sean Anderson's
> patchset "usb: dwc3: Calculate REFCLKPER et. al. from reference clock",
> ZynqMP-specific patches unchanged
> 
> Changes since v3:
> -fixed DT schema dt-doc-validate error
> 
> Changes since v2:
> -additional kerneldoc fixes
> 
> Changes since v1:
> -added DT binding documentation for new attribute
> -kerneldoc formatting and reworded comments
> 
> 
> Robert Hancock (2):
>    usb: dwc3: xilinx: Fix PIPE clock selection for USB2.0 mode
>    usb: dwc3: xilinx: Fix error handling when getting USB3 PHY
> 
>   drivers/usb/dwc3/dwc3-xilinx.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 

Looks like this got my usb working, thanks!

For ZynqMP,

Tested-by: Sean Anderson <sean.anderson@seco.com>
