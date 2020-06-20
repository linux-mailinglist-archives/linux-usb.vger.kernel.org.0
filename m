Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C1420241C
	for <lists+linux-usb@lfdr.de>; Sat, 20 Jun 2020 16:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbgFTOYC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 20 Jun 2020 10:24:02 -0400
Received: from netrider.rowland.org ([192.131.102.5]:59803 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728181AbgFTOYB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 20 Jun 2020 10:24:01 -0400
Received: (qmail 82359 invoked by uid 1000); 20 Jun 2020 10:24:00 -0400
Date:   Sat, 20 Jun 2020 10:24:00 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sid Spry <sid@aeam.us>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Unable to use struct usb_endpoint_descriptor in FunctionFS
Message-ID: <20200620142400.GA82155@rowland.harvard.edu>
References: <30d7899b-9723-4698-bec2-aabfeeedde1b@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30d7899b-9723-4698-bec2-aabfeeedde1b@www.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 19, 2020 at 11:04:31PM -0500, Sid Spry wrote:
> Hello, I've figured out how to get my userspace driver code to enumerate for
> the host and send/receive from the device with bulk endpoints as demonstrated
> in ffs-test.c. I have successfully added another bulk endpoint, but issues
> arise when I try to add an isochronous endpoint.
> 
> I've tracked the problem, I think, to the mere presence of the struct
> usb_endpoint_descriptor. Is anyone able to elucidate what I might be missing?
> 
> The rejected set of descriptors follows. Note I set the usb_endpoint_descriptor
> struct to be a bulk endpoint; I expect the extra fields would be ignored.
> 
> I can provide the full code if helpful. Superspeed descriptors commented out
> as I'm less familiar with USB3 and I found that the fs/hs/ss descriptor sets had
> to be equivalent.
> 
> ```
> static const struct {
> 	struct usb_functionfs_descs_head_v2 header;
> 	__le32 fs_count;
> 	__le32 hs_count;
> 	//__le32 ss_count;
> 	struct {
> 		struct usb_interface_descriptor intf;
> 		struct usb_endpoint_descriptor_no_audio sink;
> 		struct usb_endpoint_descriptor_no_audio source;
> 		struct usb_endpoint_descriptor iso_sink;
> 	} __attribute__((packed)) fs_descs, hs_descs;
> 	/*struct {
> 		struct usb_interface_descriptor intf;
> 		struct usb_endpoint_descriptor_no_audio sink;
> 		struct usb_ss_ep_comp_descriptor sink_comp;
> 		struct usb_endpoint_descriptor_no_audio source;
> 		struct usb_ss_ep_comp_descriptor source_comp;
> 	} ss_descs;*/
> } __attribute__((packed)) descriptors = {
> 	.header = {
> 		.magic  = cpu_to_le32(FUNCTIONFS_DESCRIPTORS_MAGIC_V2),
> 		.length = cpu_to_le32(sizeof descriptors),
> 		.flags  = cpu_to_le32(FUNCTIONFS_HAS_FS_DESC |
> 				     FUNCTIONFS_HAS_HS_DESC), // |
> 				     //FUNCTIONFS_HAS_SS_DESC),
> 	},
> 	.fs_count = cpu_to_le32(4),
> 	.hs_count = cpu_to_le32(4),
> 	//.ss_count = cpu_to_le32(5),
> 	.fs_descs = {
> 		.intf = {
> 			.bLength = sizeof descriptors.fs_descs.intf,
> 			.bDescriptorType = USB_DT_INTERFACE,
> 			.bNumEndpoints = 2,

This should be 3, not 2.

Alan Stern

> 			.bInterfaceClass = USB_CLASS_VENDOR_SPEC,
> 			.iInterface = 1,
> 		},
> 		.sink = {
> 			.bLength = sizeof descriptors.fs_descs.sink,
> 			.bDescriptorType = USB_DT_ENDPOINT,
> 			.bEndpointAddress = 1 | USB_DIR_IN,
> 			.bmAttributes = USB_ENDPOINT_XFER_BULK,
> 			/* .wMaxPacketSize = autoconfiguration (kernel) */
> 		},
> 		.source = {
> 			.bLength = sizeof descriptors.fs_descs.source,
> 			.bDescriptorType = USB_DT_ENDPOINT,
> 			.bEndpointAddress = 2 | USB_DIR_OUT,
> 			.bmAttributes = USB_ENDPOINT_XFER_BULK,
> 			/* .wMaxPacketSize = autoconfiguration (kernel) */
> 		},
> 		.iso_sink = {
> 			.bLength = sizeof descriptors.fs_descs.iso_sink,
> 			.bDescriptorType = USB_DT_ENDPOINT,
> 			.bEndpointAddress = 3 | USB_DIR_OUT,
> 			.bmAttributes = USB_ENDPOINT_XFER_BULK,
> 		},
> 	},
> 	.hs_descs = {
> 		.intf = {
> 			.bLength = sizeof descriptors.fs_descs.intf,
> 			.bDescriptorType = USB_DT_INTERFACE,
> 			.bNumEndpoints = 3,
> 			.bInterfaceClass = USB_CLASS_VENDOR_SPEC,
> 			.iInterface = 1,
> 		},
> 		.sink = {
> 			.bLength = sizeof descriptors.hs_descs.sink,
> 			.bDescriptorType = USB_DT_ENDPOINT,
> 			.bEndpointAddress = 1 | USB_DIR_IN,
> 			.bmAttributes = USB_ENDPOINT_XFER_BULK,
> 			.wMaxPacketSize = cpu_to_le16(512),
> 		},
> 		.source = {
> 			.bLength = sizeof descriptors.hs_descs.iso_sink,
> 			.bDescriptorType = USB_DT_ENDPOINT,
> 			.bEndpointAddress = 2 | USB_DIR_OUT,
> 			.bmAttributes = USB_ENDPOINT_XFER_BULK,
> 			.wMaxPacketSize = cpu_to_le16(512),
> 			.bInterval = 1,
> 		},
> 		.iso_sink = {
> 			.bLength = sizeof descriptors.hs_descs.source,
> 			.bDescriptorType = USB_DT_ENDPOINT,
> 			.bEndpointAddress = 3 | USB_DIR_OUT,
> 			.bmAttributes = USB_ENDPOINT_XFER_BULK,
> 			.wMaxPacketSize = cpu_to_le16(512),
> 			.bInterval = 1,
> 		},
> 
> 	},
> 	/*.ss_descs = {
> 		.intf = {
> 			.bLength = sizeof descriptors.fs_descs.intf,
> 			.bDescriptorType = USB_DT_INTERFACE,
> 			.bNumEndpoints = 2,
> 			.bInterfaceClass = USB_CLASS_VENDOR_SPEC,
> 			.iInterface = 1,
> 		},
> 		.sink = {
> 			.bLength = sizeof descriptors.hs_descs.sink,
> 			.bDescriptorType = USB_DT_ENDPOINT,
> 			.bEndpointAddress = 1 | USB_DIR_IN,
> 			.bmAttributes = USB_ENDPOINT_XFER_BULK,
> 			.wMaxPacketSize = cpu_to_le16(1024),
> 		},
> 		.sink_comp = {
> 			.bLength = USB_DT_SS_EP_COMP_SIZE,
> 			.bDescriptorType = USB_DT_SS_ENDPOINT_COMP,
> 			.bMaxBurst = 0,
> 			.bmAttributes = 0,
> 			.wBytesPerInterval = 0,
> 		},
> 		.source = {
> 			.bLength = sizeof descriptors.hs_descs.source,
> 			.bDescriptorType = USB_DT_ENDPOINT,
> 			.bEndpointAddress = 2 | USB_DIR_OUT,
> 			.bmAttributes = USB_ENDPOINT_XFER_BULK,
> 			.wMaxPacketSize = cpu_to_le16(1024),
> 			.bInterval = 1,
> 		},
> 		.source_comp = {
> 			.bLength = USB_DT_SS_EP_COMP_SIZE,
> 			.bDescriptorType = USB_DT_SS_ENDPOINT_COMP,
> 			.bMaxBurst = 0,
> 			.bmAttributes = 0,
> 			.wBytesPerInterval = 0,
> 		},
> 	},*/
> };
> ```
> 
> Cheers!
