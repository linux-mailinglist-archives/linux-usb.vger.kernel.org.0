Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 493C32996A4
	for <lists+linux-usb@lfdr.de>; Mon, 26 Oct 2020 20:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783070AbgJZTPK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Oct 2020 15:15:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47750 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1783042AbgJZTPK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Oct 2020 15:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603739709;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=+B8RU8GaSsfIoo++o6WwZDC13Vzg4HDPXwZRisdyOVA=;
        b=TnUcqevfvg1YmC1Q4/NlcWcay17NjMcCXLufrfcVxef7LFxnAMaFzJ4Jffegc6Xjjjyi1a
        fX8R4MKinzOxfTu8YgpkJvNbWHmoEXoVUI4XCUsMDfalyuwIrvEJafKTKU1U4U8hD5c+zh
        Dpdtu6CK3wyXGhATbolfG0wcCpWNhAk=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249--_vH7BVdM1y5SvkISjz3pQ-1; Mon, 26 Oct 2020 15:14:59 -0400
X-MC-Unique: -_vH7BVdM1y5SvkISjz3pQ-1
Received: by mail-oi1-f198.google.com with SMTP id c198so3193248oig.7
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2020 12:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+B8RU8GaSsfIoo++o6WwZDC13Vzg4HDPXwZRisdyOVA=;
        b=hUTAVkbYaoj8t4de7tsBYV5RyLKIvojc2cTkEkkQ2Qw/6r3csSWQt2BWW4uxt0OeFw
         XN3nfZFe6L/KRSPpsMm0r0vTL5Vsd/hE1iyOdDXMWeTvaev8E4RYDsl9FuO6A46Et1Vc
         KpELNPEfaTfnElblKpJDkS2MdqWaRHPA9C4n+tsO2KSiMvwkkVdPsJ8aGY2StQp+HRgc
         zzWLK4U2dHOrU2lxLpT164DZc6B73UuTYNIiIK7Fj+WPQyRbAVdi35ywaBEeodGieM9x
         VqaePus27UGRDOsufwz+3HWWtbgSOXoMmG+vBSjkeF4Bt9QoN2tpeFk2qy9MPHxAmE2c
         DITw==
X-Gm-Message-State: AOAM531l2qyRs60myy4W4Yy5Lg+zyJXi51tUYBR8JyQzydWkDALjeCS6
        LxxqdhLxk3jebrSvYkHWM28J5ZLysRPnzWuKzqK/YqY9kLTxX9UqtI0KBAeASDKbRBaNtKJKOyB
        tE0d3kTTD+eK+xK+SSsiQ
X-Received: by 2002:a05:6830:10ca:: with SMTP id z10mr12192362oto.64.1603739698636;
        Mon, 26 Oct 2020 12:14:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQdHHxBau2UJ1fjutzv8M4KSiDRNEo8dGY9X2K3l31+DK1KbyNlL2H1UkkV9q9GVuEVmeqDg==
X-Received: by 2002:a05:6830:10ca:: with SMTP id z10mr12192345oto.64.1603739698391;
        Mon, 26 Oct 2020 12:14:58 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id j3sm1931500oij.9.2020.10.26.12.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 12:14:57 -0700 (PDT)
From:   trix@redhat.com
To:     johan@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH v2] usb: serial: iuu_phoenix remove unneeded break
Date:   Mon, 26 Oct 2020 12:14:50 -0700
Message-Id: <20201026191450.1429945-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a return.

Signed-off-by: Tom Rix <trix@redhat.com>
---
v2: split from original larger patch
---
 drivers/usb/serial/iuu_phoenix.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
index b4ba79123d9d..f1201d4de297 100644
--- a/drivers/usb/serial/iuu_phoenix.c
+++ b/drivers/usb/serial/iuu_phoenix.c
@@ -850,7 +850,6 @@ static int iuu_uart_baud(struct usb_serial_port *port, u32 baud_base,
 	default:
 		kfree(dataout);
 		return IUU_INVALID_PARAMETER;
-		break;
 	}
 
 	switch (parity & 0xF0) {
@@ -864,7 +863,6 @@ static int iuu_uart_baud(struct usb_serial_port *port, u32 baud_base,
 	default:
 		kfree(dataout);
 		return IUU_INVALID_PARAMETER;
-		break;
 	}
 
 	status = bulk_immediate(port, dataout, DataCount);
-- 
2.18.1

