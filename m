Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1746363B17C
	for <lists+linux-usb@lfdr.de>; Mon, 28 Nov 2022 19:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbiK1Sit (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Nov 2022 13:38:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbiK1Sim (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 13:38:42 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC48A3897
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 10:38:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cV4u/u5hROYEfCluaRoh3hWAdFjPU7QP/FckN3AkqznQTPo+6hcDPeAJ/xdFEMnQy0w2wVUgCOc7Y192Y7GYp9YmooQwXnv0OHZDCofUt6jDTeE1KUUrtephxZiXfhG3tVEL+scwBsVDSCb7Idf2ml46uVMx9j7Nj2dSVhVzxLC7kSOklc84K9TlS9c1XL+eJsOeJa4ugm285gU43WVj+RVjdVpGTfFBSnBEW60I7ETrMlDQsIp0/QZ0zueXQRKNGUfm19TopoYcjg+SDKrpI+poX6uZ96RhUT6o7r/fVjNYGGhrOGQtm2Zu66NM2kwXpJcNW7Vbw7aYIm3LoLlRzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZM+TsKHiZegIqIs2RJWtZqhi05OEUlnQ523df2Hkv4=;
 b=CdwrtHFSdUUgoq5ZZIu48T4psppzkWSqY7nJg/wPeW2flax8PUj9zJLiAWRlpArUrctwmkQsdeCOpqf0C0xLnvjrKD7iD/FqHTWkvupTIXyfsdNcTEW0rzyGOQ8lIpaQupqzTJaDMs+pJKrWHyEUVda4kxjprWFZQB5jgJYCJJ36TLtKZxKsxfSM68Tg1Dx6GxiuaAx0OCrro0ca+13FvGd2o9MqH1qmYk249/uWtZEAv+hSiXd72aA14iCptIBUfLe1oFnhLl43eDqVP6pzM0cfTozyTv85imsO8dWPKKn2LQ1x0wvqMS5K64C/YnJqUjod47qWSw68ZMGxFha+3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vpitech.com; dmarc=pass action=none header.from=vpitech.com;
 dkim=pass header.d=vpitech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vpitech.onmicrosoft.com; s=selector2-vpitech-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZM+TsKHiZegIqIs2RJWtZqhi05OEUlnQ523df2Hkv4=;
 b=gFyVWIsFbjKtpxzJ2Vw1ZpgW5HspgbEAMQhmpZssQxR5yyTmTa6OrvQ/TXr3QgbD3PLKiC4rPQ8hRRYtjpe+yCFk5lh3nm0F5G4hdDrekTlHXpo6qdG7HjgYTbHZF+EKXk1QRUdrdaR7vlKlEik2kEWAFDw0y1asD+P8i1kjZko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vpitech.com;
Received: from SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:1ff::7)
 by PH0P222MB0365.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:100::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 18:38:38 +0000
Received: from SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
 ([fe80::1ac3:14ac:b83:b2fa]) by SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
 ([fe80::1ac3:14ac:b83:b2fa%9]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 18:38:38 +0000
From:   Alex Henrie <alexh@vpitech.com>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        alexhenrie24@gmail.com, Sergey Shtylyov <s.shtylyov@omp.ru>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] USB: serial: cp210x: map B0 to B9600
Date:   Mon, 28 Nov 2022 11:38:36 -0700
Message-ID: <6063376.lOV4Wx5bFT@demeter>
In-Reply-To: <Y4T7+am39O2XNLZZ@shell.armlinux.org.uk>
References: <20221126035825.6991-1-alexh@vpitech.com> <3642317.iIbC2pHGDl@demeter> <Y4T7+am39O2XNLZZ@shell.armlinux.org.uk>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-ClientProxiedBy: CY5PR22CA0078.namprd22.prod.outlook.com
 (2603:10b6:930:80::25) To SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:1ff::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1P222MB0296:EE_|PH0P222MB0365:EE_
X-MS-Office365-Filtering-Correlation-Id: b454469a-ab48-4991-23ac-08dad16fc3c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LNBV6gUAVupLMhAnzixE6QMJH+Cm1ffW0xmByvIt1C0BPD9yA9ElvWUSp5xSVDCCHQ1qUJr9D51NQ3IA2yPEz5SNKKykiNHBcg3Bth6JujicfjtRtZLIcB8YY4oFqMGm861XgXBS4K6sJD3/f6YlL4LjfX6pLY3NxjYb0rt09vbBOyxIZU2iqqfN8stbfLxHNpEKx3B/8HCMX7vMDAmZfE35vwxYyJ6BRgIvtyN92J0nASlKiosj1eu1BTDoGsM02+RgJhv7DwSLG+t74jRjaQS//jPpVqv7nJ8KHkswcA9ZnQrrCIiqrJeCiHjZSvadvLjZrTKaP2rmnGFTzdlAOZ0t3KhssD2dKu5C0Y5bmPsRewMk7I/uA6MBWyXItqyO3AyPvh/UPUBJGE+6dIBraDeJbOHMsybfmBt7fNfQpKrY29pvn4XBv7/pIeQgeVocqFxjutc/cj17dvclhNYMtQ3bU6r0MrfOU28A9wX4AljGKJlL5PknyOnKPQCYMvdcECZDmgQlNs4SbzkBlOHvI84tagWkZzKy8FzL/Tv9PTrg5qqPlon8JOuuZz0JmEnRq0hruXcExJJnarhW6NTIBwRyQmB2OLxisi/x9TTwg0KObt9WnNdbLO44uIhyNWlpMtfSUknTMpHpnQOyr1+dAH+9nH9Eutr8Z7OOwHKFoP4pbB92y442dMit76DsV9iL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(346002)(136003)(396003)(39830400003)(366004)(451199015)(33716001)(66476007)(8936002)(41300700001)(66556008)(9686003)(4326008)(66946007)(53546011)(6512007)(316002)(6486002)(52116002)(8676002)(86362001)(6506007)(2906002)(83380400001)(6916009)(478600001)(186003)(5660300002)(54906003)(38100700002)(39026012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vGu9a4rW6wGSYC4VGPXQKaO8rsEXcV9tgift36cF74l7QpYLHwyViM9v0RPX?=
 =?us-ascii?Q?y8+cfWSDIvagl4I5hUrYfkF93VXU7m6Rr0t6S9XpdVHahNAOwDKnVaUYNM4Z?=
 =?us-ascii?Q?+V51Dph8kHldKAomU8eP+A1Pw1dX95dx/LfjZg4gXZOEK+ekaRM7s72IxCFF?=
 =?us-ascii?Q?79RmHHd89oQ3brSgWm1aVawEFv93SEe1SWJPHaACJngXwcOfKh7iXj6OQBpK?=
 =?us-ascii?Q?SkLl5SBQFvOCiJ0b2AsDP4hjT2y3xg9nFoZJ6jyVrJGAl6ufsXUNbH3gphOL?=
 =?us-ascii?Q?MkqGgnedIE7HyvqHMqAf4t5p39XvBdIPlPkF45PbwC5ttCG7E56NQPYWhprq?=
 =?us-ascii?Q?FXbNpgjMAzT3qJyeH7R7we9zniFmedVuZL0vKhhlKCnxfHY7KAyGOwB40jV2?=
 =?us-ascii?Q?YrwOWUz6ThQg3sz2FJPTNE6zLQhccX5I27rd9ZF5L+Wbv7sH99zyfkRJ8l45?=
 =?us-ascii?Q?264ZuiKmuboUC6/aeOcuwQM8U0WCXJOkMpk+vnlGQNpvShE4aPF/MYt+xAeC?=
 =?us-ascii?Q?GutHmPpdqqmxAmeIRZOPNoB2UUNsYNMC+w7IUIPdmiGyzmKd2Cwy5yFV0w4+?=
 =?us-ascii?Q?GMgkHAAc5UiLETrfF/A6PfOBdMILCbRAl/JmOIpvEQGoDw4ZTf+SgjzKOWfN?=
 =?us-ascii?Q?xTJMJwex1rBiv5VH8UqsHdlvDQCmmOI/fM1aDebkHZd/zKN5wZxVVlvFljAu?=
 =?us-ascii?Q?A/gWFCn5b/uhKLJuuBEOqAGVfpyMI0wNexglH7DpxUaw75zLyPelBgxoYFZD?=
 =?us-ascii?Q?YfAYBT6iTG+CbdpbHjgcL22UnKeRTIQyBr33hFoGjZ5LmNwxYFCwE3ZzQzOK?=
 =?us-ascii?Q?VUhHUvNIQtGV/CJkpewGP8c5O7skNkOqJfcEXb3zHrXOrEDj+34qCrf6WOnT?=
 =?us-ascii?Q?PYQQxbiR3MlcVN0Rq/eBuU4xG/JndSyceNJrScDddLWHLWTbg3dIhkBYhVY9?=
 =?us-ascii?Q?kNzCwQqYENves/Ac2ajf/PQJY6IbVBe2PWRCaSgjRsnXHNHt5xigLrZgfm7E?=
 =?us-ascii?Q?dabk+9BksKVcFjcU6M9OlbUOd8/0oaq954eQI0asCLA+VxLbUUVL/2PWRLcq?=
 =?us-ascii?Q?QapB+gk567P8EdvuugM6zzO8XyHCbKU3K23UEA5bNwfutiroa/ixZSBTE38Q?=
 =?us-ascii?Q?Y+SxrnTWHk9S5RiJ2/NVHd054d5jbLGsNqmDxvVhnxFNcQ+jMwyj01Rst9w5?=
 =?us-ascii?Q?Qz/EB+aElAQI7eYIvMUckbxVBGsubUutixY5tKAo9Eo2/ahQurMvZVAik7wi?=
 =?us-ascii?Q?6wZ5XzL1TwEHE5NhLThnqp9jRuJZuvoXhIu9okMNtshlZqQRryvAioUe+mjm?=
 =?us-ascii?Q?WlJ3WSsnMA4qUV6LRNdNngYV/51XOtf/050ZfFbl9BaSig8435nVzTnQ0xKa?=
 =?us-ascii?Q?NnyCodX2/tPi90+CMrNz9oWKZ2oEgvvwYJOpgs0jH2tTZ7qc14L0qnd6pwAS?=
 =?us-ascii?Q?HLdTzjjQ+hNxiclPY5Qf+vEBW7CG+TUEZ2rbcGViYU+LSFVeXb3xHBnOdMbO?=
 =?us-ascii?Q?8Ey9AQgH+ZH/IAcrRCGlr6dXvCstwYxOwauDgvg1musiarsL1v0r9E8q2sZy?=
 =?us-ascii?Q?W1S32cSbgQwkn1UcJSXb5QY8UucKkUy5LLOv3b46Z465vQpoYXizDrfl7f2a?=
 =?us-ascii?Q?MF6QbkVxV916eh0YJfYUh/g=3D?=
X-OriginatorOrg: vpitech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b454469a-ab48-4991-23ac-08dad16fc3c1
X-MS-Exchange-CrossTenant-AuthSource: SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 18:38:38.3542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 130d6264-38b7-4474-a9bf-511ff1224fac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90xSSjPNd3WGKJNEPP4xR80uDG5MWFPmrVrXhkXMuF2wvF2Njs4SstfokR22PDeJARsVfnULAX+7xpAMMsCPIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0P222MB0365
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Monday, November 28, 2022 11:20:41 AM MST Russell King (Oracle) wrote:
> What exactly do you think should be done when a baud rate of zero is
> requested?

I see two reasonable options: Leave the baud rate alone, or reset it to the 
default (i.e. 9600). In my opinion, either of those options is just fine.

> The fact of the matter is that at hardware level, the UART takes a
> clock, and divides that down. To get to a baud rate of zero, one
> would need an infinitely large divisor, which (a) is impossible to
> program into the hardware and (b) would trigger a divide-by-zero
> error in the kernel. So, we have to choose something.
> 
> That decision was made before my time, when Ted Ts'o was maintaining
> what was the original serial.c 8250-based driver, and the behaviour
> he adopted was to set a baud rate of 9600 when B0 was requested,
> which is reasonable - 9600 baud is the default setting.
> 
> POSIX (which is what we use to define the behaviour of the TTY layer,
> or at least what we _used_ to) doesn't specify the behaviour of B0
> as the output rate, other than it shall cause the model control lines
> to be deasserted. What baud rate you get on the line is unspecified,
> and thus left up to the implementation.
> 
> So basically, 9600 baud for B0 is the behaviour of the 8250 driver
> going back to the very early Linux versions and that has become the
> standard Linux implementation shared by a great many serial drivers.
> In effect, it's almost a de-facto standard.

That is really interesting, thanks for the explanation! I like the idea of 
having consistent behavior across the Linux serial drivers, so it seems to me 
that mapping B0 to B9600 in all drivers is the way to go.

-Alex


