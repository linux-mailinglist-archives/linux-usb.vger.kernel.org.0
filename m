Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A832505B03
	for <lists+linux-usb@lfdr.de>; Mon, 18 Apr 2022 17:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245527AbiDRPa5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Apr 2022 11:30:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344923AbiDRPaj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Apr 2022 11:30:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 80B5956C35
        for <linux-usb@vger.kernel.org>; Mon, 18 Apr 2022 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650292751;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=VRx1EMRQlbrP9hE/WVMMi/xLag40bmMY2mKv4xrHQ/c=;
        b=htb7ArwwHwOWx0nRMqsDi/wI4vYp+zPRXhB+QyRaItqa1mj217F6ToggkcrIPRRzweAKjD
        2yFilephRE9roL22TfREL0DnFZleN0xpet4NBD3OBxf2pIdkJW0pUA4RuU7+ekJ8n0BZjF
        8aWkXOn7fpB/G7jx9C6c1KLvRKr9obk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-v72n2WSgMuW9DsqYY9iZLg-1; Mon, 18 Apr 2022 10:39:10 -0400
X-MC-Unique: v72n2WSgMuW9DsqYY9iZLg-1
Received: by mail-qt1-f198.google.com with SMTP id m3-20020ac86883000000b002ed8d29a300so8599250qtq.11
        for <linux-usb@vger.kernel.org>; Mon, 18 Apr 2022 07:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VRx1EMRQlbrP9hE/WVMMi/xLag40bmMY2mKv4xrHQ/c=;
        b=R6EHAds1GbNlj95igMWUGY1vHkIs9jNOgmWtdJeOhXp2s4CYrmceROQKlhFyrzaEqq
         uZtCiUcqk33FztnzS+zUj9d6RJLrO4XbycSptLfNSBFXElKq6XMUwG7h+J6S+9RpzH7g
         3S1rgju7sQgIm/YHzaiX7GkvQ4+fTZjEclpkVEm8SWEvMkoYrKjyx2YtH8OTlaLHVBtz
         5eLGJWnm0bkQqWhTGiUCY3wnsGxfP5MkAllrw0P4VHQJ8LupnOaNoxOqbklsSjLCBb18
         W6A6DpKcNinkGGFave8EF9asO8XnwmPllhf2iwUOJ+qcc6N1wiuMKMa30dOsHmVKkWhf
         l4/g==
X-Gm-Message-State: AOAM532TqRyeZTdkb8SBR7+qT4l5esJ4cU0LG2MafxuEzQf8yMbLFk1G
        5Myfd/EqQjHdlOH5Ovc0j1U7bQHH2gdF5vRcBWHmQGK8D0O8aYUG9NSHCvIt4bYaxVCkuj/2pxN
        2E5CAJKZ6YELdix98x1QO
X-Received: by 2002:a05:622a:17c9:b0:2ef:c9bd:b8a2 with SMTP id u9-20020a05622a17c900b002efc9bdb8a2mr7286950qtk.246.1650292749870;
        Mon, 18 Apr 2022 07:39:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDftJOOh6eAAbvnnzw+gQdt0tgXgfA0SPB6SgNOxetFY+nyFKgBqNdtYZG6uiyj4bxVpQafQ==
X-Received: by 2002:a05:622a:17c9:b0:2ef:c9bd:b8a2 with SMTP id u9-20020a05622a17c900b002efc9bdb8a2mr7286932qtk.246.1650292749688;
        Mon, 18 Apr 2022 07:39:09 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id s17-20020a05620a16b100b0069eb1eb06b7sm590798qkj.131.2022.04.18.07.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 07:39:09 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        jakobkoschel@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] USB: omap_udc: clean up comment
Date:   Mon, 18 Apr 2022 10:39:06 -0400
Message-Id: <20220418143906.475932-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Spelling replacement
reactiviting to reactivating

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/gadget/udc/omap_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_udc.c
index 2d9815dad2ff..1dab74577ae2 100644
--- a/drivers/usb/gadget/udc/omap_udc.c
+++ b/drivers/usb/gadget/udc/omap_udc.c
@@ -1467,7 +1467,7 @@ static void ep0_irq(struct omap_udc *udc, u16 irq_src)
 			if (!udc->ep0_in) {
 				stat = 0;
 				/* read next OUT packet of request, maybe
-				 * reactiviting the fifo; stall on errors.
+				 * reactivating the fifo; stall on errors.
 				 */
 				stat = read_fifo(ep0, req);
 				if (!req || stat < 0) {
-- 
2.27.0

