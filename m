Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A87A115012A
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2020 06:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbgBCFXC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Feb 2020 00:23:02 -0500
Received: from mail-bn7nam10on2046.outbound.protection.outlook.com ([40.107.92.46]:9345
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725768AbgBCFXC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 Feb 2020 00:23:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hv/6m6qCAsuintgACqESQ3hj17maaGQ4U4k0rJfQyPsdpuljh1UMaJeGT/vLOjnq2YqS7r8yD5naKRMdIGPqFevtFlLzp2zxSUQ/z7lWE2MUjmHsJBv8FQfNlTBcN40lItaONRBE3bPtwyboJhNRcmfL1VbAcdQztLNy5rVGWlof9vgWM06LrWldMvekk+Yigk+cY/DSA3rfkyq3aIEzw17zA3qONe8FRKmGtNQKszk9bNbd9p/YjeEyaVRClQ9NDm82PvwiFKFl2SdF6lZrSPtps3BsN6xsF+wYuxVBYHe+028lEtwfhP4A27n2q3I8iq0vqxVz53SoKPLLyW8P6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CO+HuMAVq19wlisWhpNgyPyVH/gk0Ozqo7/MmkVGqEo=;
 b=BSlL/1VvsYS0lwMHFhND5NYgbJYTSjmoHlXOw4gtaHIe9mHfBw0UmoVOsDq9Uz1cfn0u8ven/2OLfoGZkaiixj9VEUrd7EX4fGfvzIQsVbZxhebIcDbcitVs5jIjpZkA4ZJ8ykqEZT2UxnwpGgmIMYd3KoUqXBqqK59PtQNx/sThliEKDPGt66wVFi1jyWWKBQMW/2sXCoZQT+Wl+9yvJn0anKlVgCsUleWUpdBvMtlGfymLGNo/zDPjWVV88OX4esYyQRir90MBDDBRxEYjSjTnk2UeNg03C9xdXMHsgUa43WlqsH4sMrn6RDNlxd2VoYSNnBOHxFA9Es7KXi834Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CO+HuMAVq19wlisWhpNgyPyVH/gk0Ozqo7/MmkVGqEo=;
 b=ubjJZ1TjpiarihvIUn9PZjPxdKbUwSyHcQV24oGG+Fd2hSpND50eyd1dy0XhtE8+y0IW47FpmHAVpcI6MbJnStxOMoqK9TfcsPNDnBvUKfZKp2wTr5PXCM9IJX5lyrr5z7EzF0VV4Vd6g++JRKCoJYLyIUayWbbo8MnDgoKqCt0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nehal-bakulchandra.Shah@amd.com; 
Received: from SN1PR12MB2575.namprd12.prod.outlook.com (52.132.194.142) by
 SN1PR12MB2541.namprd12.prod.outlook.com (52.132.194.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.29; Mon, 3 Feb 2020 05:22:59 +0000
Received: from SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::983:4d1b:29ab:81a5]) by SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::983:4d1b:29ab:81a5%4]) with mapi id 15.20.2686.031; Mon, 3 Feb 2020
 05:22:59 +0000
To:     ajayg@nvidia.com, heikki.krogerus@linux.intel.com
From:   "Shah, Nehal-bakulchandra" <nbshah@amd.com>
Cc:     linux-usb@vger.kernel.org
Subject: UCSI:CCG: AMD Platform
Message-ID: <0fa0fc36-ce51-046a-32ae-9dbb7452c1c4@amd.com>
Date:   Mon, 3 Feb 2020 10:52:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0091.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::17) To SN1PR12MB2575.namprd12.prod.outlook.com
 (2603:10b6:802:25::14)
MIME-Version: 1.0
Received: from [192.168.1.219] (103.206.138.4) by SG2PR01CA0091.apcprd01.prod.exchangelabs.com (2603:1096:3:15::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.29 via Frontend Transport; Mon, 3 Feb 2020 05:22:57 +0000
X-Originating-IP: [103.206.138.4]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 97c14a16-c448-4467-5163-08d7a8692220
X-MS-TrafficTypeDiagnostic: SN1PR12MB2541:
X-Microsoft-Antispam-PRVS: <SN1PR12MB254150A2E70F42F7EE2E7F97A0000@SN1PR12MB2541.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0302D4F392
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(199004)(189003)(478600001)(52116002)(5660300002)(16526019)(966005)(31696002)(186003)(8936002)(2906002)(4744005)(4326008)(26005)(31686004)(66946007)(66476007)(66556008)(6666004)(81156014)(81166006)(956004)(2616005)(6486002)(36756003)(316002)(8676002)(16576012);DIR:OUT;SFP:1101;SCL:1;SRVR:SN1PR12MB2541;H:SN1PR12MB2575.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yOamM0DFVX7KOL8E64jz0GZwHsYR32PJhOFF2uYw626Vh2IkCk7XZrw7W6ZE3La9Kggj1IUlEQ9JmIGHRLct+sw/4KYAsH3HfPx1PyMmR6LlBwG05157d2s+Ow2f3hMBGbOoCZ6k1Pge3nDNowFqTJDuuGFAqPYoq+qLhQIbyRFLb4Lq4aP6VqTeLR2OAsY44hK83ECiT7kP5H9S5yt2KSK/c1dGgU3V1HcFD/HIy10efdc8q8odBfPhDDYz6/CgvNBi3XDRV1CM8q1bRR09szj903a/RGBlob+eHJRxTBsWCXtXFA2PSRoPN3Ar+MkWYqZx7BxYTPUk5v7fAT2uzj+LVsU4Bg2FHfeva7+oC319FAOgLXoQ9VVFIiVpOYeZbpMXDAth113Hj33eFlf6NDCzTT7+LF6tgD6qbLyt+EmwwRmqiWHUkZVMBsL0eIU9OGiW4hFR+GfZHbuSj5nUzk0f+CKhvf6lyvWq6POetbYpGIgq0sUN4ayD/BajInLfC2NdvcInmiMm3yX2fdzm4Q==
X-MS-Exchange-AntiSpam-MessageData: BFFuL43GKjQXgQ/Ng4APdOZ2hidDcZ/EZR4X1gfOK3bcMUWz9iHaZilllJsYKpxcOQxTpIVB2GZlK3AB0YH8UOmv5MCMaHPgjm2NqgvBoVTTveTajfh/G7gz4GTyC4FWGOHzoF8i4+uKGRRFRO/d8w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c14a16-c448-4467-5163-08d7a8692220
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2020 05:22:59.4969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PvKpPdNF130DOiaEP0yxsQ1AL2Y7ziszKNxG8T9woWJfz8ViAO2ATgUaU+z1OyWL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2541
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

Currently i am working on enabling UCSI support
for CCGx based controller on AMD GPU Cards.

Now i am observing the issue reported here when
i unplug the cable.

https://bugzilla.redhat.com/show_bug.cgi?id=1762031



Also would like to know is there any way we can
get user level notifications for UCSI?


Thanks
Nehal Shah
