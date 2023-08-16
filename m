Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E627377EA36
	for <lists+linux-usb@lfdr.de>; Wed, 16 Aug 2023 21:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245564AbjHPT7G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Aug 2023 15:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345999AbjHPT6i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Aug 2023 15:58:38 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DB82716
        for <linux-usb@vger.kernel.org>; Wed, 16 Aug 2023 12:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTkp67dklSDrd+5OBYCUL6mQO/E6s0QE+xeGzMPRIKhLyEL/eo/chMZDiK2mjrUUxsjX31eswpWV2BjLQAoTMJ6Ekg9a4Fr4EqQVfxqfsugB/RAKdi0lFZ9M7PSAFAEqb17wZqW3LkmlTE0ca6Nqi5F/IpJAigqHF8GNg/l/100JD5JW4G+JaS7e+br3jBaob8HHI9rgE9Ggs3n5h09mJrjRS0lczyERu/4kiEa7u8Fe7c6xahmYThbIcy51VpfZV7migryD5gfy2h4Qpg7patGZeki+bd6A2e+flSxM84SsrkVI4FDA1iw0iAtoLBKGVYW8a0kyY7TSz1lZCMQ1uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/SodBqvL2j2Ga9fvV9p2DzIPc6uoE7dLHc9Tk5qnUc=;
 b=lE0fXMIW6UCHtGd0AElIA1WgeI+bfWs3CyBNlcQUA/z0zg6uUJomA0jDDtHlm9TRqf3PobOdoIhwIeY09gmBewPNMvh+j4MstloGmaJQHinlclWlil5xzlXdPPwdig9wErWuoj+Pgt5rpbH8v1l9JT3pqP9zDg3OJ0PeNrysv0mxG9W7Mb5qMPEwp0YKvTixlxVz8/qLFD5qQnddKRf4r8DVbAj7LXKyTRCAdlngNT8AWT++iRvc9Q/3WtRT5Jfa6BW2dJrj04KYK5B+Vq8Q1xxukuhsqNL+mgPjhcgf0ulWEuMBGOH3DuqkDeQZY3C3a7xBeIceE/omn91eEWRpWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/SodBqvL2j2Ga9fvV9p2DzIPc6uoE7dLHc9Tk5qnUc=;
 b=ZHfNrN1xRzRt+7IHDBqty/A9NN10+Pzq1WrtcHUg+QnGQ+J4tes3zX1acFBnKHplIiNQcWqluaVwU/JLvVl4gwmTrvrmagT3Ikhsvh7tQvATsIwLgSD98ntVVMk6yKEGVVzLZd5ggt/pTtQ2zxPLaUs/lPtDqaqxhVJZznhy4nN/JUjOFb+YUJAN7E9zKqfshZIukc029jL1qcGwWrzo7qxc2oD4j7qtIdkQnRvb09Nebx7MZiwB9yXqRTC5gmPkZ+qx4jPy09xUhHnNTlnm4uJ9FXUyr+BzqS7B3HbRf0ZodmKgDyFu65HTX+Ck64ISroxHmttFTGtwRFzQmExdKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by VI1PR04MB7183.eurprd04.prod.outlook.com (2603:10a6:800:128::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 19:58:12 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::51fc:914:29f5:a420]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::51fc:914:29f5:a420%6]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 19:58:12 +0000
Message-ID: <1eb2b49d-52c9-c113-7c60-81634edfd646@suse.com>
Date:   Wed, 16 Aug 2023 21:58:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] usb: cdc-acm: add PPS support
Content-Language: en-US
To:     Dan Drown <dan-netdev@drown.org>, Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
References: <2e5758f57081786db37482a50bc0e58b@f9ae53fa8754>
 <cf57f9ef-90f4-7ef5-405e-78f79007f7bc@suse.com>
 <ZNzaYJ7CC/G280ct@vps3.drown.org>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ZNzaYJ7CC/G280ct@vps3.drown.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::16) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|VI1PR04MB7183:EE_
X-MS-Office365-Filtering-Correlation-Id: 71330b73-09ef-45f7-546e-08db9e931edf
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KqC94QcImmqtCajkJTqTSu3OlyakOQDXymzYbHf5rBmCAT0mBMsc8aLe2T5zfvfM0XZGXy/WbrFwLR/+MokpZHeNRtPEDQKDnPviPtm2zYEJrwmOTHtGg98q2P3Xo7AjuSp5dnFjfHw1iv8p5IDZtE2ERri1DvAR02gy0s2qppxBuYKR/1OLn28cZ9liJlBvzToDEbQwIbDLBnuI6a1XT5s7YyH88qJfjRAbYdslQdkMttNyBFZjYx3SIp79lGkhqzArUWUxVHk2LHa8sys1FjDXV4AqjP1736gT8AGOjpZeDniQvbvL+Pm1Uobb88DNxbyHpt1JbvII+tqbbe9A0Vk+IR28BT5WN2wPWyUv00rdOW0/SlrHihiVJjmq/JURw/uKYqVXcP9L4Kxfi49EY1bgmx4b5kgxYf9rjba2bADgibwpnW+PRGAKiWw9K1TBKk26o4JfeBvrGGhxANf49GTNT28mWc0UeHJns4EmDqnP46BT/9ZZVYmcFAyFEKwFMC+Gyy2rCSAjPcA3SZZeYr6cyfqed5iVvr6oq7qpdI+lFzm6jx/CILHuoKtGQjzkvKqbl8A40Nl//JBqvyAueMgDZX6Z9o56sL1v7YP5WKEMZ6cOURq5qY5sJYlrS9/tNECjRLymn+8Z2t1cHqDEtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199024)(1800799009)(186009)(316002)(66946007)(66556008)(66476007)(110136005)(5660300002)(41300700001)(38100700002)(31686004)(8676002)(4326008)(8936002)(2906002)(4744005)(83380400001)(478600001)(86362001)(53546011)(6512007)(31696002)(6506007)(36756003)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG5ramY3Rjh1WlB0aFFFbFN6WU9NQnB2NUVhdW9seDNwSWo0NzQ1TUdlRVpT?=
 =?utf-8?B?SGk0YkNUeHRaWUVLaG1yNGV3WWdUTnpSRm5uYWpBOFU3Z1FWOVRheHhCRDNi?=
 =?utf-8?B?S2M0SSt5SWhTRCthL1NsSE5UU1JJZXRiUEx6TnMveHNkMGRiNjNyVDJFM0pY?=
 =?utf-8?B?Z1pKNDNBby8wZ0pOZEEwOTdNTU1oajdlTHZjUFNWZ0Mza0s4WUVDbzU1T0xV?=
 =?utf-8?B?bU5scW5ZM2c5TVdIb3pCOE9SdWg3ZndVQkMvMkZYREFOeGl1elFwMTUxWUlL?=
 =?utf-8?B?RVNIT29SdTlQNTRQd0svbHpuT0FQbXBOZ0cyMUprcStzYUU2SVZPalltSHZt?=
 =?utf-8?B?akUrY3VSSnhFRks3TGw1MTJPRFgzd005aC9nc0RWWU5hNFhveVdaNUtVL1VJ?=
 =?utf-8?B?clh3T1gycHM4VHlsVm8zRjc1Ny9zVEYxK1RsOFRPQzNUSnI0V1ltdGZKbm10?=
 =?utf-8?B?MWZNR1BVYmdqam1lMFBIRVZodDc5MkxEbGsxTXdiUFdzTzk1REliWHpOS0Rx?=
 =?utf-8?B?RU5zRlAvUlJPVXpORWQ1UzV2aWp3TDJXbHUrOWFhZUt3NmhmVm16dkZwZW9z?=
 =?utf-8?B?c1ppTmZ2SXFYSkFtMGNGUHZVcGxMT3B4NFBMc0tGWTFlRU0xblpLZnlzTnBR?=
 =?utf-8?B?VVFMQ2J3NlBRT0piSFE3Rjhwc3dyRGp3SHRyVmUzWW5oY3ZVWE9NSVFpNTUy?=
 =?utf-8?B?aGpHNVRJS2RzVVludDBLdk5UZ2E2NG9oak5KNElXREhaZytiaTZVOEkzZ2p6?=
 =?utf-8?B?SkJTRGFkblF2Y05ZcWV2aktSSFM3M1lweWdMVmNWL2VTNXhqcklmbGJGUWlE?=
 =?utf-8?B?Y1JBNlQyajcxMXI5ZzQ1alUyZ1BHU2xIdUVHcEkwb3RSVU9DU1pLWU9iTWN2?=
 =?utf-8?B?bDlteGcyOUI4UXF6SFd1TndTZlorbFFGcWkyYkNDUlhBTi8ramlvQUFRelF4?=
 =?utf-8?B?WnhrOEJ5U08wZDFTQmFQbHNYeVRBTTV1UFMySU5WQ05uRmltZHZBUVRhQW81?=
 =?utf-8?B?ZnphYzAyWTZzWUI1RXEzRWd4RWdkZEVXU2JDa2FzVHMxVVVSZEppRGN2S24z?=
 =?utf-8?B?dnJIby94cnNCamV4YWEzQjVEbTFaZm54NjQvb09GM0R1OVFJZVdtbmlHU1JY?=
 =?utf-8?B?OUo5cU5yRnhaM2padExJOEtHaXIxRW9DYUwyZEUyRkY3ZHVsNEc4S21tQ3dI?=
 =?utf-8?B?RmdLZkwwUHpETXlNcm1ydGdwUmUxTU9wdSt5Z3JUempieXN0aWtzYlNOS3k4?=
 =?utf-8?B?T1NucXRCVGdSQkZCc3k0NHhzczgzZ3FpRHVHQ3lUeHo1WTZGQXQ3SnMrR0FE?=
 =?utf-8?B?Tk0zNkhHV015R1VOWnRSaGZGYUhkeVpSbXZ2V2NEaHEwdEJTVXRqa0crTFhU?=
 =?utf-8?B?T0p6amwyRWFhOGZxSnkxdHdCalZ3b1FOUGV0eFUyYmFuU2VMTStIS0RoVy9z?=
 =?utf-8?B?ZHU5Q2RjMEtpdzNqSitXU0VPYjRKaDlnM3FqVEJhWnd4bWplWUNqTnNYRTJO?=
 =?utf-8?B?WmlMVVhXYVc2QlMxL1RvbjNFYjJsc0h5b3lKQ3c0U3RXbVdRbG80eFF1RllZ?=
 =?utf-8?B?eVFzaWxNKytIQ00yR0JNVkdqbnRmbUNyMjVVdnUzVEJ1MURWYVMvcjlPVmJZ?=
 =?utf-8?B?UTNFbUNmMGIxVWx4RGZFaWpBdzhCdVQ0TFFpYmtTNGFDcVFsUXJlejFPcFJT?=
 =?utf-8?B?NG8wSnZ4ZnFyenl2Y3NXd3J1blE3TlVVZVJuTHJoU2NvRVlid25YQ0FrNU43?=
 =?utf-8?B?alRmOUxFKzlXVngvWTh5bks5cUFKSlZTVXkrU1VlMU8weVU1bHpPNDNYUGQ2?=
 =?utf-8?B?NEU1bW1aRUJ4SGZjN2ZMb04vVjJwNi90OVgvK3VmbmdSRFBrLy9FdVFyd3Fr?=
 =?utf-8?B?ODlnTGVvK2dnQllRcHFkVFJSckxNd1pLa0R3eHRKNStjUGpPMDNtYVpoYWhN?=
 =?utf-8?B?dzB2N011QUJoaFBISWYrM20vRmtrdzdYcnVNR05uVzlCRy9uSFZ5NFQvaW5s?=
 =?utf-8?B?N1RaMjg4citWUDFadDJQOFZMSGhKWGZFV0tMYTB3NGRPTGN1RkZkeXpyZzBk?=
 =?utf-8?B?NHlGRUdsRkpFV3BTTnhjL3Z6ZHcwaTRUWVlVUHFOcE55YTA2SW52UXlvYXlG?=
 =?utf-8?B?RG1SN2RQU2ZBKzNIQXZoR2pMRHNLRkdFazNOWHFwa1BoUUpQUjdpTmJRcW8v?=
 =?utf-8?Q?UAmdzt2Xv/b7cGOFxIukqh0mYn4KwCafzlJMjkF5Cj0W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71330b73-09ef-45f7-546e-08db9e931edf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 19:58:12.0544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7689M8tXM43dc8jd+DVye5lxowJIKGQJrEUq+Y36eeb/lgHvEeEbsuN0bd4rk/t46M/Lm+Xa1t3BaPdFpJ3MiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7183
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 16.08.23 16:17, Dan Drown wrote:

> Looking at the callers of tty_register_ldisc, the only one that passes
> in a dcd_change handler is the pps-ldisc. That's not to say that
> couldn't change in the future.
> 
> I could move the call to dcd_change before the read lock is acquired,
> would that work for you?

Yes, better safe than sorry in that regard.

	Thank you
		Oliver

