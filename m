Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3C3F2211EE
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 18:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgGOQGi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 12:06:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:57116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726629AbgGOQGT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Jul 2020 12:06:19 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7B81A20663;
        Wed, 15 Jul 2020 16:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594829171;
        bh=0U/w4wlM1EbAgGCUCgAYjZwVu9aArQQ2mt31XrEY/v0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HLHL+gnLXvhAxW1elfauWtZxcujw3WNSMofJm4nwjB/BgF5FlVnT9ROO2dcuAHjI2
         T1jm6A9qZEdPIQn0IyFI7eYH7Ww8qRokpMYigaiIsU11/EwExC9SHWUNICZdY8wV5z
         Z/px2iNxbnwdys2ntZFnhvkucD34FwJczjK223/I=
Date:   Wed, 15 Jul 2020 18:06:06 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: Re: [PATCH] usb: xhci: add debugfs support for ep with stream
Message-ID: <20200715160606.GA761587@kroah.com>
References: <1594823729-8165-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594823729-8165-1-git-send-email-jun.li@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 15, 2020 at 10:35:29PM +0800, Li Jun wrote:
> To show the trb ring of streams, use the exsiting ring files of bulk ep
> to show trb ring of one specific stream ID, which stream ID's trb ring
> will be shown, is controlled by a new debugfs file stream_id, this is to
> avoid to create a large number of dir for every allocate stream IDs,
> another debugfs file stream_context_array is created to show all the
> allocated stream context array entries.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/host/xhci-debugfs.c | 117 +++++++++++++++++++++++++++++++++++++++-
>  drivers/usb/host/xhci-debugfs.h |  19 +++++++
>  drivers/usb/host/xhci-mem.c     |   4 +-
>  drivers/usb/host/xhci.c         |   4 ++
>  4 files changed, 142 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
> index 65d8de4..0e17c4b 100644
> --- a/drivers/usb/host/xhci-debugfs.c
> +++ b/drivers/usb/host/xhci-debugfs.c
> @@ -450,9 +450,10 @@ void xhci_debugfs_create_endpoint(struct xhci_hcd *xhci,
>  	if (!epriv)
>  		return;
>  
> +	epriv->show_ring = dev->eps[ep_index].ring;
>  	snprintf(epriv->name, sizeof(epriv->name), "ep%02d", ep_index);
>  	epriv->root = xhci_debugfs_create_ring_dir(xhci,
> -						   &dev->eps[ep_index].ring,
> +						   &epriv->show_ring,
>  						   epriv->name,
>  						   spriv->root);
>  	spriv->eps[ep_index] = epriv;
> @@ -474,6 +475,120 @@ void xhci_debugfs_remove_endpoint(struct xhci_hcd *xhci,
>  	kfree(epriv);
>  }
>  
> +static int xhci_stream_id_show(struct seq_file *s, void *unused)
> +{
> +	struct xhci_ep_priv	*epriv = s->private;
> +
> +	seq_printf(s, "Supported stream IDs are 1 ~ %d, trb ring to be shown is for stream id %d\n",
> +		   epriv->stream_info->num_streams - 1, epriv->stream_id);
> +
> +	return 0;
> +}
> +
> +static int xhci_stream_id_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, xhci_stream_id_show, inode->i_private);
> +}
> +
> +static ssize_t xhci_stream_id_write(struct file *file,  const char __user *ubuf,
> +			       size_t count, loff_t *ppos)
> +{
> +	struct seq_file         *s = file->private_data;
> +	struct xhci_ep_priv	*epriv = s->private;
> +	int			ret;
> +	u16			stream_id; /* MaxPStreams + 1 <= 16 */
> +
> +	/* Decimal number */
> +	ret = kstrtou16_from_user(ubuf, count, 10, &stream_id);
> +	if (ret)
> +		return ret;
> +
> +	if (stream_id == 0 || stream_id >= epriv->stream_info->num_streams)
> +		return -EINVAL;
> +
> +	epriv->stream_id = stream_id;
> +	epriv->show_ring = epriv->stream_info->stream_rings[stream_id];
> +
> +	return count;
> +}
> +
> +static const struct file_operations stream_id_fops = {
> +	.open			= xhci_stream_id_open,
> +	.write                  = xhci_stream_id_write,
> +	.read			= seq_read,
> +	.llseek			= seq_lseek,
> +	.release		= single_release,
> +};
> +
> +static int xhci_stream_context_array_show(struct seq_file *s, void *unused)
> +{
> +	struct xhci_ep_priv	*epriv = s->private;
> +	struct xhci_stream_ctx	*stream_ctx;
> +	dma_addr_t		dma;
> +	int			id;
> +
> +	seq_printf(s, "Allocated %d streams and %d stream context array entries\n",
> +			epriv->stream_info->num_streams,
> +			epriv->stream_info->num_stream_ctxs);
> +
> +	for (id = 0; id < epriv->stream_info->num_stream_ctxs; id++) {
> +		stream_ctx = epriv->stream_info->stream_ctx_array + id;
> +		dma = epriv->stream_info->ctx_array_dma + id * 16;
> +		if (id < epriv->stream_info->num_streams)
> +			seq_printf(s, "%pad stream id %d deq %016llx\n", &dma, id,
> +				   le64_to_cpu(stream_ctx->stream_ring));
> +		else
> +			seq_printf(s, "%pad stream context entry not used deq %016llx\n",
> +				   &dma, le64_to_cpu(stream_ctx->stream_ring));
> +	}
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(xhci_stream_context_array);
> +
> +void xhci_debugfs_create_stream_files(struct xhci_hcd *xhci,
> +				      struct xhci_virt_device *dev,
> +				      int ep_index)
> +{
> +	struct xhci_slot_priv	*spriv = dev->debugfs_private;
> +	struct xhci_ep_priv	*epriv;
> +
> +	if (!spriv || !spriv->eps[ep_index] ||
> +	    !dev->eps[ep_index].stream_info)
> +		return;
> +
> +	epriv = spriv->eps[ep_index];
> +	epriv->stream_info = dev->eps[ep_index].stream_info;
> +
> +	/* Show trb ring of stream ID 1 by default */
> +	epriv->stream_id = 1;
> +	epriv->show_ring = epriv->stream_info->stream_rings[1];
> +	epriv->stream_ctx_dentry = debugfs_create_file("stream_context_array",
> +					0444, epriv->root, epriv,
> +					&xhci_stream_context_array_fops);
> +
> +	epriv->stream_id_dentry = debugfs_create_file("stream_id", 0644,
> +					epriv->root, epriv,
> +					&stream_id_fops);

Do you really need to save these files off, or could you use
'debug_remove_recursive()' to remove them all when the device goes away?

> +}
> +
> +void xhci_debugfs_remove_stream_files(struct xhci_hcd *xhci,
> +				      struct xhci_virt_device *dev,
> +				      int ep_index)
> +{
> +	struct xhci_slot_priv	*spriv = dev->debugfs_private;
> +	struct xhci_ep_priv	*epriv;
> +
> +	if (!spriv || !spriv->eps[ep_index] ||
> +	    !dev->eps[ep_index].stream_info)
> +		return;
> +
> +	epriv = spriv->eps[ep_index];
> +	epriv->show_ring = dev->eps[ep_index].ring;
> +	debugfs_remove(epriv->stream_ctx_dentry);
> +	debugfs_remove(epriv->stream_id_dentry);
> +}
> +
>  void xhci_debugfs_create_slot(struct xhci_hcd *xhci, int slot_id)
>  {
>  	struct xhci_slot_priv	*priv;
> diff --git a/drivers/usb/host/xhci-debugfs.h b/drivers/usb/host/xhci-debugfs.h
> index f7a4e24..d4d0af0 100644
> --- a/drivers/usb/host/xhci-debugfs.h
> +++ b/drivers/usb/host/xhci-debugfs.h
> @@ -91,6 +91,11 @@ struct xhci_file_map {
>  struct xhci_ep_priv {
>  	char			name[DEBUGFS_NAMELEN];
>  	struct dentry		*root;
> +	struct dentry		*stream_ctx_dentry;
> +	struct dentry		*stream_id_dentry;

As I say above, are you sure you need to save these files?

thanks,

greg k-h
