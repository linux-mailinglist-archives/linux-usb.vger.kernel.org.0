Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8063429964A
	for <lists+linux-usb@lfdr.de>; Mon, 26 Oct 2020 19:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1791082AbgJZS6Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Oct 2020 14:58:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23056 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1791073AbgJZS6V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Oct 2020 14:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603738701;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=kaOCH2p3/Nu0DCrQ0FgXRUQNXyBXyy87Pagb1Hdgksw=;
        b=HzIRsDT94mT9Nmkbn/ZusB4dromHryY6VVXEyXMGmIz1DtpXMTSoGW+b7byRH0g2AP0H2D
        cccf6k25lmUWjIfVWowHmHzIplLjkgalCvejffW2FZVAoMBZFNhieUFiEfpXZWxMgLstEC
        V/bwtSqdvz4RinYE8fKLY6kReBr7dsw=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-wygFl8k_PNS0F2nflsgWTA-1; Mon, 26 Oct 2020 14:58:19 -0400
X-MC-Unique: wygFl8k_PNS0F2nflsgWTA-1
Received: by mail-oo1-f72.google.com with SMTP id r13so1933578ooi.3
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2020 11:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kaOCH2p3/Nu0DCrQ0FgXRUQNXyBXyy87Pagb1Hdgksw=;
        b=N0qE2xNsMV5kr2OX5NL5ySvvsdRlBCmu+wT7L2JmEe+ll348ZyMjwT0bs5SYmjBEuV
         dWGURUdSFfXEd9uSOLWd6ZjkP4VlxjG8/bXsTIqPlGF9eM3ZeQhewOEZbmfpI/hPZIcI
         tDR7s8dYvJuRREf+1Z+1wN7BNy34vT606p9dy9KCdIiJ/q+MApcMQwHLr+WfazIaTVVl
         JcIbLhgfQuwjSXW8TizqISrObGi2eq7efZskGTCRi7+/Avjox3wZwPY5DAqxH7d2fffy
         /V1/m9IqObrYfFmud2Z13ySqtKtioDfgNDAgG8SJaswh9SP9W0AumbOzRu2CONaYq9tH
         cRGQ==
X-Gm-Message-State: AOAM532O/oAtbEFhDA/6POEcU/upL/BueTP1r8c0uPUFKJUVQfgsQSKn
        QyDhgeLL/SvcBYHPn0GWWKTw3K+n7fJuBOgdaMzdtOwXGmzin4L9d1I5Vu5AfmwD6m+HiQUbnOW
        lf6uCOaV7tp4qFZMz7Osj
X-Received: by 2002:a9d:65c7:: with SMTP id z7mr16068725oth.327.1603738698275;
        Mon, 26 Oct 2020 11:58:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnbxRJ34NQlGUWZAODFv8pRoOSuBSReKA6tvsTH8368c1uhSb/dA9yoQ2cjXek2pdoLPyawg==
X-Received: by 2002:a9d:65c7:: with SMTP id z7mr16068703oth.327.1603738698033;
        Mon, 26 Oct 2020 11:58:18 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id l204sm3100893oia.32.2020.10.26.11.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 11:58:17 -0700 (PDT)
From:   trix@redhat.com
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH v2] usb: host: xhci-mem: remove unneeded break
Date:   Mon, 26 Oct 2020 11:58:12 -0700
Message-Id: <20201026185812.1427461-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a return.

Signed-off-by: Tom Rix <trix@redhat.com>
---
v2: split out as single changed file
---
 drivers/usb/host/xhci-mem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index fe405cd38dbc..b46ef45c4d25 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1144,7 +1144,6 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud
 	case USB_SPEED_WIRELESS:
 		xhci_dbg(xhci, "FIXME xHCI doesn't support wireless speeds\n");
 		return -EINVAL;
-		break;
 	default:
 		/* Speed was set earlier, this shouldn't happen. */
 		return -EINVAL;
-- 
2.18.1

