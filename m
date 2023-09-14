Return-Path: <linux-usb+bounces-45-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 692E67A0142
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 12:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0D3B1F227C4
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 10:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A37A1D53D;
	Thu, 14 Sep 2023 10:06:22 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13201D523
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 10:06:21 +0000 (UTC)
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799F41BE3;
	Thu, 14 Sep 2023 03:06:20 -0700 (PDT)
Received: from [192.168.1.103] (178.176.78.252) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Thu, 14 Sep
 2023 13:06:15 +0300
Subject: Re: [PATCH] usb: musb: Get the musb_qh poniter after musb_giveback
To: Xingxing Luo <xingxing.luo@unisoc.com>, <b-liu@ti.com>,
	<gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<xingxing0070.luo@gmail.com>, <Zhiyong.Liu@unisoc.com>,
	<Cixi.Geng1@unisoc.com>, <Orson.Zhai@unisoc.com>, <zhang.lyra@gmail.com>
References: <20230914015656.20856-1-xingxing.luo@unisoc.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <8365ba2a-8ecd-d055-e962-3a7f2bfdbfb0@omp.ru>
Date: Thu, 14 Sep 2023 13:06:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230914015656.20856-1-xingxing.luo@unisoc.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [178.176.78.252]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 09/14/2023 09:39:25
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 179856 [Sep 14 2023]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 530 530 ecb1547b3f72d1df4c71c0b60e67ba6b4aea5432
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.78.252 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.78.252 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: {rdns complete}
X-KSE-AntiSpam-Info: {fromrtbl complete}
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.78.252
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=none header.from=omp.ru;spf=none
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/14/2023 09:47:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/14/2023 9:01:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

Hello!

On 9/14/23 4:56 AM, Xingxing Luo wrote:

> When multiple threads are performing USB transmission, musb->lock will be
> unlocked when musb_giveback is executed. At this time, qh may be released
> in the dequeue process in other threads, resulting in a wild pointer, so
> it needs to be here get qh again, and judge whether qh is NULL, and when
> dequeue, you need to set qh to NULL.
> 
> Fixes: dbac5d07d13e ("usb: musb: host: don't start next rx urb if current one failed")
> Signed-off-by: Xingxing Luo <xingxing.luo@unisoc.com>
> ---
>  drivers/usb/musb/musb_host.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
> index a02c29216955..9df27db5847a 100644
> --- a/drivers/usb/musb/musb_host.c
> +++ b/drivers/usb/musb/musb_host.c
> @@ -321,10 +321,16 @@ static void musb_advance_schedule(struct musb *musb, struct urb *urb,
>  	musb_giveback(musb, urb, status);
>  	qh->is_ready = ready;
>  
> +	/*
> +	 * musb->lock had been unlocked in musb_giveback, so somtimes qh

   Sometimes?

> +	 * may freed, need get it again
> +	 */
> +	qh = musb_ep_get_qh(hw_ep, is_in);
> +
>  	/* reclaim resources (and bandwidth) ASAP; deschedule it, and
>  	 * invalidate qh as soon as list_empty(&hep->urb_list)
>  	 */
> -	if (list_empty(&qh->hep->urb_list)) {
> +	if (qh != NULL && list_empty(&qh->hep->urb_list)) {

   Just qh, perhaps?

[...]

MBR, Sergey

