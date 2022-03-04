Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAFC24CDCB1
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 19:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241330AbiCDSiV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 13:38:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241817AbiCDSiN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 13:38:13 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 801F21D5290
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 10:37:24 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id qt6so19201478ejb.11
        for <linux-usb@vger.kernel.org>; Fri, 04 Mar 2022 10:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=5cKpBLN6W/XTLPaS2O2YVfEK3xn2DNe6RJKVM5hTxZg=;
        b=crn697PXvGDcdsA8ZF/+tfvWfLcgTa2PQ3T6bOmCREqzBTXNwlyqbKXsvWmK835X0E
         FAnw96zAEqlgSvZSGVf950J9tMqAyNbmovm8JHu0aJu3lHgcMjFzMC7ruW3+M8InO9jG
         8xu6aSVB5QvMk5m61TuDiNz1gtWVK8z9h4igPggWmLQl6iEEyhDRi0cEF0Us8FsYcUCb
         DrWLRWq2uB258ubJdNOIzoc0TSUTtTH8/Xk7I6JSdPH5CAHU9W4ZY3iTZTANLsbWhsTR
         UfGSXKmTiRdedoNn9Yij0mSMzl6XMN9V16NQqzAC7M/zQgHyWS7xvjy3Q3n0TMmFEZBi
         Wf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=5cKpBLN6W/XTLPaS2O2YVfEK3xn2DNe6RJKVM5hTxZg=;
        b=1m43jU5uD0rQcpKdI3gq/hVjnH3pQjbZpUbSeeYpysOvuea2TyTBLlj9t71L65h9oT
         Icg5zwszWZdAaJ1GZk1eRs+i6FREtU72SU3wYjsxVyNZZjVS7xx7O7UI6fXJTYp9PVsH
         FPgFktmi6IZxDJ8GfpJivcg9rtH1zra++ragRf9rqUQC51lO/eA3L68sgetTdDlcZtqN
         HoqUFiiP4OJgnOk/uVopHp1ENqKeSpeYnZr/GUQzF/NZySXweueJQOAtHSADExxhpWx7
         QCog6peItl+4hkVMhPWA8r7QCkpia3QTUqiea4mIxTTigDIkRoYsatD7SIl8QDQWRSS6
         hO/g==
X-Gm-Message-State: AOAM532qUz5EnyPrxwJk9tfgkrIBXLBfzRYNlWzmlRbypKRftYeQR2CT
        f6ZzdflGxKV0VNHCqTIsREr6l1Bj+9c=
X-Google-Smtp-Source: ABdhPJyhy15uyUHHV4DHsA6OB66mWbELtC59alSCH1i8obW5MTpGlW2YCGdKgn25veJJgNTSPwaawA==
X-Received: by 2002:a17:906:4c4b:b0:6da:a5d9:7af9 with SMTP id d11-20020a1709064c4b00b006daa5d97af9mr70026ejw.336.1646419043044;
        Fri, 04 Mar 2022 10:37:23 -0800 (PST)
Received: from ?IPV6:2a01:c23:b9fb:2800:c56d:9b34:f61c:e318? (dynamic-2a01-0c23-b9fb-2800-c56d-9b34-f61c-e318.c23.pool.telefonica.de. [2a01:c23:b9fb:2800:c56d:9b34:f61c:e318])
        by smtp.googlemail.com with ESMTPSA id vl11-20020a17090730cb00b006d8121d0fc4sm1989783ejb.138.2022.03.04.10.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 10:37:22 -0800 (PST)
Message-ID: <e73bc0c1-e530-7419-0197-1b7de02c87c5@gmail.com>
Date:   Fri, 4 Mar 2022 19:37:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH 5/5] xhci: support omitting shared hcd if either of the root
 hubs has no ports
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jack Pham <quic_jackp@quicinc.com>,
        Tung Nguyen <tunguyen@apm.com>
References: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
In-Reply-To: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If either of the root hubs has no ports, then we can get rid of
overhead like the shared hcd. A major internal change is that now
the main hcd can be USB2 or USB3.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/host/xhci-mem.c | 11 +++++------
 drivers/usb/host/xhci.c     |  9 ++++++---
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index a1a17713a..ced139583 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2362,12 +2362,11 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 		xhci->usb2_rhub.num_ports = USB_MAXCHILDREN;
 	}
 
-	xhci->needs_shared_hcd = 1;
-
-	/*
-	 * Note we could have all USB 3.0 ports, or all USB 2.0 ports.
-	 * Not sure how the USB core will handle a hub with no ports...
-	 */
+	if (xhci->usb2_rhub.num_ports && xhci->usb3_rhub.num_ports)
+		xhci->needs_shared_hcd = 1;
+	else
+		xhci_info(xhci, "USB%u root hub has no ports\n",
+			  xhci->usb2_rhub.num_ports ? 3 : 2);
 
 	xhci_create_rhub_port_array(xhci, &xhci->usb2_rhub, flags);
 	xhci_create_rhub_port_array(xhci, &xhci->usb3_rhub, flags);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 83a54a566..623901890 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5279,9 +5279,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 
 	xhci = hcd_to_xhci(hcd);
 
-	if (usb_hcd_is_primary_hcd(hcd)) {
-		xhci_hcd_init_usb2_data(xhci, hcd);
-	} else {
+	if (!usb_hcd_is_primary_hcd(hcd)) {
 		xhci_hcd_init_usb3_data(xhci, hcd);
 		return 0;
 	}
@@ -5363,6 +5361,11 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 		return retval;
 	xhci_dbg(xhci, "Called HCD init\n");
 
+	if (xhci_hcd_is_usb3(hcd))
+		xhci_hcd_init_usb3_data(xhci, hcd);
+	else
+		xhci_hcd_init_usb2_data(xhci, hcd);
+
 	xhci_info(xhci, "hcc params 0x%08x hci version 0x%x quirks 0x%016llx\n",
 		  xhci->hcc_params, xhci->hci_version, xhci->quirks);
 
-- 
2.35.1


