Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D436392D04
	for <lists+linux-usb@lfdr.de>; Thu, 27 May 2021 13:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233950AbhE0Lsf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 May 2021 07:48:35 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:34365 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233633AbhE0Lse (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 May 2021 07:48:34 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 509E8E68;
        Thu, 27 May 2021 07:47:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 27 May 2021 07:47:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=QsNmzZ990Duf5RkPsYDRn4w8w3K
        EuxlWW+pG8sUkc1Y=; b=TsnbIXMUR83XT8WZbFabkhcdhE6NjKgaau6Ij/OaLnr
        BT+d1hZom79SVB7uiy4yEGNlEkQSYiNq64xgR6b/yVTOB287G0iQ0yUIqFYLKLtF
        Y0OsHp49Jf4uKXqFid9NTPWsupig7wX41zsWI/XYom7ic80Fm2TVXKRFQiRHM4SZ
        +4kE+wmhfLegMMTsNvSjK/XifVkaDwaPrlDeG25IuwEwdccMqCJDU8NT6h2wM+Fa
        j3WUq32I7fbUEeVLUCbI/eqmCLcXZgCYhgr4Fuk4hYjB1h9pT2phzm8J/GqEOu8J
        FFocvybtxf4pnYsC8XRCWGE9vMe4vWPMNhcnm2fAgnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=QsNmzZ
        990Duf5RkPsYDRn4w8w3KEuxlWW+pG8sUkc1Y=; b=DTNaPoJYAyuIAaF10b3iEX
        3W0RzfEtYAFBIAUu0fw3S8Vefx+UIFW5fNSU/gYArugGS9jzR9+Ftovebu4ZFG3X
        0krRBoCTmxz5GkXAv86+8Earxd1zTjzDSGZw18AGAIun9XsdY4geQ46jLXyfiYH2
        +2LK2oyKUqtUhHhPMNjcKlGpQpcVb0R0OzfSdk36LIx3VFyFC/e7u+bavWCTC3EH
        m7Bm6nC9eFSKMpHhxfqydjk2eBwGwi9K9Ta8s85bFvdxz8q+hYdbYsoJtBDqoO26
        KC7HlavJLKbpCe8qzLK3sRMOCWGTW3IvlU4FbgyoY53R4/qeeL8NZw0Q1BgPx10w
        ==
X-ME-Sender: <xms:tIavYJjiZ8G2OmHcpj3gVvOQkcN83Ast9LmRhs2iLQjC9f2spP7ccw>
    <xme:tIavYOAm5qqR5IViG4IOdbE4wHg-NrKEPbBINZrpmU-OYQ1D_jinOXfOy1071w3no
    9ZrIpn1cSAIbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekhedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:tIavYJElzJhYYh3qJWX3q5lZdYBkGPMkTE54WxVYVvjNQ-RLLodXHA>
    <xmx:tIavYOSwOx1l6XPEIV4MabpENNU5JeSXM_CqDcTIRbBDzCEBIs130A>
    <xmx:tIavYGztyhmg1y8p4bn1vHwHk9MfdOGC49FBC8RmIoi_U8mUgIxA3A>
    <xmx:tIavYK_8By0V-SUa5vfX7uVfDYHqLKL0AIS_NbUzIUoDRAyoZDrZxw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Thu, 27 May 2021 07:47:00 -0400 (EDT)
Date:   Thu, 27 May 2021 13:46:58 +0200
From:   Greg KH <greg@kroah.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Johan Hovold <johan@kernel.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: core: Check buffer length matches wLength for
 control transfers
Message-ID: <YK+GsvCVDrA40GIc@kroah.com>
References: <20210526153244.GA1400430@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526153244.GA1400430@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 26, 2021 at 11:32:44AM -0400, Alan Stern wrote:
> A type of inconsistency that can show up in control URBs is when the
> setup packet's wLength value does not match the URB's
> transfer_buffer_length field.  The two should always be equal;
> differences could lead to information leaks or undefined behavior for
> OUT transfers or overruns for IN transfers.
> 
> This patch adds a test for such mismatches during URB submission.  If
> the test fails, the submission is rejected with a -EBADR error code
> (which is not used elsewhere in the USB core), and a debugging message
> is logged for people interested in tracking down these errors.
> 
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> CC: Johan Hovold <johan@kernel.org>
> 
> ---
> 
> 
> [as1961]
> 
> 
>  Documentation/driver-api/usb/error-codes.rst |    3 +++
>  drivers/usb/core/urb.c                       |    6 ++++++
>  2 files changed, 9 insertions(+)
> 
> Index: usb-devel/drivers/usb/core/urb.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/urb.c
> +++ usb-devel/drivers/usb/core/urb.c
> @@ -410,6 +410,12 @@ int usb_submit_urb(struct urb *urb, gfp_
>  		dev_WARN_ONCE(&dev->dev, (usb_pipeout(urb->pipe) != is_out),
>  				"BOGUS control dir, pipe %x doesn't match bRequestType %x\n",
>  				urb->pipe, setup->bRequestType);
> +		if (le16_to_cpu(setup->wLength) != urb->transfer_buffer_length) {
> +			dev_dbg(&dev->dev, "BOGUS control len %d doesn't match transfer length %d\n",
> +					le16_to_cpu(setup->wLength),
> +					urb->transfer_buffer_length);
> +			return -EBADR;
> +		}

Looks good, let's see if this catches anything :)

now queued up, thanks.

greg k-h
