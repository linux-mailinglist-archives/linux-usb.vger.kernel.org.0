Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D53F715D975
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2020 15:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729355AbgBNO3U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Feb 2020 09:29:20 -0500
Received: from mail-bn8nam12on2063.outbound.protection.outlook.com ([40.107.237.63]:31593
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727822AbgBNO3U (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Feb 2020 09:29:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8CkLPRA2ZrHP5qq+J9n0lL7MQ0sv8dfOQ/OzYntSOXkWz/fcDbuFduOoRQ3JmTrlip36oMX5NaIZHOKUoRU7e+9lMOfIsvR6fAcpplpMZbzexivgRUJvM4Mq3KL4t1md6GSmbW4qniF4Bc/DtlKyFG9ws4XwGphbMUDNmdr0Vwekc+jBUqjmGco8WAOvkBdP/0f3dd5ckeZWsz0+V93CnW6cF3/PBgG5ejjfXt7i/+sudGhJ89R5ZWEFjRdJfFkBh4ZxG5eEbH1r5IsZ4lMcMhq7Pj6u2gGAFv+lNxMQagnqfxND6nSbX0K5zaJU23E73Futy7x57G5/Pw2lw3lOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYKcpewY03UYGWWNdrXPdwFH1hpbRpuLohJDW9Re8JM=;
 b=CTbdSW1qSrYvpjqPuxZWY8bD/GOjRiCIXTgL52WQOb92K2CIlXXxFW4L/jSqly+c6eyZ0mGwcsm5XFWv/hMgVwT5eKSbLlafMuIXAeNRa+crJ2iYMgpl6d8/ArYpwRs3OIXfx/Wiepwch9gKNcFhfStNbyxVLlm+H0DkS6t1tFEZlWxyUkrzPwSlDoNZmpyGYqAtwI1MAdU/JW/eDfcrb2vuqta/ZCqRtSY0jyYoTbcaSOrL4nAPPtfeiqqpTNaSr2twSj36Sa6wEBqDtPQUYVdepejyLqvFbyerr2hlTg84pK4r0Kkmc8XJx+5LES+DJqManPVc3nSigsHE//g16A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYKcpewY03UYGWWNdrXPdwFH1hpbRpuLohJDW9Re8JM=;
 b=dGMDrDPazi0iUTLV9hfQrILLe5VKlqr+DW6DdLNsyPhY6leBTYyvyKoTlWtjilsm4mX6X8N2Upxi6ZFzoz/Cxv+6VaPhOAhCixuCXhGDQjOuDBDO/Y9yL0Rk4Yj/TrLqmLdz5vcdy/NpD7S9w5J2ZAOefFL2RSEhJYAxlB0Elow=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nehal-bakulchandra.Shah@amd.com; 
Received: from SN1PR12MB2575.namprd12.prod.outlook.com (52.132.194.142) by
 SN1PR12MB2416.namprd12.prod.outlook.com (52.132.199.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Fri, 14 Feb 2020 14:29:14 +0000
Received: from SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::91ea:acda:e830:2e21]) by SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::91ea:acda:e830:2e21%3]) with mapi id 15.20.2729.025; Fri, 14 Feb 2020
 14:29:14 +0000
Subject: Re: UCSI:CCG: AMD Platform
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Shah, Nehal-bakulchandra" <nbshah@amd.com>
Cc:     ajayg@nvidia.com, linux-usb@vger.kernel.org
References: <0fa0fc36-ce51-046a-32ae-9dbb7452c1c4@amd.com>
 <20200203132808.GA29050@kuha.fi.intel.com>
 <20200203133231.GB29050@kuha.fi.intel.com>
 <aca4968f-06e8-6ac3-09c8-4810947e92b3@amd.com>
 <20200213120011.GL1498@kuha.fi.intel.com>
 <20200213120555.GM1498@kuha.fi.intel.com>
From:   "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Message-ID: <0efd0175-6668-7411-81b2-d4a487ccc0ec@amd.com>
Date:   Fri, 14 Feb 2020 19:58:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <20200213120555.GM1498@kuha.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PN1PR01CA0099.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::15)
 To SN1PR12MB2575.namprd12.prod.outlook.com (2603:10b6:802:25::14)
MIME-Version: 1.0
Received: from [192.168.0.104] (202.62.82.154) by PN1PR01CA0099.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend Transport; Fri, 14 Feb 2020 14:29:11 +0000
X-Originating-IP: [202.62.82.154]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1658485b-9043-4bfc-cb0e-08d7b15a43be
X-MS-TrafficTypeDiagnostic: SN1PR12MB2416:|SN1PR12MB2416:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB241655DB9477E81A9F2F80F7A0150@SN1PR12MB2416.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 03137AC81E
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(199004)(189003)(2616005)(36756003)(110136005)(26005)(8676002)(6666004)(81156014)(81166006)(2906002)(5660300002)(186003)(16526019)(8936002)(4744005)(956004)(55236004)(6486002)(53546011)(16576012)(86362001)(31686004)(316002)(66946007)(478600001)(4326008)(52116002)(66476007)(31696002)(6636002)(66556008);DIR:OUT;SFP:1101;SCL:1;SRVR:SN1PR12MB2416;H:SN1PR12MB2575.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6X7OD4EheQa2dw6EVhnzCRgQneHHWuxm6grAFh5A6Hu2LwpZe4EJHXmWOdiBWxlqGKRIMx/19+BkMvaSJnhRh1ANDi0HooGB62VEfNSNcil/NKMNtPKxbYloGb00KUwhb/hpPlSfGnbFGJG7u5wHQoq0gfMrwEg03nUfxsf33+dwunCLUGxNO2JAwsSXNQBYUCDeIoZA8Uq+ZiIMtJsprsrvHJHW9PI/Vy9CSTX63uRxcw802X1cRdUg02/HEyIv630Q+dpcYaBP7htxCJCI993vWcEFoaS5vhNyPF3oJeR1tVSPtMJZ2hiy1SykBb5RsyisA0xzQAzr4YpCLRL61LvHkzrrTeWDfp1KwJAO1pT/Bn4VGVk0U+FFkiidp3xd1ILGx8s9+ytMQ/EAsRFYAZ0eXEEwmWcqE9ewqenHndNKRQtg5EEM/x2wSsVgHiWx
X-MS-Exchange-AntiSpam-MessageData: RGfr0lhHHZ8VjpDceeRAm/pdKBFT+m3fL8RhTGZwScs/iow2/pPj6LO23QNptvqGeHB10y77ydAPf+75p86VOx2SsmP7wdOEqClPgIrSp20bJtvVSkMRrtMMoPaAIqRGzo3SePe8YJqnKJjDpKmdtA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1658485b-9043-4bfc-cb0e-08d7b15a43be
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 14:29:13.9344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihMa/FNzHGyqnijzYBqndV5zbd1uxKNfjWyEUhFkL1Ftpgz/Aa3ro7pDzsi9xWze
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2416
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 2/13/2020 5:35 PM, Heikki Krogerus wrote:
> On Thu, Feb 13, 2020 at 02:00:14PM +0200, Heikki Krogerus wrote:
>>> I am using CCG based UCSI driver without any
>>> modification.For I2C part i have written custom
>>> driver.
>>>
>>> I have attached the trace out and dmesg crash log.
>>>
>>> Please have a look
>> Thanks for the logs. Can you test the attached diff?
> Actually, don't try that one. Try this one instead.

Sure i will update on this on Monday.


thanks

Nehal

