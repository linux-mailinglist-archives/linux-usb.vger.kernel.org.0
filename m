Return-Path: <linux-usb+bounces-11054-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B53901BFC
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 09:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9BBF283596
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 07:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7BA3BBC9;
	Mon, 10 Jun 2024 07:38:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D2A22081
	for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2024 07:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718005123; cv=none; b=sJw1B3YTCddSCgvbdEHjlwhG7R9S2s15l6pOxnWamYyi+6fPVfXJ+EKUg6sOJYq1vIie27D0J3u4Wwm2IQhzwowYIxA7ldH55pnWrwYEzCOBnVOXc3pmynQ0Bfju3ClzSqlO1yefFsF6JXsbdmPj75dfcVTF33/tfBbbjkLIxW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718005123; c=relaxed/simple;
	bh=BnvrrDaLT73csok/qIHh9Iy8p34EInC+QOYILnz1Yso=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=GIjKwHH1LJ0ExxPp9C/oV0S8Ymu8MLPICmONNBiw+sKDeehiyWfRG9+6OO5pd0oetMml2tttMpw6fbXOusESLfKY1aGi8/hRF9CSMFNaZ92bX0G8tsI4Jv+LCeOhMI5hkZS/c6BdD4+Xcy6mFTzM7hceVPqtuPSSGdVgaAxX+CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (31.173.83.111) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 10 Jun
 2024 10:38:26 +0300
Subject: Re: [PATCH V2 1/1] usb: mos7840: Fix hangup after resume
To: Dmitry Smirnov <d.smirnov@inbox.lv>, <linux-usb@vger.kernel.org>
References: <20240609225850.3900-1-d.smirnov@inbox.lv>
 <20240609225850.3900-2-d.smirnov@inbox.lv>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <54defb93-f90d-5859-d481-34af13db65df@omp.ru>
Date: Mon, 10 Jun 2024 10:38:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240609225850.3900-2-d.smirnov@inbox.lv>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 06/10/2024 07:17:20
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 185825 [Jun 10 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 20 0.3.20
 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.83.111
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/10/2024 07:20:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 6/10/2024 4:39:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 6/10/24 1:58 AM, Dmitry Smirnov wrote:

   No description?

> Signed-off-by: Dmitry Smirnov <d.smirnov@inbox.lv>
> ---
> V1 -> V2: Addressed review comments

   I think this won't do, you need to be more detailed.

>  drivers/usb/serial/mos7840.c | 50 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
> index 8b0308d84270..30c5b09a4409 100644
> --- a/drivers/usb/serial/mos7840.c
> +++ b/drivers/usb/serial/mos7840.c
> @@ -1737,6 +1737,54 @@ static void mos7840_port_remove(struct usb_serial_port *port)
>  	kfree(mos7840_port);
>  }
>  
> +static int mos7840_suspend(struct usb_serial *serial, pm_message_t message)
> +{
> +	struct moschip_port *mos7840_port;
> +	struct usb_serial_port *port;
> +	int i;

   You need an empty line here...

> +	dev_dbg(&serial->interface->dev, "mos7840_suspend\n");
> +
[...]
> +static int mos7840_resume(struct usb_serial *serial)
> +{
> +	struct moschip_port *mos7840_port;
> +	struct usb_serial_port *port;
> +	int res;
> +	int i;

   And here...

> +	dev_dbg(&serial->interface->dev, "mos7840_resume\n");
> +
> +	for (i = 0; i < serial->num_ports; ++i) {
> +		port = serial->port[i];
> +		if (!tty_port_initialized(&port->port))
> +			continue;
> +
> +		mos7840_port = usb_get_serial_port_data(port);
> +
> +		if (port->bulk_in_size) {
> +			res = usb_submit_urb(mos7840_port->read_urb, GFP_NOIO);

   Contrariwise, the empty line here doesn't seem justified.

> +
> +			if (res) {
> +				usb_kill_urb(mos7840_port->read_urb);
> +				mos7840_port->read_urb_busy = false;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static struct usb_serial_driver moschip7840_4port_device = {
>  	.driver = {
>  		   .owner = THIS_MODULE,
[...]

MBR, Sergey

