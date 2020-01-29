Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C15814CCA5
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2020 15:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgA2Ojp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jan 2020 09:39:45 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34758 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgA2Ojp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jan 2020 09:39:45 -0500
Received: by mail-lj1-f196.google.com with SMTP id x7so18674159ljc.1
        for <linux-usb@vger.kernel.org>; Wed, 29 Jan 2020 06:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D38QWv/1k1xwSmzwUpW2I6wnVFaWZUd/4wBXcnKeWxE=;
        b=BumFl8rr+Z1jt6iydy5R/quchS2Je5WPiuBN6Gfyy6zOG54QBTbN10KJ2jysKjiXJJ
         bXrCvNHS7IdxzRM3mXnGAhs92bQCmLRN7yW5HefsDh1pB6M4hL4WoMHsJYR3wisGZ6pu
         SQ5E3HR+bIDJCBV5rtdHcpResazeIFegQi7rjo/11bMqlkOcNFJAo2ZWcjzOeul5UqtF
         DdXHsKw8Wkqt6xQ2anC2mh/Qh8qE14S4zJC+ydwOg42KIeL35B0aDFbcqqJ4OIXjd9ds
         WLHE82YJp4UOkWRVGZXWtet/m8KEdKhZIbdBscAe/r6IBYPt0kbVf4oD8xkGz7as9hjP
         3mPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=D38QWv/1k1xwSmzwUpW2I6wnVFaWZUd/4wBXcnKeWxE=;
        b=cTM4cN+sW+1Sf36noxhsYq2JNgPNSnUEXHYOqEW+JIMPzypJSrWKnGHIV9q8Lw/eqp
         qNn1WYr2lgeA6gKyXtN8KaNjX85zx/37lnLyOLXchZsayYpmWhEMc2+fHypknSiSkzV8
         2/COskHTnD8KFCiwVKYQG/reB8Hvn317yEKZUKR+PveyTxdQWFcya5yDEMBQxE32FhKP
         teZcQcIKNVYAYCYvX+rq7GtXzX7Duk/OdQGz16IOAGklqlzeA/sR+05HfJI5sxSRQPjw
         FLJtFz8vy6GknGFiiXOyCQWIgi+uLCI+n85WRVIcMqxooaWvfYWIdlFA60cdrmGTdasF
         NbsQ==
X-Gm-Message-State: APjAAAVMCqGUBf/1dJYtZ8MGIl8JXXEX1WvCtj460RdeZAZEZuRimbwp
        r4dC2xzvOJPHr4jnF2tdW/DH2vH87cE=
X-Google-Smtp-Source: APXvYqwrPp5EUKUE2tSUo26VgKIuK9wzppv1HPQ/fxH6FMHY/Oug7OAGIug4jYpLUyROm6ZoZjcWDQ==
X-Received: by 2002:a2e:9955:: with SMTP id r21mr16262342ljj.283.1580308783077;
        Wed, 29 Jan 2020 06:39:43 -0800 (PST)
Received: from saruman.home (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id o69sm1157597lff.14.2020.01.29.06.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2020 06:39:42 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Linux USB <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>
Subject: [PATCH v2] usb: dwc3: trace: print enqueue/dequeue pointers too
Date:   Wed, 29 Jan 2020 16:39:40 +0200
Message-Id: <20200129143940.637341-1-balbi@kernel.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

By printing enqueue/dequeue pointers, we can make sure that our TRB
handling is correct. We've had a recent situation where we were not
always dequeueing all TRBs in an SG list and this helped figure out
what the problem was.

Signed-off-by: Felipe Balbi <balbi@kernel.org>
---

argh, commit the missing ;

 drivers/usb/dwc3/trace.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/trace.h b/drivers/usb/dwc3/trace.h
index 9edff17111f7..3054b89512ff 100644
--- a/drivers/usb/dwc3/trace.h
+++ b/drivers/usb/dwc3/trace.h
@@ -227,6 +227,8 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 		__field(u32, size)
 		__field(u32, ctrl)
 		__field(u32, type)
+		__field(u32, enqueue)
+		__field(u32, dequeue)
 	),
 	TP_fast_assign(
 		__assign_str(name, dep->name);
@@ -236,9 +238,12 @@ DECLARE_EVENT_CLASS(dwc3_log_trb,
 		__entry->size = trb->size;
 		__entry->ctrl = trb->ctrl;
 		__entry->type = usb_endpoint_type(dep->endpoint.desc);
+		__entry->enqueue = dep->trb_enqueue;
+		__entry->dequeue = dep->trb_dequeue;
 	),
-	TP_printk("%s: trb %p buf %08x%08x size %s%d ctrl %08x (%c%c%c%c:%c%c:%s)",
-		__get_str(name), __entry->trb, __entry->bph, __entry->bpl,
+	TP_printk("%s: trb %p (E%d:D%d) buf %08x%08x size %s%d ctrl %08x (%c%c%c%c:%c%c:%s)",
+		__get_str(name), __entry->trb, __entry->enqueue,
+		__entry->dequeue, __entry->bph, __entry->bpl,
 		({char *s;
 		int pcm = ((__entry->size >> 24) & 3) + 1;
 		switch (__entry->type) {
-- 
2.25.0

