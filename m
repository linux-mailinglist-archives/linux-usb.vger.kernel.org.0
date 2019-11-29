Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2AE610D5B9
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2019 13:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfK2Mde convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 29 Nov 2019 07:33:34 -0500
Received: from smtp.qindel.com ([89.140.90.34]:42522 "EHLO thor.qindel.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726822AbfK2Mde (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 Nov 2019 07:33:34 -0500
Received: from localhost (localhost [127.0.0.1])
        by thor.qindel.com (Postfix) with ESMTP id 7DA876074E
        for <linux-usb@vger.kernel.org>; Fri, 29 Nov 2019 13:24:32 +0100 (CET)
Received: from thor.qindel.com ([127.0.0.1])
        by localhost (thor.qindel.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 8oVuAlbVGonn for <linux-usb@vger.kernel.org>;
        Fri, 29 Nov 2019 13:24:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by thor.qindel.com (Postfix) with ESMTP id 51DDF60760
        for <linux-usb@vger.kernel.org>; Fri, 29 Nov 2019 13:24:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at thor.qindel.com
Received: from thor.qindel.com ([127.0.0.1])
        by localhost (thor.qindel.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id fv1hoqjZi5VV for <linux-usb@vger.kernel.org>;
        Fri, 29 Nov 2019 13:24:32 +0100 (CET)
Received: from gverdu.qindel.com (gverdu.qindel.com [172.26.8.99])
        by thor.qindel.com (Postfix) with ESMTPSA id 26CAC6074E
        for <linux-usb@vger.kernel.org>; Fri, 29 Nov 2019 13:24:31 +0100 (CET)
From:   Vadim Troshchinskiy <vtroshchinskiy@qindel.com>
To:     linux-usb@vger.kernel.org
Subject: usbip tools from 5.4 fail to build due to unaligned pointer value warning
Date:   Fri, 29 Nov 2019 13:24:30 +0100
Message-ID: <6296180.lmSoKh01SJ@gverdu.qindel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

Building the usbip tools from 4.15 is failing under Fedora 30, gcc version 
9.2.1:



$ make                                                                                                                                                                                                                                                                          
make  all-recursive
make[1]: Entering directory '/home/vadim/git/linux-orig/tools/usb/usbip'
Making all in libsrc
make[2]: Entering directory '/home/vadim/git/linux-orig/tools/usb/usbip/
libsrc'
make[2]: Nothing to be done for 'all'.
make[2]: Leaving directory '/home/vadim/git/linux-orig/tools/usb/usbip/libsrc'
Making all in src
make[2]: Entering directory '/home/vadim/git/linux-orig/tools/usb/usbip/src'
  CC       usbip_network.o
usbip_network.c: In function ‘usbip_net_pack_usb_device’:
usbip_network.c:79:32: error: taking address of packed member of ‘struct 
usbip_usb_device’ may result in an unaligned pointer value [-Werror=address-
of-packed-member]
   79 |  usbip_net_pack_uint32_t(pack, &udev->busnum);
      |                                ^~~~~~~~~~~~~
usbip_network.c:80:32: error: taking address of packed member of ‘struct 
usbip_usb_device’ may result in an unaligned pointer value [-Werror=address-
of-packed-member]
   80 |  usbip_net_pack_uint32_t(pack, &udev->devnum);
      |                                ^~~~~~~~~~~~~
usbip_network.c:81:32: error: taking address of packed member of ‘struct 
usbip_usb_device’ may result in an unaligned pointer value [-Werror=address-
of-packed-member]
   81 |  usbip_net_pack_uint32_t(pack, &udev->speed);
      |                                ^~~~~~~~~~~~
usbip_network.c:83:32: error: taking address of packed member of ‘struct 
usbip_usb_device’ may result in an unaligned pointer value [-Werror=address-
of-packed-member]
   83 |  usbip_net_pack_uint16_t(pack, &udev->idVendor);
      |                                ^~~~~~~~~~~~~~~
usbip_network.c:84:32: error: taking address of packed member of ‘struct 
usbip_usb_device’ may result in an unaligned pointer value [-Werror=address-
of-packed-member]
   84 |  usbip_net_pack_uint16_t(pack, &udev->idProduct);
      |                                ^~~~~~~~~~~~~~~~
usbip_network.c:85:32: error: taking address of packed member of ‘struct 
usbip_usb_device’ may result in an unaligned pointer value [-Werror=address-
of-packed-member]
   85 |  usbip_net_pack_uint16_t(pack, &udev->bcdDevice);
      |                                ^~~~~~~~~~~~~~~~
In file included from usbip_network.c:21:
usbip_network.c: In function ‘usbip_net_send_op_common’:
usbip_network.h:36:32: error: taking address of packed member of ‘struct 
op_common’ may result in an unaligned pointer value [-Werror=address-of-
packed-member]
   36 |  usbip_net_pack_uint16_t(pack, &(op_common)->version);\
      |                                ^~~~~~~~~~~~~~~~~~~~~
usbip_network.c:143:2: note: in expansion of macro ‘PACK_OP_COMMON’
  143 |  PACK_OP_COMMON(1, &op_common);
      |  ^~~~~~~~~~~~~~
usbip_network.h:37:32: error: taking address of packed member of ‘struct 
op_common’ may result in an unaligned pointer value [-Werror=address-of-
packed-member]
   37 |  usbip_net_pack_uint16_t(pack, &(op_common)->code);\
      |                                ^~~~~~~~~~~~~~~~~~
usbip_network.c:143:2: note: in expansion of macro ‘PACK_OP_COMMON’
  143 |  PACK_OP_COMMON(1, &op_common);
      |  ^~~~~~~~~~~~~~
usbip_network.h:38:32: error: taking address of packed member of ‘struct 
op_common’ may result in an unaligned pointer value [-Werror=address-of-
packed-member]
   38 |  usbip_net_pack_uint32_t(pack, &(op_common)->status);\
      |                                ^~~~~~~~~~~~~~~~~~~~
usbip_network.c:143:2: note: in expansion of macro ‘PACK_OP_COMMON’
  143 |  PACK_OP_COMMON(1, &op_common);
      |  ^~~~~~~~~~~~~~
usbip_network.c: In function ‘usbip_net_recv_op_common’:
usbip_network.h:36:32: error: taking address of packed member of ‘struct 
op_common’ may result in an unaligned pointer value [-Werror=address-of-
packed-member]
   36 |  usbip_net_pack_uint16_t(pack, &(op_common)->version);\
      |                                ^~~~~~~~~~~~~~~~~~~~~
usbip_network.c:167:2: note: in expansion of macro ‘PACK_OP_COMMON’
  167 |  PACK_OP_COMMON(0, &op_common);
      |  ^~~~~~~~~~~~~~
usbip_network.h:37:32: error: taking address of packed member of ‘struct 
op_common’ may result in an unaligned pointer value [-Werror=address-of-
packed-member]
   37 |  usbip_net_pack_uint16_t(pack, &(op_common)->code);\
      |                                ^~~~~~~~~~~~~~~~~~
usbip_network.c:167:2: note: in expansion of macro ‘PACK_OP_COMMON’
  167 |  PACK_OP_COMMON(0, &op_common);
      |  ^~~~~~~~~~~~~~
usbip_network.h:38:32: error: taking address of packed member of ‘struct 
op_common’ may result in an unaligned pointer value [-Werror=address-of-
packed-member]
   38 |  usbip_net_pack_uint32_t(pack, &(op_common)->status);\
      |                                ^~~~~~~~~~~~~~~~~~~~
usbip_network.c:167:2: note: in expansion of macro ‘PACK_OP_COMMON’
  167 |  PACK_OP_COMMON(0, &op_common);
      |  ^~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[2]: *** [Makefile:430: usbip_network.o] Error 1
make[2]: Leaving directory '/home/vadim/git/linux-orig/tools/usb/usbip/src'
make[1]: *** [Makefile:497: all-recursive] Error 1
make[1]: Leaving directory '/home/vadim/git/linux-orig/tools/usb/usbip'
make: *** [Makefile:365: all] Error 2

It looks like this is due to gcc having added new warnings. For now I've 
worked around it with -Wno-error=address-of-packed-member as I understand this 
isn't a problem on x86.




