Return-Path: <linux-usb+bounces-266-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CC07A343B
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 10:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D66DA280F86
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 08:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750521C10;
	Sun, 17 Sep 2023 08:04:48 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D71515C8
	for <linux-usb@vger.kernel.org>; Sun, 17 Sep 2023 08:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B4AC433C7;
	Sun, 17 Sep 2023 08:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694937887;
	bh=1h5LcJ03IUO48wVxTPxjCPe7OlWV58gb87QmcYg6uuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LubuApJ/ahdQUlJAbFGW/avEpTKbuPb8jGK4Wmih51twXHgNZZk1kPJrrv6amXOlH
	 3vDGAz1HYb2NwvCM6Z7H1vthBFQ625vewD2Zz9PUWde4UWw1/RmyK9DdXLFqRfZbTo
	 LK+FHdpQZBoQfzlfaKrj2G1Gv0vo5YuEGfFPisS4=
Date: Sun, 17 Sep 2023 10:04:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Linyu Yuan <quic_linyyuan@quicinc.com>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_ppratap@quicinc.com, quic_wcheng@quicinc.com,
	quic_jackp@quicinc.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: ncm: Handle decoding of multiple NTB's
 in unwrap call
Message-ID: <2023091743-tightly-drivable-4360@gregkh>
References: <20230915061001.18884-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230915061001.18884-1-quic_kriskura@quicinc.com>

On Fri, Sep 15, 2023 at 11:39:48AM +0530, Krishna Kurapati wrote:
> When NCM is used with hosts like Windows PC, it is observed that there are
> multiple NTB's contained in one usb request giveback. Since the driver
> unwraps the obtained request data assuming only one NTB is present, we loose
> the subsequent NTB's present resulting in data loss.
> 
> Fix this by checking the parsed block length with the obtained data length
> in usb request and continue parsing after the last byte of current NTB.
> 
> Cc: stable@vger.kernel.org

What commit id does this fix?

> Reviewed-by: Maciej Żenczykowski <maze@google.com>
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  drivers/usb/gadget/function/f_ncm.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
> index feccf4c8cc4f..f00f051438ec 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -1156,7 +1156,8 @@ static int ncm_unwrap_ntb(struct gether *port,
>  			  struct sk_buff_head *list)
>  {
>  	struct f_ncm	*ncm = func_to_ncm(&port->func);
> -	__le16		*tmp = (void *) skb->data;
> +	unsigned char	*ntb_ptr = (void *) skb->data;

Why persist with the extra ' ', didn't checkpatch complain about this?

And why the cast at all?

> +	__le16		*tmp;
>  	unsigned	index, index2;
>  	int		ndp_index;
>  	unsigned	dg_len, dg_len2;
> @@ -1169,6 +1170,10 @@ static int ncm_unwrap_ntb(struct gether *port,
>  	const struct ndp_parser_opts *opts = ncm->parser_opts;
>  	unsigned	crc_len = ncm->is_crc ? sizeof(uint32_t) : 0;
>  	int		dgram_counter;
> +	int		to_process = skb->len;
> +
> +parse_ntb:
> +	tmp = (void *) ntb_ptr;

Again, no blank space please.

And why the cast?

thanks,

greg k-h

