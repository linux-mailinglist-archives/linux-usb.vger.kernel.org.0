Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18B36633850
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 10:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232875AbiKVJZ3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 04:25:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232675AbiKVJZZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 04:25:25 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2050.outbound.protection.outlook.com [40.107.20.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 220C949B74
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 01:25:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hG9B1KOPE8dS5YIyGww0gUR8OC+UOKH4iJVjhXFb+PI9y352dBFbBILIr0jpAoaXy8HP3BO4BHVIH5+XBtWl7wuPFWPpYptm9mZrOuGIx0sXKAnERNFSaMnBqqV+Dp0imW4r6dSmjyOymqp/0TMfeqMsdyWbXYL+mJFNfNBx3R5cSAC1MaNRIegIaWkozUvez3QB+n24MNmxdDN/fziXkMeVr0rY4CQZKG69UcRFi4ybNJv5guMinkY4wuy8uHJPvKpHnaCvBNYEfagjssGFJ3A4LlDoCamv+1X9OIVV1kvjSwJjWcg5I5vjow0i50Dqw+ohUHXKy9n9auu5UYIvTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOz4acpXqX9jSCqogHzCUQrxWAyul9kYP96wUQ1kzwM=;
 b=JEhC5+Nzdqd+QK9kOpxb3/9AyUv5hDzGT25HWHmNeZkgdm9hzBfEaGr03L6skzTmlo+pL6AQXNOCtAam+Bwu2yrNchaiVn+SaYvcjuzrIxQyVLGMO0c0gCUN/FHSLfqQFnl+VmEroOrldXOKM+5s8yWX+gFZ5Xf5+z25BQkWUBl1CYNvaxur/BHP9nTJM/fIiLHdpiFCIYF2ca7140bZTSlWBNoxHPRmQtCuXCtZiRj3rL6jOaEOdjd0O2bO7ep3TNAugnErJMIICb7YMpE3nz6KyQPcJ+JvKFLvDJvP/tGcEZWvVOncwxPLYv+TzgoIwH4t/FaWPpJWYPYukjmozg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOz4acpXqX9jSCqogHzCUQrxWAyul9kYP96wUQ1kzwM=;
 b=QTmpcgxuip91eQHycoCdH5poc+t9sHiWa0KYR5mEEyqIL9n9MZV/V/hoUhJ9zjmkbItQYDDi7FIW9OTdRo5Ouom7344uWWZSXUejQgIH/abQTMTX3KGRO1xU/ZkQIfRvJVB3aeOoAce4iDon/J33fHP1j16bRdUtvB9staf/iPzmonUoiaPBYuh1OhylA3HyJya6lDdMvWW1QNY3wDiK7yrmcmicwGfvwQibrStWhRCyoXfn514YMeXuzI2pXER/O/WQmwNXFM8DMz8k+3eIhM5KwZNXyTrin9GvgGvOFxWQeSh9sQEuUWZvg+EMX7lgaD2bmSpajRr+3HWbwxYxSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by DB9PR04MB9578.eurprd04.prod.outlook.com (2603:10a6:10:305::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Tue, 22 Nov
 2022 09:25:20 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::5b88:33f4:2e44:b21f]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::5b88:33f4:2e44:b21f%3]) with mapi id 15.20.5813.018; Tue, 22 Nov 2022
 09:25:20 +0000
Message-ID: <2d43bfb3-0017-1f64-dae6-02b8bf2adb65@suse.com>
Date:   Tue, 22 Nov 2022 10:25:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: RK3308: ACM serial over USB sporadically not started
Content-Language: en-US
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org
References: <20221122094509.37f99121@booty>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20221122094509.37f99121@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::12) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|DB9PR04MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: 67b5b02a-164a-4bf9-4626-08dacc6b7993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fVTB/Rl6fxyfSO3ZGflwGjwgQGDn6V/EbgSfytNc641V2oLOUodYORQQ9HUSzTUUywFfVjR/ui9QBXBtNKdYCKIaUKJ+VyscaxM3HleZBNnAV4nJ+TAjwx3yMrpv+Jnls5n79gy1rox+Sso058Q9DX5BthmB8F41Y3FOsETfoZTIdlbEcWFBSW9nG0DtYU0JMqbj7p7yWZb9DbNwXdkWVY0wxIvrMJ5lvVBODE5JRPmz4nrDBF3FOGTx8HqBiuEXKAmu+SXPw42KDgDG7wPYpG6FEpypjcTGZNcBvYLSTfVM/iK4MbEi4p65HPeLKphfHs8+rU6/TwND5JzOjqVSO4HK4ukSbVJuVMzB89REDqv39sik/yBfQTzQraQGqONdQAWGIxsq3fWOcUMPSrvLzwuJjCKlVQUz2JwbdQfhfV3Q1Fnm1wA85MJxb9r+92vqVpemiuH7YC47b5scsuicm9VyT1EIRm4XtbAAqFvlQmeuyTX4LcA+daBDR/qrFb0GpyQ9x3SxwUKBmlojNGNMIeUAbLtkbmMfKkq+CI0faZ67dNNqWCpDTR9lw6cA5i8QsnHQtYbn8pDx81+uDov/ErTNNSdjEbebVfF2OQh5wIiED2oydfufXqc6yWaXAhaFHrSNBn+ZKW+sP7fxUEpevjQeeDrAuQFKz7je0cfClvccYqLNEXqdsNYy0xlIBwBi7vXIXZ7hj2/CDQqO//cC9npSPcov4YmJvc+5w3duRRQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199015)(36756003)(31686004)(31696002)(86362001)(41300700001)(5660300002)(38100700002)(83380400001)(53546011)(6506007)(478600001)(6512007)(6486002)(66556008)(66476007)(66946007)(8936002)(8676002)(316002)(2906002)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFA3d2wzK3hSTS9PRkcwTlNTY2FRY1Y3NUV2WGRxdlRySEg3Q2Z0MnZNVVVy?=
 =?utf-8?B?SGhLS2kzeDdtNCtmQVJEQXM1QUpsdG0wRnltdkF0amp5Qi96bmIzT00xamlV?=
 =?utf-8?B?cDJhekZXOWxscU9tWTMxSkV0SlJnK09XN25lcFBHY0Y1VTFEaDl0R0lHRHVp?=
 =?utf-8?B?Snl2bDlmdUU2UzBqQlVmcUlPOUNsUFdMang4OEVFZ3h2MkQwYy82Y0I5K21H?=
 =?utf-8?B?cGErK2RvNzNxUUozNXZEQ0VUNW10U3hwekFSYnZuV090K05yV01FR0ZUeWlt?=
 =?utf-8?B?b28xZ1dkOS83T1hOdVZEU1hXU1JCZFp2ckxYcTdCRVk5Nk0vRDBaUy9CYXk0?=
 =?utf-8?B?T3g1Wm1JbC9YdEkzZ2tRZEQ2c0ZyVE1hU0EzUHFHS2pYTHhybGQ5U1ZCZDNW?=
 =?utf-8?B?aGRhWlRObjNzY0VGWXE1MWhTU1VNbTZCa1cxaWUxZmJ5ZUlLT1BoN2JPMFBa?=
 =?utf-8?B?dG16S2tycDJYN0xxSEhYYTVwYlUzSjFqSDRFMW0reWIrZlZkTm5IY0pkcCtL?=
 =?utf-8?B?a1JkODlRZ3VVUDA2ZTVkNC93YXg4K0t1Rmo0OHUzM0hLS3djU0MyZUV5MnQ2?=
 =?utf-8?B?Z1JDMUNmZkhvRTlZbGw0SVltTlRRdXR6cGF3ZThRNVdlSXZNbjFUREQxZkdp?=
 =?utf-8?B?YlM0SVhnM2paTGNaQVE2NHdxNGQ3M0F4ei85MnZNMytwNVlPejVpeklXRjh3?=
 =?utf-8?B?RFhkbjM2ektHc1U2TUlsdFAwalhRUklVNkI0U2lXSEl6WW0rOUZzeEJWNkdt?=
 =?utf-8?B?MSthN2dLOVk4a2lYQTZlRUF0NVUwdVlyWXkrVWl0c2dBUnhhOVJ3L0U1ektT?=
 =?utf-8?B?UE00VTVkNW1oVVVudmxuMjlmZjlEdkplWW9mT0FmUU04RExnRDZlUklQTnJY?=
 =?utf-8?B?b1Z1aHJaWm9OMDdOaG9MNUg1T0xuWlFEdFlGcTk3QU5COEhpUG9hZC81enh5?=
 =?utf-8?B?dHBlSUE0a2ROWDVrY3ZrWlpkd0RmQkVTN2xmRWxMeTJNaEpJaFVDK2JMK0tK?=
 =?utf-8?B?Z2VIQW0zbG0vWEsweFM0dkljeENtS0swWlcvVzlLaytvdkZ5ZUdHd01Zd2I5?=
 =?utf-8?B?NTVVSlZPNk9ERDg5OGdaa0cwdXBGcUVsMEpHZzNPSDdBY2xmUXhid3JieEhq?=
 =?utf-8?B?TTlHbGdiRDVBN2J2WW1yRjZZSUc1VUg2MEg4SE8rZFhsS3pNZXhFMTkrV2Jo?=
 =?utf-8?B?MTE4eVpMNEVxYlNjMU84TmZQSnBqUG0xQkZycnJEWWhjTDhWUlVGUno5aXVz?=
 =?utf-8?B?WW5sakd1T3llZkFLZWNWZGVTY2N3d2J5dE5NVHZsQlRQU2hKbHpyMjN2bWtC?=
 =?utf-8?B?S1BuZERiTGFORG9XdFMyYmkrbWtYOFZBc21la1dha1BuWjNjWXRmSkUwTlRk?=
 =?utf-8?B?by9lL2gzVzJVMXl6L2RKUGNPZEN3SUJrMzlkaVRNYjZjVUIrdGlpT1BmQUx4?=
 =?utf-8?B?dVBCQVQrSCtLMW5nNmV4amhXMHJxSHYrYkRjVmJhL3ZXU1AwbC9iNk50VHBx?=
 =?utf-8?B?L0h3Z01GMDV1RGhGZERuRmhOamFydkJaNjhrL255b3R3QXNvRlF4VTJNUnZZ?=
 =?utf-8?B?WlBWZEdxRUFlL2pzRXNxZm5sK1RnVXUzUkVjZUJLQjcyUlVMeWRYbkhvaHQw?=
 =?utf-8?B?aFlQT0o3RVFXNC8yTWZwUHhvbXcwODB5eFZtb2V1K0JXNTg1SU5sZ1RYUGxv?=
 =?utf-8?B?OVd2eVNlYlNLZ0kyV21INStpOXpEdjB4ckZzcEFGWFNDeDJwY2loRFBpVk1E?=
 =?utf-8?B?TWVFMlg0c0JrNzliaEpKUlpLWjR6NmdYZERRRnFzUlBVaEs4aW1ITU10Sndv?=
 =?utf-8?B?WG9oWmxVR0J5MGFtckE3QjV4TUhoQjFjaHVuOC9CY1VjSHAycFl5RDYrbHpx?=
 =?utf-8?B?UTluNENidnN5WTQxenpGcmdONG5mM24wMDZVOWVyMTN4VHplNTk1alJ6RE9m?=
 =?utf-8?B?MnVTUjlwSlFvSzAyV2tGeG14eWp0TlFjSTNJQWRwS1BrVndTenRSdHdsTG9X?=
 =?utf-8?B?VXlGaWJRVnJEU3E3NVlmaTY0dlhuZDZhZlByOGY5UnZ4M0hnL1Mzc2hPeGEw?=
 =?utf-8?B?VTdxRWdtUFIvekU5WXI4MDM0aEZQczBZcS8yL1BNdDg4cmtQS3dYd21LTzlu?=
 =?utf-8?B?dHNRTVRxc3ZoMitUNHV5bXA2TTBxbU1KNTNybTI0b1RNSk5EdWYzOCtWT2Zu?=
 =?utf-8?Q?aG8fQ//zRjZ8HZ4AqxLz4Yd3HI8p3YqcOrXufv46uIDK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b5b02a-164a-4bf9-4626-08dacc6b7993
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 09:25:20.4451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8hpbCSM/QKIaeHr1nLqI9/7d0tATgcZkn2oE/lNZH5JQgp1FOcFRM7ZqWzIhhWalEJYcWU5Z1OqLVWcCJZiuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9578
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 22.11.22 09:45, Luca Ceresoli wrote:
> Hello,
> 
> I have set up Serial over USB gadget (ACM CDC) on a RK3308, which works
> fine most times but sporadically (10~20% of the times) does not work,
> failing to set up ttyACM0 on the host side.
> 
> Target hardware: Rock Pi S (RK3308).
> Software used on target: Linux v6.1-rc6 (eb7081409f94a9a8608).
> Device tree: rk3308-rock-pi-s.dtb from mainline, unmodified.
> 
> Relevant Kconfig options:
> 
> CONFIG_USB=y
> CONFIG_USB_EHCI_HCD=y
> CONFIG_USB_EHCI_HCD_PLATFORM=y
> CONFIG_USB_OHCI_HCD=y
> CONFIG_USB_OHCI_HCD_PLATFORM=y
> CONFIG_USB_DWC2=y
> CONFIG_USB_DWC2_PERIPHERAL=y
> CONFIG_USB_DWC2_DEBUG=y
> CONFIG_USB_DWC2_TRACK_MISSED_SOFS=y
> CONFIG_USB_GADGET=y
> CONFIG_USB_GADGET_DEBUG=y
> CONFIG_USB_GADGET_DEBUG_FILES=y
> CONFIG_USB_GADGET_DEBUG_FS=y
> CONFIG_USB_G_SERIAL=y
> 
> CONFIG_USB_LIBCOMPOSITE=y
> CONFIG_USB_F_ACM=y
> CONFIG_USB_U_SERIAL=y
> CONFIG_USB_F_SERIAL=y
> CONFIG_USB_F_OBEX=y
> # CONFIG_USB_CONFIGFS is not set
> 
> CONFIG_EXTCON=y
> CONFIG_PHY_ROCKCHIP_INNO_USB2=y
> CONFIG_PHY_ROCKCHIP_USB=y
> 
> Connections:
> - USB-C to USB-C cable connecting PC and target for both USB
>    gadget and target power
> - Ethernet cable
> - UART TX pin (GND not connected, adds booting troubles)
> 

> [    0.598921] dwc2 ff400000.usb: gintsts=04008820  gintmsk=d88c3cc4
> [    0.601050] dwc2 ff400000.usb: dwc2_handle_usb_suspend_intr: DSTS=0x400003
> [    0.602415] dwc2 ff400000.usb: DSTS.Suspend Status=1 HWCFG4.Power Optimize=1 HWCFG4.Hibernation=0
> [    0.602431] dwc2 ff400000.usb: ignore suspend request before enumeration

Oddity

> [    0.602445] dwc2 ff400000.usb: dwc2_hsotg_irq: 04008020 00000000 (d88c3cc4) retry 8

> I suspect a concurrency issue during initialization, but I don't know
> where to investigate further.

Try booting with "usbcore.autosuspend=-1" on the host side.

	Regards
		Oliver

