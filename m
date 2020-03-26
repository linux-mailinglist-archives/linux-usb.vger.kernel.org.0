Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0723193FF7
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 14:42:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbgCZNms (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 09:42:48 -0400
Received: from mail-eopbgr750085.outbound.protection.outlook.com ([40.107.75.85]:6663
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726270AbgCZNms (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Mar 2020 09:42:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFXZS4MGty1i0nrzcPmTTCcS5DSoE/hLQi9fMMfFHSo9PQpKpvTSMGGYhyt6Zdwo1MCaR53n8VrTnnLZM8Mmr8JxElIy/JAu2iAMPiXMDxHn/Fos+k877q1E+I/ECgDinR44kVr5/OSaCC/dj6Af5TtkSO2PbHgVgT+7b0RBvnDGgjyKMjdQP595glIONN0R4HyqSit2B/Ju/K2V9yH5MAcd7Ygf9pxc125frBAuaZqG7xmcmdxZ3PLtG3yz53fIcAO+DsZ35LWGDvPOiuLZvGlhJ4b1WgqEinHB5lcFRviXT6bDYTbujryMNgMJFhJxv5xEqHfB1SlKuDx6+dfmjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0yyD6+srGVgVbqzfkdGiNrRF2jVZ/HwMVPBPAYivs4=;
 b=YzJfYw/iKBaQfFbguydkQ41d/D0Ml+8cI9kiTdN1uwpm+m2ZzaW/9AjN1ZC42liaPREeCeAAPodAl8LFWOuMc4MSu6vXgSNPban2j7WxNaa+ArFmQ9VcVEEJoB+aykdU7CfsPqANcLDApf9luAJEs7q7Qy0Gf5TBI6JfBN60jOsMTiF1LiR3lomVDbFgVmsHqsgKyreg3WteFOeEXaQmqe5IykEygOTppl1fDiyxNDEhduJQOPUWg7EnfwjUPd5mRmjLjWO1TRRkgYcGB1F+SZUX8VdqPvFG6zwDDqRxMklzxpUm7JigE4C/B4jCyrZ5S6s73NLBT8CIihBrYV/UFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0yyD6+srGVgVbqzfkdGiNrRF2jVZ/HwMVPBPAYivs4=;
 b=yznl1bD+o4JBstiqg2agt5myLb/L7JBye13ZW41X9pytL4HuZqZvyBlnIEiiR7piDC3VXXQAlXmjSJ5bM6le78lr5Za5BYwr3qis7XylfOxxaQKlaUsJU+nfpuYn2ZjQBRDi3uujKa+s81V4AOaW6QKb2/ymvil8izgF7zwXptE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nehal-bakulchandra.Shah@amd.com; 
Received: from MWHPR1201MB2478.namprd12.prod.outlook.com
 (2603:10b6:300:e5::19) by MWHPR1201MB2495.namprd12.prod.outlook.com
 (2603:10b6:300:df::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Thu, 26 Mar
 2020 13:42:45 +0000
Received: from MWHPR1201MB2478.namprd12.prod.outlook.com
 ([fe80::bd49:3e0a:bcb2:dc2b]) by MWHPR1201MB2478.namprd12.prod.outlook.com
 ([fe80::bd49:3e0a:bcb2:dc2b%9]) with mapi id 15.20.2835.023; Thu, 26 Mar 2020
 13:42:45 +0000
Subject: Re: UCSI:CCG: AMD Platform
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     "Shah, Nehal-bakulchandra" <nbshah@amd.com>, ajayg@nvidia.com,
        linux-usb@vger.kernel.org
References: <20200203132808.GA29050@kuha.fi.intel.com>
 <20200203133231.GB29050@kuha.fi.intel.com>
 <aca4968f-06e8-6ac3-09c8-4810947e92b3@amd.com>
 <20200213120011.GL1498@kuha.fi.intel.com>
 <20200213120555.GM1498@kuha.fi.intel.com>
 <0efd0175-6668-7411-81b2-d4a487ccc0ec@amd.com>
 <e0ab390b-743a-d583-15c4-83af3a7dca35@amd.com>
 <20200227122308.GC10532@kuha.fi.intel.com>
 <278ab9a6-497b-9cd5-8aa1-440fc78cb3db@amd.com>
 <9fcf4549-e699-1a35-d87a-6bacf85fba29@amd.com>
 <20200326083507.GB1281735@kuha.fi.intel.com>
From:   "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Message-ID: <f16d7b19-b45c-5599-8df9-2c297b8b6554@amd.com>
Date:   Thu, 26 Mar 2020 19:11:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <20200326083507.GB1281735@kuha.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To MWHPR1201MB2478.namprd12.prod.outlook.com (2603:10b6:300:e5::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.142.148] (165.204.140.250) by SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Thu, 26 Mar 2020 13:42:42 +0000
X-Originating-IP: [165.204.140.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3a06a384-f830-4ced-8641-08d7d18b904b
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2495:|MWHPR1201MB2495:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB249584383AE1D5B149025869A0CF0@MWHPR1201MB2495.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0354B4BED2
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(53546011)(478600001)(31696002)(6486002)(81156014)(6916009)(8676002)(52116002)(6666004)(81166006)(31686004)(4326008)(26005)(16576012)(186003)(66476007)(66556008)(36756003)(86362001)(66946007)(2906002)(956004)(2616005)(16526019)(5660300002)(316002)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR1201MB2495;H:MWHPR1201MB2478.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cex6NkgWr+HfHv1bBQrldGxcs6lz9EVH5zg+KLpEs6smgxA3koWT/ZcBifGgGdRAjFS5nMqUmMcKbLLD56pn1LAGOgUnMlOAoDadcipG28vj8lNf61hQra7Pfrh+WEn2DzC2NcxPRoa24xXIqBBOn7tpsB1RapV/GmqlJ7T48iJlB2Q3OdQfb2/wU16P6R/Pf1+C7J/iGE75nisqBdIHiYBZ6YS/gouVvwsXXkyi1/Oy3qzaKI2sOLJMqMBI0J7JoiIY2ixC0X4O4jIzo0C+wCOtw1v8r3L8A0jBNe9R7ebRxFq5guXyqlmkm8N8HVnv1EzvDcUt8O9GolL4ouO7xasn4l4fv/mvb+rKmJZB3+dkYI2RO1bnnRh2N3lTFWN9l3MdtOdOUShIevs9vmUiu+Zb/xYJNhAdV0Go7Fs+GE56Hjcdr8jexe8/1JMtrDXU
X-MS-Exchange-AntiSpam-MessageData: ywsJkGXnZUVxjkUXBSuSHQcPbLChuXQThzo4fHHZX+KgIMMnxUcRm0gC4yAYgQOaXrXSp9lGD7DoP6uW9skzcuna0EC76kL7Q2Vt4tMCZ7uiv7/44KbFhlqYn+vZxjX5+pSHxWULX5VvSY44TvMKXA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a06a384-f830-4ced-8641-08d7d18b904b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2020 13:42:45.0781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: buiFRAouN0rA7pUB5nJolakNaiOrxyBJx8ZkuNdd/weC5jnTUNm/omMgi4o+6w7C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2495
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

HiHeikki

On 3/26/2020 2:05 PM, Heikki Krogerus wrote:

> Hi,
>
> On Sat, Feb 29, 2020 at 08:55:50AM +0530, Shah, Nehal-bakulchandra wrote:
>> Hi
>> On 2/27/2020 10:29 PM, Shah, Nehal-bakulchandra wrote:
>>> Hi
>>> On 2/27/2020 5:53 PM, Heikki Krogerus wrote:
>>>> On Mon, Feb 24, 2020 at 02:38:12PM +0530, Shah, Nehal-bakulchandra wrote:
>>>>> Hi
>>>>>
>>>>> On 2/14/2020 7:58 PM, Shah, Nehal-bakulchandra wrote:
>>>>>> Hi
>>>>>>
>>>>>> On 2/13/2020 5:35 PM, Heikki Krogerus wrote:
>>>>>>> On Thu, Feb 13, 2020 at 02:00:14PM +0200, Heikki Krogerus wrote:
>>>>>>>>> I am using CCG based UCSI driver without any
>>>>>>>>> modification.For I2C part i have written custom
>>>>>>>>> driver.
>>>>>>>>>
>>>>>>>>> I have attached the trace out and dmesg crash log.
>>>>>>>>>
>>>>>>>>> Please have a look
>>>>>>>> Thanks for the logs. Can you test the attached diff?
>>>>>>> Actually, don't try that one. Try this one instead.
>>>>>> Sure i will update on this on Monday.
>>>>>>
>>>>>>
>>>>>> thanks
>>>>>>
>>>>>> Nehal
>>>>> Patch is not solving the issue. I have attached both trace and dmesg output.
>>>> How about if you try this (the attached patch) together with that
>>>> previous diff?
>>>>
>>>> thanks,
>>> Sure, infact i suspected that in first place and tried same logic but it was failed but now i will check with both patch combine and shall update.
>>>
>>> Thanks
>>>
>>> Nehal Shah
>> This is still crashing .
> Sorry about the slow process with this, and the late reply.
>
> Right now I'm out of ideas. I'll need to get my hands on the products
> that allow me to reproduce the issue. Staring at the code does not
> help anymore.
>
> I'm going to cleanup the code a little bit in any case. I'm attaching
> a diff with my changes. I don't think it will fix this issue, but I
> would appreciate if you tested it in any case, just to be sure.
>
> thanks,

Thanks for the patch. But i will able to validate it after few days due to countrywide lock down.

regards

Nehal Shah

