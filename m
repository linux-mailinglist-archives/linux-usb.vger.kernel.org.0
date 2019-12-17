Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E98C4122C2B
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2019 13:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbfLQMq2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Dec 2019 07:46:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:48720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727621AbfLQMq2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Dec 2019 07:46:28 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2366024685;
        Tue, 17 Dec 2019 12:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576586785;
        bh=/gq2ENt0qurcVlUyxnvb9suA8Oq34sFd4ycuAWG0OYw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j8I3PCZJ3SBxmKHTk5I21xBg/zjO931JgqSvclKg/dys27/ayvnvyj9VRwtpI3RfW
         RC+9m+kZcpSc9UwqPOZrvDV2/Ao6o2w4ckwBk1pjRx+sUaN7vvwT0BsjnCG5fsY6bG
         8ovygytVqyQpjU06fqAsbjAT2T8vRsNozJjCCLr8=
Date:   Tue, 17 Dec 2019 13:46:23 +0100
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
        Oliver Neukum <oneukum@suse.com>,
        Christian Kellner <ckellner@redhat.com>,
        "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/9] thunderbolt: Populate PG field in hot plug
 acknowledgment packet
Message-ID: <20191217124623.GB3175457@kroah.com>
References: <20191217123345.31850-1-mika.westerberg@linux.intel.com>
 <20191217123345.31850-4-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217123345.31850-4-mika.westerberg@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 17, 2019 at 03:33:39PM +0300, Mika Westerberg wrote:
> USB4 1.0 section 6.4.2.7 specifies a new field (PG) in notification
> packet that is sent as response of hot plug/unplug events. This field
> tells whether the acknowledgment is for plug or unplug event. This needs
> to be set accordingly in order the router to send further hot plug
> notifications.
> 
> To make it simpler we fill the field unconditionally. Legacy devices do
> not look at this field so there should be no problems with them.
> 
> While there rename tb_cfg_error() to tb_cfg_ack_plug() and update the
> log message accordingly. The function is only used to ack plug/unplug
> events.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/thunderbolt/ctl.c     | 19 +++++++++++++------
>  drivers/thunderbolt/ctl.h     |  3 +--
>  drivers/thunderbolt/tb.c      |  3 +--
>  drivers/thunderbolt/tb_msgs.h |  6 +++++-
>  4 files changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
> index d97813e80e5f..f77ceae5c7d7 100644
> --- a/drivers/thunderbolt/ctl.c
> +++ b/drivers/thunderbolt/ctl.c
> @@ -708,19 +708,26 @@ void tb_ctl_stop(struct tb_ctl *ctl)
>  /* public interface, commands */
>  
>  /**
> - * tb_cfg_error() - send error packet
> + * tb_cfg_ack_plug() - Ack hot plug/unplug event
> + * @ctl: Control channel to use
> + * @route: Router that originated the event
> + * @port: Port where the hot plug/unplug happened
> + * @unplug: Ack hot plug or unplug
>   *
> - * Return: Returns 0 on success or an error code on failure.
> + * Call this as response for hot plug/unplug event to ack it.
> + * Returns %0 on success or an error code on failure.
>   */
> -int tb_cfg_error(struct tb_ctl *ctl, u64 route, u32 port,
> -		 enum tb_cfg_error error)
> +int tb_cfg_ack_plug(struct tb_ctl *ctl, u64 route, u32 port, bool unplug)
>  {
>  	struct cfg_error_pkg pkg = {
>  		.header = tb_cfg_make_header(route),
>  		.port = port,
> -		.error = error,
> +		.error = TB_CFG_ERROR_ACK_PLUG_EVENT,
> +		.pg = unplug ? TB_CFG_ERROR_PG_HOT_UNPLUG
> +			     : TB_CFG_ERROR_PG_HOT_PLUG,
>  	};
> -	tb_ctl_dbg(ctl, "resetting error on %llx:%x.\n", route, port);
> +	tb_ctl_dbg(ctl, "acking hot %splug event on %llx:%x\n",
> +		   unplug ? "un" : "", route, port);
>  	return tb_ctl_tx(ctl, &pkg, sizeof(pkg), TB_CFG_PKG_ERROR);
>  }
>  
> diff --git a/drivers/thunderbolt/ctl.h b/drivers/thunderbolt/ctl.h
> index 2f1a1e111110..97cb03b38953 100644
> --- a/drivers/thunderbolt/ctl.h
> +++ b/drivers/thunderbolt/ctl.h
> @@ -123,8 +123,7 @@ static inline struct tb_cfg_header tb_cfg_make_header(u64 route)
>  	return header;
>  }
>  
> -int tb_cfg_error(struct tb_ctl *ctl, u64 route, u32 port,
> -		 enum tb_cfg_error error);
> +int tb_cfg_ack_plug(struct tb_ctl *ctl, u64 route, u32 port, bool unplug);
>  struct tb_cfg_result tb_cfg_reset(struct tb_ctl *ctl, u64 route,
>  				  int timeout_msec);
>  struct tb_cfg_result tb_cfg_read_raw(struct tb_ctl *ctl, void *buffer,
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 54085f67810a..e54d0d89a32d 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -768,8 +768,7 @@ static void tb_handle_event(struct tb *tb, enum tb_cfg_pkg_type type,
>  
>  	route = tb_cfg_get_route(&pkg->header);
>  
> -	if (tb_cfg_error(tb->ctl, route, pkg->port,
> -			 TB_CFG_ERROR_ACK_PLUG_EVENT)) {
> +	if (tb_cfg_ack_plug(tb->ctl, route, pkg->port, pkg->unplug)) {
>  		tb_warn(tb, "could not ack plug event on %llx:%x\n", route,
>  			pkg->port);
>  	}
> diff --git a/drivers/thunderbolt/tb_msgs.h b/drivers/thunderbolt/tb_msgs.h
> index 3705057723b6..fc208c567953 100644
> --- a/drivers/thunderbolt/tb_msgs.h
> +++ b/drivers/thunderbolt/tb_msgs.h
> @@ -67,9 +67,13 @@ struct cfg_error_pkg {
>  	u32 zero1:4;
>  	u32 port:6;
>  	u32 zero2:2; /* Both should be zero, still they are different fields. */
> -	u32 zero3:16;
> +	u32 zero3:14;
> +	u32 pg:2;
>  } __packed;

Meta-comment, how does this work for endian issues?  gcc will "always"
pack these in the correct way such that they match up to the bits on the
wire?

thanks,

greg k-h
