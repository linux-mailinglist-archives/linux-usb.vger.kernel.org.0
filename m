Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCD28697616
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 06:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbjBOF7Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 00:59:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231915AbjBOF7Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 00:59:24 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3DC55B1
        for <linux-usb@vger.kernel.org>; Tue, 14 Feb 2023 21:59:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGKNi9rtfk0+VRxfGfYVztNU2GpVYjUsD18cFHU0NJIIhK5doB3fWNA6sIWr5ezXWoJDOZxirtW6OzGGDCU8ESWDjXLM/yugCS+3gh16c/t9gd/LCc42IdvbhJ/nZc4KjfhTMY+WFDvvKVXsPJnYNelmU778fpVMug2PcrtC4fNh61ruxeFVhDXDXi/ExLQHR79UzMeUTlawukY0qdzvowLz71sS3iDj69IkODastXYFFsCR5bSy0cAlhqHUgl7W7T+PitjlsVV6zyfeFvMK6DLY8VG4IZXr6fo+aq5fbGY8tjs68D8ihF5T7ITY6NtRPHug4FmxXNMYfbH24b+1Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dyo05LTgxq/j6g8dQUmvG5+GyQOFKm9kCZvAoE6lTk=;
 b=LjFvkAwfEpRRILziuv0gt6VthL+TWa4bZcF4jFKeZSdyaQoes2sV8/Tn1kcnhHca9v34nyp53+3MxmCW2vPTfA3rq5PxJeZXo6bNsH8Q6OQM7nzfnNNIX7lDlIT2GmfHa+1NUxMnHB1fl3Wmr/MdswWwgpYfNCZFxiyuoZCuWmMNlpNz1oacry7Gr4WJGNh/AKsinBCFw+dJViIlZOlZGFYhEn4e3jUXlxPiCduzBp+ebOtzDkVQpshCqLviw4Kv+TYJZY0XD99N1AWf1aC+3IUXx5g7Mh5KE12ZuDX0cyZvvM/ZPIOm30+ui2G68dYZyj2PlLRTM9WkDSYT2z7Wpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dyo05LTgxq/j6g8dQUmvG5+GyQOFKm9kCZvAoE6lTk=;
 b=eLfqdQ1Mnush8jdhBK/t2qlmNeLRuu72U+YKrlVTgYuP+XYwKXOXKU3XaB4wBelB8qun7jDUuwXdG0o71ZEI6xotI4VhbjTf17kBiaApaEXbXzuBv/m38Es++c31k8cznbsP+GkoGyYKm2yiHHWMqB0sjFMLo6+9Ywxpy52jkRA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by IA1PR12MB8287.namprd12.prod.outlook.com (2603:10b6:208:3f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 05:59:17 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::40f4:29ea:fc74:a9c7]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::40f4:29ea:fc74:a9c7%9]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 05:59:17 +0000
Message-ID: <a4601106-e41e-1991-9f63-b595243dc8bb@amd.com>
Date:   Wed, 15 Feb 2023 11:29:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5] thunderbolt: Add quirk to disable CLx
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        linux-usb@vger.kernel.org
References: <1676404912-7048-1-git-send-email-Sanju.Mehta@amd.com>
 <Y+xyh44lGEzwuOj/@black.fi.intel.com>
Content-Language: en-US
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <Y+xyh44lGEzwuOj/@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::15) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|IA1PR12MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: ff19a763-b52a-47c3-23c9-08db0f19c455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BQRA8SZ3T5AyqKe33khCSVH1VCelvtE63bnodOjmW9FjuHpcSN3QppHPZS6VRTWLd3aUyX1cr6gWryyOEnLqzMpLHw07e19jG9o39aQ0YEjQW9wTKvu0ijyB9z0y2iEJF9aA5uOE5MyNvF+LMYQfUTmhnD8P9oETj3xPAnchhaw1Znz9tuE9SBvmcK11p7GCKTG4j0iXmrtPcGLmgHYQNug4sfSXMCqgFRgDh/Y8mihUdiXMIHf780LGVzUaLyWZCIwbMeTDmIlsn1LbE5A+zEMdeVRSUQ/+YZLvY4UW30xSYjV8SY/d2nvyHP0h2Vt4fIpir9aZu2X8YN7nSBhq9RMb6cgxQQGsm9Sm7LpeRdAFtKyU9/77d0EQmWx9odQVOF3dg9xv20wu30glX5YFW9aypnImqAdbqtCQVyVBz/vdGHyv5YihouEVf2k3IFjYd3FtaO3kWAdhkUGjKij+lGWmTmci92u7uMqGWbVcINenSb0G3kCBsQY6J0FwS3YEQ4rc8sB5dUGqtW3OuJ+M53uM32RnHRXmNTKOMZVwLJE22X5hfeVQB8EUpE10LxLEp+kqJPEV5GIfj3he1t13KxqWp0zkWEz8e5EznLQWGMN1QDsrPlNE5cqitPxeU79v3xMd4KJRGkFJv3ZQJMeID319X3FJ9WAJI5ch1o4dyAxhxDPLM56P8AkMEqXcne6pN0TLCybS0srIC9bDwjC9SxNUFWI3abkj+QkuA3OOF0bJPhvCtgpS9jkHpnfxB6UXMSu4TOBMr8VyjewVhuNh0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199018)(66946007)(31696002)(83380400001)(36756003)(6636002)(110136005)(2906002)(66574015)(66476007)(66556008)(316002)(2616005)(4326008)(8676002)(966005)(6486002)(8936002)(6506007)(53546011)(31686004)(6512007)(186003)(5660300002)(478600001)(41300700001)(6666004)(26005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEJwUkIyVGluUUZTRmY3MkFpUTNQTGhtN2N6Z3cyNzVNbkZUS2ZVTUdORHFC?=
 =?utf-8?B?VjNPdFZXNFIyMUxaUGZaTmlrZ0NnbFViRVRaNGM2bWtHYWtjLzJWZEVVWjJu?=
 =?utf-8?B?S0JzRGdaWVJpTTl5elppZS9oVXF3Z0hLNXVuUnpoMzB4VHFqUU41UUk0WCtI?=
 =?utf-8?B?SFE2Q2tNRTVMR0tySm5qY0FxNm1va2dsMTQ5UXN5U3ZVK0RjdGRFeGRBekYy?=
 =?utf-8?B?dUsrVUZJdUpReThsQWRURzNPZWx3TUlEejQzd0tDNXJtNFN5aWppb3VrWi83?=
 =?utf-8?B?OGdYY2E4bmJXMVNEbkc3SmRoZFhpT2Z1dXIwZEhaZGN2VkUzaGs4UWdWT2ht?=
 =?utf-8?B?T2dqU1lIZ2lua1JWUTBaR2ViUXRrSUFSZERudlE3N0h5VFU0MHF2VWY0Ym0v?=
 =?utf-8?B?Q3puVGtEUE9lQVM3Zkc1VjZOSmRhL0JFNFV4SU0rSllMSXp1RXgxMVRUSkcy?=
 =?utf-8?B?QmZERzZzQ2VSZlVMT29PYUNhb09uRXkvZWt0WlNXQzV0RlJiZGlocXAvL2VY?=
 =?utf-8?B?TklUdWQzbFlBY2RuakdHY0JOMXV0VXZSMFZPQStESW1FUmw4M1dHaUFrMmhJ?=
 =?utf-8?B?OFQzaW8wcnJ6ODEyOW9oUzdHS2dOcU5GRitUQSt4VmdJZG1BRDRMTlU1ZUl6?=
 =?utf-8?B?enRweERqT3BuZ0JZdG84MWF6OVVOUmkvK1dGa2s0SFFDNi91d2xuQ08vNnl3?=
 =?utf-8?B?dU9najZScjZsb21nM3UvSkFHbHBPSmJmS216MDQ2NlVsWmN3Y3ZRb3QvcmZ0?=
 =?utf-8?B?QmFoK1RQOS9QZExxN1FmaTY4WGFoWmZubFQ1ZVdKSXIwK2FEQ1loOEp6S205?=
 =?utf-8?B?UlhjeUZvaDhQVU1VL2YzeENWamprWElNcWVIMHEycUZMZE9UQ2xxMVo1a3R5?=
 =?utf-8?B?ZkJvTDdpYnZDK1Z6WnBSUk1GenJ2c3cwckNYNlhLaDhqdytjWURxRlRnODZl?=
 =?utf-8?B?UUJvcXRMUm5HaDk2UCswNjF1a3BNUjJVUWpJZlZHS3FnUGxTbjhlUlBJODJo?=
 =?utf-8?B?QnE3cU5uTDU2WUYrYzZJbUhTSkNCV1BOV216ZnBLUnVMVWpZL29PdFoyeSt2?=
 =?utf-8?B?Qm9SVDFCS0FXb3UzL2ZoVU1Od1hITTVrRk1FOXR4bkRUdHpkdDM5cHpaNGJU?=
 =?utf-8?B?WlQyN1UydktmMHJlSnVyVW43VDBpSTcrUnM5emJSVHJCY2MwelZOZzBtd2Z4?=
 =?utf-8?B?SzlQdEFsVEJobTJwWDNzQVJER0hrMmhCRFZKSHNOWjNsTmQ0Y1ZZR1MvZ3py?=
 =?utf-8?B?L2JHb1hRUUUzOWt0bGwxZUNTdmFSTE9pclVqb2ZIUlYzenVkVmZRMjlFaHIz?=
 =?utf-8?B?bUNva3dWMnB0UVVGYVNkWXljQlBScG40R0g4eTRDTXNEa3FWSHpkQXlvTm4v?=
 =?utf-8?B?cUVRU1ZMTXBhemtBQWRFaW1wSWlIclF6T0RHbllpemZyVEJ4TUxDL0EyY1RL?=
 =?utf-8?B?NEYxYmtZeFBGOXJCK2lmWDc4U0FMT1hPQ0NvSm84SnVmcjZ1SGN2dUJDZzlm?=
 =?utf-8?B?bjVYRDNxME5SOS93UXZxQldPdkNPQkxqckZ6S3BRQkVwQ2UvanJPRkdpdzJ0?=
 =?utf-8?B?Um5JZmNzN1ZQdW9URVZQYVFzeVljRE8yUnp6c1JYYzBrdnhuMUc2bGpJZytp?=
 =?utf-8?B?SFg1Rm9kS0lvcjJQU2dHNXEwWk5ybCt0RS9LMXdUUU1DQ2hzWjFqbE1LUUVP?=
 =?utf-8?B?M0ErcE9ITE82RzlFd2lzWG5xMXRQeFJRMkNob01SNDVweHJZQkQxVnQ1L0tJ?=
 =?utf-8?B?bjFYYnQvTDVDVEI1cUdsYkt5M0ZyV0JOUnJ1Ry9rZHdMRHE1TnRmS2VXWVR1?=
 =?utf-8?B?MlROK0tPc0kzYTl0RWZQdjErYWdBVzRyLzFJMExKbjJ2NEtHUWYxWnVNRjlX?=
 =?utf-8?B?NlM1dXp6U2EvTFU4NW9ObVNvK2JOYWZyT0dVOXQyenpFUkdRU29yZ21UZ09l?=
 =?utf-8?B?SlRoV1BMWFBseGY0emdlQ1lQYjZOcWJhUU05cFFCNUtkakRzSC9kNVFXRzhj?=
 =?utf-8?B?dFU2SG1jV056ZXJaUVY2N1EzMmsrSkhZekhQcURQUWlTaE91QW8rNE82WjJt?=
 =?utf-8?B?THR4YjYvazM0Mnk4Nmx4SVdWRndkdm5tbTV6RTg3bEZ6TFozWEtmeFhUeTQy?=
 =?utf-8?Q?y6igdm4za0L7uswIxs9c+CdF0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff19a763-b52a-47c3-23c9-08db0f19c455
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 05:59:16.6516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwp7W9mwVTeqO4A06eftN0Aa9YON1hB9zIcQ9DAn2F1dzzUMXf0gg7J3+FYS3cN2Hox6WUuqNQBaFGTpBwx/7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8287
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 2/15/2023 11:19 AM, Mika Westerberg wrote:
> On Tue, Feb 14, 2023 at 02:01:52PM -0600, Sanjay R Mehta wrote:
>>  void tb_check_quirks(struct tb_switch *sw)
>>  {
>> +	struct tb_switch *root_sw = sw->tb->root_switch;
>>  	int i;
>>  
>>  	for (i = 0; i < ARRAY_SIZE(tb_quirks); i++) {
>>  		const struct tb_quirk *q = &tb_quirks[i];
>>  
>> -		if (q->hw_vendor_id && q->hw_vendor_id != sw->config.vendor_id)
>> +		if (q->hw_vendor_id && (q->hw_vendor_id != sw->config.vendor_id &&
>> +					q->hw_vendor_id != root_sw->config.vendor_id))
> Again, why you need to change this?
>
> If you have the AMD host router device ID in the list the quirk applies
> and that makes the driver skip enabling CL states for that link. It
> should not matter if we enable CL states in the deeper parts of the
> topology (even if we actually do not at the moment) because that's
> completely different link, right.

Thank you Mike for point it out then [PATCH v4] <https://lore.kernel.org/all/1676402030-4653-1-git-send-email-Sanju.Mehta@amd.com/#r> patch changes solves the purpose.

[PATCH v4] thunderbolt: Add quirk to disable CLx <https://lore.kernel.org/all/1676402030-4653-1-git-send-email-Sanju.Mehta@amd.com/#r>
https://lore.kernel.org/all/1676402030-4653-1-git-send-email-Sanju.Mehta@amd.com/

Please review the changes


