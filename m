Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8687F6D5EB3
	for <lists+linux-usb@lfdr.de>; Tue,  4 Apr 2023 13:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234152AbjDDLKF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Apr 2023 07:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234414AbjDDLJt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Apr 2023 07:09:49 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8949D1FEF
        for <linux-usb@vger.kernel.org>; Tue,  4 Apr 2023 04:09:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncEBqb/xbuiGjzrNcNlL1pp+sa0Q3V94Qa6J55mJ+ceDJeVbnykA2msz4/gbZ2Axs81XkwXFltgeIgQ0Y64aA2YC1RxT1eypKzFpiOD+TUmUJ4pf/p9GP7aNF+AGojkrJgOSWT/cGq89ONLdlg0SEEGSKf1zKTBuq/CqgxUkAmcLEr29nfvrsjNISxMJXE67tH4gJJAxIe6xoyTSc67A4kRem8qnCylVRCKT22cLEVZpBKuW2Mfv7gTfMCi0pHfqM9Yu0OXHWU7F4a0Trz2KSIrD+ICiOeaL6YnaVP+V5r4+sc1ilxq9i3BzJTocpzfkdhw3MFCW7WKsHWSIjmm+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIcMGx+MEPS0hOMVAM9HXgNqxGNowIN9GuDNFTjZxQ4=;
 b=noci9H0moD3J4jW7vkGebMRTp3d5HgI0+3u2wDnCJTR98E9whjGYZ7gIV2cDC6ORncDZOlVpFNT5nUl3Pc+2pGfcG/5ZxCuoUtkFp/jIr0/hcy1C69C0PVmuhAHP1Cpl26NK71swjrkss+bgkiQ2WfLheyUU0StdxF6ZWe3ci1v9FaXKb1bAp4w7zdewEUHXTYRA9e3qQyyyN8bU6GdaKAtppD9nSgOnQF6HsgFJQV+Lj+FP+ZXp+0BiT/m0+bpkF5a071IL7hXPIdgZZ3f0rNdtQQQ7mqWIeKXTRFlhFj41GqRN/bIom2BvmM7tutJoewPfsVOXAy3Jx/6ri3FEzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIcMGx+MEPS0hOMVAM9HXgNqxGNowIN9GuDNFTjZxQ4=;
 b=g5myFOoh12FxCfad3mOTzVrFKFKZrJlQBW9SgSRsZdL/HsOUN10hYnKuMxwCtjNe/7MwvrzxphtP2UsD//czh0gI84E3FIbAi1jxzn/hTRkuPE7SlUheh/qChBAFoNUNlYfEmcEPpzXub0pMp5oSGmK5u12yCW13bB7rYFHsektR1wSTIHbeRGVxN3lbH8p2DcIxhDEo1cI3cW1xCeKQ/ZiSXV5si/+UW337DN58JrflfzlEWZfz2GrEPCRtKud6zFCRG52gLp9M6vwZvnG5KrwtdbqX0rc27OK25GcSk/O3dM9lYEeP9/IaiWVmPzavVHQSrf6RfpTX/mWIokbmIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by DB9PR04MB8410.eurprd04.prod.outlook.com (2603:10a6:10:24b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 11:09:22 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::74bd:991c:527d:aa61]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::74bd:991c:527d:aa61%9]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 11:09:22 +0000
Message-ID: <9f8277ce-7888-46b7-fe82-90fe4b775762@suse.com>
Date:   Tue, 4 Apr 2023 13:09:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4] usb: dwc3: debugfs: Prevent any register access when
 devices
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>,
        Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org,
        Oliver Neukum <oneukum@suse.com>
References: <20230404100055.28100-1-quic_ugoswami@quicinc.com>
 <ZCwEeFzSFVRmB/yI@hovoldconsulting.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ZCwEeFzSFVRmB/yI@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::6) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|DB9PR04MB8410:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae41246-bfa8-445b-37aa-08db34fd0afe
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jRwmSRqrDUuruyrXWytyvQGCFw2dzNBU8Z73yKgLkE7ddaMBOq3fD1MI7FMfYVyUSq6iAnYy/Zs/5q4LoUsKppOUz5YrCYvgFRVP98WU7xej3q/Rj+CBzjpSj7REQv0mLIVRcjBYYfN2nSlKQ054IAuuzGOl3LWJnH8eZddh8IungiaTFH/7CJ9rgjb9lghh6ur+A5KYswZYe2y7UWkU3lQBGbADFUYaTkoBK9AYjvz9lSJQPNUgDQiCHh+WbITGUoVCJ/kxmiVhjt4Wev/+KpgJbcsRYIJsv0bQvVIXUnTj16wsCYEHqSTEQAU0VNAxF8EJDWz4bQBEZQelfghqt7y8+wlj/g6DdyciPdlz1oevi2nzcGLrp57VbeZeXZ/LJkFtomO7NL1BqYZBqkpSXYb1VfYiyXKqSpVa9oPLMT8f4o3yKrXq8wZV1q22E/1la9pepEBmm9u/KeVwoGsD9VtrpkHdynLzxcfOvVwAn5B0dfKL4VMF/ZC6LP4ePrn8dxaV/WbzQTcE7Z3vUzAg1vDb0GvxXjBDrKsJR1zKdbb+Qa3xbCvpo8pM+XTi/lWW6NZNJ10/1Uid9JCn/YFYBOPWZC1J78KHlxCGZCv+vYz0kGxEFsuzzoNq+NMFxqsYlNQgNguZfTwp88A0Ld65mg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(39860400002)(346002)(136003)(451199021)(478600001)(316002)(54906003)(110136005)(5660300002)(8936002)(36756003)(4744005)(2906002)(86362001)(4326008)(31696002)(8676002)(66556008)(38100700002)(41300700001)(6506007)(6512007)(6666004)(107886003)(53546011)(66946007)(6486002)(83380400001)(2616005)(31686004)(186003)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDdmRXJJZ2JjUmFKdjdpTjF3OHYxMHBRa0xuZGNWcW0va1JiUXZaSnV3UGxW?=
 =?utf-8?B?cjJSbzlpS1lLeEllV1BZNklUWDlYdzg4aUQvVG5lQ2ltcTVrQmRFYlFPVFZt?=
 =?utf-8?B?RFc3Ky8wOVNZaDlkNHIxUENUSU1zT3l4OHlOWExvZEs4NFFvdGhNR2F2bmRm?=
 =?utf-8?B?MXVlOXdlM1hFd1B5K2puQi9GMVJ0SzA1MjMwcnVya0xnbWlicWNNT0hyUzRB?=
 =?utf-8?B?MnV1SUxYS2NHa1FGQSsvTFFJZnREb1hid1d0NGpjZkh6YzdTQ0ExVG03SlFj?=
 =?utf-8?B?Qll3NFpsVmJGcGxIbE5WcXNCaVhnQlI4U3ZsampScTJCNHZBaEdjRXdIM1p5?=
 =?utf-8?B?b3VmaFhuNFdIbXFXMXhkQjl4TVE3cVRTYWJ4L2hsRFVjd3VicWkwOVNOMTJD?=
 =?utf-8?B?eHc0R3pOdzUwVkVuZkk1SXVoT1REei85c3NlQzhwYWMwWjFaTjZuNDcyeDVI?=
 =?utf-8?B?VHRvRk81a1NLL2s0NXc3L2NXMGo1SVZPdzJjOTIrK3Q3OXR0S04rakM5VGM4?=
 =?utf-8?B?WENpMnJiMVNMaVdIbDcwQUthaDJJc3UvZFBKQ0JmamFPNDR2anJIZHBuZHNS?=
 =?utf-8?B?Y29rZXM4dWZ4ZmZhNkpwb0p1SFB3ODUydzF6SjFyMkRFM3hYMll2Z2RMb0VV?=
 =?utf-8?B?bDJTRHB1YnA3N0NvQlRveHZRdW5wYlBHZ01OUVVVcWtuVUREbTJ3OTNKeG4x?=
 =?utf-8?B?Q1FDUnBUeHNUd2RJTHF0d2dXYTQ5T1JVRzJhR3pUak15UXRSOHQ5S09UVTVM?=
 =?utf-8?B?bzEyMEdUQ0NwUEtObHBuWmRPN2hzS29zUmhMbTVPbGl4VjFYV3V4ZC95ZkZt?=
 =?utf-8?B?UkVRWC9OODNSSlBTUUhZVzh5UU8rbktzeFljbldzUFo3dC9XSHBWeU5vbU10?=
 =?utf-8?B?eGtmbWJyWnBLMVRjYlVreWN3QnBtVElpS2NGOGpKcUxVMmVYTmNHT2JHTlNr?=
 =?utf-8?B?Mlp2dHVQSEFSS1BVYnB6NmE0Vk5JMEp1Mzg3WTdqZHVvSDBsZHBWMkwrb1pE?=
 =?utf-8?B?TVJIN3dHVGRCVnJ5WGtzSmJBaVBQRHF4MDI5VWY2cXljMUM4VDlNSGFPOEh5?=
 =?utf-8?B?My9TdXRyRHA3QVVDMlBOQktpeTRtaG9sRTdoVStBMG5yTHpJZ1B6a01UdXUr?=
 =?utf-8?B?akpuNmswaWNCWll4allVRlYvZ2JUWFdtemxxdzlPZDZjVFpwREVuOFZlc3JN?=
 =?utf-8?B?aTFmdWFTdDVuKzNWempjS1Iwd0NFZmRTbm52Q3ZaS0lwaGdhVVVsY2NZQmF3?=
 =?utf-8?B?a05HVFhrQXU4T2JFdkV4NDlEZkl2SEg1WjI2UFVYMXhnUVU5clFIVFRLaW1k?=
 =?utf-8?B?QU1GS0M3TEgxRzJ2UFIzRnVEOFVtQ1JDZ2tYWnhPUHg5alhMYXlYejlZR2ZC?=
 =?utf-8?B?NkNwczYyRzRocGVRMTlRNjgxbFdoSUxlSTFLcEJRTnBmbHpqU0xETG55NzVl?=
 =?utf-8?B?V2I4anRhRjlxaFhqUjVjUDh0SjNUaUJtc3VBRXQzcWhZNldNM01TOVZOWDlH?=
 =?utf-8?B?ZFl5eEltUXB1SmFDaDA0VlZnTlFrLzVKdlVGc2w4MTJ0SUdhdUF2RFBEUEho?=
 =?utf-8?B?K2I2TGRORWJnRmcrbVlRTHRMYi91SWd3T0ZJSVN6b0ltcENZTFpzYlNvVzBx?=
 =?utf-8?B?NWVpQ3JvOWF1aVNmY3RVaU5kNUJGYWsxNjRTUndDQ2RnZFpnbFNXd25HTE9G?=
 =?utf-8?B?YmlsTit2TmFKNU96MG1JN002ZEM0K0ZxYXZYSlVBQXVCaW1GQ05VTlpWejRG?=
 =?utf-8?B?RWZYR2M2bDNMMVpiV1oxbi9rZEM5ditVTGtZZGpzNHY2UlYySmhNT3h1V3F4?=
 =?utf-8?B?WlErL3U2Tm9qZTZrdzVJRVJwN3I3eFIxTUIzcHNvbWtXOEl6QkdJOTJoY1FV?=
 =?utf-8?B?bG9jUkcyNVVDRURxL3FKUzFzSURBbFV6SXpBcVJVbXlhS3JGdnVrWTN4bjZq?=
 =?utf-8?B?cVZmMCtCc2l0ckFjaWJBQnczS0Z2czFwUW50ZkR6YzFQalhaQ0VTUXozenRQ?=
 =?utf-8?B?d3dPajFlRm5CMGlLVTVISTJLcGtaaVNmZVl0WEo2ZjN5NjFtaWNKemRRUzVu?=
 =?utf-8?B?eDFLaXlFa0dVV3BUd25FRjZZdko0a3k4RFRnVnlmV3ZOdjNhdVIrc1FmN1gw?=
 =?utf-8?B?VGY5SUM1ZGljaTgrUjBFQXlsOEVQUmNmVUZmd01jalMzcHhmSE1HTjBvM00w?=
 =?utf-8?Q?8EjkqFHZfU1PvXZsPl8KLKw01sZIGPpe9PkhFRznV76S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae41246-bfa8-445b-37aa-08db34fd0afe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 11:09:22.0526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7AUpnpSmYYHJRg4PYv17H3mSLAK0pPoCVlGPQo/bDC5o33vlHwOLAb8EAI+x6mznnLIqrzIr+5yz5HMt+eY65g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8410
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 04.04.23 13:05, Johan Hovold wrote:

> This is backwards. If you need the device to be active to access these
> registers then you should resume it unconditionally instead of failing.

Hi,

usually you would be right. But this is debugfs. It is intended to observe
the system in the state it is actually in. If by the act of observation you
wake up the device, you change the experiment.

	Regards
		Oliver

