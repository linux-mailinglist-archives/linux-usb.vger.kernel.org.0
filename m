Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66684C340A
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 14:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733252AbfJAMSH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 08:18:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:59964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726225AbfJAMSH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 08:18:07 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5AFA020700;
        Tue,  1 Oct 2019 12:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569932287;
        bh=akG8HWYNrQ69tUKDZrHkbinbYhNjgAXt0EipnRAWRXQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vECUHJTogwpvj1OREzieY+fsP3MWPGo+oZI56mprgYkwJPOqeGqjYmhb+gtARJGgM
         zuevxbUIGthX4+BSUx4TW7p5wmGl8qCJfglDV2bxbK9QFHhREWKXgiVOCjro1+Hcm4
         ETbLQafGSfri9fQm60n8gqQp8Y8jENruARBWFtAs=
Date:   Tue, 1 Oct 2019 14:18:04 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
        Lukas Wunner <lukas@wunner.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mario.Limonciello@dell.com,
        Anthony Wong <anthony.wong@canonical.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 03/22] thunderbolt: Log warning if adding switch fails
Message-ID: <20191001121804.GC2951658@kroah.com>
References: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
 <20191001113830.13028-4-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001113830.13028-4-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 01, 2019 at 02:38:11PM +0300, Mika Westerberg wrote:
> If we fail to add a switch for some reason log a warning with the error
> code. This is useful for debugging.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/thunderbolt/tb.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 1f7a9e1cc09c..541295be9bfc 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -143,6 +143,7 @@ static void tb_scan_port(struct tb_port *port)
>  	struct tb_cm *tcm = tb_priv(port->sw->tb);
>  	struct tb_port *upstream_port;
>  	struct tb_switch *sw;
> +	int ret;
>  
>  	if (tb_is_upstream_port(port))
>  		return;
> @@ -203,7 +204,9 @@ static void tb_scan_port(struct tb_port *port)
>  	if (!tcm->hotplug_active)
>  		dev_set_uevent_suppress(&sw->dev, true);
>  
> -	if (tb_switch_add(sw)) {
> +	ret = tb_switch_add(sw);
> +	if (ret) {
> +		dev_warn(&sw->dev, "failed to register switch: %d\n", ret);

Shouldn't tb_switch_add() do the error reporting instead?  That way it
makes it easier to call functions and not always have to print failure
messages :)

thanks,

greg k-h
