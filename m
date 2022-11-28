Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30A9F63B124
	for <lists+linux-usb@lfdr.de>; Mon, 28 Nov 2022 19:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbiK1SVu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Nov 2022 13:21:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234212AbiK1SVQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 13:21:16 -0500
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2053.outbound.protection.outlook.com [40.107.95.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6315E252BF
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 10:08:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdOTI72xjSLlaZ2VB/Hjc4UvNgwBKyNMjdQibMqBK1bRbQ+W5oeE+gfx+qX/xLCrlmNJPaOI4PkxrU3pi4OghLSjrr6vu1CFFcJK3MR5JrBjFTtwPYFIbkFyWY9COjKDyYYyILJnG6hVsuS+/9OlPeQiLyTbZi796UxrkbC74cAsrNUtppBeuaCUd9uGPoqaHWY2RKmwrPmm4xtMVE1PJk4H5goYpdznbd5lbKqsydgP2YljnHhNMo0SQwU9HmqaaOW1ZU8L+qUFLcC/6WabDQ/iB1CSm6gfeghxMNQvH9TRuCtK1o23IF+JyXekOM3h1ihswMofdfSUOMj8JBLBGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+T5f+49XI373SkzYYArL0OPt0Ie1j/Dd45DsD2CAt6U=;
 b=MymM8hGxxK8+8e3DqBPwr+3pcYCHcOEpZHDx93O4j6tp45A974dnJGZdZ5VtnJUhEITuFFryhXcbOFZeOHDv+u6aA3PG3pqG5Fu5LbQdVz/Us2SKBefMHcbWf/3Rcsfg/gXsYVS5Lvw1ZeEJwebAD6oxetfSiLoQN16jOKObIOteTZbqHcg1KOspThDN5MOZR3k1mxvOctGyensQOQHGO10E0MtyWzj+xauaQ1CJXqqyKPhZJz2B2HrfS3iWhIWDzjTIJ3asP94YThdrNmqc3yzfg2i8lN4b/uOL0VQoopAafiYI8+QT7CqHeWChBKWMn+wQQmLiZwbpmqUz86jiYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vpitech.com; dmarc=pass action=none header.from=vpitech.com;
 dkim=pass header.d=vpitech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vpitech.onmicrosoft.com; s=selector2-vpitech-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+T5f+49XI373SkzYYArL0OPt0Ie1j/Dd45DsD2CAt6U=;
 b=XRT+kSRbQASrlXoN1XtQGrXwr3BIuQOz9Shx8XPeYWX+C5KsKsVLcbiSQx8RSepcqyJLVokNHrm1HzXpTs3YSzq/vLADWFRr38fHERWy4CIH4Sv07rnD0Wjyp2SIbk/qhcfDaKlgh6oUeqjK/MUYY6sVByhvAsVtGp9y0vlIaio=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vpitech.com;
Received: from SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:1ff::7)
 by SA1P222MB0167.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:1fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 18:08:27 +0000
Received: from SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
 ([fe80::1ac3:14ac:b83:b2fa]) by SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
 ([fe80::1ac3:14ac:b83:b2fa%9]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 18:08:27 +0000
From:   Alex Henrie <alexh@vpitech.com>
To:     Johan Hovold <johan@kernel.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     linux-usb@vger.kernel.org, alexhenrie24@gmail.com,
        Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH] USB: serial: cp210x: map B0 to B9600
Date:   Mon, 28 Nov 2022 11:08:25 -0700
Message-ID: <3642317.iIbC2pHGDl@demeter>
In-Reply-To: <Y4TItxxwSNy7OnMA@hovoldconsulting.com>
References: <20221126035825.6991-1-alexh@vpitech.com> <Y4TItxxwSNy7OnMA@hovoldconsulting.com>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-ClientProxiedBy: CY8PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:930:4f::11) To SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:1ff::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1P222MB0296:EE_|SA1P222MB0167:EE_
X-MS-Office365-Filtering-Correlation-Id: 2057c834-e6b9-47d0-0e44-08dad16b8c30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WjTguGBhcjiNRCBCzvX9pjH2l8kyNPrZQWSU3nDB+f5LMxol89QtEBdWZTUsrbu91IPH6p9cWBwb8gQF8kKMj8ewT4u4MyYptQkcs8M6ggKWtNdSm/QJBsb+5bdkxZ2/kNAAkXMJS7O6aJ2UqeNJ0h1yyDIn1lisyh9qYWgHmM2fpOJIlHa1wbyoYfrx1z02EKKJPdS+W5KU0Z+fPZ1ELAMyWHrhknhkFlXrK1D5/IMd5rDdm6BrtAUmMkKYP0WWZpRfjF6b5ZnwtH6Tjryw6Da24dUG1m7t70vaZEWg0Yd8IWyOYZ73kBJrZNDOqjLvmgjE1k5zJV38usXkZ57Pm2E/z4BxtnXNGhr0Eb8Sw17qcrlel+LtgOXgc/OqZv8jsbgXJdvYnVtjE5/fz6hbccCAt4S7IKlEO+dZQtVYz7tf03D/DMJ5AE4diHtkIKTWz6VBCRxXbw10KtJGJ0cXXiQpKxwZoNMaWvCJkaDugAR/Aht81JKaAyOuyPl5Ik88XoVJGzO2vVO2e03i+bY/PcSREgIxaH20I6GuyDxzfFNYXyjbnnuIylntWfVJWofuRGPWCnYJnCLngmOCzZ0w4TMx8GLiSwjc1+W8hQcov+5RTUDHl7E37Z33JgvRyc8dnnqdY08oCg7JGLa5ZSPIh5MV9ynyv7tkwwaAb4EJUskf0v4cuh9t50G4+ZkChq2t
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(7916004)(366004)(136003)(39830400003)(396003)(376002)(346002)(451199015)(6486002)(6506007)(83380400001)(86362001)(478600001)(52116002)(53546011)(9686003)(6512007)(110136005)(316002)(41300700001)(5660300002)(33716001)(38100700002)(2906002)(8936002)(8676002)(186003)(66556008)(66476007)(4326008)(66946007)(39026012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wZzBgC5TxxmG4Lr5DXktCRkafkJLUOBwJoUmDAa6GszX0oM2l3v1bNSwCP7T?=
 =?us-ascii?Q?XwosVO+EBtT3OZ09lDxp1kVf9pLbdbg7+g8w2PuNwSkLcIqshiMTUJ0p54H0?=
 =?us-ascii?Q?jy6A3+7DxUbJeyyq+FmL/5/blehUPdkwhHQQgQ7XYsx/88JNDmkzEA6Ot0US?=
 =?us-ascii?Q?1VJ+2f415FGbPsRS0yxRPwk2dfjdYyoTGn4ripPPYigZexwXV8pt4hGd0haR?=
 =?us-ascii?Q?EebPJDfdk5eABcwAtkFV2TY0S9Igi2jU9+3puq88avYHMMBCoEQIXW2H3v0B?=
 =?us-ascii?Q?HqP2f+BlOQ91qk5xEtiWC+wcRockj9J5vlIeTwnSz59K89sEhy4Bn5UlYYc2?=
 =?us-ascii?Q?1P5XDTnE9Fii6crQP3lmZ6Fh+x1mD77bDFOALT/H26tpN3oxUvKS3s7amYqd?=
 =?us-ascii?Q?3WGsBh6B9VaF7ISlX7pdKx5UGRWiUyjJvSeTFZQNYPLy6v5Chsf/Vk+wwrSk?=
 =?us-ascii?Q?7cBvImwTFKVVAdqBBdhvKB8SBYNN6SQxLb+AqhdhRixQZ5PZSDlNqUq2oWPu?=
 =?us-ascii?Q?/GXUmw0wZCqz5oiIgzdZyyIHReL2RUkFxpGNO8VTJAS3G6wr2Z58WksiSSNm?=
 =?us-ascii?Q?FlsPEuZtXbiqqruVBqt4ePdi+jGdkuIdPJWdhibKmVdzrihugEnBvOGw47ju?=
 =?us-ascii?Q?HCAeEZBdSFAHOsrF9E3MHReRLFttuAbGPOy25e4I5G8v9AptZRhVU0VMhkXX?=
 =?us-ascii?Q?Gb7J8PwZ2mRKSysnV4xPLwXAWfXVeEgUnjcTtG9FAgsqMv5n3jm5zVU8GfdE?=
 =?us-ascii?Q?zr7/IJL+HI3tIa8DR8sVDUYDs6Sp2q4uHbBV+V0WR5OHMQniOh6oF0A8N3hc?=
 =?us-ascii?Q?giEl127JmlDwUlvjtdOtvgtCCheuZHzxKIPp/Rwxf7sgxO/2dgacRDjt9ndK?=
 =?us-ascii?Q?rMHoKAzLFUPOgNV3QtRB9vRLJS8GsZKkv+SpG8Caf6M2B2rEIim21vmdMlv1?=
 =?us-ascii?Q?8qcYgtYPvn+WoCW+ZK23cO4x6iafjyo7NbbRA4pstJWr/3Ou1fRHUJjV06zA?=
 =?us-ascii?Q?dsx3BwABqUY+7EVv/QD7mjRrQqtyMmW7ONK93hHA5ES9bgt3IbUjxuPcKYqt?=
 =?us-ascii?Q?45tC7HsMZ6Ruq2eYmjPxufgUZtJRVhGncBwG+7ORMCFMCLfDuYSG4mtdYkcp?=
 =?us-ascii?Q?Z0VuipCQK2AstD0oHa4DYYWT/jc+ZJ1gD/5Ymzeaknf3Lt5zw+Wk2WTUcgYR?=
 =?us-ascii?Q?qy/zeGzOMEjZdp4xEfNehBNU9IqLd16PO6ESHXkWR0iXj2Hk7deuhyMXeeRP?=
 =?us-ascii?Q?8mBWeucK8+v1gt4ZAzIkOzW2v335162IdTyTh4qDXIutp0NxAkMuYYvTW4iq?=
 =?us-ascii?Q?2QCCIa4ZRGeyuMS8IdvJKOTC7ZO0XCWnVAasuzE7Z+k9CrCV7z5Z3T+CFULq?=
 =?us-ascii?Q?59Ww1XuMikdFKsl+T6jLrNgu+RgZC3LkQi+XZaMU+yXmjg5wnIvjJCnTlRZi?=
 =?us-ascii?Q?HEsi9QOc2LL99niLhfmVk1hrXZu1oCUkjsO3SPTntPv9gcxtg3IqzLh2IiPb?=
 =?us-ascii?Q?wysEAFEhxtHuyRdhkWMLHWmQlZn9hitBFzGUfp1MC5eEwQ/fcXmye6gvtVFb?=
 =?us-ascii?Q?8vEEBGsVbxD7hYvxQUyh1sAMLdg3kwkEKWOClw53tH5JcvuiRJMKyOiW2Skq?=
 =?us-ascii?Q?e6bBv6uNeI/zpdbIDeCXvs8=3D?=
X-OriginatorOrg: vpitech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2057c834-e6b9-47d0-0e44-08dad16b8c30
X-MS-Exchange-CrossTenant-AuthSource: SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 18:08:27.2199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 130d6264-38b7-4474-a9bf-511ff1224fac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7DwKciYBkPnsUFyaQcRy9IQ/nOmduyN0sUdi+gPurIoFk76YKIA5zDVgxUi+xVvhDrar+BiKvEBnF2fq+Sk4AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P222MB0167
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Monday, November 28, 2022 7:41:59 AM MST Johan Hovold wrote:
> On Fri, Nov 25, 2022 at 08:58:25PM -0700, Alex Henrie wrote:
> > When a baud rate of 0 is requested, both the 8250 driver and the FTDI
> > driver reset the baud rate to the default of 9600 (see the comment above
> > the uart_get_baud_rate function). Some old versions of the NXP blhost
> > utility depend on this behavior.
> 
> What exactly do you mean by "depend on" here? Setting B0 is supposed to
> hang up a modem connection by deasserting the modem control lines, but
> there's nothing mandating any particular line speed to be set in
> hardware. Why would that even matter?
> 
> If the user space tool is thrown off by the fact that B0 isn't
> implemented, perhaps that's what should be addressed.

Oh, it's definitely a bug in blhost. The program sets the baud rate to 0, then 
tries to communicate over the UART assuming that the baud rate is 9600. It's 
been fixed in the latest version of blhost, but I'm stuck on an old version and 
there's nothing I can do about that.

I don't know why the 8250 and FTDI drivers map B0 to B9600, however it's very 
old behavior that must have had a purpose. Maybe Russell knows? Alternatively, 
leaving the baud rate unchanged seems like reasonable behavior and would also 
work with the old blhost. But mapping B0 to B300 makes even less sense than 
mapping it to B9600.

-Alex


