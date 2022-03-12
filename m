Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2A404D70DC
	for <lists+linux-usb@lfdr.de>; Sat, 12 Mar 2022 21:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232624AbiCLU3w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 12 Mar 2022 15:29:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbiCLU3v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Mar 2022 15:29:51 -0500
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B969C8EB40
        for <linux-usb@vger.kernel.org>; Sat, 12 Mar 2022 12:28:39 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 9962420AA5E8
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
Subject: [PATCH 1/2] usb: host: uhci-debug: use scnprintf() instead of sprintf()
Date:   Sat, 12 Mar 2022 23:28:33 +0300
Message-ID: <20220312202834.11700-2-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20220312202834.11700-1-s.shtylyov@omp.ru>
References: <20220312202834.11700-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The UHCI driver's debugging code uses a lot of sprintf() calls with the
large buffers, leaving some space at the end of the buffers to handle the
buffer overflow. Using scnprntf() instead eliminates the very possibility
of the buffer overflow, while simplifying the code at the expense of not
printing an ellipsis when the end of buffer is actually reached...

Found by Linux Verification Center (linuxtesting.org) with the SVACE static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/usb/host/uhci-debug.c | 258 ++++++++++++----------------------
 1 file changed, 90 insertions(+), 168 deletions(-)

diff --git a/drivers/usb/host/uhci-debug.c b/drivers/usb/host/uhci-debug.c
index c4e67c4b51f6..b5425dbd3e2d 100644
--- a/drivers/usb/host/uhci-debug.c
+++ b/drivers/usb/host/uhci-debug.c
@@ -43,14 +43,14 @@ static void lprintk(char *buf)
 static int uhci_show_td(struct uhci_hcd *uhci, struct uhci_td *td, char *buf,
 			int len, int space)
 {
-	char *out = buf;
 	char *spid;
 	u32 status, token;
+	int n = 0;
 
 	status = td_status(uhci, td);
-	out += sprintf(out, "%*s[%p] link (%08x) ", space, "", td,
+	n += scnprintf(buf + n, len - n, "%*s[%p] link (%08x) ", space, "", td,
 		hc32_to_cpu(uhci, td->link));
-	out += sprintf(out, "e%d %s%s%s%s%s%s%s%s%s%sLength=%x ",
+	n += scnprintf(buf + n, len - n, "e%d %s%s%s%s%s%s%s%s%s%sLength=%x ",
 		((status >> 27) & 3),
 		(status & TD_CTRL_SPD) ?      "SPD " : "",
 		(status & TD_CTRL_LS) ?       "LS " : "",
@@ -63,8 +63,6 @@ static int uhci_show_td(struct uhci_hcd *uhci, struct uhci_td *td, char *buf,
 		(status & TD_CTRL_CRCTIMEO) ? "CRC/Timeo " : "",
 		(status & TD_CTRL_BITSTUFF) ? "BitStuff " : "",
 		status & 0x7ff);
-	if (out - buf > len)
-		goto done;
 
 	token = td_token(uhci, td);
 	switch (uhci_packetid(token)) {
@@ -82,38 +80,35 @@ static int uhci_show_td(struct uhci_hcd *uhci, struct uhci_td *td, char *buf,
 			break;
 	}
 
-	out += sprintf(out, "MaxLen=%x DT%d EndPt=%x Dev=%x, PID=%x(%s) ",
+	n += scnprintf(buf + n, len - n,
+		"MaxLen=%x DT%d EndPt=%x Dev=%x, PID=%x(%s) ",
 		token >> 21,
 		((token >> 19) & 1),
 		(token >> 15) & 15,
 		(token >> 8) & 127,
 		(token & 0xff),
 		spid);
-	out += sprintf(out, "(buf=%08x)\n", hc32_to_cpu(uhci, td->buffer));
+	n += scnprintf(buf + n, len - n, "(buf=%08x)\n",
+			hc32_to_cpu(uhci, td->buffer));
 
-done:
-	if (out - buf > len)
-		out += sprintf(out, " ...\n");
-	return out - buf;
+	return n;
 }
 
 static int uhci_show_urbp(struct uhci_hcd *uhci, struct urb_priv *urbp,
 			char *buf, int len, int space)
 {
-	char *out = buf;
 	struct uhci_td *td;
 	int i, nactive, ninactive;
 	char *ptype;
-
-
-	out += sprintf(out, "urb_priv [%p] ", urbp);
-	out += sprintf(out, "urb [%p] ", urbp->urb);
-	out += sprintf(out, "qh [%p] ", urbp->qh);
-	out += sprintf(out, "Dev=%d ", usb_pipedevice(urbp->urb->pipe));
-	out += sprintf(out, "EP=%x(%s) ", usb_pipeendpoint(urbp->urb->pipe),
+	int n = 0;
+
+	n += scnprintf(buf + n, len - n, "urb_priv [%p] ", urbp);
+	n += scnprintf(buf + n, len - n, "urb [%p] ", urbp->urb);
+	n += scnprintf(buf + n, len - n, "qh [%p] ", urbp->qh);
+	n += scnprintf(buf + n, len - n, "Dev=%d ", usb_pipedevice(urbp->urb->pipe));
+	n += scnprintf(buf + n, len - n, "EP=%x(%s) ",
+			usb_pipeendpoint(urbp->urb->pipe),
 			(usb_pipein(urbp->urb->pipe) ? "IN" : "OUT"));
-	if (out - buf > len)
-		goto done;
 
 	switch (usb_pipetype(urbp->urb->pipe)) {
 	case PIPE_ISOCHRONOUS: ptype = "ISO"; break;
@@ -123,27 +118,21 @@ static int uhci_show_urbp(struct uhci_hcd *uhci, struct urb_priv *urbp,
 	case PIPE_CONTROL: ptype = "CTL"; break;
 	}
 
-	out += sprintf(out, "%s%s", ptype, (urbp->fsbr ? " FSBR" : ""));
-	out += sprintf(out, " Actlen=%d%s", urbp->urb->actual_length,
+	n += scnprintf(buf + n, len - n, "%s%s", ptype, (urbp->fsbr ? " FSBR" : ""));
+	n += scnprintf(buf + n, len - n, " Actlen=%d%s", urbp->urb->actual_length,
 			(urbp->qh->type == USB_ENDPOINT_XFER_CONTROL ?
 				"-8" : ""));
 
 	if (urbp->urb->unlinked)
-		out += sprintf(out, " Unlinked=%d", urbp->urb->unlinked);
-	out += sprintf(out, "\n");
-
-	if (out - buf > len)
-		goto done;
+		n += scnprintf(buf + n, len - n, " Unlinked=%d", urbp->urb->unlinked);
+	n += scnprintf(buf + n, len - n, "\n");
 
 	i = nactive = ninactive = 0;
 	list_for_each_entry(td, &urbp->td_list, list) {
 		if (urbp->qh->type != USB_ENDPOINT_XFER_ISOC &&
 				(++i <= 10 || debug > 2)) {
-			out += sprintf(out, "%*s%d: ", space + 2, "", i);
-			out += uhci_show_td(uhci, td, out,
-					len - (out - buf), 0);
-			if (out - buf > len)
-				goto tail;
+			n += scnprintf(buf + n, len - n, "%*s%d: ", space + 2, "", i);
+			n += uhci_show_td(uhci, td, buf + n, len - n, 0);
 		} else {
 			if (td_status(uhci, td) & TD_CTRL_ACTIVE)
 				++nactive;
@@ -152,23 +141,19 @@ static int uhci_show_urbp(struct uhci_hcd *uhci, struct urb_priv *urbp,
 		}
 	}
 	if (nactive + ninactive > 0)
-		out += sprintf(out,
+		n += scnprintf(buf + n, len - n,
 				"%*s[skipped %d inactive and %d active TDs]\n",
 				space, "", ninactive, nactive);
-done:
-	if (out - buf > len)
-		out += sprintf(out, " ...\n");
-tail:
-	return out - buf;
+	return n;
 }
 
 static int uhci_show_qh(struct uhci_hcd *uhci,
 		struct uhci_qh *qh, char *buf, int len, int space)
 {
-	char *out = buf;
 	int i, nurbs;
 	__hc32 element = qh_element(qh);
 	char *qtype;
+	int n = 0;
 
 	switch (qh->type) {
 	case USB_ENDPOINT_XFER_ISOC: qtype = "ISO"; break;
@@ -178,43 +163,37 @@ static int uhci_show_qh(struct uhci_hcd *uhci,
 	default: qtype = "Skel" ; break;
 	}
 
-	out += sprintf(out, "%*s[%p] %s QH link (%08x) element (%08x)\n",
+	n += scnprintf(buf + n, len - n, "%*s[%p] %s QH link (%08x) element (%08x)\n",
 			space, "", qh, qtype,
 			hc32_to_cpu(uhci, qh->link),
 			hc32_to_cpu(uhci, element));
 	if (qh->type == USB_ENDPOINT_XFER_ISOC)
-		out += sprintf(out,
+		n += scnprintf(buf + n, len - n,
 				"%*s    period %d phase %d load %d us, frame %x desc [%p]\n",
 				space, "", qh->period, qh->phase, qh->load,
 				qh->iso_frame, qh->iso_packet_desc);
 	else if (qh->type == USB_ENDPOINT_XFER_INT)
-		out += sprintf(out, "%*s    period %d phase %d load %d us\n",
+		n += scnprintf(buf + n, len - n, "%*s    period %d phase %d load %d us\n",
 				space, "", qh->period, qh->phase, qh->load);
-	if (out - buf > len)
-		goto done;
 
 	if (element & UHCI_PTR_QH(uhci))
-		out += sprintf(out, "%*s  Element points to QH (bug?)\n", space, "");
+		n += scnprintf(buf + n, len - n, "%*s  Element points to QH (bug?)\n",
+				space, "");
 
 	if (element & UHCI_PTR_DEPTH(uhci))
-		out += sprintf(out, "%*s  Depth traverse\n", space, "");
+		n += scnprintf(buf + n, len - n, "%*s  Depth traverse\n", space, "");
 
 	if (element & cpu_to_hc32(uhci, 8))
-		out += sprintf(out, "%*s  Bit 3 set (bug?)\n", space, "");
+		n += scnprintf(buf + n, len - n, "%*s  Bit 3 set (bug?)\n", space, "");
 
 	if (!(element & ~(UHCI_PTR_QH(uhci) | UHCI_PTR_DEPTH(uhci))))
-		out += sprintf(out, "%*s  Element is NULL (bug?)\n", space, "");
-
-	if (out - buf > len)
-		goto done;
+		n += scnprintf(buf + n, len - n, "%*s  Element is NULL (bug?)\n", space, "");
 
 	if (list_empty(&qh->queue)) {
-		out += sprintf(out, "%*s  queue is empty\n", space, "");
+		n += scnprintf(buf + n, len - n, "%*s  queue is empty\n", space, "");
 		if (qh == uhci->skel_async_qh) {
-			out += uhci_show_td(uhci, uhci->term_td, out,
-					len - (out - buf), 0);
-			if (out - buf > len)
-				goto tail;
+			n += uhci_show_td(uhci, uhci->term_td, buf + n,
+					len - n, 0);
 		}
 	} else {
 		struct urb_priv *urbp = list_entry(qh->queue.next,
@@ -223,45 +202,32 @@ static int uhci_show_qh(struct uhci_hcd *uhci,
 				struct uhci_td, list);
 
 		if (element != LINK_TO_TD(uhci, td))
-			out += sprintf(out, "%*s Element != First TD\n",
+			n += scnprintf(buf + n, len - n, "%*s Element != First TD\n",
 					space, "");
 		i = nurbs = 0;
 		list_for_each_entry(urbp, &qh->queue, node) {
-			if (++i <= 10) {
-				out += uhci_show_urbp(uhci, urbp, out,
-						len - (out - buf), space + 2);
-				if (out - buf > len)
-					goto tail;
-			}
+			if (++i <= 10)
+				n += uhci_show_urbp(uhci, urbp, buf + n,
+						len - n, space + 2);
 			else
 				++nurbs;
 		}
 		if (nurbs > 0)
-			out += sprintf(out, "%*s Skipped %d URBs\n",
+			n += scnprintf(buf + n, len - n, "%*s Skipped %d URBs\n",
 					space, "", nurbs);
 	}
 
-	if (out - buf > len)
-		goto done;
-
 	if (qh->dummy_td) {
-		out += sprintf(out, "%*s  Dummy TD\n", space, "");
-		out += uhci_show_td(uhci, qh->dummy_td, out,
-				len - (out - buf), 0);
-		if (out - buf > len)
-			goto tail;
+		n += scnprintf(buf + n, len - n, "%*s  Dummy TD\n", space, "");
+		n += uhci_show_td(uhci, qh->dummy_td, buf + n, len - n, 0);
 	}
 
-done:
-	if (out - buf > len)
-		out += sprintf(out, " ...\n");
-tail:
-	return out - buf;
+	return n;
 }
 
-static int uhci_show_sc(int port, unsigned short status, char *buf)
+static int uhci_show_sc(int port, unsigned short status, char *buf, int len)
 {
-	return sprintf(buf, "  stat%d     =     %04x  %s%s%s%s%s%s%s%s%s%s\n",
+	return scnprintf(buf, len, "  stat%d     =     %04x  %s%s%s%s%s%s%s%s%s%s\n",
 		port,
 		status,
 		(status & USBPORTSC_SUSP) ?	" Suspend" : "",
@@ -276,7 +242,7 @@ static int uhci_show_sc(int port, unsigned short status, char *buf)
 		(status & USBPORTSC_CCS) ?	" Connected" : "");
 }
 
-static int uhci_show_root_hub_state(struct uhci_hcd *uhci, char *buf)
+static int uhci_show_root_hub_state(struct uhci_hcd *uhci, char *buf, int len)
 {
 	char *rh_state;
 
@@ -298,18 +264,17 @@ static int uhci_show_root_hub_state(struct uhci_hcd *uhci, char *buf)
 	    default:
 		rh_state = "?";			break;
 	}
-	return sprintf(buf, "Root-hub state: %s   FSBR: %d\n",
+	return scnprintf(buf, len, "Root-hub state: %s   FSBR: %d\n",
 			rh_state, uhci->fsbr_is_on);
 }
 
 static int uhci_show_status(struct uhci_hcd *uhci, char *buf, int len)
 {
-	char *out = buf;
 	unsigned short usbcmd, usbstat, usbint, usbfrnum;
 	unsigned int flbaseadd;
 	unsigned char sof;
 	unsigned short portsc1, portsc2;
-
+	int n = 0;
 
 	usbcmd    = uhci_readw(uhci, USBCMD);
 	usbstat   = uhci_readw(uhci, USBSTS);
@@ -320,7 +285,7 @@ static int uhci_show_status(struct uhci_hcd *uhci, char *buf, int len)
 	portsc1   = uhci_readw(uhci, USBPORTSC1);
 	portsc2   = uhci_readw(uhci, USBPORTSC2);
 
-	out += sprintf(out, "  usbcmd    =     %04x   %s%s%s%s%s%s%s%s\n",
+	n += scnprintf(buf + n, len - n, "  usbcmd    =     %04x   %s%s%s%s%s%s%s%s\n",
 		usbcmd,
 		(usbcmd & USBCMD_MAXP) ?    "Maxp64 " : "Maxp32 ",
 		(usbcmd & USBCMD_CF) ?      "CF " : "",
@@ -330,10 +295,8 @@ static int uhci_show_status(struct uhci_hcd *uhci, char *buf, int len)
 		(usbcmd & USBCMD_GRESET) ?  "GRESET " : "",
 		(usbcmd & USBCMD_HCRESET) ? "HCRESET " : "",
 		(usbcmd & USBCMD_RS) ?      "RS " : "");
-	if (out - buf > len)
-		goto done;
 
-	out += sprintf(out, "  usbstat   =     %04x   %s%s%s%s%s%s\n",
+	n += scnprintf(buf + n, len - n, "  usbstat   =     %04x   %s%s%s%s%s%s\n",
 		usbstat,
 		(usbstat & USBSTS_HCH) ?    "HCHalted " : "",
 		(usbstat & USBSTS_HCPE) ?   "HostControllerProcessError " : "",
@@ -341,39 +304,27 @@ static int uhci_show_status(struct uhci_hcd *uhci, char *buf, int len)
 		(usbstat & USBSTS_RD) ?     "ResumeDetect " : "",
 		(usbstat & USBSTS_ERROR) ?  "USBError " : "",
 		(usbstat & USBSTS_USBINT) ? "USBINT " : "");
-	if (out - buf > len)
-		goto done;
-
-	out += sprintf(out, "  usbint    =     %04x\n", usbint);
-	out += sprintf(out, "  usbfrnum  =   (%d)%03x\n", (usbfrnum >> 10) & 1,
-		0xfff & (4*(unsigned int)usbfrnum));
-	out += sprintf(out, "  flbaseadd = %08x\n", flbaseadd);
-	out += sprintf(out, "  sof       =       %02x\n", sof);
-	if (out - buf > len)
-		goto done;
-
-	out += uhci_show_sc(1, portsc1, out);
-	if (out - buf > len)
-		goto done;
-
-	out += uhci_show_sc(2, portsc2, out);
-	if (out - buf > len)
-		goto done;
-
-	out += sprintf(out,
+
+	n += scnprintf(buf + n, len - n, "  usbint    =     %04x\n", usbint);
+	n += scnprintf(buf + n, len - n, "  usbfrnum  =   (%d)%03x\n",
+		(usbfrnum >> 10) & 1, 0xfff & (4 * (unsigned int)usbfrnum));
+	n += scnprintf(buf + n, len - n, "  flbaseadd = %08x\n", flbaseadd);
+	n += scnprintf(buf + n, len - n, "  sof       =       %02x\n", sof);
+
+	n += uhci_show_sc(1, portsc1, buf + n, len - n);
+
+	n += uhci_show_sc(2, portsc2, buf + n, len - n);
+
+	n += scnprintf(buf + n, len - n,
 			"Most recent frame: %x (%d)   Last ISO frame: %x (%d)\n",
 			uhci->frame_number, uhci->frame_number & 1023,
 			uhci->last_iso_frame, uhci->last_iso_frame & 1023);
 
-done:
-	if (out - buf > len)
-		out += sprintf(out, " ...\n");
-	return out - buf;
+	return n;
 }
 
 static int uhci_sprint_schedule(struct uhci_hcd *uhci, char *buf, int len)
 {
-	char *out = buf;
 	int i, j;
 	struct uhci_qh *qh;
 	struct uhci_td *td;
@@ -381,41 +332,36 @@ static int uhci_sprint_schedule(struct uhci_hcd *uhci, char *buf, int len)
 	int nframes, nerrs;
 	__hc32 link;
 	__hc32 fsbr_link;
+	int n = 0;
 
 	static const char * const qh_names[] = {
 		"unlink", "iso", "int128", "int64", "int32", "int16",
 		"int8", "int4", "int2", "async", "term"
 	};
 
-	out += uhci_show_root_hub_state(uhci, out);
-	if (out - buf > len)
-		goto done;
-	out += sprintf(out, "HC status\n");
-	out += uhci_show_status(uhci, out, len - (out - buf));
-	if (out - buf > len)
-		goto tail;
+	n += uhci_show_root_hub_state(uhci, buf + n, len - n);
+	n += scnprintf(buf + n, len - n, "HC status\n");
+	n += uhci_show_status(uhci, buf + n, len - n);
 
-	out += sprintf(out, "Periodic load table\n");
+	n += scnprintf(buf + n, len - n, "Periodic load table\n");
 	for (i = 0; i < MAX_PHASE; ++i) {
-		out += sprintf(out, "\t%d", uhci->load[i]);
+		n += scnprintf(buf + n, len - n, "\t%d", uhci->load[i]);
 		if (i % 8 == 7)
-			*out++ = '\n';
+			buf[n++] = '\n';
 	}
-	out += sprintf(out, "Total: %d, #INT: %d, #ISO: %d\n",
+	n += scnprintf(buf + n, len - n, "Total: %d, #INT: %d, #ISO: %d\n",
 			uhci->total_load,
 			uhci_to_hcd(uhci)->self.bandwidth_int_reqs,
 			uhci_to_hcd(uhci)->self.bandwidth_isoc_reqs);
 	if (debug <= 1)
 		goto tail;
 
-	out += sprintf(out, "Frame List\n");
+	n += scnprintf(buf + n, len - n, "Frame List\n");
 	nframes = 10;
 	nerrs = 0;
 	for (i = 0; i < UHCI_NUMFRAMES; ++i) {
 		__hc32 qh_dma;
 
-		if (out - buf > len)
-			goto done;
 		j = 0;
 		td = uhci->frame_cpu[i];
 		link = uhci->frame[i];
@@ -423,7 +369,7 @@ static int uhci_sprint_schedule(struct uhci_hcd *uhci, char *buf, int len)
 			goto check_link;
 
 		if (nframes > 0) {
-			out += sprintf(out, "- Frame %d -> (%08x)\n",
+			n += scnprintf(buf + n, len - n, "- Frame %d -> (%08x)\n",
 					i, hc32_to_cpu(uhci, link));
 			j = 1;
 		}
@@ -435,19 +381,13 @@ static int uhci_sprint_schedule(struct uhci_hcd *uhci, char *buf, int len)
 			tmp = tmp->next;
 			if (link != LINK_TO_TD(uhci, td)) {
 				if (nframes > 0) {
-					out += sprintf(out,
+					n += scnprintf(buf + n, len - n,
 						"    link does not match list entry!\n");
-					if (out - buf > len)
-						goto done;
 				} else
 					++nerrs;
 			}
-			if (nframes > 0) {
-				out += uhci_show_td(uhci, td, out,
-						len - (out - buf), 4);
-				if (out - buf > len)
-					goto tail;
-			}
+			if (nframes > 0)
+				n += uhci_show_td(uhci, td, buf + n, len - n, 4);
 			link = td->link;
 		} while (tmp != head);
 
@@ -456,46 +396,37 @@ static int uhci_sprint_schedule(struct uhci_hcd *uhci, char *buf, int len)
 		if (link != qh_dma) {
 			if (nframes > 0) {
 				if (!j) {
-					out += sprintf(out,
+					n += scnprintf(buf + n, len - n,
 						"- Frame %d -> (%08x)\n",
 						i, hc32_to_cpu(uhci, link));
 					j = 1;
 				}
-				out += sprintf(out,
+				n += scnprintf(buf + n, len - n,
 					"   link does not match QH (%08x)!\n",
 					hc32_to_cpu(uhci, qh_dma));
-				if (out - buf > len)
-					goto done;
 			} else
 				++nerrs;
 		}
 		nframes -= j;
 	}
 	if (nerrs > 0)
-		out += sprintf(out, "Skipped %d bad links\n", nerrs);
-
-	out += sprintf(out, "Skeleton QHs\n");
+		n += scnprintf(buf + n, len - n, "Skipped %d bad links\n", nerrs);
 
-	if (out - buf > len)
-		goto done;
+	n += scnprintf(buf + n, len - n, "Skeleton QHs\n");
 
 	fsbr_link = 0;
 	for (i = 0; i < UHCI_NUM_SKELQH; ++i) {
 		int cnt = 0;
 
 		qh = uhci->skelqh[i];
-		out += sprintf(out, "- skel_%s_qh\n", qh_names[i]);
-		out += uhci_show_qh(uhci, qh, out, len - (out - buf), 4);
-		if (out - buf > len)
-			goto tail;
+		n += scnprintf(buf + n, len - n, "- skel_%s_qh\n", qh_names[i]);
+		n += uhci_show_qh(uhci, qh, buf + n, len - n, 4);
 
 		/* Last QH is the Terminating QH, it's different */
 		if (i == SKEL_TERM) {
 			if (qh_element(qh) != LINK_TO_TD(uhci, uhci->term_td)) {
-				out += sprintf(out,
+				n += scnprintf(buf + n, len - n,
 					"    skel_term_qh element is not set to term_td!\n");
-				if (out - buf > len)
-					goto done;
 			}
 			link = fsbr_link;
 			if (!link)
@@ -509,17 +440,14 @@ static int uhci_sprint_schedule(struct uhci_hcd *uhci, char *buf, int len)
 		while (tmp != head) {
 			qh = list_entry(tmp, struct uhci_qh, node);
 			tmp = tmp->next;
-			if (++cnt <= 10) {
-				out += uhci_show_qh(uhci, qh, out,
-						len - (out - buf), 4);
-				if (out - buf > len)
-					goto tail;
-			}
+			if (++cnt <= 10)
+				n += uhci_show_qh(uhci, qh, buf + n, len - n, 4);
 			if (!fsbr_link && qh->skel >= SKEL_FSBR)
 				fsbr_link = LINK_TO_QH(uhci, qh);
 		}
 		if ((cnt -= 10) > 0)
-			out += sprintf(out, "    Skipped %d QHs\n", cnt);
+			n += scnprintf(buf + n, len - n, "    Skipped %d QHs\n",
+					cnt);
 
 		link = UHCI_PTR_TERM(uhci);
 		if (i <= SKEL_ISO)
@@ -532,18 +460,12 @@ static int uhci_sprint_schedule(struct uhci_hcd *uhci, char *buf, int len)
 			link = LINK_TO_QH(uhci, uhci->skel_term_qh);
 check_qh_link:
 		if (qh->link != link)
-			out += sprintf(out,
+			n += scnprintf(buf + n, len - n,
 				"    last QH not linked to next skeleton!\n");
-
-		if (out - buf > len)
-			goto done;
 	}
 
-done:
-	if (out - buf > len)
-		out += sprintf(out, " ...\n");
 tail:
-	return out - buf;
+	return n;
 }
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.26.3
