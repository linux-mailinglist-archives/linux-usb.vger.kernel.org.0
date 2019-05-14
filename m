Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1680F1C3B0
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2019 09:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbfENHOj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 May 2019 03:14:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:54286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbfENHOj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 May 2019 03:14:39 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7F5C720873;
        Tue, 14 May 2019 07:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557818078;
        bh=08g8thZwVRUtold7FxYmgCEPqHepdAlSTbSh+4BeO4w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b9/5mz6qjaQoiGMJZ/kiP674Hi9sGBaVevO3fbKP4ILut8How+aQNg4ZhWKIfwBSq
         AbAPbqBwYhSxhHO9Qk9jg1pv1ZG9HaUjkC9r7oc7XFbtAel0spEYMiy7iAK8nE9bki
         24nu8Do4QpI/CpL9zjs82gqB66mAX1f4Nte9vk9E=
Date:   Tue, 14 May 2019 09:14:35 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rick Mark <rickmark@dropbox.com>
Cc:     linux-usb@vger.kernel.org,
        enterprise-infrasec-team <enterprise-infrasec-team@dropbox.com>,
        production-infrasec-team <production-infrasec-team@dropbox.com>
Subject: Re: Lack of length checking in USB configuration may allow buffer
 overflow
Message-ID: <20190514071435.GA10545@kroah.com>
References: <CAEFJ+1OA+=SBRa_O3UupJT_KHm_XDw-4uJ9J3cRJQOW0T_c6aA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEFJ+1OA+=SBRa_O3UupJT_KHm_XDw-4uJ9J3cRJQOW0T_c6aA@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 13, 2019 at 07:14:38PM -0700, Rick Mark wrote:
> Hey All,
> 
> I was seeing a linux VM crash due to malformed USB configuration
> payloads being malformed.  I'm testing this patch now which should
> provide better security checking (but this is my first patch so be
> kind if I have things wrong.)
> 
> R
> 
> >From d7b0dd52f3b3b38126504b17d2d9c9ceaa572edf Mon Sep 17 00:00:00 2001
> From: Rick Mark <rickmark@outlook.com>
> Date: Mon, 13 May 2019 19:06:46 -0700
> Subject: [PATCH] Security checks in USB configurations
> 
> ---
>  drivers/usb/core/config.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 7b5cb28ff..8cb9a136e 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -33,6 +33,13 @@ static int find_next_descriptor(unsigned char
> *buffer, int size,


Thanks for the patch, but your email client ate all of the tabs and
line-wrapped it, making it impossible to apply, even if we wanted to :)

Also, I need a lot better changelog text and description, as well as a
signed-off-by line.  Documentation/SubmittingPatches should explain all
of how to do this.  If you have questions after reading this, please let
me know.

That being said, I don't think all of your patch is really needed:

> 
>   /* Find the next descriptor of type dt1 or dt2 */
>   while (size > 0) {
> +     if (size < sizeof(struct usb_descriptor_header)) {
> +         printk( KERN_ERR "usb config: find_next_descriptor "
> +                          "with size %d not sizeof("
> +                          "struct usb_descriptor_header)", size );
> +         break;
> +     }


How can size be smaller than this, I think we check this value before
calling this function in all places.  Did we miss one?

> +
>   h = (struct usb_descriptor_header *) buffer;
>   if (h->bDescriptorType == dt1 || h->bDescriptorType == dt2)
>   break;
> @@ -58,6 +65,13 @@ static void
> usb_parse_ssp_isoc_endpoint_companion(struct device *ddev,
>   * The SuperSpeedPlus Isoc endpoint companion descriptor immediately
>   * follows the SuperSpeed Endpoint Companion descriptor
>   */
> + if (size < sizeof(struct usb_ssp_isoc_ep_comp_descriptor)) {
> +        dev_warn(ddev, "Invalid size %d for SuperSpeedPlus isoc
> endpoint companion"
> +                       "for config %d interface %d altsetting %d ep %d.\n",
> +                 size, cfgno, inum, asnum, ep->desc.bEndpointAddress);
> +        return;
> + }

A patch was just sent to the list to resolve a problem in this function
yesterday, can you verify that it resolves your issue as well?

> +
>   desc = (struct usb_ssp_isoc_ep_comp_descriptor *) buffer;
>   if (desc->bDescriptorType != USB_DT_SSP_ISOC_ENDPOINT_COMP ||
>       size < USB_DT_SSP_ISOC_EP_COMP_SIZE) {
> @@ -76,6 +90,14 @@ static void usb_parse_ss_endpoint_companion(struct
> device *ddev, int cfgno,
>   struct usb_ss_ep_comp_descriptor *desc;
>   int max_tx;
> 
> + if (size < sizeof(struct usb_ss_ep_comp_descriptor)) {
> +        dev_warn(ddev, "Invalid size %d of SuperSpeed endpoint"
> +                       " companion for config %d "
> +                       " interface %d altsetting %d: "
> +                       "using minimum values\n",
> +                 size, cfgno, inum, asnum);
> +        return;
> + }
>   /* The SuperSpeed endpoint companion descriptor is supposed to
>   * be the first thing immediately following the endpoint descriptor.
>   */

We do this same check the line below this, why do it twice?


> @@ -103,6 +125,16 @@ static void
> usb_parse_ss_endpoint_companion(struct device *ddev, int cfgno,
>   ep->desc.wMaxPacketSize;
>   return;
>   }
> +
> + if ((size - desc->bLength) < 0 ||
> +     size < USB_DT_SS_EP_COMP_SIZE) {
> +        dev_warn(ddev, "Control endpoint with bMaxBurst = %d in "
> +                       "config %d interface %d altsetting %d ep %d: "
> +                       "has invalid bLength %d vs size %d\n", desc->bMaxBurst,
> +                 cfgno, inum, asnum, ep->desc.bEndpointAddress,
> desc->bLength, size);
> +        return;
> + }
> +

Didn't we just check this above here successfully?

I didn't go through all of your others, but please be sure that we are
not already doing all of this, as I think we are.

Are you sure you are using the latest kernel version?

thanks,

greg k-h
