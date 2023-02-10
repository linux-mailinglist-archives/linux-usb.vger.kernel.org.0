Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91BC9692436
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 18:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232650AbjBJROG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 12:14:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232399AbjBJROE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 12:14:04 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C580978D6E
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 09:13:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THuGx5+clx0EM/UEHNBYBOi9eZLg8OOgk0RR7j+/3NwYeL+OacxKjv2Iz+FzNQNzZ8+w/nSPsLYKD/AuGi7FJYhZrqeoWMFZH55yQrTH5ttNxvsfWy7NK6VCHsYyABeinko/rXi9P1dsEl2vtUKgPKdulaVhkPnWF9JmeRYh01xyraTldQXhsxNJDLx5kodHeXXanLHLAPZYei/h+1MLOzvy70348KrWFRPE3HIX1f1k+NmGT4dc7w7RU0ZkghCiqwe4kzfRZ5b8zD4K4y+L+2iauNBFDMuAb/X+N6/TpHLzsa2G99fy/k0k0jUF8tiHf+Ikd3eDsaJOhi6Q6FO6QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKk42QPMulxKrFshJz1JlsOxwVdAyHEUxrXfZZj68hQ=;
 b=cSpzIeBE4oFRCPd99r9CErhmh7+sra6BaB93dwY2zsUIA0dsvpaAxKxV7NbRnoqafW35pgttKQtOTKbSsGo50m7pPtk8dfTp4y98vaHBtxf8hurKvn/BYoyXZqxHt/i31mqGVxsGRS0fzYA4YCcDLQAs5kTXPhUYjc1m8yWiNDjRg4+o8k7+LDsduUpVikBAD52isS9oTiyG1pqY5w9PWnzAwLOJPe0YdWUuKwjG2GA7WTlOR8LyXK+zCqa5bNbYx3M08ev6DsM5KfNeaPcIfxwRMDpegOTy0LkFAHwkBXWfw7ucCgsLEPMeDzowqQGj00z+gqaipwCW0/AGB4p6Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKk42QPMulxKrFshJz1JlsOxwVdAyHEUxrXfZZj68hQ=;
 b=i6jTxVKtgsdXd0QRjg9jFK6Xi9BwCdw/pqtGRHIxtb6MCsFY1oxesaqiBWcmKUI5HScoeOiu/gRJpngYjEBvy9SJT43gD87D7YMOUMaQTtwihgu5tGzYK0l3HGZaFvjIYTfmGomlNdTjFTowvwSACypUr2WTb5nNjiMKOBL7d+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB6789.namprd12.prod.outlook.com (2603:10b6:806:26b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 17:13:24 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c%6]) with mapi id 15.20.6086.017; Fri, 10 Feb 2023
 17:13:24 +0000
Message-ID: <6fdcb077-1ef6-6bc5-5bbc-81daee988c23@amd.com>
Date:   Fri, 10 Feb 2023 11:13:21 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] thunderbolt: Disable CLx state for AMD Yellow Carp and
 Pink Sardine
Content-Language: en-US
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>,
        mika.westerberg@linux.intel.com, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com
Cc:     Basavaraj.Natikar@amd.com, linux-usb@vger.kernel.org
References: <1676043287-119829-1-git-send-email-Sanju.Mehta@amd.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <1676043287-119829-1-git-send-email-Sanju.Mehta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:610:11a::7) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SN7PR12MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fa3590f-dc8f-47ae-99b3-08db0b8a1e1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q8U5+scbQf7iJVi/PRtGLT8xPsEuG0ihOvMbeUODalU/xbLYyJb0cJTKNKhYdJ38/U8O84Txxcg2Rw6q3UgB+nNMcUSKycW72tsHKVAob5pwlkTeCMvPDOfysmj8Y+4oeLdlulUGP7nmhoS6D5zXXYxSqyNXdeLSwNc1+kZGSQiNE362N+DTXVLWB0RfyfUW7b4vyKLZFHH9VxV8W5g/XN23snLq8sFOnUXSs2TEK3TdMeQg4aBY+Jxem3c/hi0mrD6G9czCwr0i58BS9lBM6COA+SvbB5zqxW2Svbv/7p7Sy5xpOIX5I7KKD9HomsF/chwEjc448ysVnKr5i8UfKUbRJShMu74J4g6q5I8RV48Svn0xqPXFmsDqObWao5PWKcCTIP3e0Xlz+LuFlSXXXacmXW1H0znxapbueBa/Y1IaOd3QK+j6IcnN4OY3WUhVjYyyFcAN+pRgYP7fAmWHUnoB3BpXCJU2oC4EvJBqQxueDZGaqVer0Svtyv4DnpgQ60bShcwvVMla/BX6TjDvhP6k0MhV6qmMZ5GRmZYSYAgwxnvHO/CYtOSzzX/aLnJYwGxAmsri7Z9ZmcpkZOp60O2mVdzaiLky+VIe4ca4ghVefZ6A68OlmB6Ume8paEn8uXKbVy4HyvyegmjU12SbnDaNwnm+YG6LYWAEr4PEVmUXQUZvC9j3qerdZPD/AtBcYGLPkzI+gaqKtaQoTTdPOLdIKQXQ3Q5W6IGow2PgzF4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199018)(31686004)(186003)(66946007)(8676002)(66476007)(8936002)(6512007)(66556008)(6506007)(4326008)(36756003)(31696002)(86362001)(38100700002)(26005)(5660300002)(2616005)(53546011)(2906002)(478600001)(6486002)(316002)(41300700001)(6666004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnd6RjJuZmpCT0FrTG9pNkgyZUV6b3dCeTVMYlp4STRpODBxck5DU3VOOWhw?=
 =?utf-8?B?NnJYa0xzTUNIU21CdXZXZzFqaHNYYXlXM3Q5b2s2VmpSUGlyTEw3eGhHQUoy?=
 =?utf-8?B?ZXJFeTc3emxLUktpcFdGNGFCb1VzSU1sK3NzbEpMUi9NYmxYUExLaXJCK08y?=
 =?utf-8?B?Z08wYlJHVVdna3JPOGUwOE5yWTk3cHBOaFA5ZUJucVlqRE5Xd0FuallZUGh5?=
 =?utf-8?B?eXRBSDBFWk9HT1BXUVl3N1pOYXIrVTh0cm5JcWROd0FUWVk4RmU2OG1oR0xH?=
 =?utf-8?B?MTM5V2plTG5IZjNvMHYrblNDZkljTGpQSDYrbmVjS2E5RXB6MlhOZ1RTanRK?=
 =?utf-8?B?Yk1EVXExcnZRTW9MZDJPOGdxV1I1TWNjMXRLUmJMdEtqdXBiVE5BM25FMjA5?=
 =?utf-8?B?YnZCS2t0QkR2OUYzQVJ2Wks4YjZ1ZDB2dkFUNmpwdzJLTFh0aDNmbmREVmg0?=
 =?utf-8?B?Z0xnZitDUGREWDFvWW5vMnZoV1JkYndPdHFaWHJrSXBjcENXUGVhTEI0UC82?=
 =?utf-8?B?N0UyUEdVQ0kxVS9sajFsUkpYbWVaT0E5eEZvWHo0WkEzTkVFd1U3OWlHMDBD?=
 =?utf-8?B?MzF1d0NZR1piaWg5Q0xGYjY3L2tqZ1YrbmRGazkxZVNOR1VDamRkTitIdlQ3?=
 =?utf-8?B?SE1qalA5QWpqMnpTNXRKMzBGNzloLzRYRGN4Q1RLQkpGV2E0aElTbzRpUy9s?=
 =?utf-8?B?UHQzVEdZWk94S3JIN1FNcFpNMjVOOWRaSjdqYWFPSnc0UlZDb1JJQmhaS1FO?=
 =?utf-8?B?dzd0SDFNZ0N6MUtLcjVyY3BnbEpoR3NjWlNlcmNiaVpMdklCZTNWOTFOTGc2?=
 =?utf-8?B?dStKWmRSc3ZLTXJNZlArUE9Sb2QzaFB1SGw0STBTSWlDc2lSQWxLSWVlSFpk?=
 =?utf-8?B?elEzUkRSdTJrdWZmTjJncEozU0hVV2wvRUdtSkVMVnB2SUtRV29PRWFxRFpY?=
 =?utf-8?B?ZWMxTzRKSnZDUUxmUmRJZUJ6dHp4ZzJ5cTNyZUk5TXVLc0ZzSlMyL2dkbGRB?=
 =?utf-8?B?a29sYUVVTG1XcWxWV3ZNUlp2SStSajFtdW5EUTFCbzZ5S0JJcjhnOUFtRUtw?=
 =?utf-8?B?U1pzWnhvcE9rdnl5dGVxRXBoNGdPa3ZDWTZNSTRObE1MTUdNU2c1NTVMVXVP?=
 =?utf-8?B?RHhhU1NaS1NsVEhFbWdERXRwaVN2QVpIOFVSblBQMVUwbnNjNXQwcmRKNlpU?=
 =?utf-8?B?Q0tTSmFna1k1TTBlUjJaMzZINEFNTm5scnB3WDFMTXBDcVJPdmU5RWZWZ0l2?=
 =?utf-8?B?bEVlOFZzWHlQaTQzKzUvZG1HNUZFeFBoL3NjL3dxU1hWekMvcGNNZHpUZGdM?=
 =?utf-8?B?TndqWmZwV2NCZVBRVTZMdk9QNXV1RGpORzY4aFUzeFlVSGR2LzU0QkczMHZQ?=
 =?utf-8?B?VnV3K2lUeEpBUzFhUThBaXN4eUtJZ010TXo2dE1icUJKLzZpeXpNSkd0K09E?=
 =?utf-8?B?Q0hsVVFqR3E5VVdIb2tQdGNLZkQxdkEvZWFGanpzajl6OENxM1QydldZdTM1?=
 =?utf-8?B?a3pUV1FJM1Y1T25MTU03VmF2MU9iWndGQkpkWnU0U3Y3bXZ5RFpBd1FCRWx6?=
 =?utf-8?B?NjZmRkZYUGZrOVd0SHBTYkQ0NUs4M0paZkdjUlFuMWlhaG1CNlMvVzFoOHNz?=
 =?utf-8?B?Y2xZRzd0bklQWURaa0F1L1paK01sTTZTSDB5cmU5ZUhpOUF2cThjU2t2RVFt?=
 =?utf-8?B?VDg2K1BCSGZudnFXWmM4bU5veTJZYS9EK2ZqMmoxRnBQUU1yS0t1c1dWaXhi?=
 =?utf-8?B?VFFyTTBUNzBZQ2ZFa3VSbzFveWJYRndHMXpKTktwRFZIc1U5OWRRR21sNDJj?=
 =?utf-8?B?aEpqakMwaGJoWU9RSmFMTkxQZFZ6bXhCS0JIbFB2dlJCSUxzajZQTDRlUXBE?=
 =?utf-8?B?VkhmOHpodGRQTHBRRVRXL0FvZm1lNk9aak1CT1pWU1hHeWF6Rm91VVhydjYv?=
 =?utf-8?B?NHBIamVydXB6VDlnMWdxeTdFdm1aT1Y0ZThTUXh6QzJ1MERINDl3RHp1b01a?=
 =?utf-8?B?enlrMEFRU1J5S09FUnpKS0xIVXlJR0ZGSE04SlJOZHJnOStpTUFoeXdyNzhX?=
 =?utf-8?B?TklyQmF0MFlYcFdkemZ1TW5pdjBEaTZNVWNEVm5lYmZKc1pLSy9INHpkd0JI?=
 =?utf-8?Q?U3ucpz6nFxCNmA1hq1+uSMtR7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa3590f-dc8f-47ae-99b3-08db0b8a1e1a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 17:13:24.3540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3418i9tbErz8KUK66DR0A6JOlf5M4DAfJrJxWnJs1S6viSeyk2IhUBDjbiQfkmlcoM4U89mUsw7V27L6yuWCuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6789
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/10/2023 09:34, Sanjay R Mehta wrote:
> From: Sanjay R Mehta <sanju.mehta@amd.com>
> 
> AMD Yellow Carp and Pink Sardine don't support CLx state,
> hence disabling it.
> 
> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>   drivers/thunderbolt/nhi.h    |  6 ++++++
>   drivers/thunderbolt/quirks.c |  6 ++++++
>   drivers/thunderbolt/tb.h     | 35 ++++++++++++++++++++++++++++++++---
>   3 files changed, 44 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
> index b071802..3d8cfaf 100644
> --- a/drivers/thunderbolt/nhi.h
> +++ b/drivers/thunderbolt/nhi.h
> @@ -87,6 +87,12 @@ extern const struct tb_nhi_ops icl_nhi_ops;
>   #define PCI_DEVICE_ID_INTEL_RPL_NHI0			0xa73e
>   #define PCI_DEVICE_ID_INTEL_RPL_NHI1			0xa76d
>   
> +/* PCI IDs for AMD USB4 controllers */
> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_NHI0		0x162e
> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_NHI1		0x162f
> +#define PCI_DEVICE_ID_AMD_PINK_SARDINE_NHI0		0x1668
> +#define PCI_DEVICE_ID_AMD_PINK_SARDINE_NHI1		0x1669
> +
>   #define PCI_CLASS_SERIAL_USB_USB4			0x0c0340
>   
>   #endif
> diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
> index b5f2ec7..f38db02 100644
> --- a/drivers/thunderbolt/quirks.c
> +++ b/drivers/thunderbolt/quirks.c
> @@ -63,4 +63,10 @@ void tb_check_quirks(struct tb_switch *sw)
>   
>   		q->hook(sw);
>   	}
> +
> +	/*
> +	 * CLx is not supported on AMD USB4 Yellow Carp and Pink Sardine platforms.
> +	 */
> +	if (tb_switch_is_yellow_carp(sw->tb->nhi) || tb_switch_is_pink_sardine(sw->tb->nhi))
> +		sw->quirks |= QUIRK_NO_CLX;

Any particular reason not to use the 'q->hook' approach like the rest of 
the quirks do?

>   }
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index f978697..d7988ad 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -23,6 +23,11 @@
>   #define NVM_MAX_SIZE		SZ_512K
>   #define NVM_DATA_DWORDS		16
>   
> +/* Keep link controller awake during update */
> +#define QUIRK_FORCE_POWER_LINK_CONTROLLER		BIT(0)
> +/* Disable CLx if not supported */
> +#define QUIRK_NO_CLX					BIT(1)
> +
>   /**
>    * struct tb_nvm - Structure holding NVM information
>    * @dev: Owner of the NVM
> @@ -905,6 +910,30 @@ static inline bool tb_switch_is_tiger_lake(const struct tb_switch *sw)
>   	return false;
>   }
>   
> +static inline bool tb_switch_is_yellow_carp(const struct tb_nhi *nhi)
> +{
> +	if (nhi->pdev->vendor == PCI_VENDOR_ID_AMD) {
> +		switch (nhi->pdev->device) {
> +		case PCI_DEVICE_ID_AMD_YELLOW_CARP_NHI0:
> +		case PCI_DEVICE_ID_AMD_YELLOW_CARP_NHI1:
> +			return true;
> +		}
> +	}
> +	return false;
> +}
> +
> +static inline bool tb_switch_is_pink_sardine(const struct tb_nhi *nhi)
> +{
> +	if (nhi->pdev->vendor == PCI_VENDOR_ID_AMD) {
> +		switch (nhi->pdev->device) {
> +		case PCI_DEVICE_ID_AMD_PINK_SARDINE_NHI0:
> +		case PCI_DEVICE_ID_AMD_PINK_SARDINE_NHI1:
> +			return true;
> +		}
> +	}
> +	return false;
> +}
> +
>   /**
>    * tb_switch_is_usb4() - Is the switch USB4 compliant
>    * @sw: Switch to check
> @@ -997,6 +1026,9 @@ static inline bool tb_switch_is_clx_enabled(const struct tb_switch *sw,
>    */
>   static inline bool tb_switch_is_clx_supported(const struct tb_switch *sw)
>   {
> +	if (sw->quirks & QUIRK_NO_CLX)
> +		return false;
> +
>   	return tb_switch_is_usb4(sw) || tb_switch_is_titan_ridge(sw);
>   }
>   
> @@ -1254,9 +1286,6 @@ struct usb4_port *usb4_port_device_add(struct tb_port *port);
>   void usb4_port_device_remove(struct usb4_port *usb4);
>   int usb4_port_device_resume(struct usb4_port *usb4);
>   
> -/* Keep link controller awake during update */
> -#define QUIRK_FORCE_POWER_LINK_CONTROLLER		BIT(0)
> -
>   void tb_check_quirks(struct tb_switch *sw);
>   
>   #ifdef CONFIG_ACPI
> 

