Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50279169819
	for <lists+linux-usb@lfdr.de>; Sun, 23 Feb 2020 15:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgBWOfu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Feb 2020 09:35:50 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33201 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbgBWOft (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Feb 2020 09:35:49 -0500
Received: by mail-pl1-f194.google.com with SMTP id ay11so2915660plb.0
        for <linux-usb@vger.kernel.org>; Sun, 23 Feb 2020 06:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=eh5/iQhJHC31xny2JKaUCS3aacj+M+GOPO4tOTi+wfM=;
        b=JhiUJsrRoIcTI+qwFp69oICQTGn31V6IL76kUuga0vVvJ2s26SJCc6Ji9dM+XZ54eu
         5B7Mx2ubWlpPI1g7jKRwB6aL/RSw8X1Kj5eMTDgQO3T7UpECVjd6ayjroZIuP0eR0dJm
         YrGEAM/vef3F5ZfE+IDFLVIP7UZhGGopiqWJZv9s2haLnhzXt79tCEjAU064yXOyKg1o
         tMwJW350lRRuYv2LFIUVTqSjIsDPat/xHJLL5sdaxdGGGNJB8B7P5V/tiVUnrur2HA1k
         aPq+k7ZbJuU0m5gXT28j5Wnb4i6Xd1nLaeXvAgKaDenzo6md58As1nvMimWc97MBj31z
         RmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=eh5/iQhJHC31xny2JKaUCS3aacj+M+GOPO4tOTi+wfM=;
        b=Aq8JQkUvPg9IQAjpnYE+9aERubCGnrqeRrnjG/MjCDw91hNKRArHuLnyoDSN8uMd5F
         sdnJFuwwS2wIoV/xr108mqMUZq66TFdqtS9e/M5EadOSIgmpK6jWqcHB2hHk3EnZ6uUY
         +Xw8vGgt7oaXuOvTt2rHPsRat+C03zEXQff9BiT6dwVYyfr4FtQUNcWeUSKHZdJi2nPO
         QRxPzveFxlkD7feTd/UndAXrFyyEdpJKIp05SfRqg+1Ph7UuUUqTMd6/M6kwFGUCTIFC
         Xk1GPLC+NjyDNe2ivSbae+6kEM83gsuIN32uH5rG0OrgnGY5VWZc2LaW8XG7+mveJ3+R
         v8GQ==
X-Gm-Message-State: APjAAAVDqz0yvu5zRsBJxnD9u8Cu1NFeSnyAp3oypDW+Is+qbAoLdBQ6
        g7ktfenUVDhIkDTPAUJtAzo=
X-Google-Smtp-Source: APXvYqw2YtYKjGH0urvPyAz6VJQ2PM88gPUeXYsFLAUiOob3ZpmZtxzQ4aA26E0khiXQkN4Tqab47g==
X-Received: by 2002:a17:90a:f013:: with SMTP id bt19mr14799548pjb.47.1582468547845;
        Sun, 23 Feb 2020 06:35:47 -0800 (PST)
Received: from localhost ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id q8sm9204010pgt.57.2020.02.23.06.35.46
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 23 Feb 2020 06:35:47 -0800 (PST)
From:   qiwuchen55@gmail.com
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, chenqiwu <chenqiwu@xiaomi.com>
Subject: [PATCH] usb: fhci: use list_first_entry() instead of list_entry()
Date:   Sun, 23 Feb 2020 22:35:43 +0800
Message-Id: <1582468543-32343-1-git-send-email-qiwuchen55@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: chenqiwu <chenqiwu@xiaomi.com>

To make the intention clearer, use list_first_entry() instead of
list_entry().

Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
---
 drivers/usb/host/fhci-mem.c |  8 ++++----
 drivers/usb/host/fhci-q.c   | 24 ++++++++++++------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/host/fhci-mem.c b/drivers/usb/host/fhci-mem.c
index 658aedc..058cf7b 100644
--- a/drivers/usb/host/fhci-mem.c
+++ b/drivers/usb/host/fhci-mem.c
@@ -39,8 +39,8 @@ static struct td *get_empty_td(struct fhci_hcd *fhci)
 	struct td *td;
 
 	if (!list_empty(&fhci->empty_tds)) {
-		td = list_entry(fhci->empty_tds.next, struct td, node);
-		list_del(fhci->empty_tds.next);
+		td = list_fisrt_entry(fhci->empty_tds, struct td, node);
+		list_del(td->node);
 	} else {
 		td = kmalloc(sizeof(*td), GFP_ATOMIC);
 		if (!td)
@@ -63,8 +63,8 @@ struct ed *fhci_get_empty_ed(struct fhci_hcd *fhci)
 	struct ed *ed;
 
 	if (!list_empty(&fhci->empty_eds)) {
-		ed = list_entry(fhci->empty_eds.next, struct ed, node);
-		list_del(fhci->empty_eds.next);
+		ed = list_first_entry(fhci->empty_eds, struct ed, node);
+		list_del(ed->node);
 	} else {
 		ed = kmalloc(sizeof(*ed), GFP_ATOMIC);
 		if (!ed)
diff --git a/drivers/usb/host/fhci-q.c b/drivers/usb/host/fhci-q.c
index 669c2405..3673731 100644
--- a/drivers/usb/host/fhci-q.c
+++ b/drivers/usb/host/fhci-q.c
@@ -72,7 +72,7 @@ static struct td *peek_td_from_ed(struct ed *ed)
 	struct td *td;
 
 	if (!list_empty(&ed->td_list))
-		td = list_entry(ed->td_list.next, struct td, node);
+		td = list_first_entry(ed->td_list, struct td, node);
 	else
 		td = NULL;
 
@@ -84,8 +84,8 @@ struct td *fhci_remove_td_from_frame(struct fhci_time_frame *frame)
 	struct td *td;
 
 	if (!list_empty(&frame->tds_list)) {
-		td = list_entry(frame->tds_list.next, struct td, frame_lh);
-		list_del_init(frame->tds_list.next);
+		td = list_first_entry(frame->tds_list, struct td, frame_lh);
+		list_del_init(td->frame_lh);
 	} else
 		td = NULL;
 
@@ -97,7 +97,7 @@ struct td *fhci_peek_td_from_frame(struct fhci_time_frame *frame)
 	struct td *td;
 
 	if (!list_empty(&frame->tds_list))
-		td = list_entry(frame->tds_list.next, struct td, frame_lh);
+		td = list_first_entry(frame->tds_list, struct td, frame_lh);
 	else
 		td = NULL;
 
@@ -109,13 +109,13 @@ struct td *fhci_remove_td_from_ed(struct ed *ed)
 	struct td *td;
 
 	if (!list_empty(&ed->td_list)) {
-		td = list_entry(ed->td_list.next, struct td, node);
-		list_del_init(ed->td_list.next);
+		td = list_first_entry(ed->td_list, struct td, node);
+		list_del_init(td->node);
 
 		/* if this TD was the ED's head, find next TD */
 		if (!list_empty(&ed->td_list))
-			ed->td_head = list_entry(ed->td_list.next, struct td,
-						 node);
+			ed->td_head = list_first_entry(ed->td_list, struct td,
+						       node);
 		else
 			ed->td_head = NULL;
 	} else
@@ -129,8 +129,8 @@ struct td *fhci_remove_td_from_done_list(struct fhci_controller_list *p_list)
 	struct td *td;
 
 	if (!list_empty(&p_list->done_list)) {
-		td = list_entry(p_list->done_list.next, struct td, node);
-		list_del_init(p_list->done_list.next);
+		td = list_first_entry(p_list->done_list, struct td, node);
+		list_del_init(td->node);
 	} else
 		td = NULL;
 
@@ -146,7 +146,7 @@ void fhci_move_td_from_ed_to_done_list(struct fhci_usb *usb, struct ed *ed)
 
 	/* If this TD was the ED's head,find next TD */
 	if (!list_empty(&ed->td_list))
-		ed->td_head = list_entry(ed->td_list.next, struct td, node);
+		ed->td_head = list_first_entry(ed->td_list, struct td, node);
 	else {
 		ed->td_head = NULL;
 		ed->state = FHCI_ED_SKIP;
@@ -171,7 +171,7 @@ static void free_urb_priv(struct fhci_hcd *fhci, struct urb *urb)
 
 	/* if this TD was the ED's head,find the next TD */
 	if (!list_empty(&ed->td_list))
-		ed->td_head = list_entry(ed->td_list.next, struct td, node);
+		ed->td_head = list_first_entry(ed->td_list, struct td, node);
 	else
 		ed->td_head = NULL;
 
-- 
1.9.1

