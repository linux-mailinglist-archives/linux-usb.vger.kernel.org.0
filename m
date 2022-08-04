Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 668E05899DF
	for <lists+linux-usb@lfdr.de>; Thu,  4 Aug 2022 11:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238815AbiHDJZY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Aug 2022 05:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiHDJZW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Aug 2022 05:25:22 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48B513D4D
        for <linux-usb@vger.kernel.org>; Thu,  4 Aug 2022 02:25:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0edLI6/O2nRffwq6yJ3YBkdCrmIPbc5I15V5Sij6WhbGpcuhcJqrGxP4anhRpU38ZzRIBcCzGdzlHMlThc60YCWlzxT3/fy9TzovasXIAkfEP2pds6r6z/SEx+B0EAPMZTCoMe5k8u+S1Y8Okv8x0Su0iGDRKf4JNq6GEPMgRHBerZWbXxO8MTO3me4XWPVnmFVHPV7MKS1VuDRjCzukwbf1yj2mzsdqr14qWdTCQinG3uLGp6WccISh7MmiZzOcegW9M/PDAzH7P1ro0A2njHvpNUmn24ezFCCqdQQqbva0KjMfP4VOPQ1mo/J+GRn/ipRyZHUilzEYJg4Q4Exsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qckudkXHrmdY1ke2ZERBfK3Ze8kBTy8cFrldmPrt3ao=;
 b=fvq2cl/R270iR/+hORkpkjyqujifjzmlZtSQjffArwWCm8zeM2biTn+L4Yy56b74Ic+eaxjtexdyECaBCPdYyKmq7bb5M9MsXFS8uTlSxsd3P4HABSeReFE9RSVrRh/ggYCTHMik7oH+mCS0YKsw0aJz81xYaGG7bNslN9eIDXPYI5+mmf4NpNQpnysSUZomSIZpGWCla9y8OXqHa9kxLH7EPZ04EW0Q4avWYWB47FDaLta6ujB27Stf2CfnJ999jtt06Su2Xdq/THxmUl5kC6TngMAUt36XGuZYY/LO4+lWgt2nFWk4u2bELPI62rS6Y8zcZxoIdpAbdzaQZmIIdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qckudkXHrmdY1ke2ZERBfK3Ze8kBTy8cFrldmPrt3ao=;
 b=4Az3E/TlQujWomPjZCzJaySAeDXM1PD7lbcH2ypZOhrlCCyt8G1Xh944uA9R90hNHZfIeFPQROa8z96umaQggrQSxo+aRyAINWPwUE2SndWsUSuTZ5HkyfStZHN9PhoHHRWk/BErQvIgzD0MExVRlvCl7vJJFNulUDGZwPVzFyQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) by
 MN2PR12MB4784.namprd12.prod.outlook.com (2603:10b6:208:39::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.15; Thu, 4 Aug 2022 09:25:18 +0000
Received: from DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::71da:a1dc:7ef7:f733]) by DM4PR12MB6326.namprd12.prod.outlook.com
 ([fe80::71da:a1dc:7ef7:f733%8]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 09:25:18 +0000
Message-ID: <1d046181-afad-f73f-1231-b571f6b1c2ad@amd.com>
Date:   Thu, 4 Aug 2022 14:55:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3] thunderbolt: Add DP out resource when DP tunnel is
 discovered.
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        mario.limonciello@amd.com, linux-usb@vger.kernel.org
References: <1659587394-115256-1-git-send-email-Sanju.Mehta@amd.com>
 <Yutnjq64OO07QbAR@lahna> <a5b6e0a1-a334-1bc5-46fa-b9ee5f53688f@amd.com>
 <YutwWI8xENDkAtg9@lahna> <5ba4e184-d9cb-a120-8044-e200b6e47812@amd.com>
 <YuuDxU59ud2LhFbl@lahna> <1bdd4947-0343-d907-48c3-e33c9063fa77@amd.com>
 <YuuOMrH+TOt5o8WY@lahna>
From:   Sanjay R Mehta <sanmehta@amd.com>
In-Reply-To: <YuuOMrH+TOt5o8WY@lahna>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::27) To DM4PR12MB6326.namprd12.prod.outlook.com
 (2603:10b6:8:a3::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f93bd1f4-cdb9-41cf-ac87-08da75fb3f27
X-MS-TrafficTypeDiagnostic: MN2PR12MB4784:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nRHVdVKYmzFBbudZmn32CFtYuAsmTIsK4gQVV7nQjd6+KSJbXnPdQPxz5iLKFyigBT2HcSz3FLoaSaSutKZTqjBV3vpFa6DdvH2Ct1U/Qnbz7t0YVp47O2RNM7MCKfoUTKYtZkkZEz4ONuriJWj5Naq5ho1VmhnLMHMnGRfNoYZIARRRYujI/qjzL1rOci3R7gmcAu8hLQRS4eLSh3fPezaP4GT+/oeKEC6EiLuqbEj7/dWjti32KwSet1ycrD+Z0PU0tJgzIG0t/RngTE6+L1HIywMQDX/Y2wa/kAMCcKwGcqqNhY1i319Lr+0K5v+C0khRV5kdS/g1RRsUHQ2YKyCDu8/7PlnJyJno77+/yBBmF4gKo0zhXjsIQVevkEXV8SJU2RCONs1gSQ6uny6Qb1e/82+K18onlMbvbs1JONDnhI/EMgFSuxeUeD62cfcOX1Ja35pqTEBpZK5i6pNTuDX4YK4V/VCJhq1Tc+eq/UCalyzxYEyBIQ06akwM0MwHzfKOVr9/knGS7xmOERmJZnBBp92D2ZgcTFJ0mpRCF96rjqLmmvuUMVAeD+my18GCSZVt+qVji7SA9jXllU56y6rgQwsolzzOc03XzWh21+Bps/xEnTchbgTd1k17ToO8NySSPp3d2zqZe/RYJHHiL8/TqEUFtYVtZy9GVqwU/js1O7kmZrN06Az04LVwgB/mywl9enMKjGrkjZ2rCeczmCeuNuzB+fH/uPId5dVF5ymrQ6PCOJpZE8yqSk3MSjuVSSKRFSluc4UxirjZKaCZROqhKd8XkmokFykHN2dM29yhNpP9P/omebqiW26RDSiTw5QlmZHWNwC5havsmPEBHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(38100700002)(5660300002)(186003)(2616005)(4326008)(66946007)(66556008)(66476007)(8936002)(8676002)(36756003)(2906002)(6666004)(4744005)(6486002)(478600001)(41300700001)(6512007)(6506007)(26005)(316002)(53546011)(6916009)(31686004)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NG5sK2hHcVpoTmJjZjBuTVc0SmRQRUhKV2VZQU9CZTNib2tTTjFmU2wrS2pL?=
 =?utf-8?B?SHIrZnR4OVl4Q21rc1F1eE5lN3QzVWczQ0lMRkNJWXJWVlRNaTlFbStROG9X?=
 =?utf-8?B?bjJqT29IN2ZqTzJ4QkJDQ1pPNmwvY1piS2hlNHJnTUlUU0czZXIraDFKS0RL?=
 =?utf-8?B?VHB5bnJNUWpNTGZjL2xnVitvTDlJV0J2NHB4M0IyVUJ6KzVkNDlGMFF3eE9q?=
 =?utf-8?B?M3l3VE03SVNwTFJON0U2UGNxQm1VSEZlK3hsWmRpb3UyamR6eVpDbmtleml2?=
 =?utf-8?B?WlUzMDVDcWg3MU0vY3BkK2hmNS9XSU8xdmFtZ3c5OThKMkpIZFkydGxKT3FH?=
 =?utf-8?B?UkZNdDQ4VzlrdzcxSE83NzBHQld3dkhyaGNLUmVCd1Z4b3RROFo2dHcwZTkz?=
 =?utf-8?B?dkR3OHNuWTc4dG8rbXU3cXNuQWUvemhTdy96amN0ejg0Mlc0cVIvSkZzLzI5?=
 =?utf-8?B?ODkzTDM5SmxCYkVySmRnZjc5SVZOU0x6THhFakx2MUhUQm9WY2F0WlVzSzdX?=
 =?utf-8?B?aDk5MzN2bWpnbFMrNVlDOUtSYWRPaXFGNUFLZkYrNGxicEg3Y20vdGJmZjNw?=
 =?utf-8?B?VnpiOEJzaXdnVUg3LzR6aURtKy9sSHJ5UUdBUVF3WkFNMS9VczdKUStTdTZa?=
 =?utf-8?B?N3E0cy9KU1ZkRWdBK1U4bEU0UkFkOENOUi9lUWJhbGt3c1ZwVGxmSzVGcytN?=
 =?utf-8?B?UnFQRUFmVEZsR2JDNzFFcnY1TUhGM21HQzhUN3RIbWlscFphVEM0czQyWWFa?=
 =?utf-8?B?emw4NlBCVy9uRTk4ekVpYXJWNDYwS1oxcFo0ZTk4RUNNVTFvR0pwTC80TnZr?=
 =?utf-8?B?THNuMGJadmhCTHh5Q2hNdW1NU1p1clZEWDBxaGpQWTdKZkM3aG1KV01lZCtL?=
 =?utf-8?B?dkZEL0R3d3YveXM4ellRZG5GZlJITzQrT2pjNENlNDQ2OFZlQ3F3Tk1lTVlO?=
 =?utf-8?B?SjJoYWt3aGxsM0RiNlRROGZYU2JNNWdtU0c3ZHBwRE5jUi9sRUFhbzNvaGt6?=
 =?utf-8?B?dmJ6YXdLbHNnSVQvTTFrTUNJZHZlSFVDV1laTldQNWRMcDBVMjN0a3A1RXVD?=
 =?utf-8?B?M0l2WDJQd3ByUC9xU0xZbmhTSU16NXZ5ajkzRTFqeDJpVjlJdEdqNXhKTXg5?=
 =?utf-8?B?OUQwNkZpWEs3SXJUSmEzNjRHY1U0ZWlFOHgwR3RTcmxaaXZYZnROdzQvajhW?=
 =?utf-8?B?SFlYQjc3cUVMZzZhV0YvU3ptalkwclZzV1BLcW9JeWNmVVFEb00xTEYxdUs3?=
 =?utf-8?B?U3pPRnl2VXJkTUkzMEZsTEFGVzVpVzVRVGxjekRSbTZMRS9BVExaanl1VFdE?=
 =?utf-8?B?N2VneEw0NDltZnUzTHQ2RFJiTUhubm16anR0NUVzMjZqcXNyZEl6OUhxU3dk?=
 =?utf-8?B?UWZNNHhzenBWWitaUDVkRm1OV1JSZnJ5dS9TOEZ2dVhDdldXQlorQWR5eTFO?=
 =?utf-8?B?U2UxRkVhUjhIZVNmVlV3TTIyc1NMWkxxdFc1bkVmUDN4RHplUThuVktXdVFD?=
 =?utf-8?B?NzFFdkhWM1ZIOEtjMGFWdGZYOWlOZ3JxcFVHeVVvMFNiZlBuSlNHSmlJWFRY?=
 =?utf-8?B?NFN3YW1OZWdyajREc1E4WXF4T1ZSWW9VcllSUWl4MnovYkVwT3VCY0NRNVlU?=
 =?utf-8?B?eUd4K3FXYXJPdWlRN2dQVFdWL2tkT3NJWkVnU0hoK1JTM216d1pZOG44eGlh?=
 =?utf-8?B?OUpoRmVHK3BHeGJadUFtVUdPd3ZDYWF0TFlQc1pJY080bk1HMWVkbUtxTkRB?=
 =?utf-8?B?bWd5QzFKOGlwckZlaFdWUHMvc0tIMHVUNnBTdU44L2ZhOE9zTG9jdERUUDNm?=
 =?utf-8?B?amhBNGYrMWY2akw1OEk4OEZOVTYvVmRJZ3lLemY2c01KRFh4MmNZSSt4cUlv?=
 =?utf-8?B?dDJIUUw0T21PQW5tcUtPNGxQaUdHZ0tFQ1NxVVR4Qm1RMEdDZTVkZ05INlA2?=
 =?utf-8?B?YW9pTGJsUWlDeEJFNzQ2alA5RU1sWS82emo2Mm0yWkxUZjI4dzVTK1Q0L2x1?=
 =?utf-8?B?d09IcXhtcUtHQkNXaVZYdzhMVXNDeWFleVRDOFQ3QzErV3lnK1FYQnBSdnFW?=
 =?utf-8?B?RUVGQ0JObm9vZWVzOGh6emF6N21pYzhIYVBaWkM4cUJsSml4RkJicG0xYUVK?=
 =?utf-8?Q?bkbcsqqLFXvhQOo0WJ4ezK6bD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f93bd1f4-cdb9-41cf-ac87-08da75fb3f27
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 09:25:18.6413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOLPEI7x0m2Dd9WIJg+HqLtib06N4dEo1GjnD1HhVMwlPnoLmEV2qfuKMe0USocIm0GmYsQ8swpt9I9+2OsVVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4784
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 8/4/2022 2:45 PM, Mika Westerberg wrote:
> On Thu, Aug 04, 2022 at 02:27:22PM +0530, Sanjay R Mehta wrote:
>> You mean something as below & call it into tb_start() after
>> tb_discover_tunnels() ?
>>
>> static void tb_discover_dp_resources(struct tb *tb)
>> {
>>         struct tb_cm *tcm = tb_priv(tb);
>>         struct tb_tunnel *tunnel;
>>
>>
>>         list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
>>                 if (tb_tunnel_is_dp(tunnel))
>> 			tb_discover_dp_resource(tb, tunnel->dst_port);
>> 	}
>> }
>>
> 
> Yes.

Thanks. will send this as v3 resend.
