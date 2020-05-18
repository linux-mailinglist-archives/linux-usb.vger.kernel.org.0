Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 019191D7E2D
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2020 18:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgERQTM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 May 2020 12:19:12 -0400
Received: from mga18.intel.com ([134.134.136.126]:14083 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727006AbgERQTL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 May 2020 12:19:11 -0400
IronPort-SDR: vfrhQL0Bby/23PfyvNdWeJKnFZ1FKAEUi0YncST23Q0tuvngq6isI/4u1Gaj3k0Y1YQGuZC7We
 v1BiPUCtBxog==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 09:19:07 -0700
IronPort-SDR: ++Pa5VN3FhEGakM4ROCQayPwgPcH66uT2YZMyWBBzuytQRTGsxaJ/8Pw3TceoEJo0PvIlbzkZ4
 maoids2Txr8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
   d="scan'208";a="411312411"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga004.jf.intel.com with ESMTP; 18 May 2020 09:19:05 -0700
Subject: Re: [RFC PATCH v2 4/4] usb: xhci: Use temporary buffer to consolidate
 SG
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     John Youn <John.Youn@synopsys.com>,
        Alan Stern <stern@rowland.harvard.edu>
References: <cover.1587461220.git.joglekar@synopsys.com>
 <969b5c9f31807635785ecc74b2ae2559ddc3bbeb.1587461220.git.joglekar@synopsys.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <a1845154-2d8d-e63c-a3e7-7a3ed244bd57@linux.intel.com>
Date:   Mon, 18 May 2020 19:21:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <969b5c9f31807635785ecc74b2ae2559ddc3bbeb.1587461220.git.joglekar@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21.4.2020 12.49, Tejas Joglekar wrote:
> The Synopsys xHC has an internal TRB cache of size TRB_CACHE_SIZE for
> each endpoint. The default value for TRB_CACHE_SIZE is 16 for SS and 8
> for HS. The controller loads and updates the TRB cache from the transfer
> ring in system memory whenever the driver issues a start transfer or
> update transfer command.
> 
> For chained TRBs, the Synopsys xHC requires that the total amount of
> bytes for all TRBs loaded in the TRB cache be greater than or equal to 1
> MPS. Or the chain ends within the TRB cache (with a last TRB).
> 
> If this requirement is not met, the controller will not be able to send
> or receive a packet and it will hang causing a driver timeout and error.
> 
> This can be a problem if a class driver queues SG requests with many
> small-buffer entries. The XHCI driver will create a chained TRB for each
> entry which may trigger this issue.
> 
> This patch adds logic to the XHCI driver to detect and prevent this from
> happening.
> 
> For every (TRB_CACHE_SIZE - 2), we check the total buffer size of
> the SG list and if the last window of (TRB_CACHE_SIZE - 2) SG list length
> and we don't make up at least 1 MPS, we create a temporary buffer to
> consolidate full SG list into the buffer.
> 
> We check at (TRB_CACHE_SIZE - 2) window because it is possible that there
> would be a link and/or event data TRB that take up to 2 of the cache
> entries.
> 
> We discovered this issue with devices on other platforms but have not
> yet come across any device that triggers this on Linux. But it could be
> a real problem now or in the future. All it takes is N number of small
> chained TRBs. And other instances of the Synopsys IP may have smaller
> values for the TRB_CACHE_SIZE which would exacerbate the problem.
> 
> Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
> ---
>  Changes in v2:
>  - Removed redundant debug messages
>  - Modified logic to remove unnecessary changes in hcd.c
>  - Rename the quirk
> 
>  drivers/usb/host/xhci-ring.c |   2 +-
>  drivers/usb/host/xhci.c      | 125 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/usb/host/xhci.h      |   4 ++
>  3 files changed, 130 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index a78787bb5133..2fad9474912a 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -3291,7 +3291,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>  
>  	full_len = urb->transfer_buffer_length;
>  	/* If we have scatter/gather list, we use it. */
> -	if (urb->num_sgs) {
> +	if (urb->num_sgs && !(urb->transfer_flags & URB_DMA_MAP_SINGLE)) {
>  		num_sgs = urb->num_mapped_sgs;
>  		sg = urb->sg;
>  		addr = (u64) sg_dma_address(sg);
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index fe38275363e0..15f06bc6b1ad 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1256,6 +1256,106 @@ EXPORT_SYMBOL_GPL(xhci_resume);
>  
>  /*-------------------------------------------------------------------------*/
>  
> +static int xhci_map_temp_buffer(struct usb_hcd *hcd, struct urb *urb)
> +{
> +	void *temp;
> +	int ret = 0;
> +	unsigned int len;
> +	unsigned int buf_len;
> +	enum dma_data_direction dir;
> +	struct xhci_hcd *xhci;
> +
> +	xhci = hcd_to_xhci(hcd);
> +	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> +	buf_len = urb->transfer_buffer_length;
> +
> +	temp = kzalloc_node(buf_len, GFP_ATOMIC,
> +			    dev_to_node(hcd->self.sysdev));
> +
> +	if (usb_urb_dir_out(urb))
> +		len = sg_pcopy_to_buffer(urb->sg, urb->num_sgs,
> +					 temp, buf_len, 0);
> +
> +	urb->transfer_buffer = temp;
> +	urb->transfer_dma = dma_map_single(hcd->self.sysdev,
> +					   urb->transfer_buffer,
> +					   urb->transfer_buffer_length,
> +					   dir);
> +
> +	if (dma_mapping_error(hcd->self.sysdev,
> +			      urb->transfer_dma)) {
> +		ret = -EAGAIN;
> +		kfree(temp);
> +	} else {
> +		urb->transfer_flags |= URB_DMA_MAP_SINGLE;

Not sure if using URB_DMA_MAP_SINGLE to flag that this urb is boucebuffered is
appropriate.

If Greg or Alan don't object then it's fine for me as well.



> +	}
> +
> +	return ret;
> +}
> +
> +static bool xhci_urb_temp_buffer_required(struct usb_hcd *hcd,
> +					  struct urb *urb)
> +{
> +	bool ret = false;
> +	unsigned int i;
> +	unsigned int len = 0;
> +	unsigned int buf_len;
> +	unsigned int trb_size;
> +	unsigned int max_pkt;
> +	struct scatterlist *sg;
> +	struct scatterlist *tail_sg;
> +
> +	sg = urb->sg;
> +	tail_sg = urb->sg;
> +	buf_len = urb->transfer_buffer_length;
> +	max_pkt = usb_endpoint_maxp(&urb->ep->desc);
> +
> +	if (!urb->num_sgs)
> +		return ret;
> +
> +	if (urb->dev->speed >= USB_SPEED_SUPER)
> +		trb_size = TRB_CACHE_SIZE_SS;
> +	else
> +		trb_size = TRB_CACHE_SIZE_HS;
> +
> +	if (urb->transfer_buffer_length != 0 &&
> +	    !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
> +		for_each_sg(urb->sg, sg, urb->num_sgs, i) {
> +			len = len + sg->length;
> +			if (i > trb_size - 2) {
> +				len = len - tail_sg->length;
> +				if (len < max_pkt) {
> +					ret = true;
> +					break;
> +				}
> +
> +				tail_sg = sg_next(tail_sg);
> +			}
> +		}
> +	}
> +	return ret;
> +}
> +
> +static void xhci_unmap_temp_buf(struct urb *urb)
> +{
> +	struct scatterlist *sg;
> +	unsigned int len;
> +	unsigned int buf_len;
> +
> +	sg = urb->sg;
> +	buf_len = urb->transfer_buffer_length;
> +
> +	if (usb_urb_dir_in(urb)) {
> +		len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs,
> +					   urb->transfer_buffer,
> +					   buf_len,
> +					   0);
> +	}
> +
> +	kfree(urb->transfer_buffer);
> +	urb->transfer_buffer = NULL;

clear URB_DMA_MAP_SINGLE from urb->transfer_flags?

Everything else looks good do me.
-Mathias
