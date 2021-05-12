Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAC9A37C29A
	for <lists+linux-usb@lfdr.de>; Wed, 12 May 2021 17:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbhELPMB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 May 2021 11:12:01 -0400
Received: from netrider.rowland.org ([192.131.102.5]:39553 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S233625AbhELPJ4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 May 2021 11:09:56 -0400
Received: (qmail 935639 invoked by uid 1000); 12 May 2021 11:08:47 -0400
Date:   Wed, 12 May 2021 11:08:47 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Zou Wei <zou_wei@huawei.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] USB: EHCI: ehci-mv: add missing MODULE_DEVICE_TABLE
Message-ID: <20210512150847.GB934575@rowland.harvard.edu>
References: <1620801369-18642-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620801369-18642-1-git-send-email-zou_wei@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 12, 2021 at 02:36:09PM +0800, Zou Wei wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  drivers/usb/host/ehci-mv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/host/ehci-mv.c b/drivers/usb/host/ehci-mv.c
> index cffdc8d..beb478c 100644
> --- a/drivers/usb/host/ehci-mv.c
> +++ b/drivers/usb/host/ehci-mv.c
> @@ -266,6 +266,7 @@ static const struct platform_device_id ehci_id_table[] = {
>  	{"pxa-sph", 0},
>  	{},
>  };
> +MODULE_DEVICE_TABLE(platform, ehci_id_table);
>  
>  static void mv_ehci_shutdown(struct platform_device *pdev)
>  {

This is a bit odd.  Nothing wrong with it, of course, but it leads one 
to wonder how the driver ever worked.  Maybe the platforms that can use 
it never build the driver as a loadable module.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
