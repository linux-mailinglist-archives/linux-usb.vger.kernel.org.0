Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 015852465A1
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 13:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgHQLpF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 07:45:05 -0400
Received: from mga02.intel.com ([134.134.136.20]:57328 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726171AbgHQLov (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 07:44:51 -0400
IronPort-SDR: gZlf1n9GN4fBm57k9N4iwH5CiSyeIdafHyMQWYmEpGkpz/gQfNrVZz+19G5sJ9ObSWvt/xPA/X
 ARl/+s327Wzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9715"; a="142510513"
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="142510513"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 04:44:49 -0700
IronPort-SDR: NLeqX67fBFSh7gk+6rAwWr6UaKzSTmn3sBJcUFsJHEsh9OTnmEa2k/VKb7y3AJXaWd8e0bjkXB
 L30TIyyHnjqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; 
   d="scan'208";a="328592971"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2020 04:44:47 -0700
Subject: Re: [PATCH v2] usb: xhci: add debugfs support for ep with stream
To:     Jun Li <jun.li@nxp.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
References: <1594901321-6992-1-git-send-email-jun.li@nxp.com>
 <DB8PR04MB6523AC8B5B7C1DEDA1254F0A89430@DB8PR04MB6523.eurprd04.prod.outlook.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <c6c4f598-ff8a-8b51-d87c-c5d20f4421a4@linux.intel.com>
Date:   Mon, 17 Aug 2020 14:48:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <DB8PR04MB6523AC8B5B7C1DEDA1254F0A89430@DB8PR04MB6523.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13.8.2020 12.57, Jun Li wrote:
> Hi
> 
>> -----Original Message-----
>> From: Jun Li <jun.li@nxp.com>
>> Sent: Thursday, July 16, 2020 8:40 PM
>> To: mathias.nyman@intel.com
>> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; dl-linux-imx
>> <linux-imx@nxp.com>
>> Subject: [PATCH v2] usb: xhci: add debugfs support for ep with stream
>>
>> To show the trb ring of streams, use the exsiting ring files of bulk ep to show
>> trb ring of one specific stream ID, which stream ID's trb ring will be shown, is
>> controlled by a new debugfs file stream_id, this is to avoid to create a large number
>> of dir for every allocate stream IDs, another debugfs file stream_context_array
>> is created to show all the allocated stream context array entries.
>>
>> Signed-off-by: Li Jun <jun.li@nxp.com>
>> ---
>> chanages for v2:
>> -  Drop stream files remove, the stream files will be removed
>>    with ep dir removal, keep the ep but only remove streams
>>    actually does not make sense in current code.
>> -  Use the new_ring for show_ring pointer for non-zero ep.
>>
>>  drivers/usb/host/xhci-debugfs.c | 112 +++++++++++++++++++++++++++++++++++++++-
>>  drivers/usb/host/xhci-debugfs.h |  10 ++++
>>  drivers/usb/host/xhci.c         |   1 +
>>  3 files changed, 122 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
>> index 65d8de4..708585c 100644
>> --- a/drivers/usb/host/xhci-debugfs.c
>> +++ b/drivers/usb/host/xhci-debugfs.c
>> @@ -450,9 +450,14 @@ void xhci_debugfs_create_endpoint(struct xhci_hcd *xhci,
>>  	if (!epriv)
>>  		return;
>>
>> +	if (dev->eps[ep_index].ring)
>> +		epriv->show_ring = dev->eps[ep_index].ring;
>> +	else
>> +		epriv->show_ring = dev->eps[ep_index].new_ring;
>> +
>>  	snprintf(epriv->name, sizeof(epriv->name), "ep%02d", ep_index);
>>  	epriv->root = xhci_debugfs_create_ring_dir(xhci,
>> -						   &dev->eps[ep_index].ring,
>> +						   &epriv->show_ring,
>>  						   epriv->name,
>>  						   spriv->root);
>>  	spriv->eps[ep_index] = epriv;
>> @@ -474,6 +479,111 @@ void xhci_debugfs_remove_endpoint(struct xhci_hcd *xhci,
>>  	kfree(epriv);
>>  }
>>
>> +static int xhci_stream_id_show(struct seq_file *s, void *unused) {
>> +	struct xhci_ep_priv	*epriv = s->private;
>> +
>> +	if (!epriv->stream_info)
>> +		return -EPERM;
>> +
>> +	seq_printf(s, "Supported stream IDs are 1 ~ %d, trb ring to be shown is for
>> stream id %d\n",

Minor change, but maybe something shorter like:
"Show stream ID %d trb ring, supported [1 - %d]

>> +		   epriv->stream_info->num_streams - 1, epriv->stream_id);
>> +
>> +	return 0;
>> +}
>> +
>> +static int xhci_stream_id_open(struct inode *inode, struct file *file)
>> +{
>> +	return single_open(file, xhci_stream_id_show, inode->i_private); }
>> +
>> +static ssize_t xhci_stream_id_write(struct file *file,  const char __user *ubuf,
>> +			       size_t count, loff_t *ppos)
>> +{
>> +	struct seq_file         *s = file->private_data;
>> +	struct xhci_ep_priv	*epriv = s->private;
>> +	int			ret;
>> +	u16			stream_id; /* MaxPStreams + 1 <= 16 */
>> +
>> +	if (!epriv->stream_info)
>> +		return -EPERM;
>> +
>> +	/* Decimal number */
>> +	ret = kstrtou16_from_user(ubuf, count, 10, &stream_id);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (stream_id == 0 || stream_id >= epriv->stream_info->num_streams)
>> +		return -EINVAL;
>> +
>> +	epriv->stream_id = stream_id;
>> +	epriv->show_ring = epriv->stream_info->stream_rings[stream_id];
>> +
>> +	return count;
>> +}
>> +
>> +static const struct file_operations stream_id_fops = {
>> +	.open			= xhci_stream_id_open,
>> +	.write                  = xhci_stream_id_write,
>> +	.read			= seq_read,
>> +	.llseek			= seq_lseek,
>> +	.release		= single_release,
>> +};
>> +
>> +static int xhci_stream_context_array_show(struct seq_file *s, void
>> +*unused) {
>> +	struct xhci_ep_priv	*epriv = s->private;
>> +	struct xhci_stream_ctx	*stream_ctx;
>> +	dma_addr_t		dma;
>> +	int			id;
>> +
>> +	if (!epriv->stream_info)
>> +		return -EPERM;
>> +
>> +	seq_printf(s, "Allocated %d streams and %d stream context array entries\n",
>> +			epriv->stream_info->num_streams,
>> +			epriv->stream_info->num_stream_ctxs);
>> +
>> +	for (id = 0; id < epriv->stream_info->num_stream_ctxs; id++) {
>> +		stream_ctx = epriv->stream_info->stream_ctx_array + id;
>> +		dma = epriv->stream_info->ctx_array_dma + id * 16;
>> +		if (id < epriv->stream_info->num_streams)
>> +			seq_printf(s, "%pad stream id %d deq %016llx\n", &dma,
>> +				   id, le64_to_cpu(stream_ctx->stream_ring));
>> +		else
>> +			seq_printf(s, "%pad stream context entry not used deq %016llx\n",
>> +				   &dma, le64_to_cpu(stream_ctx->stream_ring));
>> +	}
>> +
>> +	return 0;
>> +}
>> +DEFINE_SHOW_ATTRIBUTE(xhci_stream_context_array);
>> +
>> +void xhci_debugfs_create_stream_files(struct xhci_hcd *xhci,
>> +				      struct xhci_virt_device *dev,
>> +				      int ep_index)
>> +{
>> +	struct xhci_slot_priv	*spriv = dev->debugfs_private;
>> +	struct xhci_ep_priv	*epriv;
>> +
>> +	if (!spriv || !spriv->eps[ep_index] ||
>> +	    !dev->eps[ep_index].stream_info)
>> +		return;
>> +
>> +	epriv = spriv->eps[ep_index];
>> +	epriv->stream_info = dev->eps[ep_index].stream_info;
>> +
>> +	/* Show trb ring of stream ID 1 by default */
>> +	epriv->stream_id = 1;
>> +	epriv->show_ring = epriv->stream_info->stream_rings[1];
>> +	debugfs_create_file("stream_id", 0644,
>> +			    epriv->root, epriv,
>> +			    &stream_id_fops);
>> +	debugfs_create_file("stream_context_array", 0444,
>> +			    epriv->root, epriv,
>> +			    &xhci_stream_context_array_fops); }
>> +
>>  void xhci_debugfs_create_slot(struct xhci_hcd *xhci, int slot_id)  {
>>  	struct xhci_slot_priv	*priv;
>> diff --git a/drivers/usb/host/xhci-debugfs.h b/drivers/usb/host/xhci-debugfs.h
>> index f7a4e24..f3348da 100644
>> --- a/drivers/usb/host/xhci-debugfs.h
>> +++ b/drivers/usb/host/xhci-debugfs.h
>> @@ -91,6 +91,9 @@ struct xhci_file_map {  struct xhci_ep_priv {
>>  	char			name[DEBUGFS_NAMELEN];
>>  	struct dentry		*root;
>> +	struct xhci_stream_info *stream_info;
>> +	struct xhci_ring	*show_ring;
>> +	unsigned int		stream_id;
>>  };
>>
>>  struct xhci_slot_priv {
>> @@ -113,6 +116,9 @@ void xhci_debugfs_create_endpoint(struct xhci_hcd *xhci,  void
>> xhci_debugfs_remove_endpoint(struct xhci_hcd *xhci,
>>  				  struct xhci_virt_device *virt_dev,
>>  				  int ep_index);
>> +void xhci_debugfs_create_stream_files(struct xhci_hcd *xhci,
>> +				      struct xhci_virt_device *virt_dev,
>> +				      int ep_index);
>>  #else
>>  static inline void xhci_debugfs_init(struct xhci_hcd *xhci) { }  static inline void
>> xhci_debugfs_exit(struct xhci_hcd *xhci) { } @@ -128,6 +134,10 @@ static inline
>> void  xhci_debugfs_remove_endpoint(struct xhci_hcd *xhci,
>>  			     struct xhci_virt_device *virt_dev,
>>  			     int ep_index) { }
>> +static inline void
>> +xhci_debugfs_create_stream_files(struct xhci_hcd *xhci,
>> +				 struct xhci_virt_device *virt_dev,
>> +				 int ep_index) { }
>>  #endif /* CONFIG_DEBUG_FS */
>>
>>  #endif /* __LINUX_XHCI_DEBUGFS_H */
>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c index
>> bee5dec..2d6584c 100644
>> --- a/drivers/usb/host/xhci.c
>> +++ b/drivers/usb/host/xhci.c
>> @@ -3529,6 +3529,7 @@ static int xhci_alloc_streams(struct usb_hcd *hcd, struct
>> usb_device *udev,
>>  		xhci_dbg(xhci, "Slot %u ep ctx %u now has streams.\n",
>>  			 udev->slot_id, ep_index);
>>  		vdev->eps[ep_index].ep_state |= EP_HAS_STREAMS;
>> +		xhci_debugfs_create_stream_files(xhci, vdev, ep_index);
>>  	}
>>  	xhci_free_command(xhci, config_cmd);
>>  	spin_unlock_irqrestore(&xhci->lock, flags);
>> --
>> 2.7.4
> 
> A gentle ping...

Looks good to me, If you approve I'll make the above change.
It will take some time to actually test it, I haven't got a UAS or other
stream supporting usb device in my current location.

Adding to queue to get some automated testing done on it.

-Mathias 

 

