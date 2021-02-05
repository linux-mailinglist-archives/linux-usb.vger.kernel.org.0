Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8E2310AAB
	for <lists+linux-usb@lfdr.de>; Fri,  5 Feb 2021 12:54:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbhBELxs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Feb 2021 06:53:48 -0500
Received: from mail-eopbgr760079.outbound.protection.outlook.com ([40.107.76.79]:52129
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232008AbhBELvo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Feb 2021 06:51:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpxfK7Izd7LMKvILaGm7Daqf0Ipg3wU/8NVfhzpsByqrwWYOF7ZXI1Hiw17nDb0lak/vDkO/1o4qRWOv8xRi84HIT/mpLTpBpCgP4vKAr9/w3zZ30cPlcNAcxBfO0fJINgYxjta/q67OqWAuSr+ZaclgP6cChXCmBZ+CK4W+NJktDMhFPsi0WanSibew3Q/BtdDUk9DcnNjZdh5flWs0wPDk1WBW4/iZIHbWCNVjndKKC0DfxLYDcUaZ0+YCEaKxOHMivKGe9ZKidYObwzkOsOazTbFs2eMPuHBT2LwLiu0ZZts21F91c3LxbZEW5QeQKCmT7pcfcTMI8DfiaSMKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuW55YENvMU+sRFMrCxLtzUVvSJysd2Zjocpzfae7mQ=;
 b=SgPQCaVxJOvjByRQnFAFMEEFZuV54ARXlONXgaqTT6iiza5w2DhqhbqPLzWd2Q9eSQyAxLOx0LBaSsbJUYpCRJNlzCI9xqSaX6+gV4KZJz6c0cNhIorzWdi58/6DXB4P0twrBjGVRKVprddnM8qjels7945pyHIeJHDIHxPAiKk+rVJZh5pheLew8oTCdq6uFjLd9Lnbg78J6cOAo8axVP0Lq8OPQSGuwOpXKdjDwoT26fAl0kOQJ7ZNAHiOa+k0bTxT2Z4O8krw82vIj5D4+UbEC5N47J0kLj5xv+bIoCdQLAPoatztQ6oocASD7/wCTivEXDRJUEVDfL23xt6+2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuW55YENvMU+sRFMrCxLtzUVvSJysd2Zjocpzfae7mQ=;
 b=Vqq4qoIizzpbxcMQAuJdvj+Kewqbra78eB3aNDtWr8gNbw9j98qekh0XRmY0aw9dtY4HgAgNzg4iYniHqXR/TmfvdKXbq8iOCL07N7HZLKPUy2dlNfqv/eNDRtBzXInKdg6TmKXbfka6SeMBI56PrWt5P/BDiKwT63HjCvlh5Ss=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2495.namprd12.prod.outlook.com (2603:10b6:802:32::17)
 by SA0PR12MB4416.namprd12.prod.outlook.com (2603:10b6:806:99::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Fri, 5 Feb
 2021 11:50:56 +0000
Received: from SN1PR12MB2495.namprd12.prod.outlook.com
 ([fe80::319c:4e6a:99f1:e451]) by SN1PR12MB2495.namprd12.prod.outlook.com
 ([fe80::319c:4e6a:99f1:e451%3]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 11:50:56 +0000
Subject: Re: [PATCH] usb: pci-quirks: disable D3cold on xhci suspend for
 s2idle
To:     Prike Liang <Prike.Liang@amd.com>, linux-usb@vger.kernel.org
Cc:     greg@kroah.com, mathias.nyman@intel.com, Alexander.Deucher@amd.com,
        Ramakanth.Akkenepalli@amd.com, Jack.Xie@amd.com
References: <1612524764-6496-1-git-send-email-Prike.Liang@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Message-ID: <5ae0f2ab-3723-7066-015c-42824388f9b9@amd.com>
Date:   Fri, 5 Feb 2021 17:20:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <1612524764-6496-1-git-send-email-Prike.Liang@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: PN2PR01CA0141.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::26) To SN1PR12MB2495.namprd12.prod.outlook.com
 (2603:10b6:802:32::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.89.180] (165.204.159.242) by PN2PR01CA0141.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:6::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend Transport; Fri, 5 Feb 2021 11:50:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9910ee6c-2831-4b13-b89b-08d8c9cc4c14
X-MS-TrafficTypeDiagnostic: SA0PR12MB4416:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4416DA58EF6490B5D6953D0C9AB29@SA0PR12MB4416.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ie2j2eN5k3PgjgjmWQm+DFeeHDZlWWmsfiDMHCJRdoqpOHUKxa8z5OnhK/atSr3+SRzMNxZMHd14u/teN+9vgmCjZnxkesTRcDt8Wh8Gdk0n1+ZqzrS50hwPvl3CFZkH0btwZZsTpYK6AmzPkDMTSB3VNbObRV5gk/wxVGL/czrtOkW04oJ/wVJdAoB1K1c13m6DSDh44SitOj6hcVBPQbgI2s+yMHkpnwrge8J90pYxWKLPYlrZBAgN9vfYXX4gaUufbj0FYflfWDMt1I/n0KHsiNh5swuIMZ0XSAtYLh04AVr0ZZ5H/38I/DX2FFnZcZhtMuCxqC0e3pFK3sxh0J+Pf0pBTZsDpQBHO29QxCIVz3ZcGzWE3LzmDGLHKmFPCpiSv2Wz6WyB7WEbL2nycJN0meu2lrDILLO3H3GSZcT5MGPCKVEemk/R6Le+sGucJYis4Sp9PDd31OFHILkfRjG5Vk7mjsGaM0KndCl4N5q5PJDdnjH64Mi/LMFEnb8jbbxYsEAp5F4Sr57hKNoi5nk4bWioAiseDozdZoPaHXiSVJo9fPYGt27rz+qRIzx7ZLuNl7omo+Z0x+Ox5ubuRlBDChlXDuezzRudj4GUxQypFv3QgT2Y3PpYcQQCENXOKkpWnvPMjPPBZrqHc3PbiXr02FvZTrLHSfJ/NJvGKfE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2495.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(956004)(2906002)(186003)(6486002)(16576012)(66476007)(66556008)(31696002)(31686004)(316002)(16526019)(83380400001)(53546011)(2616005)(478600001)(26005)(66946007)(8936002)(6666004)(52116002)(5660300002)(86362001)(4326008)(36756003)(8676002)(403724002)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?azVRNW05UFBtdnJJcU9tTDI0cTVHV1VibVRrZkErNUQvS1o2Z0ljNFoyOXBQ?=
 =?utf-8?B?dGp5d2RxWlV6QU5GZFFqcHdxbVFsZ0VTYnlXU25scEkxSTJHZ2R4Z2NyRUNm?=
 =?utf-8?B?RlR3bnBsZVJ3WjlzUmFLZllEVnY0dVppYU5VVkczUmJZVU1yejJUZU94eTJG?=
 =?utf-8?B?MWYzakQxN1JKOTdrRlNpem5XZzd2SytydGJhWXpUK2UvU3RWb3NOenRyWFVl?=
 =?utf-8?B?VVJKRzBSOUhKTXZOZmp3VkV6cUhqbGNDUTRYRzcrYnYxYURnNENkSkszajFB?=
 =?utf-8?B?TjRTdGJQOFVWS3FQdUdDTnhlYU0vYzZZODY0K2NaeG1WU1cvaEI2TmYxVk9h?=
 =?utf-8?B?azg3QzlvWjNHeEhTUC96NmpkcERac0YrajRiVlJPeHdKcUNrRkZpRHBhL3pl?=
 =?utf-8?B?WHRLd3hOdVd5VFJLWis4SW1NZ1d2eU9PeTduSTgxNWp0M3ErbkE4eDlXcUw5?=
 =?utf-8?B?d3ZmbVR0RUVVQWhDcmdvWDNFVWhDWkUzYm9RTkg0ZEF2K3NENldjTGFLR2Zi?=
 =?utf-8?B?WEw1cUV5Snl5Vm1rcHZGUVN6T2lsZmhUeWJESXFmbnlEaHhoYmxsQURhYi8y?=
 =?utf-8?B?SEZzRDdpV2dzelpOY2grcXVOSnNjMXJuS2pMeWlDb00rdWpRdS9GL1FKRzFD?=
 =?utf-8?B?SzlHYWtLVS8ybEVTV0tCMG1zeG1ZL3ZYdlBHQXQ1WGZJYW1VdWIvU1N4VnFv?=
 =?utf-8?B?eG9sb2FlOEpDRytzd2t1eDhReEhMSlJMWUVCTkxhUVJVbmwyZjA3bWltMzlX?=
 =?utf-8?B?UGRORFBhSkI3aHZJdnlVRnRRWnh4NFd6aUl4NlEzUlNWdzgybDF2ZTdQZCti?=
 =?utf-8?B?YVVQK1VESzh6Z2d5cWVUTjNLcGV6eGNXMzF2YWhBdWkzTWNQRmZWTUJuZnU2?=
 =?utf-8?B?SEp4VTlON3QzVlVlaGt4aFhZeDdoM3ZlSlNSdmNoRjN3NU5nVXF4L2ZqWkY1?=
 =?utf-8?B?aGo4eGFYSVFwRUk3bEFSeTBPNXcvRTBpSmxrd0ZtOG4vb3BuZ2RtR291S2Rt?=
 =?utf-8?B?R2w0VDFzUUJCNXZrbGZsTTBUZ2hPZjEwKy92S1RTQUxITXFuTGlLbXVpVDE4?=
 =?utf-8?B?MGJmM3E2MnFQN3N2R2UzcEpmOENhT0FmSEV0aVNVZXpRYW1FcFhrb3BkcHJ3?=
 =?utf-8?B?SFY1dE5Ua251UmdCVFhjQzFhYTl1b1Z0V3NmSXo1S2JWMU53Q1RGVEFDa3I2?=
 =?utf-8?B?NnhzWXJtUFBYL0REMVBzT1Btai93WW9HaGRjS21yZVRUR21zZEF5RXdYSFFx?=
 =?utf-8?B?eThlai9ONmZGSGFMNXpaRUpBUU5uclBWei9VMlovOU5uR3JGdk4zeTFYSmha?=
 =?utf-8?B?VG5IVXBQVUQ3elI5WGpyWnJ1ZWtlbGkrYU5xM1ZvRGFLN0dSckVFV1I0MlVN?=
 =?utf-8?B?cFJwclI3aFM3SUwyK0RKOEx5MFBmcVR3SEtrd1BCb0pxMDA2WDRZNDVUeHlm?=
 =?utf-8?B?MmN0R3lLd0hIOVljcGQwUS9OZW93NStTVlZoRmpNUGh4aHEwMjh1Q2JLRWNI?=
 =?utf-8?B?OVRsaXh3TTE4M1E1VDJZcEQ1ZkQ0OXpwY3MyVmlqNXQ0TjZvY290bVhYeU5L?=
 =?utf-8?B?amRIdDVSOCtqKzd4ays4UW1iR3VhTnhoMnlXOGo4SEhpOUxobDlZclVjVDlq?=
 =?utf-8?B?T3FOcE4vUVdyS0t0aXc1Sm4zMHJwaTBKVE1aOGJoYm80ZjBYNEovWUJka294?=
 =?utf-8?B?K25tNjFVK3NnZm1CMjlORGRmMFVGSEI1VUU0dFRWWEJ6UW1MSW5Xb2EyUXRk?=
 =?utf-8?B?TXowUVJwbWhmUCtvLytSNXFWRDlqS1pWdVFxdU45bytrTUdHR3p3c2VJcnFs?=
 =?utf-8?B?UkJZRTNYeEwvMU9qVEd2UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9910ee6c-2831-4b13-b89b-08d8c9cc4c14
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 11:50:56.2491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pUVrdxvXC6DfvJJOGUqx88HZUG9F99E5cGNF3LzHuQwTrOA+89nRz9GgNuuSnOv4vhEVnNhTvBOvdVy6Nt74XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4416
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This has to be with the patch revision number, i.e. [PATCH v2] , [PATCH v3] etc.

On 2/5/2021 5:02 PM, Prike Liang wrote:
> The XHCI is required enter D3hot rather than D3cold for AMD s2idle solution.
> Otherwise, the 'Controller Not Ready' (CNR) bit not being cleared by host
> in resume and eventually result in xhci resume failed in s2idle wakeup period.
> 
> Signed-off-by: Prike Liang <Prike.Liang@amd.com>
> ---
>  drivers/usb/host/xhci-pci.c | 6 +++++-
>  drivers/usb/host/xhci.h     | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 3feaafe..8ecde66 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -170,6 +170,10 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>  		(pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_1)))
>  		xhci->quirks |= XHCI_U2_DISABLE_WAKE;
>  
> +	if (pdev->vendor == PCI_VENDOR_ID_AMD &&
> +		pdev->device == 0x1639)
> +		xhci->quirks |= XHCI_AMD_S2IDL_SUPPORT_QUIRK;
> +
>  	if (pdev->vendor == PCI_VENDOR_ID_INTEL) {
>  		xhci->quirks |= XHCI_LPM_SUPPORT;
>  		xhci->quirks |= XHCI_INTEL_HOST;
> @@ -500,7 +504,7 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
>  	 * Systems with the TI redriver that loses port status change events
>  	 * need to have the registers polled during D3, so avoid D3cold.
>  	 */
> -	if (xhci->quirks & XHCI_COMP_MODE_QUIRK)
> +	if (xhci->quirks & (XHCI_COMP_MODE_QUIRK | XHCI_AMD_S2IDL_SUPPORT_QUIRK))
>  		pci_d3cold_disable(pdev);
>  
>  	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index ea1754f..fafa044 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1874,6 +1874,7 @@ struct xhci_hcd {
>  #define XHCI_RESET_PLL_ON_DISCONNECT	BIT_ULL(34)
>  #define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
>  #define XHCI_RENESAS_FW_QUIRK	BIT_ULL(36)
> +#define XHCI_AMD_S2IDL_SUPPORT_QUIRK   BIT_ULL(37)

Why don't we keep it the fullname i.e. XHCI_AMD_S2IDLE_SUPPORT_QUIRK
instead of XHCI_AMD_S2IDL_SUPPORT_QUIRK, likewise at all places?

-Shyam
