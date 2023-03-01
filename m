Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C86356A714D
	for <lists+linux-usb@lfdr.de>; Wed,  1 Mar 2023 17:35:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjCAQfS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Mar 2023 11:35:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbjCAQet (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Mar 2023 11:34:49 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3EB79757
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 08:34:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAVz6BrE0qbBz3DNcr/XlWo8I0oduUNyyE7usNf1RDJBazzsuyAGJ9xQWsyLyg62zH8eofdTnPsJlYAApiCpqIYifvG//JVuzHRMBdoAVy9biqD1IDpAQeNDZpvqYLAJYEg4Qd0TK4G0lbcs4ELoumYSPf9wbwJbzBujaTcqIeWJIN4Z3dEyflT5cK0ohcCLqMfd8PiFTyxWn75f4SFBzz83u0Wn2SggTzapJnpeQfmlu3e0zIL0zXCUg9v3biMN2fmUFOSmHqm8WOFqIslxfeZVYBpCBpJ3w3wmzwOlO2Md4YioYRRAnCmd41r/Y7cB29kyq70GDqQ5UBTE5zuKXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACLjDvcx/UTftamg0alPlDqCjE3txnj6j5WaHOsLdJw=;
 b=MUcOvAwfRZn7f6JeigkvPifakVz2kEXNnhrPupwXtb5hdaflurCyI7xW3Iuq/AL6QTCYf4vUQ4/BATFcnD0hM4f0W4MggkgXbCRzv/FnijcNTGYrxQf1dEaC0hVWnq/2jLdK9GRK70DmlqPaszG0f8JzUaKqI60xIz9cEHt9RFfr81Zqi9ojhHNkoZzsweIATitZePb65cqwWle8DpXFY4fWt/c6GXNdb1vSD1dv/X9tGoNDN1whUMAqKV5mptOBiAcsBB+JEYUrEIrHyl6Zaw8Njg8m5Da9CYc8DiE0bR9tm1lPyfZPO7OZh2od9J+cU7EuEzuD4NsjgJ6S0aJ9yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACLjDvcx/UTftamg0alPlDqCjE3txnj6j5WaHOsLdJw=;
 b=M13QbgXR9QNoF2f9WHKl+K2yxS1v3Ap2tzJzQwhV4pH6NpB62Xtat5zag3LG2w/akgJ+QFC8nYc01CGc24YJ197c6B6TxA/GkkOrm3/Xv+nf0G9XHYpDSePDtqxcDQ0VfuyNOR3ZFt5Ojo9Q2P3fbFSz9lAIqFCU9Qkw5+NOENc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ1PR12MB6363.namprd12.prod.outlook.com (2603:10b6:a03:453::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 16:32:37 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a4e:62dd:d463:5614]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a4e:62dd:d463:5614%7]) with mapi id 15.20.6156.018; Wed, 1 Mar 2023
 16:32:37 +0000
Message-ID: <405ecf9f-3da4-546b-a9d4-941f7759f75c@amd.com>
Date:   Wed, 1 Mar 2023 10:32:17 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: xhci_hcd: USB-2 devices are not usable after replug
To:     Thomas Glanzmann <thomas@glanzmann.de>, linux-usb@vger.kernel.org
References: <Y/z9GdHjPyF2rNG3@glanzmann.de>
Content-Language: en-US
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <Y/z9GdHjPyF2rNG3@glanzmann.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0214.namprd03.prod.outlook.com
 (2603:10b6:610:e7::9) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ1PR12MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: 84443fd2-5077-4951-c79d-08db1a72914c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cL0ujThU3Ul1XTtegHgTfaLKtTF1ks1MGj6CJtFEekgi0cTY1izN3+TGcbUrkdueaR3v3tvdrQJ3GS1F0vJ07gF20j8Cw9UeWwHRRtVH5+oR6j7ltuN4fhYUg54T02eTlsZ1HXpw5rs/etVUuxO02wc2QEILQKmsN3zn9QevGTyolvblyLhwRK41YG6x20BzNNL0kZ7UxXbxzxgLcBqUKKkWVIkyG4c6WbO6srw+8dddoybGxlmnR+MBcjVeGd2m5DDL+F6SBkMwCxVP5ne4giSVaCoq70bb7otLUt3zBoLKXrTB83MpLxm84zjUl+RvXdb1zMAF5bisow2pg5INIelO0zqEyN4bxDAAZSTNXyr4KjdWAhYHzyOvMRKr1et47r7xJuQsqK488vWeHDLj3ZO1wJmn/+d8P41Wft5qjBYBLG3+vueRQtfkZvk89VJHiHd/5ZDRyeQs1GfY+6BJn3ZKZLKySh/2Y5PnyPtFqxRf/yPkmIF3w/O74spuaI2WDQlC/3FQenF22K70uN0+/mcSMDbzsLSi67qlA4WgsXRgcFtRZNNd1dCsg+oW+vWflLgmdBECuO8kIyj1yIQCjvBjixz3AMoph5znrlY7EPCgvfBtCyZcApkpTFxzKighSY9pCxzotZBORv3Ro5PScJOuiC3A86Hr13qWx4OETuRHUZ2z6AZbGRH5QTnOkj1yY6ftGw7ZbGWnDXobY7XAo2PzDpWabqsw5OcgvZZ2t7/o3XbZzF358GLy+1XZnGO3pHdcrCQ0rWltQkRXk6lnOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199018)(316002)(8676002)(66556008)(36756003)(66946007)(66476007)(2906002)(41300700001)(83380400001)(2616005)(26005)(53546011)(186003)(6666004)(6506007)(6512007)(31696002)(86362001)(478600001)(6486002)(966005)(38100700002)(5660300002)(31686004)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTR3dnhtWUNscy91djBwVjBPUUVZL1JVTmJFakVkd1J5YzJCcWVjNnlldXBz?=
 =?utf-8?B?T1lZbTl1Z1FjL0VYK25EdGJET1E3Tk5yMHpPMkxIY051RUlyVVA2Yks0SlhC?=
 =?utf-8?B?U2lDQktsNFpja2QxQXQ1N2NvNDBmYVQzRjVmaVNIZjNSNmJUa3M3NXZyN1dN?=
 =?utf-8?B?MUh4dVFBckJ3dU5nN3ZoMTRkcUFiblFYWWdDSVRGVmFjQmlySGVBc1VzT01q?=
 =?utf-8?B?dkhaeUFJemRDWU9vZG8vSUlNb01jb1NTenhTNzk0dkJtTWN0dThGVC9hNzUv?=
 =?utf-8?B?RHl4cHZzSFlreGpoeHZxc3lESnV6U2J6eU43T0JIOC94aFNtTDJzUytuRU00?=
 =?utf-8?B?UDRkVzNWZ0JybkYrRWFoVG81ZjhUL3preU1Sc2RZcFZMN1RGVmZWTVhvajFT?=
 =?utf-8?B?b2puTjZHZVBvLzJISXRVL2dnZUt0SEVLMjlVc3gvdC9vYVFtcGxUek54cHRY?=
 =?utf-8?B?V2Vwc3dpamxpQjRQa1Nvcy9qdkxGOCttK2tTQ1YvNXFSTlVMOXdSeFgxUEY2?=
 =?utf-8?B?S2pGSWpPTU5wT2xBejRJQnNsUGV0NmhzSllMMUVaWU92bm0xTFdkNHp2UWl1?=
 =?utf-8?B?MThiMnYvRXduQnFKRzVUVWxFY2pDVHhPTk1ieG56UUdNb0UzUEhSQkRHSUtr?=
 =?utf-8?B?dlRzUHV5MVQ5WlhBcml0dG8vQ2FQTi9GbW1OMWpDaXZBUGtER1NET1JndW45?=
 =?utf-8?B?UkFPSE1QRm1PMkVqYnRyTzFQRVlwSU02bDg0L29tc3UrS3VnOHZhQjJEMEYy?=
 =?utf-8?B?bktPNldJR1I5M1ZreVF1NDBjQmRkZ29DMEdXSjZlcEVETlNDeW5jN1JNZFdO?=
 =?utf-8?B?cTRZRFRzR3RGMFhOaVRXdVozQnB0TG56SlJaMStyYUVxcVZOY3R5NVNMNS9s?=
 =?utf-8?B?Q0doTk5BelgvclJVc2phSFJUQXpjRjc5ODM3SUk2ZkF1Q1BvNjFXaVMxblJD?=
 =?utf-8?B?WUJ4Nm40Vlgrdm1uRGZNNEJ5MTFVTml4TkU2NVNvTDRyT01WS2tOenF2NFBP?=
 =?utf-8?B?V3VMWnZ1RnBTS0kycERsRjhpaWt5UHRXYTdCaWltWkRnNXBQSlpNWFQwZGlV?=
 =?utf-8?B?MFYvaS80UlVMZXNORE54bWNtVElzdVpydnlQMWdKaDVKaUx6THFwUVRzT3Y0?=
 =?utf-8?B?YmFyV3hCZ0RuVlVvSVM4Nkt1TU9iRGFVL0IyMkhIUDJhT2h0ODQwcUNmelJV?=
 =?utf-8?B?ZlZ0bnhJL3V6a2toRkxYVlNoaHVNUE9mV1lBalZrZkxJUG9NOEp1L2p5bWZE?=
 =?utf-8?B?aERmVkZDZ0FWay9NZExIVDNsUXE3d0lmTU9OWkorbTZqQUorejV2RkxUNEN0?=
 =?utf-8?B?WnVmdkRBc0tEWDFFdWtTZUFtNkxqRk0wNVptWWMzWU5qVVBHSEJWOXJ1SHRC?=
 =?utf-8?B?RkZpRDNSWTlqMGVZYmJLYWlVdTJzNkQ4TTh3c2FpVkZGTk52T2puS0ZZR2Vq?=
 =?utf-8?B?QkVuWGdyaVFWZWhXVmM2UFFtekNRY1RESWZ2OWJmRDBVaTRIWk9IVEZnQ1Va?=
 =?utf-8?B?aE5xTWlYVVk3dnV2eVd1c0hrVHFGMWtPRytySGx2UXlTb1ZneXg5R1ZnQjNB?=
 =?utf-8?B?Y09WdzJHNU1wM0hveTFuUnJBSk1KOVcyd1R5cVQ5T0lDL2hIUDExWmszTktI?=
 =?utf-8?B?SERENE16YnhKM2Nta2IvS2UvQnNNeFZkYXZPRmJEMHpKWEhNUUlrRzZWQ1p0?=
 =?utf-8?B?SW1MN2VWVEd5OEtQTGY0dWtzR2kwajZjWXF1NEk2SGdWek93NWNsRUQwcTN6?=
 =?utf-8?B?YThORXJqWUs0alFxak5hU0pZRlkwVWIwTGtpMFkvbUxEMmxpd0tNSi9OcHRt?=
 =?utf-8?B?dmpLNkkrK2Y4c1hRbEFCNTNxbDJHYUVRMU1sRHBXejh5OHFVRlVUaTcyUGdH?=
 =?utf-8?B?ZWxtbFN3V01Wa0RZRXFqTGNYazNsaEovbmpDMW94ajdDM0xvZEs0NURGdGRo?=
 =?utf-8?B?d3Q4cXFYYklvQUd1RnZ3Y1Q4cnhia0t4dTZzRndqNDN4N043ZlZxc3M4YmpT?=
 =?utf-8?B?c1FIY0IrdEd6ZGg3MGlXL3VkU3hFNHZEQndkMGZySFJxVElXY1B2WHdYK2RK?=
 =?utf-8?B?STlCc2MzNE5JcnJ6azRYeUZrVENVUTdMSHQ0Zng4bGdVajFDcEgwMEZLSk9s?=
 =?utf-8?Q?HakJQlQvN9CLYMC38mC+iBJW5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84443fd2-5077-4951-c79d-08db1a72914c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 16:32:37.1097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bxb7S4WdQtdFYj1SsqazN2l8rJNsU34iFVOmKYL4/8+0wbS1XqTVpTE4uJ4mmTXA+APp/pPhnJX70UkGBjYNJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6363
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/27/2023 12:57, Thomas Glanzmann wrote:
> Hello,
> my USB-2 mouse and keyboard works when connected while I'm booting. If I
> replug them, I get in the dmesg the following lines and they no longer
> work:
> 
> [   48.739931] xhci_hcd 0000:0c:00.0: Error while assigning device slot ID: Command Aborted
> [   48.739938] xhci_hcd 0000:0c:00.0: Max number of devices this xHCI host supports is 64.
> [   48.739941] usb usb1-port1: couldn't allocate usb_device
> [   48.776022] xhci_hcd 0000:0c:00.0: WARN: xHC save state timeout
> [   48.776032] xhci_hcd 0000:0c:00.0: PM: suspend_common(): xhci_pci_suspend+0x0/0x150 [xhci_pci] returns -110
> [   48.776041] xhci_hcd 0000:0c:00.0: can't suspend (hcd_pci_runtime_suspend [usbcore] returned -110)
> 
> If I plug them in USB-3 port they work. Is this a known issue? Is there a
> workaround? Has someone a patch that I can test?
> 
> Find the output of dmesg, lsusb, lspci, dmidecode and lscpu here:
> 
> https://tg.st/u/6c2aa1c7120cc64e2d90863dc3afea4d4c9e3d6f56666fc681c02ee5f0728130.txt
> 
> I'm running v6.2.1 with a Debian bookwork userland and have the latest
> linux-firmware from git installed.
> 
> Cheers,
>          Thomas
> 

Hi,

This looks like a BIOS problem, similar to the one that was raised on an 
unlaunched Mendocino based design a few weeks ago.  You should raise it 
with your motherboard vendor.

But as this is already launched and it escaped, I think we can come up 
with a workaround as well.

Give me a little bit to discuss internally and I'll CC you on the solution.

Thanks!
