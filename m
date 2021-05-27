Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 450BF39341F
	for <lists+linux-usb@lfdr.de>; Thu, 27 May 2021 18:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236425AbhE0Qjn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 May 2021 12:39:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:59652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234301AbhE0Qjn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 May 2021 12:39:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77A906103E;
        Thu, 27 May 2021 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1622133490;
        bh=vvNzxAIEG+4uJICqCeofDXiAarimtxF9FJNVXhh6BQU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hFsIiGejymRYK5zkNbdppwXfrFe0eFC7mKV80e8qR1hRFKedpqAQzwgB6T0fRqLVP
         gDUmsrQHqWQlU8XukMjR2N6pUKoVhlb9fVxHIYhLoit9bCjUjRW0BMZVsRFqYEZI9t
         lx9KKtI9uvX+MYdgqYW/RUEpP9n4TFHkoqoWY2K0=
Date:   Thu, 27 May 2021 18:38:07 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Piyush Thange <pthange19@gmail.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: thunderbolt: Fixed Coding Style issues
Message-ID: <YK/K78NOkRK6x+zT@kroah.com>
References: <20210527160456.28592-1-pthange19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527160456.28592-1-pthange19@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 27, 2021 at 09:34:56PM +0530, Piyush Thange wrote:
> Fixed coding style issues generated by checkpatch.pl with --strict option.
> 
> Signed-off-by: Piyush Thange <pthange19@gmail.com>
> ---
>  drivers/thunderbolt/switch.c | 43 ++++++++++++++++++++++--------------
>  1 file changed, 27 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index e73cd296db7e..921d25590560 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -148,8 +148,9 @@ static int nvm_validate_and_write(struct tb_switch *sw)
>  		if (sw->generation < 3) {
>  			/* Write CSS headers first */
>  			ret = dma_port_flash_write(sw->dma_port,
> -				DMA_PORT_CSS_ADDRESS, buf + NVM_CSS,
> -				DMA_PORT_CSS_MAX_SIZE);
> +						   DMA_PORT_CSS_ADDRESS,
> +						   buf + NVM_CSS,
> +						   DMA_PORT_CSS_MAX_SIZE);
>  			if (ret)
>  				return ret;
>  		}
> @@ -463,7 +464,7 @@ static const char *tb_port_type(struct tb_regs_port_header *port)
>  {
>  	switch (port->type >> 16) {
>  	case 0:
> -		switch ((u8) port->type) {
> +		switch ((u8)port->type) {
>  		case 0:
>  			return "Inactive";
>  		case 1:
> @@ -513,6 +514,7 @@ int tb_port_state(struct tb_port *port)
>  {
>  	struct tb_cap_phy phy;
>  	int res;
> +
>  	if (port->cap_phy == 0) {
>  		tb_port_WARN(port, "does not have a PHY\n");
>  		return -EINVAL;
> @@ -542,6 +544,7 @@ int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
>  {
>  	int retries = 10;
>  	int state;
> +
>  	if (!port->cap_phy) {
>  		tb_port_WARN(port, "does not have PHY\n");
>  		return -EINVAL;
> @@ -636,6 +639,7 @@ int tb_port_add_nfc_credits(struct tb_port *port, int credits)
>  int tb_port_clear_counter(struct tb_port *port, int counter)
>  {
>  	u32 zero[3] = { 0, 0, 0 };
> +
>  	tb_port_dbg(port, "clearing counter %d\n", counter);
>  	return tb_port_write(port, zero, TB_CFG_COUNTERS, 3 * counter, 3);
>  }
> @@ -748,7 +752,6 @@ static int tb_init_port(struct tb_port *port)
>  
>  	INIT_LIST_HEAD(&port->list);
>  	return 0;
> -
>  }
>  
>  static int tb_port_alloc_hopid(struct tb_port *port, bool in, int min_hopid,
> @@ -830,6 +833,7 @@ static inline bool tb_switch_is_reachable(const struct tb_switch *parent,
>  					  const struct tb_switch *sw)
>  {
>  	u64 mask = (1ULL << parent->config.depth * 8) - 1;
> +
>  	return (tb_route(parent) & mask) == (tb_route(sw) & mask);
>  }
>  
> @@ -1132,6 +1136,7 @@ bool tb_pci_port_is_enabled(struct tb_port *port)
>  int tb_pci_port_enable(struct tb_port *port, bool enable)
>  {
>  	u32 word = enable ? ADP_PCIE_CS_0_PE : 0x0;
> +
>  	if (!port->cap_adap)
>  		return -ENXIO;
>  	return tb_port_write(port, &word, TB_CFG_PORT,
> @@ -1241,7 +1246,7 @@ int tb_dp_port_enable(struct tb_port *port, bool enable)
>  	int ret;
>  
>  	ret = tb_port_read(port, data, TB_CFG_PORT,
> -			  port->cap_adap + ADP_DP_CS_0, ARRAY_SIZE(data));
> +			   port->cap_adap + ADP_DP_CS_0, ARRAY_SIZE(data));
>  	if (ret)
>  		return ret;
>  
> @@ -1282,9 +1287,9 @@ static void tb_dump_switch(const struct tb *tb, const struct tb_switch *sw)
>  	tb_dbg(tb, "  Max Port Number: %d\n", regs->max_port_number);
>  	tb_dbg(tb, "  Config:\n");
>  	tb_dbg(tb,
> -		"   Upstream Port Number: %d Depth: %d Route String: %#llx Enabled: %d, PlugEventsDelay: %dms\n",
> +	       "   Upstream Port Number: %d Depth: %d Route String: %#llx Enabled: %d, PlugEventsDelay: %dms\n",
>  	       regs->upstream_port_number, regs->depth,
> -	       (((u64) regs->route_hi) << 32) | regs->route_lo,
> +	       (((u64)regs->route_hi) << 32) | regs->route_lo,
>  	       regs->enabled, regs->plug_events_delay);
>  	tb_dbg(tb, "   unknown1: %#x unknown4: %#x\n",
>  	       regs->__unknown1, regs->__unknown4);
> @@ -1305,7 +1310,7 @@ int tb_switch_reset(struct tb_switch *sw)
>  
>  	tb_sw_dbg(sw, "resetting switch\n");
>  
> -	res.err = tb_sw_write(sw, ((u32 *) &sw->config) + 2,
> +	res.err = tb_sw_write(sw, ((u32 *)&sw->config) + 2,
>  			      TB_CFG_SWITCH, 2, 2);
>  	if (res.err)
>  		return res.err;
> @@ -1331,7 +1336,7 @@ static int tb_plug_events_active(struct tb_switch *sw, bool active)
>  		return 0;
>  
>  	sw->config.plug_events_delay = 0xff;
> -	res = tb_sw_write(sw, ((u32 *) &sw->config) + 4, TB_CFG_SWITCH, 4, 1);
> +	res = tb_sw_write(sw, ((u32 *)&sw->config) + 4, TB_CFG_SWITCH, 4, 1);
>  	if (res)
>  		return res;
>  
> @@ -1579,7 +1584,7 @@ static DEVICE_ATTR(rx_lanes, 0444, lanes_show, NULL);
>  static DEVICE_ATTR(tx_lanes, 0444, lanes_show, NULL);
>  
>  static ssize_t nvm_authenticate_show(struct device *dev,
> -	struct device_attribute *attr, char *buf)
> +				     struct device_attribute *attr, char *buf)
>  {
>  	struct tb_switch *sw = tb_to_switch(dev);
>  	u32 status;
> @@ -1646,9 +1651,12 @@ static ssize_t nvm_authenticate_sysfs(struct device *dev, const char *buf,
>  }
>  
>  static ssize_t nvm_authenticate_store(struct device *dev,
> -	struct device_attribute *attr, const char *buf, size_t count)
> +				      struct device_attribute *attr,
> +				      const char *buf,
> +				      size_t count)
>  {
>  	int ret = nvm_authenticate_sysfs(dev, buf, false);
> +
>  	if (ret)
>  		return ret;
>  	return count;
> @@ -1656,13 +1664,16 @@ static ssize_t nvm_authenticate_store(struct device *dev,
>  static DEVICE_ATTR_RW(nvm_authenticate);
>  
>  static ssize_t nvm_authenticate_on_disconnect_show(struct device *dev,
> -	struct device_attribute *attr, char *buf)
> +						   struct device_attribute *attr,
> +						   char *buf)
>  {
>  	return nvm_authenticate_show(dev, attr, buf);
>  }
>  
>  static ssize_t nvm_authenticate_on_disconnect_store(struct device *dev,
> -	struct device_attribute *attr, const char *buf, size_t count)
> +						    struct device_attribute *attr,
> +						    const char *buf,
> +						    size_t count)
>  {
>  	int ret;
>  
> @@ -1859,7 +1870,7 @@ static int tb_switch_uevent(struct device *dev, struct kobj_uevent_env *env)
>  		/* Device is hub if it has any downstream ports */
>  		tb_switch_for_each_port(sw, port) {
>  			if (!port->disabled && !tb_is_upstream_port(port) &&
> -			     tb_port_is_null(port)) {
> +			    tb_port_is_null(port)) {
>  				hub = true;
>  				break;
>  			}
> @@ -2032,7 +2043,7 @@ struct tb_switch *tb_switch_alloc(struct tb *tb, struct device *parent,
>  
>  	/* initialize ports */
>  	sw->ports = kcalloc(sw->config.max_port_number + 1, sizeof(*sw->ports),
> -				GFP_KERNEL);
> +			    GFP_KERNEL);
>  	if (!sw->ports) {
>  		ret = -ENOMEM;
>  		goto err_free_sw_ports;
> @@ -2754,7 +2765,7 @@ int tb_switch_resume(struct tb_switch *sw)
>  		}
>  		if (sw->uid != uid) {
>  			tb_sw_info(sw,
> -				"changed while suspended (uid %#llx -> %#llx)\n",
> +				   "changed while suspended (uid %#llx -> %#llx)\n",
>  				sw->uid, uid);
>  			return -ENODEV;
>  		}
> -- 
> 2.25.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
