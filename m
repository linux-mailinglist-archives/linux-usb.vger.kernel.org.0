Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6B70478E1A
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 15:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237525AbhLQOln (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Dec 2021 09:41:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237448AbhLQOle (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Dec 2021 09:41:34 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F4DC061746
        for <linux-usb@vger.kernel.org>; Fri, 17 Dec 2021 06:41:34 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id g14so8593568edb.8
        for <linux-usb@vger.kernel.org>; Fri, 17 Dec 2021 06:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=prx8zfLm++UaV7tRi+h7F/1CWXMzXH0CDo7rG8rAFdA=;
        b=E9Ph0oZKEOzRCtzCxFqzG4jCttRrdn1ILbGXMcbn1KuAnQNGZGeyk8wHdlFrd4gbu0
         CY+qRw5Q0YyTHWjqY3sZB9Y71S7GeixDFlwz1xSPeVfn12fXBWJzK1WDGBlQepnuzaw8
         RFHFH4NWPMOxEZ6iWo5hWGs6xn3wV+5ehxmHgP77hmSNvarC5CmxMezTTGah/GnCneZj
         hgbtJfKQaJ3+PNF9b51/Qvwv2BFkvUJ3dO1kvwso7QdkYSESBg5LCrNr24GsGhOX/YJZ
         /NkFbHu7pgNcgrug0mMRHjkYdc2pie9ksBqRzSxRSicD/kaVvwGjM/qykNswW36LHAgV
         BbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=prx8zfLm++UaV7tRi+h7F/1CWXMzXH0CDo7rG8rAFdA=;
        b=1DnD50ub3LPC8scS/tZ4lxUP2lwmHA1SiVl+Own/ckJxaANmf3WAr8e64Xq3wTu2Rg
         hoD3GXyH9tLMEkiy5ArC1wHKcidxl4K9MLTlCo45qkwHe3jn7x16CaVXTYKu5p+mvUuU
         XXC7AIALhj4BBQbhDRWGUdh+RTjVbovk40RSHn/tvxO5rGjPglTfFgOO1Wg9wX5Yd0Az
         KLvIXs0Xmy48hFcQ36ABFFdkpHHPAbJfS/XERjnXFH9wNDW/NJvNOVV5mf+eo2W4fp4d
         A5ghMjRB7AW4KLcdW4MxQ7bPZob9cHX/3TiRJP6Y8vyvnWFhC+vyrBT43NKkPfiTqE10
         1kmw==
X-Gm-Message-State: AOAM531cLDETPA5eWUxCv+K93DCVHHHIqk0LjFO2pd732HJoBKLlv9n7
        /0z18lvUqeqB6zqEzaLQvrhJ2Q==
X-Google-Smtp-Source: ABdhPJywK8bZDgfNUvPPKxbssPadVqj3AkWb1rY8veYLtmYNLEIEIdPUkgkdT4Zgqv82iO3X331IiQ==
X-Received: by 2002:a50:9ead:: with SMTP id a42mr3159418edf.315.1639752091690;
        Fri, 17 Dec 2021 06:41:31 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se. [85.229.40.155])
        by smtp.gmail.com with ESMTPSA id w7sm3674153ede.66.2021.12.17.06.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 06:41:31 -0800 (PST)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     stable@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, woojung.huh@microchip.com,
        UNGLinuxDriver@microchip.com, davem@davemloft.net,
        netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        clang-built-linux@googlegroups.com, ulli.kroll@googlemail.com,
        linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
        amitkarwar@gmail.com, nishants@marvell.com, gbhat@marvell.com,
        huxinming820@gmail.com, kvalo@codeaurora.org,
        linux-wireless@vger.kernel.org, rostedt@goodmis.org,
        mingo@redhat.com, dmitry.torokhov@gmail.com,
        ndesaulniers@google.com, nathan@kernel.org,
        linux-input@vger.kernel.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Andy Lavr <andy.lavr@gmail.com>,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 4.19 3/6] mwifiex: Remove unnecessary braces from HostCmd_SET_SEQ_NO_BSS_INFO
Date:   Fri, 17 Dec 2021 15:41:16 +0100
Message-Id: <20211217144119.2538175-4-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211217144119.2538175-1-anders.roxell@linaro.org>
References: <20211217144119.2538175-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Nathan Chancellor <natechancellor@gmail.com>

commit 6a953dc4dbd1c7057fb765a24f37a5e953c85fb0 upstream.

A new warning in clang points out when macro expansion might result in a
GNU C statement expression. There is an instance of this in the mwifiex
driver:

drivers/net/wireless/marvell/mwifiex/cmdevt.c:217:34: warning: '}' and
')' tokens terminating statement expression appear in different macro
expansion contexts [-Wcompound-token-split-by-macro]
        host_cmd->seq_num = cpu_to_le16(HostCmd_SET_SEQ_NO_BSS_INFO
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/marvell/mwifiex/fw.h:519:46: note: expanded from
macro 'HostCmd_SET_SEQ_NO_BSS_INFO'
        (((type) & 0x000f) << 12);                  }
                                                    ^

This does not appear to be a real issue. Removing the braces and
replacing them with parentheses will fix the warning and not change the
meaning of the code.

Fixes: 5e6e3a92b9a4 ("wireless: mwifiex: initial commit for Marvell mwifiex driver")
Link: https://github.com/ClangBuiltLinux/linux/issues/1146
Reported-by: Andy Lavr <andy.lavr@gmail.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/net/wireless/marvell/mwifiex/cmdevt.c | 4 ++--
 drivers/net/wireless/marvell/mwifiex/fw.h     | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/cmdevt.c b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
index 60db2b969e20..b7ced103b814 100644
--- a/drivers/net/wireless/marvell/mwifiex/cmdevt.c
+++ b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
@@ -324,9 +324,9 @@ static int mwifiex_dnld_sleep_confirm_cmd(struct mwifiex_adapter *adapter)
 
 	adapter->seq_num++;
 	sleep_cfm_buf->seq_num =
-		cpu_to_le16((HostCmd_SET_SEQ_NO_BSS_INFO
+		cpu_to_le16(HostCmd_SET_SEQ_NO_BSS_INFO
 					(adapter->seq_num, priv->bss_num,
-					 priv->bss_type)));
+					 priv->bss_type));
 
 	mwifiex_dbg(adapter, CMD,
 		    "cmd: DNLD_CMD: %#x, act %#x, len %d, seqno %#x\n",
diff --git a/drivers/net/wireless/marvell/mwifiex/fw.h b/drivers/net/wireless/marvell/mwifiex/fw.h
index 8b9d0809daf6..076ea1c4b921 100644
--- a/drivers/net/wireless/marvell/mwifiex/fw.h
+++ b/drivers/net/wireless/marvell/mwifiex/fw.h
@@ -512,10 +512,10 @@ enum mwifiex_channel_flags {
 
 #define RF_ANTENNA_AUTO                 0xFFFF
 
-#define HostCmd_SET_SEQ_NO_BSS_INFO(seq, num, type) {   \
-	(((seq) & 0x00ff) |                             \
-	 (((num) & 0x000f) << 8)) |                     \
-	(((type) & 0x000f) << 12);                  }
+#define HostCmd_SET_SEQ_NO_BSS_INFO(seq, num, type) \
+	((((seq) & 0x00ff) |                        \
+	 (((num) & 0x000f) << 8)) |                 \
+	(((type) & 0x000f) << 12))
 
 #define HostCmd_GET_SEQ_NO(seq)       \
 	((seq) & HostCmd_SEQ_NUM_MASK)
-- 
2.34.1

