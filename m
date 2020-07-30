Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4479B23307D
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 12:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgG3Kmq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jul 2020 06:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgG3Kmp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jul 2020 06:42:45 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E358C061794
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2020 03:42:45 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id w19so724657plq.3
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2020 03:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jOv2o2LR4pdqHjCG4oEzlHWSeWV/hVXkxFEd0EkUBsg=;
        b=Cg7lJNYK7Lfr12jpOOVJlWAM7pr5YVXBqUWK8CrWb52zZasnzPK7Ydf3Wn+M8rn76Z
         u5059YYKPVXPnSTwJ4c6afdZZ4nxdAXhfTADUv9J7DbzZqStd+Bq4UUq9Fj3dt1MYEn8
         Eq/4AvxKkW3WsFV8RKUqOdwT657CAZJhIfThgU6heyP46kceFPv6GmnVT8V2c7M3vfZ8
         x7njALPuCxXcidM6uQBH5/dCYX/sRXvGAmAaEBs3EuG0MXonAw6frCKGnITy1WFHxBMn
         0hmJiu20TZ095upMP/XbPA166jKXS5x3ZsHcs/a3JOG0xKxvW4Wo4Z5XAwGB3NtAI+CT
         rbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jOv2o2LR4pdqHjCG4oEzlHWSeWV/hVXkxFEd0EkUBsg=;
        b=OeaAwWIISGreuEBjQrly5L3zEzD2O9VTr87d908EcyUfI+6PqL5Jaubnn2+PaH/I0U
         +e7uYXul65XN7CmctUJelapLrZWzT7EbMzLuJjfGgK2VbOV/yoVcsMavFSBD4xR66t7m
         1dqF7ZSBQ4cCgTkwYdQy9h0WBm+UcSx7quve6ghLZofRPoyECkTgICQ7SHOkecArsfKF
         KhOZr3d0EFuF1oB6KuwY3olTeKqmm7UaN/jy0POyLD3EXJvSH7BbooxSwGIMqXFABJqc
         07EB2TPsCgDgn2t4yBrhwbHaMWbzAgEkPpEUxVzfxOdN+AJ8R6sxQZNVcQxsxVUgv3VI
         Ol1Q==
X-Gm-Message-State: AOAM530Xfso0vbH/aRzrSIani4d3CjGm2um7EVQLPC1+gH9S77Bx5Wmw
        LQJnVQWiygPJrNE7Vg5G5HM=
X-Google-Smtp-Source: ABdhPJx0fxdVBvZbMsz/ntPo11jE6H0oYpTxqBppx1E+DS1Qq2dbepLVtBU6Wx/ozwkTxo/N/xH7fA==
X-Received: by 2002:a65:60c5:: with SMTP id r5mr1515922pgv.283.1596105764580;
        Thu, 30 Jul 2020 03:42:44 -0700 (PDT)
Received: from lemmy.tees.ne.jp (153-125-65-70.catv.tees.ne.jp. [153.125.65.70])
        by smtp.googlemail.com with ESMTPSA id s185sm1172170pgc.18.2020.07.30.03.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 03:42:41 -0700 (PDT)
From:   Yasushi Asano <yazzep@gmail.com>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, erosca@de.adit-jv.com,
        andrew_gabbasov@mentor.com, jim_baxter@mentor.com,
        wnatsume@jp.adit-jv.com, nnishiguchi@jp.adit-jv.com,
        yasano@jp.adit-jv.com
Subject: [PATCH] [RFC] USB: hub.c: Add the retry count module parameter for usbcore
Date:   Thu, 30 Jul 2020 19:42:26 +0900
Message-Id: <20200730104226.3537-1-yazzep@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yasushi Asano <yasano@jp.adit-jv.com>

Dear Alan
Dear Greg

I would like to have a consultation with you. The customer's product
board needs to get a USB certification and compliance, but it can not
pass the test using the current USB hub driver. According to the USB
compliance plan[1], the“6.7.22 Device No Response” test requires the
detection of device enumeration failure within 30 seconds. The
kernel(USB hub driver) must notify userspace of the enumeration failure
within 30 seconds.

In the current hub driver, the place to detect device enumeration
failure is [2]. I have modified the hub driver to issue a uevent here,
but the procedure of device enumeration (new_scheme+old_scheme) takes
too long to execute, it couldn't reach [2] within 30 seconds after
starting the test.  According to the result of PETtool [3], the state of
"Device No response" is that usb_control_msg(USB_REQ_GET_DESCRIPTOR) [4]
in hub_port_initn times out. That means r == -ETIMEDOUT.  because of the
default setting of initial_descriptor_timeout is 5000 msec[5],
usb_control_msg() took 5000msec until -ETIMEDOUT.

I will try to describe the flow of device enumeration processing
below[6].  If my understanding is correct, the enumeration failure [2]
will be reached after performing all the loops of [7][8][9]+[7][10].  In
the new scheme, 12 times check will be performed ([7]/2*[8]*[9] => 2*2*3
=> 12).  In the old scheme , 4 times check will be performed ([7]/2*[10]
=> 2*2 => 4).  In total, it checks 16 times, and it took 5000msec to
ETIMEDOUT every time. Therefore, It takes about 80 seconds(16*5000msec)
to reach [2]. This does not pass the "Device No response" test.

If I set the module parameter old_schene_first=Y and use_both_schemes=N,
it can be reached [2] within 30 seconds. However, the new_scheme will no
longer be performed. I think we can't choose this, as
previously-detected devices may become undetectable.  new_scheme is
taking too long and I think 12 times checks are redundant. So, I
confirmed the USB specification.

This is the only description of the read of the device descriptor[12].
I couldn't find the description related retry count or timing here and
anywhere in this specification.  And I couldn't find the description
related timing in the “No silent failures" requirements in other
documents[13] also.

Because I'm not sure where this number of loop count is decided, I'm not
sure how should it be modified the driver to pass the USB compliance
test. Is it possible for me to receive a proposal for a solution?  As my
thought, the number of loops may be redundant, so I think if the user
can change it arbitrarily, the problem will be solved. Currently, the
timeout value can be adjusted with a module parameter, but the loop
count cannot. Is there any problem if it is changed like this patch?
The original handling of the driver is unchanged by this modification. I
think the user will be able to adjust the time to enumeration failure
freely. Is this patch acceptable? I would appreciate it much if I could
receive the feedback from you.

----------------------------------------------------------------------------------------------------------------------------------------
[1] https://www.usb.org/sites/default/files/otgeh_compliance_plan_1_2.pdf
6.7.22 A-UUT “Device No Response” for connection timeout
6.7.22.2 Test Procedure for A-UUT which does not support sessions
   - 5. If operator clicks OK before 30s elapses since VBUS went on, then UUT passes test.
   - 6. If 30s elapses first, then UUT fails test.
----------------------------------------------------------------------------------------------------------------------------------------
[2] hub_port_connect()

        if (hub->hdev->parent ||
                        !hcd->driver->port_handed_over ||
                        !(hcd->driver->port_handed_over)(hcd, port1)) {
                if (status != -ENOTCONN && status != -ENODEV)
                        dev_err(&port_dev->dev,
                                        "unable to enumerate USB device\n");
        }
----------------------------------------------------------------------------------------------------------------------------------------
[3] http://www.mqp.com/usbcomp.htm
----------------------------------------------------------------------------------------------------------------------------------------
[4] hub_port_init()

  r = usb_control_msg(udev, usb_rcvaddr0pipe(),
          USB_REQ_GET_DESCRIPTOR, USB_DIR_IN,
          USB_DT_DEVICE << 8, 0,
          buf, GET_DESCRIPTOR_BUFSIZE,
          initial_descriptor_timeout);
----------------------------------------------------------------------------------------------------------------------------------------
[5]
static int initial_descriptor_timeout = USB_CTRL_GET_TIMEOUT;
include/linux/usb.h:#define USB_CTRL_GET_TIMEOUT        5000
----------------------------------------------------------------------------------------------------------------------------------------
[6] The flow of device enumeration processing
drivers/usb/core/hub.c

hub_port_connect(){
       for (x = 0; x < SET_CONFIG_TRIES; x++) {                  ...[7] SET_CONFIG_TRIES is 4 as default setting
               hub_port_init(){
                       if( x < 2 ) {
                             ------ new scheme ------
                             for ( y= 0; y < 2; ++y ) {          ...[8] 2==GET_DESCRIPTOR_TRIES
                                    for ( z = 0; z < 3; ++z ) {  ...[9]
                                           usb_control_msg()     ...[3] ETIMEDOUT(-110) is detected. Timieout value=5000msec.
                                    }
                             }
                       }
                       else {
                             ------ old scheme ------
                             for ( y= 0; y < 2; ++y ) {          ...[10] 2==SET_ADDRESS_TRIES
                                    hub_set_address()            ...[11] ETIMEDOUT(-110) is detected. Timieout value=5000msec.
                             }
                       }
               }
       }
       unable to enumerate USB device.                           ...[2]
}
----------------------------------------------------------------------------------------------------------------------------------------
[12] https://www.usb.org/document-library/usb-20-specification
Universal Serial Bus Specification (usb_20.pdf)
9.1.2 Bus Enumeration
6. Before the USB device receives a unique address, its Default Control Pipe is still accessible via the default address.
   The host reads the device descriptor to determine what actual maximum data payload size this USB device's default pipe can use.
----------------------------------------------------------------------------------------------------------------------------------------
[13] https://www.usb.org/document-library/usb-20-specification
On-The-Go and Embedded Host Supplement to the USB Revision 2.0 Specification (USB_OTG_and_EH_2-0-version 1_1a.pdf)
3.5 No Silent Failures
----------------------------------------------------------------------------------------------------------------------------------------

Signed-off-by: Yasushi Asano <yasano@jp.adit-jv.com>
---
 drivers/usb/core/hub.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 052d5ac..01c2b2d 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -99,6 +99,18 @@ MODULE_PARM_DESC(use_both_schemes,
 		"try the other device initialization scheme if the "
 		"first one fails");
 
+static int get_descriptor_tries = 2;
+module_param(get_descriptor_tries, int, S_IRUGO | S_IWUSR);
+MODULE_PARM_DESC(get_descriptor_tries,
+		"The number of a 64-byte GET_DESCRIPTOR request tries "
+		"(default 2)");
+
+static int get_descriptor_operations = 3;
+module_param(get_descriptor_operations, int, S_IRUGO | S_IWUSR);
+MODULE_PARM_DESC(get_descriptor_operations,
+		"The number of a 64-byte GET_DESCRIPTOR operation "
+		"(default 3)");
+
 /* Mutual exclusion for EHCI CF initialization.  This interferes with
  * port reset on some companion controllers.
  */
@@ -2707,7 +2719,8 @@ static unsigned hub_is_wusb(struct usb_hub *hub)
 
 #define PORT_RESET_TRIES	5
 #define SET_ADDRESS_TRIES	2
-#define GET_DESCRIPTOR_TRIES	2
+#define GET_DESCRIPTOR_TRIES	get_descriptor_tries
+#define GET_DESCRIPTOR_OPERATIONS	get_descriptor_operations
 #define SET_CONFIG_TRIES	(2 * (use_both_schemes + 1))
 #define USE_NEW_SCHEME(i, scheme)	((i) / 2 == (int)(scheme))
 
@@ -4684,7 +4697,7 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 			 * 255 is for WUSB devices, we actually need to use
 			 * 512 (WUSB1.0[4.8.1]).
 			 */
-			for (operations = 0; operations < 3; ++operations) {
+			for (operations = 0; operations < GET_DESCRIPTOR_OPERATIONS; ++operations) {
 				buf->bMaxPacketSize0 = 0;
 				r = usb_control_msg(udev, usb_rcvaddr0pipe(),
 					USB_REQ_GET_DESCRIPTOR, USB_DIR_IN,
-- 
2.7.4

