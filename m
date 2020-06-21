Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96B2F2027D0
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jun 2020 02:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbgFUA7L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 20 Jun 2020 20:59:11 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:32961 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728531AbgFUA7L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 20 Jun 2020 20:59:11 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id CACB31902;
        Sat, 20 Jun 2020 20:59:09 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Sat, 20 Jun 2020 20:59:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=qch85GwLhcggwFf8rGDXRrNH4rXfJp0
        XnKRdXJRHvSw=; b=criXavDoHWzaUDnJ8VwjoH42BhDigWul4jbgfZdRFcYsFaQ
        mMVXqVFT3R2I/jZaHvBzWCLWGk0e9v30FaxgCQmt/gpolHsGgvZ3Lygh0/FIBBgd
        eg4vWHjpzAG+qpNkqeZsUXPQ8LrOGlo2W06Xl8GhhJTFz+Yw8VjohRUV1zRwW81w
        U60LAmvZRQ2RdsCaNuYzBMrxXvupShCF/kIGRdrDzSkHg4cNM2PjGMgaQvYWs1rT
        GjJT//j1EGE7+K0n+YHncMh37m2CvromuAejh9Rn0tUVC+U2EuK7EGAiLdWXifDh
        WdRz7snk4REhCYjtKoz6hZZvOGN4IP59nCmZBqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qch85G
        wLhcggwFf8rGDXRrNH4rXfJp0XnKRdXJRHvSw=; b=oq/KNX6q81mpMonv84HjEx
        EOovV5yv43OVMLn9aT9l+T6Bk7u69QQL0SYWncOHwnii+8GagsU1adjJsL4mMlT1
        9+t7i1XfgtW+KOfRCZEFbVDsZseYe/rDFJjrFIGhnF9VepldsIkadzLyXtsp8hrT
        x9wDYsrvksZNTIN/CYt9KqRZl9nhBUsDmnZOhC81E27bQxOhHHq3OXv2OQi08NlZ
        M0k5eQQqmvLyK4njYpLiDsteezNpOfYkfdtoe6DTHrctP5hWDbG/bSC1XSADAhpI
        89ETPxR++izG7FQn6YoskAcHLZjP3VM/StfZRiwfuK0ETug15w0BYULhAPpmXn5w
        ==
X-ME-Sender: <xms:3bDuXqwDjAWmXuIv3tf0rXvWhJakqmDZSb-JjQJ2QSjvoM76ZS63pA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejledggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuihgu
    ucfuphhrhidfuceoshhiugesrggvrghmrdhusheqnecuggftrfgrthhtvghrnhepveeghf
    evveetteefteekjeejhedufffffffhuefflefhueffudefudeljeefuefgnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhiugesrggvrghmrd
    hush
X-ME-Proxy: <xmx:3bDuXmQ0cPpRkdVUJpSNnS5uapwasycZV9ioiTwkCTg-48PU1astFA>
    <xmx:3bDuXsV-aGxik23UVBGV0QI7CtiIPQN97Jd6PMyQLBXbw6PbvZ87Jg>
    <xmx:3bDuXghk4gIyu9P4hUh9zxTIrP8Tx-scILi1WLsdaS0O1SR7bN9wng>
    <xmx:3bDuXvO3gJV66z_a4wNheAUm64C5_aWZFVO4nHsDDdcOhXrK8jaXug>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id E982166007E; Sat, 20 Jun 2020 20:59:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-543-gda70334-fm-20200618.004-gda703345
Mime-Version: 1.0
Message-Id: <b65b3f72-b889-4eed-bfbb-4db027b8b5c4@www.fastmail.com>
In-Reply-To: <20200620142400.GA82155@rowland.harvard.edu>
References: <30d7899b-9723-4698-bec2-aabfeeedde1b@www.fastmail.com>
 <20200620142400.GA82155@rowland.harvard.edu>
Date:   Sat, 20 Jun 2020 19:58:24 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Alan Stern" <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Unable to use struct usb_endpoint_descriptor in FunctionFS
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 20, 2020, at 9:24 AM, Alan Stern wrote:
> On Fri, Jun 19, 2020 at 11:04:31PM -0500, Sid Spry wrote:
> > Hello, I've figured out how to get my userspace driver code to enumerate for
> > the host and send/receive from the device with bulk endpoints as demonstrated
> > in ffs-test.c. I have successfully added another bulk endpoint, but issues
> > arise when I try to add an isochronous endpoint.
> > 
> > I've tracked the problem, I think, to the mere presence of the struct
> > usb_endpoint_descriptor. Is anyone able to elucidate what I might be missing?
> > 
> > The rejected set of descriptors follows. Note I set the usb_endpoint_descriptor
> > struct to be a bulk endpoint; I expect the extra fields would be ignored.
> > 
> > I can provide the full code if helpful. Superspeed descriptors commented out
> > as I'm less familiar with USB3 and I found that the fs/hs/ss descriptor sets had
> > to be equivalent.
> > 
> > ```
> > static const struct {
> > 	struct usb_functionfs_descs_head_v2 header;
> > 	__le32 fs_count;
> > 	__le32 hs_count;
> > 	//__le32 ss_count;
> > 	struct {
> > 		struct usb_interface_descriptor intf;
> > 		struct usb_endpoint_descriptor_no_audio sink;
> > 		struct usb_endpoint_descriptor_no_audio source;
> > 		struct usb_endpoint_descriptor iso_sink;
> > 	} __attribute__((packed)) fs_descs, hs_descs;
> > 	/*struct {
> > 		struct usb_interface_descriptor intf;
> > 		struct usb_endpoint_descriptor_no_audio sink;
> > 		struct usb_ss_ep_comp_descriptor sink_comp;
> > 		struct usb_endpoint_descriptor_no_audio source;
> > 		struct usb_ss_ep_comp_descriptor source_comp;
> > 	} ss_descs;*/
> > } __attribute__((packed)) descriptors = {
> > 	.header = {
> > 		.magic  = cpu_to_le32(FUNCTIONFS_DESCRIPTORS_MAGIC_V2),
> > 		.length = cpu_to_le32(sizeof descriptors),
> > 		.flags  = cpu_to_le32(FUNCTIONFS_HAS_FS_DESC |
> > 				     FUNCTIONFS_HAS_HS_DESC), // |
> > 				     //FUNCTIONFS_HAS_SS_DESC),
> > 	},
> > 	.fs_count = cpu_to_le32(4),
> > 	.hs_count = cpu_to_le32(4),
> > 	//.ss_count = cpu_to_le32(5),
> > 	.fs_descs = {
> > 		.intf = {
> > 			.bLength = sizeof descriptors.fs_descs.intf,
> > 			.bDescriptorType = USB_DT_INTERFACE,
> > 			.bNumEndpoints = 2,
> 
> This should be 3, not 2.
> 
> Alan Stern
> 

Thanks for catching this. However, that change does not solve the problem. It
seems fs_count and hs_count supercede that number. I never used USB FS but if
I had I probably would have noticed the dropped endpoint.

With the fix you provided I still get "Invalid argument" when attempting to
write the descriptors to ep0. If I change the struct to the _no_audio version
then it works with no other changes.


I appreciate the help, this is something I've been doing on/off for about ~6mo
from the Linux side. Wasted about 2 years with proprietary MCU stuff.

> > 			.bInterfaceClass = USB_CLASS_VENDOR_SPEC,
> > 			.iInterface = 1,
> > 		},
> > 		.sink = {
> > 			.bLength = sizeof descriptors.fs_descs.sink,
> > 			.bDescriptorType = USB_DT_ENDPOINT,
> > 			.bEndpointAddress = 1 | USB_DIR_IN,
> > 			.bmAttributes = USB_ENDPOINT_XFER_BULK,
> > 			/* .wMaxPacketSize = autoconfiguration (kernel) */
> > 		},
> > 		.source = {
> > 			.bLength = sizeof descriptors.fs_descs.source,
> > 			.bDescriptorType = USB_DT_ENDPOINT,
> > 			.bEndpointAddress = 2 | USB_DIR_OUT,
> > 			.bmAttributes = USB_ENDPOINT_XFER_BULK,
> > 			/* .wMaxPacketSize = autoconfiguration (kernel) */
> > 		},
> > 		.iso_sink = {
> > 			.bLength = sizeof descriptors.fs_descs.iso_sink,
> > 			.bDescriptorType = USB_DT_ENDPOINT,
> > 			.bEndpointAddress = 3 | USB_DIR_OUT,
> > 			.bmAttributes = USB_ENDPOINT_XFER_BULK,
> > 		},
> > 	},
> > 	.hs_descs = {
> > 		.intf = {
> > 			.bLength = sizeof descriptors.fs_descs.intf,
> > 			.bDescriptorType = USB_DT_INTERFACE,
> > 			.bNumEndpoints = 3,
> > 			.bInterfaceClass = USB_CLASS_VENDOR_SPEC,
> > 			.iInterface = 1,
> > 		},
> > 		.sink = {
> > 			.bLength = sizeof descriptors.hs_descs.sink,
> > 			.bDescriptorType = USB_DT_ENDPOINT,
> > 			.bEndpointAddress = 1 | USB_DIR_IN,
> > 			.bmAttributes = USB_ENDPOINT_XFER_BULK,
> > 			.wMaxPacketSize = cpu_to_le16(512),
> > 		},
> > 		.source = {
> > 			.bLength = sizeof descriptors.hs_descs.iso_sink,
> > 			.bDescriptorType = USB_DT_ENDPOINT,
> > 			.bEndpointAddress = 2 | USB_DIR_OUT,
> > 			.bmAttributes = USB_ENDPOINT_XFER_BULK,
> > 			.wMaxPacketSize = cpu_to_le16(512),
> > 			.bInterval = 1,
> > 		},
> > 		.iso_sink = {
> > 			.bLength = sizeof descriptors.hs_descs.source,
> > 			.bDescriptorType = USB_DT_ENDPOINT,
> > 			.bEndpointAddress = 3 | USB_DIR_OUT,
> > 			.bmAttributes = USB_ENDPOINT_XFER_BULK,
> > 			.wMaxPacketSize = cpu_to_le16(512),
> > 			.bInterval = 1,
> > 		},
> > 
> > 	},
> > 	/*.ss_descs = {
> > 		.intf = {
> > 			.bLength = sizeof descriptors.fs_descs.intf,
> > 			.bDescriptorType = USB_DT_INTERFACE,
> > 			.bNumEndpoints = 2,
> > 			.bInterfaceClass = USB_CLASS_VENDOR_SPEC,
> > 			.iInterface = 1,
> > 		},
> > 		.sink = {
> > 			.bLength = sizeof descriptors.hs_descs.sink,
> > 			.bDescriptorType = USB_DT_ENDPOINT,
> > 			.bEndpointAddress = 1 | USB_DIR_IN,
> > 			.bmAttributes = USB_ENDPOINT_XFER_BULK,
> > 			.wMaxPacketSize = cpu_to_le16(1024),
> > 		},
> > 		.sink_comp = {
> > 			.bLength = USB_DT_SS_EP_COMP_SIZE,
> > 			.bDescriptorType = USB_DT_SS_ENDPOINT_COMP,
> > 			.bMaxBurst = 0,
> > 			.bmAttributes = 0,
> > 			.wBytesPerInterval = 0,
> > 		},
> > 		.source = {
> > 			.bLength = sizeof descriptors.hs_descs.source,
> > 			.bDescriptorType = USB_DT_ENDPOINT,
> > 			.bEndpointAddress = 2 | USB_DIR_OUT,
> > 			.bmAttributes = USB_ENDPOINT_XFER_BULK,
> > 			.wMaxPacketSize = cpu_to_le16(1024),
> > 			.bInterval = 1,
> > 		},
> > 		.source_comp = {
> > 			.bLength = USB_DT_SS_EP_COMP_SIZE,
> > 			.bDescriptorType = USB_DT_SS_ENDPOINT_COMP,
> > 			.bMaxBurst = 0,
> > 			.bmAttributes = 0,
> > 			.wBytesPerInterval = 0,
> > 		},
> > 	},*/
> > };
> > ```
> > 
> > Cheers!
>
