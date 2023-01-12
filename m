Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEBD8667AAA
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jan 2023 17:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233166AbjALQWu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Jan 2023 11:22:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232215AbjALQWN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Jan 2023 11:22:13 -0500
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::60b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF1A93
        for <linux-usb@vger.kernel.org>; Thu, 12 Jan 2023 08:18:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAsHiUsqZvcUmnyY/wovWgwEBPY83Uusy81QTigr2weZwZhmFpbLOgvqnnJ2Nqa9n31BtPOAXfCset76sqXEA50bfrbhIOYZvxfqlHplEL1TN2fXRq9KBKuxTQFVJEiUcuyPUTmJC4707wWsADvMvDR8yMzEClKQ2c8NzcixJMNtBwlZpESisBZ3mbpjYuveTPMok9iQoD3ElMTsfN7SCYFkuTPL3s9piyMgOGoJhtB/6qKTzZPfaQrbDbTprH4oZt0XaNEGDPpX6+63Vf/+6iYCcSMkHLUqylAOy5n9+GeeEMr/VwVPwhxxH8F30aKj58gfXPh9PWWY/g9YqgoExw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2IX67eDsrkwOjLRqLmAsS7GbF9qv8UJMMMZUFVJ5TA=;
 b=lBRROLQWLypia9xlGxFbe+dnRVREPGq8qQHkTTZ41dwCb8ZZAZCLZqG7gypD1Flvan6oqdzGh7P/vIM/jcTJpWnnYAsyuXe3wk6N/PQ6vraoaMv5Ax4BeZU6iPw8i0YJUSwQDyXFlFFBS54Thrssk3ILJ12TnFEYS1SiLpxf0d9oZn9oshBCfe4itpLfXaMqFaDUWVMXd2DnASvDR1zo8Rx2Ya0h7dACJ1A7+qRyqWFs+4BCvjo9u5/ZBitjB4l4866BuMltvov37zCzm1QRHWaspKvs79UND06vaoqTlb7max4KsAVMqQDkpayRv2eTwfFxdhQrLEq2u2VSnrUxQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2IX67eDsrkwOjLRqLmAsS7GbF9qv8UJMMMZUFVJ5TA=;
 b=vDosQxBCcxTosjWhC6f7ok2MU3QlGFujGbEWITcBuL/uBWLF7Rf9EH31Tz24F+l1CiHTs6dHGvM2RxJnj7Dys7M6z0FCIo1yuPAzyi2ATKeND251hj8/D8VqG+e5I04mwNeFqdBbMHu/0vtcYkxTHbYaKt+Ba3KNqewvM9JvvAuirkXfqwGDkJiwCKbKs2ezfxil7knVAxHw2NIPhyXriP531CLPRx8g/oQGTcbYJ++pDTQ+6p3/f8LP9C3+6Rb+C7ch/R1csoHUdCHRCEuHDLxTW1pMnMPp9htwgsa0Nc1golMB1xsYiUIhWLAq1ZII+Y73vID8LPTcGwN8BYG8kA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by PAXPR04MB8783.eurprd04.prod.outlook.com (2603:10a6:102:20e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 16:18:31 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::8d51:14ac:adfd:2d9b]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::8d51:14ac:adfd:2d9b%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 16:18:31 +0000
Message-ID: <8276aace-c02e-ec19-aa64-d3bccb3a4966@suse.com>
Date:   Thu, 12 Jan 2023 17:18:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To:     linux-usb@vger.kernel.org
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
Subject: XHCI port shutting down on new laptop while on battery power
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::19) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|PAXPR04MB8783:EE_
X-MS-Office365-Filtering-Correlation-Id: a03b77f2-d6e4-401d-bfde-08daf4b8a55b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xKPdQB73mFlYKwNMwLCtBQgO1u4O6evqhAB7yyrgUzMvpLt1430BDCGiE3BsJJxt5bdrZ7TmGjyPBSGUUgCYcApISYr/WIMuIFAUBlmTdyrzyjk0f8VhjFEPR5LcquKcnQWkmq5FzkQjZ4nZoeK/TAdaLUR02vFJxyeDxPHsxiHdpoRq+zQazVY43c3dUOgKADuMmWbR9xZojPtdDJaE3iudBqpmrlHnVAHH15zh4U4JEMqIEiKvPQFklu3ZY9L3SucF691QepcIMaI9qEENDomkYUksmmqIg9AqLEpE0qmlcF4NFe9ukyPwfVRxlm7UwzxaviJKVEu4XL/onmf2TJQe2JFTVbvtWJZCrCsHa/Fgy9mIUUZVgb01Li6EoG9ayFxLr9iH33Oq9Xj5HRUSdRQAhSR83MBfgpSp0yoZi+7c2szEWHh+EV3FwTqwYdYhSTeI/+psr2FHcTzRac7fGAJR3R7GqyX+HIN/eOkzVRPA89b0s0g2k7j+bARfWITK461Ab9TC/7bf6mKox0VJ2ZC3F5uFuBsSwMUCjPnUhQ+fn279PdLwRdq8SfGWOGGF5Vf76mnsKK1lCsieyWg/keiJjbpIlIhrmlJ2SPhFbWJeGE9hBDjMDbmoe7ml3nrCt1Tdzh1nSI6MzLz1H3yQzzchuAcARNwey4IcfJTH8hlgVJrpmPy59SXqSE7JYGMS0a60wi/5IzZlUwFhZ0PqQTRsacHBq7hU4LAPpxEXA9w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199015)(186003)(6916009)(36756003)(8936002)(6512007)(31686004)(2616005)(6486002)(6506007)(478600001)(66946007)(66556008)(5660300002)(66476007)(316002)(31696002)(41300700001)(38100700002)(86362001)(8676002)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym1tUEx2SktJczlIZllnQ0Q3bENPdVJBaGJpVUNYWWpiR0NnSjA4V3J3VHdG?=
 =?utf-8?B?RWJnNnNjZTVSQkg0ZTZHWThnYUZlanRvb0JEaVcvdysvWUZBN3luaUF0aTZo?=
 =?utf-8?B?Ykw1Mmo2dURMRnhzYUVLN1VqR1FtbXNUSkNNZ21BSWtBZVZwQklCT1hEMzNC?=
 =?utf-8?B?cWdtdXVQU1lVWFhPYytDalR6c3diN3U2ZHJyMUk0OG9IRStmOEdwVmZxWHNu?=
 =?utf-8?B?Wk1HT1krYkd6OUhtRUI0RWR3V3hWOGJXUElLL0hqQTZGNWNpSHFjYmZKdXoy?=
 =?utf-8?B?MC80USt5YU8zb1lHNGFUUDNodzdwcDN1Kzl1dzJweWNSS1VhQW9YeUJsNnhi?=
 =?utf-8?B?clMycVhVa1ZISXk5dGgyK3F1SkM2SXp2Y2NxbVFZRzRRZWZjYlNvZWRqbDM1?=
 =?utf-8?B?dVp0VEdYN2MvK0lXeHpGZmZES3YyY0M0Z3pZeDRDUW5RVEdzZUZrVnNTTmxx?=
 =?utf-8?B?R3dFUXJjSTdUd1Y4WG9hZlk2T3ZsRmRFR2hrQitNVWM4Tnhnekgrc1k0MW1K?=
 =?utf-8?B?VS9ObnAzeUV2M1MrSlhidlRwMTd5ZGY0NXVINDZ6cW0zWkdENUVTamFHWXRz?=
 =?utf-8?B?ZDVPWlBHbkVhdndqM1JnMU9QRjFDU3BrZnRYTmlUNnBEZVBoTUtNRkdoazRr?=
 =?utf-8?B?eEZmSmF0T2xEWkRnd3VGRm5tMXNWbWRCSzYrdVFQM3JVUURVU3BWWDZ3Q00w?=
 =?utf-8?B?U0FRanlRcDY4dTRDU3hEMjArZHBtTEoxNm1JTTVRTWlLZkFaV0JDbFhlTmxW?=
 =?utf-8?B?K2JacjVlTXNHZm5LNUhTUWRBMTFTSVR6dERKR0txUE9ldkJXTDhCc3doYXRJ?=
 =?utf-8?B?cUNPcnBHS2NYZzlmNUkzT28vT1A0T0hjWFhZNDVka0lyamNXMWRQeGl5SHlF?=
 =?utf-8?B?TGE4ZkdlenlFbjRRaHdSNFA5L2RGcmNFT1lxbTNwcnRhV1Q2N2ZLSlRQQnlE?=
 =?utf-8?B?Rk9IM1gyNzMyS1dCeHc5SjNsOGhkQW1Od2l4TGJHc3lyVWJFRU1JMlREV1lM?=
 =?utf-8?B?VU1USkVDSE95YWpyUDhhSkFvV1k2cGpBMkxuRVVMQlMwUW1UblN1VFRPa2ho?=
 =?utf-8?B?cmN2bzZvYnhDN0ZyU0RnaUdUdW5FclhKZHdaMmwvbVdmTmJ4N3lQcGhOQkVR?=
 =?utf-8?B?SXZzS3ovSDdDRHVzVmhyQWFaL0p0K2dJaXRUVS8yQXFheG9jeEdqM1VWVk43?=
 =?utf-8?B?b1kyN2V6KzlLU2hqUnRjazlXejFwMCsyTVgvUnJFQVVTNXQ5a0FrcWdIUHQw?=
 =?utf-8?B?ZkRkNGEwajZTN29qWG0zQXlLcHVnVHR1bzZIUmpVUFFmK0NhQzVHTEJ2UzVO?=
 =?utf-8?B?NUdkeEMrK3RFQnVpUXJOYlJVcUVDWURhMHZHZlR4c2YvRVZ4dEc0UmJpZER2?=
 =?utf-8?B?WDREUUhhQkZtbTBLVm05VUhrRDBhclRsSzZmSncrVThsT1g3Smw0bUl4T1dK?=
 =?utf-8?B?OVl3T2VGanBKKzVKV2EzenhscEVGRjJTeGJSMGRPdWx5aXlRcUdYVE4rODdL?=
 =?utf-8?B?RU1GaFI4UjI0bXc2elhmbFF2aGxCWDZuVW55bUxnd29EMHo4WFRkVGxHM0Zu?=
 =?utf-8?B?Mnk5emFpelA0L3M1OFNIa0JrWUdTRUFoZVEveWRKeUFhSmw3OWZEWkNWanlr?=
 =?utf-8?B?Znh5RThEUExqdmpMbkR2cXJqU3BmT29ZTENWZHRDdFRuTnJ5VVRCUERSU2Ri?=
 =?utf-8?B?VUlzbC9tWEo0N2liM29qMEM3MVNOc0liZnlFSThmclpYeURPUUdCMUNGQ3pQ?=
 =?utf-8?B?S1lERGR3WVJ3V0ZrVDkyaGVVS0UzbzNxTm9XRDhXcmhJL2ZPRUNVcWNkcXAy?=
 =?utf-8?B?dlBiaFkzY0hwRS85UFk1UjhjbHJsSk4yS0Qxb3dzMnovUHN0LzA1V3Mxd2l4?=
 =?utf-8?B?V3l0ck03OG5KcFdHNzk4dlJTWGdxV1g1bGxnUlVSTXVDNGdScVVTN0xFZ3VJ?=
 =?utf-8?B?NkNxbHJCbE1ZOEx2SzNXOWROMVhEWldUdDMyZGxzSmNBRDFkWW8zUTJTT2lr?=
 =?utf-8?B?dDZoSFR5WGZDQjk5eWx3bjNreWVFYmw0RjhXYnI2ZjFnR3V2b2hGVno4WTZi?=
 =?utf-8?B?Qm1ETStqMjgrZHp5VnJVQk5kNFppYnlZeHVPaW9XVThPUFhDb3BRTHpYUDFr?=
 =?utf-8?B?Rzh4TWhEZmROZXB2LzZKR1ZOVitsKzVHT200VFI0ZmszNWh3bG9JZzlSMUZY?=
 =?utf-8?Q?0/wC2BHYKbq4p4Dipp6riv8Ket+TG43dwrWhiapR+63u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a03b77f2-d6e4-401d-bfde-08daf4b8a55b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 16:18:31.3647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JvXTm9AbQXcLdUVE5q2I61sbxStnPoPuDUhFm6s+WUdPOGHWAGGoa5mik9cJ+ToQlPsPB8u6FJaoMEHq37T1vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8783
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

this is my new laptop and I am fishing for ideas.
If the port has no device attached and the laptop
is on battery power

The device in question is:

linux:/usr/lib/udev/rules.d # lspci -vvvn -s 06:00.3
06:00.3 0c03: 1022:15e0 (prog-if 30 [XHCI])
         Subsystem: 17aa:5125
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 32 bytes
         Interrupt: pin D routed to IRQ 41
         IOMMU group: 16
         Region 0: Memory at d0200000 (64-bit, non-prefetchable) [size=1M]
         Capabilities: [48] Vendor Specific Information: Len=08 <?>
         Capabilities: [50] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [64] Express (v2) Endpoint, MSI 00
                 DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W
                 DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                         MaxPayload 128 bytes, MaxReadReq 512 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
                 LnkCap: Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
                         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                 LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                 LnkSta: Speed 8GT/s, Width x16
                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                 DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
                          10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
                          EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
                          FRS- TPHComp- ExtTPHComp-
                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- 10BitTagReq- OBFF Disabled,
                          AtomicOpsCtl: ReqEn-
                 LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
                          EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported
         Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
                 Address: 0000000000000000  Data: 0000
         Capabilities: [c0] MSI-X: Enable+ Count=8 Masked-
                 Vector table: BAR=0 offset=000fe000
                 PBA: BAR=0 offset=000ff000
         Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
         Kernel driver in use: xhci_hcd
         Kernel modules: xhci_pci

When I disconnect the device on the port I get:

  [  417.723677] usb 2-2: USB disconnect, device number 3
[  417.961659] xhci_hcd 0000:06:00.3: saving config space at offset 0x0 (reading 0x15e01022)
[  417.961676] xhci_hcd 0000:06:00.3: saving config space at offset 0x4 (reading 0x100403)
[  417.961681] xhci_hcd 0000:06:00.3: saving config space at offset 0x8 (reading 0xc033000)
[  417.961684] xhci_hcd 0000:06:00.3: saving config space at offset 0xc (reading 0x800008)
[  417.961687] xhci_hcd 0000:06:00.3: saving config space at offset 0x10 (reading 0xd0200004)
[  417.961691] xhci_hcd 0000:06:00.3: saving config space at offset 0x14 (reading 0x0)
[  417.961694] xhci_hcd 0000:06:00.3: saving config space at offset 0x18 (reading 0x0)
[  417.961697] xhci_hcd 0000:06:00.3: saving config space at offset 0x1c (reading 0x0)
[  417.961701] xhci_hcd 0000:06:00.3: saving config space at offset 0x20 (reading 0x0)
[  417.961704] xhci_hcd 0000:06:00.3: saving config space at offset 0x24 (reading 0x0)
[  417.961708] xhci_hcd 0000:06:00.3: saving config space at offset 0x28 (reading 0x0)
[  417.961711] xhci_hcd 0000:06:00.3: saving config space at offset 0x2c (reading 0x512517aa)
[  417.961714] xhci_hcd 0000:06:00.3: saving config space at offset 0x30 (reading 0x0)
[  417.961717] xhci_hcd 0000:06:00.3: saving config space at offset 0x34 (reading 0x48)
[  417.961720] xhci_hcd 0000:06:00.3: saving config space at offset 0x38 (reading 0x0)
[  417.961723] xhci_hcd 0000:06:00.3: saving config space at offset 0x3c (reading 0x4ff)
[  417.961840] xhci_hcd 0000:06:00.3: PME# enabled

This looks right to me
I added

         } else {
                 error = pci_set_low_power_state(dev, state);
+               pci_dbg(dev, "Gone into state %d\n", state);

to pci_set_power_state() and get:

[  417.961840] xhci_hcd 0000:06:00.3: PME# enabled
[  417.961853] xhci_hcd 0000:06:00.3: Requested to go to 0

_That_ I do not understand

I can trigger the same effect by putting a connected mouse (usbhid) into
autosuspend while and only while the laptop is on battery.
The port works if I prevent a suspend.
This looked like an ACPI issue to me, but I do not understand
why there is a request to put the HC into D0.

Any ideas?

	Regards
		Oliver
  
