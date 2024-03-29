Return-Path: <linux-usb+bounces-8662-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A85D892185
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 17:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA1C6288D87
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 16:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5222033E;
	Fri, 29 Mar 2024 16:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UZDwbE7I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE8985623
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 16:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711729274; cv=none; b=pI5M9Os5X0tB7STQ6zmUsLguIHqHz3k2INFQpgpmzcnyxRtL22/t3XiyF9J6qF/bdhccvWwQY9kmFqoq8ZnlQH6+fPXQIRqTPfl0GZhOVw5P7QZ1W/jbcwwKqatcTmtvPrW6P2g/ebH84/Vbl5S8GBqk6qYqDie4YBZV2LATzrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711729274; c=relaxed/simple;
	bh=dcSFld6UCTdTL/5vjYeiOxLyFOuvbsJONzbcmxgsYaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyZkvayJim9ZTplnFnuWUu60C7elRUlteYc1xYmdOh8IaLHAIuZL+8lC/euCstLdw9pYsYSY86y7MQOOKVR4tFQ39eycnS54e/cuqg5QM5kCUThYRQ/aZF2fzTz4dnFxOyhRv5gIxcZTf7paSCgMdBX/JjaekA6XFkAQVGLaWjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UZDwbE7I; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-515d55ab035so78012e87.2
        for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 09:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711729270; x=1712334070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9TdQntOQdC+RwwerKG1DtWz7PRsJo1psWkBJYy0GaAE=;
        b=UZDwbE7IKUwpGHw3U6rPNsQqmHtlWTUNVhqRUcwhfvaiDlwGT0wny7injIO+/yG7ik
         6uWUm5hv3giwQ1E4ivlYo+kYGF98vAuYLSVEi9J6jmlTz1FNnWpgm4fig3yu9NAQIYJU
         U6b3mXrrRqkGF1jaF68YNpmi21j5PdwDAkoTabD4r0mYIXH3WH6ICJvJ0MqYp+riq3OV
         PoNLx2ZeK8Z0zOKmO737xFQMPzoaY9eptTVo02YaiXQBwQXN0D8MxVSZAEctSt6R/qnk
         pBSYHy/wmyxBi7X3iZveMkVL9l8NhMQ4CbqQFoHDDJcOs9ERux48pIhbwXGJG2IUEtIh
         opTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711729270; x=1712334070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TdQntOQdC+RwwerKG1DtWz7PRsJo1psWkBJYy0GaAE=;
        b=dtXN8tdYdkZvN4eiR+TZ3a1xi4cOyYrV5yYYXi4ljhsCC+dJvZadjbitN9tlBad2Fq
         V7HLayR9V2qx3rkVpYtpIwVgnzzfozb0dR5oGAi7JEpwpRcbZADZK6DsgwYPQKq+949q
         5yH0nI6UtcN8DLiP9R8FqiiROANmf0ieF6wwDRoR1gAmOGA8dxMf8rDtx3Sk+MyEmL/I
         EsH+HqGVNGbgooyBS1Gtz36nQdddiikLgr7gE88CcZeGTl8lsS8/BM+dBBDuzStXX28Y
         xvDRCAqPKi3di47RZ0/dhUG8hfTZHpHklas0wNQnKTI3V8RGGdid2k+2/8Ipe8qT83vG
         FnYw==
X-Forwarded-Encrypted: i=1; AJvYcCVXqUC4a7wGrUPqoE4207hhlnxgHz7mRn1iL/VJByahK0SStTTZZmnayzFJX8hhzj/AQfM0xJyWIJWferQjy/sb+Iv5l9me6JsQ
X-Gm-Message-State: AOJu0Yz1rlBY7lCcqhrnzX1OG4s5b/kUu7ANhQDeTnTRqMz6S35cT6hl
	V/vAKTMf9eylxtv8rz7iSBzvGC9u1VnCpAWzFp6FPEQ0GMdZGBAk6Vd38wRU2Ac=
X-Google-Smtp-Source: AGHT+IGYcvpSz7jI5yxeagCBVOiO2Xfh0dOk6NVOG3vgeY7eKDGqNcF+bUdJzGLSflCAfgeQkL2bjw==
X-Received: by 2002:a19:2d4c:0:b0:513:ed0f:36c9 with SMTP id t12-20020a192d4c000000b00513ed0f36c9mr2085718lft.45.1711729270454;
        Fri, 29 Mar 2024 09:21:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
        by smtp.gmail.com with ESMTPSA id z10-20020ac25dea000000b00515d4457ff9sm87172lfq.89.2024.03.29.09.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 09:21:10 -0700 (PDT)
Date: Fri, 29 Mar 2024 18:21:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: linux-kernel@vger.kernel.org,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Prashant Malani <pmalani@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>,
	linux-usb@vger.kernel.org, Kenneth Crudup <kenny@panix.com>
Subject: Re: [PATCH 2/5] usb: typec: ucsi: Check for notifications after init
Message-ID: <ZgbqdBd1OiWgDN-_@eriador.lumag.spb.ru>
References: <20240320073927.1641788-1-lk@c--e.de>
 <20240320073927.1641788-3-lk@c--e.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240320073927.1641788-3-lk@c--e.de>

On Wed, Mar 20, 2024 at 08:39:23AM +0100, Christian A. Ehrhardt wrote:
> The completion notification for the final SET_NOTIFICATION_ENABLE
> command during initialization can include a connector change
> notification.  However, at the time this completion notification is
> processed, the ucsi struct is not ready to handle this notification.
> As a result the notification is ignored and the controller
> never sends an interrupt again.
> 
> Re-check CCI for a pending connector state change after
> initialization is complete. Adjust the corresponding debug
> message accordingly.
> 
> Fixes: 71a1fa0df2a3 ("usb: typec: ucsi: Store the notification mask")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 8a6645ffd938..dceeed207569 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1237,7 +1237,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num)
>  	struct ucsi_connector *con = &ucsi->connector[num - 1];
>  
>  	if (!(ucsi->ntfy & UCSI_ENABLE_NTFY_CONNECTOR_CHANGE)) {
> -		dev_dbg(ucsi->dev, "Bogus connector change event\n");
> +		dev_dbg(ucsi->dev, "Early connector change event\n");
>  		return;
>  	}
>  
> @@ -1636,6 +1636,7 @@ static int ucsi_init(struct ucsi *ucsi)
>  {
>  	struct ucsi_connector *con, *connector;
>  	u64 command, ntfy;
> +	u32 cci;
>  	int ret;
>  	int i;
>  
> @@ -1688,6 +1689,13 @@ static int ucsi_init(struct ucsi *ucsi)
>  
>  	ucsi->connector = connector;
>  	ucsi->ntfy = ntfy;
> +
> +	ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
> +	if (ret)
> +		return ret;
> +	if (UCSI_CCI_CONNECTOR(READ_ONCE(cci)))
> +		ucsi_connector_change(ucsi, cci);
> +

I think this leaves place for the race. With this patchset + "Ack
connector change early" in place Neil triggered the following backtrace
on sm8550 HDK while testing my UCSI-qcom-fixes patchset:
What happens:

[   10.421640] write: 00000000: 05 00 e7 db 00 00 00 00

SET_NOTIFICATION_ENABLE

[   10.432359] read: 00000000: 10 01 00 00 00 00 00 80 00 00 00 00 00 00 00 00
[   10.469553] read: 00000010: 04 58 29 20 00 00 00 00 00 00 00 00 00 03 30 01
[   10.476783] read: 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   10.489552] notify: 00000000: 00 00 00 80

COMMAND_COMPLETE

[   10.494194] read: 00000000: 10 01 00 00 00 00 00 80 00 00 00 00 00 00 00 00
[   10.501370] read: 00000010: 04 58 29 20 00 00 00 00 00 00 00 00 00 03 30 01
[   10.508578] read: 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   10.515757] write: 00000000: 04 00 02 00 00 00 00 00

ACK_CC_CI(command completed)

[   10.521100] read: 00000000: 10 01 00 00 00 00 00 20 00 00 00 00 00 00 00 00
[   10.528363] read: 00000010: 04 58 29 20 00 00 00 00 00 00 00 00 00 03 30 01
[   10.535603] read: 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   10.549549] notify: 00000000: 00 00 00 20

ACK_COMPLETE

[Here ucsi->connector and ucsi->ntfy are being set by ucsi_init()

[   10.566654] read: 00000010: 04 58 29 20 00 00 00 00 00 00 00 00 00 03 30 01
[   10.593553] notify: 00000000: 02 00 00 20

Event with CONNECTION_CHANGE. It also schedules connector_change work,
because ucsi->ntfy is already set

[   10.595796] read: 00000000: 10 01 00 00 02 00 00 20 00 00 00 00 00 00 00 00
[   10.595798] read: 00000010: 04 58 29 20 00 00 00 00 00 00 00 00 00 03 30 01
[   10.595799] read: 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

The CCI read coming from ucsi_init()

[   10.595807] ------------[ cut here ]------------
[   10.595808] WARNING: CPU: 6 PID: 101 at kernel/workqueue.c:2384 __queue_work+0x374/0x474

[skipped the register dump]

[   10.595953]  __queue_work+0x374/0x474
[   10.595956]  queue_work_on+0x68/0x84
[   10.595959]  ucsi_connector_change+0x54/0x88 [typec_ucsi]
[   10.595963]  ucsi_init_work+0x834/0x85c [typec_ucsi]
[   10.595968]  process_one_work+0x148/0x29c
[   10.595971]  worker_thread+0x2fc/0x40c
[   10.595974]  kthread+0x110/0x114
[   10.595978]  ret_from_fork+0x10/0x20
[   10.595985] ---[ end trace 0000000000000000 ]---

Warning, because the work is already scheduled.


>  	return 0;
>  
>  err_unregister:
> -- 
> 2.40.1
> 

