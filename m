Return-Path: <linux-usb+bounces-393-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9F87A6C8B
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 22:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 363A32817D1
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 20:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3FFB37142;
	Tue, 19 Sep 2023 20:53:40 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B064927EF5
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 20:53:37 +0000 (UTC)
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A78B3
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 13:53:35 -0700 (PDT)
Received: from [192.168.1.103] (178.176.79.31) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Tue, 19 Sep
 2023 23:53:31 +0300
Subject: Re: [PATCH v4] usb: host: xhci-plat: fix possible kernel oops while
 resuming
To: Mathias Nyman <mathias.nyman@linux.intel.com>, Mathias Nyman
	<mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	<linux-usb@vger.kernel.org>
CC: Florian Fainelli <f.fainelli@gmail.com>
References: <e0459058-5ca5-1c1a-c06a-47100c176ba2@omp.ru>
 <0957c21d-144b-1d84-2f79-f4cc6ba2a493@linux.intel.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <003fb120-893f-de64-919b-a7f1f66532be@omp.ru>
Date: Tue, 19 Sep 2023 23:53:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <0957c21d-144b-1d84-2f79-f4cc6ba2a493@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [178.176.79.31]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 09/19/2023 20:33:28
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 179974 [Sep 19 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 534 534 808c2ea49f7195c68d40844e073217da4fa0d1e3
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.79.31 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: {rdns complete}
X-KSE-AntiSpam-Info: {fromrtbl complete}
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.79.31
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=none header.from=omp.ru;spf=none
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/19/2023 20:39:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/19/2023 4:23:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 9/11/23 3:53 PM, Mathias Nyman wrote:
[...]

>> If this driver enables the xHC clocks while resuming from sleep, it calls
>> clk_prepare_enable() without checking for errors and blithely goes on to
>> read/write the xHC's registers -- which, with the xHC not being clocked,
>> at least on ARM32 usually causes an imprecise external abort exceptions
>> which cause kernel oops.  Currently, the chips for which the driver does
>> the clock dance on suspend/resume seem to be the Broadcom STB SoCs, based
>> on ARM32 CPUs, as it seems...
>>
>> In order to fix this issue, add the result checks for clk_prepare_enable()
>> calls in xhci_plat_resume(), add conditional clk_disable_unprepare() calls
>> on the error path of xhci_plat_resume(); then factor out the common clock
>> disabling code from the suspend() and resume() driver PM methods into a
>> separate function to avoid code duplication.

> Minor nitpick, but not sure a separate function is helpful here.
> It's two lines of code called twice.

   Tried to save on the object code size...

>> Found by Linux Verification Center (linuxtesting.org) with the Svace static
>> analysis tool.
>>
>> Fixes: 8bd954c56197 ("usb: host: xhci-plat: suspend and resume clocks")
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> If I understood correctly this issue hasn't been seen in real life,

   Not yet?

> and this patch only changes how we fail?

   Yes, failing gracefully instead of a kernel oops...

> So I guess this would be more suitable for usb-next than usb-linus.

   Maybe. I'll recast and rebase...

[...]

> Thanks
> Mathias

MBR, Sergey

