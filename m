Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4E2A495B39
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jan 2022 08:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343705AbiAUHyv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jan 2022 02:54:51 -0500
Received: from mail-bn8nam11on2078.outbound.protection.outlook.com ([40.107.236.78]:29039
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1379230AbiAUHyu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 Jan 2022 02:54:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCSVl5aR7bQTtDt6GqPOTN2sekMpWtN6B+/JdmWMplVN6zjN8VNPDshI/slg0v/Qaq7SYL628hU2LZ8bnn0xh5/ch6fHF+Fct362I7H6CdaBNSY1WFoB7dEH/LUbjL1H72lZ7cyjFIzwwDKgFkECnGNkFTLRUF+Ty3dt139CAARfp5wnGGm8WWJ0gtN0AbK9w97dJCYXH1Hz9/Afh7zUcr/PbxdscCyaCdhMiZrrlXVr+6rgz3U5pQnbbHGP++BbpBmGxqLzVOcp9GIwDAcGmkas72nmu7aBqgLx6do1ox47NAZT6diMwuXePoIJH5ciloUiwVnro4NRguExfYnH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LOw4HfJL00bod9niBWoVoNcTfN0Shjmnoai+M1rf5w=;
 b=Z2OHLxi+9ierd41RPwUTDK7ofWTV5zZfCh2vxD1ieYBMZMUEErxEZc9F4tOp7tKp+//gNv6j/hQDVdANhzDln+h7HXULXAVSl3Vylb46WH55M2N7bNsnnmYvDMpNurHlX9N11GaClN/AyplgULimm2rz5Z/aO2OtKF9vfLN3euDoqMlo7hEtSIOUGoIW0iCNO5LEi6ntX21q5oG4QZtPMv3Ym4+Fc3tt/Tiw/xx5Vw1LPh5f+YxYBdWvhmTZUSTc05OubwO2Vulne8rOhR3fAyqstpMbQE3WiBkG9ZMrKuQIw2TJEydxzLc+oUy5tQ1xz/NnrOCjkjK7PF2ziC9nAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=calian.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LOw4HfJL00bod9niBWoVoNcTfN0Shjmnoai+M1rf5w=;
 b=TvXHXrl3Z+qgtU8YM+BC8tAdM2SxS1/JlMA8FMKUmdyh55AQxf9f3TsZ8sZpOrJku6VOum1jObnqzJHF+T2mQEwqFCl/IbllSsuuwmNZrgWxucYTDAeZnNqWrauU1FAfveowimWso/ZxsG0ro88LX6AEJ/4KPnUCMQbKyV9h4Oo=
Received: from DM5PR05CA0006.namprd05.prod.outlook.com (2603:10b6:3:d4::16) by
 CO1PR02MB8537.namprd02.prod.outlook.com (2603:10b6:303:158::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 07:54:48 +0000
Received: from DM3NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:d4:cafe::8e) by DM5PR05CA0006.outlook.office365.com
 (2603:10b6:3:d4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.8 via Frontend
 Transport; Fri, 21 Jan 2022 07:54:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT049.mail.protection.outlook.com (10.13.5.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.8 via Frontend Transport; Fri, 21 Jan 2022 07:54:48 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 20 Jan 2022 23:54:47 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 20 Jan 2022 23:54:47 -0800
Envelope-to: robert.hancock@calian.com,
 linux-usb@vger.kernel.org,
 balbi@kernel.org,
 gregkh@linuxfoundation.org,
 sean.anderson@seco.com
Received: from [10.254.241.49] (port=58518)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1nAokx-000Cu8-Gz; Thu, 20 Jan 2022 23:54:47 -0800
Message-ID: <4d2bd8df-3d5f-47e3-0882-b1f566ad3b4e@xilinx.com>
Date:   Fri, 21 Jan 2022 08:54:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 2/2] usb: dwc3: xilinx: Fix error handling when getting
 USB3 PHY
Content-Language: en-US
To:     Robert Hancock <robert.hancock@calian.com>,
        <linux-usb@vger.kernel.org>
CC:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <michal.simek@xilinx.com>, <manish.narani@xilinx.com>,
        <sean.anderson@seco.com>
References: <20220120170818.1311306-1-robert.hancock@calian.com>
 <20220120170818.1311306-3-robert.hancock@calian.com>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <20220120170818.1311306-3-robert.hancock@calian.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c04a9f0-03eb-4e22-9145-08d9dcb34bfd
X-MS-TrafficTypeDiagnostic: CO1PR02MB8537:EE_
X-Microsoft-Antispam-PRVS: <CO1PR02MB8537CA1EB7EDBE246D1C6AFFC65B9@CO1PR02MB8537.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4W2WxKr5ogQqppBv3aSZfavV/nU89KLtGW4dSFE/qdmsi5Nr6haRbrzi95uhmI/HY6A/5yabP5qggbmQZHRYKsCaDm2TN9xsqUHvwNX2HLsf8If3WN4UkwBrdHZafgqbwu4tOyLz1skP11eK898ma1SmR+eWGoi8nI4t0abs/9nccyqdbRpFJD/Rp8FYA8soR+irE3Rwc9at4q4pprdU+5mFxCOT4KHQ2/NLussdvznJU/Yh929P2OIfx3JMvTHJfztTNz0TbY48TU8st6qZvYyVaU9vZ4z/3IbL2MCtW55wHKaLqMhuGXhe1Z0FwZ/l9zmc5p46ug+/APJHy3K41VgzQ3tUNqQwDq/jT7EkkwsyFC3/7mTMkBrf/LIu2EnKYndoTRwP6GsVjCWV45ujseJmJII7cEOlTwVPipLUehDSdf0L7uX3L12XQ1E/M1PNjvqiiCJUQUf5hYnz/DIPwrqm6ybMaH6WdvRXdF38veZBwKNF1ZIjbXH+lapXpWGDbna2TQUqN9nze/tNMOVfwbJXENLHQemtigM4wvje9S4m5QhHCzCuUF3Hm54PANiu3DMsfJ/gThXJEFdxA/rDCbupZJhehb2Y4RiBJuIe8ejD5GcxQJtcWPm9Oq0ILQzaDd/DRcJEDvdzUl4twLdjsL+r32MJn22BxUkqZZeAIP8nscL+UfCetiRc3tHLXDLJHL8LpP4QMIG2jrghI8ik/PsWpl02bHGTQiumxpfi+E5Z9K02tN+dsPy6831MFJ0q55o/9RvyuzcKH+GjuYToxg==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(31696002)(9786002)(70586007)(47076005)(316002)(5660300002)(31686004)(356005)(8676002)(186003)(36756003)(70206006)(54906003)(4326008)(110136005)(53546011)(8936002)(82310400004)(2906002)(44832011)(508600001)(426003)(26005)(336012)(7636003)(83380400001)(2616005)(36860700001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 07:54:48.0864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c04a9f0-03eb-4e22-9145-08d9dcb34bfd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8537
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 1/20/22 18:08, Robert Hancock wrote:
> The code that looked up the USB3 PHY was ignoring all errors other than
> EPROBE_DEFER in an attempt to handle the PHY not being present. Fix and
> simplify the code by using devm_phy_optional_get and dev_err_probe so
> that a missing PHY is not treated as an error and unexpected errors
> are handled properly.
> 
> Fixes: 84770f028fab ("usb: dwc3: Add driver for Xilinx platforms")
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---
>   drivers/usb/dwc3/dwc3-xilinx.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
> index 3bc035376394..3b16e7610009 100644
> --- a/drivers/usb/dwc3/dwc3-xilinx.c
> +++ b/drivers/usb/dwc3/dwc3-xilinx.c
> @@ -102,12 +102,12 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
>   	int			ret;
>   	u32			reg;
>   
> -	usb3_phy = devm_phy_get(dev, "usb3-phy");
> -	if (PTR_ERR(usb3_phy) == -EPROBE_DEFER) {
> -		ret = -EPROBE_DEFER;
> +	usb3_phy = devm_phy_optional_get(dev, "usb3-phy");
> +	if (IS_ERR(usb3_phy)) {
> +		ret = PTR_ERR(usb3_phy);
> +		dev_err_probe(dev, ret,
> +			      "failed to get USB3 PHY\n");

nit: Doesn't it fit to one line?

M
