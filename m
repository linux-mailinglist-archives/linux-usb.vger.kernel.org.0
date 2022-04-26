Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3006150F797
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 11:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239901AbiDZJLN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Apr 2022 05:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347909AbiDZJGW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 05:06:22 -0400
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.109.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3DE9B6453
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 01:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1650962825;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DiMUCbjp8ATx6p7cgr1v4Jwa1cFU0Wr9lQRkLFyBx7g=;
        b=dvKITPEP8FxizqeJU58gVZml5YNEPFec8OdxuziFci910TlA4e/gu9KldkpjQxlTKCmR2g
        wGEupuSKCUs9WMuVwUZYy0FfJ3Z+x/oiNcHUZXVdR/VQbp0b8MDQPlyRZYE5c/WNLHPd16
        NbBpcCgrVzgiZkgyvHRtaLM08QRfo8Y=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2053.outbound.protection.outlook.com [104.47.0.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-j4-PAPdJOqijuhsUVJaZGA-1; Tue, 26 Apr 2022 10:47:03 +0200
X-MC-Unique: j4-PAPdJOqijuhsUVJaZGA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmVWN27FRFo5Dvztn9KA70aJsAtWOZgMED2UcWxoOD4y2N8gmMO10t9JcXaREADbXZUKpv9gZVAdds5NW+rlcTPZOFuUwmAdLHMSp+45ge6pc6C0ORk9/wT4htJ695izZM+LqtTxmZUierNP5k+HYDpJQG60y7lvRUa+4vcKdLu0Mx9ayYgIbrb9w1pMVAAgcjuc0twowP+DUzYwF1zzfro6K2Bk9mXaBqJetBcL0ibb6dI/grl5jBM715sbcwuCsx/geaEvy2VKb2Xxja/EgI44gKDewXjXFcLVsXsvILTb+J4zlvwtE/8L3Amvvo0GYbbADNRNnP9UQEKt6pu6zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3kCEHbe/YgnJOg45K9JdN0qAo13MTHbdTzZpemczGU=;
 b=VJR7fEUGTSwYJlJ3YuEe6UQb/iDCMMTy7QwNVORXJ48UQRlP5a60t29QCV6EEkhZZ/xPDvcmE4gfvyP+jNCDJsri4oLT2AarymXC+zvnariYLcmf4W0ONkW/v5X7uaJE40lCmwYqj574g+8X/Y+5kemSkZhlHTrBFJ91t9rLBaKT8yrZE4fv+CMTofwkzAvoEAtJbALKAc6LA5PsrLfQRouUlPIWlrbOLloI/xIo1FTi8NIaxclalre0q+fkfme7nZv+6AdkGhjS69miR3/jjc6UaDh/EDrZT2lF/11NbmdSaoGKG0CWm7Nc2tm29smNukRM9ZVZvph4Vp3FBsau+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by VI1PR04MB5903.eurprd04.prod.outlook.com
 (2603:10a6:803:e0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 08:47:01 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b%4]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 08:47:01 +0000
Message-ID: <fcb10f35-3064-851b-8f53-e88a3b51c930@suse.com>
Date:   Tue, 26 Apr 2022 10:46:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>
CC:     Peter Hutterer <peter.hutterer@who-t.net>,
        Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20220425132315.924477-1-hadess@hadess.net>
 <YmarwaNQYn1GwFbQ@kroah.com>
 <e73035d1bae5d0c355166fb46f0f5f2f07752b3c.camel@hadess.net>
 <Yma3k3lRMIEFypMN@kroah.com>
 <1d82343a5987a308ac9bd3f6fd481bc12a608a24.camel@hadess.net>
 <YmbCBwEMvKO5z0Dh@kroah.com> <YmdYfK5Vi+lEl7FX@quokka>
 <7def25c7-0870-accc-c689-4d8eef1b7acf@suse.com> <YmedlsENjNjc8yML@kroah.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <YmedlsENjNjc8yML@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::18) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5814728-2940-4099-bf44-08da276154a3
X-MS-TrafficTypeDiagnostic: VI1PR04MB5903:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <VI1PR04MB590310ACAE6493FB4610E48EC7FB9@VI1PR04MB5903.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LPAK8C88e0u2GQeaqc4XqULDsV15QYdXSD9gBmMbcyLJjpLlDnku0CD/lP7mweUmXFp9KrSgUTUU06BDQLRggH3gMOYDz+UvrRRfjFTUP9ThYM/+i3T9L37fUf2ynhjcYT+JCvi6wc/jc5Fwlr0jaiSOU/edc8O4yrlITQk5dgMgOdJ6Sxt9eTi9ec5R7yLfGh6PS4xVIRayu5fzVo0T5xVivbTt3j9vaHwHilS2UL/ps4yP5OVY3UYmWdaHjActAeubtlmfBLCe3dl+o+0rNVnDRWxoKNSObdhO0DhnXTm8dCeyRD0jPSdF0cLRFgH4lXHGdlrxVuLBirbAn5NssrPqj9j4BCQASTBE5HWGchIJpBF99blnWlNgZVFtEkTK/lRBDcaaMcaxwMzibnpUR0/GGh0Kemdr+m96UjM+bF48szUhKxX5Lw9gzHWbI8XcStCdB41I78GLZXtY7bXTGY4xE60SM3ILxOLJp+kwpnydmkMWNBxmqKWW6qiYhLPrajhJZswxeanYWIUZk+0UTDmWon1v+uPot/tnannu7E3XiUc66cb+qyTKsBoT2fXz4XJVrFpxrHS8u7V8cuvZ+x2EBR1efTQYB/1M1anTZtVqyDaXuO6QhVfzuzQDVgeGKHGtmAs2SgQdHaGhQN3OyrTtv4d6sY8YKMnkU4Z9BJlIAqB3rPGtuum43Mlv9H36lbs1FiOmXGLMBF4Ukow74LWD6g8Ne4Llk20GuSdJ0S0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(31686004)(8936002)(110136005)(86362001)(5660300002)(316002)(6666004)(186003)(36756003)(6506007)(53546011)(2616005)(54906003)(4744005)(38100700002)(2906002)(31696002)(508600001)(6486002)(8676002)(4326008)(66476007)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5lZZON36ukSeWuHK57EWXaupeFQE9fHELOKcwCFaDNwVv0Dc8UL+XDffxpgN?=
 =?us-ascii?Q?SA1iColHwHw2F/ZTj1oPdTrIDy7tzkbZPbFXVbJFoesHEHKOZ4QAn4Ss+GWC?=
 =?us-ascii?Q?Fw5R/2yYPrQoZmoupN402iEiHkD5gjd7XoE6Gx9IOIV38Hlz8XwNMGKR99oE?=
 =?us-ascii?Q?ENfW5gQ6b59a782Of2psm9DGEDnKlyPCNMga86bNv7wfQz5UaSUP1iP0m3Yv?=
 =?us-ascii?Q?2+BtXkvwLtAjLkMYws+BcRxhya2st7ACpc3sYz4AWOMbTVgDKWx3awMSGyjj?=
 =?us-ascii?Q?AUIN6htOvpgMnWJ0fA1BOEm4Ap4/y1TV4XF5MAHvcH7QTXcmJX5Z2slftHtf?=
 =?us-ascii?Q?3QWzKmoX8BYhl/FjwclP7otfvoNW+5Cb6DkZzf5hg8vuFNaCEQNEH9hjUaHN?=
 =?us-ascii?Q?+28SNyYM1DireIzvGT5VAjnZNKjU1eZunOkwtzOz9+C5ey0Wo0lGDM7sAj1S?=
 =?us-ascii?Q?XIb1vVJhmjgYQbWO3HFAnfpIDJuyaiHnuAvcH8p2DW1KzWqZZoEc3OA1EYLu?=
 =?us-ascii?Q?2f/JvyEJEhZUSfGmKO2fAm2FOkJbd7Nccxrh+zteP59YL629UJ3F6wPvjFaK?=
 =?us-ascii?Q?54mIURuIwTuJSqb2u6Vwow+fOTuLfKuqmEGUDCVGigdw3wicoTo2IdgJ116O?=
 =?us-ascii?Q?meNKJoQaoJFP6zyDymiVwXqlLGNjjyud/8FfymS6usi5z8SKAl9Q4/K2AART?=
 =?us-ascii?Q?Wft55fa0pPzqpHP2WcpynstA9cacKahTE7/bhE4tFJaVs1Jl3anVAtL9NfJE?=
 =?us-ascii?Q?L41rb+aZXaM/m7Tw+akz/X4LNIKAfaeeTafLSlp6eExIB2js98IHPIOHsKmB?=
 =?us-ascii?Q?vDA71GZVReqVRM1TfZwNwPCJQO179WZbdw4KAWYT6r5p3jRw5Z8+cslJccZ4?=
 =?us-ascii?Q?sja26mLUztxF7/wl7rER7Rao+aueHNrjmD7M2+0kubKXNvVxvcpyT+f9+wx/?=
 =?us-ascii?Q?T3RNwqynfBV+dJw/aOd6kj0mmNGTfGdYcQJwiTqe1QyoXfE9qEGmPnw8Fnt4?=
 =?us-ascii?Q?zO7kVCyxX43YDT03/DpvCXzTmgze/HMtV6/hKGjI0TU4Wtj3+5XopoJI1g3Q?=
 =?us-ascii?Q?lNr7N9ssguAh+28aAjxa2jor5r0998mKIFzOcZNJt1x1xR9fWnIUS+YDQjmk?=
 =?us-ascii?Q?ni7Sg92QPj/10NC359MAaspfOiTHM7x7r1RcsAHIrBvZrGIzYbk1kUARzQOG?=
 =?us-ascii?Q?kz9zUcTZPA8UoxswaleAXLhyMJOR3mvqoMM+Gr8GraGOzIxexlkTlKCewdKu?=
 =?us-ascii?Q?VwCyu108p6XcBoqYI+Jn11tYzCcd1YDYDrboEtdDdAvkmH1YwqHOL95a4p9N?=
 =?us-ascii?Q?AGxmAsFQNdDyjxQnYbPZHx2X6oof6lyCGIVqeyaPQnZ6LOKnpFnIi3BjTjh/?=
 =?us-ascii?Q?xO/cSit4kKebWJQ08mHzM2hkLoTzDCy78qPUDK9xtlDF05Yjds2U51TWXqfp?=
 =?us-ascii?Q?rp2TF1yqtlcAfgCD32Juh5fWz3hy7ePZ6Aj1jkq8kdkfKoI7SfH43ui/SZCA?=
 =?us-ascii?Q?XeB9wEqmxTTRIJMAqCIukoEWzI0qQS6iDru31cgJOSBcjfYEj0SJjPG7b78R?=
 =?us-ascii?Q?erOyss630tZwdTQ4hxVkvEXq+uvCrBDNo7cR4x7mUPIS2q+/HHV6GZ1RMg8g?=
 =?us-ascii?Q?Gv1L3Ltqnzhxqd9zrDZNoKeYo4Bzai5ITPhA4vDxBdgwzW72rCuPlIbGCiNP?=
 =?us-ascii?Q?hgeYO59orpNZ/EhXHEqW8J7g2ZoetaB7JrIJnqp8ZC3Quc38m78Fp7woTZSn?=
 =?us-ascii?Q?oLLhz/iZLr/qItkkZp9fILc2HX3iKFwZSZOJV0p3GiTGx1f60k52c+VBNjkT?=
X-MS-Exchange-AntiSpam-MessageData-1: jPgMFgX8mJonmg==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5814728-2940-4099-bf44-08da276154a3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 08:47:01.3862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpX5Jq5/G3CMudERD9NKKa6o/mJ+wAaNV+6/i4osJ6WQFidTVGUCjuVQSN5lFqL42at1zC7AJJSxGygY1v3HPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5903
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 26.04.22 09:21, Greg Kroah-Hartman wrote:
> Yes, but, it's not so simple.  Many people have asked for revoke() to be
> added as a syscall like is in the BSDs, but the BSDs only allow that for
> a very small subset of file descriptor types, and doing it in a generic
> fashion seems very difficult (I tried a few years ago and gave up, but
> my knowledge of the vfs layer is minimal.)
Well, then we should go for the minimalist approach and just
add a hook to VFS. Multiple different ioctl()s are definitely a bad idea.
An frevoke() looks much easier to do than one based on paths.
If I understand the issue behind the proposal correctly the caller
has opened the device.

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

