Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47BD763C6B7
	for <lists+linux-usb@lfdr.de>; Tue, 29 Nov 2022 18:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236216AbiK2RsL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Nov 2022 12:48:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236125AbiK2RsK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Nov 2022 12:48:10 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2057.outbound.protection.outlook.com [40.107.96.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9942460E93
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 09:48:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PP/k/nlh3ikPrH/7/l68/vqH71JhgHuJiUpckNA6uaIE1Pa9VAIlIBasm5UZAhJePclLAk3tZLnR4m5wO57sbsh75wv3G+SxedkoPl6yESueGHPYI/5vVpT5Afk1HphGOlFdA6/TvEEuF273U6Bdiebrq3oA03DxlnRxWELVd0Zd5MyrI12hnMbbtGsTNQieWg3Nli0NNypLBH8+aCagJuVoktK1Ize2YqlY8B/wXCzfHe0o4hkV8BpUaeJUoB+lmGSuU2EeKLV6MjT86bKy7M1hEWT3iIPpiz7/y+cdcszZFSNkwLL/EeAd5FNDuhspOMTYBGZECFv18hPi2NVc2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e33JuZ+Xdmo1QRMTI8uqvjtf8VolEOpKMPLgMyOogZ4=;
 b=W47MW2jCsW5YFc/CUrL0iZxVEtJ8sGCGlkR7S03T8wCLV5oEp0KvnYyF2weJmDJak0vW+fpPKUkzuHM4x9pnl2WnTfTUdMpNb0zjUGXGk/pjjP+PGJtbHV3yAgvsC89q7oLNXQSHLuxiSr1+GH/nBIQzFizWKT2q6ifXhB/99GpTel70FH676R38riZBGMx1Z4MiwGg0D3/DZ1vNprcZb8SaF8J7VZ+qvuFvQLVVpJEGDF4mFiZ9VBEIer2HqB3IMGnQ1bgpU9TIQzX+lgn5rhVt7NYABWPbmH53yRmRlDMrT+wIlqY4Sus1qXOeUgJrduF/RtzIbefhFKLvEwiEZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vpitech.com; dmarc=pass action=none header.from=vpitech.com;
 dkim=pass header.d=vpitech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vpitech.onmicrosoft.com; s=selector2-vpitech-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e33JuZ+Xdmo1QRMTI8uqvjtf8VolEOpKMPLgMyOogZ4=;
 b=N/m+1vdl1a4EX4djKvy2FBKUX4K16Q5mQzC9FtglpvtmdktGaAChJWu9tlnagT3aw5U7QZSuZ+0IHpHkTeg55qpYYjoDdB+0EKbN2c51Bt7uhXJI9byGr6oYtW8Vaz1PyLcueXjaw26QRRF6Edv/9p2f4crU30+DZgFHDH7cz3I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vpitech.com;
Received: from SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:1ff::7)
 by SA1P222MB0214.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:1f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 17:48:06 +0000
Received: from SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
 ([fe80::1ac3:14ac:b83:b2fa]) by SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
 ([fe80::1ac3:14ac:b83:b2fa%9]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 17:48:06 +0000
From:   Alex Henrie <alexh@vpitech.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Russell King <linux@armlinux.org.uk>, linux-usb@vger.kernel.org,
        alexhenrie24@gmail.com, Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH] USB: serial: cp210x: map B0 to B9600
Date:   Tue, 29 Nov 2022 10:48:02 -0700
Message-ID: <4443793.LvFx2qVVIh@demeter>
In-Reply-To: <Y4YT7D6AoD31UdOC@hovoldconsulting.com>
References: <20221126035825.6991-1-alexh@vpitech.com> <3642317.iIbC2pHGDl@demeter> <Y4YT7D6AoD31UdOC@hovoldconsulting.com>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-ClientProxiedBy: BYAPR01CA0062.prod.exchangelabs.com (2603:10b6:a03:94::39)
 To SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:1ff::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1P222MB0296:EE_|SA1P222MB0214:EE_
X-MS-Office365-Filtering-Correlation-Id: 49970c78-0c2f-4139-0839-08dad231de11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TIPo/+Q6aQ9C8gfUPfw4weEWPVQyJcWI7/dGkyIWCZNkKv4wpxvwStyI//l7ZTeTIpWpNcmzcTLVTueN/oTJwOM55do5ysRxtwoKmUqZPQRDzt7eaQDymW0dHkDGFPql2qiKy8tVmNxUwuItpfzKsl8C8rskoCnwU4NciQehbMrKaRCUox0EL81u9LWMGpzK9sUjjazdAHof6mfimwftrKm0CbxhaNFtMqEPm+QQfKtt+NTCZmR4PsW51yjb58R66yNIUJ1ihelT4XJLtxsyhNq7f76dumxae2fEqsYgVtn+lyd8QDsqyEmE8tX7TOwUiTfJHpt9JFSQY6VEk+SetWd7PP/cDq/17Xq4S0kl4/R5cNyDEpvP3hxb2Grxlclseuy0wimwx6/yEbO3SydNqRAWD1MIMXKWFTMNx2oIRVUCGBTrwkIVQoHnE2eLHyFTMxieu8MjhSf3zdkAKJSmifG1qn91A5TuERdA/bzaSaLXA9ZD6nOHQE4ec6ZpdsOwjDD/cpSSFqIwFoo6Q01WkPrqL6MyVNZscGLre7WZxf3lsqg/m+ARtu9Xmc3wUXsRYPrkYl11SvW9Qx0CwE04nA+vRK+ZaD67c7qqvsHEMGdTyPEth/QBr87dSiC17Aa6V3unG0GU+OAmh1vuagWv9Ygeg538eh7VGtlYTCvr9e0b29HTbPNS7WbEIxrc1BWX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39840400004)(376002)(396003)(136003)(346002)(366004)(451199015)(2906002)(83380400001)(6666004)(6506007)(38100700002)(478600001)(6512007)(6486002)(8676002)(41300700001)(66946007)(66476007)(66556008)(52116002)(53546011)(9686003)(33716001)(8936002)(5660300002)(186003)(4326008)(86362001)(6916009)(316002)(54906003)(4744005)(39026012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G9lqgF3rL1i8hztNhwHwVL4o/mBvu9vsytikL+6BCOZp+PRhXrZOlpgEO/at?=
 =?us-ascii?Q?WbmrUxBEAEDLAy5Ed0Ov5FXfYjrI7iK6uGTgGwGFzeMZkoeTP4ssSXn5C7SS?=
 =?us-ascii?Q?QvgKGnYgxhIAkzLSD2PRJhHJn2tDaUu7PfxJeegvCy2o3FGK5jHxrXIGGDzW?=
 =?us-ascii?Q?z9aEoxo6aYkS7OP7fHRn7zKO0GG5euvsNTNJmyCVI+iAplacFS7tbUEvz+H1?=
 =?us-ascii?Q?skuLSwtgLHdoeEdbrT//oU+4rG0N4CSB5QhDCorLwP+0ysy26Sp5lgW7VC+P?=
 =?us-ascii?Q?4jhArHf37x7kdh8Gs+7Yh/qCIqRszOMhBEd1gXBqZ12nQDkr6tvrictUq8nx?=
 =?us-ascii?Q?G32QGYjKG/fXhXet5r3pUpX6hWrkcb0ZWsAoUjzRFZwU2xqw03Chq0y6k7gK?=
 =?us-ascii?Q?rQeL5yWCbVLXg93orDH/aqTXSQsv2DBOfkV8/Bj99B/vZ8jJigoKeTFuinNB?=
 =?us-ascii?Q?HZQS5qLOVYhTmUWl8/81W08lyMU7ReEnirqvb2d+nBTsVCgBaBDiOMm6Sok7?=
 =?us-ascii?Q?fa4p1Z4R9bztGmM/q/fH5eSOtdyFdr2ka1PFWb4X10ubyHbBocxzykCMwXfs?=
 =?us-ascii?Q?TMyfOqbPrPGNCx8D3WlTWTraLBxUHub0D5bJOnuBiMSzuuG/Eqs44wXHEQ5M?=
 =?us-ascii?Q?WuJ/EuBesrM3NhVEUfdu//gr/zdzI9xlt5Wi3kHg1K0h63I5k7fqE+DOwkRt?=
 =?us-ascii?Q?+WAE6J3GrNouNr1joKvfqCaK11DFqmbrvyO/3kPtDw2iTNKwO8h9HGSLPZ84?=
 =?us-ascii?Q?5r1UHsG5X5LBa9fOCb6h19I9pkYCg6RqBOgXTHAQ+WVUIJHxSEewGVC6XHjJ?=
 =?us-ascii?Q?pKIylUelR9+V2kT0Yg3JUB+mN9axLJX5F3taxxB4577FEOiPu6UUGiKL3sf4?=
 =?us-ascii?Q?SDlwpRItCtjsajszjWwG2co3wJrnm5cWCf/Kt6R0txsAZTaJ3xDMxGKgII7G?=
 =?us-ascii?Q?Os3bHU6KULREBaLcu4nOvAUP82oPyBbHRpkx5IFyaBm2PL5ext468ypgDVfN?=
 =?us-ascii?Q?fjnjtd2THAaYH/M/vsspgbtwjUr0RdhR+2hPU4ccPzKAi/EUCerpovpVSGIn?=
 =?us-ascii?Q?589rc6/Zm5NaZ3xK1yIn4FAPb/5RGk24LSwIVCzkEFYE7GQziNW9E5kpBEQq?=
 =?us-ascii?Q?VIEvuC7+vpbabkjDq9PIHdFy23iv+okdAH57m89VwF+bqoDMjZecr2zLt+vN?=
 =?us-ascii?Q?9IYJlIRN3/muTslSiBL54nd7y2w9ul+H3zJBhScN/E1xr2JyYRY5b0FvjxTy?=
 =?us-ascii?Q?xI8UjR6sQqbrxF1YSRQROQIL0G71EmN+k1RO6sAk6+ixBvB6CKO9ZAYU0BZN?=
 =?us-ascii?Q?qD9kDK9ByJacAO1hGkUX8U02O10Y2KuPBHwQkZLqJsVVK7nURNrWsEcFwDQE?=
 =?us-ascii?Q?8sOVtRBSNAZG6Sh2wrXjs8JAVmsyi/0giQWYsCV9QTHJB0tplhQyjgP5LgtP?=
 =?us-ascii?Q?X9VX1VEAbCNSOH+P4jUcqBBBnjR60IQbPumqfiRj4T73dAVhyAY72tD54bCQ?=
 =?us-ascii?Q?SwUVBwqQCGmiJydYMgpkLip2jW1vc0jCA4DvL7TessiwsDE3vvogCcS5mgTW?=
 =?us-ascii?Q?77hpwfH3pbiqYZeyGbXf/kojRiAgy59GEeXstCLwM3IACsffKXdZEGCvAIkN?=
 =?us-ascii?Q?yz7mFnLYVMaKl9tHNpliYJk=3D?=
X-OriginatorOrg: vpitech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49970c78-0c2f-4139-0839-08dad231de11
X-MS-Exchange-CrossTenant-AuthSource: SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 17:48:06.1463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 130d6264-38b7-4474-a9bf-511ff1224fac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9b8SIH+LmubsXIYIORXIgSFL778zY67oFjL9zsMarYq2oIFxFl9BiM1hs/3n5sX8m+uzc8+kWH9K8Dt5ftNGew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P222MB0214
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tuesday, November 29, 2022 7:15:08 AM MST Johan Hovold wrote:
> Also note that the FTDI driver does in fact leave the line speed
> unchanged when B0 is requested (that zero-baud check in
> get_ftdi_divisor() is only used for ASYNC_SPD_CUST).

I tested it empirically today, and you're right, the FTDI driver simply does 
not change the baud rate. Thank you for correcting my misunderstanding.

> Your application really should not depend on any particular hardware
> setting after requesting B0.

Understood.

> That said, I've implemented support for B0 in cp210x which leaves the
> current settings unchanged (and which incidentally allows you to
> use the buggy tool).

Excellent! Many thanks!

-Alex


