Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B87917E0EB
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2020 14:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgCINPX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Mar 2020 09:15:23 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41385 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgCINPX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Mar 2020 09:15:23 -0400
Received: by mail-pg1-f196.google.com with SMTP id b1so4689017pgm.8
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2020 06:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=HtQ4mhhYUkCrlaobIHyQiUastubjbptsUJZaIYkKny0=;
        b=nkV7evWmx/x9QYqiOGGUwDx1I/QO1s/XUNTNE8ZEAHR4BozgQ/n+YR31ZGaj0KhFhY
         DOm+tBoc1nhcCjxCDqsV0fKGz0EUDM1P6X3XDqosSde1tHoQjNMUAYEB559ZVe3P3s3a
         iu5WQmW5lExDH5vEp+HCs/yahd+T4EdwQFwfHYPjqX6PuMz0+JWesSl4ZV8WAC+UmvbC
         Isfy9OUG3wuD/FDWC8CAm7AYfaWfLqc70IqwNpdAPCSDqvxOoVMqoneFk1NwCLUyJKlf
         L1g5hk7Pn7o1Nmy5ktR5Z+gUxIginD7bdmPbosZ1Q03Ca38iDVzal0MIIFql2PJrD+SK
         bgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=HtQ4mhhYUkCrlaobIHyQiUastubjbptsUJZaIYkKny0=;
        b=F0raKqnxu98dXbML09OZyU7XUC8NmuFJRxRJrzCXSZa6rpkZqx6OL4YuYUTyO6un6R
         MgdolgkfveOuZKos03zdSO6hLBKyxKnv8rDn5tYKvMN+sb+uZGK1VWSBaMLbsqxFlASi
         XAZQSc8w8YU0Ju7F4eeWSgwbxOFUO7os+et5JcbtjkSQYY8RCLyT9ypikukRB7CkxGpq
         y/FWLUiQicuYR+61+p7PET9uPpr/J8H4njaFTFCRr0A1gMQWnflPK4rvpoxGGXFftsSa
         hGC7L3KmT9YiZNJR9w2u7J6iYGKr3wNMqg+WzOjIpqw5SHSj1i4tj9vqdthOs0AotCwf
         1FfQ==
X-Gm-Message-State: ANhLgQ0mWA7e37gtNYF46NQeao30xUVy9gTOcmsB5a1WzsV7yQdBeRZf
        RqchIOPvem4b31tO1ideuWeVzNuJ5BM=
X-Google-Smtp-Source: ADFU+vsldnpf9BPgnYi0xCWAx6T7Z/YnyZNHRNeKTyQN7QO9msi8r4inyIgei3CcZvbDyPJ0QYcDqQ==
X-Received: by 2002:a63:5864:: with SMTP id i36mr17135513pgm.426.1583759721025;
        Mon, 09 Mar 2020 06:15:21 -0700 (PDT)
Received: from payal-desktop ([157.33.162.233])
        by smtp.gmail.com with ESMTPSA id j8sm19274579pjb.4.2020.03.09.06.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 06:15:20 -0700 (PDT)
From:   Payal Kshirsagar <payalskshirsagar1234@gmail.com>
To:     manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com,
        gregkh@linuxfoundation.org, outreachy-kernel@googlegroups.com
Cc:     Payal Kshirsagar <payalskshirsagar1234@gmail.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 3/3] [Outreachy kernel] staging: qlge: qlge.h: remove excess newlines
Date:   Mon,  9 Mar 2020 18:43:56 +0530
Message-Id: <4afcd06ab36ba7b37af7dcc304a7d4f9608154ae.1583759118.git.payalskshirsagar1234@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583759118.git.payalskshirsagar1234@gmail.com>
References: <cover.1583759118.git.payalskshirsagar1234@gmail.com>
In-Reply-To: <cover.1583759118.git.payalskshirsagar1234@gmail.com>
References: <cover.1583759118.git.payalskshirsagar1234@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Blank lines aren't necessary after an open brace '{'.

Signed-off-by: Payal Kshirsagar <payalskshirsagar1234@gmail.com>
---
 drivers/staging/qlge/qlge.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/qlge/qlge.h b/drivers/staging/qlge/qlge.h
index 4ef8dae3d7a0..fc8c5ca8935d 100644
--- a/drivers/staging/qlge/qlge.h
+++ b/drivers/staging/qlge/qlge.h
@@ -119,7 +119,6 @@ enum {
  * Processor Address Register (PROC_ADDR) bit definitions.
  */
 enum {
-
 	/* Misc. stuff */
 	MAILBOX_COUNT = 16,
 	MAILBOX_TIMEOUT = 5,
@@ -1762,7 +1761,6 @@ struct ql_nic_misc {
 };
 
 struct ql_reg_dump {
-
 	/* segment 0 */
 	struct mpi_coredump_global_header mpi_global_header;
 
@@ -2059,7 +2057,6 @@ enum {
 };
 
 struct nic_operations {
-
 	int (*get_flash) (struct ql_adapter *);
 	int (*port_initialize) (struct ql_adapter *);
 };
-- 
2.17.1

