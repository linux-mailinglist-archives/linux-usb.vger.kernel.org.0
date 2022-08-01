Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89390586B17
	for <lists+linux-usb@lfdr.de>; Mon,  1 Aug 2022 14:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232073AbiHAMpF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Aug 2022 08:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234770AbiHAMoX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Aug 2022 08:44:23 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B21FCBCA3
        for <linux-usb@vger.kernel.org>; Mon,  1 Aug 2022 05:30:28 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id s206so9555693pgs.3
        for <linux-usb@vger.kernel.org>; Mon, 01 Aug 2022 05:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=79wsiIuqmJHlDnyKBpsU0dcqa0Z1I6VJ8b46FtTPbYM=;
        b=jTNNzOOmgHHd+AvOuz5rDsU21f94l1AkStN4gk6xkuFxwap3k1ovDoQSmfuCITnqIq
         S48kXaiIvPUki3wUKChY6ECaHwx1fkG6hNtLes5dlpzieakVBHqRQ6ZutqBA0ToF1IKd
         LKHZdX6WB7fJ4rjYN7gO4iYDF/KPBmcFzdKt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=79wsiIuqmJHlDnyKBpsU0dcqa0Z1I6VJ8b46FtTPbYM=;
        b=PAYpypacuJc5vBDEa0eQr1ldaNHbufHMff1Z8mCr4kkcob3Ht07nGSNmhcefVRDqbN
         TxkpW+xB3khR5sPK+U2YIKxTDup3kYJ/+lsGirJiAiGalrXn+3+8lwhnEKBQIYoP9J/U
         FcaOmVDwWu+z9aCptZezDrfikUHyPQu80mh/IWyIjvvYNbKwAFJLcLn6D6FlzacTYarS
         lrgvI0yAyXcnyn6E9gq2VPubsZg/oJPSzLDHPraZSaF19uICCxhm6eM7AjIaIq4u3tMA
         1L41IJOsdyWk3PP1hMFj3kLQg6bxJ9UpFFAQNUdYBq9EnVsv3cDLcZhMVTEUlXJchQtf
         H5gQ==
X-Gm-Message-State: ACgBeo2C0vTiK6XKOESgFHiYPaGINO0B8y2oozY+QfdHpsyGz95Q6MYV
        M6Kd20o52TcIYUe37sJDRqGTEg==
X-Google-Smtp-Source: AA6agR5IZ0ynGGVF4vFaonoCeVUtJtBEWv5+dEytr+8vY2V3PghKfQwt4/ksjGBBZ/CuKYf5jjacRA==
X-Received: by 2002:a05:6a00:190b:b0:52c:eb0e:e1b6 with SMTP id y11-20020a056a00190b00b0052ceb0ee1b6mr12456249pfi.54.1659357028121;
        Mon, 01 Aug 2022 05:30:28 -0700 (PDT)
Received: from localhost.localdomain ([183.83.136.224])
        by smtp.gmail.com with ESMTPSA id a14-20020a1709027e4e00b0015e8d4eb219sm3473230pln.99.2022.08.01.05.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 05:30:27 -0700 (PDT)
From:   Suniel Mahesh <sunil@amarulasolutions.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Cc:     linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
        USB list <linux-usb@vger.kernel.org>
Subject: [RFC 2/2] HID: ghid: add example program for GET_REPORT
Date:   Mon,  1 Aug 2022 18:00:10 +0530
Message-Id: <20220801123010.2984864-3-sunil@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220801123010.2984864-1-sunil@amarulasolutions.com>
References: <20220801123010.2984864-1-sunil@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds a user-space ghid sample get report program at
gadget side. This program sends reports from userspace(gadget side)
which are saved in the kernel in a list.

When a host requests a particular report based on report number
and type, corresponding report can be send to host, instead of a
zero filled in report.

This program can add, delete reports and modify an existing report.

Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
---
 samples/Kconfig         |  10 +++
 samples/Makefile        |   1 +
 samples/ghid/Makefile   |   4 ++
 samples/ghid/test-hid.c | 134 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 149 insertions(+)
 create mode 100644 samples/ghid/Makefile
 create mode 100644 samples/ghid/test-hid.c

diff --git a/samples/Kconfig b/samples/Kconfig
index 470ee3baf2e1..f3d7873bb966 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -86,6 +86,16 @@ config SAMPLE_FPROBE
 	  This builds a fprobe example module. This module has an option 'symbol'.
 	  You can specify a probed symbol or symbols separated with ','.
 
+config SAMPLE_GHID_GET_REPORT
+        bool "GHID sample get report"
+        depends on CC_CAN_LINK && HEADERS_INSTALL
+        help
+          Build GHID sample get report program. This program can send reports from
+	  userspace(gadget side) which are saved in the kernel in a linked list.
+	  When a host requests a particular report based on report number and type,
+	  corresponding report can be send to host, instead of a zero filled in report.
+	  This program can add, delete reports and modify an existing report.
+
 config SAMPLE_KFIFO
 	tristate "Build kfifo examples -- loadable modules only"
 	depends on m
diff --git a/samples/Makefile b/samples/Makefile
index 701e912ab5af..1d58f7a0381e 100644
--- a/samples/Makefile
+++ b/samples/Makefile
@@ -6,6 +6,7 @@ subdir-$(CONFIG_SAMPLE_ANDROID_BINDERFS) += binderfs
 obj-$(CONFIG_SAMPLE_CONFIGFS)		+= configfs/
 obj-$(CONFIG_SAMPLE_CONNECTOR)		+= connector/
 obj-$(CONFIG_SAMPLE_FANOTIFY_ERROR)	+= fanotify/
+subdir-$(SAMPLE_GHID_GET_REPORT)	+= ghid
 subdir-$(CONFIG_SAMPLE_HIDRAW)		+= hidraw
 obj-$(CONFIG_SAMPLE_HW_BREAKPOINT)	+= hw_breakpoint/
 obj-$(CONFIG_SAMPLE_KDB)		+= kdb/
diff --git a/samples/ghid/Makefile b/samples/ghid/Makefile
new file mode 100644
index 000000000000..8c93ded625c1
--- /dev/null
+++ b/samples/ghid/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+userprogs-always-y += test-hid
+
+userccflags += -I usr/include
diff --git a/samples/ghid/test-hid.c b/samples/ghid/test-hid.c
new file mode 100644
index 000000000000..f76786509047
--- /dev/null
+++ b/samples/ghid/test-hid.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * usb hidg GET_REPORT example, device/gadget side
+ * This program tests the newly implemented GET_REPORT feature
+ *
+ * Copyright (c) 2022 Amarula Solutions India PVT LTD
+ *
+ * Authors:
+ * Copyright (c) 2022 Suniel Mahesh <sunil@amarulasolutions.com>
+ *
+ */
+
+#include <pthread.h>
+/* Linux */
+#include <linux/types.h>
+#include <linux/input.h>
+#include <linux/hidraw.h>
+#include <linux/uhid.h>
+#include <uapi/linux/usb/g_hid.h>
+
+/* Unix */
+#include <sys/ioctl.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <unistd.h>
+
+/* C */
+#include <stdio.h>
+#include <string.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <errno.h>
+
+/*
+ * fix for failing compilation on systems that don't
+ * yet populate new version of uapi/linux/usb/g_hid.h
+ * to userspace.
+ */
+#define GADGET_ADD_REPORT_STATUS	_IOWR('g', 0x41, struct uhid_set_report_req)
+#define GADGET_REMOVE_REPORT_STATUS	_IOWR('g', 0x42, struct uhid_get_report_req)
+#define GADGET_UPDATE_REPORT_STATUS	_IOWR('g', 0x43, struct uhid_set_report_req)
+
+struct uhid_set_report_req *create_report(void)
+{
+	struct uhid_set_report_req *rep;
+	int i;
+
+	rep = (struct uhid_set_report_req *)calloc(1, sizeof(struct uhid_set_report_req));
+	if (rep == NULL) {
+		perror("calloc() failed");
+		exit(EXIT_FAILURE);
+	}
+
+	printf("enter report id:\n");
+	scanf("%u", &rep->id);
+	printf("enter report number:\n");
+	scanf("%hhu", &rep->rnum);
+	printf("enter report type:\n");
+	scanf("%hhu", &rep->rtype);
+	printf("enter report size:\n");
+	scanf("%hu", &rep->size);
+	printf("enter report data:\n");
+
+	for (i = 0; i < rep->size; i++)
+		scanf("%hhu", &rep->data[i]);
+
+	return rep;
+}
+
+int main(int argc, char **argv)
+{
+	const char *filename = NULL;
+	struct uhid_set_report_req *report;
+	int fd = 0, res = 0, i, reports;
+
+	if (argc < 1) {
+		fprintf(stderr, "Usage: %s /dev/hidg0\n", argv[0]);
+		return -1;
+	}
+
+	filename = argv[1];
+	fd = open(filename, O_RDWR, 0666);
+
+	if (fd == -1) {
+		perror(filename);
+		return -2;
+	}
+
+	printf("enter no of reports to send from userspace:\n");
+	scanf("%d", &reports);
+
+	if (reports == 0)
+		goto out;
+
+	for (i = 0; i < reports; i++) {
+		report = create_report();
+/* send reports to device */
+		res = ioctl(fd, GADGET_ADD_REPORT_STATUS, report);
+		if (res < 0) {
+			perror("GADGET_ADD_REPORT_STATUS");
+			res = -3;
+			goto test_end;
+		}
+		free(report);
+	}
+
+/* delete report with report number specified */
+	printf("deleting report w.r.t rtype and rnum:\n");
+	report = create_report();
+	res = ioctl(fd, GADGET_REMOVE_REPORT_STATUS, report);
+	if (res < 0) {
+		perror("GADGET_REMOVE_REPORT_STATUS");
+		res = -4;
+		goto test_end;
+	}
+	free(report);
+
+/* modify an existing report identified by report number */
+	printf("modify report w.r.t rtype and rnum:\n");
+	report = create_report();
+	res = ioctl(fd, GADGET_UPDATE_REPORT_STATUS, report);
+	if (res < 0) {
+		perror("GADGET_UPDATE_REPORT_STATUS");
+		res = -5;
+	}
+
+test_end:
+	free(report);
+	report = NULL;
+out:
+	close(fd);
+	return res;
+}
-- 
2.25.1

