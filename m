Return-Path: <linux-usb+bounces-3390-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8D97FAEE1
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 01:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9057E1C20D87
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 00:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF5537B;
	Tue, 28 Nov 2023 00:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE981B5;
	Mon, 27 Nov 2023 16:10:25 -0800 (PST)
Received: from localhost ([80.209.221.177]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M3D7V-1r8ZxY038H-003cQK; Tue, 28 Nov 2023 01:10:13 +0100
From: Simon Holesch <simon@holesch.de>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Simon Holesch <simon@holesch.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usbip: Don't submit special requests twice
Date: Tue, 28 Nov 2023 01:08:38 +0100
Message-ID: <20231128000955.119735-1-simon@holesch.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yaT8GrMGKox30IcOxLlde7oHV4xdJabiL38Zi8fSjsqkyh7HsLX
 xRp+XZzFggN7nzm3k3ZZCkXXAHhQx+63le7f+36D8F0iUCBvSdkVD+kw7LtyFdVTlt8QUKN
 s3MM1wyz5FEFhalOvF5S+waiqC59k4qo+NG6KjxmyY7TgKkmtP/whzoKMPlt232611jeaEm
 OAFp8ywMxTU+xxrhOw6nA==
UI-OutboundReport: notjunk:1;M01:P0:MX6kUwJ+B84=;XAoCNl4J953uBn/94ppPqkjcpaW
 rdo41RwGfvy4/K7lGdcpYi9Tj7IVpFtDFbbRxA2HF+hIieqmiAEGH5U1wdi36i65M4NJav+kW
 oS1rY10o6GSh94O4LSeTRHFmZAmNoF4+Nc3ZR/OQaoCzs5GD77ZULKsSaLwsH89fRSMw5MKmx
 MWFe3xiuM3p3nOSnoVspZ+ZKESzhC941c0d3p3sKfrc4suHjrViq+iBuxjWg73iquk/aqwruz
 J4+qy70ERZ6qPU+rGRqkJcoisaTXk/qR/YlVNgojrsCPF/WeWRVk/F1ZMWPUoa/q3Vo0ntmam
 xOMFpVzZTyuMs497ai+KE03BIS1wr2svTLc8shtYKJRTVeLs42s9lry4w7+X/ENfMZL7XQLGK
 R7F1OYDZGYY7DudBqhjIQ8ZsYXgmCTlXcV/BgZ7kWRgwzgACyLLWhq7CB11x8eYXCr/hXjx2U
 7X/GmHkjQWlarD+azbfydEUCKbiofRGzUP/tBA6baTVvHSQkGODC8KnVnyTsckK2nkQ1T/tkm
 u3VUHBp0sTV52m/PsifybVz2Xm2P0IFQTds6QK99MQbJPZoFhfP6n7xoZf4zHtiDolGPgu4sT
 /gLBLHEY2NSF9q8o+bJJOor21p8UMJ8oTNOQHrUaGPEcPfb+azl4YIUMtBRTHpRBxpTFkb82j
 h+Rs7sB/crY2mS1N4JRNY7LYnzt2Iag9935877oOJSMHRj6BvbMrfSLWeFE8yCLjSZEno3EuS
 3kFprHFGqVURDIrOG+Ewwt6fzGVhpgDm7JnJEPM6veGj53wcwHBVi8npuB53hImtG+eww5xDF
 q0bKslFrPInnkMLtL3YmTH3DhaVr6rM80kQkBTed4hsKxtzmYiDasYLPMJek68+cdr07mtnga
 GwHILWtBv3F8b4A==

Skip submitting URBs, when identical requests were already sent in
tweak_special_requests(). Instead call the completion handler directly
to return the result of the URB.

Even though submitting those requests twice should be harmless, there
are USB devices that react poorly to some duplicated requests.

One example is the ChipIdea controller implementation in U-Boot: The
second SET_CONFIURATION request makes U-Boot disable and re-enable all
endpoints. Re-enabling an endpoint in the ChipIdea controller, however,
was broken until U-Boot commit b272c8792502 ("usb: ci: Fix gadget
reinit").

Signed-off-by: Simon Holesch <simon@holesch.de>
---

Changes in v2:
- explain change in commit message

Thanks for the feedback!

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


