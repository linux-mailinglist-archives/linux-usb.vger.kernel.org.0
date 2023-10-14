Return-Path: <linux-usb+bounces-1622-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 795197C94E0
	for <lists+linux-usb@lfdr.de>; Sat, 14 Oct 2023 16:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 097D32821EB
	for <lists+linux-usb@lfdr.de>; Sat, 14 Oct 2023 14:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D588312B75;
	Sat, 14 Oct 2023 14:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D436D1B
	for <linux-usb@vger.kernel.org>; Sat, 14 Oct 2023 14:39:43 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 10EC5CE
	for <linux-usb@vger.kernel.org>; Sat, 14 Oct 2023 07:39:40 -0700 (PDT)
Received: (qmail 76119 invoked by uid 1000); 14 Oct 2023 10:39:39 -0400
Date: Sat, 14 Oct 2023 10:39:39 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Zhang Shurong <zhang_shurong@foxmail.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
  linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: retimer: Check dev_set_name() return value
Message-ID: <a1781264-64c4-47dc-918f-61b171694e56@rowland.harvard.edu>
References: <tencent_A06A37B6A0C0643DEC1524501525866FAC09@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_A06A37B6A0C0643DEC1524501525866FAC09@qq.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, Oct 14, 2023 at 05:24:53PM +0800, Zhang Shurong wrote:
> It's possible that dev_set_name() returns -ENOMEM.
> We fix this by catching the error and handling it.
> 
> Fixes: ddaf8d96f93b ("usb: typec: Add support for retimers")
> Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
> ---
>  drivers/usb/typec/retimer.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/retimer.c b/drivers/usb/typec/retimer.c
> index 4a7d1b5c4d86..f163856a78cd 100644
> --- a/drivers/usb/typec/retimer.c
> +++ b/drivers/usb/typec/retimer.c
> @@ -122,8 +122,13 @@ typec_retimer_register(struct device *parent, const struct typec_retimer_desc *d
>  	retimer->dev.class = &retimer_class;
>  	retimer->dev.type = &typec_retimer_dev_type;
>  	retimer->dev.driver_data = desc->drvdata;
> -	dev_set_name(&retimer->dev, "%s-retimer",
> +	ret = dev_set_name(&retimer->dev, "%s-retimer",
>  		     desc->name ? desc->name : dev_name(parent));
> +	if (ret) {
> +		dev_err(parent, "failed to register retimer (%d)\n", ret);
> +		put_device(&retimer->dev);
> +		return ERR_PTR(ret);
> +	}
>  
>  	ret = device_add(&retimer->dev);
>  	if (ret) {

It should not be necessary to do this.  If dev_set_name() fails then 
device_add() will also fail.

Alan Stern

