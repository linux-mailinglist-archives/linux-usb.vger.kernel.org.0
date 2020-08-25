Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B102511CB
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 07:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728960AbgHYFzh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 01:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgHYFzh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 01:55:37 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA38C061574
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 22:55:36 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id x10so13462251ybj.19
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 22:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=wFRIBdJ1ItfhUjGduGxiL3+cKx0oCq2t7HhAcJi23o4=;
        b=fYzaqyTvsZkLHxpVOCE2/6GZqDQAH+u+hiAo4Qv7nIPAjwVA/NuEl3j17N3T6Wf1Fz
         bTSM771prVJEHqvYNz4XrFD8E3NSUgtrfFVukrPLTXBo8+4NlqZOggVHwBB8hLzp6s1n
         oPRM8JK2o3rwdEurh2o/tUKXwt5+xYxIh+frxiRAAx27ZqRM4NGmFv+6EBBPz8QFbVQX
         Mp1pWbowraHWPWU3wn4T9DKiAdVqyxCrlmAAUFxfT+CRR/mi2BC3EiDt6NkmDhUCRjwi
         5nzLlB8pLHp1x3GIhxIJi+FzCkuSJl7NbpmIVwq1j5E2nelQgZL6KTxRmNVldKhSay8K
         mmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=wFRIBdJ1ItfhUjGduGxiL3+cKx0oCq2t7HhAcJi23o4=;
        b=nAcmH9JdyUFFyfh+c2hfahb0S9QJsXcfkB9H4+7TUlMX7fMUZy6aZBS5s6VI3meFxC
         c2fie8FkdTkbHGy+7yfY3bwLjEHnmptTvtibPSVaCInpAOtBZAbWF/5WLF43Ur72P7Aa
         V+JU2mz72fwFHusGiwV9VaXzGixXrQWu5LYrN3lL5XTMad5+Zd4RO4Uf4p63vez6v3oh
         mJj0K7UygGlQN+dGDdKkHKNL6M/lDPuDVA+foKQpR8K2744DmL0D3z8qF+g29LQ1dGOa
         f+OsZA9Z1C8ofNBm9psmKta46FAi4RJSx5orMO3eyx33je6llRCDjrbC1T5yzhcuJAAx
         f46Q==
X-Gm-Message-State: AOAM531TEBNjoSjUqX+RdWW9P8n2wYNUEMEzDMZtmYkd504pHwFv5t6b
        Vs+tQptCN/dtoKB/k3hy3Y4VfHuzJCXA820Dg8IfY2ruHzM2W7GHr7z8GjHLSfXrmqdxhdeqGCA
        /KhEyCvQ5naeJB3YW9565FfrWZEgrhTdmOmy6etEMOHSI3hKY8kLbRo6DJ4xLMui2pSQr
X-Google-Smtp-Source: ABdhPJzvW8O/MZQvwDC3SVr4nTk+EMyMSOv9jzCNfKhDOtqHN6QRf10sbtnrG3LtrRBbd43zgUrVXUlyiejQ
X-Received: from lorenzo.tok.corp.google.com ([2401:fa00:8f:2:eeb1:d7ff:fe57:b7d5])
 (user=lorenzo job=sendgmr) by 2002:a25:ca50:: with SMTP id
 a77mr12576319ybg.286.1598334935919; Mon, 24 Aug 2020 22:55:35 -0700 (PDT)
Date:   Tue, 25 Aug 2020 14:55:04 +0900
In-Reply-To: <20200825055505.765782-1-lorenzo@google.com>
Message-Id: <20200825055505.765782-3-lorenzo@google.com>
Mime-Version: 1.0
References: <20200825055505.765782-1-lorenzo@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v3 2/3] usb: gadget: f_ncm: set SuperSpeed bulk descriptor
 bMaxBurst to 15
From:   Lorenzo Colitti <lorenzo@google.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        zenczykowski@gmail.com, Lorenzo Colitti <lorenzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This improves performance on fast connections. When directly
connecting to a Linux laptop running 5.6, single-stream iperf3
goes from ~1.7Gbps to ~2.3Gbps out, and from ~620Mbps to ~720Mbps
in.

Signed-off-by: Lorenzo Colitti <lorenzo@google.com>
---
 drivers/usb/gadget/function/f_ncm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 5b9266a87f..cad3c9dd61 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -378,7 +378,7 @@ static struct usb_ss_ep_comp_descriptor ss_ncm_bulk_comp_desc = {
 	.bDescriptorType =	USB_DT_SS_ENDPOINT_COMP,
 
 	/* the following 2 values can be tweaked if necessary */
-	/* .bMaxBurst =		0, */
+	.bMaxBurst =		15,
 	/* .bmAttributes =	0, */
 };
 
-- 
2.28.0.297.g1956fa8f8d-goog

