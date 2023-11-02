Return-Path: <linux-usb+bounces-2450-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 029267DEE9B
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 10:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E67A1C20E63
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 09:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEED79C2;
	Thu,  2 Nov 2023 09:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989093C2B
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 09:06:00 +0000 (UTC)
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E31AF137;
	Thu,  2 Nov 2023 02:05:56 -0700 (PDT)
Received: from [192.168.1.103] (178.176.78.246) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 2 Nov
 2023 12:05:46 +0300
Subject: Re: [PATCH] usb: gadget: uvc_video: unlock before submitting a
 request to ep
To: Piyush Mehta <piyush.mehta@amd.com>, <laurent.pinchart@ideasonboard.com>,
	<dan.scally@ideasonboard.com>, <michal.simek@amd.com>,
	<gregkh@linuxfoundation.org>
CC: <siva.durga.prasad.paladugu@amd.com>, <radhey.shyam.pandey@amd.com>,
	<linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20231102071138.828126-1-piyush.mehta@amd.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <4661c898-2520-96b5-2f1c-8b013abd2a5c@omp.ru>
Date: Thu, 2 Nov 2023 12:05:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231102071138.828126-1-piyush.mehta@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [178.176.78.246]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.0.0, Database issued on: 11/02/2023 08:52:39
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 181066 [Nov 02 2023]
X-KSE-AntiSpam-Info: Version: 6.0.0.2
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.78.246 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.78.246
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/02/2023 08:56:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/2/2023 6:00:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

Hello!

On 11/2/23 10:11 AM, Piyush Mehta wrote:

> There could be chances where the usb_ep_queue() could fail and trigger
> complete() handler with error status. In this case, if usb_ep_queue()
> is called with lock held and the triggered complete() handler is waiting
> for the same lock to be cleared could result in a deadlock situation and
> could result in system hang. To aviod this scenerio, call usb_ep_queue()

   Scenario. :-)

> with lock removed. This patch does the same.

   The last sentence is hardly needed.

> Signed-off-by: Piyush Mehta <piyush.mehta@amd.com>
> ---
>  drivers/usb/gadget/function/uvc_video.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index 91af3b1ef0d4..0a5d9ac145e7 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -460,11 +460,12 @@ static void uvcg_video_pump(struct work_struct *work)
>  			req->no_interrupt = 1;
>  		}
>  
> -		/* Queue the USB request */
> -		ret = uvcg_video_ep_queue(video, req);
>  		spin_unlock_irqrestore(&queue->irqlock, flags);
>  
> +		/* Queue the USB request */
> +		ret = uvcg_video_ep_queue(video, req);
>  		if (ret < 0) {
> +			usb_ep_set_halt(video->ep);

   Hm, you don't say anything about this change in the patch
description...

[...]

MBR, Sergey

