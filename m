Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BEB1506326
	for <lists+linux-usb@lfdr.de>; Tue, 19 Apr 2022 06:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348198AbiDSEU3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Apr 2022 00:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347491AbiDSEU2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Apr 2022 00:20:28 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9E62BB20
        for <linux-usb@vger.kernel.org>; Mon, 18 Apr 2022 21:17:46 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id k14so22691208pga.0
        for <linux-usb@vger.kernel.org>; Mon, 18 Apr 2022 21:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ua3DWHoWYRZ0Hj18kv0a4L5TFGQ8YVkye6cMbl2VF6s=;
        b=YyIlytPr7dhGhZh1n4740x8jTXToacvwiuTjRhl7OryQkWqeaG4t9xBbEXMJhWhGiC
         m1Cq5gcWdtSctAcUnt83MwRhiXBJ+a94dBQ6qGS4tuqqY9RyN8+RbAn8Tl+U55POKAuB
         D9wVkDFJdg8rIbtS5hisU04sNYtpwd+4rgebs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ua3DWHoWYRZ0Hj18kv0a4L5TFGQ8YVkye6cMbl2VF6s=;
        b=gT8FjAUyPD7Nl+WZ1t5yRNPiFV602PpKfAhFVPLGtSYGEf/U9ATkyc+FN252TS5i4N
         pn5VPluH1YEgQ5BCRqshHwiPmgUSPl2DbnuWhI3W1pdooZDBFqegDgTpMW73jXHrZiL+
         gy1bMfMk1tRwoS3pk4UXkeH7IiV9p8/uDQ/L3lPOATes7nKI+Fqpr2FPqrh5RZDwspJc
         BeWZk794KOUhpc5NrbX4cIB5Igh63TS9Bb8qsx/XDIu04AFmVrO+ZAxZKICPF3EYLmtb
         YnJlaSB19oTHIEDJ8Dt6eNuTyqq0wRtJZyWFfpHu+D5PCR/5eUydx49rD9+RJ0BMocBH
         Xfmw==
X-Gm-Message-State: AOAM531BAJ5Gy/L7iUeQdkc3ptrTPsE0PSGcu5zxR7aLQGGPlQ2mpoWC
        B+7VwNimCc2ytQeC3SkpBwL+0A==
X-Google-Smtp-Source: ABdhPJwQw3NsHIw/XF+SqI6c8xAkwRGZeUj6+GKduWwmPu+iYojpSIIWD9kahjFqaEKb/F+KzBSWsw==
X-Received: by 2002:a63:fd53:0:b0:386:66d:b40c with SMTP id m19-20020a63fd53000000b00386066db40cmr12741689pgj.266.1650341866296;
        Mon, 18 Apr 2022 21:17:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k5-20020a17090ac50500b001cd5ffcca96sm16726552pjt.27.2022.04.18.21.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 21:17:45 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        kernel test robot <lkp@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, stable@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH] USB: serial: Fix heap overflow in WHITEHEAT_GET_DTR_RTS
Date:   Mon, 18 Apr 2022 21:17:42 -0700
Message-Id: <20220419041742.4117026-1-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2631; h=from:subject; bh=gIgxtgBXPkDpXaGP7aAQI8PBhl9DxARQALU32sCb0HQ=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBiXjfmXFgU+SMJsQUdOjA7WslYjSoG7qjHLuLjYkEv G8abkvKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYl435gAKCRCJcvTf3G3AJp63D/ 4u5P63EDXyGqn9YU26NnZ4oNbGN5YfchlZolAZ5r7qKja5KmvCpyan3HLHJQzoovP5H6CWwbwM4QTY XjQ/LVQaTjZRVaCncCJssE5JSCjhPD90lGAE2pmRQOSfFmcE7v9ehLPv19DYz8Ie1aCTB2DNzkhjlB QmThEiUSrtoskck4SemCz6ln0JlndvsjvGiP7VKxkfb2HWvSo5ay0G1PH90uIcsQcKMRjM2b/Iurk5 4UTUTTzZ32raGPjjCsk5FM9t9av+wz0+NgIX3UGlRKDCy0dusVFy+S9sMziYi7mcBrtpCYK5rD/tuz NeKbQLIcojtNN0dCK7KqqR3HNovH2IflWaQHcwkMCsU32I77BFPLuVUX/jIKdCovAxxYBZZGU2XSyq FEqxXjkXhrAOmTzwuSbBrACNI+l/5VvYdPtVEVqxByueJB0CGu9wPwMR7LGbcnrAVFNQG1oxUcUKCr RQF9gxiXS4zAAatKoYWtc3GZbs1bVuj4GmAEioGA+suoeWzzqFtxjqi8utTGTyME41Qap3JHar7H60 gCxE+RDQqwhIpf5GJmbKhtjIhv/rH0zv+Uq/sjQa9ALXM2I0nc2CRCTNpu54amWZOksJmqEqLiPdC5 cqrFa981hQyEKx3L91aZUiGHEmA5huIG90V2xEdEG0CteJipVqv3KQ9tJSgw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This looks like it's harmless, as both the source and the destinations are
currently the same allocation size (4 bytes) and don't use their padding,
but if anything were to ever be added after the "mcr" member in "struct
whiteheat_private", it would be overwritten. The structs both have a
single u8 "mcr" member, but are 4 bytes in padded size. The memcpy()
destination was explicitly targeting the u8 member (size 1) with the
length of the whole structure (size 4), triggering the memcpy buffer
overflow warning:

In file included from include/linux/string.h:253,
                 from include/linux/bitmap.h:11,
                 from include/linux/cpumask.h:12,
                 from include/linux/smp.h:13,
                 from include/linux/lockdep.h:14,
                 from include/linux/spinlock.h:62,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:6,
                 from include/linux/slab.h:15,
                 from drivers/usb/serial/whiteheat.c:17:
In function 'fortify_memcpy_chk',
    inlined from 'firm_send_command' at drivers/usb/serial/whiteheat.c:587:4:
include/linux/fortify-string.h:328:25: warning: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
  328 |                         __write_overflow_field(p_size_field, size);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Expand the memcpy() to the entire structure, though perhaps the correct
solution is to mark all the USB command structures as "__packed".

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/lkml/202204142318.vDqjjSFn-lkp@intel.com
Cc: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/usb/serial/whiteheat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/whiteheat.c b/drivers/usb/serial/whiteheat.c
index da65d14c9ed5..6e00498843fb 100644
--- a/drivers/usb/serial/whiteheat.c
+++ b/drivers/usb/serial/whiteheat.c
@@ -584,7 +584,7 @@ static int firm_send_command(struct usb_serial_port *port, __u8 command,
 		switch (command) {
 		case WHITEHEAT_GET_DTR_RTS:
 			info = usb_get_serial_port_data(port);
-			memcpy(&info->mcr, command_info->result_buffer,
+			memcpy(info, command_info->result_buffer,
 					sizeof(struct whiteheat_dr_info));
 				break;
 		}
-- 
2.32.0

