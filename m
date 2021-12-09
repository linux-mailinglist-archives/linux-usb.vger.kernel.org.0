Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBCF546EC23
	for <lists+linux-usb@lfdr.de>; Thu,  9 Dec 2021 16:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240342AbhLIPvA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Dec 2021 10:51:00 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:35117 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240344AbhLIPu4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Dec 2021 10:50:56 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 346923200F6F;
        Thu,  9 Dec 2021 10:47:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 09 Dec 2021 10:47:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=1
        RoWAEDFnk2Y4P0Mn9vVyelrRdfVlToivYVK7QAlRG0=; b=iDR2kq8OagZ3EdMdQ
        HNcErmjD61g6gY9tvIsgOHqRNYwQQa9knfNPUmnH8ELRITBWYemlqPy8oYzXiTPh
        OtL/tms7rufD/wYwenS95v2Bq2RdERwzYKfGz1/o96o9ZL8EkTzcLols29Idhmj7
        7AaQudYCvpsKyO4kNJ7LuUBqo2LXpIJ8ioGVWJk30iZ19oTEqfwzesR6tjTqj1WG
        z0EyVOmRp9ACz4gujWyug2GriLRJtJtsDi+edQZ8/sWJTdqIYF0Im3LrH+7jQRW0
        auDeYOVukzmCsy/AFvu6xpjw+kgHoFSwzoUovFop0/fRFOY2mSq1Sz59xXzXuiVu
        JX4kQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=1RoWAEDFnk2Y4P0Mn9vVyelrRdfVlToivYVK7QAlR
        G0=; b=PewnaNMJ7s73PlPd0oHSX+/TeME/5z/MndOBBY/jympsf9xl11/HaCQwV
        4j84ow4bBzTEW8L6jmFJ6edaGUZ3Tvh4bY4tZ925QwWpwxU7YGMObvobDfLroWp/
        RnCgvaRMMzxgNtJ1oYCl39/lnsFW4nt7J+8NOWh5F3fj+LjvpfF4901oxzEGmJwi
        AujafolD80oEKStXNl0Lj7SXFBKzGv2EW35mKpYSEkx1Ajpr7XM+Qdm7bHJnq3xw
        ISpjbc7DeGK5Oxv1MI7FUW8Ju4sVgpo+k5bSmvXLWQSBo21HdWMZ7IlNgtGm4Ktl
        Xo+mIlFeBk0VazE0TykIuc+nKo2Lw==
X-ME-Sender: <xms:CSWyYf8KpU05ZCJK-ZkCCE5vPaehJ80XGblJy65isOs0ufxWEKSyzA>
    <xme:CSWyYbvkMOTcO0BSKxZlNzRslcPy_Ua1cyb4K-iX_roxHLUA-y8V5mQcjSpYyDt0y
    sXejgJFDOaiVg>
X-ME-Received: <xmr:CSWyYdC9FRS-ny3eSFczxZ9Qt8_8m6z_bZHDTcP63jBuQcnFaMPAZTn1iPq8f_Vu5AmffnOdyAbcyveCqbOHNDGh4zb1NfW2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkedtgdekvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevtdeile
    euteeggefgueefhfevgfdttefgtefgtddvgeejheeiuddvtdekffehffenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:CSWyYbcdbrbfmVbYZe3EbROqr3nL7yl8RPVUojA02AGjOw6SYgr9QA>
    <xmx:CSWyYUPVjO5EY-7-aBSo71XDB1G2IAQEkP4crCOnfDnfzyDHKH3kiw>
    <xmx:CSWyYdmbO05E1e_jXYFRTLzA-b7sRdg-fsOwM-FonYjgH-mF2aWv5Q>
    <xmx:CSWyYdYnFmWN1PUai_6S65OEmQ56h1yewUpv4Fv-PBQ8gjp5q8MblQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Dec 2021 10:47:21 -0500 (EST)
Date:   Thu, 9 Dec 2021 16:47:18 +0100
From:   Greg KH <greg@kroah.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [RFC]How else could a malicious device sabotage endpoints for
 usbnet
Message-ID: <YbIlBl8Ay1rIED8p@kroah.com>
References: <ad1ee829-401a-d051-1da8-f9e01caa7b85@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad1ee829-401a-d051-1da8-f9e01caa7b85@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 09, 2021 at 04:33:29PM +0100, Oliver Neukum wrote:
> Hi,
> 
> I have checked for type, direction and number of endpoints.
> But I keep thinking that I have overlooked a way to make broken
> endpoint descriptors. Any suggestions?
> 
>     Regards
>         Oliver
> 

> >From 853e421630f82fb3b7005ad0b294c091a064ac39 Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Thu, 18 Nov 2021 18:15:03 +0100
> Subject: [PATCH] usbnet: sanity check for endpoint types
> 
> A malicious device can pretend to be a device with a known
> configuration of endpoints yet present endpoints of the wrong type
> or too few or none at all.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/net/usb/usbnet.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
> index 9a6450f796dc..b1f93810a6f3 100644
> --- a/drivers/net/usb/usbnet.c
> +++ b/drivers/net/usb/usbnet.c
> @@ -91,6 +91,31 @@ static const char * const usbnet_event_names[] = {
>  	[EVENT_NO_IP_ALIGN]	   = "EVENT_NO_IP_ALIGN",
>  };
>  
> +bool usbnet_validate_endpoints(struct usbnet *dev, struct usb_interface *intf, const struct driver_info *info)
> +{
> +	struct usb_host_interface *alt = intf->cur_altsetting;
> +	struct usb_host_endpoint *e;
> +	int num_endpoints = alt->desc.bNumEndpoints;
> +
> +	if (info->in > num_endpoints)
> +		return false;
> +	e = alt->endpoint + info->in;
> +	if (!e)
> +		return false;
> +	if (!usb_endpoint_is_bulk_in(&e->desc))
> +		return false;
> +
> +	if (info->out > num_endpoints)
> +		return false;
> +	e = alt->endpoint + info->out;
> +	if (!e)
> +		return false;
> +	if (!usb_endpoint_is_bulk_out(&e->desc))
> +		return false;
> +
> +	return true;

Why not use usb_find_common_endpoints() and/or the other helper
functions instead? that's what they were created for.

thanks,

greg k-h
