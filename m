Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7549B64E906
	for <lists+linux-usb@lfdr.de>; Fri, 16 Dec 2022 11:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbiLPKDL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Dec 2022 05:03:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbiLPKDH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Dec 2022 05:03:07 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF8944A044
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 02:03:05 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 1so2720687lfz.4
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 02:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sx9G1Oo3ybU6WXDU/228lPKhYnB7HSfOZ4zYBE5aQdE=;
        b=K1d12nEgXWMQeRJ7XythAES011jSp0S9TdoYIBtkl+8RSHcUomsK1G1A5Nep4Cmm95
         oIgwt9RxV44B3g+zigEeQZbv6Dmj4l/Cq8y+jtS4QbjMW4eV5OO1rKlCWDizXhP6ouMT
         2PoS1NLMwPKTfUy1m9hmGMs82dGlQgDOQWcVZLv+Hx/ABd9VNZLv33Ji5xTk7DC7zyEM
         ink1Vkebh1InLQy/4OyMdfRt7ynSyq2+U7+j1k0IuVbNln2iWVLq9Su8DlDE+SFyJ14u
         7tFd0+JfdMt2seOtL4NccDY5mkfMC7AuGNmdbowvyhOnMkEHwL9Y3Ii4aT617okzhzVt
         muEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sx9G1Oo3ybU6WXDU/228lPKhYnB7HSfOZ4zYBE5aQdE=;
        b=OtxLwKvLfK4AcMQ+CUgHUX+PLcVAzjzZgSaBuVNspdlTkSgnO+EYeFEVMeYOUXilkP
         Gk4BgZmfkpbIGkny3zHyVPCdGj4kY4OT3Q7bXTW4CT4UJj4cEFlSF7Hn2yV2AjxCO/gD
         hpQWmx8CQg3OH9f3+vFetkwUI/+J5gQCF5JcQmrrutDigeF/f7KxusAomXXJKhK3h3G7
         cb5T8bm5rQ99E6ng9D/erdY+ThCyGYa+J2ZVAZ/f2jjQUaSppQ0tWd718PUdN0EdDhGy
         3fJBkkZbPqkvJtYTQyC6qgRIPpZvnxHGhpQhUPuWlZxEznoey+C+teT5Hl/yvrjqk8CI
         j0dw==
X-Gm-Message-State: ANoB5pkCYWskLVeeJYGlEtNG7TQPx2EfylFPAvrAZ/fn9bbwEN15D8wL
        XLOiWZE+Df4oByltj2WW8a4Ma3/2nxA=
X-Google-Smtp-Source: AA0mqf5rSBzOpOK8/f2HheqB4bRsEORbwZZdDb2Pc9UeHjI+BWGP4F2vy7gWM7NfpTuLPhWHt6TmVg==
X-Received: by 2002:a05:6512:3772:b0:4b5:7762:5df2 with SMTP id z18-20020a056512377200b004b577625df2mr8689255lft.36.1671184984188;
        Fri, 16 Dec 2022 02:03:04 -0800 (PST)
Received: from localhost.localdomain (dl5zkyyyhqvp---tn498y-3.rev.dnainternet.fi. [2001:14ba:4e68:8000:66c:59ff:fe0b:c778])
        by smtp.gmail.com with ESMTPSA id d16-20020a056512369000b004b4bab7d5a9sm177684lfs.46.2022.12.16.02.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 02:03:03 -0800 (PST)
From:   Artem Egorkine <arteme@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     Artem Egorkine <arteme@gmail.com>
Subject: [PATCH 2/2] sound: line6: fix stack overflow in line6_midi_transmit
Date:   Fri, 16 Dec 2022 12:02:39 +0200
Message-Id: <20221216100239.577805-2-arteme@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216100239.577805-1-arteme@gmail.com>
References: <20221216100239.577805-1-arteme@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Correctly calculate available space including the size of the chunk
buffer. This fixes a buffer overflow when multiple MIDI sysex
messages are sent to a PODxt device.

Signed-off-by: Artem Egorkine <arteme@gmail.com>
---
 sound/usb/line6/midi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/line6/midi.c b/sound/usb/line6/midi.c
index 335f8d531548..fbcb55b6e8b0 100644
--- a/sound/usb/line6/midi.c
+++ b/sound/usb/line6/midi.c
@@ -44,7 +44,8 @@ static void line6_midi_transmit(struct snd_rawmidi_substream *substream)
 	int req, done;
 
 	for (;;) {
-		req = min(line6_midibuf_bytes_free(mb), line6->max_packet_size);
+		req = min3(line6_midibuf_bytes_free(mb), line6->max_packet_size,
+			   LINE6_FALLBACK_MAXPACKETSIZE);
 		done = snd_rawmidi_transmit_peek(substream, chunk, req);
 
 		if (done == 0)
-- 
2.38.1

