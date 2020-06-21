Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E432E202832
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jun 2020 05:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729261AbgFUDjB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 20 Jun 2020 23:39:01 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:40001 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729259AbgFUDjB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 20 Jun 2020 23:39:01 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 28EBA427
        for <linux-usb@vger.kernel.org>; Sat, 20 Jun 2020 23:39:00 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Sat, 20 Jun 2020 23:39:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm2; bh=01VDVH+M6YGjgEx0xqUzkbHT/PeCbEGeyWIHDynTHIs=; b=daLC7z8e
        sggSubKVgBFmdkWhj9aq6V3EUswPyvFx6VJLmPNCDUnlgC9ZCWw57DJ8KUajVC+W
        uUpYO/fWElmD5Wx+/9nyNaoACJP4mVLoRjkVbgBbzT0I30yfk6Qpxk4bURNSa/YL
        ASL1sFkj7Nu0/7rwwXj9H6s2TfthqK2z/IeDd+rohUCRp8QLt2lCCOBFBAQHu/zZ
        ZAfSQFS7mMF2GR2Kzt2cjyYRMicToI7rhYwirG2mEXiVy/CWTkDJfpQooKI3vJhH
        mUemtcnQzshF50WC/II6L1dcMY0Ds5YH8qDwh/ujvGicA5jRkJ3Moncgkh3LVOEq
        5CCwKsCMdLFPQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; bh=01VDVH+M6YGjgEx0xqUzkbHT/PeCb
        EGeyWIHDynTHIs=; b=rtyWjch4u9i1SECmRJXxsV6FITF0/h/c5KbPzn9h4K5j5
        AOrRNELGzHxYnIreiir1GyymKGAoPtSgDKnQ6KQpzeforXDew5gGNkHOkNBYbQG1
        0I3iIMsDdfQIyu8RMOnkHtDWjc2xGRDsV+yYkjfTPmKh7knGsYCU/RoL0IsBI3CN
        pOW4ZPpx9VsxusB/uF3kZ5rYd7aYgaNjNqjKtdgG096n8E3Yw8JaED38MPkU0GTB
        a5zQgKZqTjrKKZefXfBoABJM5NGcCUYlj6eVLyFwVV+CyrNqjzb1rH3OJJHH+JBq
        xDO06oHMqyY5hEKU/Ci1KGbR87j4JhcHdm18B6Www==
X-ME-Sender: <xms:U9buXhaHKXIJVslObAqfLR3vWlQzIW7cPdUaXdSaY3ugj04c8Cz9GQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejledgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
    erredtnecuhfhrohhmpedfufhiugcuufhprhihfdcuoehsihgusegrvggrmhdruhhsqeen
    ucggtffrrghtthgvrhhnpeeukeehieeuueegvedvjefhieeugfdvkedvuddvgedugfehfe
    evtdegtedvheduteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehsihgusegrvggrmhdruhhs
X-ME-Proxy: <xmx:U9buXoZkSs-L9Sar8oHMYFYt79CfO8wodfemydj0hXn1s5Q5RxGUcA>
    <xmx:U9buXj-J5e-QzaEAYLhRY9QaZgHbMd8e5DaihV5YpOANI-qAWWLqLA>
    <xmx:U9buXvp1Actt95XrjKbBmO8anCGzsHMDc1exznU9Xz49HXEammgFvQ>
    <xmx:U9buXl5GBY7MOHJHjndKjZKjLtGn2ZNWwtjNQlNQBsRKlNVYb_BiuA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 4AE1A66007E; Sat, 20 Jun 2020 23:38:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-543-gda70334-fm-20200618.004-gda703345
Mime-Version: 1.0
Message-Id: <dc61359f-2a04-4590-9ac9-81b4f6e8d3b8@www.fastmail.com>
Date:   Sat, 20 Jun 2020 22:38:33 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     linux-usb@vger.kernel.org
Subject: Unable to Use Isochronous Behavior w/ Isoc Endpoint in FunctionFC
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello again, I didn't expect to post so quickly but was able to get quite a bit
of testing done.

All calls to write(2) on the device are blocking. This means data is only
transmitted after it has been received. Data should be transmitted continuously
as long as it does not exceed the allocated bandwidth. My test is as follows:

Device:
```
uint8_t pole = 0;
while (true) {
	int rc = write(fd, (void *)&pole, sizeof pole);
	pole++;
}
```

Host (with pyusb):
```
import usb
ds = [d for d in usb.core.find(find_all=True,
	idVendor=0x1d6b, idProduct=0x0104)]
ds[0].read(0x82, 1) # Up arrow enter as necessary.
```
(The library transparently calls the proper read type.)

When read I always receive the series of incremented numbers. I expect to read
more or less random numbers as unreceived writes are dropped. That I always
read incremented contiguous numbers indicates to me that no writes device-side
are dropped.

I have attempted to set the endpoint filehandle nonblocking. This works before
the UDC is bound but after it is bound or the first write the nonblocking
behavior is removed and resetting it inside the write loop seems to have no
effect.

In the full program the write loop is delayed by a timerfd so that I can more
easily inspect the host code paths for behavior when reads occur too quickly.
After the UDC is bound the timer is no longer the limiting factor in the speed
of the write loop.

When I was using a repurposed audio device I had to set an alternate mode. Is
that related to the issue here? The alternate mode seems to be a relic of the
descriptor layout before I dropped the device class and substituted my own
driver. The current descriptors specify no alternate modes.

Below are the descriptors I am using. I set USB_ENDPOINT_SYNC_ASYNC on the two
isochronous endpoints. This did not change the behavior of the endpoints.

```
static const struct {
	struct usb_functionfs_descs_head_v2 header;
	__le32 fs_count;
	__le32 hs_count;
	//__le32 ss_count;
	struct {
		struct usb_interface_descriptor intf;
		struct usb_endpoint_descriptor sink;
		struct usb_endpoint_descriptor source;
		struct usb_endpoint_descriptor iso_sink;
		struct usb_endpoint_descriptor iso_source;
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
	.fs_count = cpu_to_le32(5),
	.hs_count = cpu_to_le32(5),
	//.ss_count = cpu_to_le32(5),
	.fs_descs = {
		.intf = {
			.bLength = sizeof descriptors.fs_descs.intf,
			.bDescriptorType = USB_DT_INTERFACE,
			.bNumEndpoints = 4,
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
			.bEndpointAddress = 3 | USB_DIR_IN,
			.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
		},
		.iso_source = {
			.bLength = sizeof descriptors.fs_descs.iso_source,
			.bDescriptorType = USB_DT_ENDPOINT,
			.bEndpointAddress = 4 | USB_DIR_OUT,
			.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
		},
	},
	.hs_descs = {
		.intf = {
			.bLength = sizeof descriptors.fs_descs.intf,
			.bDescriptorType = USB_DT_INTERFACE,
			.bNumEndpoints = 4,
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
			.bEndpointAddress = 3 | USB_DIR_IN,
			.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
			.wMaxPacketSize = cpu_to_le16(512),
			.bInterval = 1,
		},
		.iso_source = {
			.bLength = sizeof descriptors.hs_descs.source,
			.bDescriptorType = USB_DT_ENDPOINT,
			.bEndpointAddress = 4 | USB_DIR_OUT,
			.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
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

I have a more fully-featured reading example that uses libusb directly but it
too does not work. The library prints:

```
libusb: warning [submit_iso_transfer] submiturb failed, transfer too large
```

Though I am quite sure I have not exceeded the size. Setting it lower does not
seem to help.
