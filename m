Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 936C01EB39C
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jun 2020 05:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgFBDGe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jun 2020 23:06:34 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:50895 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726012AbgFBDGe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jun 2020 23:06:34 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id CF437A31;
        Mon,  1 Jun 2020 23:06:32 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Mon, 01 Jun 2020 23:06:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to
        :subject:content-type; s=fm1; bh=E0g2yjLm/iMSPSA50Mxd2TQfPW0+VA4
        N+v96Rw/BNko=; b=TNXtXCwag7l5ee8TSpb4iRz4mAePqbLpEt9AaPDT16ImCHH
        gmZ1/INSLJFraxeUPsQSUu5eWoN3bcGpGb/0aG4H5GIgEZgxCHt0AWJMBK4ub2gE
        mZPeLnURdQBMneHe77xEMbtPf1U8hZ0FFf+LAD0C8o7EBi4xmbUjD6tRr1IActMu
        RFVazoz8UnJJCJC94HV3yRdrreCt31xT876FNu7ipHXM7PixQvCDGMiwvQpUcUoI
        H49h9gaHbbIwh/Kl4gZiJyEcUKt33w9J+4vyzWRHJXyT4qxwqctu2FzezQJVbMOH
        al7uOafw4QyOainWBhjMD8JjylMpWM5ynx7dXwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=E0g2yj
        Lm/iMSPSA50Mxd2TQfPW0+VA4N+v96Rw/BNko=; b=sTASZsY/TxtjKYgTI3sevh
        82A95t2LTjCwdNwWfh+BkqAJR70BAi8aW4B/0KcjEPveKUkhbgZXGNINta8/WPO2
        zKOsWchCzoMCKUHQc/jknqBKjmPpmQL5OAEXAK+ziJKrqJVRKSgCubR4Lt9xbdhO
        r5ALaRJbYLpYpEV8wyr2IndhXu7Mhepg5l1s/BGWW5qUwUsF1NJDZgHwA2uSOlXJ
        MBC8zEFh0X//3LntZZUMIjK7eCaEhFZ1x4jyLnUvSLAWCw8szQbjUOmO+YWjoQFz
        jminSLZ2YJJwnA0D8jhFZT5UbtpP7uE7S7KSQxDmXxbF4fi8Hi4Lc9JdZlhxKDig
        ==
X-ME-Sender: <xms:N8LVXvvuJ-gmiZYqeT61qbYARB87yxSgtxv0SMYoSfzBbL92jepn0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefiedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuihgu
    ucfuphhrhidfuceoshhiugesrggvrghmrdhusheqnecuggftrfgrthhtvghrnhepiedtue
    dvleegteejhfeijeetledvgedvudejvdevjefggfeuheektefgvdevgfetnecuffhomhgr
    ihhnpehfihhrvggvhigvrdgtohhmpdhgihhthhhusgdrtghomhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihgusegrvggrmhdruhhs
X-ME-Proxy: <xmx:N8LVXgdfEPtuF1svgqanvoXF-0rXrhXmFTDLNuItmJ9OglrxV4qyoQ>
    <xmx:N8LVXiwYLT_hpUH7ibJtaUrROwoOos143DfPqkqc2CnL1B_rWcBHWQ>
    <xmx:N8LVXuM-Xh9VoNE6lYXnuPHbo9cq4nu0EiNmt_KtmQRp4JzM0TZ7og>
    <xmx:OMLVXiIeK7Y0_jJrvqQtQm74TvudY0Mw_2HBi0QDUVFUHP9ZC0BqiQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id BF90566008C; Mon,  1 Jun 2020 23:06:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <f4e21b43-b693-4301-ad12-0f070c519888@www.fastmail.com>
In-Reply-To: <83a1b0ef-29d2-0abb-5891-e3aa4478dd5c@samsung.com>
References: <eaa2bcfb-21c2-4a9f-bdad-44ebd293b0e3@www.fastmail.com>
 <CGME20200526195228eucas1p143e39513ee2bd57f2e46129b2638a573@eucas1p1.samsung.com>
 <f5180146-3bec-4dff-8fbd-9dab9e659239@www.fastmail.com>
 <83a1b0ef-29d2-0abb-5891-e3aa4478dd5c@samsung.com>
Date:   Mon, 01 Jun 2020 22:05:23 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Krzysztof Opasiak" <k.opasiak@samsung.com>,
        linux-usb@vger.kernel.org
Subject: Re: Unable to open(2) ep0 in ConfigFG FunctionFS Gadget
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 26, 2020, at 3:03 PM, Krzysztof Opasiak wrote:
> 
> 
> On 26.05.2020 21:51, Sid Spry wrote:
> > On Wed, May 20, 2020, at 11:22 AM, Sid Spry wrote:
> >> Crossreffing
> >> https://protect2.fireeye.com/url?k=c219aa9a-9fcaf18e-c21821d5-0cc47a31ce4e-c3654d6c375cfe09&q=1&u=https%3A%2F%2Fgithub.com%2Ftorvalds%2Flinux%2Fblob%2F2f4c53349961c8ca480193e47da4d44fdb8335a8%2Ftools%2Fusb%2Fffs-test.c it looks like all I have to do is open "ep0" in the proper directory, but I do just that and it fails on first and subsequent runs.
> >>
> >> gadget.cc:
> >>
> >> ```
> >> #include <stdio.h>
> >> #include <stdlib.h>
> >> #include <unistd.h>
> >> #include <fcntl.h>
> >> #include <string.h>
> >> #include <errno.h>
> >>
> >> #include <linux/usb/ch9.h>
> >> #include <usbg/usbg.h>
> >>
> >> #define VENDOR  0x1d6b
> >> #define PRODUCT 0x0104
> >>
> >> int usbg_setup(
> >>          usbg_state **s,
> >>          usbg_gadget **g,
> >>          usbg_config **c,
> >>          usbg_function **f_ffs0,
> >>          usbg_function **f_ncm0
> >> );
> >>
> >> int main(int argc, char *argv[]) {
> >>          usbg_state *s;
> >>          usbg_gadget *g;
> >>          usbg_config *c;
> >>          usbg_function *f_ffs0, *f_ncm0;
> >>
> >>          if (int rc = usbg_setup(&s, &g, &c, &f_ffs0, &f_ncm0);
> >>                  rc != 0) {
> >>                  puts("gadget exists or libcomposite needs to be loaded.");
> >>          } else {
> >>                  puts("gadget created.");
> >>          }
> >>
> >>          int ffs_fd = open("/sys/kernel/config/usb_gadget/g1/functions/ffs.dev0",
> >>                  O_RDONLY);
> >>          if (int rc = fchdir(ffs_fd); rc != 0) {
> >>                  fprintf(stderr, "unable to chdir to ffs directory: %s\n",
> >>                          strerror(errno));
> >>          }
> >>
> >>          int ffs_fd_ep0 = open("ep0",
> >>                  O_RDWR);
> >>          if (ffs_fd_ep0 < 0) {
> >>                  fprintf(stderr, "unable to create ep0: %d : %s\n",
> >>                          errno, strerror(errno));
> >>          }
> >>
> >>          close(ffs_fd);
> >> }
> >>
> >> int usbg_setup(
> >>          usbg_state **s,
> >>          usbg_gadget **g,
> >>          usbg_config **c,
> >>          usbg_function **f_ffs0,
> >>          usbg_function **f_ncm0
> >> ) {
> >>          struct usbg_gadget_attrs g_attrs = {
> >>                  .bcdUSB = 0x0200,
> >>                  .bDeviceClass = USB_CLASS_PER_INTERFACE,
> >>                  .bDeviceSubClass = 0x00,
> >>                  .bDeviceProtocol = 0x00,
> >>                  .bMaxPacketSize0 = 64,
> >>                  .idVendor = VENDOR,
> >>                  .idProduct = PRODUCT,
> >>                  .bcdDevice = 0x0000
> >>          };
> >>
> >>          struct usbg_gadget_strs g_strs = {
> >>                  .manufacturer = "Foo Inc.",
> >>                  .product = "Bar Gadget",
> >>                  .serial = "0000000000"
> >>          };
> >>
> >>          struct usbg_config_strs c_strs = {
> >>                  .configuration = "Default"
> >>          };
> >>
> >>          if (usbg_error rc =
> >>                          (usbg_error)usbg_init("/sys/kernel/config", s);
> >>                  rc != USBG_SUCCESS) {
> >>                  goto error_exit;
> >>          }
> >>
> >>          if (usbg_error rc =
> >>                          (usbg_error)usbg_create_gadget(*s, "g1",
> >> &g_attrs, &g_strs, g);
> >>                  rc != USBG_SUCCESS) {
> >>                  goto error_exit;
> >>          }
> >>
> >>          if (usbg_error rc =
> >>                          (usbg_error)usbg_create_function(*g,
> >>                                  USBG_F_NCM, "dev0", NULL, f_ncm0);
> >>                  rc != USBG_SUCCESS) {
> >>                  goto error_exit;
> >>          }
> >>
> >>          if (usbg_error rc =
> >>                          (usbg_error)usbg_create_function(*g,
> >>                                  USBG_F_FFS, "dev0", NULL, f_ffs0);
> >>                  rc != USBG_SUCCESS) {
> >>                  //fprintf(stderr, "Error: %s : %s\n", usbg_error_name(rc),
> >>                  //      usbg_strerror(rc));
> >>                  goto error_exit;
> >>          }
> >>          
> >>          return 0;
> >>
> >> error_exit:
> >>          return -2;
> >> }
> >> ```
> >>
> >> strace:
> >>
> >> ```
> >> execve("./gadget", ["./gadget"], 0xbece77a0 /* 19 vars */) = 0
> >> brk(NULL)                               = 0x1017000
> >> uname({sysname="Linux", nodename="nanopiduo", ...}) = 0
> >> mmap2(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
> >> 0) = 0xb6f5e000
> >> access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or
> >> directory)
> >> openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> >> fstat64(3, {st_mode=S_IFREG|0644, st_size=35157, ...}) = 0
> >> mmap2(NULL, 35157, PROT_READ, MAP_PRIVATE, 3, 0) = 0xb6f55000
> >> close(3)                                = 0
> >> openat(AT_FDCWD, "/usr/local/lib/libusbgx.so.2",
> >> O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> >> read(3,
> >> "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\314I\0\0004\0\0\0"...,
> >> 512) = 512
> >> _llseek(3, 362460, [362460], SEEK_SET)  = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1400) = 1400
> >> _llseek(3, 50996, [50996], SEEK_SET)    = 0
> >> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 49) = 49
> >> _llseek(3, 362460, [362460], SEEK_SET)  = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1400) = 1400
> >> _llseek(3, 50996, [50996], SEEK_SET)    = 0
> >> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 49) = 49
> >> _llseek(3, 362460, [362460], SEEK_SET)  = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1400) = 1400
> >> _llseek(3, 50996, [50996], SEEK_SET)    = 0
> >> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 49) = 49
> >> _llseek(3, 362460, [362460], SEEK_SET)  = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1400) = 1400
> >> _llseek(3, 50996, [50996], SEEK_SET)    = 0
> >> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 49) = 49
> >> _llseek(3, 362460, [362460], SEEK_SET)  = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1400) = 1400
> >> _llseek(3, 50996, [50996], SEEK_SET)    = 0
> >> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 49) = 49
> >> fstat64(3, {st_mode=S_IFREG|0755, st_size=363860, ...}) = 0
> >> mmap2(NULL, 116508, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
> >> 0) = 0xb6f1b000
> >> mprotect(0xb6f27000, 61440, PROT_NONE)  = 0
> >> mmap2(0xb6f36000, 8192, PROT_READ|PROT_WRITE,
> >> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xb000) = 0xb6f36000
> >> close(3)                                = 0
> >> openat(AT_FDCWD, "/usr/lib/arm-linux-gnueabihf/libconfig.so.9",
> >> O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> >> read(3,
> >> "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\360\"\0\0004\0\0\0"...,
> >> 512) = 512
> >> _llseek(3, 29420, [29420], SEEK_SET)    = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 960) = 960
> >> _llseek(3, 29096, [29096], SEEK_SET)    = 0
> >> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 49) = 49
> >> _llseek(3, 29420, [29420], SEEK_SET)    = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 960) = 960
> >> _llseek(3, 29096, [29096], SEEK_SET)    = 0
> >> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 49) = 49
> >> _llseek(3, 29420, [29420], SEEK_SET)    = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 960) = 960
> >> _llseek(3, 29096, [29096], SEEK_SET)    = 0
> >> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 49) = 49
> >> _llseek(3, 29420, [29420], SEEK_SET)    = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 960) = 960
> >> _llseek(3, 29096, [29096], SEEK_SET)    = 0
> >> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 49) = 49
> >> _llseek(3, 29420, [29420], SEEK_SET)    = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 960) = 960
> >> _llseek(3, 29096, [29096], SEEK_SET)    = 0
> >> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 49) = 49
> >> fstat64(3, {st_mode=S_IFREG|0644, st_size=30380, ...}) = 0
> >> mmap2(NULL, 94636, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
> >> 0) = 0xb6f03000
> >> mprotect(0xb6f0a000, 61440, PROT_NONE)  = 0
> >> mmap2(0xb6f19000, 8192, PROT_READ|PROT_WRITE,
> >> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) = 0xb6f19000
> >> close(3)                                = 0
> >> openat(AT_FDCWD, "/usr/lib/arm-linux-gnueabihf/libstdc++.so.6",
> >> O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> >> read(3,
> >> "\177ELF\1\1\1\3\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\270\346\6\0004\0\0\0"..., 512) = 512
> >> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1240) = 1240
> >> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
> >> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 51) = 51
> >> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1240) = 1240
> >> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
> >> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 51) = 51
> >> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1240) = 1240
> >> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
> >> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 51) = 51
> >> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1240) = 1240
> >> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
> >> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 51) = 51
> >> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1240) = 1240
> >> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
> >> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 51) = 51
> >> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1240) = 1240
> >> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
> >> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 51) = 51
> >> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1240) = 1240
> >> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
> >> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 51) = 51
> >> fstat64(3, {st_mode=S_IFREG|0644, st_size=1019772, ...}) = 0
> >> mmap2(NULL, 1091308, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
> >> 0) = 0xb6df8000
> >> mprotect(0xb6eeb000, 61440, PROT_NONE)  = 0
> >> mmap2(0xb6efa000, 28672, PROT_READ|PROT_WRITE,
> >> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf2000) = 0xb6efa000
> >> mmap2(0xb6f01000, 5868, PROT_READ|PROT_WRITE,
> >> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb6f01000
> >> close(3)                                = 0
> >> openat(AT_FDCWD, "/lib/arm-linux-gnueabihf/libm.so.6",
> >> O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> >> read(3,
> >> "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\250r\0\0004\0\0\0"...,
> >> 512) = 512
> >> _llseek(3, 434644, [434644], SEEK_SET)  = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1080) = 1080
> >> _llseek(3, 434288, [434288], SEEK_SET)  = 0
> >> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 53) = 53
> >> _llseek(3, 434644, [434644], SEEK_SET)  = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1080) = 1080
> >> _llseek(3, 434288, [434288], SEEK_SET)  = 0
> >> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 53) = 53
> >> _llseek(3, 434644, [434644], SEEK_SET)  = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1080) = 1080
> >> _llseek(3, 434288, [434288], SEEK_SET)  = 0
> >> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 53) = 53
> >> fstat64(3, {st_mode=S_IFREG|0644, st_size=435724, ...}) = 0
> >> mmap2(NULL, 499832, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
> >> 0) = 0xb6d7d000
> >> mprotect(0xb6de7000, 61440, PROT_NONE)  = 0
> >> mmap2(0xb6df6000, 8192, PROT_READ|PROT_WRITE,
> >> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x69000) = 0xb6df6000
> >> close(3)                                = 0
> >> openat(AT_FDCWD, "/lib/arm-linux-gnueabihf/libgcc_s.so.1",
> >> O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> >> read(3,
> >> "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\360\321\0\0004\0\0\0"..., 512) = 512
> >> _llseek(3, 98916, [98916], SEEK_SET)    = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1080) = 1080
> >> _llseek(3, 98556, [98556], SEEK_SET)    = 0
> >> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 49) = 49
> >> _llseek(3, 98916, [98916], SEEK_SET)    = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1080) = 1080
> >> _llseek(3, 98556, [98556], SEEK_SET)    = 0
> >> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 49) = 49
> >> _llseek(3, 98916, [98916], SEEK_SET)    = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1080) = 1080
> >> _llseek(3, 98556, [98556], SEEK_SET)    = 0
> >> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 49) = 49
> >> _llseek(3, 98916, [98916], SEEK_SET)    = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1080) = 1080
> >> _llseek(3, 98556, [98556], SEEK_SET)    = 0
> >> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 49) = 49
> >> _llseek(3, 98916, [98916], SEEK_SET)    = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1080) = 1080
> >> _llseek(3, 98556, [98556], SEEK_SET)    = 0
> >> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 49) = 49
> >> _llseek(3, 98916, [98916], SEEK_SET)    = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 1080) = 1080
> >> _llseek(3, 98556, [98556], SEEK_SET)    = 0
> >> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
> >> 49) = 49
> >> fstat64(3, {st_mode=S_IFREG|0644, st_size=99996, ...}) = 0
> >> mmap2(NULL, 164148, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
> >> 0) = 0xb6d54000
> >> mprotect(0xb6d6c000, 61440, PROT_NONE)  = 0
> >> mmap2(0xb6d7b000, 8192, PROT_READ|PROT_WRITE,
> >> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x17000) = 0xb6d7b000
> >> close(3)                                = 0
> >> openat(AT_FDCWD, "/lib/arm-linux-gnueabihf/libc.so.6",
> >> O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> >> read(3,
> >> "\177ELF\1\1\1\3\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\09v\1\0004\0\0\0"...,
> >> 512) = 512
> >> _llseek(3, 949188, [949188], SEEK_SET)  = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 2840) = 2840
> >> _llseek(3, 945756, [945756], SEEK_SET)  = 0
> >> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\3\f"...,
> >> 53) = 53
> >> _llseek(3, 949188, [949188], SEEK_SET)  = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 2840) = 2840
> >> _llseek(3, 945756, [945756], SEEK_SET)  = 0
> >> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\3\f"...,
> >> 53) = 53
> >> _llseek(3, 949188, [949188], SEEK_SET)  = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 2840) = 2840
> >> _llseek(3, 945756, [945756], SEEK_SET)  = 0
> >> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\3\f"...,
> >> 53) = 53
> >> _llseek(3, 949188, [949188], SEEK_SET)  = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 2840) = 2840
> >> _llseek(3, 945756, [945756], SEEK_SET)  = 0
> >> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\3\f"...,
> >> 53) = 53
> >> _llseek(3, 949188, [949188], SEEK_SET)  = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 2840) = 2840
> >> _llseek(3, 945756, [945756], SEEK_SET)  = 0
> >> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\3\f"...,
> >> 53) = 53
> >> _llseek(3, 949188, [949188], SEEK_SET)  = 0
> >> read(3,
> >> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> >> 2840) = 2840
> >> _llseek(3, 945756, [945756], SEEK_SET)  = 0
> >> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\3\f"...,
> >> 53) = 53
> >> fstat64(3, {st_mode=S_IFREG|0755, st_size=952028, ...}) = 0
> >> mmap2(NULL, 1020732, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
> >> 0) = 0xb6c5a000
> >> mprotect(0xb6d3e000, 65536, PROT_NONE)  = 0
> >> mmap2(0xb6d4e000, 12288, PROT_READ|PROT_WRITE,
> >> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xe4000) = 0xb6d4e000
> >> mmap2(0xb6d51000, 9020, PROT_READ|PROT_WRITE,
> >> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb6d51000
> >> close(3)                                = 0
> >> mmap2(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
> >> 0) = 0xb6f53000
> >> set_tls(0xb6f534d0)                     = 0
> >> mprotect(0xb6d4e000, 8192, PROT_READ)   = 0
> >> mprotect(0xb6d7b000, 4096, PROT_READ)   = 0
> >> mprotect(0xb6df6000, 4096, PROT_READ)   = 0
> >> mprotect(0xb6efa000, 20480, PROT_READ)  = 0
> >> mprotect(0xb6f19000, 4096, PROT_READ)   = 0
> >> mprotect(0xb6f36000, 4096, PROT_READ)   = 0
> >> mprotect(0x491000, 4096, PROT_READ)     = 0
> >> mprotect(0xb6f60000, 4096, PROT_READ)   = 0
> >> munmap(0xb6f55000, 35157)               = 0
> >> brk(NULL)                               = 0x1017000
> >> brk(0x1038000)                          = 0x1038000
> >> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget",
> >> O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_CLOEXEC|O_DIRECTORY) = 3
> >> fstat64(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
> >> close(3)                                = 0
> >> openat(AT_FDCWD, "/sys/class/udc",
> >> O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_CLOEXEC|O_DIRECTORY) = 3
> >> fstat64(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
> >> getdents64(3, /* 3 entries */, 32768)   = 88
> >> getdents64(3, /* 0 entries */, 32768)   = 0
> >> close(3)                                = 0
> >> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget",
> >> O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_CLOEXEC|O_DIRECTORY) = 3
> >> fstat64(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
> >> getdents64(3, /* 3 entries */, 32768)   = 72
> >> getdents64(3, /* 0 entries */, 32768)   = 0
> >> close(3)                                = 0
> >> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget/g1/UDC", O_RDONLY) = 3
> >> fstat64(3, {st_mode=S_IFREG|0644, st_size=4096, ...}) = 0
> >> read(3, "\n", 4096)                     = 1
> >> read(3, "", 4096)                       = 0
> >> close(3)                                = 0
> >> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget/g1/functions",
> >> O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_CLOEXEC|O_DIRECTORY) = 3
> >> fstat64(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
> >> getdents64(3, /* 4 entries */, 32768)   = 112
> >> getdents64(3, /* 0 entries */, 32768)   = 0
> >> close(3)                                = 0
> >> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget/g1/configs",
> >> O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_CLOEXEC|O_DIRECTORY) = 3
> >> fstat64(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
> >> getdents64(3, /* 2 entries */, 32768)   = 48
> >> getdents64(3, /* 0 entries */, 32768)   = 0
> >> close(3)                                = 0
> >> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget/g1/os_desc",
> >> O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_CLOEXEC|O_DIRECTORY) = 3
> >> fstat64(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
> >> getdents64(3, /* 5 entries */, 32768)   = 144
> >> getdents64(3, /* 0 entries */, 32768)   = 0
> >> close(3)                                = 0
> >> write(2, "usbg_create_gadget()  duplicate "..., 46usbg_create_gadget()
> >> duplicate gadget name
> >>   
> >> ) = 46
> >> fstat64(1, {st_mode=S_IFCHR|0600, st_rdev=makedev(0x4, 0x40), ...}) = 0
> >> ioctl(1, TCGETS, {B115200 opost isig icanon echo ...}) = 0
> >> write(1, "gadget exists.\n", 15gadget exists.
> >> )        = 15
> >> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget/g1/functions/ffs.dev0",
> >> O_RDONLY) = 3
> >> fchdir(3)                               = 0
> >> openat(AT_FDCWD, "ep0", O_RDWR)         = -1 ENOENT (No such file or
> >> directory)
> >> write(2, "unable to create ep0: 2 : No suc"..., 52unable to create ep0:
> >> 2 : No such file or directory
> >> ) = 52
> >> close(3)                                = 0
> >> exit_group(0)                           = ?
> >> +++ exited with 0 +++
> >>
> >> ```
> >>
> > 
> > I created the configs as well. Still can't open ep0. Really -- is there a device or UDC someone can verify has worked in the past? Seems easiest way for me to proceed.
> > 
> > I can get more info if it'll help, but I assume some device is already working.
> 
> You cannot open ep0 because you didn't mounted ffs instance.
> 
> after you created /sys/kernel/config/usb_gadget/g1/functions/ffs.dev0 
> you need to:
> 
> mount -t functionfs dev0 /some/path
> 
> then you open(/some/path/ep0);
> 

Sigh... Thanks.

> Best regards,
> -- 
> Krzysztof Opasiak
> Samsung R&D Institute Poland
> Samsung Electronics
>
