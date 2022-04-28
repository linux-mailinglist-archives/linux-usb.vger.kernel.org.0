Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD4FD51314C
	for <lists+linux-usb@lfdr.de>; Thu, 28 Apr 2022 12:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234814AbiD1KcM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Apr 2022 06:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234079AbiD1KcL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Apr 2022 06:32:11 -0400
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.109.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11DD4546B1
        for <linux-usb@vger.kernel.org>; Thu, 28 Apr 2022 03:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1651141733;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UJEmsfIGQVide6TMwEFEaoRnZpOEDgUXi7n/YLn7fcc=;
        b=Vd4kro4Ur8GFZS2DmxH4AkrjFCCPnY7g01oRp6CcSTkBib035/EQGIFBQXOl7Zp9mXxN3s
        YUObt8OluhfWKo5MGTXQ1ZK4gEd/oPN3LRfJ4WcTIJxsQAYgR7IoMjLvD3OkEQQZDRExxL
        u28Kv1asZspIWg0vIkQwaq2mpxu77es=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-8rBIEG_KOla3DI_AG1xMmw-1; Thu, 28 Apr 2022 12:28:50 +0200
X-MC-Unique: 8rBIEG_KOla3DI_AG1xMmw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnQjwx6J2SYOhm4iVrb+zx+uG9lKJkhfAWaszESBCZGb+tVQAf8ZebrYdCWHWpd5aqu96HbXnhZT5nA9+1RtT15UqeJ5jo95hbcGFhcrS7HgfD1Qz/K9oRLYTQ05TarvCUa42YwNAjpk2XfSLfx6Fnvpc7Xt3ZF1W8y2BaGxqmjgQmASY/NUHMqEdjD9wtalV2sFm6s5vri7bMD8oWG0SgGxtCHnJDhPbaVBnPSmMf64NCxYotrH0KvkPyJ6v9vQ8mxOxGhvs7oR5kLBY28DG+m6y0lyrDjYLNet8iaU3QAS+MC3a1CkPOkK8MV6FpugJEutl6WaTSPPM+32wRz4lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lornmpl4oHYGkkJJkAMF24t+7SfdXAg4P05r3fDxC/Y=;
 b=obQfBCWmVMM8kFH/4MQNAED6soHbqlsLHYi86Kleu9zW/NpKt3mhcVcs25T72Wpcz1uRpUnQkYQ/ac9ET++XdAzgFb66J16YxnokQheY4SAur66ZoRCz02jP50F9SJZTl5k2XJR5i4M75Lo8sWRdnwGe5rJnxFy7XVfPSzEXJeC/oH8wk6mueV5C0jL0nK0uT9gbyDP2gKUhCVeO8mG6xs0LNIQuDnqkUYyPy8Ka745frfBErqeGrESr/W77oTmNJx7Psp8tuNmZDbGKi7uloupbNvCwdhVbknGnkO4bcHZMzH8QREbVbGxDpqNMeHTGQqoHWqam0bALTKgHR+pjPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by VI1PR0402MB3517.eurprd04.prod.outlook.com
 (2603:10a6:803:b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Thu, 28 Apr
 2022 10:28:48 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b%4]) with mapi id 15.20.5206.014; Thu, 28 Apr 2022
 10:28:48 +0000
Message-ID: <fbc988f7-5cd3-2ac8-12cc-f09ae005247d@suse.com>
Date:   Thu, 28 Apr 2022 12:28:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
Content-Language: en-US
To:     Bastien Nocera <hadess@hadess.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Oliver Neukum <oneukum@suse.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <YmarwaNQYn1GwFbQ@kroah.com>
 <e73035d1bae5d0c355166fb46f0f5f2f07752b3c.camel@hadess.net>
 <Yma3k3lRMIEFypMN@kroah.com>
 <1d82343a5987a308ac9bd3f6fd481bc12a608a24.camel@hadess.net>
 <YmbCBwEMvKO5z0Dh@kroah.com> <YmdYfK5Vi+lEl7FX@quokka>
 <7def25c7-0870-accc-c689-4d8eef1b7acf@suse.com> <YmedlsENjNjc8yML@kroah.com>
 <fcb10f35-3064-851b-8f53-e88a3b51c930@suse.com>
 <d49aeb3cd8f67674eb87bf4bc93f617937649bc7.camel@hadess.net>
 <YmfJr46kLZ3MtiCU@kroah.com>
 <e43f9fe95a763efbe959084ea3f2dcd0a75f666f.camel@hadess.net>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <e43f9fe95a763efbe959084ea3f2dcd0a75f666f.camel@hadess.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0162.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::17) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1993a519-2cc0-44df-021a-08da2901e14d
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3517:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3517319DED1855C2EB365278C7FD9@VI1PR0402MB3517.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QJVeJuWMEyoapZRcxHeYFA1EgGtpxSARBm3Grbphp469csV8mxn0wvl9zYHapMXjxJJl5RFoK6IgdcKhuVZxHx7wWExdO9RYg2TLsXagNu4O1l3+J77xO5djiM+3ya5RIFJDec9gTGsLKLnjQRCj/iRqaC/2O+hmdmL3sB/7NuHdb+qaBZfovDKtkTsBEKzR2JHZujaFW7d0CmGzzVBGqyoNhyZY5komBiM4qD1HC2tQEoxp3YtNqHXgTQ2JKX2nyC06Anrvs9f27teJWzqMv6wDfrWWyMy+d+Vh5ABFjcsxehFOGp13cYZqIuB7kXmgkOUFLxLd0NVcnZ2FqLnKVA2T+jvli6HbtVC3df5cF8Oq40RKQgfEULTSxJ6f1CryxkGdt70Ba/QVqUxjDYMIEsyYkvh5ibmnc1PlnhNYxZ3+Pqvd3HxpMOcbGzWIgI0Poez87nUCaqVJd76CPfLP+Itv3/W1xBv22QlyvTY98/dZ3jweCGubOCtyfWsQxp2YVgVqoJXCNJkxkGplbPi1bmxM7J8wkuh8ncLMkMRw4Bu3005NSHAffRM7mk6KHZGMcTp2tZ+SIrkHbuSSdTDWLTShZBQ6OuadqBIMBMb+DNsN+OZYGrWWGuE/6HU4SI5uyLSQJRSM5Np43xNTXbwGDXD1fTuJ4VaBfbqYv9cI7MyTFwNhlN86yYxYdSmjWt6IpjSUsB1NUDJyj8R/+ItPt0SJ8sBvbcVr2p8jv2eEdD0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(6486002)(54906003)(5660300002)(8676002)(110136005)(66946007)(66556008)(66476007)(186003)(8936002)(4326008)(4744005)(2616005)(83380400001)(86362001)(38100700002)(2906002)(53546011)(6512007)(6666004)(316002)(6506007)(31696002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MDb7dhTx2tJ0RUXgd8WObDzzjPunliecE3DPJHBwcjpwKJkUc3eiAr5KW1Uq?=
 =?us-ascii?Q?GC4fcw4i1Yn2P/TE+RsBNoHTl5fOtr4zsv+OJtgLjQ8BZ5Lr8aSGlGX9WDCK?=
 =?us-ascii?Q?olZU4FTUCVvgEdfoXH4Yz99Iwl8fkLBkfxCLqk1pDShBwnlRhKY3YQcAY1CT?=
 =?us-ascii?Q?B+VELaH2Oz2tlXb+TYLJUpTOw727R/Gh/Pgk4vzBi/p/psaYdfpSmlTgvC/7?=
 =?us-ascii?Q?1Ok8SC78ONAzOgH/mq3vUacG5WmhwF+qM7kt4gesHuKuxkx4qKBRzpmCPynA?=
 =?us-ascii?Q?yjwe2Zqwp/Cr2ju6TusOE+4YJLj0bf2F5NEcbMyKsfsgnj/MDPpceuC3pH7l?=
 =?us-ascii?Q?4yfs4s+6akF7R4CsGawNTMufUs1Zz37VZA1CBIulnBpj4g7I6suNmAGFu2/f?=
 =?us-ascii?Q?tLLIlFR6kef8lTNg/umJXhMcBTCLGXruYh4ZvhCZTTAWksWGQM/6+TXUVSK2?=
 =?us-ascii?Q?1KGMoTiz+th1HxdasxHbSpraa9vNcimeL0UO98I92n06z8UY0XZD2e65jM9n?=
 =?us-ascii?Q?YEBDyWuz3OWtCgj4bcYp+vyXxjhNkjIw00hzBr7h9farYIzKItrmskNOAg6c?=
 =?us-ascii?Q?/xPBLQ49Li5E6YqAjHCVne1xMCYwMTti6b0fMYfkuTNwxbQyc3wLez6jq9dg?=
 =?us-ascii?Q?yTyUyRVK88YsFNQhzE7VPGdyGJ+7v9Y6IaQCpsGii6nvJJoEPTKm2WVqXp/j?=
 =?us-ascii?Q?Nhxo6yoNpe3g2Jcf2jSd5lWg8pd6BHfTHJpq4JINrtHTnj6v7MfuVh5/QbS3?=
 =?us-ascii?Q?VFHq8zK9ZEmHRWsL2Ya31NwaWXInJd+A5+vUMBM20OVOgvCSq6+Ft1dWGQl2?=
 =?us-ascii?Q?MFFdiFZ+wGcXcYL45FmnR8PlL+ae4yQ1a5EfJoiI5jVGBWse2UmvaDXgcGtI?=
 =?us-ascii?Q?5543isF3eboD5FVEqfRjr2ehshKSPr9SVRw9EJVS2dWInX9bBqVv2Rmr1Of+?=
 =?us-ascii?Q?3hyfm89Csj3lNNwAi6ljkN+8hVjIR6HCqPd+V4u7484vlNoc7k7uCuSaqLRD?=
 =?us-ascii?Q?9VP9IeNCjCqc7HHFf0aZ1r9fm399wpCvGFKfnRCctrIlam+neGqbcq4HeLSc?=
 =?us-ascii?Q?ZoIvZi/2gh4N/j5dYZgHs4XnxrQPIGZOyL8cVJsSCdpJlHTmX3cciLfvrme7?=
 =?us-ascii?Q?APNdykN0B7iDe2daXtZNiOgRHnL99AGJgy3ycrI7BH5R8UPVf5Y9SxE0qzf0?=
 =?us-ascii?Q?fU6CAKOHpnKWPse8fg/EonCJOOabvwQLDtZ2pcMN+etkV0QLv8vm+TsSj8ca?=
 =?us-ascii?Q?82vSAO1JiyyWxDyWWXsOqdWjSbPaO0laMei4ZaCNjsLmN8tYhv5aZhkc5CJl?=
 =?us-ascii?Q?s1x5yGl9T8kCdUC+JVHUvAR+fNwhcFbImb0sbj3uQOgorXlZds+r8MXtfwyY?=
 =?us-ascii?Q?c3t2bgTzvLMTIPGIXCiPS+W2CFFcckhWs2d82YLsyORrYClRHYGkwnuDI8tI?=
 =?us-ascii?Q?Jph4kq933lI1EFpXUdCUuErpmj3PDQ6jspjt/Wh0BJjh+Ngj7+Hwv+k+jJPl?=
 =?us-ascii?Q?xU1vX2zpfMBf+9qRmovMK53+bOsKWJJkP4uC7XZbrRhlMjIRUJnx8dD5TUD5?=
 =?us-ascii?Q?bmwlSLPcotu3YX/5yboCozCMPE3d5RiEVabjjoGb+VeeK8N3WgFYekRMW+nF?=
 =?us-ascii?Q?hiqvWaZupu8sP04emn0Cut3OEPEdMjEoh56jGRP4DZQD0RxbweMUnSK0/OP4?=
 =?us-ascii?Q?orChTLcmzTtpH3jHAH4jQVOkiWfddkpDC9zJoqZiIwLEvmeZTIQiGMweOFhd?=
 =?us-ascii?Q?w29C4Mr7UdUcKm4Z5+a1xlKoDikPzkX2hD0/B2cBVd6DyDSEjdYA++xP6uEO?=
X-MS-Exchange-AntiSpam-MessageData-1: ZQE0SjXEK9TXHg==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1993a519-2cc0-44df-021a-08da2901e14d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 10:28:48.0941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wAgb7zGpCxEPc6sN0SUAA82D8HqyCVI0kx1UVKSaVJno72UXL0mFdYSSpWaHVAzhjaMfLqaa8Q5Cb/QO5d1XFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3517
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 26.04.22 12:37, Bastien Nocera wrote:
>
> I don't think anyone wants to implement path based syscalls, and=C2=A0aga=
in,
> it's equivalent to remote closing the fd, not to disabling the access
> to the device:
> "If the file is a special file for a device which is open, the device
> close function is called as if all open references to the file had been
> closed."
OK, so do we still have a need to discuss this specifically to usbfs?
I suppose if you put this into VFS, you will need a hook to map the
syscall to drivers that need to handling ioctl() having effects beyond
their syscall abstractly speaking.

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

