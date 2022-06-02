Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08C8F53BF3F
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jun 2022 22:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239084AbiFBUCt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jun 2022 16:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239073AbiFBUCm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jun 2022 16:02:42 -0400
X-Greylist: delayed 64 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 02 Jun 2022 13:02:31 PDT
Received: from smtp687out9.mel.oss-core.net (smtp687out9.mel.oss-core.net [210.50.216.236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8940D101D
        for <linux-usb@vger.kernel.org>; Thu,  2 Jun 2022 13:02:31 -0700 (PDT)
X-IPAS-Result: =?us-ascii?q?A2AQcwDRFZli/7NplnpaGQEBAQEBAQ0eCwYBAQEBAQEBA?=
 =?us-ascii?q?QEBAQECAQEBAQEBAQEBAQEBCwkJgUYCgToCAQEBAaQ9hxkbgiWJYwsBAQEhM?=
 =?us-ascii?q?AQBAYR4AQFZBYRzJjcGDgECBAEBAQEDAgMBAQEBAQEDAQEGAQEBAQEBBgSBH?=
 =?us-ascii?q?IUvRoZUIAcBgVYBDgEehXUBAaxugTMNdIRZFIIQBAqCc4E7AgEBAQEBAYlBh?=
 =?us-ascii?q?V99gRCBWII4AYV9g0CCLgSSRoQjBBs7AyEVGDQSgSFFLAEIBgYHCgUyBgIMG?=
 =?us-ascii?q?BQEAhMSUx0CEgwKHA5UGQwPAxIDEQEHAgsSCBUsCAMCAwgDAgMuAgMYCQcKA?=
 =?us-ascii?q?x0ICgoSEhAUAgQGDR4LCAMZHy0JAgQOA0MICwoDEQQDExgLFggQBAYDCS8NK?=
 =?us-ascii?q?AsDFA8BBgMGAgUFAQMgAxQDBScHAyEHCyYNDQQjHQMDBSYDAgIbBwICAwIGF?=
 =?us-ascii?q?wYCAnEKKA0IBAgEDBAdJRMFAgcxBQQvAh4EBQYRCQIWAgYEBQIEBBYCAhIIA?=
 =?us-ascii?q?ggnGwcWNhkBBQ5PBgsJIRwJIBEFBhYDI3MFSA8pNTkGfA+uUpBAnjMKg04FK?=
 =?us-ascii?q?QeBCQeeSTGDYwGXEhEBJ4FXi1SWaKgSgRiBf3AVggiBHFAonRCBEAIGCwEBA?=
 =?us-ascii?q?wmPCgEB?=
IronPort-Data: A9a23:zXSVHqxZGmmFF9+9T5t6t+e+xCrEfRIJ4+MujC+fZmUNrF6WrkUHn
 WdLWDyFbvfZZWb2KYojaY+w90oDvJPUnNVlSwM6/lhgHilAwSbnLYrAchuoV8+xwmwvaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiVY0ideSc+EH170Uw7wbZj6mJVqYHR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyV94KYkGE2EByCQrr+4sQKNb
 72rILmRpgs19vq2Yz+vuu6TnkYiGtY+MeUS45Zbc/DKv/RMmsA9+r4CF/YYQ0sMsRGUz+BL7
 4VNspu1Vxh8a8UgmMxFO/VZOx5fG+hkp5DpDVKWlpHK7SUqcVO1ma8oVRxue9RAp6AuXjAmG
 f8wcVjhajiCgeyx6LeyTOV9wM8kKaEHOatP4Ck9k26FVJ7KR7jlUaKJ3dwJjQ0Vqe1NXsT1f
 e9COBlWOUGojxpnfw1/5IgFtOOpgGTvNiBDonqLqqctpWve1gp81P7qKtW9RzCRbZwPxAPB+
 zqDpjykR0hFZZqE1TPD7Xi2gebDlyr9VMQUGaH+/+MCbECv+1H/wSY+DTOTycRVQGbnMz6DA
 yT4IhYTkJU=
IronPort-HdrOrdr: A9a23:cip3LKCA9d0Kn7rlHenP55DYdb4zR+YMi2TDsHofdfU1SKClfq
 +V/cjzuSWetN9uYhEdcLm7UcG9qBXnm6KdirN6AV7NZmTbhFc=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.91,272,1647262800"; 
   d="scan'208";a="82056741"
Received: from 122-150-105-179.sta.wbroadband.net.au (HELO WIN-J7GFDBAO51J) ([122.150.105.179])
  by smtp687.mel.oss-core.net with ESMTP; 03 Jun 2022 06:01:25 +1000
From:   "Martin Otamori" <info@mandy.com>
Subject: Acknowledge this message
To:     <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Reply-To: <okkmart68@gmail.com>
Date:   Thu, 2 Jun 2022 13:01:22 -0700
Message-Id: <2022020613012052016987EB-E0CB2F84A8@mandy.com>
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_50,
        FREEMAIL_FORGED_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_DNSWL_LOW,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  1.3 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in
        *      bl.spamcop.net
        *      [Blocked - see <https://www.spamcop.net/bl.shtml?122.150.105.179>]
        * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [210.50.216.236 listed in list.dnswl.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [122.150.105.179 listed in zen.spamhaus.org]
        *  0.7 SPF_SOFTFAIL SPF: sender does not match SPF record (softfail)
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [okkmart68[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I will give you more details as soon as you acknowledge this message.
Thank you.
Martin Otamori.

