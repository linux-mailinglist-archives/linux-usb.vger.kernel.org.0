Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6A66EA2F1
	for <lists+linux-usb@lfdr.de>; Fri, 21 Apr 2023 06:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233431AbjDUE61 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Apr 2023 00:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbjDUE6Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Apr 2023 00:58:25 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BC0B30DF
        for <linux-usb@vger.kernel.org>; Thu, 20 Apr 2023 21:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUlATMIEoR7pT7nOf3fyVk2UPwpZzmWjo2Yn3iT55vbYC91IgKhk9XGCk8i6v/C/xFcaybS10tnKcN6+2kO0qYwggoVAhr7aYBscanYJ/JjUO1cT3G7zxpxk35edpIuqY8LaHudqH11zILzhCRI2X9b3uuRTiQHwOhUR9KNu/pNnO6vlCL3WX+r9HFv+NbwZDtxRZkF6TJ24zgxwai20pJNw+1M5YEUqFyY6Y/fi/5e5wP+We4M84t4PxbuE+TdrmEUgMgRkHeVz3uAqywtPh1o0Bjp/XYF7hls3Znra+ooMPbfYvG2+gvFYDs4aiGGKhmZIQS4quieHK1yRl6Q47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60w23MBAfXCqQM8a/Qeufg2vUg4W3wlnL8XreNIrMuM=;
 b=AMriGWGqVBE9/f77REu1zMU/mVqodTp40gS75KGebBbMbpP0cTVNl8tpAsHwW0Lyy/WF4ixL6JxKFO/aJ3Q4tmiKB3aEcDrCdUOWxpbHX0dAiDfaE+yKPv7BVPsfPu9o0iFNUbnL1NypkWOh37oL1mkLma0Wl5zJzkRwg/OYj6nSXYBmDz1xAaFW2pGEdXh3YaRzRBoV40Oou6bkSnST2UMxijcQIigAl83Vks/9xadYo44XpCaj1UdziMz7hcMCfkOpmdopMlAnmw2MWlgIrmvOK47Lxkep7/P9RYdH/WspMhce83OSjEF8H9lPmkOUpR7URXUmwAAK2O5srEmeaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60w23MBAfXCqQM8a/Qeufg2vUg4W3wlnL8XreNIrMuM=;
 b=knfaHXfkAjhrJeb/blv2/ubs7v18cTP6pllXt2O/G3js6KVcBW1/JO61pYUYsxh1sayVHuq5i6lhaTX38tnKJdu2fesXUk80TN2AJ7DCZd0N8s0VXCLdeL06p2N740YBt0bLZWS8BD+v9dnu5ujHtm1yoApOcADiHqh56jbknCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM4PR12MB6087.namprd12.prod.outlook.com (2603:10b6:8:b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Fri, 21 Apr
 2023 04:58:21 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::61c3:1cd:90b6:c307]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::61c3:1cd:90b6:c307%3]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 04:58:21 +0000
Message-ID: <346ea37a-9ec6-af36-b6ed-026aefb2cf4b@amd.com>
Date:   Fri, 21 Apr 2023 10:28:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] xhci: Improve the XHCI resume time
To:     Mark Hasemeyer <markhas@chromium.org>, basavaraj.natikar@amd.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        mathias.nyman@intel.com, stern@rowland.harvard.edu
References: <20230418140817.3651909-3-Basavaraj.Natikar@amd.com>
 <20230420170337.14110-1-markhas@chromium.org>
Content-Language: en-US
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <20230420170337.14110-1-markhas@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0219.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::13) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|DM4PR12MB6087:EE_
X-MS-Office365-Filtering-Correlation-Id: 35d801d1-d0f9-4bba-bfdf-08db422507a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: txwNNuT+faRD+Rxc+Bs9GQFW6CXa7ouvpenZMCeuBjZ8kKidJLlmHsmX8fWJQVuhmpr6FWu/IRubF1t62n9WUkK1wFsWRfiS/32E7sqYaUAPC5NXGO5ORqSIoQLIKnXlxaRJPnGkj0AW0xOg++Gy5YX78u/B0/gog+U6CUA7+gXg0DtYsvK1U79kDFjV+Prf09oHcS8kjN3CMrLmpLvD8VxkDlmgg8Bk+w39bQmp+1IOPtnb2ChDFICTHCOJDcOKobIrivtIzsal1uV331eS5nOKuKsF8C0tHEn/odMmv48AVBB9JawnYelq4jIk4b+5W8B+NjqpVkrkLsncTYZDoWh1+S11LUQ33tC78350AAOoUSPvRb8O+1NkysH0EeQDly7tdUz/qYxu2G1uSm5Kw8BgzLho9RjOilAk5R0V1axkuTRe/PT26x3XdEGccU8W9aMzry0HD3KOgHDhYvAn4BBTUdsVAg1vbebmYSI/qAcfco2rBV6ntNIdKs830KI4guRuKyEiMXUThfqGb/9IbX9yw3RUW7BYBwQI1QggPUvhCeVOcZEj0s5J0QZi3/tn+dif+2/59UNKG9+PvI7O8bW+b2TZdXXfd+lUL1TNq8mH0w8Ua9xInrvtBbFAowki/ZAWfMkZJVu3Ju1k0QSgRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199021)(31696002)(2906002)(478600001)(6666004)(6486002)(2616005)(38100700002)(83380400001)(6506007)(53546011)(26005)(6512007)(31686004)(186003)(5660300002)(41300700001)(316002)(36756003)(8676002)(8936002)(6636002)(4326008)(66476007)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wi9zbUx4VGs4UmJ0T3MrSjhtOUF1WlFWeHdWcm4yelR2dGVjQXZXdms0OHMv?=
 =?utf-8?B?TW1DZHI5OVJ6NVdoaFBrZDhsNi8yOGo2eXNzMVgyb0tQcFNXTlNFRHpORCtK?=
 =?utf-8?B?TS9Gc1lwUHdPWGdXSVNQUVNOc2JLajJUR0dLeGs5Nkx3dEYwdHJXNHI0eFpi?=
 =?utf-8?B?QVA1eTNaRWlGMHRQa29GaXgwclE1cUYrSytFTHVKMjlxN2VteUNWcmJhWEJi?=
 =?utf-8?B?QVF5OGEwZHZZMXJBSGprRU9SNytFZ1VQKzJQSC94eVFuM0paTVdYRSt3TW5q?=
 =?utf-8?B?SnJBTStYK1hwZGZvTGNLdVJmcHBQNE5WMGpnRERlWGdZbEVxamhJdTNhbnlB?=
 =?utf-8?B?Z2h6Y3NBYnNkTU04TUVHWi9BaFErS0IwYmFMdk9qK0hITGFwQ2Fydmd2K0Ex?=
 =?utf-8?B?ZERPdzNMR3lrRUNoNFlQR2NRZXpjdTk2TW5Dc0xrMjFIZGhkemhnbTBqa1Rs?=
 =?utf-8?B?S3ZhejJNNkxIVkEwdng1RVJ4d1htK2E0ck9lby9Va3JvYjZ5YnVjdUFySkh3?=
 =?utf-8?B?c2xZMmNmZ3I2dDljM0ZqRTIwaitTeU5jNUk4ZHFLV1AwYjhZL0sxVC9SY3hw?=
 =?utf-8?B?M1RYWCtHWVk2eXkveEJQVzVHSCtBOElLQmhrSzd5TExUeVl0YzhRR1RMUVNC?=
 =?utf-8?B?cG5HOFg1cTlSRVpwZnA0Wmkra3dSRmZLUXFXRmpTSXZCNjdqYi9UaW9QNmtP?=
 =?utf-8?B?b2JlSUFia2U2RDVCZG92ZDdYQnlqKzIwajhvS0RsOGRLUXI2d1o0M3FGNFZJ?=
 =?utf-8?B?S2RjajloU0FSZzRibGdFYmVKcDg4cFZkVXZWemlhUUV0YzUxcGdYbzF2ekxY?=
 =?utf-8?B?QUUyK0VPVGZSRkVPNkcwbFpxR2tFVjRhQitYWitBL3JDMExvU0hkdUR6MlMw?=
 =?utf-8?B?cy84bHNpNHZnVjQ5U1ZHYTJ5eHpXVWhYS0JtV2hqa1ZWKzgrQ05iZjAySHNQ?=
 =?utf-8?B?VkRDVmR6eXc1dEw4NWEyWjZJczM1QzRkZ2x0UlJ6dTZZek9CV2xjc3Nva0NQ?=
 =?utf-8?B?Q0Zjd0h1WWh6QWVJTWhDU3dtLzNQVEVQcHp0eFJydTV2ck9OU0lMMmJXVEQ1?=
 =?utf-8?B?YmY0clFUTkl3QlJINHQ2SWd1UmtQZHZzVzRPaitzaGttajh3Ky8yT1BPQ3Az?=
 =?utf-8?B?bWVuMlFTOFE5RzNHazJwbkxXWnlab2czVzV2d0xxTGgzNk1CcWViUjk5WnpR?=
 =?utf-8?B?a1lWZG4xMitvZXdMQnl4NWJZRys3SHJYcUpUR1RyWUJ0MUY5RVluaDQ3K3di?=
 =?utf-8?B?aUhaQVdTbm1RMGN4VjIvQmJseUl4bG9zRjhJaHlReUY5SGYxZ0pCUW9odFJq?=
 =?utf-8?B?eTZEMEdJT2RmbWZuVnJiS2lkMmR6RUdaalhqYTl1M1BFL09IaWhuVFFSWTBZ?=
 =?utf-8?B?Y2dNSS9ONVhoTkNKZERkZ3dMTjBnVHBQdmc4b0ducGEyUmxMbHZpNytOL1NR?=
 =?utf-8?B?YnBGNWpRZ2YrVUl2R29IS3dHWG9PVFNTOUxQU3hFb2RvQkZXWlBkRytqeFEr?=
 =?utf-8?B?eHF0RFI4RXN3RytoMDkvQkZORTh6L0pGVkw2aDNTVEtidjNnNUVDcy8vWUI5?=
 =?utf-8?B?TGVmKzJqdFhtK0JPa2I3NWd6YUhQdDBOTjR5Z3pCNlJEdGtBSWFuYUVBUzBR?=
 =?utf-8?B?cGpzZ2JrKyt0Y3ZQWkh6L1FtTDBTSFdsV0Ryd1FJMS9pS2JlMnd6OEpIZDFI?=
 =?utf-8?B?d2E0SHFCbk5UbktSTmFpZnV6OFI4L0FvVGdLZXlpN2dJWnM5cXh2MloyMWZS?=
 =?utf-8?B?MXRrU1lVejBhMEM1dnBFejdnMnA3emgvbmlmeGVZMzJ3MkdrV1dMcHRxbXVU?=
 =?utf-8?B?NmhPK05NS2I3WWdaZUx4NzVPTEgyMmlNbm1XM3hFcWZ3V0lnUU41T1pSeXRo?=
 =?utf-8?B?cnUzckNvNUpTRFJiNUVkc09BdE9QcUlQTkRsM2trM2FUMlNiM0dOM1lRWURq?=
 =?utf-8?B?WDY0cVIzTVhaaWJ4ZHB5K0IxdTlsdy8xSnFiQno4dnRWSWlRRGFlbUQ2KytH?=
 =?utf-8?B?RDFXUEZmM0c4clg5eDNJSFBUVXpVd0JQcjdjTkRha253VkQzV0FrL2FySDdv?=
 =?utf-8?B?WkM5ODJnd3hjS3Y1SEpSbDMvd1FVa0lqTWUyU1FZTldOSVRkbnhJR2p4NHJt?=
 =?utf-8?Q?3OEuusWF/TLfQrQQPiZre8rq0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d801d1-d0f9-4bba-bfdf-08db422507a8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 04:58:21.4461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+Zqgj0YIkdjNoufCSkRGXZ95lYNOs9NSKxrZH1al3wVzv1qmbAMh+Rx64f66SH+n31HytLlJGl3uXewy/zZYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6087
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 4/20/2023 10:33 PM, Mark Hasemeyer wrote:
>> It may be necessary to wait only for auto-resume cases.
> I find this comment misleading as the patch assumes that it's only necessary to
> wait for auto-resume cases. Are there any cases where the driver should wait
> during system-resume?

Only in case of auto-resume (runtime resume).

Rewording the commit message as follows.

Each XHCI controller while xhci_resumes by default takes 120 ms more if
there is no activity on the ports or no ports connected. Therefore, if
there are more USB controllers on the system, 120 ms more per controller
will add delay to system resume from suspended states like s2idle, S3 or
S4 states.

Once the XHCI controller is in runtime suspended state (D3 state), on USB
device hotplug controller will runtime resume (D0 state) and check for
pending port events if no events, wait for 120 ms to re-check for port
activity to handle missed wake signal. 

A delay of 120 ms more to re-check for port activity is needed only in
auto-resume (runtime resume) cases. Hence, add a check only for runtime
resume from runtime suspend (D3->D0) to avoid the 120ms more delay for
other PM events (system resume from suspend states like s2idle, S3 or S4
states) so that the system resume time can be improved.

Please let me know if any inputs.

>
> Also, the commit title could specifically mention "system resume".

Sure will change title "Improve the XHCI system resume time"

Thanks,
--
Basavaraj

