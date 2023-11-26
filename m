Return-Path: <linux-usb+bounces-3333-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3707F96AC
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 00:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18D751C2085C
	for <lists+linux-usb@lfdr.de>; Sun, 26 Nov 2023 23:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F3F171B4;
	Sun, 26 Nov 2023 23:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
X-Greylist: delayed 309 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 26 Nov 2023 15:54:14 PST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B5A102;
	Sun, 26 Nov 2023 15:54:14 -0800 (PST)
Received: from localhost ([80.209.221.177]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MMXDj-1qq0qA1rpX-00Jcxj; Mon, 27 Nov 2023 00:48:53 +0100
From: Simon Holesch <simon@holesch.de>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Simon Holesch <simon@holesch.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usbip: Don't submit special requests twice
Date: Mon, 27 Nov 2023 00:48:38 +0100
Message-ID: <20231126234839.52434-1-simon@holesch.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Myh3/O7DNkUzsxdbA3hnjGt8tHVIDK593UYHdGm60KzV+hNPThP
 7sHPYk2NM2eacQz3vvnNrD+PaDmpI38dJ+H1nyJgV+3ack/j9AjmhD+ZUeFNP9BU/c/TIFv
 As+q+br0dj4qis9EX9vzZ9dMNFUhbslSNylniegbCsconTVqCkqYnp8PT6Rq+mp5Rj/DGbU
 BZgAewKp104PhWM6GOfIg==
UI-OutboundReport: notjunk:1;M01:P0:OYL6BJpPPx0=;lyOfkxQQ8fFqrfsKObRnto6BMwt
 sxEQQlL2c5tBX6MphCW5ku3M+7I5iqoS+TX38lSsU9Cqr5mOE6kWl3qQSkR/10ljSXwSlm5g1
 8Tr96lLS/hjrw1E2OnRqRvJUQLN/6cVnU8UY5MxK7IZ5lkDxYc+vyjc1qaGaDSsrA/u3wJN0A
 aQ1kdA/SAodc6CVnQ7agFFSFU85qmC1zk8G9VG87s8n09OpmkLYVEjGO13q6MrWhUbGhJOYlF
 9bpXjEj8JtEmfOa7zaWiO59kH1ksNLQQD4VjbwJXaqpK0vPOanPtxZAiK+nTHLP/Gh0YdRpoj
 bGcgYqgOmaXksPfzyulsu6vsRglxhXXORq/0V0HwDxcmMVX0hz1VnhMNf7zGiDsVhycCymZrc
 zT9t4AMGrW7aSgRmT6y0KAEuQxT9YaCy664RZgaLRyjVV2Fa8p4rJ+mr5sDClrjOBoH8Q8KDM
 454S+ezi+FGjNTT/33iZ1IoNJNB5NXLCrRLia9uLnfHg1fcRqopCPeBMJKk/FZY9V+dFCs4Vj
 yqpKHUxXsDK9IL5Rhm00JJXjvmkLAHV3fxWNNuzNLZGSFXvtTSykzSZqX7nYD700M/tW1hx6i
 gUTRTm5dCSKRQWO/ijKVz26sneVm68w9Ek3Jy98/L5IE1TX3YFIsvJ7l1Bcyw4wj5qZPsspSb
 2resWfRF98wu3rffBHZiF0VYhWoVWY7e6lZ3+TNafiNgm6/99uvCSet0XyqG26gPVU04ukyOf
 GOerVaPG1og+OBHSiLahszwA0BS6QtZWyJlYhTiAymTT3Ypjc47x/N9crX0tUaFtBVnxXLJk9
 oEsBVi8sk+AOMBjqB8RpYG7+fSpSqHK6j6vuzZjoVDKLTt6dfv0E1v9ywbymVwZWiGY6K0qJ2
 8xa8FIg8q34ukFg==

Even though submitting those requests twice should be harmless, there
are USB devices that react poorly to some duplicated requests.

One example is the ChipIdea controller implementation in U-Boot: The
second SET_CONFIURATION request makes U-Boot disable and re-enable all
endpoints. Re-enabling an endpoint in the ChipIdea controller, however,
was broken until U-Boot commit b272c8792502 ("usb: ci: Fix gadget
reinit").

Signed-off-by: Simon Holesch <simon@holesch.de>
---
 drivers/usb/usbip/stub_rx.c | 50 ++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
index fc01b31bbb87..f3fcc290ce5b 100644
--- a/drivers/usb/usbip/stub_rx.c
+++ b/drivers/usb/usbip/stub_rx.c
@@ -167,13 +167,13 @@ static int tweak_reset_device_cmd(struct urb *urb)
 /*
  * clear_halt, set_interface, and set_configuration require special tricks.
  */
-static void tweak_special_requests(struct urb *urb)
+static int tweak_special_requests(struct urb *urb)
 {
 	if (!urb || !urb->setup_packet)
-		return;
+		return 0;
 
 	if (usb_pipetype(urb->pipe) != PIPE_CONTROL)
-		return;
+		return 0;
 
 	if (is_clear_halt_cmd(urb))
 		/* tweak clear_halt */
@@ -189,8 +189,12 @@ static void tweak_special_requests(struct urb *urb)
 
 	else if (is_reset_device_cmd(urb))
 		tweak_reset_device_cmd(urb);
-	else
+	else {
 		usbip_dbg_stub_rx("no need to tweak\n");
+		return 0;
+	}
+
+	return 1;
 }
 
 /*
@@ -468,6 +472,7 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
 	int support_sg = 1;
 	int np = 0;
 	int ret, i;
+	int is_tweaked;
 
 	if (pipe == -1)
 		return;
@@ -580,8 +585,7 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
 		priv->urbs[i]->pipe = pipe;
 		priv->urbs[i]->complete = stub_complete;
 
-		/* no need to submit an intercepted request, but harmless? */
-		tweak_special_requests(priv->urbs[i]);
+		is_tweaked = tweak_special_requests(priv->urbs[i]);
 
 		masking_bogus_flags(priv->urbs[i]);
 	}
@@ -594,22 +598,32 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
 
 	/* urb is now ready to submit */
 	for (i = 0; i < priv->num_urbs; i++) {
-		ret = usb_submit_urb(priv->urbs[i], GFP_KERNEL);
+		if (!is_tweaked) {
+			ret = usb_submit_urb(priv->urbs[i], GFP_KERNEL);
 
-		if (ret == 0)
-			usbip_dbg_stub_rx("submit urb ok, seqnum %u\n",
-					pdu->base.seqnum);
-		else {
-			dev_err(&udev->dev, "submit_urb error, %d\n", ret);
-			usbip_dump_header(pdu);
-			usbip_dump_urb(priv->urbs[i]);
+			if (ret == 0)
+				usbip_dbg_stub_rx("submit urb ok, seqnum %u\n",
+						pdu->base.seqnum);
+			else {
+				dev_err(&udev->dev, "submit_urb error, %d\n", ret);
+				usbip_dump_header(pdu);
+				usbip_dump_urb(priv->urbs[i]);
 
+				/*
+				 * Pessimistic.
+				 * This connection will be discarded.
+				 */
+				usbip_event_add(ud, SDEV_EVENT_ERROR_SUBMIT);
+				break;
+			}
+		} else {
 			/*
-			 * Pessimistic.
-			 * This connection will be discarded.
+			 * An identical URB was already submitted in
+			 * tweak_special_requests(). Skip submitting this URB to not
+			 * duplicate the request.
 			 */
-			usbip_event_add(ud, SDEV_EVENT_ERROR_SUBMIT);
-			break;
+			priv->urbs[i]->status = 0;
+			stub_complete(priv->urbs[i]);
 		}
 	}
 
-- 
2.43.0


