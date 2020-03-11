Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7070C1814D7
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2020 10:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728721AbgCKJaH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Mar 2020 05:30:07 -0400
Received: from mx2.suse.de ([195.135.220.15]:58658 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728704AbgCKJaG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Mar 2020 05:30:06 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id B2907AC1E;
        Wed, 11 Mar 2020 09:30:04 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] USB: mon: Use scnprintf() for avoiding potential buffer overflow
Date:   Wed, 11 Mar 2020 10:30:03 +0100
Message-Id: <20200311093003.24604-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since snprintf() returns the would-be-output size instead of the
actual output size, the succeeding calls may go beyond the given
buffer limit.  Fix it by replacing with scnprintf().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/usb/mon/mon_text.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/mon/mon_text.c b/drivers/usb/mon/mon_text.c
index bc5ecd5ff565..39cb14164652 100644
--- a/drivers/usb/mon/mon_text.c
+++ b/drivers/usb/mon/mon_text.c
@@ -414,7 +414,7 @@ static ssize_t mon_text_read_t(struct file *file, char __user *buf,
 
 		mon_text_read_head_t(rp, &ptr, ep);
 		mon_text_read_statset(rp, &ptr, ep);
-		ptr.cnt += snprintf(ptr.pbuf + ptr.cnt, ptr.limit - ptr.cnt,
+		ptr.cnt += scnprintf(ptr.pbuf + ptr.cnt, ptr.limit - ptr.cnt,
 		    " %d", ep->length);
 		mon_text_read_data(rp, &ptr, ep);
 
@@ -462,7 +462,7 @@ static ssize_t mon_text_read_u(struct file *file, char __user *buf,
 		} else {
 			mon_text_read_statset(rp, &ptr, ep);
 		}
-		ptr.cnt += snprintf(ptr.pbuf + ptr.cnt, ptr.limit - ptr.cnt,
+		ptr.cnt += scnprintf(ptr.pbuf + ptr.cnt, ptr.limit - ptr.cnt,
 		    " %d", ep->length);
 		mon_text_read_data(rp, &ptr, ep);
 
@@ -520,7 +520,7 @@ static void mon_text_read_head_t(struct mon_reader_text *rp,
 	case USB_ENDPOINT_XFER_CONTROL:	utype = 'C'; break;
 	default: /* PIPE_BULK */  utype = 'B';
 	}
-	p->cnt += snprintf(p->pbuf + p->cnt, p->limit - p->cnt,
+	p->cnt += scnprintf(p->pbuf + p->cnt, p->limit - p->cnt,
 	    "%lx %u %c %c%c:%03u:%02u",
 	    ep->id, ep->tstamp, ep->type,
 	    utype, udir, ep->devnum, ep->epnum);
@@ -538,7 +538,7 @@ static void mon_text_read_head_u(struct mon_reader_text *rp,
 	case USB_ENDPOINT_XFER_CONTROL:	utype = 'C'; break;
 	default: /* PIPE_BULK */  utype = 'B';
 	}
-	p->cnt += snprintf(p->pbuf + p->cnt, p->limit - p->cnt,
+	p->cnt += scnprintf(p->pbuf + p->cnt, p->limit - p->cnt,
 	    "%lx %u %c %c%c:%d:%03u:%u",
 	    ep->id, ep->tstamp, ep->type,
 	    utype, udir, ep->busnum, ep->devnum, ep->epnum);
@@ -549,7 +549,7 @@ static void mon_text_read_statset(struct mon_reader_text *rp,
 {
 
 	if (ep->setup_flag == 0) {   /* Setup packet is present and captured */
-		p->cnt += snprintf(p->pbuf + p->cnt, p->limit - p->cnt,
+		p->cnt += scnprintf(p->pbuf + p->cnt, p->limit - p->cnt,
 		    " s %02x %02x %04x %04x %04x",
 		    ep->setup[0],
 		    ep->setup[1],
@@ -557,10 +557,10 @@ static void mon_text_read_statset(struct mon_reader_text *rp,
 		    (ep->setup[5] << 8) | ep->setup[4],
 		    (ep->setup[7] << 8) | ep->setup[6]);
 	} else if (ep->setup_flag != '-') { /* Unable to capture setup packet */
-		p->cnt += snprintf(p->pbuf + p->cnt, p->limit - p->cnt,
+		p->cnt += scnprintf(p->pbuf + p->cnt, p->limit - p->cnt,
 		    " %c __ __ ____ ____ ____", ep->setup_flag);
 	} else {                     /* No setup for this kind of URB */
-		p->cnt += snprintf(p->pbuf + p->cnt, p->limit - p->cnt,
+		p->cnt += scnprintf(p->pbuf + p->cnt, p->limit - p->cnt,
 		    " %d", ep->status);
 	}
 }
@@ -568,7 +568,7 @@ static void mon_text_read_statset(struct mon_reader_text *rp,
 static void mon_text_read_intstat(struct mon_reader_text *rp,
 	struct mon_text_ptr *p, const struct mon_event_text *ep)
 {
-	p->cnt += snprintf(p->pbuf + p->cnt, p->limit - p->cnt,
+	p->cnt += scnprintf(p->pbuf + p->cnt, p->limit - p->cnt,
 	    " %d:%d", ep->status, ep->interval);
 }
 
@@ -576,10 +576,10 @@ static void mon_text_read_isostat(struct mon_reader_text *rp,
 	struct mon_text_ptr *p, const struct mon_event_text *ep)
 {
 	if (ep->type == 'S') {
-		p->cnt += snprintf(p->pbuf + p->cnt, p->limit - p->cnt,
+		p->cnt += scnprintf(p->pbuf + p->cnt, p->limit - p->cnt,
 		    " %d:%d:%d", ep->status, ep->interval, ep->start_frame);
 	} else {
-		p->cnt += snprintf(p->pbuf + p->cnt, p->limit - p->cnt,
+		p->cnt += scnprintf(p->pbuf + p->cnt, p->limit - p->cnt,
 		    " %d:%d:%d:%d",
 		    ep->status, ep->interval, ep->start_frame, ep->error_count);
 	}
@@ -592,7 +592,7 @@ static void mon_text_read_isodesc(struct mon_reader_text *rp,
 	int i;
 	const struct mon_iso_desc *dp;
 
-	p->cnt += snprintf(p->pbuf + p->cnt, p->limit - p->cnt,
+	p->cnt += scnprintf(p->pbuf + p->cnt, p->limit - p->cnt,
 	    " %d", ep->numdesc);
 	ndesc = ep->numdesc;
 	if (ndesc > ISODESC_MAX)
@@ -601,7 +601,7 @@ static void mon_text_read_isodesc(struct mon_reader_text *rp,
 		ndesc = 0;
 	dp = ep->isodesc;
 	for (i = 0; i < ndesc; i++) {
-		p->cnt += snprintf(p->pbuf + p->cnt, p->limit - p->cnt,
+		p->cnt += scnprintf(p->pbuf + p->cnt, p->limit - p->cnt,
 		    " %d:%u:%u", dp->status, dp->offset, dp->length);
 		dp++;
 	}
@@ -614,28 +614,28 @@ static void mon_text_read_data(struct mon_reader_text *rp,
 
 	if ((data_len = ep->length) > 0) {
 		if (ep->data_flag == 0) {
-			p->cnt += snprintf(p->pbuf + p->cnt, p->limit - p->cnt,
+			p->cnt += scnprintf(p->pbuf + p->cnt, p->limit - p->cnt,
 			    " =");
 			if (data_len >= DATA_MAX)
 				data_len = DATA_MAX;
 			for (i = 0; i < data_len; i++) {
 				if (i % 4 == 0) {
-					p->cnt += snprintf(p->pbuf + p->cnt,
+					p->cnt += scnprintf(p->pbuf + p->cnt,
 					    p->limit - p->cnt,
 					    " ");
 				}
-				p->cnt += snprintf(p->pbuf + p->cnt,
+				p->cnt += scnprintf(p->pbuf + p->cnt,
 				    p->limit - p->cnt,
 				    "%02x", ep->data[i]);
 			}
-			p->cnt += snprintf(p->pbuf + p->cnt, p->limit - p->cnt,
+			p->cnt += scnprintf(p->pbuf + p->cnt, p->limit - p->cnt,
 			    "\n");
 		} else {
-			p->cnt += snprintf(p->pbuf + p->cnt, p->limit - p->cnt,
+			p->cnt += scnprintf(p->pbuf + p->cnt, p->limit - p->cnt,
 			    " %c\n", ep->data_flag);
 		}
 	} else {
-		p->cnt += snprintf(p->pbuf + p->cnt, p->limit - p->cnt, "\n");
+		p->cnt += scnprintf(p->pbuf + p->cnt, p->limit - p->cnt, "\n");
 	}
 }
 
-- 
2.16.4

