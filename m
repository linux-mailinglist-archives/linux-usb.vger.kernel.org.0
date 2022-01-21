Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88491495B35
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jan 2022 08:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349022AbiAUHxk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jan 2022 02:53:40 -0500
Received: from mail-mw2nam10on2041.outbound.protection.outlook.com ([40.107.94.41]:19681
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1343705AbiAUHxj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 Jan 2022 02:53:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWEICjBPm0PEoDegZSwmB+qMw7FeC85DlI+jcjdAxIY7Z2Rth4nVNeUxA6WKmVDjXX0lT/EKBvc+UN2b0PNtvRp4ADtaBo8E0KFyXe/KZxJWiAkbFfe602EU2LG5tbi6u/fViYGl4CE/6CJ4jctORueMvF3eOKcGXInuqGm2Xm0l+PXrmQo0kVsEtPgUEcQbzAaSNUYf3vizh0etMSMg2+yQ+/6FXVJL/CN0OOtSe9S3eRzou2zw/CnrDOprI/dJ1T+dV1ZdBHLKHX1zxBNR6lG17jJhaOCCgq6rJzlotuXBEQoGXwpqkwgCxr16+OrAHPI6Xxf9pyGraTy3K4p4UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsbA25UaDaQMeUjZvEaX18vCoCGuC/OJ/QOZCSMGGWI=;
 b=ClJN+Rc4nsDb1n7F8EsOxtbVRGx3utcvdjKDxy3EgkdhZ8+6FUVatg1V09JksUyUF9mt14HtZB4cqu15XzeZYCWs37h7HbjTdBKsL7BVp7gS4YUNEpmCwVuJ+I+bn77v17wADFUJPKs4JW5WCxlg7GgwDkcsZlGC8VwO5QSy92pvOrrneCXcdQJhOqsm7vBZh09QW6eJeYFr6Mm9lsbHKB7quOMWy8+gFzzfTspECttXavJ1eLUXIiXiC5OvokaDcjqTlDsEk0XYVauTV6UADfB9Cl914W7Mi7BxoLpdV0D/UcdzGRrOnz4m7W6AZ4vw/gjB4lm+JG+384pApYbmDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=calian.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsbA25UaDaQMeUjZvEaX18vCoCGuC/OJ/QOZCSMGGWI=;
 b=D8K/LVQF9bzwciahrgcQZE5/0n4ZSLaYH06tNXcsdQ+R3dsPAOiQkrql2DGRq2L9rdpubVWWWIRIBi0XlrHny3DCh/GarWKH0UNPXkCfly/7WEqWoDC9PKt8DEdCaNsBSwXK5SAsDyFijtMr/xPTpvtq6Vm9NVYDwV+WLlqGj4I=
Received: from DM5PR06CA0091.namprd06.prod.outlook.com (2603:10b6:3:4::29) by
 BL0PR02MB5410.namprd02.prod.outlook.com (2603:10b6:208:82::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.8; Fri, 21 Jan 2022 07:53:37 +0000
Received: from DM3NAM02FT044.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:4:cafe::5b) by DM5PR06CA0091.outlook.office365.com
 (2603:10b6:3:4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Fri, 21 Jan 2022 07:53:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT044.mail.protection.outlook.com (10.13.5.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.8 via Frontend Transport; Fri, 21 Jan 2022 07:53:36 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 20 Jan 2022 23:53:35 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 20 Jan 2022 23:53:35 -0800
Envelope-to: robert.hancock@calian.com,
 linux-usb@vger.kernel.org,
 balbi@kernel.org,
 gregkh@linuxfoundation.org,
 sean.anderson@seco.com
Received: from [10.254.241.49] (port=58420)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1nAojn-0002pQ-Jt; Thu, 20 Jan 2022 23:53:35 -0800
Message-ID: <849bca28-b52a-9cdd-034d-75fcc47da32a@xilinx.com>
Date:   Fri, 21 Jan 2022 08:53:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 1/2] usb: dwc3: xilinx: Fix PIPE clock selection for
 USB2.0 mode
Content-Language: en-US
To:     Robert Hancock <robert.hancock@calian.com>,
        <linux-usb@vger.kernel.org>
CC:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <michal.simek@xilinx.com>, <manish.narani@xilinx.com>,
        <sean.anderson@seco.com>
References: <20220120170818.1311306-1-robert.hancock@calian.com>
 <20220120170818.1311306-2-robert.hancock@calian.com>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <20220120170818.1311306-2-robert.hancock@calian.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a8a463c-788b-49e8-30a1-08d9dcb32162
X-MS-TrafficTypeDiagnostic: BL0PR02MB5410:EE_
X-Microsoft-Antispam-PRVS: <BL0PR02MB5410A57B1FD67188B5D9917CC65B9@BL0PR02MB5410.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8G1FiqOptzkJqK4WrqpKeuRpfHy1ARf+jNmzrBEBoiWBs72v9PJBd03Xfq4+rvkYaVVI73/bn9JkdJ43IgcooeJPTjiGtr4Ew27hVRcKf71rpQM3kCMMWTUAKgE1xeYIoZDYM3yDgUHHefheqpNibXKkihtUoWJBAlIvnUpihnE4t6P8hHW/oWspYPqpgiJW1VsOi0s3WjS3hwu3CV+cmv693WtdCobV28rAQezYPxbysKdfUd0BVeTSmx2GPftaAXIrXSMN1iglJDBRBKMjzuWSfoxSBrS2i5w/bLbFkXdh1Su9ZhQtOiOplcENNuUUN9OxlXC1tNqZvB1QwqKkbe2cyhRXlQpDvNUfMMNgRxswAUL17XDD5ARHf2l/ilSGvuHiXw8cozm7yRmVthAa73eFUOsv8CNXv1RDfLFJj8G9Egq6O76dQUtuTEqEDG4irikwzCzXi3dtjeTipjl4dis69uBd800R8Vahs5wb1K60JKU4b1OS/xLOS+WZx7UwhLLPdTH0nEQaESBF+2b8mjvNrhCJ7j0THAW7J4ISGh0GkqqWN4W+0tx75pR73z7MA/KxCF67cCaU9tIC+aOJ/a4D1YF9/rtUlrBT8LXxALvJ6XjaEYHCklOB2i4FoC5YRavbrFSDW1/IOhi2kNSYZwIf1H4cwqDsstQuqzhI+qXlUmQSra2xApKvxvYp4UpSQDb0h3w5GjRCfTKPtS/wyvA0SgIFG2K1ksT047d+OxoCiIQhi9TWWz+XERTHsAaXVQ9AnjEfW/zlrVO7TiS6rA==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2616005)(2906002)(36860700001)(82310400004)(8676002)(47076005)(8936002)(53546011)(54906003)(426003)(36756003)(4326008)(316002)(9786002)(508600001)(83380400001)(70586007)(5660300002)(26005)(110136005)(7636003)(70206006)(31696002)(44832011)(336012)(186003)(356005)(31686004)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 07:53:36.6038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8a463c-788b-49e8-30a1-08d9dcb32162
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT044.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5410
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 1/20/22 18:08, Robert Hancock wrote:
> It appears that the PIPE clock should not be selected when only USB 2.0
> is being used in the design and no USB 3.0 reference clock is used. Fix
> to set the correct value depending on whether a USB3 PHY is present.
> 
> Fixes: 84770f028fab ("usb: dwc3: Add driver for Xilinx platforms")
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---
>   drivers/usb/dwc3/dwc3-xilinx.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
> index 9cc3ad701a29..3bc035376394 100644
> --- a/drivers/usb/dwc3/dwc3-xilinx.c
> +++ b/drivers/usb/dwc3/dwc3-xilinx.c
> @@ -167,8 +167,11 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
>   	/* Set PIPE Power Present signal in FPD Power Present Register*/
>   	writel(FPD_POWER_PRSNT_OPTION, priv_data->regs + XLNX_USB_FPD_POWER_PRSNT);
>   
> -	/* Set the PIPE Clock Select bit in FPD PIPE Clock register */
> -	writel(PIPE_CLK_SELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
> +	/* Set the PIPE Clock Select bit in FPD PIPE Clock register if a USB3

nit: this is likely comment for net not for the rest.
You should use multiline comment in this format.
/*
  * Set...

M
