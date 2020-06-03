Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C916D1EC81B
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jun 2020 05:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbgFCD46 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jun 2020 23:56:58 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:54151 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725924AbgFCD46 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jun 2020 23:56:58 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id DE9C85C008F
        for <linux-usb@vger.kernel.org>; Tue,  2 Jun 2020 23:56:56 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Tue, 02 Jun 2020 23:56:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm1; bh=3+lPvQKPU5P1Sg/wadT8POjH7ciSkU0pMc1K4mQN79s=; b=fThwslQw
        2Ga4o1GU6pVvEYO85Z5KO2VA3+w6hC56LG7QeLtPuSAqYXsTXCH2LhZfFu28CDUG
        XIVJ1rhhyFi9bry8XBPZAhDEB1ljBLUdzxFifASyjAV2mtHC13CFSfGWtkrioxsv
        y11qhMv0sQVfF/548asVYd46A4OdojvGScGUe3MJ1387ieze/ZGPtEkynFdKu02d
        Z/wdbeNiCVM7eyr14dTHP6oeUKEaN/wUXyIKpSDRhXHopd5eEf+JJueEmtTt8i22
        Jj9pCIuNYs33WgXdgYIqomHPW+nrO9SaaOa4qjoXh4qcjjjkiM9LysYzR2MIM6sj
        dPO2n8jBmIpJIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm2; bh=3+lPvQKPU5P1Sg/wadT8POjH7ciSk
        U0pMc1K4mQN79s=; b=WN0LmVNxnY012vgWeWzDmnsYsU07lyFztnf/b5ydamm6j
        i9sjDptgJW3KYgV71/PDbTP008Hm1ODhyNCZyYlF6aYygamOPLiFIIJDb2994kKo
        dFXsMDueTukpXVYB2NTdUmAhjiuWc72rkFZ5iHv+hSHTyqsE/sPIBxHibEd6yNXv
        7mRQ62GoN+/ZxDdas2VBrT5H9irWMHVAG+aFgpmPuzDYrQ4rgNatQ8E2OeB0DBBQ
        zKyCwXLUVkvOQwpxuJYt2rOPd7zJl/E0sBRSkhs3uQjsHPNDcCSqNqMmyhlF6pkH
        z3wvKdUvuHbFokDtMjm+oAfjV1WaLrYxGakATsxKw==
X-ME-Sender: <xms:iB_XXmkwuC2BPeO-rBKcRRo473BMqJ1nIFDCNoVqrcC21aGgCRxwHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefkedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
    erredtnecuhfhrohhmpedfufhiugcuufhprhihfdcuoehsihgusegrvggrmhdruhhsqeen
    ucggtffrrghtthgvrhhnpeeukeehieeuueegvedvjefhieeugfdvkedvuddvgedugfehfe
    evtdegtedvheduteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehsihgusegrvggrmhdruhhs
X-ME-Proxy: <xmx:iB_XXt0OrekdFXuGOtLHXHb-uGOzC_zXJkLL7BEcA7OS-sGTY1Xs-A>
    <xmx:iB_XXko6Jku65YP-sjOINNeQgquXHET54MrVsJWIkIwzlO7SWNN4yA>
    <xmx:iB_XXqm5wISVupDQb4BsfQCRRs2Wo7REDH-LMvKrDvJbY1bXQDRYfA>
    <xmx:iB_XXv216tj_eKAtU2HcEZPzibTMVeEAf50NYPlBZgNXz9IvkzRHBA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 7056766007E; Tue,  2 Jun 2020 23:56:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <25211601-1c39-4e08-86a4-0a49d7728a91@www.fastmail.com>
Date:   Tue, 02 Jun 2020 22:55:47 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     linux-usb@vger.kernel.org
Subject: Issues Writing Endpoint Descriptors to ep0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, the saga continues. To start, I need to ask if everything has to be set up before trying to bind the UDC. From my reading the answer is *no* but the endpoints and strings need to be written to ep0.

I get to the point the descriptors are taken with no error, as well as the strings. The usb0 device shows up for the ncm function on device. However attempting to bind the UDC fails with an IO error, and the host doesn't see a new network device.

I would expect to see my device and potentially be able to enumerate the extra endpoints but be unable to actually do anything with them, potentially crashing the kernel on the device if I tried to send data.

I'd also like to know: if I half configure or misconfigure the gadget driver can I do a soft reset? Can I do a harder reset by unloading the driver? Do I need to reboot? I can't actually tell, for now it seems like I can continue trying to configure the device but now that I am writing endpoint descriptors I think I need some kind of reset if I mess up.

I apologize for the frequent messages, but I don't have a ton of expertise in this area of the kernel. As I stated earlier I'm trying to migrate from a microcontroller to something that isn't a huge waste of time to program.

```
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>

#include <linux/usb/functionfs.h>
#include <linux/usb/ch9.h>
#include <usbg/usbg.h>

// TODO: Use the "scheme" format for libusbgx.
// Dependency for systemd is sys-kernel-config.mount (usually?).
#define VENDOR  0x1d6b
#define PRODUCT 0x0104

#if __BYTE_ORDER == __LITTLE_ENDIAN
#define cpu_to_le16(x)  (x)
#define cpu_to_le32(x)  (x)
#else
#define cpu_to_le16(x)  ((((x) >> 8) & 0xffu) | (((x) & 0xffu) << 8))
#define cpu_to_le32(x)  \
        ((((x) & 0xff000000u) >> 24) | (((x) & 0x00ff0000u) >>  8) | \
        (((x) & 0x0000ff00u) <<  8) | (((x) & 0x000000ffu) << 24))
#endif

static const struct {
        struct usb_functionfs_descs_head_v2 header;
        __le32 fs_count;
        __le32 hs_count;
        //__le32 ss_count;
        struct {
                struct usb_interface_descriptor intf;
                struct usb_endpoint_descriptor_no_audio sink;
                struct usb_endpoint_descriptor_no_audio source;
        } __attribute__((packed)) fs_descs, hs_descs;
} __attribute__((packed)) descriptors = {
        .header = {
                .magic  = cpu_to_le32(FUNCTIONFS_DESCRIPTORS_MAGIC_V2),
                .length = cpu_to_le32(sizeof descriptors),
                .flags  = cpu_to_le32(FUNCTIONFS_HAS_FS_DESC |
                                                         FUNCTIONFS_HAS_HS_DESC),
        },
        .fs_count = cpu_to_le32(3), // In the C example these are in other order.
        .hs_count = cpu_to_le32(3),
        //.ss_count = cpu_to_le32(0), // Should this be present if no SS?
        .fs_descs = {
                .intf = {
                        .bLength = sizeof descriptors.fs_descs.intf,
                        .bDescriptorType = USB_DT_INTERFACE,
                        .bNumEndpoints = 2,
                        .bInterfaceClass = USB_CLASS_VENDOR_SPEC,
                        .iInterface = 1
                },
                .sink = {
                        .bLength = sizeof descriptors.fs_descs.sink,
                        .bDescriptorType = USB_DT_ENDPOINT,
                        .bEndpointAddress = 1 | USB_DIR_IN,
                        .bmAttributes = USB_ENDPOINT_XFER_BULK,
                },
                .source = {
                        .bLength = sizeof descriptors.fs_descs.source,
                        .bDescriptorType = USB_DT_ENDPOINT,
                        .bEndpointAddress = 2 | USB_DIR_OUT,
                        .bmAttributes = USB_ENDPOINT_XFER_BULK,
                }
        },
        .hs_descs = {
                .intf = {
                        .bLength = sizeof descriptors.hs_descs.intf, // Ex. uses fs_descs.
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
                        .wMaxPacketSize = cpu_to_le32(512),
                },
                .source = {
                        .bLength = sizeof descriptors.hs_descs.source,
                        .bDescriptorType = USB_DT_ENDPOINT,
                        .bEndpointAddress = 2 | USB_DIR_OUT,
                        .bmAttributes = USB_ENDPOINT_XFER_BULK,
                        .wMaxPacketSize = cpu_to_le32(512),
                        .bInterval = 1, // NAK every 1 uframe.
                },
        },
};

#define STR_INTERFACE_ "Source/Sink"
static const struct {
        struct usb_functionfs_strings_head header;
        struct {
                __le16 code;
                const char str1[sizeof STR_INTERFACE_];
        } __attribute__((packed)) lang0;
} __attribute__((packed)) strings = {
        .header = {
                .magic = cpu_to_le32(FUNCTIONFS_STRINGS_MAGIC),
                .length = cpu_to_le32(sizeof strings),
                .str_count = cpu_to_le32(1),
                .lang_count = cpu_to_le32(1),
        },
        .lang0 = {
                cpu_to_le16(0x0409), // en-US.
                STR_INTERFACE_,
        },
};
#define STR_INTERFACE strings.lang0.str1

int usbg_setup(
        usbg_state **s,
        usbg_gadget **g,
        usbg_config **c,
        usbg_function **f_ffs0,
        usbg_function **f_ncm0
);      

int main(int argc, char *argv[]) {
        usbg_state *s;
        usbg_gadget *g;
        usbg_config *c;
        usbg_function *f_ffs0, *f_ncm0;

        if (int rc = usbg_setup(&s, &g, &c, &f_ffs0, &f_ncm0);
                rc != 0) {
                puts("gadget exists.");
        } else {
                puts("gadget created.");
        }

        int ffs_fd = open("/sys/kernel/config/usb_gadget/g1/functions",
                O_RDONLY);
        if (int rc = fchdir(ffs_fd); rc != 0) {
                fprintf(stderr, "unable to chdir to ffs directory: %s\n",
                        strerror(errno));
        }

        system("mount -t functionfs dev0 ./ffs.dev0");

        int ffs_fd_ep0 = open("./ffs.dev0/ep0",
                O_RDWR);
        if (ffs_fd_ep0 < 0) {
                fprintf(stderr, "unable to create ep0: %d : %s\n",
                        errno, strerror(errno));
        }

        puts("ep0 opened.");

        if (int rc = write(ffs_fd_ep0, &descriptors, sizeof(descriptors));
                rc < 0) {
                fprintf(stderr, "unable to write descriptors to ep0: %s\n",
                        strerror(errno));
        }

        if (int rc = write(ffs_fd_ep0, &strings, sizeof(strings));
                rc < 0) {
                fprintf(stderr, "unable to write strings to ep0: %s\n",
                        strerror(errno));
        }

        while (true) sleep(1);

        close(ffs_fd);
}

int usbg_setup(
        usbg_state **s,
        usbg_gadget **g,
        usbg_config **c,
        usbg_function **f_ffs0,
        usbg_function **f_ncm0
) {
        struct usbg_gadget_attrs g_attrs = {
                .bcdUSB = 0x0200,
                .bDeviceClass = USB_CLASS_PER_INTERFACE,
                .bDeviceSubClass = 0x00,
                .bDeviceProtocol = 0x00,
                .bMaxPacketSize0 = 64,
                .idVendor = VENDOR,
                .idProduct = PRODUCT,
                .bcdDevice = 0x0000
        };

        struct usbg_gadget_strs g_strs = {
                .manufacturer = "Foo Inc.",
                .product = "Bar Gadget",
                .serial = "0000000000"
        };

        struct usbg_config_strs c_strs = {
                .configuration = "Default"
        };

        if (usbg_error rc = 
                        (usbg_error)usbg_init("/sys/kernel/config", s);
                rc != USBG_SUCCESS) {
                goto error_exit;
        }

        if (usbg_error rc =
                        (usbg_error)usbg_create_gadget(*s, "g1", &g_attrs, &g_strs, g);
                rc != USBG_SUCCESS) {
                goto error_exit;
        }

        if (usbg_error rc =
                        (usbg_error)usbg_create_function(*g,
                                USBG_F_NCM, "dev0", NULL, f_ncm0);
                rc != USBG_SUCCESS) {
                goto error_exit;
        }

        if (usbg_error rc =
                        (usbg_error)usbg_create_function(*g,
                                USBG_F_FFS, "dev0", NULL, f_ffs0);
                rc != USBG_SUCCESS) {
                //fprintf(stderr, "Error: %s : %s\n", usbg_error_name(rc),
                //      usbg_strerror(rc));
                goto error_exit;
        }

        if (usbg_error rc =
                        (usbg_error)usbg_create_config(*g,
                                1, "c", NULL, &c_strs, c);
                rc != USBG_SUCCESS) {
                goto error_exit;
        }

        if (usbg_error rc =
                        (usbg_error)usbg_add_config_function(*c,
                                "ncm.dev0", *f_ncm0);
                rc != USBG_SUCCESS) {
                goto error_exit;
        }

        if (usbg_error rc =
                        (usbg_error)usbg_add_config_function(*c,
                                "ffs.dev0", *f_ffs0);
                rc != USBG_SUCCESS) {
                goto error_exit;
        }
        
        return 0;

error_exit:
        return -2;
}
```
