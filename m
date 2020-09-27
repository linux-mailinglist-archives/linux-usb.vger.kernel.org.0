Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE1127A385
	for <lists+linux-usb@lfdr.de>; Sun, 27 Sep 2020 22:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727373AbgI0T7s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 27 Sep 2020 15:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726621AbgI0T6B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 27 Sep 2020 15:58:01 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF89C0613DB;
        Sun, 27 Sep 2020 12:57:32 -0700 (PDT)
Message-Id: <20200927194921.839848434@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1601236650;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=E8BWshtU8a/PkQjFPYy93BN17JLJsGh02VUnxk0upzE=;
        b=N+JwA8r3ht2f/M3ne58BpHfK1GOt4GMqgR18UWPfudBaJBFVIMdq0c1il9j4d+HHmtwtzs
        dmqcYnudPntJFjQw+NeBhPlRkwqSgONwm1d7AhSB6RMMtlKXUSrO/zsTuOPAOq0SzUhg72
        ZYvkb2hSCYvJCyLpN5Nw1itasArreCiHk2i661yoGbLq2npjGEWG3aIJgA2yx7gcFqOoeX
        s3wVL+sMCKLksBDWA0g69AYJhaNQL0jnR8gZXl3eqiXQxdYi914TlLexu6dI2Y6U7nqN5H
        5n1t4HiKzEK+gZC8Kb5q4zYumbZWOdMm39zvPowPfdmw12wBDSIyP1vvzR1+2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1601236650;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=E8BWshtU8a/PkQjFPYy93BN17JLJsGh02VUnxk0upzE=;
        b=4RL85lLhlslR61dMUmztot7BjIosLb2ekytQx92VaR4TQzSfM5fCdFe3L+k6GNbwDMYffR
        V1pCph8cyROkLAAQ==
Date:   Sun, 27 Sep 2020 21:49:06 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        Paul McKenney <paulmck@kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, Christian Benvenuti <benve@cisco.com>,
        Govindarajulu Varadarajan <_govind@gmx.com>,
        Dave Miller <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Jay Cliburn <jcliburn@gmail.com>,
        Chris Snook <chris.snook@gmail.com>,
        Vishal Kulkarni <vishal@chelsio.com>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        intel-wired-lan@lists.osuosl.org,
        Shannon Nelson <snelson@pensando.io>,
        Pensando Drivers <drivers@pensando.io>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Solarflare linux maintainers <linux-net-drivers@solarflare.com>,
        Edward Cree <ecree@solarflare.com>,
        Martin Habets <mhabets@solarflare.com>,
        Jon Mason <jdmason@kudzu.us>, Daniel Drake <dsd@gentoo.org>,
        Ulrich Kunitz <kune@deine-taler.de>,
        Kalle Valo <kvalo@codeaurora.org>,
        linux-wireless@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arend van Spriel <arend.vanspriel@broadcom.com>,
        Franky Lin <franky.lin@broadcom.com>,
        Hante Meuleman <hante.meuleman@broadcom.com>,
        Chi-Hsien Lin <chi-hsien.lin@cypress.com>,
        Wright Feng <wright.feng@cypress.com>,
        brcm80211-dev-list.pdl@broadcom.com,
        brcm80211-dev-list@cypress.com,
        Stanislav Yakovlev <stas.yakovlev@gmail.com>,
        Stanislaw Gruszka <stf_xl@wp.pl>,
        Johannes Berg <johannes.berg@intel.com>,
        Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
        Luca Coelho <luciano.coelho@intel.com>,
        Intel Linux Wireless <linuxwifi@intel.com>,
        Jouni Malinen <j@w1.fi>,
        Amitkumar Karwar <amitkarwar@gmail.com>,
        Ganapathi Bhat <ganapathi.bhat@nxp.com>,
        Xinming Hu <huxinming820@gmail.com>,
        libertas-dev@lists.infradead.org,
        Pascal Terjan <pterjan@google.com>,
        Ping-Ke Shih <pkshih@realtek.com>
Subject: [patch 20/35] net: usb: kaweth: Replace kaweth_control() with
 usb_control_msg()
References: <20200927194846.045411263@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

kaweth_control() is almost the same as usb_control_msg() except for the
memory allocation mode (GFP_ATOMIC vs GFP_NOIO) and the in_interrupt()
check.

All the invocations of kaweth_control() are within the probe function in
fully preemtible context so there is no reason to use atomic allocations,
GFP_NOIO which is used by usb_control_msg() is perfectly fine.

Replace kaweth_control() invocations from probe with usb_control_msg().

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: linux-usb@vger.kernel.org
Cc: netdev@vger.kernel.org

---
 drivers/net/usb/kaweth.c |   93 +++++++++++++++--------------------------------
 1 file changed, 30 insertions(+), 63 deletions(-)

--- a/drivers/net/usb/kaweth.c
+++ b/drivers/net/usb/kaweth.c
@@ -282,19 +282,13 @@ static int kaweth_control(struct kaweth_
  ****************************************************************/
 static int kaweth_read_configuration(struct kaweth_device *kaweth)
 {
-	int retval;
-
-	retval = kaweth_control(kaweth,
-				usb_rcvctrlpipe(kaweth->dev, 0),
+	return usb_control_msg(kaweth->dev, usb_rcvctrlpipe(kaweth->dev, 0),
 				KAWETH_COMMAND_GET_ETHERNET_DESC,
 				USB_TYPE_VENDOR | USB_DIR_IN | USB_RECIP_DEVICE,
-				0,
-				0,
-				(void *)&kaweth->configuration,
+				0, 0,
+				&kaweth->configuration,
 				sizeof(kaweth->configuration),
 				KAWETH_CONTROL_TIMEOUT);
-
-	return retval;
 }
 
 /****************************************************************
@@ -302,21 +296,14 @@ static int kaweth_read_configuration(str
  ****************************************************************/
 static int kaweth_set_urb_size(struct kaweth_device *kaweth, __u16 urb_size)
 {
-	int retval;
-
 	netdev_dbg(kaweth->net, "Setting URB size to %d\n", (unsigned)urb_size);
 
-	retval = kaweth_control(kaweth,
-				usb_sndctrlpipe(kaweth->dev, 0),
-				KAWETH_COMMAND_SET_URB_SIZE,
-				USB_TYPE_VENDOR | USB_DIR_OUT | USB_RECIP_DEVICE,
-				urb_size,
-				0,
-				(void *)&kaweth->scratch,
-				0,
-				KAWETH_CONTROL_TIMEOUT);
-
-	return retval;
+	return usb_control_msg(kaweth->dev, usb_sndctrlpipe(kaweth->dev, 0),
+			       KAWETH_COMMAND_SET_URB_SIZE,
+			       USB_TYPE_VENDOR | USB_DIR_OUT | USB_RECIP_DEVICE,
+			       urb_size, 0,
+			       &kaweth->scratch, 0,
+			       KAWETH_CONTROL_TIMEOUT);
 }
 
 /****************************************************************
@@ -324,21 +311,14 @@ static int kaweth_set_urb_size(struct ka
  ****************************************************************/
 static int kaweth_set_sofs_wait(struct kaweth_device *kaweth, __u16 sofs_wait)
 {
-	int retval;
-
 	netdev_dbg(kaweth->net, "Set SOFS wait to %d\n", (unsigned)sofs_wait);
 
-	retval = kaweth_control(kaweth,
-				usb_sndctrlpipe(kaweth->dev, 0),
-				KAWETH_COMMAND_SET_SOFS_WAIT,
-				USB_TYPE_VENDOR | USB_DIR_OUT | USB_RECIP_DEVICE,
-				sofs_wait,
-				0,
-				(void *)&kaweth->scratch,
-				0,
-				KAWETH_CONTROL_TIMEOUT);
-
-	return retval;
+	return usb_control_msg(kaweth->dev, usb_sndctrlpipe(kaweth->dev, 0),
+			       KAWETH_COMMAND_SET_SOFS_WAIT,
+			       USB_TYPE_VENDOR | USB_DIR_OUT | USB_RECIP_DEVICE,
+			       sofs_wait, 0,
+			       &kaweth->scratch, 0,
+			       KAWETH_CONTROL_TIMEOUT);
 }
 
 /****************************************************************
@@ -347,22 +327,15 @@ static int kaweth_set_sofs_wait(struct k
 static int kaweth_set_receive_filter(struct kaweth_device *kaweth,
 				     __u16 receive_filter)
 {
-	int retval;
-
 	netdev_dbg(kaweth->net, "Set receive filter to %d\n",
 		   (unsigned)receive_filter);
 
-	retval = kaweth_control(kaweth,
-				usb_sndctrlpipe(kaweth->dev, 0),
-				KAWETH_COMMAND_SET_PACKET_FILTER,
-				USB_TYPE_VENDOR | USB_DIR_OUT | USB_RECIP_DEVICE,
-				receive_filter,
-				0,
-				(void *)&kaweth->scratch,
-				0,
-				KAWETH_CONTROL_TIMEOUT);
-
-	return retval;
+	return usb_control_msg(kaweth->dev, usb_sndctrlpipe(kaweth->dev, 0),
+			       KAWETH_COMMAND_SET_PACKET_FILTER,
+			       USB_TYPE_VENDOR | USB_DIR_OUT | USB_RECIP_DEVICE,
+			       receive_filter, 0,
+			       &kaweth->scratch, 0,
+			       KAWETH_CONTROL_TIMEOUT);
 }
 
 /****************************************************************
@@ -407,14 +380,11 @@ static int kaweth_download_firmware(stru
 		   kaweth->firmware_buf, kaweth);
 	netdev_dbg(kaweth->net, "Firmware length: %d\n", data_len);
 
-	return kaweth_control(kaweth,
-		              usb_sndctrlpipe(kaweth->dev, 0),
+	return usb_control_msg(kaweth->dev, usb_sndctrlpipe(kaweth->dev, 0),
 			      KAWETH_COMMAND_SCAN,
 			      USB_TYPE_VENDOR | USB_DIR_OUT | USB_RECIP_DEVICE,
-			      0,
-			      0,
-			      (void *)kaweth->firmware_buf,
-			      data_len,
+			      0, 0,
+			      kaweth->firmware_buf, data_len,
 			      KAWETH_CONTROL_TIMEOUT);
 }
 
@@ -433,15 +403,12 @@ static int kaweth_trigger_firmware(struc
 	kaweth->firmware_buf[6] = 0x00;
 	kaweth->firmware_buf[7] = 0x00;
 
-	return kaweth_control(kaweth,
-			      usb_sndctrlpipe(kaweth->dev, 0),
-			      KAWETH_COMMAND_SCAN,
-			      USB_TYPE_VENDOR | USB_DIR_OUT | USB_RECIP_DEVICE,
-			      0,
-			      0,
-			      (void *)kaweth->firmware_buf,
-			      8,
-			      KAWETH_CONTROL_TIMEOUT);
+	return usb_control_msg(kaweth->dev, usb_sndctrlpipe(kaweth->dev, 0),
+			       KAWETH_COMMAND_SCAN,
+			       USB_TYPE_VENDOR | USB_DIR_OUT | USB_RECIP_DEVICE,
+			       0, 0,
+			       (void *)kaweth->firmware_buf, 8,
+			       KAWETH_CONTROL_TIMEOUT);
 }
 
 /****************************************************************

