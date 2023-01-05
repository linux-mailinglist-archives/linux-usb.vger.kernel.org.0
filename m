Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6570E65E44F
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jan 2023 05:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjAEEC0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 23:02:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjAEECW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 23:02:22 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2126.outbound.protection.outlook.com [40.107.220.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA4B30545
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 20:02:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQJmgiz65/e3NRB9U4LidHKz2Gw/Uq04iiTbsl+wR5MzSbl8IZw9ypiw8wbLL7XXifI6cKhBCYRRWvDR2rexfQlBp69vKXkU1Tys2803Au3UUHYb2HSauSBl5GDICbYUfUpUwlxaciRlmRF5+9Qx9fK1WrKed72Gnl3dJ/50LRoLmvbtpet0k94Z1EEerHV5m7IKBBYb+xSifkOmfEJKnXeH9K0sur82HKkvJD+g1+bTLfUGuyBjmAxPdwbc/V6XGN5BPzdEU9Tls1Ga67cEYrAIMQWiEKsMx+A3w+9D9VqDFOA3dukr5oYpeba8nEqZy09lHu2ZbWv2j4Q9qy2MAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k88mjKtMbCMVN0Sog9IeYBRcmUcKnUIhX9qq9fC8rkU=;
 b=WT4AWYEuRMyjccF/T2mZwxtY9RdZjbJnmfLEy3KDvaYYg7xnIp9okxC39+pMeQ2fdUOve2bPODu6SO0jj0Ibr7hKXTQuRQGdMKhE6ghpEPU3PywUf03sF8OMn2xBZr9ZfKroCUmP07siInvyQqJDGQW6EX983/LLSO0DUbDdb+h6105WNiOEAiKlZlV7pduddEoQrDAT9hzW76UCTZ4zZeh4eHNxHeBtaX98adc5TPu353ZbV/ydFIavGuKpKCROmnt2zdMwyzOtHdN5sQgNAuW3WrXt3PzMRZGpApwaOSZO6OptQ3zy3NCbRcSToHV2LBIm5G/csq70RdYrW+KS8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k88mjKtMbCMVN0Sog9IeYBRcmUcKnUIhX9qq9fC8rkU=;
 b=BU6rJ4JAvXzNRSv7AObl4JTX+fBTCo6YWRjvHttT/yTGgAioJz2fN7uXvtrl8jw5zu9deaxANkP79T2jobCcNsdIzJmtmUqn3tpoaZOVBqGdcIhl2fRK341Wpi00IMDw/fqP99aHUOzlf31Ee2WvmCzBtnEWdysCFvEHjHP/avk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13) by
 MN2PR01MB5520.prod.exchangelabs.com (2603:10b6:208:10e::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.16; Thu, 5 Jan 2023 04:02:17 +0000
Received: from SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::1e67:38ac:ed37:be1c]) by SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::1e67:38ac:ed37:be1c%3]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 04:02:17 +0000
Message-ID: <3fc02af3-3ced-0423-f3be-3ff546b8d26b@amperemail.onmicrosoft.com>
Date:   Thu, 5 Jan 2023 11:02:07 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: The "bus for gadgets" is preventing the use of multiple UDCs
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frank Li <Frank.Li@nxp.com>, Rondreis <linhaoguo86@gmail.com>,
        Chanh Nguyen <chanh@os.amperecomputing.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
References: <Y7WkOwcNYl2mWyiW@kuha.fi.intel.com>
 <Y7Wo0jyqKuB2iUsc@rowland.harvard.edu>
From:   Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <Y7Wo0jyqKuB2iUsc@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To SN6PR01MB4973.prod.exchangelabs.com
 (2603:10b6:805:c4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4973:EE_|MN2PR01MB5520:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b33cd2b-9a14-41e4-f30b-08daeed1a294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ojxtqATXXXRq1ZdNXZE5eQaciPIcOXH7luAUvNlLtPQ/byYPiQPGGWeQKH42fGiN3TpDmyuMMJ29nqgE5XbuGfyrwSP5/uPCXmRoGdCzy5Sxoa/VOjrmtkHLDIrdJwvtsyVBbN1DzE5Ps18JtbKvxvqMCOElWKfmt5z15j8ZijZtAWskciS6ywnnJbJzeTE9tg9oRjntZYweklWbgyNmQk3ygCqjcUKkCUqVYyQXJ9yDfMdpyY7zLJmr78Adbvz0dJ1kwBrO/7dszZqwpEQajLnXmDtli3hjH3+aFUakOkzawFKYv1q2hDEoS6ZfnSt0p6lUSo+o/FTKARz/AVBbPlyGRTXkUX5LnC31HmXVToj7Zii2YcZ0hcQ3/p5LR7CmpLypESrP9b/tIXWHDptr9pARP3Nz4izIWCciGQvsg5XRM5BnMaKDhgnV8kt36Oo8rGQJ7knLT0h3tuXW5cFuROYroNBQwoMudHTTnR5aI5b36SVAGZu4Px1775HgcF1Q8zXQbqi62GpBQz64QUAdtpfDFQKIO8xumS8eVyno+AH6tQnf9z7BrPzmQnNvzoT5Lvvg/OpFAwC9S0pERDtXIOf3VdYtPDc2/klTgzFE9I+DXGTsfTncEKdO9jWkJgwxO+hRW9aUasH35vRZ4xJbvsbwBAZ62zHjKCs4E4Q92vWa+IZv3Y0pBcBoxl4ypNSSlfOdZFuB0MejgfyuYPLSug==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4973.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(39850400004)(396003)(136003)(451199015)(4744005)(2906002)(8936002)(5660300002)(31696002)(38100700002)(41300700001)(83170400001)(186003)(26005)(110136005)(6512007)(6666004)(54906003)(31686004)(6486002)(8676002)(478600001)(6506007)(53546011)(316002)(966005)(2616005)(66556008)(66946007)(4326008)(66476007)(42882007)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0FEbVNaVURpK0lKRnViRGxjaGc3N2YyQWVwN1R5ZU4vODJHd1BXZ1NnaWNs?=
 =?utf-8?B?RDVMRkRsUW9VWWJzWE1NSjdLUFYzM0s0YU9xTDRhSU9iUUhRdHI0bVkrUlhE?=
 =?utf-8?B?OUcwWGFRY0lZSGdQWUZkbktVa2N4b0Y4R3psQkpSZU03SWdhYVd2ZDZHQkxZ?=
 =?utf-8?B?Q05IZHQ2aE9qWWRmV0NsMlZNWDExdlFLSE9YYVJ0aDJFcWROTENJRW9Bc09s?=
 =?utf-8?B?MW9TaWxjVWVCSUFjSUdjbWVXQzYvZ01Nc0Z0anBycmF2dWhacjJYZHFIa2U4?=
 =?utf-8?B?WU5POU0wQlU2RlpDN1dSYU1XcVRCTXR2enJhbDNiNXNBWGhFcXZRRlJZZFh1?=
 =?utf-8?B?d2srYXZJb3d1NkdzMDR3MmdrQ1hyVFZSRndya2ZCek81c1BLdHM4TEs1NytN?=
 =?utf-8?B?SE5ZSENOY3o5STRzREk0OEJENVlpa1hDcXFOOTVZOHplRUN3L3VPSklrMXhj?=
 =?utf-8?B?UzRIeXEyb0NOY3Y1Y0VQcWFteEdHR3B0ZGhEQTZYNkpYZTlOZXhmYTQ4S3Q5?=
 =?utf-8?B?T1NTdDREbzVpY0xqQ2R2b1BlQjgvRE94ZmYwaVFHcXZqMmRsMzhqUjBhNEZS?=
 =?utf-8?B?UU04SGt0RmVMMnNyTmIycXFlbzJHSVRFanZvOVNSb2plMjNjMU54d29GaTI2?=
 =?utf-8?B?TVV4Qk4xTXJmeWV3cE0xRThVRmxjZnBnVG9UTU1qVFhmUHM5UGFaSVpYL2ZM?=
 =?utf-8?B?UHRwdHhOK3ZydmVSdnpXZFBPRnNkcTRVNG1VeVNxY1c2Mk9SZi9HSTlBWVNI?=
 =?utf-8?B?VElwK01JMHRhdWUrRTFoL0lYWGx4MmZYVXBkY1Z1elh2eTZ5YWlNVVcwTWlG?=
 =?utf-8?B?MjBaVUVsSWhUaURxQ1R3TGVZbEtkMGJ1K1ZnMW5SOUdxTS94M0dCNzcrT3NB?=
 =?utf-8?B?dmFKcEUvRUxZUnpYUG9pRGFYUHRNWG1wQ0E4eVJWM3dFZkZwOEJYN25sWTRz?=
 =?utf-8?B?a3g2VzNmNWpCYVM2aGpIUHBOZW56ZmVMVWpqeUFJU0VpSlR1Zlg2SWl4amVN?=
 =?utf-8?B?ZXlnb1dMSS9qMW5od09KNkx3b1VUVkNEenJkTUFYS3dwcDlkck95Rnp1Nk1P?=
 =?utf-8?B?MXB4T0hnK01SS1IwWWpVZFBFNnE3YkI5VGc3UVlLQ3F5SEFxNFozeTRvVmk1?=
 =?utf-8?B?Y3Jrb29PbXZSVVFWb01RZVkvTjFJWHp6cUt5ZmV4eENvc1NCenJKNTNQczVo?=
 =?utf-8?B?SmNGQWpDRjIyUlBvRHJjMGdDdTg1bDhldTQzdW9VWWFvOUM1aW90aDNTL0dx?=
 =?utf-8?B?NEVvYTk2V213NzR4aC9CN0ZtMDdUQXZDMzZlWEtUOUsrVGhmM1pENWRTdi9a?=
 =?utf-8?B?RjBnZytRVXkyclA3N21zN2szcVBqd2RCNWNEays0RWFiM1E1L3dVc25HSWlo?=
 =?utf-8?B?YjFXN3VXM2tDZkdYS1EvY21hc2RJb3pZcFRhL3ZMMXcwZ3daMm9VY250KzJX?=
 =?utf-8?B?T2JocnBYbXVpWkhENHgzUFRRRlZMWnhZRmVxdlBhRVc5Q1VUUkNmWFM0MUdr?=
 =?utf-8?B?WXVJa2UxaFNNNmVPTGpYdmRtTmhvZnY1dzVubTZxWWZYZzhuK2dKVWxXVEJk?=
 =?utf-8?B?VWNBdTFBQzhQL0M0Qkd4ckRiUlE0U2t0VlJoM0FYcDF0WjNhU0J6YmdmNG5K?=
 =?utf-8?B?Z01DMTBNVG81V0pWTHRvdE9UT0lGTWc5STh3VzNDOVJPZ0VqdmxBekZYaXIz?=
 =?utf-8?B?cHVNaUxzdU10Yjh1enEzc3lLb3Y5c2E0QWhkZTUrUkNxMlBtT0x3cE9QQjhl?=
 =?utf-8?B?TWVlZ05VdENldDlkSDl2Znd1WVZFelJXTGFvUU9xM2NEL0VueTd1QnV0TXpt?=
 =?utf-8?B?OGtCenRXSWNoOHErZ2c4N0ZYa1pFOU00MzkwOEV6bzdtWUlnTE9rMGkxTmp5?=
 =?utf-8?B?ZzdGVGJlU2liWmhNS0hlcGJNUFRKYWlsdTJvcitiLzhRWDBjajI4RFZNNEo1?=
 =?utf-8?B?WFIxUmwwanVEc21Uck5SVHF2dFRlc1o2RGlnS25LMzdMNFpqRktQN3pQVWhk?=
 =?utf-8?B?RTBkUHBRdjUyZUVPQ3EwaDlORGNNcG1KM2xDQURPekhzcnlKTGdWc0tqOStj?=
 =?utf-8?B?RHN6MnFpTGtZL1A3enZPTlRWYitnZUVoWlA2SWQ1dDhXNlpwNUErV01IUk9u?=
 =?utf-8?B?bGlzQ2lvcjNhMmkzbkk0dWNqeEtnQ05yTVo4US9SVHRRYVBKRDUvMmFoUWZS?=
 =?utf-8?Q?T8uDb0r4DfktooVfxx0SaIY=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b33cd2b-9a14-41e4-f30b-08daeed1a294
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4973.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 04:02:17.4748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtgBf8/ywTQvBnejHEUGUq5ZQ66jC1aLxE9wRX1zxz7GY2rr1J1L5e46TofawBhoD1LD9kEmJNO/GKDEBdyPKR/5ayVJkYClopv2zX0SCZN7j/TVL2NfpSzyMxFfiWSP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR01MB5520
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 04/01/2023 23:26, Alan Stern wrote:
> On Wed, Jan 04, 2023 at 06:07:23PM +0200, Heikki Krogerus wrote:
>> Hi,
>>
>> Before the introduction of this bus it was possible to use configfs
>> with multiple device controllers:
>>
>>          echo "dwc3.1.auto" > usb_gadget/g1/UDC
>>          echo "dwc3.2.auto" > usb_gadget/g2/UDC
>>
>> But now only one UDC can be assigned. When I try to assign the second
>> UDC for g2, I get this error:
>>
>>          Error: Driver 'configfs-gadget' is already registered, aborting...
>>          UDC core: g2: driver registration failed: -16
> 
> Two separate patches have been submitted to fix this.  See:
> 
> https://lore.kernel.org/linux-usb/20221213220354.628013-1-Frank.Li@nxp.com/
> https://lore.kernel.org/linux-usb/20221221091317.19380-1-chanh@os.amperecomputing.com/
> 
> So far, neither of them has been merged.

Yes, I'm testing the patch v3 and will be sent out soon.

Chanh Ng
