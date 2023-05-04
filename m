Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0CBD6F63A1
	for <lists+linux-usb@lfdr.de>; Thu,  4 May 2023 05:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjEDDln (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 May 2023 23:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbjEDDll (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 May 2023 23:41:41 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2132.outbound.protection.outlook.com [40.107.114.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F5D1997
        for <linux-usb@vger.kernel.org>; Wed,  3 May 2023 20:41:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbsh5H4xbSk4hK1aA1QkFIWoj8n9aXyZkxBSeaCe+KJMH8z1lbT7KbXqX/rjHL9g4za9gsA6sVWFw7tvgiw9UUCYLvcJvbErPtZDbU4el2bz452Mc/PzT+cqHIATINT2rCfpm62Jn6jro3NPaHqx0+5xDECJ5LKHm6/bfagE3rclh43cJ1wlkSEy9cyDkTYYrMOePuNBmHx5RogHHThOiwJ92wKH3MfdEOAgYcEtlImNwTHVoshcLiWzPG17yvYtqn6UQQeLvZjpL71nrq+4p/9rKfzH5nJ7htzz5sgKn5eKN/d1ETmznZa7T4IAQ+tlXBKmwMR6NXq5XhXJ94eEAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6tWjD8pNleqm243HBn9/1ssGxKRReHGgLDTefKeVgc=;
 b=LHhd9UMQ4jTAGaVttHfFT/swXkBpals2kSrW8Oe72lcZqHPaLrX5u90P3WWnwM+Uhp5gfKmS4A7JOgaB70t9TWGLXsbe+eJwIkbj/ltsEfxKjxudlgLhTGkJcljigX4apQESa7Muc+kUVIbv3qeqBs3REN3lc+MaU6Y4r/+3VYlVEpt+Op/HMZc8PqbHYMxDd7NnYB7bYJm2u0blSppgir0AvLQpN6VO3nuk1PCTfHW5Uy4eJyh3WGHROzQ4GAB5NkiC8Rv4WygtNc38GXX5urY0SROMfFbqwGeI3AlUkD3DiRUg0asDSUX8FcEk+nj3HxmpK3isHLFkuYwgN3c9Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6tWjD8pNleqm243HBn9/1ssGxKRReHGgLDTefKeVgc=;
 b=Tc4nmOWpKu6Ms2ZobzvQYUmgykVoXcFL5PSV3MSDVnqp6/eM045r+aHg5zFZ7gOaYaudJYItB2cwvy1bafpkiT2TRd8EugdCxFlz30BRS1cyg9b8KeqbmNxBcjLcWF6qoGzBy41+NsX2C1yXNxlV/zyOyxC205qCCfBPEBZO5dY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TY3P286MB2770.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:256::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.21; Thu, 4 May 2023 03:40:35 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::91e1:d460:5907:34d6]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::91e1:d460:5907:34d6%3]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 03:40:34 +0000
Date:   Thu, 4 May 2023 11:40:27 +0800
From:   Hongren Zheng <i@zenithal.me>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@debian.org>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usbip: Use _FORTIFY_SOURCE=2 instead of (implicitly)
 =1
Message-ID: <ZFMpK2vA7r9y7DPQ@Sun>
References: <20230503173622.1072787-1-ukleinek@debian.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230503173622.1072787-1-ukleinek@debian.org>
X-Operating-System: Linux Sun 5.15.67 
X-Mailer: Mutt 2.2.7 (2022-08-07)
X-ClientProxiedBy: SJ0PR13CA0144.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::29) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB1393:EE_|TY3P286MB2770:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b03c60-8a3f-49b5-80b9-08db4c51515b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j6dZ9yYsHcSo6pI1w7r5Bi+tEOUvKXJUgvgIzsQd0JjmPf4gCnc8MYQVNmwq/CJWyH2kpLwhDPAqnWpJgaiN0hUdeYSEJxxAJTrbldg1R0OBS/APQAXX7t0qTB3+gq4eAE0N5OcgdZfMW8vnu2G9rZPY7l++0ExTE9aUyEqOG7tnka9+CgQKclKJzNsKhQtRpUMXLK+KlzV6RgBmVGVItubyo7e6eJX1ZPTQOUHiXm8LL6eWOqTviqdxcpBlQL7pk+OnhkKQqrwMclp5NFhfP2m0bI5qZWb4O8itjruLcNl2bzp89fgRTWjW6nXBaPYMzg81iimC1/NpH1MzS6TwA+toc2MQRN87oujonw5U1/UbGpur04VkuS6PuxXmpi46aVz4ZFe1H6x4tEnPiasuouHuS+Sc+4Wj/ySj3dp93Yo1VKxBd6unZf+l2Ux5PVT5ajZ2KsM2+3C3+5VdoOJHsdsbIhgmiDeSGondkbAhyS9auMdnnmPHGEUW2tB0mSbkYQVX0h+qF0T3gpNEKg+MO7l5iQrps5p/cGIptWVO3adgd58gCTrqV5hAJKCHUQrLQ+HUzlssNXVZheVkiKAWMvEK9wbJO5am8y9D1EUcs70=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(7916004)(396003)(39830400003)(346002)(366004)(376002)(136003)(451199021)(38100700002)(5660300002)(2906002)(316002)(86362001)(786003)(66556008)(66946007)(66476007)(8936002)(4326008)(41300700001)(8676002)(83380400001)(66574015)(186003)(9686003)(6512007)(54906003)(33716001)(6506007)(6486002)(6666004)(478600001)(41320700001)(6916009)(49092004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?d6EL1aGFGqowK99rpSEBEslB4SBfEHEMrti+p6N5Vcw9wcQMscy0kAH9PW?=
 =?iso-8859-1?Q?q7+gVrXXUOutbv6/2gNig3sMT+4fnfTat4jFjQABCXv2siNb1S9aro2k4+?=
 =?iso-8859-1?Q?LkPUG/wNaYY2Z1kdiSVvnJaawuZ9LNMqD822Yq1WwuSKfskqrW6VVse4BS?=
 =?iso-8859-1?Q?xCnodQpj3E/XnKmZfmqqkwKwEsm3iJ66NMAgDLoB3n7cqDI238JHPQOsGG?=
 =?iso-8859-1?Q?LmDFtaWtdDIYTBlLtdb6eIkIQTkxEYyfJip/UNSp6Y5Ck3SF9vH6FT02R8?=
 =?iso-8859-1?Q?b1gbC5/n07x1xEIRszpWDe+GMT+7MBrqSUm5hk9Ezp57yiiA6JuEWGBSo/?=
 =?iso-8859-1?Q?wWu01uszs5ZB/iMuU9P5ydCNMYWqBZzZts0XFT6NmfCbsdiwH3RXU1B4K2?=
 =?iso-8859-1?Q?UYcYjf/lQj2V8QQo92X13mOeU9UHyif3rC7eeggmKcN2K35JVCwh1bSxCB?=
 =?iso-8859-1?Q?tpS+U+RL+n4DVwHcQimXJPnuth6rvPrv5mrDe8ALOEV6q7814lxRVZfBpY?=
 =?iso-8859-1?Q?ZQeyTVSpchhesjSnJ/LLup0beShgNiClsziwR2nKkLijJHh8xDJKqkA88o?=
 =?iso-8859-1?Q?ldCtyM1+wkPu1/lY+wNXedZikritg7PE5UmHgWcLTMw02lZZzh7PgUXAFz?=
 =?iso-8859-1?Q?UB2hSgVKgodt89hJI3sbbUh+Fc2HMn659m96AK///ybpKnd7fHaI1/jJwR?=
 =?iso-8859-1?Q?3etFyKPNKnkloU1s1wnHe+l+RXyPWn+yTTwJjKnojMS47CeL39hA7NE7Cr?=
 =?iso-8859-1?Q?FFZE7V//BLdCubY9ozSO21j9g/RDCvdYo3Hzpw43uy41dibh8JoQ3CpY3q?=
 =?iso-8859-1?Q?+vqERlPLaU5tKVXd67HB/1xRAzXz+iTqquD18wws1ugYh9vFo9ckPtLN+1?=
 =?iso-8859-1?Q?7pdCQhBy6ta/WfE1E7SYzfZvxOffCtSYsobqUgDKsjTO1D5hGJXD/Fuq6L?=
 =?iso-8859-1?Q?+Gn5XJwUUCwgIFSwR07YCDw9fFkdmgDlQUGCqjT5Fx7CipLHmPAfLs92ok?=
 =?iso-8859-1?Q?pYCGHnEcWppxAFzkjGbLPMisMaWimv5Z8pqvz/a8N/WKtH4aZ2agTYk095?=
 =?iso-8859-1?Q?LkysYhzm1RTywbWs1O/5wULZaunNv7pStYDY+gDzcp7B/2DyCb3NEkSMnM?=
 =?iso-8859-1?Q?ehzQ07/NhgieCw6jyJiy+LnoeCOv5C7C2DZzs7/6Eq9KwtGfjxFe4PObRa?=
 =?iso-8859-1?Q?lHd5y2+a3pawYIlFGGK+nAYRXevWU2cVg2nb0N81RhpeVT0/8UZgFCPPGG?=
 =?iso-8859-1?Q?f8QCd5V6e0YrpHSfvUkckRRES2r+O8cr3X4xQimgAeEP0w1AH1OU0xQxON?=
 =?iso-8859-1?Q?+dwP2RjFHXsKZmSMt/W8psLElqGFci9Cd/ASH9e+XAb+7mT7lu9qqeixad?=
 =?iso-8859-1?Q?DFEX/uryvXz8XkXQC0kO3fpBcaXTJFR5d8YfgYhoV3PaOCXLdLJquczpUQ?=
 =?iso-8859-1?Q?5WIVBT6vjbboVKBZ0im++mqxjZBW7MPrg2+ijvKaywicS4qWS/AU8Z0oKh?=
 =?iso-8859-1?Q?wuW41qjpglOQmKD/xnEeUkQdxE2YAlEZM1tbhB/jRoF+obUa6C3mzrVRYF?=
 =?iso-8859-1?Q?1MeyWxApbmCuigOTfVuEmWOQ1Umvw2o7HYbkLi3okIvsKBTIcMt0OcAf+k?=
 =?iso-8859-1?Q?fPhZEHH232u6m4Q9n2DhP8eV3p3YI3Pn3P?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b03c60-8a3f-49b5-80b9-08db4c51515b
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 03:40:34.7862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UP2Ybbbb4BmpfrK8bCK5POoYfBvxCRoV0Yle43H+YLMNHTJb8Q8ZteznBHrm4EYp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB2770
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 03, 2023 at 07:36:22PM +0200, Uwe Kleine-König wrote:
> _FORTIFY_SOURCE=2 uses more and stricter checks. This is what e.g.
> Debian recommends to build packages with.
> 
> While at it fix a typo in the output of ./configure --help.
> 
> Signed-off-by: Uwe Kleine-König <ukleinek@debian.org>

Reviewed-By: Hongren Zheng <i@zenithal.me>

I've tested that with this patch the code still
compiles when --with-fortify and `usbip list/attach`
worked.

> ---
> Changes since (implicit) v1:
> 
> - s/_FORTIFY_SROUCE/_FORTIFY_SOURCE/ in the help text, noted (off-list)
>   by Cyril Brulebois.
> 
>  tools/usb/usbip/configure.ac | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/usb/usbip/configure.ac b/tools/usb/usbip/configure.ac
> index 607d05c5ccfd..8debf934f8b7 100644
> --- a/tools/usb/usbip/configure.ac
> +++ b/tools/usb/usbip/configure.ac
> @@ -94,11 +94,11 @@ AC_SUBST([USBIDS_DIR])
>  AC_MSG_CHECKING([whether to use fortify])
>  AC_ARG_WITH([fortify],
>  	    [AS_HELP_STRING([--with-fortify],
> -			    [use _FORTIFY_SROUCE option when compiling)])],
> +			    [use _FORTIFY_SOURCE=2 option when compiling)])],
>  			    dnl [ACTION-IF-GIVEN]
>  			    [if test "$withval" = "yes"; then
>  				AC_MSG_RESULT([yes])
> -				CFLAGS="$CFLAGS -D_FORTIFY_SOURCE -O"
> +				CFLAGS="$CFLAGS -D_FORTIFY_SOURCE=2 -O"
>  			     else
>  			     	AC_MSG_RESULT([no])
>  				CFLAGS="$CFLAGS -U_FORTIFY_SOURCE"
> -- 
> 2.39.2
> 
