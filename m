Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 308F2567A43
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jul 2022 00:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233040AbiGEWsU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jul 2022 18:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232875AbiGEWsK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Jul 2022 18:48:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 248521A059;
        Tue,  5 Jul 2022 15:47:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A402A61D50;
        Tue,  5 Jul 2022 22:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48EFC341E5;
        Tue,  5 Jul 2022 22:47:51 +0000 (UTC)
Received: from rostedt by gandalf.local.home with local (Exim 4.95)
        (envelope-from <rostedt@goodmis.org>)
        id 1o8rKg-001yLT-MW;
        Tue, 05 Jul 2022 18:47:50 -0400
Message-ID: <20220705224750.532345354@goodmis.org>
User-Agent: quilt/0.66
Date:   Tue, 05 Jul 2022 18:45:02 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     linux-kernel@vger.kernel.org
Cc:     Ingo Molnar <mingo@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH 09/13] usb: musb: tracing: Use the new __vstring() helper
References: <20220705224453.120955146@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

Instead of open coding a __dynamic_array() with a fixed length (which
defeats the purpose of the dynamic array in the first place). Use the new
__vstring() helper that will use a va_list and only write enough of the
string into the ring buffer that is needed.

Cc: Bin Liu <b-liu@ti.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 drivers/usb/musb/musb_trace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/musb_trace.h b/drivers/usb/musb/musb_trace.h
index ec28b5716796..f246b14394c4 100644
--- a/drivers/usb/musb/musb_trace.h
+++ b/drivers/usb/musb/musb_trace.h
@@ -28,11 +28,11 @@ TRACE_EVENT(musb_log,
 	TP_ARGS(musb, vaf),
 	TP_STRUCT__entry(
 		__string(name, dev_name(musb->controller))
-		__dynamic_array(char, msg, MUSB_MSG_MAX)
+		__vstring(msg, vaf->fmt, vaf->va)
 	),
 	TP_fast_assign(
 		__assign_str(name, dev_name(musb->controller));
-		vsnprintf(__get_str(msg), MUSB_MSG_MAX, vaf->fmt, *vaf->va);
+		__assign_vstr(msg, vaf->fmt, vaf->va);
 	),
 	TP_printk("%s: %s", __get_str(name), __get_str(msg))
 );
-- 
2.35.1
