Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B288517F08
	for <lists+linux-usb@lfdr.de>; Tue,  3 May 2022 09:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbiECHkD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 May 2022 03:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231830AbiECHkB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 May 2022 03:40:01 -0400
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.109.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09A04217
        for <linux-usb@vger.kernel.org>; Tue,  3 May 2022 00:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1651563388;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Urk04ZIzzma57gkAWgOBIIWgCUVkU3qYY3hWGK5xdvY=;
        b=nWHu3DJ2LWIIV+N5Et8jegvAQiwDtP2CPGvMpcGhLJZ79TZADMiqdZAjdtP4sKk90sBsF0
        oKs3Zbiq4IS5cRVGSz6FXJWge+HZblSXxUspRSn3n4KJAzBWCi1nEBZjyefcn8sHExGL9W
        mEUQeD8WPPw4joQWjIPQOP4eW/AkrKw=
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-gx81_-sZOhStk4mypP7XwQ-2; Tue, 03 May 2022 09:36:26 +0200
X-MC-Unique: gx81_-sZOhStk4mypP7XwQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMtEaxSUc1YbHrMLuAi/o057y3guVoMQ/toWzdtrvEkfpqIIiHljLOeL66FCSDcwCOakefpr3hzBITrz9IZ5BhRuBBq0DmrhsIQq4cKJEOGF0yE0NP8qlXW+R9pQXmmiZVzciLL7oK3iMhEefddHIob4dCi6seU2a+E2NDQza90h3e/9ABp9HPtM7FivtE08A9/yiwgrotlRVjXk3Sd+U8C70KCWaJLyJNMqLUqUJl273GkTj++8RGM4TXn8auz1eR1SsaqsGNBpXnc/fM1zO6wIBTaXBOj6IfzzoxYnsUOHGgBl39LKTVgopgRrvv4/YfSqHLpY/kiSl3s0Y7eWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5iWxLol0FUQMHbyVM+9EveK3l63qiOD2vNaBS0iDhc=;
 b=MYd72TwASQ9Tx5hT2QRr4ptUbYnxPEoKIgMePZeUbuM6gZuzMHTwGxXjlpAgjUlGGo+DQZz7QA5fvUD9djXFzLLV9DVuKLIn7ZT6vB17wefjpX2Lo9d/tQJFMoMvGF2oON0AqIT7Z1SM2tW67zEKAhKDACEqheXfdxv99bhIXwUTEvK0tv+1Bg5L36U1UOmh83yM8fd9V3bECZFucF0V0o1kD2QluqssypZJHpET7W8EDPhoKDoNK9MRdd6mvcLxPPV31Cbh99j6G0oRTc1aoBjRrurVXkPKVcoZBz3iHnUKYYeybI90pSMygNGCazrLdvgGzIz4IRNqMX5dSJgnEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by AM0PR04MB6354.eurprd04.prod.outlook.com
 (2603:10a6:208:178::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 07:36:18 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b%4]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 07:36:18 +0000
Message-ID: <d7a74ca6-589b-61d8-bb5b-aacfb83b6da0@suse.com>
Date:   Tue, 3 May 2022 09:36:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: USB device disconnects on resume
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>,
        Martin Kepplinger <martin.kepplinger@puri.sm>
CC:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <YmAbZDd6LJwCCvkB@rowland.harvard.edu>
 <4fb8bd5842135a9f723bbe0406ed1afc023c25fe.camel@puri.sm>
 <YmFpMFlTt83s90an@rowland.harvard.edu>
 <b80c032c350c525d620968e95b7a653fc855d806.camel@puri.sm>
 <YmgIlFBC8mYQ2xwJ@rowland.harvard.edu>
 <232334eeb9d7321df1632e453839a6d433e6be45.camel@puri.sm>
 <YmrnVHA2/kttJQJa@rowland.harvard.edu>
 <1cb1cd1178703b4a67db849cc4c074b0c00b1332.camel@puri.sm>
 <YmxI5rIlyxOrPBHD@rowland.harvard.edu>
 <fdc8354e39f9162bcc63ab99f237bdbbe30d6017.camel@puri.sm>
 <YnAx3uvVrK4UXd05@rowland.harvard.edu>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <YnAx3uvVrK4UXd05@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0086.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::27) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00041672-e5e6-4b8d-7cfb-08da2cd79c90
X-MS-TrafficTypeDiagnostic: AM0PR04MB6354:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <AM0PR04MB6354F457D1E7F205F81B5505C7C09@AM0PR04MB6354.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EAN/mz+qk2gu9KJBIyF1l9U2l/bJfddqNxWBaBkvPPyHFifKadBdfhw9cMWmXY9k0+xwwhS51FiLyGLMwOO7jSkp2y+67zhbPffDqjz97aW3rpWgrjUmOJXJVfeYme2ojmQP927YHAIxV/UZRY5eriEkQfHTGcoQyf37rnBS4uBKF1XXVcthocOzlcmLZLbqbnuYKEJbjudS1M04sfJwbsJ56uxn9jGRtCergx8Zni6LPOLXCozlU/G8lyGRTaglYec+vCs/09I+QCTq9+W0ZjqDvag+9cK5Ax7Y2gvIFSyW4DzTSBnM+t5mD59wiG5JINsJ7W5F/uKe6NlfY7GcrNFG0ieUgD46N+wnuwbvJHLW00ZfP/9B4v/56y9LdWIROAT9fOBekWiquCMvpbYi+ZhOHOLlFHSEor9Cnabbz+EhloXNWMcqdzSwzXl9uq5riIIJV+htMS3VkMmSI9Z9nuWJcqC+3WlumbdjJO3hPt/aCHlYaIzjvbQWdXe57xSSAF0m3EYfxxqNArVx76OBvgvH1b6akRdN/Du/lyH+CADp1utkaYRqtNFMozOcudoVy546Iw8Gxt9oJzjeAXTqv8n9npVz0SVAzqP+EhSqu2j0eRSe/nFVCuCt1bhYIH3/sKbqGJdr1SYdhykRPWH2p8Oo6brsV2PMDzA9TOo9eoE2daSp8OZwe7be6oimLRx6p1HWnz9E3UvENOCCfl7KlBvvDYsOaLP/8PDqt4zGV98=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(316002)(8936002)(83380400001)(186003)(110136005)(5660300002)(6486002)(508600001)(66556008)(31686004)(36756003)(4326008)(8676002)(86362001)(66946007)(66476007)(53546011)(38100700002)(31696002)(6506007)(6512007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IceSY7Sc1yRsNHGem6rkeqpcaEfQDD993TM/lb//0gFDVnP2K8UWOgLSVGBc?=
 =?us-ascii?Q?9bQMSQ6BVbN2/KX7lovJDfJgsaI8F/UxTGg8j2RiQLOIhRTbRrCshoFjy9JN?=
 =?us-ascii?Q?yyNXPVg+1XxB07YSvZisr7KB8I1IP9xJjiobgegE9Nk/ft3oG79mj++awr8g?=
 =?us-ascii?Q?WEC5dex94cacXyQ2i6WVXCp0+0LXoum7s6i2T+KCyj1ygJKnUVLV+FmTH6l0?=
 =?us-ascii?Q?Qtziv4x6JRPYe9ogEMDifyJ6C5HgCysIs4yp3FEuLu+9gik4kTOcQ5XQNoBq?=
 =?us-ascii?Q?qKyXaRkiJ99Wjghwf3HFNrCUzEOs6bPVUJmWSC+d6zOlXhvPgD75zPVcNeq6?=
 =?us-ascii?Q?6nNQDlvcku3HTs7wvQXIq5yM2lQKQHHD2g2R6H+xlXdwAMm5Q/3KI7t7AilZ?=
 =?us-ascii?Q?qk4z0RnrZGXlfrA2WwnPXK0stJLXn/eww0usv0j4190XaglHhU2YUl3YofRo?=
 =?us-ascii?Q?D6IlYZrjha0GtFG0iZJ19Wj6OUwfCRaKZceTf/7y3QTWe00sZSgbYgt/5LqM?=
 =?us-ascii?Q?upHGNjkIQqv82SMJS0qyqatrrsthKVhvKtcdntpuF16NMezna/aFnIPu7LjD?=
 =?us-ascii?Q?18gL0YPtar+1o3b/SFHfeovkUoqeSef6vkv8JpgRlX9cmhRMjfXNsVE6C3Ao?=
 =?us-ascii?Q?dpMao8W0meNcCnGy0hJQieKW1iKPSbUsUy4dU02IgPilCAybIaqAlLFZ2Zeh?=
 =?us-ascii?Q?bUyWu7KQ6ghxAtgTVQkaO5uZAsLDyRNKiAohS98t5RjfxZBS6BjcA6HGS4+t?=
 =?us-ascii?Q?PEd7WWAU/t/9348UOQya24CIY2LfAvd7OYhEpbWL+7cAOGENJr11hlu4k4vl?=
 =?us-ascii?Q?M+RzvyaYvrzygHV/XLXOdSV7lnvh0DdgRv3k/iBoGKEeki+IwVSC9HkzKfwM?=
 =?us-ascii?Q?G+aSHBihC272xZosjdDoGsfsaqIgD4KV51+OjCTPnMj1yJiX+rlgP2qTkvJ7?=
 =?us-ascii?Q?DBkO+BeXG3alWUrUKVEGvkCV2j5L0bWN6j6pXMAmGVw3IRdC2WzJ3u0xW46b?=
 =?us-ascii?Q?PoShkxVLNa2802TuTOfpXYvOEzaBkaTd95sPy1buAQnhjC/+QbSdrJNNFzoJ?=
 =?us-ascii?Q?MjrZ/qY/oi5s1iCZ/wgMHby6lEXdkyR3jYz0/IHh9KUTE3jDmnOG+IoEW0bB?=
 =?us-ascii?Q?H9kAtxtuCyHUc9TPJzL/oJxImLJP6gLvlBAZfaFItHGbJZbuoC8lo+NUAe7p?=
 =?us-ascii?Q?HNmjDB1NFTV8Ja19OVn7BN+Xnu1MVHvZHMRMzthr+5LRbW34Mfa42dDBNCMj?=
 =?us-ascii?Q?fKWkhjPpzrKM3Rsge+cYc3P4CkzuxZGOIosTOfN5uKTnMEmHRKMjss68xLQS?=
 =?us-ascii?Q?TK8LYI7Dfm2piEV5pZKKQBWYKDetdgnrQ0US1EmCYI9AWS8m1vcslNa2RjdY?=
 =?us-ascii?Q?v6xtPEZqNUDa0lM1pu6WvRxa5xo2MpNdWFqFoA3Ar07pxU6KhIfNms94QSUM?=
 =?us-ascii?Q?fyqci4xLPLFz5u0ViV/ysLxs+C25i5e2lNFC9BuY1uQ8oowibLA9fukXuZvC?=
 =?us-ascii?Q?5KZUqFjYMUevb8018UJfu7JnqA2BKFKdBfUIDFs6RShjcMteB/49SxW3nDSN?=
 =?us-ascii?Q?Bj8hJGa72CZjDdYv5TveCQL2kuiIHOVJOLJokMbMrw7xceiGZyfzoaFm/5KQ?=
 =?us-ascii?Q?J3NEOT6MhDWMgB/Bj3oaOKDlRUKbEBWdlSOlxsafDsR+ATlLuwYHl35+LUoY?=
 =?us-ascii?Q?qvO28iz9X+Rb8XGrtqA4VCdllTBffMeJXiJwx2zP6DF92jLYcIapDKWMVqVm?=
 =?us-ascii?Q?uHsPfijTW/mG1AZShUxp2cqI9CZoI0mJt2ltTrB+tveF7FHQo4JK8kt1pb8t?=
X-MS-Exchange-AntiSpam-MessageData-1: 1QctVsG3W+FUFQ==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00041672-e5e6-4b8d-7cfb-08da2cd79c90
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 07:36:18.5308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGCe3RlxlEJMsm//cgGWoBg6AG/pkAZahSu/hX9rrjGTsBe4u+6GzBCopXGWa3SJLKnUxXcYsTBb3PJx/E916w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6354
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 02.05.22 21:32, Alan Stern wrote:

Hi,

I am happy to help, if I can.
> The usbmon trace shows that quite a lot happens during re-enumeration=20
> that doesn't happen during the reset-resume.  No doubt the reason for=20
> this is that the cdc-wdm driver doesn't have a real reset-resume=20
> handler; the operations it carries out for a reset-resume are the same=20
> as for a normal resume, and that clearly is not appropriate here.
Doing reset_resume() for WDM is problematic. The whole point
of WDM as a protocol is to put the configuration of a device
into user space. What is a kernel driver to do in that case.?
> For example, the usbmon trace shows that the kernel sends a=20
> Set-Interface request to the modem during re-enumeration and then does a=
=20
> whole lot of probing that I don't understand.  None of this stuff=20
> happens during the reset-resume.  Probably the modem decides that=20
> without any of this extra configuration, it doesn't need to do=20
> anything -- and that's why it disconnects itself.
>

Are you sure that stuff comes from CDC-WDM in the case of reenumeration?
WDM does not do set_interface() in any case.

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

