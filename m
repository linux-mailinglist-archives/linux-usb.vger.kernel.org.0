Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0963D798E8A
	for <lists+linux-usb@lfdr.de>; Fri,  8 Sep 2023 20:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243957AbjIHS7r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Sep 2023 14:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243969AbjIHS7q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Sep 2023 14:59:46 -0400
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0257F1BF9
        for <linux-usb@vger.kernel.org>; Fri,  8 Sep 2023 11:59:17 -0700 (PDT)
Received: from [192.168.1.103] (178.176.76.159) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Fri, 8 Sep 2023
 21:58:28 +0300
Subject: Re: [PATCH v4] usb: host: xhci-plat: fix possible kernel oops while
 resuming
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
CC:     Florian Fainelli <f.fainelli@gmail.com>
References: <e0459058-5ca5-1c1a-c06a-47100c176ba2@omp.ru>
Organization: Open Mobile Platform
Message-ID: <68a29c4e-1135-37e2-2061-2539f0f0a95c@omp.ru>
Date:   Fri, 8 Sep 2023 21:58:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e0459058-5ca5-1c1a-c06a-47100c176ba2@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [178.176.76.159]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 09/08/2023 18:44:50
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 179760 [Sep 08 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 530 530 ecb1547b3f72d1df4c71c0b60e67ba6b4aea5432
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.76.159 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: {rdns complete}
X-KSE-AntiSpam-Info: {fromrtbl complete}
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.76.159
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=none header.from=omp.ru;spf=none
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/08/2023 18:49:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/8/2023 4:00:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/11/23 10:18 PM, Sergey Shtylyov wrote:

> If this driver enables the xHC clocks while resuming from sleep, it calls
> clk_prepare_enable() without checking for errors and blithely goes on to
> read/write the xHC's registers -- which, with the xHC not being clocked,
> at least on ARM32 usually causes an imprecise external abort exceptions
> which cause kernel oops.  Currently, the chips for which the driver does
> the clock dance on suspend/resume seem to be the Broadcom STB SoCs, based
> on ARM32 CPUs, as it seems...
> 
> In order to fix this issue, add the result checks for clk_prepare_enable()
> calls in xhci_plat_resume(), add conditional clk_disable_unprepare() calls
> on the error path of xhci_plat_resume(); then factor out the common clock
> disabling code from the suspend() and resume() driver PM methods into a
> separate function to avoid code duplication.
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> Fixes: 8bd954c56197 ("usb: host: xhci-plat: suspend and resume clocks")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
> This patch is against the 'usb-linus' branch of Greg KH's 'usb.git' repo...

   The v4 of the patch was posted almost 2 months ago... What's going on,
is Mathias still opn vacations?

[...]

MBR, Sergey
