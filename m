Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE2FB11E964
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2019 18:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728521AbfLMRq1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Dec 2019 12:46:27 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34291 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728203AbfLMRq1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Dec 2019 12:46:27 -0500
Received: by mail-pg1-f196.google.com with SMTP id r11so176067pgf.1;
        Fri, 13 Dec 2019 09:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=dtBoagETXVh0V7/P97k4Rqz1E496kHkXGXKVFlW3Xbw=;
        b=gOIaI7+2eAoluHDBShTOls5VEGdzNqNIBmdslR9DmyTjn7b/HUvrlp9zqHJktb8K4H
         g2GvU2kReI0XtpANkg3fZnYLwn1z5bY+Q6oeI4/PjyJN3MmDz07/pZoPauqN4yKiptJj
         VYXDf43PfNocaHKVJkYNYh6UAI4qibBIhVIj8m8Mg1aHTtUHBrrpRb3tJpJsUjNQL9tU
         Xuy3pFkvxLDR1vPfGaFCVD0etxUdGPti5OKb1GcaPbweg99gwql+rHQCWVZ+gMKLu3W2
         z50+tlMO7omgHqKjwcZhE3TcWakp2FddFqGhZTUjtKhuc0aXvQ8/CCtz2PUU5wY2Cxt3
         X6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=dtBoagETXVh0V7/P97k4Rqz1E496kHkXGXKVFlW3Xbw=;
        b=Fyqld53eZTVCWtTEQTLgIHVfKvirlrfp4zSeiShiYcioYZsgmufHCIemVSlPE3EvYo
         MDV8EytRmgxHAxMtDU1I+X+COji4CApeNMcvhcVW0lo6b4YIhdC6HeB2vPiaSmPvaVCF
         Tq2sCGVBqDq+e5iIX/aJDSJDWbOErX77c1hqZGHy8B6UljjDn+ofwgm5jHfh66Db4D/E
         WJk83r+KNB3zuZNrNwBIAzBaFSxAcT68zb5/nGvsTvGVYBmI4EBnFcEigJ+XQmLj9PzJ
         AajBsJc43WMPlYADxvuN6gTjtKgBOWloQhlsjKW8fZJgqbWMQDFeG3J9rvKP6tWtCmuM
         2nNw==
X-Gm-Message-State: APjAAAW/0uLEPra3mOlRjSID0XD8QHrnIrv68BVeIl5CJ0V58wmgVT3a
        yiLEJG1rawhoZiE9EEzex4g=
X-Google-Smtp-Source: APXvYqyKV1E389RBA+UWrCbZt1ojc/ei0DHw5zlvBj3dEBxdxhbeQZ4NCwzp34jjtPT7agMXFqUBnA==
X-Received: by 2002:aa7:8ad9:: with SMTP id b25mr683869pfd.70.1576259186300;
        Fri, 13 Dec 2019 09:46:26 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id f18sm12823124pfk.124.2019.12.13.09.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 09:46:25 -0800 (PST)
Date:   Fri, 13 Dec 2019 09:46:23 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: dwc3: use proper initializers for property entries
Message-ID: <20191213174623.GA20267@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We should not be reaching into property entries and initialize them by
hand, but rather use proper initializer macros. This way we can alter
internal representation of property entries with no visible changes to
their users.

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

It would be good if this could go through Rafael's tree as it is needed
for the rest of my software_node/property_entry rework patch series
which I would love not to delay till 5.6.

Thanks!

 drivers/usb/dwc3/host.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index 5567ed2cddbec..fa252870c926f 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -88,10 +88,10 @@ int dwc3_host_init(struct dwc3 *dwc)
 	memset(props, 0, sizeof(struct property_entry) * ARRAY_SIZE(props));
 
 	if (dwc->usb3_lpm_capable)
-		props[prop_idx++].name = "usb3-lpm-capable";
+		props[prop_idx++] = PROPERTY_ENTRY_BOOL("usb3-lpm-capable");
 
 	if (dwc->usb2_lpm_disable)
-		props[prop_idx++].name = "usb2-lpm-disable";
+		props[prop_idx++] = PROPERTY_ENTRY_BOOL("usb2-lpm-disable");
 
 	/**
 	 * WORKAROUND: dwc3 revisions <=3.00a have a limitation
@@ -103,7 +103,7 @@ int dwc3_host_init(struct dwc3 *dwc)
 	 * This following flag tells XHCI to do just that.
 	 */
 	if (dwc->revision <= DWC3_REVISION_300A)
-		props[prop_idx++].name = "quirk-broken-port-ped";
+		props[prop_idx++] = PROPERTY_ENTRY_BOOL("quirk-broken-port-ped");
 
 	if (prop_idx) {
 		ret = platform_device_add_properties(xhci, props);
-- 
2.24.1.735.g03f4e72817-goog


-- 
Dmitry
