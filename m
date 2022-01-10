Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F07E4489028
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 07:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233615AbiAJGZU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 01:25:20 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:61035 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230352AbiAJGZT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 01:25:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1641795919; x=1673331919;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kxUcVjma0gGK/UIbsJtYoGNgVj4zLRNoPjUq+ErylkY=;
  b=RH+3Dj0WjXP1AaL6tePkveVMXTJ77EXsDyJQyWlnxiDI2vFd7YFPacKh
   5Mac0XbaZsJvGkoc21MuPr+I2/wAhHmUr5IOMEJUaIean/hW5XoU4lMok
   +ss9i6xG9AA38zzozSbudK0z6s7Y92YlLF/eaJ1YegBWQtOQgbZ1xfqlQ
   E=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 09 Jan 2022 22:25:18 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2022 22:25:18 -0800
Received: from jackp-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 9 Jan 2022 22:25:14 -0800
From:   Jack Pham <quic_jackp@quicinc.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Roger Quadros <rogerq@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Michal Nazarewicz <mina86@mina86.com>
CC:     <linux-usb@vger.kernel.org>,
        Roger Quadros <roger.quadros@nokia.com>,
        "Jack Pham" <quic_jackp@quicinc.com>
Subject: [PATCH] usb: gadget: f_mass_storage: Make CD-ROM emulation work with Mac OS-X
Date:   Sun, 9 Jan 2022 22:23:59 -0800
Message-ID: <20220110062359.5314-2-quic_jackp@quicinc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20220110062359.5314-1-quic_jackp@quicinc.com>
References: <20220110062359.5314-1-quic_jackp@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Roger Quadros <roger.quadros@nokia.com>

Mac OS-X expects CD-ROM TOC in raw format (i.e. format:2). It also
sends the READ_TOC CDB in old style SFF8020i format. i.e. 2 format bits
are encoded in MSBs of CDB byte 9.

This patch will enable CD-ROM emulation to work with Mac OS-X. Tested on
Mac OS X v10.6.3.

Change-Id: Ifdbe10e779bc8609a11eeab6ab6de549c6223fe2
Signed-off-by: Roger Quadros <roger.quadros@nokia.com>
Signed-off-by: Jack Pham <quic_jackp@quicinc.com>
---
 drivers/usb/gadget/function/f_mass_storage.c | 73 +++++++++++++++++++++++-----
 1 file changed, 61 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 73a28f8..1f7f4dd6 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -1188,6 +1188,8 @@ static int do_read_toc(struct fsg_common *common, struct fsg_buffhd *bh)
 	int		msf = common->cmnd[1] & 0x02;
 	int		start_track = common->cmnd[6];
 	u8		*buf = (u8 *)bh->buf;
+	u8		format;
+	int		i, len;
 
 	if ((common->cmnd[1] & ~0x02) != 0 ||	/* Mask away MSF */
 			start_track > 1) {
@@ -1195,18 +1197,65 @@ static int do_read_toc(struct fsg_common *common, struct fsg_buffhd *bh)
 		return -EINVAL;
 	}
 
-	memset(buf, 0, 20);
-	buf[1] = (20-2);		/* TOC data length */
-	buf[2] = 1;			/* First track number */
-	buf[3] = 1;			/* Last track number */
-	buf[5] = 0x16;			/* Data track, copying allowed */
-	buf[6] = 0x01;			/* Only track is number 1 */
-	store_cdrom_address(&buf[8], msf, 0);
+	format = common->cmnd[2] & 0xf;
+	/*
+	 * Check if CDB is old style SFF-8020i
+	 * i.e. format is in 2 MSBs of byte 9
+	 * Mac OS-X host sends us this.
+	 */
+	if (format == 0)
+		format = (common->cmnd[9] >> 6) & 0x3;
+
+	switch (format) {
+	case 0:
+		/* Formatted TOC */
+		len = 4 + 2*8;		/* 4 byte header + 2 descriptors */
+		memset(buf, 0, len);
+		len -= 2;		/* TOC Length excludes length field */
+		buf[1] = len;		/* TOC data length */
+		buf[2] = 1;		/* First track number */
+		buf[3] = 1;		/* Last track number */
+		buf[5] = 0x16;		/* Data track, copying allowed */
+		buf[6] = 0x01;		/* Only track is number 1 */
+		store_cdrom_address(&buf[8], msf, 0);
+
+		buf[13] = 0x16;		/* Lead-out track is data */
+		buf[14] = 0xAA;		/* Lead-out track number */
+		store_cdrom_address(&buf[16], msf, curlun->num_sectors);
+		return len;
+
+	case 2:
+		/* Raw TOC */
+		len = 4 + 3*11;		/* 4 byte header + 3 descriptors */
+		memset(buf, 0, len);	/* Header + A0, A1 & A2 descriptors */
+		len -= 2;		/* TOC Length excludes length field */
+		buf[1] = len;		/* TOC data length */
+		buf[2] = 1;		/* First complete session */
+		buf[3] = 1;		/* Last complete session */
+
+		buf += 4;
+		/* fill in A0, A1 and A2 points */
+		for (i = 0; i < 3; i++) {
+			buf[0] = 1;	/* Session number */
+			buf[1] = 0x16;	/* Data track, copying allowed */
+			/* 2 - Track number 0 ->  TOC */
+			buf[3] = 0xA0 + i; /* A0, A1, A2 point */
+			/* 4, 5, 6 - Min, sec, frame is zero */
+			buf[8] = 1;	/* Pmin: last track number */
+			buf += 11;	/* go to next track descriptor */
+		}
+		buf -= 11;		/* go back to A2 descriptor */
+
+		/* For A2, 7, 8, 9, 10 - zero, Pmin, Psec, Pframe of Lead out */
+		store_cdrom_address(&buf[7], msf, curlun->num_sectors);
 
-	buf[13] = 0x16;			/* Lead-out track is data */
-	buf[14] = 0xAA;			/* Lead-out track number */
-	store_cdrom_address(&buf[16], msf, curlun->num_sectors);
-	return 20;
+		return len;
+
+	default:
+		/* Multi-session, PMA, ATIP, CD-TEXT not supported/required */
+		curlun->sense_data = SS_INVALID_FIELD_IN_CDB;
+		return -EINVAL;
+	}
 }
 
 static int do_mode_sense(struct fsg_common *common, struct fsg_buffhd *bh)
@@ -1933,7 +1982,7 @@ static int do_scsi_command(struct fsg_common *common)
 		common->data_size_from_cmnd =
 			get_unaligned_be16(&common->cmnd[7]);
 		reply = check_command(common, 10, DATA_DIR_TO_HOST,
-				      (7<<6) | (1<<1), 1,
+				      (0xf<<6) | (1<<1), 1,
 				      "READ TOC");
 		if (reply == 0)
 			reply = do_read_toc(common, bh);
-- 
2.7.4

