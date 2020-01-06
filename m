Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B502E130F94
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2020 10:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgAFJhg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jan 2020 04:37:36 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38917 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgAFJhg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jan 2020 04:37:36 -0500
Received: by mail-lj1-f196.google.com with SMTP id l2so50260436lja.6
        for <linux-usb@vger.kernel.org>; Mon, 06 Jan 2020 01:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Tik343nJgKOlNxCDlOVgWZzW5oT6kvQYJeoL8mg0WE=;
        b=CTFGJIasuj7a/L9jUrYSxppsAneZf9gEllJC97IGBsTElVmppiysCwo46lo72Omi4d
         cxN9mKWWPX9LqYvIDlrMHOhsPHoUEJgHVy4SRqVKp7tl2Cv/STgy88qoIJjXq4qdCsqA
         /Vy0O3c4J3GqYJVDdSw/IaEwLnmPoX74iIEGJr34sAQ2QS26uEMjE48vN8MPA1sUbwOG
         tvWXeoYAoj7aNf+flCV9SXdkHjVkS9XFFBbxFtkMKkZIbmLCTtrDVxjgSVa9EZuG9AOE
         QNXVRIgXPR88nFidiAitl42AO7NkytS5lN1sXvnAA1oeqoMWfIfNjLev8oqaj5d3sptK
         tFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Tik343nJgKOlNxCDlOVgWZzW5oT6kvQYJeoL8mg0WE=;
        b=np501MZHNMR2K8s75CW8I5WK8VkbECG+NXD92KDfnfKZGVqtngd4jpF8BTY0ySN7kO
         xSi8mJBIZtFvMVr3RPaQXsV4oIjZ6WgoKP28eZcl/uEjplOijwu54xSEuRKaJYz5GZJI
         yQiHegoi4pTiFrpj1eXUslJLfANKH7cJBXrLJxc1Vg9HJqsuCbDTOyKCcHLhqk0ajCOB
         1qvF0jJ1Vu/o373zbw+2I6qkKDYAjFiAE2j8PzuHc4xHiJXPfOf4GLnxQlkWsoC0bp/q
         qtkJ/OEadfjoF5+EN9UHfP2Bz6k7csc5jdht+uuGuIkmwsGv2pWOk0xuKprurX2JfSC0
         UhIA==
X-Gm-Message-State: APjAAAWZWOgaU3aYCynILXQlKKOW9Rt07QP8DpXwIZSfX/gTZaa4UJ75
        vmoVNdGpZyo2D7vJ590P0cgH9JjC0NQ=
X-Google-Smtp-Source: APXvYqwLN87f0YnGpcY5rm7Zj04zqM1mUCs8gMwOABz/meccKKHaBPV/wbjGi8t8sYB41Q6bmXNwbA==
X-Received: by 2002:a2e:87ca:: with SMTP id v10mr558487ljj.253.1578303453044;
        Mon, 06 Jan 2020 01:37:33 -0800 (PST)
Received: from desowin-laptop.lan (078088109026.wroclaw.vectranet.pl. [78.88.109.26])
        by smtp.googlemail.com with ESMTPSA id s3sm28872023lfo.77.2020.01.06.01.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 01:37:32 -0800 (PST)
From:   =?UTF-8?q?Tomasz=20Mo=C5=84?= <desowin@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Tomasz=20Mo=C5=84?= <desowin@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Pete Zaitcev <zaitcev@redhat.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH] usbmon: Report device address assigned to USB device
Date:   Mon,  6 Jan 2020 10:37:17 +0100
Message-Id: <20200106093724.22947-1-desowin@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Make USB device addresses match while sniffing USB communication
with usbmon and hardware USB sniffer (OpenVizsla) at the same time.
On xHCI root hubs the address is assigned by hardware and can be
different than devnum.

Signed-off-by: Tomasz Moń <desowin@gmail.com>
---
 Documentation/usb/usbmon.rst |  2 +-
 drivers/usb/mon/mon_bin.c    |  6 +++---
 drivers/usb/mon/mon_text.c   | 10 +++++-----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/usb/usbmon.rst b/Documentation/usb/usbmon.rst
index b0bd51080799..e603159f8a93 100644
--- a/Documentation/usb/usbmon.rst
+++ b/Documentation/usb/usbmon.rst
@@ -220,7 +220,7 @@ the following structure (its name is made up, so that we can refer to it)::
 	unsigned char type;	/*  8: Same as text; extensible. */
 	unsigned char xfer_type; /*    ISO (0), Intr, Control, Bulk (3) */
 	unsigned char epnum;	/*     Endpoint number and transfer direction */
-	unsigned char devnum;	/*     Device address */
+	unsigned char devaddr;	/*     Device address */
 	u16 busnum;		/* 12: Bus number */
 	char flag_setup;	/* 14: Same as text */
 	char flag_data;		/* 15: Same as text; Binary zero is OK. */
diff --git a/drivers/usb/mon/mon_bin.c b/drivers/usb/mon/mon_bin.c
index f48a23adbc35..d7a55be5df68 100644
--- a/drivers/usb/mon/mon_bin.c
+++ b/drivers/usb/mon/mon_bin.c
@@ -91,7 +91,7 @@ struct mon_bin_hdr {
 	unsigned char type;	/* Same as in text API; extensible. */
 	unsigned char xfer_type;	/* ISO, Intr, Control, Bulk */
 	unsigned char epnum;	/* Endpoint number and transfer direction */
-	unsigned char devnum;	/* Device address */
+	unsigned char devaddr;	/* Device address */
 	unsigned short busnum;	/* Bus number */
 	char flag_setup;
 	char flag_data;
@@ -567,7 +567,7 @@ static void mon_bin_event(struct mon_reader_bin *rp, struct urb *urb,
 	ep->type = ev_type;
 	ep->xfer_type = xfer_to_pipe[usb_endpoint_type(epd)];
 	ep->epnum = dir | usb_endpoint_num(epd);
-	ep->devnum = urb->dev->devnum;
+	ep->devaddr = urb->dev->devaddr;
 	ep->busnum = urb->dev->bus->busnum;
 	ep->id = (unsigned long) urb;
 	ep->ts_sec = ts.tv_sec;
@@ -655,7 +655,7 @@ static void mon_bin_error(void *data, struct urb *urb, int error)
 	ep->xfer_type = xfer_to_pipe[usb_endpoint_type(&urb->ep->desc)];
 	ep->epnum = usb_urb_dir_in(urb) ? USB_DIR_IN : 0;
 	ep->epnum |= usb_endpoint_num(&urb->ep->desc);
-	ep->devnum = urb->dev->devnum;
+	ep->devaddr = urb->dev->devaddr;
 	ep->busnum = urb->dev->bus->busnum;
 	ep->id = (unsigned long) urb;
 	ep->ts_sec = ts.tv_sec;
diff --git a/drivers/usb/mon/mon_text.c b/drivers/usb/mon/mon_text.c
index bc5ecd5ff565..8f0d4a4416ef 100644
--- a/drivers/usb/mon/mon_text.c
+++ b/drivers/usb/mon/mon_text.c
@@ -59,7 +59,7 @@ struct mon_event_text {
 	unsigned long id;	/* From pointer, most of the time */
 	unsigned int tstamp;
 	int busnum;
-	char devnum;
+	char devaddr;
 	char epnum;
 	char is_in;
 	char xfertype;
@@ -210,7 +210,7 @@ static void mon_text_event(struct mon_reader_text *rp, struct urb *urb,
 	ep->type = ev_type;
 	ep->id = (unsigned long) urb;
 	ep->busnum = urb->dev->bus->busnum;
-	ep->devnum = urb->dev->devnum;
+	ep->devaddr = urb->dev->devaddr;
 	ep->epnum = usb_endpoint_num(&urb->ep->desc);
 	ep->xfertype = usb_endpoint_type(&urb->ep->desc);
 	ep->is_in = usb_urb_dir_in(urb);
@@ -282,7 +282,7 @@ static void mon_text_error(void *data, struct urb *urb, int error)
 	ep->type = 'E';
 	ep->id = (unsigned long) urb;
 	ep->busnum = urb->dev->bus->busnum;
-	ep->devnum = urb->dev->devnum;
+	ep->devaddr = urb->dev->devaddr;
 	ep->epnum = usb_endpoint_num(&urb->ep->desc);
 	ep->xfertype = usb_endpoint_type(&urb->ep->desc);
 	ep->is_in = usb_urb_dir_in(urb);
@@ -523,7 +523,7 @@ static void mon_text_read_head_t(struct mon_reader_text *rp,
 	p->cnt += snprintf(p->pbuf + p->cnt, p->limit - p->cnt,
 	    "%lx %u %c %c%c:%03u:%02u",
 	    ep->id, ep->tstamp, ep->type,
-	    utype, udir, ep->devnum, ep->epnum);
+	    utype, udir, ep->devaddr, ep->epnum);
 }
 
 static void mon_text_read_head_u(struct mon_reader_text *rp,
@@ -541,7 +541,7 @@ static void mon_text_read_head_u(struct mon_reader_text *rp,
 	p->cnt += snprintf(p->pbuf + p->cnt, p->limit - p->cnt,
 	    "%lx %u %c %c%c:%d:%03u:%u",
 	    ep->id, ep->tstamp, ep->type,
-	    utype, udir, ep->busnum, ep->devnum, ep->epnum);
+	    utype, udir, ep->busnum, ep->devaddr, ep->epnum);
 }
 
 static void mon_text_read_statset(struct mon_reader_text *rp,
-- 
2.24.1

