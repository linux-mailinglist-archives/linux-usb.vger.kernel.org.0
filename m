Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9192E1E2FB9
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2020 22:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729024AbgEZUDJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 May 2020 16:03:09 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40717 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728113AbgEZUDI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 May 2020 16:03:08 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200526200306euoutp02bd65dff722a008d81e7489313532bb48~SrJe7x1Qh0597105971euoutp02S
        for <linux-usb@vger.kernel.org>; Tue, 26 May 2020 20:03:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200526200306euoutp02bd65dff722a008d81e7489313532bb48~SrJe7x1Qh0597105971euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1590523386;
        bh=Ecx9De0ubhjpUT8MTVBQMobfvj5H3ElWtD6lEuIrDOU=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=Qg9lSDkrZ1B9/HOfahr158KaMZgOus+i2aJ2QY0sLktTow/+H3aywMBUluJV0OvMj
         DQSgGECYV+9ANUO1Ev8vBXplderQCH1Jwn2+zACOjrT4D9zW/wLkBqcHqaCkfwz8SY
         rhz1pg+GbowVb661CpEzR4gLH3FFyDb7mtkcEOg0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200526200305eucas1p189877391e3104642c70535fd4a60394f~SrJe0jsL_1904619046eucas1p1D;
        Tue, 26 May 2020 20:03:05 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id DD.A4.61286.9F57DCE5; Tue, 26
        May 2020 21:03:05 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200526200305eucas1p2cae183b4e19f058eca0ec062201e6daf~SrJeYQhjn2754927549eucas1p2t;
        Tue, 26 May 2020 20:03:05 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200526200305eusmtrp2fd0c98f9f330aca775e7fe626d295881~SrJeUOyXu0832908329eusmtrp2t;
        Tue, 26 May 2020 20:03:05 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-0b-5ecd75f97c30
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id B6.B1.07950.7F57DCE5; Tue, 26
        May 2020 21:03:03 +0100 (BST)
Received: from [192.168.56.1] (unknown [106.210.237.40]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200526200303eusmtip228f63d401d639324caceb3788c31aa70~SrJcffazW2797627976eusmtip2W;
        Tue, 26 May 2020 20:03:03 +0000 (GMT)
Subject: Re: Unable to open(2) ep0 in ConfigFG FunctionFS Gadget
To:     Sid Spry <sid@aeam.us>, linux-usb@vger.kernel.org
From:   Krzysztof Opasiak <k.opasiak@samsung.com>
Message-ID: <83a1b0ef-29d2-0abb-5891-e3aa4478dd5c@samsung.com>
Date:   Tue, 26 May 2020 22:03:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f5180146-3bec-4dff-8fbd-9dab9e659239@www.fastmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPIsWRmVeSWpSXmKPExsWy7djPc7o/S8/GGSx8YWaxaFkrs8Xp7xuZ
        HZg8Di/tZvP4vEkugCmKyyYlNSezLLVI3y6BK+P0sgtsBQ2rGStaJ09gb2D82MrYxcjJISFg
        InHi52qmLkYuDiGBFYwSy/80soIkhAS+MErs+6IIkfjMKHGr4x5zFyMHWMe79cYQNcsZJdre
        8ELUvGWU+Dz/FhNIQljAQeLEhY1g9SICphIzdkWDmGwC+hLzdomCVPAK2Ensfv4N7AYWAVWJ
        WQ/us4GUiApESJz+mghRIihxcuYTFhCbU8BF4uWWn2DDmQXEJW49mQ9ly0tsfzuHGeQCCYH3
        bBKX2w+yQ/zlInF55VkWCFtY4tXxLVBxGYn/O+czQTRsYpT4P/c6G4Szm1HiwsGNTBBV1hKH
        //0Gu4hZQFNi/S59iLCjxKyV+xkhwcAnceOtIMQRfBKTtk2Hhg6vREebEES1ssT99gesELak
        xPfVu9khSjwk9neqTGBUnIXky1lIPpuF5LNZCCcsYGRZxSieWlqcm55abJiXWq5XnJhbXJqX
        rpecn7uJEZgsTv87/mkH49dLSYcYBTgYlXh4OX6eiRNiTSwrrsw9xCjBwawkwut09nScEG9K
        YmVValF+fFFpTmrxIUZpDhYlcV7jRS9jhQTSE0tSs1NTC1KLYLJMHJxSDYwyymnBpX2aXe+f
        JjO/7qm96Szb+UNNsNdcJySz9a6gngCbop3emvWZKfu85sQ+MHnj9HwKQ9O5RuMFado/J3KY
        f7yr80TTPa9gc+/Lr7f2/V17YOeWzbx7lPe87zv42+PG5GdKDY37PjcfL+20+/VgRdC1H2ZH
        ztqlLGVgOlK9adUtzzsroj8qsRRnJBpqMRcVJwIALuuy+hIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42I5/e/4Pd3vpWfjDF4807VYtKyV2eL0943M
        Dkweh5d2s3l83iQXwBSlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OS
        mpNZllqkb5egl3F62QW2gobVjBWtkyewNzB+bGXsYuTgkBAwkXi33riLkYtDSGApo8S0RyuB
        4pxAcUmJ6S9OMEPYwhJ/rnWxQRS9ZpToO7yADSQhLOAgceLCRmaQQSICphIzdkVD1FxklHi2
        dgErSJxNQF9i3i5RkHJeATuJ3c+/gc1nEVCVmPXgPtgYUYEIiefbbzBC1AhKnJz5hAXE5hRw
        kXi55ScTiM0sYCYxb/NDZghbXOLWk/lQcXmJ7W/nME9gFJyFpH0WkpZZSFpmIWlZwMiyilEk
        tbQ4Nz232EivODG3uDQvXS85P3cTIzAath37uWUHY9e74EOMAhyMSjy8Cb/PxAmxJpYVV+Ye
        YpTgYFYS4XU6ezpOiDclsbIqtSg/vqg0J7X4EKMp0HMTmaVEk/OBkZpXEm9oamhuYWlobmxu
        bGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoHRc8WKD+IWdxZWB1+Kf7aj8qDrjowj/SbL
        lCczlzDu+6ww8zgn47lituwylnlpeXtS/7WGyljyBtU+nMd2WI3hgdXHl9UcXgu62Ca8faUi
        ssBPunePWYwR74nslftvKv3o833MmK0dJ9Pdb5mrVj5VWWX+b8tsbuX7VsXi/zcG8z/bX1kn
        aKbEUpyRaKjFXFScCAD69/RznAIAAA==
X-CMS-MailID: 20200526200305eucas1p2cae183b4e19f058eca0ec062201e6daf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200526195228eucas1p143e39513ee2bd57f2e46129b2638a573
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200526195228eucas1p143e39513ee2bd57f2e46129b2638a573
References: <eaa2bcfb-21c2-4a9f-bdad-44ebd293b0e3@www.fastmail.com>
        <CGME20200526195228eucas1p143e39513ee2bd57f2e46129b2638a573@eucas1p1.samsung.com>
        <f5180146-3bec-4dff-8fbd-9dab9e659239@www.fastmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 26.05.2020 21:51, Sid Spry wrote:
> On Wed, May 20, 2020, at 11:22 AM, Sid Spry wrote:
>> Crossreffing
>> https://protect2.fireeye.com/url?k=c219aa9a-9fcaf18e-c21821d5-0cc47a31ce4e-c3654d6c375cfe09&q=1&u=https%3A%2F%2Fgithub.com%2Ftorvalds%2Flinux%2Fblob%2F2f4c53349961c8ca480193e47da4d44fdb8335a8%2Ftools%2Fusb%2Fffs-test.c it looks like all I have to do is open "ep0" in the proper directory, but I do just that and it fails on first and subsequent runs.
>>
>> gadget.cc:
>>
>> ```
>> #include <stdio.h>
>> #include <stdlib.h>
>> #include <unistd.h>
>> #include <fcntl.h>
>> #include <string.h>
>> #include <errno.h>
>>
>> #include <linux/usb/ch9.h>
>> #include <usbg/usbg.h>
>>
>> #define VENDOR  0x1d6b
>> #define PRODUCT 0x0104
>>
>> int usbg_setup(
>>          usbg_state **s,
>>          usbg_gadget **g,
>>          usbg_config **c,
>>          usbg_function **f_ffs0,
>>          usbg_function **f_ncm0
>> );
>>
>> int main(int argc, char *argv[]) {
>>          usbg_state *s;
>>          usbg_gadget *g;
>>          usbg_config *c;
>>          usbg_function *f_ffs0, *f_ncm0;
>>
>>          if (int rc = usbg_setup(&s, &g, &c, &f_ffs0, &f_ncm0);
>>                  rc != 0) {
>>                  puts("gadget exists or libcomposite needs to be loaded.");
>>          } else {
>>                  puts("gadget created.");
>>          }
>>
>>          int ffs_fd = open("/sys/kernel/config/usb_gadget/g1/functions/ffs.dev0",
>>                  O_RDONLY);
>>          if (int rc = fchdir(ffs_fd); rc != 0) {
>>                  fprintf(stderr, "unable to chdir to ffs directory: %s\n",
>>                          strerror(errno));
>>          }
>>
>>          int ffs_fd_ep0 = open("ep0",
>>                  O_RDWR);
>>          if (ffs_fd_ep0 < 0) {
>>                  fprintf(stderr, "unable to create ep0: %d : %s\n",
>>                          errno, strerror(errno));
>>          }
>>
>>          close(ffs_fd);
>> }
>>
>> int usbg_setup(
>>          usbg_state **s,
>>          usbg_gadget **g,
>>          usbg_config **c,
>>          usbg_function **f_ffs0,
>>          usbg_function **f_ncm0
>> ) {
>>          struct usbg_gadget_attrs g_attrs = {
>>                  .bcdUSB = 0x0200,
>>                  .bDeviceClass = USB_CLASS_PER_INTERFACE,
>>                  .bDeviceSubClass = 0x00,
>>                  .bDeviceProtocol = 0x00,
>>                  .bMaxPacketSize0 = 64,
>>                  .idVendor = VENDOR,
>>                  .idProduct = PRODUCT,
>>                  .bcdDevice = 0x0000
>>          };
>>
>>          struct usbg_gadget_strs g_strs = {
>>                  .manufacturer = "Foo Inc.",
>>                  .product = "Bar Gadget",
>>                  .serial = "0000000000"
>>          };
>>
>>          struct usbg_config_strs c_strs = {
>>                  .configuration = "Default"
>>          };
>>
>>          if (usbg_error rc =
>>                          (usbg_error)usbg_init("/sys/kernel/config", s);
>>                  rc != USBG_SUCCESS) {
>>                  goto error_exit;
>>          }
>>
>>          if (usbg_error rc =
>>                          (usbg_error)usbg_create_gadget(*s, "g1",
>> &g_attrs, &g_strs, g);
>>                  rc != USBG_SUCCESS) {
>>                  goto error_exit;
>>          }
>>
>>          if (usbg_error rc =
>>                          (usbg_error)usbg_create_function(*g,
>>                                  USBG_F_NCM, "dev0", NULL, f_ncm0);
>>                  rc != USBG_SUCCESS) {
>>                  goto error_exit;
>>          }
>>
>>          if (usbg_error rc =
>>                          (usbg_error)usbg_create_function(*g,
>>                                  USBG_F_FFS, "dev0", NULL, f_ffs0);
>>                  rc != USBG_SUCCESS) {
>>                  //fprintf(stderr, "Error: %s : %s\n", usbg_error_name(rc),
>>                  //      usbg_strerror(rc));
>>                  goto error_exit;
>>          }
>>          
>>          return 0;
>>
>> error_exit:
>>          return -2;
>> }
>> ```
>>
>> strace:
>>
>> ```
>> execve("./gadget", ["./gadget"], 0xbece77a0 /* 19 vars */) = 0
>> brk(NULL)                               = 0x1017000
>> uname({sysname="Linux", nodename="nanopiduo", ...}) = 0
>> mmap2(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
>> 0) = 0xb6f5e000
>> access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or
>> directory)
>> openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
>> fstat64(3, {st_mode=S_IFREG|0644, st_size=35157, ...}) = 0
>> mmap2(NULL, 35157, PROT_READ, MAP_PRIVATE, 3, 0) = 0xb6f55000
>> close(3)                                = 0
>> openat(AT_FDCWD, "/usr/local/lib/libusbgx.so.2",
>> O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
>> read(3,
>> "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\314I\0\0004\0\0\0"...,
>> 512) = 512
>> _llseek(3, 362460, [362460], SEEK_SET)  = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1400) = 1400
>> _llseek(3, 50996, [50996], SEEK_SET)    = 0
>> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 49) = 49
>> _llseek(3, 362460, [362460], SEEK_SET)  = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1400) = 1400
>> _llseek(3, 50996, [50996], SEEK_SET)    = 0
>> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 49) = 49
>> _llseek(3, 362460, [362460], SEEK_SET)  = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1400) = 1400
>> _llseek(3, 50996, [50996], SEEK_SET)    = 0
>> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 49) = 49
>> _llseek(3, 362460, [362460], SEEK_SET)  = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1400) = 1400
>> _llseek(3, 50996, [50996], SEEK_SET)    = 0
>> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 49) = 49
>> _llseek(3, 362460, [362460], SEEK_SET)  = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1400) = 1400
>> _llseek(3, 50996, [50996], SEEK_SET)    = 0
>> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 49) = 49
>> fstat64(3, {st_mode=S_IFREG|0755, st_size=363860, ...}) = 0
>> mmap2(NULL, 116508, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
>> 0) = 0xb6f1b000
>> mprotect(0xb6f27000, 61440, PROT_NONE)  = 0
>> mmap2(0xb6f36000, 8192, PROT_READ|PROT_WRITE,
>> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xb000) = 0xb6f36000
>> close(3)                                = 0
>> openat(AT_FDCWD, "/usr/lib/arm-linux-gnueabihf/libconfig.so.9",
>> O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
>> read(3,
>> "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\360\"\0\0004\0\0\0"...,
>> 512) = 512
>> _llseek(3, 29420, [29420], SEEK_SET)    = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 960) = 960
>> _llseek(3, 29096, [29096], SEEK_SET)    = 0
>> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 49) = 49
>> _llseek(3, 29420, [29420], SEEK_SET)    = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 960) = 960
>> _llseek(3, 29096, [29096], SEEK_SET)    = 0
>> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 49) = 49
>> _llseek(3, 29420, [29420], SEEK_SET)    = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 960) = 960
>> _llseek(3, 29096, [29096], SEEK_SET)    = 0
>> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 49) = 49
>> _llseek(3, 29420, [29420], SEEK_SET)    = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 960) = 960
>> _llseek(3, 29096, [29096], SEEK_SET)    = 0
>> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 49) = 49
>> _llseek(3, 29420, [29420], SEEK_SET)    = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 960) = 960
>> _llseek(3, 29096, [29096], SEEK_SET)    = 0
>> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 49) = 49
>> fstat64(3, {st_mode=S_IFREG|0644, st_size=30380, ...}) = 0
>> mmap2(NULL, 94636, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
>> 0) = 0xb6f03000
>> mprotect(0xb6f0a000, 61440, PROT_NONE)  = 0
>> mmap2(0xb6f19000, 8192, PROT_READ|PROT_WRITE,
>> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) = 0xb6f19000
>> close(3)                                = 0
>> openat(AT_FDCWD, "/usr/lib/arm-linux-gnueabihf/libstdc++.so.6",
>> O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
>> read(3,
>> "\177ELF\1\1\1\3\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\270\346\6\0004\0\0\0"..., 512) = 512
>> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1240) = 1240
>> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
>> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 51) = 51
>> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1240) = 1240
>> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
>> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 51) = 51
>> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1240) = 1240
>> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
>> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 51) = 51
>> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1240) = 1240
>> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
>> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 51) = 51
>> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1240) = 1240
>> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
>> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 51) = 51
>> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1240) = 1240
>> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
>> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 51) = 51
>> _llseek(3, 1018532, [1018532], SEEK_SET) = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1240) = 1240
>> _llseek(3, 1017936, [1017936], SEEK_SET) = 0
>> read(3, "A2\0\0\0aeabi\0\1(\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 51) = 51
>> fstat64(3, {st_mode=S_IFREG|0644, st_size=1019772, ...}) = 0
>> mmap2(NULL, 1091308, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
>> 0) = 0xb6df8000
>> mprotect(0xb6eeb000, 61440, PROT_NONE)  = 0
>> mmap2(0xb6efa000, 28672, PROT_READ|PROT_WRITE,
>> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf2000) = 0xb6efa000
>> mmap2(0xb6f01000, 5868, PROT_READ|PROT_WRITE,
>> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb6f01000
>> close(3)                                = 0
>> openat(AT_FDCWD, "/lib/arm-linux-gnueabihf/libm.so.6",
>> O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
>> read(3,
>> "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\250r\0\0004\0\0\0"...,
>> 512) = 512
>> _llseek(3, 434644, [434644], SEEK_SET)  = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1080) = 1080
>> _llseek(3, 434288, [434288], SEEK_SET)  = 0
>> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 53) = 53
>> _llseek(3, 434644, [434644], SEEK_SET)  = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1080) = 1080
>> _llseek(3, 434288, [434288], SEEK_SET)  = 0
>> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 53) = 53
>> _llseek(3, 434644, [434644], SEEK_SET)  = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1080) = 1080
>> _llseek(3, 434288, [434288], SEEK_SET)  = 0
>> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 53) = 53
>> fstat64(3, {st_mode=S_IFREG|0644, st_size=435724, ...}) = 0
>> mmap2(NULL, 499832, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
>> 0) = 0xb6d7d000
>> mprotect(0xb6de7000, 61440, PROT_NONE)  = 0
>> mmap2(0xb6df6000, 8192, PROT_READ|PROT_WRITE,
>> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x69000) = 0xb6df6000
>> close(3)                                = 0
>> openat(AT_FDCWD, "/lib/arm-linux-gnueabihf/libgcc_s.so.1",
>> O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
>> read(3,
>> "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\360\321\0\0004\0\0\0"..., 512) = 512
>> _llseek(3, 98916, [98916], SEEK_SET)    = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1080) = 1080
>> _llseek(3, 98556, [98556], SEEK_SET)    = 0
>> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 49) = 49
>> _llseek(3, 98916, [98916], SEEK_SET)    = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1080) = 1080
>> _llseek(3, 98556, [98556], SEEK_SET)    = 0
>> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 49) = 49
>> _llseek(3, 98916, [98916], SEEK_SET)    = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1080) = 1080
>> _llseek(3, 98556, [98556], SEEK_SET)    = 0
>> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 49) = 49
>> _llseek(3, 98916, [98916], SEEK_SET)    = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1080) = 1080
>> _llseek(3, 98556, [98556], SEEK_SET)    = 0
>> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 49) = 49
>> _llseek(3, 98916, [98916], SEEK_SET)    = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1080) = 1080
>> _llseek(3, 98556, [98556], SEEK_SET)    = 0
>> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 49) = 49
>> _llseek(3, 98916, [98916], SEEK_SET)    = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 1080) = 1080
>> _llseek(3, 98556, [98556], SEEK_SET)    = 0
>> read(3, "A0\0\0\0aeabi\0\1&\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\4\22"...,
>> 49) = 49
>> fstat64(3, {st_mode=S_IFREG|0644, st_size=99996, ...}) = 0
>> mmap2(NULL, 164148, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
>> 0) = 0xb6d54000
>> mprotect(0xb6d6c000, 61440, PROT_NONE)  = 0
>> mmap2(0xb6d7b000, 8192, PROT_READ|PROT_WRITE,
>> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x17000) = 0xb6d7b000
>> close(3)                                = 0
>> openat(AT_FDCWD, "/lib/arm-linux-gnueabihf/libc.so.6",
>> O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
>> read(3,
>> "\177ELF\1\1\1\3\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\09v\1\0004\0\0\0"...,
>> 512) = 512
>> _llseek(3, 949188, [949188], SEEK_SET)  = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 2840) = 2840
>> _llseek(3, 945756, [945756], SEEK_SET)  = 0
>> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\3\f"...,
>> 53) = 53
>> _llseek(3, 949188, [949188], SEEK_SET)  = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 2840) = 2840
>> _llseek(3, 945756, [945756], SEEK_SET)  = 0
>> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\3\f"...,
>> 53) = 53
>> _llseek(3, 949188, [949188], SEEK_SET)  = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 2840) = 2840
>> _llseek(3, 945756, [945756], SEEK_SET)  = 0
>> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\3\f"...,
>> 53) = 53
>> _llseek(3, 949188, [949188], SEEK_SET)  = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 2840) = 2840
>> _llseek(3, 945756, [945756], SEEK_SET)  = 0
>> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\3\f"...,
>> 53) = 53
>> _llseek(3, 949188, [949188], SEEK_SET)  = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 2840) = 2840
>> _llseek(3, 945756, [945756], SEEK_SET)  = 0
>> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\3\f"...,
>> 53) = 53
>> _llseek(3, 949188, [949188], SEEK_SET)  = 0
>> read(3,
>> "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
>> 2840) = 2840
>> _llseek(3, 945756, [945756], SEEK_SET)  = 0
>> read(3, "A4\0\0\0aeabi\0\1*\0\0\0\0057-A\0\6\n\7A\10\1\t\2\n\3\f"...,
>> 53) = 53
>> fstat64(3, {st_mode=S_IFREG|0755, st_size=952028, ...}) = 0
>> mmap2(NULL, 1020732, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
>> 0) = 0xb6c5a000
>> mprotect(0xb6d3e000, 65536, PROT_NONE)  = 0
>> mmap2(0xb6d4e000, 12288, PROT_READ|PROT_WRITE,
>> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xe4000) = 0xb6d4e000
>> mmap2(0xb6d51000, 9020, PROT_READ|PROT_WRITE,
>> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb6d51000
>> close(3)                                = 0
>> mmap2(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
>> 0) = 0xb6f53000
>> set_tls(0xb6f534d0)                     = 0
>> mprotect(0xb6d4e000, 8192, PROT_READ)   = 0
>> mprotect(0xb6d7b000, 4096, PROT_READ)   = 0
>> mprotect(0xb6df6000, 4096, PROT_READ)   = 0
>> mprotect(0xb6efa000, 20480, PROT_READ)  = 0
>> mprotect(0xb6f19000, 4096, PROT_READ)   = 0
>> mprotect(0xb6f36000, 4096, PROT_READ)   = 0
>> mprotect(0x491000, 4096, PROT_READ)     = 0
>> mprotect(0xb6f60000, 4096, PROT_READ)   = 0
>> munmap(0xb6f55000, 35157)               = 0
>> brk(NULL)                               = 0x1017000
>> brk(0x1038000)                          = 0x1038000
>> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget",
>> O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_CLOEXEC|O_DIRECTORY) = 3
>> fstat64(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
>> close(3)                                = 0
>> openat(AT_FDCWD, "/sys/class/udc",
>> O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_CLOEXEC|O_DIRECTORY) = 3
>> fstat64(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
>> getdents64(3, /* 3 entries */, 32768)   = 88
>> getdents64(3, /* 0 entries */, 32768)   = 0
>> close(3)                                = 0
>> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget",
>> O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_CLOEXEC|O_DIRECTORY) = 3
>> fstat64(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
>> getdents64(3, /* 3 entries */, 32768)   = 72
>> getdents64(3, /* 0 entries */, 32768)   = 0
>> close(3)                                = 0
>> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget/g1/UDC", O_RDONLY) = 3
>> fstat64(3, {st_mode=S_IFREG|0644, st_size=4096, ...}) = 0
>> read(3, "\n", 4096)                     = 1
>> read(3, "", 4096)                       = 0
>> close(3)                                = 0
>> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget/g1/functions",
>> O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_CLOEXEC|O_DIRECTORY) = 3
>> fstat64(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
>> getdents64(3, /* 4 entries */, 32768)   = 112
>> getdents64(3, /* 0 entries */, 32768)   = 0
>> close(3)                                = 0
>> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget/g1/configs",
>> O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_CLOEXEC|O_DIRECTORY) = 3
>> fstat64(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
>> getdents64(3, /* 2 entries */, 32768)   = 48
>> getdents64(3, /* 0 entries */, 32768)   = 0
>> close(3)                                = 0
>> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget/g1/os_desc",
>> O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_CLOEXEC|O_DIRECTORY) = 3
>> fstat64(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
>> getdents64(3, /* 5 entries */, 32768)   = 144
>> getdents64(3, /* 0 entries */, 32768)   = 0
>> close(3)                                = 0
>> write(2, "usbg_create_gadget()  duplicate "..., 46usbg_create_gadget()
>> duplicate gadget name
>>   
>> ) = 46
>> fstat64(1, {st_mode=S_IFCHR|0600, st_rdev=makedev(0x4, 0x40), ...}) = 0
>> ioctl(1, TCGETS, {B115200 opost isig icanon echo ...}) = 0
>> write(1, "gadget exists.\n", 15gadget exists.
>> )        = 15
>> openat(AT_FDCWD, "/sys/kernel/config/usb_gadget/g1/functions/ffs.dev0",
>> O_RDONLY) = 3
>> fchdir(3)                               = 0
>> openat(AT_FDCWD, "ep0", O_RDWR)         = -1 ENOENT (No such file or
>> directory)
>> write(2, "unable to create ep0: 2 : No suc"..., 52unable to create ep0:
>> 2 : No such file or directory
>> ) = 52
>> close(3)                                = 0
>> exit_group(0)                           = ?
>> +++ exited with 0 +++
>>
>> ```
>>
> 
> I created the configs as well. Still can't open ep0. Really -- is there a device or UDC someone can verify has worked in the past? Seems easiest way for me to proceed.
> 
> I can get more info if it'll help, but I assume some device is already working.

You cannot open ep0 because you didn't mounted ffs instance.

after you created /sys/kernel/config/usb_gadget/g1/functions/ffs.dev0 
you need to:

mount -t functionfs dev0 /some/path

then you open(/some/path/ep0);

Best regards,
-- 
Krzysztof Opasiak
Samsung R&D Institute Poland
Samsung Electronics
