Return-Path: <linux-usb+bounces-10827-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ACF8FB3F5
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2024 15:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D35DF1C2246F
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2024 13:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A5B146D62;
	Tue,  4 Jun 2024 13:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Oru/zOht"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC20148FE4
	for <linux-usb@vger.kernel.org>; Tue,  4 Jun 2024 13:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717508248; cv=none; b=fBtMNWMolKRIidrO5g7vSnAjQwwFejxVdWmY3FNzkN2c3CDNq96eVenIU7HO77Ds++CB9TfFdjXSkzFSf9Gp+TM+rHQptfcun2EQHH0q2QIpEGDst07Zhx0/fQ/vV+SvKWSNeqdcxge2t75B5p2g9SVoLbxcbL584x0mfzYHcG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717508248; c=relaxed/simple;
	bh=edQBIsjxm6J5uVwsORM0oXB2O4Ki/nQVWLLBOpmW/Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTWQJQn3W0QsYnetFsR4V4iESQJkxvC4KfWHCJl1mOs0Bxap1k8m/BrkmTzAX9E88FYWa4n/ZdOO82G+K3YOeLODJ34uZDxO8P8DVzCcNEQ6M2yFjbKDuKOthJnO/vC5QDdRuJoMaQOgUhTrfRvEnbuprfv50+2fU0yH5TnOo8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Oru/zOht; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230C4C3277B;
	Tue,  4 Jun 2024 13:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717508247;
	bh=edQBIsjxm6J5uVwsORM0oXB2O4Ki/nQVWLLBOpmW/Zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oru/zOhtaSoD8zSuXoz360O/SrCBZADQMWMlNfypvoBv3dyJx0KyDEChChi/6w3uU
	 zj2rJ2IM5yIsbmDo7uS+acosDBit8HuaIRJ/M72VBQKrfAvqx6dM/abz3NfBp1M5U3
	 6bO07lrFHGugy/Hp4d8a7aw0fxQ3XL3bXB68z4xw=
Date: Tue, 4 Jun 2024 15:11:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sicong Huang <congei42@163.com>
Cc: peter.chen@kernel.org, pawell@cadence.com, rogerq@kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v1] usb: cdns3: cdns3-gadget: fix use-after-free bug in
 cdns3_gadget_exit due to race
Message-ID: <2024060444-delay-surgical-c8ff@gregkh>
References: <20240513021948.133039-1-congei42@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513021948.133039-1-congei42@163.com>

On Mon, May 13, 2024 at 10:19:48AM +0800, Sicong Huang wrote:
> This bug exists in drivers/usb/cdns3/cdns3-gadget.c. Function
> __cdns3_gadget_init will call cdns3_gadget_start to do futher jobs
> during the initialization proccess of cdns3 gadget. In cdns3_gadget_start,
> &priv_dev->pending_status_wq is bound with cdns3_pending_setup_status_handler.
> Then this work will be added to system_freezable_wq in cdns3_gadget_ep0_queue.
> Here is the code.
> queue_work(system_freezable_wq, &priv_dev->pending_status_wq);
> 
> If we call cdns3_gadget_exit to remove the device and make cleanup,
> there are some unfinished works. This function will call cdns3_free_all_eps to
> free all the endpoints. However, if cdns3_pending_setup_status_handler is
> scheduled to run after the free job, it will cause use-after-free error as
> cdns3_pending_setup_status_handler will use the endpoint in the following code.
> request->complete(&priv_dev->eps[0]->endpoint, request);
> 
> The possible execution flow that may lead to this issue is as follows:
> CPU0                    CPU1
>                       | __cdns3_gadget_init
>                       | cdns3_gadget_start
> cdns3_gadget_exit     |
> cdns3_free_all_eps    |
> devm_kfree (free)     |
>                       | cdns3_pending_setup_status_handler
>                       | &priv_dev->eps[0]->endpoint (use)
> 
> Fix it by cleaning the work in cdns3_gadget_exit.
> 
> Signed-off-by: Sicong Huang <congei42@163.com>
> ---
>  drivers/usb/cdns3/cdns3-gadget.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
> index fd1beb10bba7..0f2e143bd17a 100644
> --- a/drivers/usb/cdns3/cdns3-gadget.c
> +++ b/drivers/usb/cdns3/cdns3-gadget.c
> @@ -3252,6 +3252,9 @@ static void cdns3_gadget_exit(struct cdns *cdns)
>  	pm_runtime_mark_last_busy(cdns->dev);
>  	pm_runtime_put_autosuspend(cdns->dev);
>  
> +	cancel_work_sync(&priv_dev->pending_status_wq);
> +	cancel_work_sync(&priv_dev->aligned_buf_wq);
> +
>  	usb_del_gadget(&priv_dev->gadget);
>  	devm_free_irq(cdns->dev, cdns->dev_irq, priv_dev);
>  
> -- 
> 2.34.1

What commit id does this fix?

thanks,

greg k-h

