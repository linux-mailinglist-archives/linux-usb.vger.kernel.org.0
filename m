Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8EE422402
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 12:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234175AbhJELBa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 07:01:30 -0400
Received: from mail-mw2nam12on2085.outbound.protection.outlook.com ([40.107.244.85]:52001
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234144AbhJELB3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Oct 2021 07:01:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0qYGnyfnSxTx+ap3DyFhsjUl/lALvbKkW5OJ6GgSFaWwZNIigzr25g8rTmibbbptaqS4EBY5IciYFdcEeXNolooD+DWfPyiSorYeisPe0U+oJrSSWDCSecIDjDJOkRihOT7YVdtureAJlYDrYaIFM1hYkCRC0plvax1D/kDVSY6BB73JB8B+ZsJ85xryZ5qocY7A1Ydthl1kGzuvw704h3DXuniGBxGlvPvvw6IXqYrIPa+e/3nM7nlIgJx1trlsqzFxM5L0/aoHjhDChsTe8ejZhLhZMIlgRxofg97/MzO83tFmzRjlIQHaEQWzCSY4JdQxTXeK7VEXJ7PdrbO+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i86WwE+unz3KCmK92fvGOeZCm4HGMdVdMwMSlUstEy0=;
 b=d2QyDJO7FixsAJPZi+FuCKbo2S6mtUQpC0LdFrZJZpL/PB6t0oUwHnYGIY08OrNqKaj3tnuC8Pa0+qXR2TdgWSOj5KGxgXr59Z2HJexXvHJAyDxzrbrOHL+7xc7/jz5B7zJ2rmleb/Ba5KtzdU1Pd/yhQA/Z26Daw4WdOEfOYrpOl+L17XtoF2wenewte06nZeMWfDLNujwQD/WSxfocgMomlrjKsx232XRs5p5/XvsBHSkOBzhNLQq0SI3E5nPTanRpBsGfMx1qTgcoE0D1OiKPwMwI9nLAstvge1LPY3RihjMRfNy8EM08jD0TrqoaPsQMpaSpeYGzJUcywdPd4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i86WwE+unz3KCmK92fvGOeZCm4HGMdVdMwMSlUstEy0=;
 b=YEpfEy8JGzjg6ij88CUVBMq6BufigIef6OEtH6NBdFvQ5neWh1KcSW6g/HTrJR5jnCI9itxI1jclgr/7evku4L9cIBiHpJygxXuegWP7ZljR33gaSlmV/Q1JOv27Fy6Bg6Loo0vZ2qvXU2BnRtA8sl5U2Ho5cYablBAw/Ungshs=
Received: from DM5PR15CA0058.namprd15.prod.outlook.com (2603:10b6:3:ae::20) by
 MWHPR02MB2638.namprd02.prod.outlook.com (2603:10b6:300:45::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.22; Tue, 5 Oct 2021 10:59:38 +0000
Received: from DM3NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::62) by DM5PR15CA0058.outlook.office365.com
 (2603:10b6:3:ae::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Tue, 5 Oct 2021 10:59:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT025.mail.protection.outlook.com (10.13.4.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4566.14 via Frontend Transport; Tue, 5 Oct 2021 10:59:37 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 5 Oct 2021 03:59:37 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 5 Oct 2021 03:59:37 -0700
Envelope-to: linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org,
 greg@kroah.com
Received: from [10.254.241.49] (port=52526)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1mXiAT-00007z-NV; Tue, 05 Oct 2021 03:59:29 -0700
Subject: Re: [PATCH v4 1/2] dt-binding: usb: xilinx: Add clocking node
To:     Greg KH <greg@kroah.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
CC:     <devicetree@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <git-dev@xilinx.com>
References: <cover.1632805672.git.shubhrajyoti.datta@xilinx.com>
 <30c7d87ab46a0ea2da2dd04d824f162a2e3da4c8.1632805672.git.shubhrajyoti.datta@xilinx.com>
 <YVwvClRFIfIREX2n@kroah.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <1e8d8005-dda3-5898-3cb0-49db2bb7e436@xilinx.com>
Date:   Tue, 5 Oct 2021 12:59:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YVwvClRFIfIREX2n@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b21b5f53-6c95-4564-1d64-08d987ef395f
X-MS-TrafficTypeDiagnostic: MWHPR02MB2638:
X-Microsoft-Antispam-PRVS: <MWHPR02MB26389CB796EA1BC8FB17F721C6AF9@MWHPR02MB2638.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:328;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5yS4zxsmrHyIqAeXTI7/bYt6057VAxZkHTZWZ1VQhe35dFdpfj/iJmxUmk/2r7TsZWYTuW3KLTeTWd0Vw41RKLvAg8ovWRN/i1QQMbBcTxiSG5t5AnkYQg1d8PDaPW0M3XuiamZtoxxrMKMa4Ojkc4nTdVprw1/bpMFditQTIIe5WUqDuBqJr2eNEGtU5fk1IDDfujMqPpQkIfQcw5pH1VT7lpdjSNY67m1MzO9gClq2Fg94gq18HljbZbCB77fPHdYlrPyGHD3YHunXc0ojgzn97fyaVV9xiX/aFQSBF4850hFcBIurzYJ06FAb8rOXiHKtXxalytaiGXrVl6PF6WdgzUGY1Vhv8vRlW2UQeur4wEtvQi3ZTVcfPP1KbrKgXD42+2HTqCSUPRDzXnHt0Wx1q2dtwg1hourJTbxK+1Qy4unaRmsTMLzNzQfASUlPMAAs5XSkYz2cJSLr1fGpaJhkWYwt/nDwycBD+RYq0Ax+Tlo9zxy9bsZroWJLT6UYofTqasYf4aLwqE1uTbV4bVHpZzAJ/uciE+BR3jAaVS/1JzfHI+aZNT+nKFjAcfkZswX70HvTnFOqDX59N1kdYvhPDThf1BzjZcuANSI9LRf+6/AArRTBqn3ihwN9RluUePCVczY8DSTzs1jeJ1G9WNdzjwDYUgddZb6sTtYP8xjfvCF78o3/Fqmcq4BWWMBFK5YIECqdXhRG4g6HHoULteNkx8Q3dMft7Z5TkmGKJ4EuyBTy+pBRdyq4L08EZABRn0R+bBYBOoU5KuGFOQu26Q==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(53546011)(110136005)(47076005)(54906003)(336012)(2906002)(83380400001)(426003)(4744005)(8936002)(2616005)(107886003)(36756003)(31696002)(316002)(4326008)(70586007)(7636003)(8676002)(36860700001)(186003)(44832011)(508600001)(6636002)(9786002)(26005)(31686004)(36906005)(356005)(70206006)(82310400003)(5660300002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 10:59:37.8184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b21b5f53-6c95-4564-1d64-08d987ef395f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT025.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2638
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 10/5/21 12:55 PM, Greg KH wrote:
> On Tue, Sep 28, 2021 at 10:57:10AM +0530, Shubhrajyoti Datta wrote:
>> Add a clocking node for xilinx udc.
>>
>> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>> ---
>> v3:
>> update clock description and names
>>
>>  Documentation/devicetree/bindings/usb/xlnx,usb2.yaml | 6 ++++++
> 
> This file is not in my tree, where does it come from?

In linux-next I see that Rob has applied it to his tree as commit
ecc4103f32e9 ("dt-binding: usb: xilinx: Convert binding to YAML")

Thanks,
Michal
