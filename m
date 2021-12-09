Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D24046EB32
	for <lists+linux-usb@lfdr.de>; Thu,  9 Dec 2021 16:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233728AbhLIPdK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Dec 2021 10:33:10 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:53475 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231648AbhLIPdJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Dec 2021 10:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1639063775;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g9lHc3WYXnyvgRE65BtfB1njbkmR7N1dZyIKh7wGw8s=;
        b=BaopQlzHIsakimK+FODJAp+fF2sG3PIR5U8rhNlHb3ZIHRsomTtbiCMUhBPdX/s2JO4Jiv
        IQTKIPhxhT3XtU8Ino8aN3SNkpBlRBJ99tD9ZjAfRas80COfWoZFXgJa7HT0j5f6Du9Des
        hycdsUanqj6KOOqvhnrEQIhcrisRVIs=
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2058.outbound.protection.outlook.com [104.47.9.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-eFKuY_TWPqy1ix1kt71WVg-1; Thu, 09 Dec 2021 16:29:34 +0100
X-MC-Unique: eFKuY_TWPqy1ix1kt71WVg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+r7/9KKW2Pi5FNdkQYAVEtbsf0AqFBRZlpzi+gZEpWuIfSeKIm0npefXjFPfKEPS7F6d3po+M95s+Xt0j43kTqL/EzUhcpGhY+WrPkblL0FEExXYZ0F2ePefOiKa00jXP6hAMWUcY8Jy6JfSE3yg7MXlxF+IsLF7wXBCjTs5LVKLP5JgURpL5HV9rpqkYj76T9Z0gI0h8hhUp7ZaTAcX83LGZF70qRws6xb01NIte1O6G9tNotkj3FxwaoYE6VknuMgpcX6Z6wDEJSpPS4qxvqwNuzPNEzHTG1AQLHysHWj6PmGd7VoB+GYtun+/ITmqSSxXiJotamZWoAYFNTBkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ku9E7ypJJC1On6aJb3aDvraEvHX6v/jteAZNU/2pme4=;
 b=nH1E2i63ZnfB3UULDGeV1EYshTMD2Jja98Dna+uRYL5sgvAeCxrBlC+JeKDjck+kONKGntqb/uTL7U+pWjCuCxWPBR58MmTs8pdqAqbB34xEjNQmZxN/YkX7BSGAOj1M4e9uQEB3fguHFibHHYGkVFxwaX3GlmAZ97JKO7VplvqjStTVtpRiLNiwcgsfEKcn0IORihvEvoyWbVdisN9yg5ut4a4gJOWvAEk9pdhYK9rLIwP8gNClTzjFnHY3d917gAarWOkmqbBEeNzhvNnxKWl3kwv3P0aCeoppiOZybglkF9xPKEnB/jXRto2TE7Imbl50Lp2CRed0YjU9h/Dukg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB7PR04MB3977.eurprd04.prod.outlook.com (2603:10a6:5:23::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 15:29:31 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1%7]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 15:29:31 +0000
Subject: Re: An inquiry on supporting USB CDC ACM on Host PC as USB
 Host/Master
To:     Maggie Maralit <maggie.roxas@gmail.com>,
        Oliver Neukum <oneukum@suse.com>
CC:     linux-usb@vger.kernel.org
References: <CALgCfKVfzS27XB0AufBUhb8xnfq5dWhESuu1KfxycQ=EnUnp+g@mail.gmail.com>
 <984b7409-caaa-8ba6-8d5c-beff5f107628@suse.com>
 <CALgCfKX3rFUFTOfXsbLUaLdfcXA9oALhKLS9zfvtNCu8DemLAw@mail.gmail.com>
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <672cf564-79f4-f329-0e20-fdcbbcfd0d11@suse.com>
Date:   Thu, 9 Dec 2021 16:29:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <CALgCfKX3rFUFTOfXsbLUaLdfcXA9oALhKLS9zfvtNCu8DemLAw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: AM6PR04CA0055.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::32) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
Received: from localhost.localdomain (2001:a61:3b82:1901:9d6b:5ffd:1b6b:2163) by AM6PR04CA0055.eurprd04.prod.outlook.com (2603:10a6:20b:f0::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend Transport; Thu, 9 Dec 2021 15:29:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de9db0ea-1060-4756-4f7a-08d9bb28b21d
X-MS-TrafficTypeDiagnostic: DB7PR04MB3977:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <DB7PR04MB39771F55534719D36735FDD3C7709@DB7PR04MB3977.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oRMI71ya9ZDR4iBFy6jVuFdvWeBxEMpKaHev8NFMPEJ0u0BLkNH/9DoIUBhXhj4BsFV5VT+t0MJMjKv1HRMXlUcv4Z0K0zBvNHN6q/8KIKrasEvsav0vEBzBPCP+zVB0AJfbBacoeP7zR7d2tBPi3tVhr6eHVaFXvPoCnhnSxq4xvJ7q0mDNh7AQw3vjGE/pTg01yPhSIBNaCMUA7U6iwFywQ/7htNtREh396RxVWWIWYA9FnAgQCoZtaQ2zJWWnRr1ZRspTACkt9H+TKj7pKqKv2PS+gL2Zj+9bPzLV3lOL3h65Ck+y1arnrTmtvRKjJGcwWnRpravI37A7SknX3E5ulInQt+7TFXTOzBumbhrWGAY93CoYJ61wV/H1Y6hWOBOToomoq+Es/n0dICMwKzn0GajmZNNztxkd4eHGT8yJW9a/ffH3I11wAFfwjWClx0UKJXAiemc9q0Q2HtSAOwejVipJaULl80SnSBdlkV64iOPGpbm4MK3o+Y7pswe+W8P9xa1NBJwFdbKL1SrRPsO1GVyzL3d36FTOIXA2ChgiXrLpCbBo2xd/0SW/KSx5ExoVs1/hnJ0N+tJliORxb1Q6NqiE/7kz9rC2SPqMJHh/9EppvdVo6m6EqAUD7KL+ZFnE4eYgW3RQht26keyXdYoRYpk6TK1jfGRVwiMaVZVFX6BizCG51jtVbsVUX6uzG/wxhSzcedSZkQRMZ2kUc98gpWhe++dGXwjL0RsxImw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(110136005)(36756003)(31686004)(316002)(86362001)(31696002)(508600001)(2906002)(186003)(83380400001)(6486002)(66556008)(6506007)(8676002)(66476007)(38100700002)(66946007)(4326008)(8936002)(2616005)(53546011)(5660300002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P7upnRsD+bMwnCllMdLFdf87LAvqJ3fHNGFtEAyf2uCeNzTlatVC66C+NWsk?=
 =?us-ascii?Q?eheVSAna6R5i6llLEI0wXgoBr+4+AlynRcOBhuxZFnP1thdyRX7DhRYTD0Tr?=
 =?us-ascii?Q?vl4D/Ws5Iq9tB6KkzUll6jljZIO+k7QDW7JWbpKAINe1KOuWCEO3EyMT5VAV?=
 =?us-ascii?Q?lxDCTYeI6iphiUw0ckO/kicrSxsjoeARJFkDZTTgytWFPiSbzAkXV8ZZM9af?=
 =?us-ascii?Q?LSxFWtOx8PmJCr1uqZsKDHFxh/RWgPHSnv3ZHfYBiRZe7R50aGSZtysjYpNr?=
 =?us-ascii?Q?fWwtLCDgEHfS4/JAUNipLeGMnE44Vl2AIglDRzeF4Kgby1GAeH2BXn+oAq+s?=
 =?us-ascii?Q?3F2kj0AjomEf35YM29Ol3KSo+CqAlumaHUNesKYE7uQiwUpRK6j0I2h9L+aK?=
 =?us-ascii?Q?iV0lvbrWJET2eMlUYf/oyHKzB+OO0h741pR3fZtOSaEDS4L0M8/h+AgBims2?=
 =?us-ascii?Q?+fd/xcaZwKD9k4diU36vH4UArfJHuaYv94rkFqNty7HJuEMQFJo3K+3LSjMG?=
 =?us-ascii?Q?uz6rMbHz646HyTQ75fWk1FUks0tniNfcNew+mk1HUIkQqfV9BNRrfypHMOd5?=
 =?us-ascii?Q?Eh+yeZhYQAmRqsRS6hFcsTwT9OxWkxdRQXQktUL78TmwW0VkW200FjCB4Ts7?=
 =?us-ascii?Q?Ux1g5bJlONni7B1O7xYKecOwnY8wq9rUje9FxkzvbA5BbputydBKPxBCdOOJ?=
 =?us-ascii?Q?urY2PjPoin2ZrEiSVOmIAhNO4Kyt17qGK4382Ym3OFpYqVqc3QeS3OjIlk3S?=
 =?us-ascii?Q?7yspnPNVHlzEgtaZY9hiN9YWnyS5YnXb3Az6ijfHHt2WE9EQkplwQ4qnDIOX?=
 =?us-ascii?Q?w0TPq26zjCSWAbyuLsAvW5LRjvx3Dd+y+85FB8vIO0qjwfZk2IImkIIBICgA?=
 =?us-ascii?Q?ywiF1P74EuqArLWFFTPzU2W09CLkJ2FpS0MAGjcthf4f37/zhIgYV9CqVXL3?=
 =?us-ascii?Q?u6yjMFFq8Sj2+hpMFjJKaZaSGO7/6Fxe4/2hFRLbIYYHqcJ9kFoG46bwxAjU?=
 =?us-ascii?Q?wIG5A65oD5SWXnnFgmEhlAeq43f7fsjIeOUDNd58Y9TClE1Z0bf/NLm4AJsb?=
 =?us-ascii?Q?wAhLF9wJ3DjGrxdW9KJ1tEBT2qaln+zeLTRSB1AdAIN8Hn8z5hTJUGh1Hsi5?=
 =?us-ascii?Q?9ejzfzdykaOfa7iFQ1y7ZeRNkrioClrDrXRWUYneUVoR7M8l0gcZQi8A0544?=
 =?us-ascii?Q?EAA0NufzD7vKRiMyg8uALIrtLhOTdcTYzKndsPFkI1QOl/yZWr+r5sclf1EJ?=
 =?us-ascii?Q?QOOKN4IXQEWdwlxvKFeo/232xwyXRMNIrps358faeFwIjmxkC1HLNMnQEl/4?=
 =?us-ascii?Q?wZH9TPd8/8Dj7qqY040uXbpgIyC7tbM4efQ49Y2l6CaylzdnbHausrzidMh4?=
 =?us-ascii?Q?t8FbmprAztSWbNznreHmFaenLjxP279oPYpoHrPC2Ns6YyySsaXjDByh+IXn?=
 =?us-ascii?Q?UL6aQkQI+k2BPNJ6eLMGBCmdaCVXz1eBMXu+XFB5D7KobcQXCZ09rUq1qs3q?=
 =?us-ascii?Q?ddQZAfyKenr55NyHIsC9vmOrY/6xpxMdNmqEQjFzlQDqd5w8q5BnNxecXadZ?=
 =?us-ascii?Q?kG9FrzaWugzSuLNk31/gOnmqik/TMjn0Yb36NVn+7o8fZpdflIMauvwarAX2?=
 =?us-ascii?Q?24AdEhZRKyPVG3jEzbhAKkoXqUkFPerc4djxlFROqeDEGfupwNdBpONQqzxi?=
 =?us-ascii?Q?wbRLloz6JFqiTs0dpUdNuzxUTsw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de9db0ea-1060-4756-4f7a-08d9bb28b21d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 15:29:31.3825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: coSQlN9IpDhJlNBRBOrLTznIvuU0LZPzXi0+PkmcZqTYaq3ZHiXktHjcvcXPGNsRGasQFtc9olh4Lrhx1Yq1eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB3977
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 09.12.21 15:24, Maggie Maralit wrote:
Hi,
> My questions are:
> 1. With CONFIG_USB_ACM very common and useful, why is it not enabled
> by default in most platforms with USB ports like the x86_64 (normal
> for laptops and Intel NUCs)?

The upstream config is supposed to be minimal. Doing optimal
configs is a task for distributions or people who compile their own kernel.

> 2. Is there any rule or official statement from Linux Kernel
> maintainers/experts, highly recommending platform developers (or
> specific Ubuntu releases) to support this? (if there is, may I have a
> link of the documentation mentioning such?)
That is Ubuntu's job.
> 3. And is there a possibility for that module to get installed in the
> Linux Kernel just by the usual Linux commands (eg, "apt get
> update/upgrade")?
>
That question depends on your distribution. I suppose every sane general
purpose Linux distribution will compile and deliver cdc-acm, but I haven't
checked.

The configuration of your running kernel is in /proc/config.gz and is chose=
n
by the developer's of Ubuntu if you are running their kernel.

=C2=A0=C2=A0=C2=A0 HTH
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

