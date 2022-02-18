Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24DC14BBA6A
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 15:08:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233546AbiBROIz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 09:08:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbiBROIy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 09:08:54 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61B351E67
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 06:08:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BM9M/clLtp5cQ7GTD5R3NurWH4RkH+HdqeHHdNxefGc0O4IFvo9lXL7brubaeRsB4FWcJAe+lIlEAInaJ0uaQLxjEGJxVdn4YcOXiE8dgQfNpZ/pKHuguU1SyM2kBvLlf3kFNIEMnz8M9ihextWBHemZoY1IfO6JfahtAzEJCbaYfpFPV8e9lEWLvnPXEzL3KrwAr9i7cYzsYeTRmdZ3MTvkAAmXbII0+6vb7XZv3/CHSf2pXFMBrnESVSEcN7HJsWoozz79aZiqY196wyvC1bhbBPODXvgS8MBLwLWPICTcO56ypz9nfyXK4sn/SPyiFxh3HRjhFvhYH5l8rtq1gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkOaU5r5EFhbVbxziLVpkZ2b4ba1TOjn78R8ToTmkIo=;
 b=lps1iOXXvyYMmQM+BcZbXG2aTsL7wqP2niVabmj/qPOnfcMzs8aZXlLHzl5aM/X6e0XUKy2X+NXl7Cvyrh0f+FMJyLnO9YaPZNRWYR3YoaMr2IIXdKTilPtPQYPZDWEFqmO6Y24+RGdzo1yEChiXkMe8L9F8aFgeoS6Ywg7ODitrFA6NramcdRn4wDWmfXOOxvTsXofuVN3Yef+Kb+aH7r4oDcnEHSmqpnOS0rCECR16Oa5OVY1OejvqYRY3g8u0cRtvovOnDh2cJR4R+lBmNu7ja8S7jq7hF032QbZ62r5nYR8y0KCfDbEaqSfUnfLu/zP/xT5Lc/7ZHWhNdHgMuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkOaU5r5EFhbVbxziLVpkZ2b4ba1TOjn78R8ToTmkIo=;
 b=28fidfAgoHVQhp03MrDme3dV62i1F599uQx9FTsRlujj4s3/JFcNp8vtnlv6wfJtfWDmRK2wqy/SpwsMjOt23mDeo3JOsW1PZzD0PlFjQ3O5e1/POmzcmVida2C91OWzJ4Lbh7fF0MVoPfIku+6bLZi4fRu7FLU5d9s8TKoAAAM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1242.namprd12.prod.outlook.com (2603:10b6:3:6d::18) by
 CH0PR12MB5041.namprd12.prod.outlook.com (2603:10b6:610:e0::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.23; Fri, 18 Feb 2022 14:08:35 +0000
Received: from DM5PR12MB1242.namprd12.prod.outlook.com
 ([fe80::e848:f5e6:6c9e:47c6]) by DM5PR12MB1242.namprd12.prod.outlook.com
 ([fe80::e848:f5e6:6c9e:47c6%7]) with mapi id 15.20.4975.022; Fri, 18 Feb 2022
 14:08:35 +0000
Subject: Re: [PATCH] thunderbolt: Retain host router DP IN resources during
 suspend
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        jagadish.hadimani@amd.com, sachinkumar.butte@amd.com,
        linux-usb@vger.kernel.org
References: <1645168285-126273-1-git-send-email-Sanju.Mehta@amd.com>
 <Yg9/YWrk4qMhoEut@lahna>
From:   Sanjay R Mehta <sanmehta@amd.com>
Message-ID: <ac90de2a-2d13-ed0f-2d75-8cc3e5a882f1@amd.com>
Date:   Fri, 18 Feb 2022 19:38:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <Yg9/YWrk4qMhoEut@lahna>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::28) To DM5PR12MB1242.namprd12.prod.outlook.com
 (2603:10b6:3:6d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3928e17-eaf9-419b-2a92-08d9f2e826fc
X-MS-TrafficTypeDiagnostic: CH0PR12MB5041:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB504174B515B313ECD628044AE5379@CH0PR12MB5041.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KP6jZEDlDwLDl0WQ4160aDiNvMF1Lx6gG8PY3mPDk/6jfIG9/SEWHbaGL7jlzmS61kT1F8qfkVjL1gl5qeyLRBalOJi0q6AVjSL9QBqaKt6PHb93jJSoDotw/y6WutRbUin94HzliSo6LXR+ur2gk05d4ZboWkmmJlOvbGR6vokTIiQRf0+I55jAo/qbcBGNGSaTgXflgi/a5u0E0NlA5sxgrJeE9Y3/QAJIA7GKJ+jCGyrB/vHvakUeRcXllYu/mRcgEZ8IN44CYd6xyg0nBf1mdRMA5q2FQnrJnt+Jgr+PgK98VpnJW9wobNK3mISbbcr793okQ1TcgDS0Wlh5lJzYkimt2M/lHj0/MSe+2OyWcqZu567wIcWvC9FuqkOAcGFLvKINE9pQUk9lVloInNAJRNLzH/mu8eWrMmD6wl2XJYEmKA12LqOgq3NLje9hnZgNzBEwF2/ioPTn9gpi1MdOeKoxkcF+xBV2wlNcoiu0VaswngJ7BVR353E0hBdKVNJn6+15wyP68OhJuhThYRT//QZPsBRqDLY2qiSeYikMWa279ZdOLmNd2H1T7up4fTn2SQrIU0902DQfXfcajCalsqxUykBgEWm1sPm2INmETpk0s0zjwhkZV7V3I5HDdX3uWhht9f7tH2MUNnrAkOQ8DzQGl8pL7vXvN0zbqqoJny95ar4PolWUd9KaA9AHieaSf7/NsS9XqWZySe2j7zcfREUwPLpwe1843iD/lCE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1242.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(6512007)(83380400001)(186003)(6486002)(4744005)(15650500001)(110136005)(26005)(5660300002)(8936002)(53546011)(6506007)(31696002)(2616005)(31686004)(38100700002)(6666004)(66946007)(66556008)(66476007)(8676002)(4326008)(36756003)(66574015)(316002)(6636002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTI4cjZHTm1vVldDa09leFAxZVJFTUN3MEZDRHZzeWRvcGNiTXFVdW14ZHlN?=
 =?utf-8?B?UWlmek1QNWFqUUNWRWlYNHpoZmwwN25jVkE1ZEROaVRzdDNJVG1zUjJEdXpn?=
 =?utf-8?B?MHZaeW1DaWZMK1FxWUdua090TU5nOHUrSDBVYWNjNUR0eE5iOHU4aHBmRXVq?=
 =?utf-8?B?MVFVTGxONURsTmorUmI4ZGhKamJOYWNvTktWOHhZZFFCSlVlT0JpYnFicW9r?=
 =?utf-8?B?czZoa1ZCeGxwMXRjcXNRODRBakx1SlBhRWdOWkVvTUJ0cG1nc1NtNmk5SnI0?=
 =?utf-8?B?aUg1MWVQayswOEhEUHhnVkFZNjdOVnF5a1hTTUlJQjU3aThtZURWRnRRTmNG?=
 =?utf-8?B?NGN3UXl5Vms0aDZTS3NQR1ZFcEdzZWNJV2R6dWZ1UVNUMUNyM2dWY0ZmRDdt?=
 =?utf-8?B?RmlydUhkeDlNZXA5ZlJIQ2dxaVVkbU95djRJaGpFS1FVd2JyOU9ielhRMnhh?=
 =?utf-8?B?cFU5R3IxQmlkdGFSb0lqQ3NpV2VBSTRxTWZhMm1OL3hLRmwraWlMWjkxOUJX?=
 =?utf-8?B?RUJhdmZ4NytIZkZ4aUVjN1JYSCtwd0R3eS9zckVBYTcyTGo2Y1F5UTd2bzhN?=
 =?utf-8?B?MzVObWFCNEJ5TmtrZ29oVWRwQlg1TG9RQmZiaW5wa1FtNmg0NU9zV0J5YmJo?=
 =?utf-8?B?SWt1T3gvU3RPWExPQzViTFE2TmIyZWo5aWFpNVRYYXRuMUNRQTVPVDVzMzNQ?=
 =?utf-8?B?YTV0NytYQVlReW1uTDFHdGpFdzJSTlErZ095dS9zcVZOSjdVWFBBRlJRTUFG?=
 =?utf-8?B?akFySFRESE9Nb2szTzNQR2NiQXRpVlVmNS9XUkFMek5BdUF1N0YvMkd6bE1E?=
 =?utf-8?B?a24yL2dFU2liQVpRNnZLQUwxNWJzNTVudW9WOUYvd0NUdWt3RDhEbU52bGRn?=
 =?utf-8?B?WWVHbFMrT2xDRFBzRVoxQnEwSEIxSWFyY1BuWlN3WjRyY0pxS0Mzd2VSeDl6?=
 =?utf-8?B?R3JlRnZLS0hlSVJCM1lud3lQdUljWU90WDkyU2Z2ZXkxN21MbVZkb0UrYmZU?=
 =?utf-8?B?WDVjZGNJejFtdGpFcFdtZUtTTkRUOHRSZ2crVW5vZFdBZUxkQmRrZmJWRGFh?=
 =?utf-8?B?WmZKNTUzVG5DcVFzemZvbithRE1oQjFrN1Y4UFF6Lzh1b0ovYWxuWWhmRkl2?=
 =?utf-8?B?STYvaTBBL2ZyY0xuaFpIaXNIaHI3NVdNWmFRNGpMdTJVaEpNa2FYeUNBd2l1?=
 =?utf-8?B?S09odTRtZitWSW1JR3JHNmJsRFRNdmVNUTk2ZWRjSC9xSER3dWpXOHNGck1h?=
 =?utf-8?B?RFBjLy9XSjlhekkzRTJLeWVrTzZqQ2p6dWlyNUtDZ1RZRWVtb2pYaTBXazNz?=
 =?utf-8?B?QlIxSm8rRFM4ZDNBTlhadE5FaXl3Y2VTQnhvTVkwbDV3Wm5YckRZcXcrVGl6?=
 =?utf-8?B?dkdDWXVVYXpDTVUxM1BNTjdaSEhrZFhxK2tJMjVwL0dST3JUUlJjNHRrdzBR?=
 =?utf-8?B?OGVGREVKaDZUcEs5cEU1U2JQYS9GQVREMTdHSnZROG9QRCtOQVRnU2VVQkQ2?=
 =?utf-8?B?VUFZc1cxcWlTQ1JBbGUrTEFjR0U3NGFqeWVJWkN2NTRBNk1rSFZUaW1HS2w4?=
 =?utf-8?B?NkY5Tk1iS3p2eFJ0aTB2cW5aZVFIM1pESTgrMmt2RlVEY1RzcDU1aUc1YXdn?=
 =?utf-8?B?aExNaWNRejNWdlhITGRVT2h5em5oQnRod3VZTFNRR1ZHd1A2bDJkUWVncXlS?=
 =?utf-8?B?RmtDejNKNHlLUS96QjdPVVFoLzNVd2V4aUdjVXZrdnB5QnJFa2libXloK09V?=
 =?utf-8?B?R2dXdkg0YzQyNFJWbU45clNSejNlYllUeVpOcXpQd0lZZXp3L3hKOVZ3V0hC?=
 =?utf-8?B?QWs2ZVJEYnBkekVGeE5JZkZiOXU0NGtNOWFGaVFpai9vZmxLQU5wQXZNYzIw?=
 =?utf-8?B?SWE0RHNtQjMwUlBIcll6a0hzQUI5d0Rha1M3WVFsZi92dHV3TTdmOGtOd0Qv?=
 =?utf-8?B?dElNd2NkOFBJaGdjM3hGaVhDNkRIUm5UMDI2NnB5MExwRjZCbTdlTGwvRmxw?=
 =?utf-8?B?QmZ5S1NFUVBra1FpK014SUJzdk5nYkM1TGh6SmhhWm5GUkZ4Rm1KNmRaMU5L?=
 =?utf-8?B?cUZsYVdSQUNYME9GYU55Z1ljNzRQTWZXQ0Q4VXM4Z2FFMjEvTExPcFZ5UnVM?=
 =?utf-8?B?b0dRQTRGckZVb1M2dkVCUGxGdDAvTVhuN1BxOUN4bllORmZjaStBb3JmRmVx?=
 =?utf-8?Q?whBqjrT/NdJzN2Dtrtxtg60=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3928e17-eaf9-419b-2a92-08d9f2e826fc
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1242.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 14:08:35.1436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 279eejeIsW7xNSU26xhvSo0oQ2cY6z4VA383q8GHCvl1LsvGW8s8ilifMoPrJN3N0tOLlpNQQCP7S8Yr8bP6qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5041
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2/18/2022 4:43 PM, Mika Westerberg wrote:
> Hi Sanjay,
> 
> On Fri, Feb 18, 2022 at 01:11:25AM -0600, Sanjay R Mehta wrote:
>> From: Sanjay R Mehta <sanju.mehta@amd.com>
>>
>> All DP resources are released during suspend and while
>> resuming back DP IN resource is not available, therefore
>> unable to find DP pair to re-establish the DP tunnel.
> 
> It should get plug event for the DP IN adapters once the router comes
> back from sleep. Is that not happening here?

Yes, plug event is not happening for the DP IN adapter after resume.

The DP In resources are put into tcm->dp_resources list as part  of host
router enumeration. But when it resumes from sleep, there is no plug
event happening for DP IN, hence DP IN resource will not be in
tcm->dp_resources list.

> 
