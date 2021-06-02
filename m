Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 854A7398E0C
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 17:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231678AbhFBPPG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 11:15:06 -0400
Received: from mail-co1nam11on2044.outbound.protection.outlook.com ([40.107.220.44]:43361
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231669AbhFBPPF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Jun 2021 11:15:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jfx6c4kbKkmr6cxEaz+yC4Ll8RzolW8RejNpLYSLoO3i9thv/b08FATdPKNtnsF5aBzMlETsfxlQIgcKMmWWMsOnNIeW4zzcnHJZfmC8G4muU/B69Zgx5waXBoMGFP/xVqm8xCdmB0izhVCbgsdwfXMT1EabzKosnarXiXk4WWZxyvZedsEnDMMMW6poznNcWkAu2WvJcp/PF2kkC7Vpn1Ar3k9VVBteKX/2aLsBuAI4KTDCqmNkaN/JCK3p4nP86GJfuqcgAKIvkT/dtyUJf6DW6OABOvFLR4NjCOKeylQoA/A8nwpXT4cdgazZZWecLNZwqf9x6rSogYFKpSXlzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8R0pCxdbltBwXa5DSfUgL3xnKVeK/0lwHBjxOJxsAE=;
 b=Dk7NgJDVvRtV86on7fVZbPQy8wMKdiOWtTuzw+RcyMyeMgYu9uXE4K3KkYquQfH3PraKP0JbMR9OBulp9XiTRmCiv5EUGNwCXL3KOFu3VyT7Xuyo6QmoL4cakU9ms1rQaIA7I3WUyLBrcmWG5zjbqTLLJrIduuNSuAXD6S/xanXikAOy0n2sVC6hgmUZ4OfuRFfMvhgA78v2wyKRhetsyJPLUAiXZo2AYh0NvlH9QEtdDF/rlN2dewI2As7G9fTxOXhW8uycqrWuebTnK2GSQqY9agRvBMoXCXgVdHx/u/3iQFZR+AS2F82P69U6pGgW5sVc6TvP0KILdLdy6W6ZpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8R0pCxdbltBwXa5DSfUgL3xnKVeK/0lwHBjxOJxsAE=;
 b=QP2uQMJGsMnUA6ZTpO7swIWbKm6SudYq+RHpA7XE8MPEbUPNcm3mqJGbZx9Kasqi+bbcrHigUmRkezWfyh5yyy1Fv9jEfHkegYIAalZZk66EpRStGdwc2mWf/0BeqJaNdRQ8xdAqkrHmDS8b19+d+8ecOlu1ZHiCiVrFUDC8J9c=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB2693.namprd12.prod.outlook.com (2603:10b6:a03:6a::33)
 by BYAPR12MB3622.namprd12.prod.outlook.com (2603:10b6:a03:d9::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 2 Jun
 2021 15:13:21 +0000
Received: from BYAPR12MB2693.namprd12.prod.outlook.com
 ([fe80::c0c3:7247:a767:f5b6]) by BYAPR12MB2693.namprd12.prod.outlook.com
 ([fe80::c0c3:7247:a767:f5b6%3]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 15:13:21 +0000
Subject: Re: [PATCH v5] usb: pci-quirks: disable D3cold on xhci suspend for
 s2idle on AMD Renoir
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
        Prike Liang <Prike.Liang@amd.com>
References: <20210527154534.8900-1-mario.limonciello@amd.com>
 <YLedxEnOOWPfMYec@kroah.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
Message-ID: <218c7f43-a2df-60cd-ce00-f4b3e8cf336d@amd.com>
Date:   Wed, 2 Jun 2021 10:13:21 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <YLedxEnOOWPfMYec@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SN6PR04CA0086.namprd04.prod.outlook.com
 (2603:10b6:805:f2::27) To BYAPR12MB2693.namprd12.prod.outlook.com
 (2603:10b6:a03:6a::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.188.188] (165.204.77.1) by SN6PR04CA0086.namprd04.prod.outlook.com (2603:10b6:805:f2::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Wed, 2 Jun 2021 15:13:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43a3a983-14dd-4783-2f4c-08d925d8f56a
X-MS-TrafficTypeDiagnostic: BYAPR12MB3622:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB3622F6C68AB780D3904147C2E23D9@BYAPR12MB3622.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jagQVeSeZQLBB+xGBDCXRk77O4p1XmtVI54qJR2wVn5Sc+gjyWfBtI2wYSLmyG/Q/6+d6joHDNd4pm+tRBlbR7eCgI+Jq53B05zp5XBWIavspjwDgr6aZD5ULrFb+QoeKYG6khPdSTLraCA86usHjJgZtqTcWRe0AkLR5rp7kcyhxRxhC0LBqxCybvAkCJiaU9HE71Rc8Y/N5MGpWPgBP/hj0wx0s3qIF1ABoECmNJ7yujEQ2NnmeIxRj+U7LdGT5qLVqL+bwPHOic2kCQ/k5UatOBYwuUtoYvFREbJO5chJGsIdcPSaWO8v3kmj4WzFJwMlJHBYiH/oLWsVbUUi4mFNaqn1elsR2nAz3GIqJNzkZnCxJEjlvuQMXLJhpVTk9msBCRnEhp2nG31vZWLQKja310wxEY0BScGsUWS5mzwqToXMPIqmSMHsJ99S6I6JNsZpwOEbznh3VWkrDK/VFP6xfoiSrscm87rQx9r3RDuo9rziNyddAtqwsWKz4CsKWrnbraeLaLniYDXK4wWiq72kg0qqHsZ+nBZ2U+Yhi9XuN/kBhEAgGEcbgTEgvyzLNBupywQOE5TwxTJQm0f0IYnjojN8QH+kcz4KMwpp1d7nwopKxWbWp2tNQYWu9BGdUSh68ASCSkTCLmOl51oq8k4qoXXXrXIcKepCMz0jEp3zKAfbZ6Xk6o7T7uLSW2J/noXfaDhNSKe7zfr/Vue3ENBYz8P3myuvpBQYCvdAqkwNyNDD5QCMKEBi0WVaQQkwCeM6u8u8Raw7nnaynYO7vf0VeSFiXqG+5hc+ljLqchlY8ipjSimBn3JkIomDHuW49mYqEMqXG+vYIRi4HELZ4NhrIiN54UUaxK5wGc1VAMY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2693.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39840400004)(136003)(376002)(396003)(366004)(38350700002)(83380400001)(956004)(5660300002)(31696002)(186003)(16526019)(8936002)(8676002)(966005)(66946007)(45080400002)(478600001)(66476007)(66556008)(2616005)(2906002)(26005)(316002)(54906003)(16576012)(53546011)(52116002)(31686004)(6486002)(36756003)(6916009)(4326008)(86362001)(38100700002)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bEVLSndsUWZURG5LQXROVnF3S0dETEZMVUdMSklrcXUyRlVSYkQ3eGkxU3FK?=
 =?utf-8?B?TUcrUi9SOEt4eEdnbEZPejY4VGc2aFY4SDNIV3IwQm1teU43UmpzSlVWNUNy?=
 =?utf-8?B?bnZ5QjMra2kyc2JtN3VHTUlJOG5td3ZkVDNMckJlZytnWXpUNmlJa1ZJZHY1?=
 =?utf-8?B?eHRxSkJGTFNhQ2RlWFFCc0M1V3NJSmdQS2lMb1c5VE4rdUVqUnExYXBGVjJL?=
 =?utf-8?B?TXEvK3NjKzZURVA3MzdycEZGemNSOWJrSTc0L3YrNnlIUW1OOVdOZlVRK0ZC?=
 =?utf-8?B?N25LVCtEckUyMVc4Q3lZUHlDdTFFQVh5NUs5eE1pblhneWtSTnZjcktFSHg2?=
 =?utf-8?B?Qk9XSlZ5Z2czdWVuVzB6QjlQc2drUVF3VWxVS1hTY3k2NnVvUldNSG4xaXFC?=
 =?utf-8?B?eTlCV05odlpIeDIxeWRBWlBWb2JGSElaWjBOaHlEalZNbG9KTFF6K291azhG?=
 =?utf-8?B?Vk8vbXhDWER6aXFZQXI0em5rb09TRnFZclV1aFNvREZmblB3U0ZtbytqSUR6?=
 =?utf-8?B?Y2wxSC9MOUlIZkxVMVY1ak9iSHg4RDNXc0NUeXZVZHkzSytrYTZ6YU5aRmov?=
 =?utf-8?B?UGd2c3RaUzFIZkIzcFpGZkhwUnZXd3o0K2NhZk1YVmFsN3pMVnBLUmZYVTFH?=
 =?utf-8?B?alprWkRjdUVMdmR4QjU5WTViM08xK3hDMEZWWXdEbnR0eVNCbWdkZkE5N0xH?=
 =?utf-8?B?ZmYwb3NFYXdaWFJ0Y3N5dlorZmQ5UlVhMDRsTlZGZ0V2SktBei83RlFKRlor?=
 =?utf-8?B?bUR6K0V0cXdOZ0ZCaWFESk9GVzljV0xqbWs4UGhQTnR3Z0NFOVhkaGVPcUxi?=
 =?utf-8?B?bXZSY2VoRURwUFdGcnZPL29uZW1vS1F2UHpsTjhsUTF3MDBzSzRJTjJZTUVq?=
 =?utf-8?B?V2RUWDBPMEJvQWp6Ym1yWWdEcjZkVFR5YnJzMG4xeU50NGUvblNMUkNobHUr?=
 =?utf-8?B?cFJLcDRVUHhwMkxGU2xINEM1TUFhMjRYM29lTlZ4MzBiUGhFc1d1T1lscVpq?=
 =?utf-8?B?aksxbVBQQWllakdadnRXQWsyMWtvSWZvdVE4aUQ4VmRZd2oxT1NjWVIxOHlY?=
 =?utf-8?B?ZzBCTGlWNWRhQXdpeHpRZlh2dXFOL3d5cnNwVU12UkFQL2QxcjdQdVZoRVhT?=
 =?utf-8?B?ZGFTbCtpN0szS2dLMHN2NWkyWXFka0ZwV05CWmpOTVBKL3hXNVpZcm1WalJY?=
 =?utf-8?B?MjlSWlk2SzVuOS9ubUVQSGZCTFowTmJZcmRUaVNtZ1h4Q1RhcFdGc2lHN0hj?=
 =?utf-8?B?WWc4SjhDNFRuZThQeXZ6dENIV0owUnBvNGpGY3BnbitlM09uWkpOMXY5VGVo?=
 =?utf-8?B?RjArVWVvYWhBRTdmSllVOTYveHBxejFHRjNlZ3oyZHo0ZkcyN1lXVUo5cjMv?=
 =?utf-8?B?a1VkYTRWVnFOY2xCeUtCejFnWFlMeG1HVGFjdXZ1Tyt4NWhpSzhrT2o3R2Rq?=
 =?utf-8?B?ZWw0UE9sQjBRdW9ZSWR3UkFsaXNrRlpUcUJFRnNPTzNOai9TWk55aFhGOUhY?=
 =?utf-8?B?NzlrMVRuNW0zN0Vldlp6QXRLakNKcDlicTlKRTNRYmFzYUR3VjJDSGRDbDA3?=
 =?utf-8?B?dTFGRFBOL3h1SWxnRk0xWjlSY2QrZWliaEZJdWtyOGQ2QXNOcllrSXpZZmtn?=
 =?utf-8?B?UVprZ3FaMWZQN1dyN3NuN3h1QytJQmFIMGpYTXgwY0ZqcUNuYUx6dXdpcDZG?=
 =?utf-8?B?emhxWmYxemZwbytwelpWdndKL1F2TmtxNjhROC9IREgvMExOTkRRYjdGTHhS?=
 =?utf-8?Q?6uKVqr2/YdICNzUFAkgLQHp32N/spWsQuXJwsc0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a3a983-14dd-4783-2f4c-08d925d8f56a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2693.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 15:13:21.1885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WGFDXbJv7zDfSVjn6RmcouQnf8H3W26Eq3d5N2chNcjDAHIDvE3ixOWCt7AwbA2mtt76uS3JodFyJUXfBaGPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3622
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 6/2/2021 10:03, Greg Kroah-Hartman wrote:
> On Thu, May 27, 2021 at 10:45:34AM -0500, Mario Limonciello wrote:
>> The XHCI controller is required to enter D3hot rather than D3cold for AMD
>> s2idle on this hardware generation.
>>
>> Otherwise, the 'Controller Not Ready' (CNR) bit is not being cleared by
>> host in resume and eventually this results in xhci resume failures during
>> the s2idle wakeup.
>>
>> Suggested-by: Prike Liang <Prike.Liang@amd.com>
>> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flinux-usb%2F1612527609-7053-1-git-send-email-Prike.Liang%40amd.com%2F&amp;data=04%7C01%7Cmario.limonciello%40amd.com%7C07d80c804533439da6ad08d925d798a8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637582430177777264%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=uV%2FMr7rXtBVzNmEBg%2FrIoXVKfLAjdQOO4rkR8DrdhBw%3D&amp;reserved=0
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/usb/host/xhci-pci.c | 7 ++++++-
>>   drivers/usb/host/xhci.h     | 1 +
>>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> Should it go to stable kernels, and if so, how far back?
> 
> thanks,
> 
> greg k-h
> 

Sure, as far back as 5.11 makes sense to me.
