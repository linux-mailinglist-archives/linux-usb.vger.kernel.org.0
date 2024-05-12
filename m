Return-Path: <linux-usb+bounces-10242-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A89578C3685
	for <lists+linux-usb@lfdr.de>; Sun, 12 May 2024 14:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9E421C21161
	for <lists+linux-usb@lfdr.de>; Sun, 12 May 2024 12:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469CE20B33;
	Sun, 12 May 2024 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UZC+Zcgu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B175F22F11
	for <linux-usb@vger.kernel.org>; Sun, 12 May 2024 12:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715516975; cv=none; b=MsL25KNarKBFTFv9wJHabVhzH0Mc97fiX1h7jYVAfrGth6thILiqsG6nBb1EaOrRwZ1nqSGK/MS9KHpz7kKddNAlhUSm2PsciTsFfJlcYe7jSFETB+OqH8p/wQ6QtHS/ZN0CBwJPoCie5RyFio/BjBcpqL90UIU83SPuw8veGXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715516975; c=relaxed/simple;
	bh=6rp9tIiJUJ6ATs+ea9+T9RqkNLeclYaeP6YLET5ZzKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBnPypK6GZZc/OaMTERwkOGBeTKNdcSYqmdB7xSLPLSk35RRsfO7EqNuBPws+Zp8B2c6b1oRiM2eLrBlSIE6GzH8zlhjwNtexTK9YJVHvsbwujZGXtCNq8zA3WM0NSUpCMs0/6wiskAVzad5pfDlUps/PGkRY6Nj+VvtMf5QhoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UZC+Zcgu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B95C116B1;
	Sun, 12 May 2024 12:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1715516975;
	bh=6rp9tIiJUJ6ATs+ea9+T9RqkNLeclYaeP6YLET5ZzKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UZC+ZcguPGGuH3rb5c8V7f+WMCn+bcEJJvrrhcCIz6TjPbMaedxTw5FmifsWmPMQa
	 TDSLdlg8gJaLSbbDCh6qTXCtmkDs8oS3zvLqX+W757QyjKwvW7H9Y1hoInhdpLZzFY
	 jEshpFQqkffNGQl6rkC6OoCiKbItlu4bPh7v6HBs=
Date: Sun, 12 May 2024 13:29:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: sicong <congei42@163.com>
Cc: peter.chen@kernel.org, pawell@cadence.com, rogerq@kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: Bug report: usb: cdns3: cdns3-gadget.c: use-after-free bug in
 cdns3_gadget_exit due to race condition
Message-ID: <2024051207-grandson-desktop-85ea@gregkh>
References: <7f5719b.8700.18f67b324d3.Coremail.congei42@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f5719b.8700.18f67b324d3.Coremail.congei42@163.com>

On Sat, May 11, 2024 at 08:49:04PM +0800, sicong wrote:
> 
> 
> usb: cdns3: cdns3-gadget.c: use-after-free bug in cdns3_gadget_exit due to      
> race condition                                                                  
>                                                                                 
> This bug exists in drivers/usb/cdns3/cdns3-gadget.c. Function                   
> __cdns3_gadget_init will call cdns3_gadget_start to do the futher jobs          
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
>                                                                                 
> This bug may be fixed by adding the following code in cdns3_gadget_exit.        
> cancel_work_sync(&priv_dev->pending_status_wq);                                 
> cancel_work_sync(&priv_dev->aligned_buf_wq);                                    

Can you please provide a patch for this so we can apply it and give you
the credit for fixing the issue?

thanks,

greg k-h

