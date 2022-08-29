Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4735A4578
	for <lists+linux-usb@lfdr.de>; Mon, 29 Aug 2022 10:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiH2Ivz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Aug 2022 04:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbiH2Ivx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Aug 2022 04:51:53 -0400
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00059.outbound.protection.outlook.com [40.107.0.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5212C5A147
        for <linux-usb@vger.kernel.org>; Mon, 29 Aug 2022 01:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CH4BRc17ZwhCqoaLTzKzpgXzdD0dB2os+erzDnbxyr/T+HHyOwtX5IKBKTuTv+2sz3sX8Hnzs5GP0g3vRAVc99y47FNEHo3QY07h2vfGKKJgK4kbv/g6n7CXfx+dahoAnvVuku3JM0spHldw7sfz/sBN8hGkuQcWuhI7PwV8z2Cggq+4xDdmCLkJARJrFqeLP7M8+UOolmR219ElYMHhG38i5TMiDOlaPhUwblevUTpUWJaoHR1/hS91dHKBrryTeuNrbPf9ObjnCl+eTUkgd58JaR5rL49IZKfm8fttTgTQc2FETFglU83jaz8Af9fM5vvI5bFifHMCjlsexKRu8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fn8Aq0S5AvogV9uwdM/bWTMLNVp5z8HlOMblM7If8kg=;
 b=WhB6955PoDSN50ZGS1bvmSuJQN5Daoh2yXjVpbpgQ+VMn+QIizNGgEv2RzppK0vxmNL8475ZZoYPHKwkNQa5wM7iRQrsjt8gwrThQyTcnKQScNFrhWpXwTCxVzPz7vrCOfN1f1VVxAgseZPg+O4JKH0NmjOapxETztU+8OQ2Yx/p0Xj3C4mFZTHGAsAr0WY9WhJpINCiYMKz7A4T+SprxzMODj8KDW7gjhLaOeMIYQ8kM3bqXEU4hl06Z1PYBosY0tXn+xnIv1EML6SOU2UbAqjn59dsZGgFug/oVz3eOjYsx3Er0Fuc6tf+x9GBrqpAwSAiKocWJDbwfHPpdRZs0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fn8Aq0S5AvogV9uwdM/bWTMLNVp5z8HlOMblM7If8kg=;
 b=jas5i0pK1yoM07aDhAy/4kLMFI5NYI1HGEKkEQr8eL+tyDsvP9odQkFIqeeuwW0UGEWovFSeg4hn5G55q5tjh79ikkwXWHd4HKiKJhyzRGICLsJywHOMYrnHHGAuk3dFbfOtj6z/yPA23WVIU6lS4vjxU6kckyXj0IZ9vuURvPgvw49+zBL/ak3q1Xo3xOeiYAo+kWC94G8W4Ron+hdOwUs0wKYV9wgNhj36R7rDwVL+AnLRqEOhxBjQc1xxSeJDgmlH4Eo9VGP0vH+CZJiaFNQT9MlVGZmwO4y1RYLP3ajFpOuE9AqEvHouKl1GfmsUjF478cL2THEmFVuuGDdHqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AM5PR0401MB2562.eurprd04.prod.outlook.com (2603:10a6:203:3a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Mon, 29 Aug
 2022 08:51:48 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::b083:534b:70ae:416a]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::b083:534b:70ae:416a%2]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 08:51:48 +0000
Message-ID: <e68358f4-7206-df4f-a2a1-22974d77cea9@suse.com>
Date:   Mon, 29 Aug 2022 10:51:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Linux Kernel Issue in cdc_acm V5.15.x -- /dev/ttyACM0 Does Not
 Work
Content-Language: en-US
To:     Noel <n-a-i@sbcglobal.net>, oneukum@suse.com,
        Johan Hovold <johan@kernel.org>
References: <1e00a54f-c609-3c3e-34d8-1ea38105e7bd@sbcglobal.net>
 <dc74f362-8946-0a43-a556-73f7391b4053@sbcglobal.net>
Cc:     USB list <linux-usb@vger.kernel.org>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <dc74f362-8946-0a43-a556-73f7391b4053@sbcglobal.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::12) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3d52fbd-90de-4376-f1f8-08da899bb514
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2562:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MYiZP7PqdJZkAM+W14X9Nyl51vXECYJcUFVZY80cmuCpvv/bwTvmS3BZv3LZlGS+t9RBZA/wgaYbOiBY2Y/I3SNPphYCd2RA81mnc7Aefa6MN+/uXfjUxvD5XWCIIqCNugp5svcPPIUkhgIjXuc4v0OIL9Uf/ovW3BOeTMWub3Wr6nYIP/7yOGaSs89koMuIsolh/F/4oS7rtYsFA9mk0/eA1Js+9bEHXG7kCRGUm7PPKvScJHp+P4uHbEDtWiyb3bdhNt0kXMroiMsqi3v5z6iD52KHjojh48kc36l1BVmLXBaafd6dmCO7+8HXWZYJlsRmxSGmeArCYd/cHwTA361RDcjRMYw1FYKGO8Xgn+7+WkjgXn3wEXOPqPGWrIuwBLXbEu+Hnt9oXLPgYrOnU2vtkwUA/s0JuHTE0AiFge845zuy+gOGWzL/wza4VjHcMHgwd5FtV7qAd9pHFF0VrPkWUPtSI5p1Nir/tD/ojJ9BDLRRPGRWG7pa4fHbDpp/iXZ8zhIv0Jovk84Hq6P4DAxjD7deNiYMMcYIVjTjdxcfN/jd1jizQprP1jRQ/lYb2hZlWUlY4h5SGJFSF3sazePgwygwMo6ThN/WZ40v+QEMs/4YTOZNG+GitmKUgnssjMuIVlm4sHkBB+acjBn6WArlu9JXBl5IPVnGLaBINhrpDbER2fnr98V/zy1dFOeR6vqO5eHXvbMZCmj+rxXPGvvPl3ECWcCuyTbDOqX7dW1v9NkRoyE9O4uGBxUeGJk2ujuGygg82mFuNqn1riKlVRuJawgbC5rnFfjg2mGrj0c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(366004)(136003)(346002)(39860400002)(186003)(4744005)(6512007)(2616005)(5660300002)(4326008)(8676002)(66946007)(66556008)(8936002)(66476007)(31686004)(36756003)(2906002)(86362001)(110136005)(316002)(478600001)(53546011)(6506007)(41300700001)(6486002)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0NiTHpONjJiSGNNSHoyZkUwYmIzSDdVZkNQWEpnb1orQTdOc1VCeWtuUSt2?=
 =?utf-8?B?a1Zua3ZUMHBPbkluM1RORXdidGVDa1ZsdHFRUjYySThuclVFajRrQXF0VU9Z?=
 =?utf-8?B?eGZGNFM5UnhkQWUyZEpNclpXdVg0ZmFZQnFOK1N3Wmloa0xzcFJRYmNOTk5j?=
 =?utf-8?B?cHNGVUhMVDN5czRzb1ZnVC9Lc25wN0hLb2NmNURXa1NGbmRLNG9Ob1J2SUk0?=
 =?utf-8?B?UmtJZEZqcktUQk1ScTAwVXFQZXRhZnJSSUZwZzg1dmp6ZW5FUDhVdWhiemZ5?=
 =?utf-8?B?QTcxaUNvWmdSaXloc3FBZXNyUjdZczZaZTMxZUU2TURhZWR2VW9zaE5RNXVw?=
 =?utf-8?B?Vmp1MzI1SnF5enE4V2VHTzVBeGpsTEpmSDJHaTJhZVhjSVJqSUlHT3dreU9v?=
 =?utf-8?B?QitXN1FOblNYRHhDVFNzMFRqbElKMEJ5enhYejNud0Q3WFVyOXp6NVBoVEh2?=
 =?utf-8?B?NGYvTzRpeUhpbWl1STlpakFNS2Q0NFBTQktiMHBCTWpTMEpLSG5XU05oR0tJ?=
 =?utf-8?B?YVNreVhUN3orUlYxdGF1cG1GOHI0SE1xVVNVL2NkT1I4VUZpY2tSRmowcmJ0?=
 =?utf-8?B?eUpJZlJLNnhVdW9FOElYZ3AxMlI0Mkl5RXhsZVZFbmduS0s1SnorNXlYMkxQ?=
 =?utf-8?B?MDZqSFZVYU1oajQvMjZnN1ZGTnlMUWd1QUJDbkUxRHMwRlYreHhIN1I0UWx2?=
 =?utf-8?B?UXIxQXhqeWJ3NTFpRGU5cDBTRFYwZGdoc08yL3J4VmVFeEx4UituQW9ZbDRO?=
 =?utf-8?B?TE1qMUxTT04rRGtaZTZQc2tkblNlMzAyZ0VTS3lHalJlSDRqbjVyVDQ0VGRT?=
 =?utf-8?B?R2ZWOTFlRnRSUS9UVURWK05EaW5JSmg2UHdEVlZzUWRZSkc5N01mU0tnaFZJ?=
 =?utf-8?B?dDRPeEZQY1FNbXV2dmdzOUcyM1dpYk9ONHg4a1YyWm5HYVI0K2tDQTJTcFZj?=
 =?utf-8?B?eXJ4VDhNT200U3RHLzNkU1BaeUVFQlBHanNaTXVqRHp3OVVGeG45azI5REVy?=
 =?utf-8?B?ekdvWExZVkQ5Y1RpNE5MaFo1VldiaEtoNS9nZ1ZPdmpYcDFFck9Vd1B0dmth?=
 =?utf-8?B?emh0UXVQa0ppR0R6U0dyQmdIUUQrVkhIblRGYU1NQjBwbXlVSGlmY2pvVWxr?=
 =?utf-8?B?Vk9FRXJnei9OdVpDT3hyRFd0cUl1cGY3SWFQTXh6cXlLOUFHSVlaQjVWNFhR?=
 =?utf-8?B?SURCK3NOVlgzRHppbXlZZ0d1YmxPSHQ3dlVZdjZRZFg2VFFPYVRra1U1ZkVR?=
 =?utf-8?B?QWNZNHBWSXY4MnBiSmtrNHFrSHBNQ09Sa0tUNHlmTngrQzc0TDd6ajIyejVh?=
 =?utf-8?B?WmVqQjhPN3gxVFVqNUp2SkpQVlN3S2JDZ0oxdkxmN08vSU1uem9ZY2JHRjR2?=
 =?utf-8?B?bk1iS3FuNGVJUDBtN1o2OW82UnJsNndVMTRWZGZLWHhEK3Z6OUhhclVLdTl5?=
 =?utf-8?B?eDN5UERzTitucmhWc1o2dnVIWE1iV3krWEZkb05nbytkeThpdlhsN1VhUS9Z?=
 =?utf-8?B?c3l1dHpIbFZpK0hqbFJ6SDZkRGp4ekVZSDRDa1BMUTNLR25LMXAvNnREbHVP?=
 =?utf-8?B?dUNKaG9Rdk1JTXNncEpFUFVTM0FwUXRuZHFiV2s5dHBzdWhOQ2JTWkhHd3B1?=
 =?utf-8?B?cEExbHBMeFFhY3JVME5lMFVBOWZQdjhtUUFUTUxDQlB1ZnRIL3d6MUxwQ0JP?=
 =?utf-8?B?bi9wNU11N2s2TzZCMWF0clRlNExHWnE0dG1OZlRwd3Z5NWNYUStXTGgwQW13?=
 =?utf-8?B?dHFBZUZPWkE0Yk1zTnNQZnJmQi96TlRWeWIrc0xOeTFST3Z2UlJKc3B5VEs0?=
 =?utf-8?B?VFdaVEhtODVINEdCMnhVMytBa0w4QzlhN2FKQWI4dk5FVExBZVRjSFNmT2No?=
 =?utf-8?B?eTF5am5lTkFuUTRwd2xEaXFrUXEwaS9zRmFYK1FNTGUwZTdxTjkydld5U0pV?=
 =?utf-8?B?a2V5eTUxUE1MNDdMcEZtOEcyT3hnenllYktpTm1JR0Vvc3F2NlI0RU8rYyt2?=
 =?utf-8?B?cHVWMExEd3FndzFqcmZvdGZUbGF1bXJCOVU1QWd2K0tTd0FtaHovaW95cGZH?=
 =?utf-8?B?VjFjakllalZZejdmS2N1UERsU3JDTWVpeWRaV3FKVElVTlVMNGM4ekYzeG11?=
 =?utf-8?B?VTJPR25xbHVZZHIwcm5nQWRwUWFWOXhzRE1ldWs5eFE3QmliM043SnVkdEJM?=
 =?utf-8?Q?HeihjsizhloEDZn+nXOAoOg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d52fbd-90de-4376-f1f8-08da899bb514
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 08:51:47.8737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfNCO2DVOYBXjMMmcHhYmvU3WVrVPqjXmnQUHaab2qcgOtKJM6jxV5KLs3w4wMbbEo/KuKN1YKrWn1a0nLrzXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2562
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 25.08.22 18:42, Noel wrote:

> 
>       Modem issue ... will re-try: [Errno 16] could not open port
> /dev/ttyACM0: [Errno 16] Device or resource busy: '/dev/ttyACM0'
>       Modem issue ... will re-try: [Errno 16] could not open port
> /dev/ttyACM0: [Errno 16] Device or resource busy: '/dev/ttyACM0'
>       Modem issue ... will re-try: [Errno 16] could not open port
> /dev/ttyACM0: [Errno 16] Device or resource busy: '/dev/ttyACM0'
>         ... eventually gives up trying

Hi,

-EBUSY is odd, because CDC-ACM does not return -EBUSY. This
seems to come from the TTY layer. But just to make sure,
what does lusb say about your device?

	Regards
		Oliver

