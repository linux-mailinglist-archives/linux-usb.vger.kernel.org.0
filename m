Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED04422277
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 11:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233593AbhJEJjb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 05:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232871AbhJEJja (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Oct 2021 05:39:30 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 571F9C061745
        for <linux-usb@vger.kernel.org>; Tue,  5 Oct 2021 02:37:40 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id s24so15815411wmh.4
        for <linux-usb@vger.kernel.org>; Tue, 05 Oct 2021 02:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jHynZwHmsCXqTQ1gDKIx14gfCImPOW9MhidoNpGAmk0=;
        b=4fKEQu3j83XK1G1iPm9PDU9n1rx8lbAcpgDwTDk2uKZV9zvPREdtT/391HX0yxSyPp
         aEe/eHPkF4w0H16j5Y/G08SxbCeS/k7SGzA6S8HcRMd2zcdW0yIt2AuoCs39Lie4zjAb
         icY5O9uo/5+74Nyj5XD3uy20e/9XMrTpXjAB8z9GlHTTFx5xZUqWZ5y03KabzSJXoQCS
         q/Frw5n3+gyDmo8ksIEgXPitJm1SR5WWWNa05r694b3cb1toH8ZOX+UDuneT8lBjnePo
         nnP7OSbIUvY7FkNzGatosv+brNgcj3YTDZhqfQWPXy/51tMCG6EZj2xGoHK4lJYToY1y
         f9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jHynZwHmsCXqTQ1gDKIx14gfCImPOW9MhidoNpGAmk0=;
        b=kIjMcv0mNtt6IszTVcTkKO8uYjOUDuHwlK7YQIN9fwRcgjzDSua8KMucAflBGSgx1S
         ccl5xbU2Ek82loj/RijNaXlym0ctaRzN/fPnDvNPCr+XP7Cmy3YU8RpWOVEXpKcnFFwT
         ocpnCC37Jvdmb9UzdgoA2XjmbFCt8nBVJMn5RZ+OGdVc/CpnufIGUdzBqB0a0VwMjWqT
         wJMgJtyUWDJT61Stc0BGvB5ojuj1fLFLEAus+OpuFy0Yg6A8cz8YLKWNduZTHfZIidz7
         qbCdjlrjwD5GqXzimokTi5WV9perRy41vYQjeWdab4G8DUSqDg9OakmqcAEQ8lzFY0c4
         FP6g==
X-Gm-Message-State: AOAM531mx4a8tuAMaJtldvFikfImLV9GfA45vuE5JfkuFVIdiWxh4CZO
        /kH9/DoHD3QaAh0pnhOkGr1YIA==
X-Google-Smtp-Source: ABdhPJyGxS87q8cuJZBC4cnVRnHMqwArMU8eG1KkuWcznxoAyyS1b5olLW2EiAtsI8LhHsCOkqzZKg==
X-Received: by 2002:a05:600c:4844:: with SMTP id j4mr2255992wmo.145.1633426658872;
        Tue, 05 Oct 2021 02:37:38 -0700 (PDT)
Received: from jackdaw.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id h15sm9175537wrt.0.2021.10.05.02.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 02:37:38 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [RFC PATCH 1/2] usb: gadget: uac2: fix maximum bandwidth calculation
Date:   Tue,  5 Oct 2021 11:37:28 +0200
Message-Id: <20211005093729.628833-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <1jmtnnvo2x.fsf@starbuckisacylon.baylibre.com>
References: <1jmtnnvo2x.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This fixes the wMaxPacketSize of the audio gadget so it is in line with
USB Audio Format specification - section 2.3.1.2.1

Cc: Jack Pham <jackp@codeaurora.org>
Cc: Pavel Hofman <pavel.hofman@ivitera.com>
Fixes: e89bb4288378 ("usb: gadget: u_audio: add real feedback implementation")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 There was a mistake in my previous mail, rounding depends on the
 synchronisation, not the stream direction.

 drivers/usb/gadget/function/f_uac2.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index ae29ff2b2b68..c152efa30def 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -554,7 +554,7 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
 	struct usb_endpoint_descriptor *ep_desc,
 	enum usb_device_speed speed, bool is_playback)
 {
-	int chmask, srate, ssize;
+	int chmask, srate, ssize, spf;
 	u16 max_size_bw, max_size_ep;
 	unsigned int factor;
 
@@ -584,11 +584,12 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
 		ssize = uac2_opts->c_ssize;
 	}
 
-	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
-		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
+	if (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ADAPTIVE)
+		spf = DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
+	else
+		spf = (srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1;
 
-	max_size_bw = num_channels(chmask) * ssize *
-		DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
+	max_size_bw = num_channels(chmask) * ssize * spf;
 	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
 						    max_size_ep));
 
-- 
2.33.0

