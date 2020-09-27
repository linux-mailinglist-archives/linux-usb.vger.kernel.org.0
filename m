Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E04279DD6
	for <lists+linux-usb@lfdr.de>; Sun, 27 Sep 2020 06:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729580AbgI0EPn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 27 Sep 2020 00:15:43 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:55331 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726478AbgI0EPn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 27 Sep 2020 00:15:43 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 04A8A5C00B5
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2020 00:15:41 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Sun, 27 Sep 2020 00:15:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm2; bh=/bToR40/slqUiL1JQz3Zh+AG1uzNU4lIlBvoz1Zy474=; b=fQtPaaZe
        AK8Sh7zzv9mjBtTegXhDqxcjyaiyl5Zo6dLpqnVQWwB8YaH5h9IJVYgUDgcr4MND
        WbzVLFmm7YCZHwpW5qcr0V65Id5s7lDDlQ4BK0sjufNsZeqMLUUmL5jMl6+ViDcL
        p9gLTLRtt1mj+ZphCfXGs+hDZvHSnx8IIcR9yT8TiBtl8C7WZo6qqjXMUyL3ckxS
        2C1iHya81fvbYT7vsk7/ZYVh3N0uAJT5wJOKwEb/uISBon1xDDUcaIBfbMkZvf+S
        on27evw9QTjRBdOV78PK8ysnbFoQcOjY0ay/dNjry0ysOYf4bSxhBFn6S5EzuQB7
        TpgSwv4w+Dolbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; bh=/bToR40/slqUiL1JQz3Zh+AG1uzNU
        4lIlBvoz1Zy474=; b=lbBR6uvzzPSPHxk2QsacPcn+u/DuHotqR8WbHnmUHAyP/
        9UcuIm/tI0NV5Fltaw5QjrCVaKGAROjo0tzVH0qowd3rwUY1FReChM90BQA2DjNH
        Wmfo/mrjSHWDJpCKcFwFeVACcYPdyMiueFwM145C9U1/CxsyHioL6mUqpNVirpzT
        MuyBgL/wUY+HYHSU2DRD4Rwpy4b07hZ/EBgRrL/0VCXF4dTSbEKm9siItUbmjnQj
        G+73nygLCbojil2+9tQp5WMkSIPQsiuM9hWI53I9sdO3tdNpxeKsFl1AR/UYaAmb
        ds+UQplZ/l9KNFpEDtJo435WUbm8/D3hBsBIZIF7Q==
X-ME-Sender: <xms:7BFwXwRaAXYpTUE1By7uAjJX7466KRp0f91QVrK0eWsvW4di4MU__w>
    <xme:7BFwX9wHGTGVs3f7gHNw7Q8KA6XWhneYfx-jE0EwkEiQN2EfVl0yq8Z9DQKGf6Bhv
    85Ei75C4qlILnrRO-U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefgdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtredtre
    ertdenucfhrhhomhepfdfuihguucfuphhrhidfuceoshhiugesrggvrghmrdhusheqnecu
    ggftrfgrthhtvghrnhepueekheeiueeugeevvdejhfeiuefgvdekvdduvdegudfgheefve
    dtgeetvdehudetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepshhiugesrggvrghmrdhush
X-ME-Proxy: <xmx:7BFwX91Y6GIWA7siCswyQeuObipHYo6F7u5_8aGtjGs2JkcQaCyC3Q>
    <xmx:7BFwX0DQY7PYEB7DaDW9-TdqJtOYlPtDOhNOE1cddr39HWC6CPLDpg>
    <xmx:7BFwX5jv3MXZk8n2F3BjFRTE6_iBizNtzl1CTfFabpRNPMTz-_3qnA>
    <xmx:7BFwX0uB-RdhV1pH-3UxJgxsRlMCYWChdDUssJaa7iuUTyC-ozNdkA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id B2D93660069; Sun, 27 Sep 2020 00:15:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-355-g3ece53b-fm-20200922.004-g3ece53b9
Mime-Version: 1.0
Message-Id: <54175190-847e-41ae-a37b-b66c24e5a4d1@www.fastmail.com>
Date:   Sat, 26 Sep 2020 23:15:20 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     linux-usb@vger.kernel.org
Subject: Invalid FunctionFS USB Superspeed Descriptors
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello again, I realize this is partially spec help, my apologies. I'm not aware of a better
place to potentially ask for guidance.

Interesting to note is that Windows fails to enumerate but Linux falls back to USB2.
On Windows, enumeration fails early enough I get no useful message.

The code is in Rust. If that is problematic I can rewrite it, but it is very close to C. The
USB HS descriptors work just fine. I suspect I have made a mistake in the companion
descriptors. It is hard to find good isochronous examples.

Thanks in advance.

-------

#[derive(Debug)]
#[repr(C, packed)]
pub struct usb_functionfs_ep_descs {
    intf: usb_interface_descriptor,
    sink: usb_endpoint_descriptor,
    source: usb_endpoint_descriptor,
    intf_alt1: usb_interface_descriptor,
    isoc_sink: usb_endpoint_descriptor,
    isoc_source: usb_endpoint_descriptor,
}

// Per example this is not packed.
#[derive(Debug)]
pub struct usb_functionfs_ss_ep_descs {
    intf: usb_interface_descriptor,
    sink: usb_endpoint_descriptor,
    sink_comp: usb_ss_ep_comp_descriptor,
    source: usb_endpoint_descriptor,
    source_comp: usb_ss_ep_comp_descriptor,
    intf_alt1: usb_interface_descriptor,
    isoc_sink: usb_endpoint_descriptor,
    isoc_sink_comp: usb_ss_ep_comp_descriptor,
    isoc_source: usb_endpoint_descriptor,
    isoc_source_comp: usb_ss_ep_comp_descriptor,
}

#[derive(Debug)]
#[repr(C, packed)]
pub struct usb_functionfs_descriptors {
    header: usb_functionfs_descs_head_v2,
    fs_count: u32,
    hs_count: u32,
    ss_count: u32,
    fs_descs: usb_functionfs_ep_descs,
    hs_descs: usb_functionfs_ep_descs,
    ss_descs: usb_functionfs_ss_ep_descs,
}

pub const fn descriptors() -> usb_functionfs_descriptors {
    usb_functionfs_descriptors {
        header: usb_functionfs_descs_head_v2 {
            magic: FUNCTIONFS_DESCRIPTORS_MAGIC_V2.to_le(),
            flags: (functionfs_flags_FUNCTIONFS_HAS_FS_DESC |
                    functionfs_flags_FUNCTIONFS_HAS_HS_DESC |
                    functionfs_flags_FUNCTIONFS_HAS_SS_DESC).to_le(),
            length: (mem::size_of::<usb_functionfs_descriptors>() as u32).to_le(),
        },
        fs_count: 6u32.to_le(),
        hs_count: 6u32.to_le(),
        ss_count: 10u32.to_le(),
        fs_descs: usb_functionfs_ep_descs {
            intf: usb_interface_descriptor {
                bLength: mem::size_of::<usb_interface_descriptor>() as u8,
                bDescriptorType: USB_DT_INTERFACE as u8,
                bInterfaceNumber: 0,
                bAlternateSetting: 0,
                bNumEndpoints: 2,
                bInterfaceClass: USB_CLASS_VENDOR_SPEC as u8,
                bInterfaceSubClass: 0,
                bInterfaceProtocol: 0,
                iInterface: 1,
            },
            sink: usb_endpoint_descriptor {
                bLength: mem::size_of::<usb_endpoint_descriptor>() as u8,
                bDescriptorType: USB_DT_ENDPOINT as u8,
                bEndpointAddress: 1 | USB_DIR_IN as u8,
                bmAttributes: USB_ENDPOINT_XFER_BULK as u8,
                wMaxPacketSize: 0,
                bInterval: 0,
                bRefresh: 0,
                bSynchAddress: 0,
            },
            source: usb_endpoint_descriptor {
                bLength: mem::size_of::<usb_endpoint_descriptor>() as u8,
                bDescriptorType: USB_DT_ENDPOINT as u8,
                bEndpointAddress: 2 | USB_DIR_OUT as u8,
                bmAttributes: USB_ENDPOINT_XFER_BULK as u8,
                wMaxPacketSize: 0,
                bInterval: 0,
                bRefresh: 0,
                bSynchAddress: 0,
            },
            intf_alt1: usb_interface_descriptor {
                bLength: mem::size_of::<usb_interface_descriptor>() as u8,
                bDescriptorType: USB_DT_INTERFACE as u8,
                bInterfaceNumber: 1,
                bAlternateSetting: 1,
                bNumEndpoints: 2,
                bInterfaceClass: USB_CLASS_VENDOR_SPEC as u8,
                bInterfaceSubClass: 0,
                bInterfaceProtocol: 0,
                iInterface: 2,
            },
            isoc_sink: usb_endpoint_descriptor {
                bLength: mem::size_of::<usb_endpoint_descriptor>() as u8,
                bDescriptorType: USB_DT_ENDPOINT as u8,
                bEndpointAddress: 3 | USB_DIR_IN as u8,
                bmAttributes: (USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC | USB_ENDPOINT_USAGE_DATA) as u8,
                wMaxPacketSize: 256u16.to_le(),
                bInterval: 1,
                bRefresh: 0,
                bSynchAddress: 0,
            },
            isoc_source: usb_endpoint_descriptor {
                bLength: mem::size_of::<usb_endpoint_descriptor>() as u8,
                bDescriptorType: USB_DT_ENDPOINT as u8,
                bEndpointAddress: 4 | USB_DIR_OUT as u8,
                bmAttributes: (USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC | USB_ENDPOINT_USAGE_DATA) as u8,
                wMaxPacketSize: 256u16.to_le(),
                bInterval: 1,
                bRefresh: 0,
                bSynchAddress: 0,
            },
        },
        hs_descs: usb_functionfs_ep_descs {
            intf: usb_interface_descriptor {
                bLength: mem::size_of::<usb_interface_descriptor>() as u8,
                bDescriptorType: USB_DT_INTERFACE as u8,
                bInterfaceNumber: 0,
                bAlternateSetting: 0,
                bNumEndpoints: 4,
                bInterfaceClass: USB_CLASS_VENDOR_SPEC as u8,
                bInterfaceSubClass: 0,
                bInterfaceProtocol: 0,
                iInterface: 1,
            },
            sink: usb_endpoint_descriptor {
                bLength: mem::size_of::<usb_endpoint_descriptor>() as u8,
                bDescriptorType: USB_DT_ENDPOINT as u8,
                bEndpointAddress: 1 | USB_DIR_IN as u8,
                bmAttributes: USB_ENDPOINT_XFER_BULK as u8,
                wMaxPacketSize: 512u16.to_le(),
                bInterval: 0,
                bRefresh: 0,
                bSynchAddress: 0,
            },
            source: usb_endpoint_descriptor {
                bLength: mem::size_of::<usb_endpoint_descriptor>() as u8,
                bDescriptorType: USB_DT_ENDPOINT as u8,
                bEndpointAddress: 2 | USB_DIR_OUT as u8,
                bmAttributes: USB_ENDPOINT_XFER_BULK as u8,
                wMaxPacketSize: 512u16.to_le(),
                bInterval: 1,
                bRefresh: 0,
                bSynchAddress: 0,
            },
            intf_alt1: usb_interface_descriptor {
                bLength: mem::size_of::<usb_interface_descriptor>() as u8,
                bDescriptorType: USB_DT_INTERFACE as u8,
                bInterfaceNumber: 1,
                bAlternateSetting: 1,
                bNumEndpoints: 2,
                bInterfaceClass: USB_CLASS_VENDOR_SPEC as u8,
                bInterfaceSubClass: 0,
                bInterfaceProtocol: 0,
                iInterface: 2,
            },
            isoc_sink: usb_endpoint_descriptor {
                bLength: mem::size_of::<usb_endpoint_descriptor>() as u8,
                bDescriptorType: USB_DT_ENDPOINT as u8,
                bEndpointAddress: 3 | USB_DIR_IN as u8,
                bmAttributes: (USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC | USB_ENDPOINT_USAGE_DATA) as u8,
                wMaxPacketSize: 256u16.to_le(),
                bInterval: 1,
                bRefresh: 0,
                bSynchAddress: 0,
            },
            isoc_source: usb_endpoint_descriptor {
                bLength: mem::size_of::<usb_endpoint_descriptor>() as u8,
                bDescriptorType: USB_DT_ENDPOINT as u8,
                bEndpointAddress: 4 | USB_DIR_OUT as u8,
                bmAttributes: (USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC | USB_ENDPOINT_USAGE_DATA) as u8,
                wMaxPacketSize: 256u16.to_le(),
                bInterval: 1,
                bRefresh: 0,
                bSynchAddress: 0,
            },
        },
        ss_descs: usb_functionfs_ss_ep_descs {
            intf: usb_interface_descriptor {
                bLength: mem::size_of::<usb_interface_descriptor>() as u8,
                bDescriptorType: USB_DT_INTERFACE as u8,
                bInterfaceNumber: 0,
                bAlternateSetting: 0,
                bNumEndpoints: 4,
                bInterfaceClass: USB_CLASS_VENDOR_SPEC as u8,
                bInterfaceSubClass: 0,
                bInterfaceProtocol: 0,
                iInterface: 1,
            },
            sink: usb_endpoint_descriptor {
                bLength: mem::size_of::<usb_endpoint_descriptor>() as u8,
                bDescriptorType: USB_DT_ENDPOINT as u8,
                bEndpointAddress: 1 | USB_DIR_IN as u8,
                bmAttributes: USB_ENDPOINT_XFER_BULK as u8,
                wMaxPacketSize: 1024u16.to_le(),
                bInterval: 0,
                bRefresh: 0,
                bSynchAddress: 0,
            },
            sink_comp: usb_ss_ep_comp_descriptor {
                bLength: USB_DT_SS_EP_COMP_SIZE as u8,
                bDescriptorType: USB_DT_SS_ENDPOINT_COMP as u8,
                bMaxBurst: 0,
                bmAttributes: 0,
                wBytesPerInterval: 0,
            },
            source: usb_endpoint_descriptor {
                bLength: mem::size_of::<usb_endpoint_descriptor>() as u8,
                bDescriptorType: USB_DT_ENDPOINT as u8,
                bEndpointAddress: 2 | USB_DIR_OUT as u8,
                bmAttributes: USB_ENDPOINT_XFER_BULK as u8,
                wMaxPacketSize: 1024u16.to_le(),
                bInterval: 1,
                bRefresh: 0,
                bSynchAddress: 0,
            },
            source_comp: usb_ss_ep_comp_descriptor {
                bLength: USB_DT_SS_EP_COMP_SIZE as u8,
                bDescriptorType: USB_DT_SS_ENDPOINT_COMP as u8,
                bMaxBurst: 0,
                bmAttributes: 0,
                wBytesPerInterval: 0,
            },
            intf_alt1: usb_interface_descriptor {
                bLength: mem::size_of::<usb_interface_descriptor>() as u8,
                bDescriptorType: USB_DT_INTERFACE as u8,
                bInterfaceNumber: 1,
                bAlternateSetting: 1,
                bNumEndpoints: 2,
                bInterfaceClass: USB_CLASS_VENDOR_SPEC as u8,
                bInterfaceSubClass: 0,
                bInterfaceProtocol: 0,
                iInterface: 2,
            },
            isoc_sink: usb_endpoint_descriptor {
                bLength: mem::size_of::<usb_endpoint_descriptor>() as u8,
                bDescriptorType: USB_DT_ENDPOINT as u8,
                bEndpointAddress: 3 | USB_DIR_IN as u8,
                bmAttributes: (USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC | USB_ENDPOINT_USAGE_DATA) as u8,
                wMaxPacketSize: 256u16.to_le(),
                bInterval: 1,
                bRefresh: 0,
                bSynchAddress: 0,
            },
            isoc_sink_comp: usb_ss_ep_comp_descriptor {
                bLength: USB_DT_SS_EP_COMP_SIZE as u8,
                bDescriptorType: USB_DT_SS_ENDPOINT_COMP as u8,
                bMaxBurst: 0,
                bmAttributes: 0,
                wBytesPerInterval: 0,
            },
            isoc_source: usb_endpoint_descriptor {
                bLength: mem::size_of::<usb_endpoint_descriptor>() as u8,
                bDescriptorType: USB_DT_ENDPOINT as u8,
                bEndpointAddress: 4 | USB_DIR_OUT as u8,
                bmAttributes: (USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC | USB_ENDPOINT_USAGE_DATA) as u8,
                wMaxPacketSize: 256u16.to_le(),
                bInterval: 1,
                bRefresh: 0,
                bSynchAddress: 0,
            },
            isoc_source_comp: usb_ss_ep_comp_descriptor {
                bLength: USB_DT_SS_EP_COMP_SIZE as u8,
                bDescriptorType: USB_DT_SS_ENDPOINT_COMP as u8,
                bMaxBurst: 0,
                bmAttributes: 0,
                wBytesPerInterval: 0,
            },
        },
    }
}
