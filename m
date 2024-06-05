Return-Path: <linux-usb+bounces-10862-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6F68FC89D
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 12:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A13AE287864
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 10:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C716118FDD8;
	Wed,  5 Jun 2024 10:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tyNLJ43v"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D42BE5A
	for <linux-usb@vger.kernel.org>; Wed,  5 Jun 2024 10:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717581939; cv=none; b=nZ0zVpyhl4aw+dTt+o3tdSFzzyPmyFqJ2yZ2eaaOewWotKdEOZpmfTogCPsxZkzJjt89/ahk5eBotukP/Je5nQ2rZrQ1m6Wyiq34d9zgjyibgZYwjHIQwzE2byN/MXqgH0FLh8QVKMb0jwCug/NKdWGc5rVKbJQKvq9XncB0ync=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717581939; c=relaxed/simple;
	bh=eSPJ6TaF7jNoTRcthAibyafY/Gm1lkLxIwnhrGec3TQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6RWh2cafultbPXG1yEniaUgHDMTn5fQOnwu815TERQSCu5FsvZyPRMulXk1gSkLWFFogTj8Ot+lzSW9ltCmM9mLSVwktz0baw51h1lf5082mFJ8GXgO+QkfNf55C9gIVlDzlD1YUQJpm4uhT3R3NG4pip5tBGsViDmGVawxu3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tyNLJ43v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF02C32781;
	Wed,  5 Jun 2024 10:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717581938;
	bh=eSPJ6TaF7jNoTRcthAibyafY/Gm1lkLxIwnhrGec3TQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tyNLJ43vlwAwpgfzOFVwTRJ5gOZ0IkMTxLzaFzN64SsQZNCjMR9Ix6knE5YBYKOn8
	 Ja67Pj4+btB5z2XCilBir9oJAbIFjGnzLT0kH+tiuAsr80aJVC6BV3TpAnMQhfEhh9
	 h+ITTQQYrLDKWpkqIcvscaSd7iSJKr7La+cxVcQs=
Date: Wed, 5 Jun 2024 10:41:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: sicong <congei42@163.com>
Cc: peter.chen@kernel.org, pawell@cadence.com, rogerq@kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: Re: [PATCH v1] usb: cdns3: cdns3-gadget: fix use-after-free bug
 in cdns3_gadget_exit due to race
Message-ID: <2024060546-dumpling-unripe-4283@gregkh>
References: <20240513021948.133039-1-congei42@163.com>
 <2024060444-delay-surgical-c8ff@gregkh>
 <6d94822a.2eaf.18fe6414d2a.Coremail.congei42@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d94822a.2eaf.18fe6414d2a.Coremail.congei42@163.com>

On Wed, Jun 05, 2024 at 10:36:30AM +0800, sicong wrote:
> 
> 
> At 2024-06-04 21:11:57, "Greg KH" <gregkh@linuxfoundation.org> wrote:
> >On Mon, May 13, 2024 at 10:19:48AM +0800, Sicong Huang wrote:
> >> This bug exists in drivers/usb/cdns3/cdns3-gadget.c. Function
> >> __cdns3_gadget_init will call cdns3_gadget_start to do futher jobs
> >> during the initialization proccess of cdns3 gadget. In cdns3_gadget_start,
> >> &priv_dev->pending_status_wq is bound with cdns3_pending_setup_status_handler.
> >> Then this work will be added to system_freezable_wq in cdns3_gadget_ep0_queue.
> >> Here is the code.
> >> queue_work(system_freezable_wq, &priv_dev->pending_status_wq);
> >> 
> >> If we call cdns3_gadget_exit to remove the device and make cleanup,
> >> there are some unfinished works. This function will call cdns3_free_all_eps to
> >> free all the endpoints. However, if cdns3_pending_setup_status_handler is
> >> scheduled to run after the free job, it will cause use-after-free error as
> >> cdns3_pending_setup_status_handler will use the endpoint in the following code.
> >> request->complete(&priv_dev->eps[0]->endpoint, request);
> >> 
> >> The possible execution flow that may lead to this issue is as follows:
> >> CPU0                    CPU1
> >>                       | __cdns3_gadget_init
> >>                       | cdns3_gadget_start
> >> cdns3_gadget_exit     |
> >> cdns3_free_all_eps    |
> >> devm_kfree (free)     |
> >>                       | cdns3_pending_setup_status_handler
> >>                       | &priv_dev->eps[0]->endpoint (use)
> >> 
> >> Fix it by cleaning the work in cdns3_gadget_exit.
> >> 
> >> Signed-off-by: Sicong Huang <congei42@163.com>
> >> ---
> >>  drivers/usb/cdns3/cdns3-gadget.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >> 
> >> diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
> >> index fd1beb10bba7..0f2e143bd17a 100644
> >> --- a/drivers/usb/cdns3/cdns3-gadget.c
> >> +++ b/drivers/usb/cdns3/cdns3-gadget.c
> >> @@ -3252,6 +3252,9 @@ static void cdns3_gadget_exit(struct cdns *cdns)
> >>  	pm_runtime_mark_last_busy(cdns->dev);
> >>  	pm_runtime_put_autosuspend(cdns->dev);
> >>  
> >> +	cancel_work_sync(&priv_dev->pending_status_wq);
> >> +	cancel_work_sync(&priv_dev->aligned_buf_wq);
> >> +
> >>  	usb_del_gadget(&priv_dev->gadget);
> >>  	devm_free_irq(cdns->dev, cdns->dev_irq, priv_dev);
> >>  
> >> -- 
> >> 2.34.1
> >
> >What commit id does this fix?
> >
> >thanks,
> >
> 
> >greg k-h
> 
> 
> I made the changes based on the following commit information.
> commit 51474ab44abf907023a8a875e799b07de461e466 (origin/usb-testing, origin/usb-next)

That is not what I meant, sorry.

I mean, "this is a bugfix, so what commit caused the problem that this
is fixing?"

thanks,

greg k-h

