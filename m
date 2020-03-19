Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A370618C2CD
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2020 23:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727507AbgCSWMH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Mar 2020 18:12:07 -0400
Received: from mail-wm1-f74.google.com ([209.85.128.74]:44057 "EHLO
        mail-wm1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727486AbgCSWMG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Mar 2020 18:12:06 -0400
Received: by mail-wm1-f74.google.com with SMTP id p18so1196425wmk.9
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2020 15:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=LEvk2lRQqoT9CCa9RXYqhP5doxwV1fW+zi25ZAQZzR4=;
        b=ig3aTo8KKWuqwfMli1MtYS7xgVHgl2D8o5PC2FIrAb3u/qEHE4BIbHsJtxBP1REu8+
         a+7hXOJYkgFVpTGulMZfVY+L3gkShdGnMTjDcK8WiAgeHhTK84fRO6j0+mZnh4Duy/9l
         TFNZ6dUw4NC05cr3c5t/LeN9ikhLGlzwVxqsx9TN+s85/I/I/TEMZJQM1H69pTDZYuen
         XqpVgE/rI4U4t4u+r2413J6KasH6Z5TH+xxu+cU7mG5Ze1GSJ1ins8Vm5VtoJs/KrvU9
         I3LkmefPsqFj3XfSWDbpl+JpBi+8zPuHhOpyix7ty50E52V16F78NY+bp/MTbtkGTZcD
         +E9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=LEvk2lRQqoT9CCa9RXYqhP5doxwV1fW+zi25ZAQZzR4=;
        b=R+1oFyXqIRIWLkU/h54dkC414tpxXVVUMphVtiavzsTkG16tOfJvwXPlhMOsLXHIWO
         nMAK2ewIijwGG1Z5YbE68A9zA+QqpuuZOo4J1thLW7HwAMQ7OYtELyH/lTcwVK8qEsCl
         rSkAqWMEDqLQ3lYiF79OgSG116S1Qw4x4IdVIWY9gz2Qblv8ajHQv37PbpM9wTxHk7Cr
         Il/JMWbFSgTbDKDp17qKizpSAPyc5rKfxMdZHDNqBii/GRk6FB72j2upZ0UJsUi6rUGs
         XwOA8XexwEsfXZPiGs3AhSp76lUKARSnwgIKIshtz7TjXVZ33rDT7hnrIOzQJAGUKANb
         JNNA==
X-Gm-Message-State: ANhLgQ29lxJcpi4YNNHAQOygPxifIbqTNXcWjDWWjEb4+8IP1N7xyzEF
        wSrkzgfcexnBllrO9bVcld9/dQcuGPJJRPbp
X-Google-Smtp-Source: ADFU+vtluI6qDD1ieFBosLTYKl5hRG9ApGhTCDRaP0AOgAEjxhK9TkPVZLetnxRI8JPL87djpCqG4rBGEn9srFyY
X-Received: by 2002:a5d:4081:: with SMTP id o1mr3409649wrp.114.1584655923264;
 Thu, 19 Mar 2020 15:12:03 -0700 (PDT)
Date:   Thu, 19 Mar 2020 23:11:38 +0100
In-Reply-To: <cover.1584655448.git.andreyknvl@google.com>
Message-Id: <f0283c676bab3335cb48bfe12d375a3da4719f59.1584655448.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1584655448.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH v3 4/7] kcov: move t->kcov_sequence assignment
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Andrey Konovalov <andreyknvl@gmail.com>

Move t->kcov_sequence assignment before assigning t->kcov_mode
for consistency.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 kernel/kcov.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 888d0a236b04..b985b7a72870 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -318,10 +318,10 @@ static void kcov_start(struct task_struct *t, struct kcov *kcov,
 	/* Cache in task struct for performance. */
 	t->kcov_size = size;
 	t->kcov_area = area;
+	t->kcov_sequence = sequence;
 	/* See comment in check_kcov_mode(). */
 	barrier();
 	WRITE_ONCE(t->kcov_mode, mode);
-	t->kcov_sequence = sequence;
 }
 
 static void kcov_stop(struct task_struct *t)
-- 
2.25.1.696.g5e7596f4ac-goog

