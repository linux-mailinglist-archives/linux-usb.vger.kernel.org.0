Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19BD750F1F8
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 09:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237443AbiDZHR0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Apr 2022 03:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245088AbiDZHRV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 03:17:21 -0400
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.111.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B97A36D96D
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 00:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1650957251;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VIVl4jxLvs3pSkJuRxzvhuFrhMYetcMWJbhUdL1y/EU=;
        b=FW1mJlJLdtBbMQrV23tC0Q9F7c7PJxoroUiJfLV8zgBLvTI9GgdP8sGN8OY4ol/9JOf4Hm
        bT5n0rqu0qwFhIE8E/VV07LGaALuL7bScl5zl5Be0ub8s3d1z3fKD31dhXTDgk2I/LQqOV
        A5MxKAYYzNHoBVJFSMoKfs5FsHNMq6s=
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-f7dlcfMwPbqZnfSwDNbpXw-1; Tue, 26 Apr 2022 09:14:09 +0200
X-MC-Unique: f7dlcfMwPbqZnfSwDNbpXw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9DBbSm55RTc/bkeZ4/Ii40WV9raw5BfGfgTOc2QclpaufsZlSWppTu7jGWSGTut5YfFzgOvmMJZh9ihXDlG7yuOg+1LmCEhghUQrH2HRSvbDYw47GDj2ZB+SgkGzvonzBrzDEufIjUy35wwNzlJjAf7YEqo4AaOqAssw3/V/X4zTaIk79Y8Gxccx2B9NR5vt5MpnLqXRd2WQ+p/xi1Y2fRawbGaORARXu+1yJHKuYtIvfTe1M8fJM8J50JAYM7EUIQEau3swJ+ZgYWqXb6w7Nd9TP9uutCxNhNpqr44Cdc0rvebSiyr+cDslI0XlhR+av9UIqrILiWy1i6nHihn5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okdlzwbA0/oR7hkZbesVis2s7thXYwqaSFn1cJluHaM=;
 b=lFd5o9GbBcD3aqPkWkHs/bVZpOkSgdiHYFMwGMoT/5DJusnTy1qcREM0IaU94uMJ9usXXpHznMsXxPF91tztI4PYROBLXKmdKrezd/jQTZuA05Ev25gZjjl0RrkuuRnP1xb8qCNIsBMFJ0TA3wEaqyMiH5OsxvMwjrRrECcIkwPOmyw9m4miU7qcB60tXoDRAi7aaxbmHtgrxlykHPqejBE8Mbozv3mO24at2EN5GCbYI0tmguPwSlPthLlBa2sgq0jkko9CM1/DQ8kMj6kVmrr0VAfDROrJ3ndTjuxizdxzvtHb4cSp48J7E1lqI1br+XwDwKqYoEJORjz6SXEu1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by AS8PR04MB7990.eurprd04.prod.outlook.com
 (2603:10a6:20b:2a5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 07:14:07 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b%4]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 07:14:07 +0000
Message-ID: <7def25c7-0870-accc-c689-4d8eef1b7acf@suse.com>
Date:   Tue, 26 Apr 2022 09:14:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
Content-Language: en-US
To:     Peter Hutterer <peter.hutterer@who-t.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20220425132315.924477-1-hadess@hadess.net>
 <YmarwaNQYn1GwFbQ@kroah.com>
 <e73035d1bae5d0c355166fb46f0f5f2f07752b3c.camel@hadess.net>
 <Yma3k3lRMIEFypMN@kroah.com>
 <1d82343a5987a308ac9bd3f6fd481bc12a608a24.camel@hadess.net>
 <YmbCBwEMvKO5z0Dh@kroah.com> <YmdYfK5Vi+lEl7FX@quokka>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <YmdYfK5Vi+lEl7FX@quokka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0025.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::38) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d738b35-f8a7-4df1-4dbd-08da27545a5b
X-MS-TrafficTypeDiagnostic: AS8PR04MB7990:EE_
X-Microsoft-Antispam-PRVS: <AS8PR04MB7990C751EFA55803B94E647AC7FB9@AS8PR04MB7990.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uXk11yd41Gu7qDoBHqxD86497+WiswbBVxYX70GYJ+/MlD9Bg7D+edGD0pTPODNTsO9icc6IFXu9JEahIqPut/61ayBDGTbMPH9IR6wBVzvIYfgQxEfg4S1ZYNY2wmF6tXf7xj0O6VGXYt1yBPj+PJiWJAeg9lfUGGEylME1axNoYfjDLGLNq0VPaWnlTuuOKqd+sPyEVFKLqJCkFK7SmUtL8g5p3ke7fwmoVZWBhZ2hUOf3cpBwsr0hmb4Zbz6e5A6sAh8Uc2K4T8/Sc4c4Y4beD2hn1E2dD6zZyqTuaEjUhClhPlj8H3FhV211Oo4XBJk/NSIJnMpFOKoEf3LZ2WrTQJaI9UEKGwJdmir8rq5wHNcK2ftwz+S0Z4HGKlG+/Iumog0SusiAvsv/PpLzB/xQggnvW/wTVQbgMsbSWSz5Cmn5twJiZoQujqLhuyt095izdDUdqFuYsH9HHRHvoUF8yUOyKOV5IYjT8/S1C6P7YBJIVlszkkayscr9WPq0BM6oMmor15PBnbSUA6HMpHdCvT7Efzy8UShMC1qwZZ9fwyF9WC5s3xc5jMmEL4l5WuC1tFIT3snc1GnqHFHADzaHHXmlzaOKmSYD/O8nu3AsCdJtwcJoJRuej79oUeySiNdKZ/3We/Cf15Rt7NKGcNZGmnela3JgnGF1awi4fI7gUCHNWNzVkPs/8aOKwDyLZuJB2Sh8Jm+Apnlz/1OzThcjzLo3IBW1kdoidL1cErs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(6512007)(4326008)(2616005)(5660300002)(38100700002)(4744005)(66476007)(66556008)(6506007)(53546011)(6666004)(6486002)(2906002)(8676002)(31696002)(8936002)(508600001)(66946007)(36756003)(316002)(31686004)(186003)(54906003)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r5M1kun4wDcJMbH1PKh6GTE5N3yAr443uGk8fo0SJkBgEDp9Q9tGNKZ6ZF78?=
 =?us-ascii?Q?jdLxPnSzjEa2Wxw+yQRIca9t/d5QbvxJ/sSjqIhd/fc2WmUYcKNsp83Asd+A?=
 =?us-ascii?Q?6CUDpq1Q2TzEzV/4NiF+wwY1UGpFjZhShyiv3X3GDO2Yut1WfN0/T1CEdVOi?=
 =?us-ascii?Q?LokeOabj7NckG19ju3pxe7NpnBaUjbZHRSePa8kLUtdEJqTQGbhWukm4632g?=
 =?us-ascii?Q?+ew/8s9bo6F+3DaUEFp/h9+NkhdZ9ESwsKHcbMdIZbQ+q30wO+XyTeUfzh5J?=
 =?us-ascii?Q?Hs7hhFBGa+JFsWPJh4ePqP1w1wULvgAmzf5NUwp+Ly5u9L4j9ETNfXn5/l3f?=
 =?us-ascii?Q?WPycDUAJDQoU0DPcXL25/rW3PqmEQ5V50muLIS8Q6rbuswC+GE8Y9GN2cT8o?=
 =?us-ascii?Q?aoFrR8MDxDk9Op7E0ddDbRlxfzgbsbu5VQ6JkZRdhjCspR/el5ELWeHWvv0z?=
 =?us-ascii?Q?ExoQZTBjZtUEnX2BMyW4zKm9uM8oQmTex8MmYLiutW1ANnp2jdSBSVmD9Udu?=
 =?us-ascii?Q?eC6smxM+8/SqrVfNFZVi7gVtlszMQJsZ25Ug2FILpivdzNwc88a7/rPym8SB?=
 =?us-ascii?Q?e2OKgyQ+UVBfD482l1JHKuVi3znSza+m5PuR/rilGbyuztRhXOI0dth4D8eb?=
 =?us-ascii?Q?BgAipTxRchWpAdg0cT59Z01qPWrAnSyn8wauqyynXidN86AUvbEfqx8BirJX?=
 =?us-ascii?Q?6HNkVkQ2aE3ZXod/t3kHc3fj1mlPMcb+QWMsbl+HqUShhXQ+mIYB5LGminNX?=
 =?us-ascii?Q?8PzZezfu3DhPL/ZDF3gag9l3X1FhPPyRb83awH2aS90DJP981D/zdqm7pwuS?=
 =?us-ascii?Q?hQakP4/hEJVeMk2L9TICbjogYFsURxUh1XjLmR93Dkt/3UonX53VjX0JEx7q?=
 =?us-ascii?Q?zed3n9fWi+RqOnnGdG8LF8NfYEOYoYnityDNcFURhJleSwsZ4jLD2TaH14B+?=
 =?us-ascii?Q?XH9xpLHV+t5ODXzJKJ+aG0nWzeqnm38chByiLoluBauKg9Sy6JttugdGJtGW?=
 =?us-ascii?Q?agzvqbMN49Et1TwLrQjxhsIVyIn95Qfy8Nti1idqPD4KOcW5bHdyr1gmVQkH?=
 =?us-ascii?Q?QxKqOtgkwad36tf6BVKvNf1RR85B8SnucYRBPrUHgPZZ9s3YnIa6mnOAY57G?=
 =?us-ascii?Q?c8CHalEHIESO8YzKlPSST3MHO3RT+nFTAhueNaBxwEy+Wg8Tq0gsR/EABM+M?=
 =?us-ascii?Q?dftMvQq3ZgXHAy8qrZCozDsm4LTjtucXDZdQzIarwMdWwxNLGZBm2N2IysVN?=
 =?us-ascii?Q?wDCpjImfe9ioCtqV0W5uwsEaZL/qUBJ3ELEOAbDnn6w3o4kBAfEfX8wvyY2+?=
 =?us-ascii?Q?kwX5X87HRL50FwU1eZTRSGYTmoDEmrA2LfmKEaXg9RXBJyLd0b05WXRRogrO?=
 =?us-ascii?Q?K14U/fjky8CNPIGJ0tYMr9Fc7pIHZbghzz5+wAhvuUi12lpJaPecmfBN56yB?=
 =?us-ascii?Q?6BGWf6/RbUK5yVca1muXBz0Lz2LPZEWVX+V1PnNysRjxVodtw8Tk0H8Prq62?=
 =?us-ascii?Q?d+rdgw64/eQfGSdumL1tjC2dolKD5CmI+zjmJ73aFuRe5qppU2XAt2iTZbAJ?=
 =?us-ascii?Q?YiTtF88AlAWaFiPXbTW1uK6ZqJ20e97QnMxJhUB+0mSnoCKbX8Nxr+5DBsnH?=
 =?us-ascii?Q?3Sr4Xq5VDjfhvalMYy2D1/roP96KzdDDiE5b9XB45dhVOEX1xvZ2ZR3DCbwd?=
 =?us-ascii?Q?CsGD8GpO1XN6OmAR/EKz742JCLQSucxgNVDwBn0ERABKQnJY+EsVw9IJQ8o1?=
 =?us-ascii?Q?0oQ8yF/oqlvW98J9cORv2O952gjhdGeazLKuB6vINkyy85aZrn7W+eg+fHe3?=
X-MS-Exchange-AntiSpam-MessageData-1: cFwy6thHANAO3A==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d738b35-f8a7-4df1-4dbd-08da27545a5b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 07:14:07.5515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMK6VoiE6PS8Xpv7LfJa18QUtdGNDvhAIaqs97S7fQedokQMHXm3XUZ5c+zJVZZ0r6uHQsFAsbj05wyvKZT1Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7990
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 26.04.22 04:27, Peter Hutterer wrote:
>
> chiming in here: the hidraw ioctl is independent (as already mentioned)
> but it's basically the same approach and/or intent. The hidraw revoke ioc=
tl is
> "the evdev revoke, but for hidraw", this one is "the evdev revoke, but fo=
r
> usb". Not very creative, but at least we can point to prior art and say "=
this
> seems to be useful" :)
>
> The primary focus of all this are joystick devices (unless I missed some =
other
> grand plans Bastien had that I'm not aware of), that should put things in
> context a bit.=20
>
Hi,

taking the advantages as a given, I must still ask, why this, if it is
so useful,
should be implemented for each subsystem separately. I cannot help but
say that this should go into the VFS.

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

