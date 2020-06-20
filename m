Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9322920212E
	for <lists+linux-usb@lfdr.de>; Sat, 20 Jun 2020 06:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbgFTEE7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 20 Jun 2020 00:04:59 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:59725 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725290AbgFTEE6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 20 Jun 2020 00:04:58 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 6CF63AF3
        for <linux-usb@vger.kernel.org>; Sat, 20 Jun 2020 00:04:57 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Sat, 20 Jun 2020 00:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm2; bh=p32kzwZM0Sjc/uTSI1n2fD0NQM/uFlq8h1ybFbFy0MI=; b=Iz2HhDSf
        tbZl9qt/80H2lNI2xfmhXTFZWexH4XBSHm0aVuPZbZDrcvTyNCpUeMcEe9h/QQSh
        G9lWLklzGKj05KiX14cDlQVMMkx4N8L0hVszkBkT8NBZm7k0OE7CJigVkSgvM9Gz
        orzYoL5+EeWJtW4JR0cDDUwUJvQ3ZMlVxW1BzJ4uArtwHRWcovUp/RGGAtpdkEiR
        VDjbRxsdZ6rFvVfp2u60WWDEUuY8XiD1+Pz5yp+L8ziJipOj9O2teHbqQgt5NqOS
        8/umi3s37Z0tsxKb7g28qeldtVwO5lvAckJXin5pm4ZyRxdegMKOqdQ26LJXcqyR
        PRTGNJhwp+AXoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; bh=p32kzwZM0Sjc/uTSI1n2fD0NQM/uF
        lq8h1ybFbFy0MI=; b=tgejTXjZUrZ8D+WcCSDLlPK2tLryhcbucHYPDRENzQqc3
        pypT9VkOemMOEaUPgdNv/snqPksuFLRTZZAVUSOfTjMwcUVwfSHzBOKGMCtl4lnb
        WyxjFswYkThWmhH+5NL6ssJ5qZZO3R7SYWlYEWaPYeKPZBpiO7MDt/b8QItdyO1b
        eJDQSDbOxzI3HN4RpaU6FDWNlSoVD8ki3orYsKggEy3bt3p4q3LlDPxZSpurbgBI
        hbfD1TqyBL9WthhR8q2UrAASb7LdDKhwaVY6ISvEhRCtFdzvU82fy0b3pZJsz0Ab
        i1elWuWiyDvhN2H2baQLoi8AAkaBucUo5rY/cd9TA==
X-ME-Sender: <xms:6IrtXvsFiWKYbD2JWfsARy4PMkn3SsGCWoybPgbqlcn-XGHaRxMvpQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejjedgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
    erredtnecuhfhrohhmpedfufhiugcuufhprhihfdcuoehsihgusegrvggrmhdruhhsqeen
    ucggtffrrghtthgvrhhnpeeukeehieeuueegvedvjefhieeugfdvkedvuddvgedugfehfe
    evtdegtedvheduteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehsihgusegrvggrmhdruhhs
X-ME-Proxy: <xmx:6IrtXgcqEYWZW9R55xXiHb5mp4YFLyOiq8SaMJThIvV5OgkZYjjZIw>
    <xmx:6IrtXiyH5dvKuGF4-wwRnAHykJdY1RP9UeoFJ5KzR51DucCRMXeJtQ>
    <xmx:6IrtXuOBn-H-zOFn0y8zsyQm2a_j3Rz6d3orfjJWzds2UqJd18W7Yw>
    <xmx:6YrtXteH-w_Lq-lW9R7G78Qoi7FZdKnn-fqDNW17_VyKi1FsWKSIbQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 980B6660069; Sat, 20 Jun 2020 00:04:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-543-gda70334-fm-20200618.004-gda703345
Mime-Version: 1.0
Message-Id: <30d7899b-9723-4698-bec2-aabfeeedde1b@www.fastmail.com>
Date:   Fri, 19 Jun 2020 23:04:31 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     linux-usb@vger.kernel.org
Subject: Unable to use struct usb_endpoint_descriptor in FunctionFS
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello, I've figured out how to get my userspace driver code to enumerate for
the host and send/receive from the device with bulk endpoints as demonstrated
in ffs-test.c. I have successfully added another bulk endpoint, but issues
arise when I try to add an isochronous endpoint.

I've tracked the problem, I think, to the mere presence of the struct
usb_endpoint_descriptor. Is anyone able to elucidate what I might be missing?

The rejected set of descriptors follows. Note I set the usb_endpoint_descriptor
struct to be a bulk endpoint; I expect the extra fields would be ignored.

I can provide the full code if helpful. Superspeed descriptors commented out
as I'm less familiar with USB3 and I found that the fs/hs/ss descriptor sets had
to be equivalent.

```
static const struct {
	struct usb_functionfs_descs_head_v2 header;
	__le32 fs_count;
	__le32 hs_count;
	//__le32 ss_count;
	struct {
		struct usb_interface_descriptor intf;
		struct usb_endpoint_descriptor_no_audio sink;
		struct usb_endpoint_descriptor_no_audio source;
		struct usb_endpoint_descriptor iso_sink;
	} __attribute__((packed)) fs_descs, hs_descs;
	/*struct {
		struct usb_interface_descriptor intf;
		struct usb_endpoint_descriptor_no_audio sink;
		struct usb_ss_ep_comp_descriptor sink_comp;
		struct usb_endpoint_descriptor_no_audio source;
		struct usb_ss_ep_comp_descriptor source_comp;
	} ss_descs;*/
} __attribute__((packed)) descriptors = {
	.header = {
		.magic  = cpu_to_le32(FUNCTIONFS_DESCRIPTORS_MAGIC_V2),
		.length = cpu_to_le32(sizeof descriptors),
		.flags  = cpu_to_le32(FUNCTIONFS_HAS_FS_DESC |
				     FUNCTIONFS_HAS_HS_DESC), // |
				     //FUNCTIONFS_HAS_SS_DESC),
	},
	.fs_count = cpu_to_le32(4),
	.hs_count = cpu_to_le32(4),
	//.ss_count = cpu_to_le32(5),
	.fs_descs = {
		.intf = {
			.bLength = sizeof descriptors.fs_descs.intf,
			.bDescriptorType = USB_DT_INTERFACE,
			.bNumEndpoints = 2,
			.bInterfaceClass = USB_CLASS_VENDOR_SPEC,
			.iInterface = 1,
		},
		.sink = {
			.bLength = sizeof descriptors.fs_descs.sink,
			.bDescriptorType = USB_DT_ENDPOINT,
			.bEndpointAddress = 1 | USB_DIR_IN,
			.bmAttributes = USB_ENDPOINT_XFER_BULK,
			/* .wMaxPacketSize = autoconfiguration (kernel) */
		},
		.source = {
			.bLength = sizeof descriptors.fs_descs.source,
			.bDescriptorType = USB_DT_ENDPOINT,
			.bEndpointAddress = 2 | USB_DIR_OUT,
			.bmAttributes = USB_ENDPOINT_XFER_BULK,
			/* .wMaxPacketSize = autoconfiguration (kernel) */
		},
		.iso_sink = {
			.bLength = sizeof descriptors.fs_descs.iso_sink,
			.bDescriptorType = USB_DT_ENDPOINT,
			.bEndpointAddress = 3 | USB_DIR_OUT,
			.bmAttributes = USB_ENDPOINT_XFER_BULK,
		},
	},
	.hs_descs = {
		.intf = {
			.bLength = sizeof descriptors.fs_descs.intf,
			.bDescriptorType = USB_DT_INTERFACE,
			.bNumEndpoints = 3,
			.bInterfaceClass = USB_CLASS_VENDOR_SPEC,
			.iInterface = 1,
		},
		.sink = {
			.bLength = sizeof descriptors.hs_descs.sink,
			.bDescriptorType = USB_DT_ENDPOINT,
			.bEndpointAddress = 1 | USB_DIR_IN,
			.bmAttributes = USB_ENDPOINT_XFER_BULK,
			.wMaxPacketSize = cpu_to_le16(512),
		},
		.source = {
			.bLength = sizeof descriptors.hs_descs.iso_sink,
			.bDescriptorType = USB_DT_ENDPOINT,
			.bEndpointAddress = 2 | USB_DIR_OUT,
			.bmAttributes = USB_ENDPOINT_XFER_BULK,
			.wMaxPacketSize = cpu_to_le16(512),
			.bInterval = 1,
		},
		.iso_sink = {
			.bLength = sizeof descriptors.hs_descs.source,
			.bDescriptorType = USB_DT_ENDPOINT,
			.bEndpointAddress = 3 | USB_DIR_OUT,
			.bmAttributes = USB_ENDPOINT_XFER_BULK,
			.wMaxPacketSize = cpu_to_le16(512),
			.bInterval = 1,
		},

	},
	/*.ss_descs = {
		.intf = {
			.bLength = sizeof descriptors.fs_descs.intf,
			.bDescriptorType = USB_DT_INTERFACE,
			.bNumEndpoints = 2,
			.bInterfaceClass = USB_CLASS_VENDOR_SPEC,
			.iInterface = 1,
		},
		.sink = {
			.bLength = sizeof descriptors.hs_descs.sink,
			.bDescriptorType = USB_DT_ENDPOINT,
			.bEndpointAddress = 1 | USB_DIR_IN,
			.bmAttributes = USB_ENDPOINT_XFER_BULK,
			.wMaxPacketSize = cpu_to_le16(1024),
		},
		.sink_comp = {
			.bLength = USB_DT_SS_EP_COMP_SIZE,
			.bDescriptorType = USB_DT_SS_ENDPOINT_COMP,
			.bMaxBurst = 0,
			.bmAttributes = 0,
			.wBytesPerInterval = 0,
		},
		.source = {
			.bLength = sizeof descriptors.hs_descs.source,
			.bDescriptorType = USB_DT_ENDPOINT,
			.bEndpointAddress = 2 | USB_DIR_OUT,
			.bmAttributes = USB_ENDPOINT_XFER_BULK,
			.wMaxPacketSize = cpu_to_le16(1024),
			.bInterval = 1,
		},
		.source_comp = {
			.bLength = USB_DT_SS_EP_COMP_SIZE,
			.bDescriptorType = USB_DT_SS_ENDPOINT_COMP,
			.bMaxBurst = 0,
			.bmAttributes = 0,
			.wBytesPerInterval = 0,
		},
	},*/
};
```

Cheers!
