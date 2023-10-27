Return-Path: <linux-usb+bounces-2242-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 308A77D8CCA
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 03:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD26C28222F
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 01:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F3D10FA;
	Fri, 27 Oct 2023 01:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wj4A3uMG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9180F800
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 01:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0828C433C8;
	Fri, 27 Oct 2023 01:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698370211;
	bh=YOWD4N121xIJhA9vwpTTpOpv0xx0mse7znzmlAJoBog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wj4A3uMGS3yFDPXYQ8aIxkhnakLmR0yyl6SHkfJlU+TNpqqH8xLB6Ub9zwuAZQsFg
	 zkVYmO/TxqN8r2sYYe7tSJalSIE3/9g2PrUaKvMKX7mNw5PPew2rr6orVBaDLFXrla
	 kG91GUJVBpf+wpGxcDl6LPa5N3xDbX3uj+T8ayKYzQMCF566Q8CdkStqx0Q7CXYx0B
	 iKjue9Azn2JUy0EUdUGiSujP8TgxFkOzbgoOoRXWi10N//0f8v2zQQoi68NIXVdVPX
	 /vPXm3/mj7Imz9k4Q2DQ5eHlWmYyPdpYMOXy6wnhF1LyqpduzPU9pZUGdx5SGI6P5x
	 sPdI21GPo96FQ==
Date: Fri, 27 Oct 2023 09:30:01 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Pawel Laszczak <pawell@cadence.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb:cdnsp: remove TRB_FLUSH_ENDPOINT command
Message-ID: <20231027013001.GA1669606@nchen-desktop>
References: <20231026073737.165450-1-pawell@cadence.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026073737.165450-1-pawell@cadence.com>

On 23-10-26 09:37:37, Pawel Laszczak wrote:
> Patch removes TRB_FLUSH_ENDPOINT command from driver.
> This command is not supported by controller and
> USBSSP returns TRB Error completion code for it.
> 
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/cdns3/cdnsp-debug.h  |  3 ---
>  drivers/usb/cdns3/cdnsp-gadget.c |  6 +-----
>  drivers/usb/cdns3/cdnsp-gadget.h |  5 -----
>  drivers/usb/cdns3/cdnsp-ring.c   | 24 ------------------------
>  4 files changed, 1 insertion(+), 37 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/cdnsp-debug.h b/drivers/usb/cdns3/cdnsp-debug.h
> index f0ca865cce2a..ad617b7455b9 100644
> --- a/drivers/usb/cdns3/cdnsp-debug.h
> +++ b/drivers/usb/cdns3/cdnsp-debug.h
> @@ -131,8 +131,6 @@ static inline const char *cdnsp_trb_type_string(u8 type)
>  		return "Endpoint Not ready";
>  	case TRB_HALT_ENDPOINT:
>  		return "Halt Endpoint";
> -	case TRB_FLUSH_ENDPOINT:
> -		return "FLush Endpoint";
>  	default:
>  		return "UNKNOWN";
>  	}
> @@ -328,7 +326,6 @@ static inline const char *cdnsp_decode_trb(char *str, size_t size, u32 field0,
>  		break;
>  	case TRB_RESET_EP:
>  	case TRB_HALT_ENDPOINT:
> -	case TRB_FLUSH_ENDPOINT:
>  		ret = snprintf(str, size,
>  			       "%s: ep%d%s(%d) ctx %08x%08x slot %ld flags %c",
>  			       cdnsp_trb_type_string(type),
> diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
> index 4b67749edb99..4a3f0f958256 100644
> --- a/drivers/usb/cdns3/cdnsp-gadget.c
> +++ b/drivers/usb/cdns3/cdnsp-gadget.c
> @@ -1024,10 +1024,8 @@ static int cdnsp_gadget_ep_disable(struct usb_ep *ep)
>  	pep->ep_state |= EP_DIS_IN_RROGRESS;
>  
>  	/* Endpoint was unconfigured by Reset Device command. */
> -	if (!(pep->ep_state & EP_UNCONFIGURED)) {
> +	if (!(pep->ep_state & EP_UNCONFIGURED))
>  		cdnsp_cmd_stop_ep(pdev, pep);
> -		cdnsp_cmd_flush_ep(pdev, pep);
> -	}
>  
>  	/* Remove all queued USB requests. */
>  	while (!list_empty(&pep->pending_list)) {
> @@ -1424,8 +1422,6 @@ static void cdnsp_stop(struct cdnsp_device *pdev)
>  {
>  	u32 temp;
>  
> -	cdnsp_cmd_flush_ep(pdev, &pdev->eps[0]);
> -
>  	/* Remove internally queued request for ep0. */
>  	if (!list_empty(&pdev->eps[0].pending_list)) {
>  		struct cdnsp_request *req;
> diff --git a/drivers/usb/cdns3/cdnsp-gadget.h b/drivers/usb/cdns3/cdnsp-gadget.h
> index e1b5801fdddf..dbee6f085277 100644
> --- a/drivers/usb/cdns3/cdnsp-gadget.h
> +++ b/drivers/usb/cdns3/cdnsp-gadget.h
> @@ -1128,8 +1128,6 @@ union cdnsp_trb {
>  #define TRB_HALT_ENDPOINT	54
>  /* Doorbell Overflow Event. */
>  #define TRB_DRB_OVERFLOW	57
> -/* Flush Endpoint Command. */
> -#define TRB_FLUSH_ENDPOINT	58
>  
>  #define TRB_TYPE_LINK(x)	(((x) & TRB_TYPE_BITMASK) == TRB_TYPE(TRB_LINK))
>  #define TRB_TYPE_LINK_LE32(x)	(((x) & cpu_to_le32(TRB_TYPE_BITMASK)) == \
> @@ -1539,8 +1537,6 @@ void cdnsp_queue_configure_endpoint(struct cdnsp_device *pdev,
>  void cdnsp_queue_reset_ep(struct cdnsp_device *pdev, unsigned int ep_index);
>  void cdnsp_queue_halt_endpoint(struct cdnsp_device *pdev,
>  			       unsigned int ep_index);
> -void cdnsp_queue_flush_endpoint(struct cdnsp_device *pdev,
> -				unsigned int ep_index);
>  void cdnsp_force_header_wakeup(struct cdnsp_device *pdev, int intf_num);
>  void cdnsp_queue_reset_device(struct cdnsp_device *pdev);
>  void cdnsp_queue_new_dequeue_state(struct cdnsp_device *pdev,
> @@ -1574,7 +1570,6 @@ void cdnsp_irq_reset(struct cdnsp_device *pdev);
>  int cdnsp_halt_endpoint(struct cdnsp_device *pdev,
>  			struct cdnsp_ep *pep, int value);
>  int cdnsp_cmd_stop_ep(struct cdnsp_device *pdev, struct cdnsp_ep *pep);
> -int cdnsp_cmd_flush_ep(struct cdnsp_device *pdev, struct cdnsp_ep *pep);
>  void cdnsp_setup_analyze(struct cdnsp_device *pdev);
>  int cdnsp_status_stage(struct cdnsp_device *pdev);
>  int cdnsp_reset_device(struct cdnsp_device *pdev);
> diff --git a/drivers/usb/cdns3/cdnsp-ring.c b/drivers/usb/cdns3/cdnsp-ring.c
> index 07f6068342d4..af981778382d 100644
> --- a/drivers/usb/cdns3/cdnsp-ring.c
> +++ b/drivers/usb/cdns3/cdnsp-ring.c
> @@ -2123,19 +2123,6 @@ int cdnsp_cmd_stop_ep(struct cdnsp_device *pdev, struct cdnsp_ep *pep)
>  	return ret;
>  }
>  
> -int cdnsp_cmd_flush_ep(struct cdnsp_device *pdev, struct cdnsp_ep *pep)
> -{
> -	int ret;
> -
> -	cdnsp_queue_flush_endpoint(pdev, pep->idx);
> -	cdnsp_ring_cmd_db(pdev);
> -	ret = cdnsp_wait_for_cmd_compl(pdev);
> -
> -	trace_cdnsp_handle_cmd_flush_ep(pep->out_ctx);
> -
> -	return ret;
> -}
> -
>  /*
>   * The transfer burst count field of the isochronous TRB defines the number of
>   * bursts that are required to move all packets in this TD. Only SuperSpeed
> @@ -2465,17 +2452,6 @@ void cdnsp_queue_halt_endpoint(struct cdnsp_device *pdev, unsigned int ep_index)
>  			    EP_ID_FOR_TRB(ep_index));
>  }
>  
> -/*
> - * Queue a flush endpoint request on the command ring.
> - */
> -void  cdnsp_queue_flush_endpoint(struct cdnsp_device *pdev,
> -				 unsigned int ep_index)
> -{
> -	cdnsp_queue_command(pdev, 0, 0, 0, TRB_TYPE(TRB_FLUSH_ENDPOINT) |
> -			    SLOT_ID_FOR_TRB(pdev->slot_id) |
> -			    EP_ID_FOR_TRB(ep_index));
> -}
> -
>  void cdnsp_force_header_wakeup(struct cdnsp_device *pdev, int intf_num)
>  {
>  	u32 lo, mid;
> -- 
> 2.25.1
> 

-- 

Thanks,
Peter Chen

