Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63D4D1E2F6D
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2020 21:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389600AbgEZTwT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 May 2020 15:52:19 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:44931 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729163AbgEZTwS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 May 2020 15:52:18 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 135B5AB3
        for <linux-usb@vger.kernel.org>; Tue, 26 May 2020 15:52:16 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Tue, 26 May 2020 15:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to
        :subject:content-type; s=fm1; bh=N3eepKdgvOy3cYJI5RtWkKVKUnMfh7f
        4TdwQyAyEy8c=; b=SnMoF/Nt/6Vh1ofM5pRYcAmAHVZ5a8cz+25Od5OwFjGZNHw
        1z17+7qnUgF04i8TWWp1M7kCLc1kFAgQ9qgiW/AGBnd9Kk8QrynByGU1IJ6ReZ1V
        LCwOkFmL1jlDE0iJJJpjrx76qWaxTJtbTDYYIeggW7L8HtMycIqSNWllWyfCRtme
        hwBmw4ZWfdlJ9Osavk8owQK7nVuaG2TSW90utqUyCls8r3r9MNxVZIrH+go6UtAP
        Fd9L3NRwDLx3+150DWJTmiH/0H0MObyLkndW3mSBP0vk7I7v36jg7Cc74L1AChqc
        5U2Hfvlq6+T9Mctb/y3/pnUout5QxkG/zKh2bKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=N3eepK
        dgvOy3cYJI5RtWkKVKUnMfh7f4TdwQyAyEy8c=; b=bR2gvi+UasOES6t/+bPkWC
        +9fFcBPpxJO8ES/BEtoh7V8iDW1NFdOG2zJsPv7yEJQ5gsMPu97+muwEV/BD91qM
        MJ7hN6XoqnqGZsQK0ZLP1DK231bRQGRcx4PhibNX5FOWtptXCkUa5CP+ipTKYwuw
        fl7n/CwDnnsxNWK3TZHCRDd4DOEHTH65kcWVgfzPRxbIVQZEhsxs9T2FKhUZ3CA4
        BTVs9D7mAFZgQbBthX5HkIZrw42edP2zByNlDJKGtMZItPQFKAbtArymMM/7Q0R9
        +NyA/XNWsTPCVI3H+S0NfLVOQTqlPM7x31+nVkMBATyJ/C2/ufngpBaCGU6YbNfA
        ==
X-ME-Sender: <xms:b3PNXrtxTNiF7WAdsHLqv57Kp-7iigO7q9jrl1CshQoyl81QmdPLqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvvddgudefjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesth
    dtredtreertdenucfhrhhomhepfdfuihguucfuphhrhidfuceoshhiugesrggvrghmrdhu
    sheqnecuggftrfgrthhtvghrnhepjeffieejgfffleejgefgudekkeehheejffegffeihe
    etveetgedvgffgieekieeinecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihgusegrvggrmh
    druhhs
X-ME-Proxy: <xmx:b3PNXseKFBH_gOi_mby_mTXvSoWrtAnpSPoYZ9kqzKM2koH-M8PU_Q>
    <xmx:b3PNXuw4QjNsHmbZMRZdjJIa_hmu1jAZX2BE1XFfuMe4k8V7R2GGpA>
    <xmx:b3PNXqOwybjUlnlRqT6xRwpSjEmfrm1RXtVNInhAJKZsrsAjQIEoGw>
    <xmx:b3PNXpfiIUqY6xSIJJIpSFCZIYAqEXe3wb6u3_g_2rFClWwHUj3pLQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 40D32660082; Tue, 26 May 2020 15:52:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-488-g9249dd4-fm-20200522.001-g9249dd48
Mime-Version: 1.0
Message-Id: <f5180146-3bec-4dff-8fbd-9dab9e659239@www.fastmail.com>
In-Reply-To: <eaa2bcfb-21c2-4a9f-bdad-44ebd293b0e3@www.fastmail.com>
References: <eaa2bcfb-21c2-4a9f-bdad-44ebd293b0e3@www.fastmail.com>
Date:   Tue, 26 May 2020 14:51:13 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     linux-usb@vger.kernel.org
Subject: Re: Unable to open(2) ep0 in ConfigFG FunctionFS Gadget
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 20, 2020, at 11:22 AM, Sid Spry wrote:
> Crossreffing 
> https://github.com/torvalds/linux/blob/2f4c53349961c8ca480193e47da4d44fdb8335a8/tools/usb/ffs-test.c it looks like all I have to do is open "ep0" in the proper directory, but I do just that and it fails on first and subsequent runs.
> 
> gadget.cc:
> 
> ```
> #include <stdio.h>
> #include <stdlib.h>
> #include <unistd.h>
> #include <fcntl.h>
> #include <string.h>
> #include <errno.h>
> 
> #include <linux/usb/ch9.h>
> #include <usbg/usbg.h>
> 
> #define VENDOR  0x1d6b
> #define PRODUCT 0x0104
> 
> int usbg_setup(
>         usbg_state **s,
>         usbg_gadget **g,
>         usbg_config **c,
>         usbg_function **f_ffs0,
>         usbg_function **f_ncm0
> );      
> 
> int main(int argc, char *argv[]) {
>         usbg_state *s;
>         usbg_gadget *g;
>         usbg_config *c;
>         usbg_function *f_ffs0, *f_ncm0;
> 
>         if (int rc = usbg_setup(&s, &g, &c, &f_ffs0, &f_ncm0);
>                 rc != 0) {
>                 puts("gadget exists or libcomposite needs to be loaded.");
>         } else {
>                 puts("gadget created.");
>         }
> 
>         int ffs_fd = open("/sys/kernel/config/usb_gadget/g1/functions/ffs.dev0",
>                 O_RDONLY);
>         if (int rc = fchdir(ffs_fd); rc != 0) {
>                 fprintf(stderr, "unable to chdir to ffs directory: %s\n",
>                         strerror(errno));
>         }
> 
>         int ffs_fd_ep0 = open("ep0",
>                 O_RDWR);
>         if (ffs_fd_ep0 < 0) {
>                 fprintf(stderr, "unable to create ep0: %d : %s\n",
>                         errno, strerror(errno));
>         }
> 
>         close(ffs_fd);
> }
> 
> int usbg_setup(
>         usbg_state **s,
>         usbg_gadget **g,
>         usbg_config **c,
>         usbg_function **f_ffs0,
>         usbg_function **f_ncm0
> ) {
>         struct usbg_gadget_attrs g_attrs = {
>                 .bcdUSB = 0x0200,
>                 .bDeviceClass = USB_CLASS_PER_INTERFACE,
>                 .bDeviceSubClass = 0x00,
>                 .bDeviceProtocol = 0x00,
>                 .bMaxPacketSize0 = 64,
>                 .idVendor = VENDOR,
>                 .idProduct = PRODUCT,
>                 .bcdDevice = 0x0000
>         };
> 
>         struct usbg_gadget_strs g_strs = {
>                 .manufacturer = "Foo Inc.",
>                 .product = "Bar Gadget",
>                 .serial = "0000000000"
>         };
> 
>         struct usbg_config_strs c_strs = {
>                 .configuration = "Default"
>         };
> 
>         if (usbg_error rc = 
>                         (usbg_error)usbg_init("/sys/kernel/config", s);
>                 rc != USBG_SUCCESS) {
>                 goto error_exit;
>         }
> 
>         if (usbg_error rc =
>                         (usbg_error)usbg_create_gadget(*s, "g1", 
> &g_attrs, &g_strs, g);
>                 rc != USBG_SUCCESS) {
>                 goto error_exit;
>         }
> 
>         if (usbg_error rc =
>                         (usbg_error)usbg_create_function(*g,
>                                 USBG_F_NCM, "dev0", NULL, f_ncm0);
>                 rc != USBG_SUCCESS) {
>                 goto error_exit;
>         }
> 
>         if (usbg_error rc =
>                         (usbg_error)usbg_create_function(*g,
>                                 USBG_F_FFS, "dev0", NULL, f_ffs0);
>                 rc != USBG_SUCCESS) {
>                 //fprintf(stderr, "Error: %s : %s\n", usbg_error_name(rc),
>                 //      usbg_strerror(rc));
>                 goto error_exit;
>         }
>         
>         return 0;
> 
> error_exit:
>         return -2;
> }
> ```
> 
> strace:
> 
> ```
> execve("./gadget", ["./gadget"], 0xbece77a0 /* 19 vars */) = 0
> brk(NULL)                               = 0x1017000
> uname({sysname="Linux", nodename="nanopiduo", ...}) = 0
> mmap2(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 
> 0) = 0xb6f5e000
> access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or 
> directory)
> openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> fstat64(3, {st_mode=S_IFREG|0644, st_size=35157, ...}) = 0
> mmap2(NULL, 35157, PROT_READ, MAP_PRIVATE, 3, 0) = 0xb6f55000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/local/lib/libusbgx.so.2", 
> O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> read(3, 
> "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\314I\0\0004\0\0\0"..., 
> 512) = 512
> _llseek(3, 362460, [362460], SEEK_SET)  = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1400) = 1400
> _llseek(3, 50996, [50996], SEEK_SET)    = 0
> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 49) = 49
> _llseek(3, 362460, [362460], SEEK_SET)  = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1400) = 1400
> _llseek(3, 50996, [50996], SEEK_SET)    = 0
> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 49) = 49
> _llseek(3, 362460, [362460], SEEK_SET)  = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1400) = 1400
> _llseek(3, 50996, [50996], SEEK_SET)    = 0
> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 49) = 49
> _llseek(3, 362460, [362460], SEEK_SET)  = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1400) = 1400
> _llseek(3, 50996, [50996], SEEK_SET)    = 0
> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 49) = 49
> _llseek(3, 362460, [362460], SEEK_SET)  = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1400) = 1400
> _llseek(3, 50996, [50996], SEEK_SET)    = 0
> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 49) = 49
> fstat64(3, {st_mode=S_IFREG|0755, st_size=363860, ...}) = 0
> mmap2(NULL, 116508, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 
> 0) = 0xb6f1b000
> mprotect(0xb6f27000, 61440, PROT_NONE)  = 0
> mmap2(0xb6f36000, 8192, PROT_READ|PROT_WRITE, 
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xb000) = 0xb6f36000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/arm-linux-gnueabihf/libconfig.so.9", 
> O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> read(3, 
> "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\360\"\0\0004\0\0\0"..., 
> 512) = 512
> _llseek(3, 29420, [29420], SEEK_SET)    = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 960) = 960
> _llseek(3, 29096, [29096], SEEK_SET)    = 0
> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 49) = 49
> _llseek(3, 29420, [29420], SEEK_SET)    = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 960) = 960
> _llseek(3, 29096, [29096], SEEK_SET)    = 0
> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 49) = 49
> _llseek(3, 29420, [29420], SEEK_SET)    = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 960) = 960
> _llseek(3, 29096, [29096], SEEK_SET)    = 0
> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 49) = 49
> _llseek(3, 29420, [29420], SEEK_SET)    = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 960) = 960
> _llseek(3, 29096, [29096], SEEK_SET)    = 0
> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 49) = 49
> _llseek(3, 29420, [29420], SEEK_SET)    = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 960) = 960
> _llseek(3, 29096, [29096], SEEK_SET)    = 0
> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 49) = 49
> fstat64(3, {st_mode=S_IFREG|0644, st_size=30380, ...}) = 0
> mmap2(NULL, 94636, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 
> 0) = 0xb6f03000
> mprotect(0xb6f0a000, 61440, PROT_NONE)  = 0
> mmap2(0xb6f19000, 8192, PROT_READ|PROT_WRITE, 
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) = 0xb6f19000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/arm-linux-gnueabihf/libstdc++.so.6", 
> O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> read(3, 
> "\177ELF\1\1\1\3\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\270\346\6\0004\0\0\0"..., 512) = 512
> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1240) = 1240
> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 51) = 51
> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1240) = 1240
> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 51) = 51
> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1240) = 1240
> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 51) = 51
> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1240) = 1240
> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 51) = 51
> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1240) = 1240
> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 51) = 51
> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1240) = 1240
> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 51) = 51
> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1240) = 1240
> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 51) = 51
> fstat64(3, {st_mode=S_IFREG|0644, st_size=1019772, ...}) = 0
> mmap2(NULL, 1091308, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 
> 0) = 0xb6df8000
> mprotect(0xb6eeb000, 61440, PROT_NONE)  = 0
> mmap2(0xb6efa000, 28672, PROT_READ|PROT_WRITE, 
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf2000) = 0xb6efa000
> mmap2(0xb6f01000, 5868, PROT_READ|PROT_WRITE, 
> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb6f01000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib/arm-linux-gnueabihf/libm.so.6", 
> O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> read(3, 
> "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\250r\0\0004\0\0\0"..., 
> 512) = 512
> _llseek(3, 434644, [434644], SEEK_SET)  = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1080) = 1080
> _llseek(3, 434288, [434288], SEEK_SET)  = 0
> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 53) = 53
> _llseek(3, 434644, [434644], SEEK_SET)  = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1080) = 1080
> _llseek(3, 434288, [434288], SEEK_SET)  = 0
> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 53) = 53
> _llseek(3, 434644, [434644], SEEK_SET)  = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1080) = 1080
> _llseek(3, 434288, [434288], SEEK_SET)  = 0
> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 53) = 53
> fstat64(3, {st_mode=S_IFREG|0644, st_size=435724, ...}) = 0
> mmap2(NULL, 499832, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 
> 0) = 0xb6d7d000
> mprotect(0xb6de7000, 61440, PROT_NONE)  = 0
> mmap2(0xb6df6000, 8192, PROT_READ|PROT_WRITE, 
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x69000) = 0xb6df6000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib/arm-linux-gnueabihf/libgcc_s.so.1", 
> O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> read(3, 
> "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\360\321\0\0004\0\0\0"..., 512) = 512
> _llseek(3, 98916, [98916], SEEK_SET)    = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1080) = 1080
> _llseek(3, 98556, [98556], SEEK_SET)    = 0
> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 49) = 49
> _llseek(3, 98916, [98916], SEEK_SET)    = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1080) = 1080
> _llseek(3, 98556, [98556], SEEK_SET)    = 0
> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 49) = 49
> _llseek(3, 98916, [98916], SEEK_SET)    = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1080) = 1080
> _llseek(3, 98556, [98556], SEEK_SET)    = 0
> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 49) = 49
> _llseek(3, 98916, [98916], SEEK_SET)    = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1080) = 1080
> _llseek(3, 98556, [98556], SEEK_SET)    = 0
> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 49) = 49
> _llseek(3, 98916, [98916], SEEK_SET)    = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1080) = 1080
> _llseek(3, 98556, [98556], SEEK_SET)    = 0
> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 49) = 49
> _llseek(3, 98916, [98916], SEEK_SET)    = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 1080) = 1080
> _llseek(3, 98556, [98556], SEEK_SET)    = 0
> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"..., 
> 49) = 49
> fstat64(3, {st_mode=S_IFREG|0644, st_size=99996, ...}) = 0
> mmap2(NULL, 164148, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 
> 0) = 0xb6d54000
> mprotect(0xb6d6c000, 61440, PROT_NONE)  = 0
> mmap2(0xb6d7b000, 8192, PROT_READ|PROT_WRITE, 
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x17000) = 0xb6d7b000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib/arm-linux-gnueabihf/libc.so.6", 
> O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> read(3, 
> "\177ELF\1\1\1\3\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\09v\1\0004\0\0\0"..., 
> 512) = 512
> _llseek(3, 949188, [949188], SEEK_SET)  = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 2840) = 2840
> _llseek(3, 945756, [945756], SEEK_SET)  = 0
> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\3\f"..., 
> 53) = 53
> _llseek(3, 949188, [949188], SEEK_SET)  = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 2840) = 2840
> _llseek(3, 945756, [945756], SEEK_SET)  = 0
> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\3\f"..., 
> 53) = 53
> _llseek(3, 949188, [949188], SEEK_SET)  = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 2840) = 2840
> _llseek(3, 945756, [945756], SEEK_SET)  = 0
> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\3\f"..., 
> 53) = 53
> _llseek(3, 949188, [949188], SEEK_SET)  = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 2840) = 2840
> _llseek(3, 945756, [945756], SEEK_SET)  = 0
> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\3\f"..., 
> 53) = 53
> _llseek(3, 949188, [949188], SEEK_SET)  = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 2840) = 2840
> _llseek(3, 945756, [945756], SEEK_SET)  = 0
> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\3\f"..., 
> 53) = 53
> _llseek(3, 949188, [949188], SEEK_SET)  = 0
> read(3, 
> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
> 2840) = 2840
> _llseek(3, 945756, [945756], SEEK_SET)  = 0
> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\3\f"..., 
> 53) = 53
> fstat64(3, {st_mode=S_IFREG|0755, st_size=952028, ...}) = 0
> mmap2(NULL, 1020732, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 
> 0) = 0xb6c5a000
> mprotect(0xb6d3e000, 65536, PROT_NONE)  = 0
> mmap2(0xb6d4e000, 12288, PROT_READ|PROT_WRITE, 
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xe4000) = 0xb6d4e000
> mmap2(0xb6d51000, 9020, PROT_READ|PROT_WRITE, 
> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb6d51000
> close(3)                                = 0
> mmap2(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 
> 0) = 0xb6f53000
> set_tls(0xb6f534d0)                     = 0
> mprotect(0xb6d4e000, 8192, PROT_READ)   = 0
> mprotect(0xb6d7b000, 4096, PROT_READ)   = 0
> mprotect(0xb6df6000, 4096, PROT_READ)   = 0
> mprotect(0xb6efa000, 20480, PROT_READ)  = 0
> mprotect(0xb6f19000, 4096, PROT_READ)   = 0
> mprotect(0xb6f36000, 4096, PROT_READ)   = 0
> mprotect(0x491000, 4096, PROT_READ)     = 0
> mprotect(0xb6f60000, 4096, PROT_READ)   = 0
> munmap(0xb6f55000, 35157)               = 0
> brk(NULL)                               = 0x1017000
> brk(0x1038000)                          = 0x1038000
> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget", 
> O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_CLOEXEC|O_DIRECTORY) = 3
> fstat64(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
> close(3)                                = 0
> openat(AT_FDCWD, "/sys/class/udc", 
> O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_CLOEXEC|O_DIRECTORY) = 3
> fstat64(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
> getdents64(3, /* 3 entries */, 32768)   = 88
> getdents64(3, /* 0 entries */, 32768)   = 0
> close(3)                                = 0
> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget", 
> O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_CLOEXEC|O_DIRECTORY) = 3
> fstat64(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
> getdents64(3, /* 3 entries */, 32768)   = 72
> getdents64(3, /* 0 entries */, 32768)   = 0
> close(3)                                = 0
> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget/g1/UDC", O_RDONLY) = 3
> fstat64(3, {st_mode=S_IFREG|0644, st_size=4096, ...}) = 0
> read(3, "\n", 4096)                     = 1
> read(3, "", 4096)                       = 0
> close(3)                                = 0
> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget/g1/functions", 
> O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_CLOEXEC|O_DIRECTORY) = 3
> fstat64(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
> getdents64(3, /* 4 entries */, 32768)   = 112
> getdents64(3, /* 0 entries */, 32768)   = 0
> close(3)                                = 0
> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget/g1/configs", 
> O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_CLOEXEC|O_DIRECTORY) = 3
> fstat64(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
> getdents64(3, /* 2 entries */, 32768)   = 48
> getdents64(3, /* 0 entries */, 32768)   = 0
> close(3)                                = 0
> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget/g1/os_desc", 
> O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_CLOEXEC|O_DIRECTORY) = 3
> fstat64(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
> getdents64(3, /* 5 entries */, 32768)   = 144
> getdents64(3, /* 0 entries */, 32768)   = 0
> close(3)                                = 0
> write(2, "usbg_create_gadget()  duplicate "..., 46usbg_create_gadget()  
> duplicate gadget name
>  
> ) = 46
> fstat64(1, {st_mode=S_IFCHR|0600, st_rdev=makedev(0x4, 0x40), ...}) = 0
> ioctl(1, TCGETS, {B115200 opost isig icanon echo ...}) = 0
> write(1, "gadget exists.\n", 15gadget exists.
> )        = 15
> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget/g1/functions/ffs.dev0", 
> O_RDONLY) = 3
> fchdir(3)                               = 0
> openat(AT_FDCWD, "ep0", O_RDWR)         = -1 ENOENT (No such file or 
> directory)
> write(2, "unable to create ep0: 2 : No suc"..., 52unable to create ep0: 
> 2 : No such file or directory
> ) = 52
> close(3)                                = 0
> exit_group(0)                           = ?
> +++ exited with 0 +++
> 
> ```
>

I created the configs as well. Still can't open ep0. Really -- is there a device or UDC someone can verify has worked in the past? Seems easiest way for me to proceed.

I can get more info if it'll help, but I assume some device is already working.
