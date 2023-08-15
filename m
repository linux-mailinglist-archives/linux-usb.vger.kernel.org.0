Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD7677C527
	for <lists+linux-usb@lfdr.de>; Tue, 15 Aug 2023 03:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233871AbjHOBiy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 14 Aug 2023 21:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233837AbjHOBih (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Aug 2023 21:38:37 -0400
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B9EC9E7;
        Mon, 14 Aug 2023 18:38:33 -0700 (PDT)
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 37F1bPoC5018456, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
        by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 37F1bPoC5018456
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 15 Aug 2023 09:37:25 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 15 Aug 2023 09:36:54 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 15 Aug 2023 09:36:54 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d]) by
 RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d%5]) with mapi id
 15.01.2375.007; Tue, 15 Aug 2023 09:36:54 +0800
From:   Hayes Wang <hayeswang@realtek.com>
To:     Jakub Kicinski <kuba@kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>
CC:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "edumazet@google.com" <edumazet@google.com>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "Mario Limonciello" <mario.limonciello@amd.com>,
        "bjorn@mork.no" <bjorn@mork.no>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH net-next] eth: r8152: try to use a normal budget
Thread-Topic: [PATCH net-next] eth: r8152: try to use a normal budget
Thread-Index: AQHZzsT4UEeJMIn+UE+i+73nn0/m7a/qj0fw
Date:   Tue, 15 Aug 2023 01:36:54 +0000
Message-ID: <1666467ba5ca480fb31f6507248f3476@realtek.com>
References: <20230814153521.2697982-1-kuba@kernel.org>
In-Reply-To: <20230814153521.2697982-1-kuba@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.228.6]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

akub Kicinski <kuba@kernel.org>
> Sent: Monday, August 14, 2023 11:35 PM
[...]
> Mario reports that loading r8152 on his system leads to a:
> 
>   netif_napi_add_weight() called with weight 256
> 
> warning getting printed. We don't have any solid data
> on why such high budget was chosen, and it may cause
> stalls in processing other softirqs and rt threads.
> So try to switch back to the default (64) weight.
> 
> If this slows down someone's system we should investigate
> which part of stopping starting the NAPI poll in this
> driver are expensive.
> 
> Reported-by: Mario Limonciello <mario.limonciello@amd.com>
> Link:
> https://lore.kernel.org/all/0bfd445a-81f7-f702-08b0-bd5a72095e49@amd.com
> /
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Acked-by: Hayes Wang <hayeswang@realtek.com>

Best Regards,
Hayes

