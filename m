Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08594242413
	for <lists+linux-usb@lfdr.de>; Wed, 12 Aug 2020 04:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgHLC3r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 22:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbgHLC3q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 22:29:46 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F977C06174A
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 19:29:46 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id x184so1196694ybx.10
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 19:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=+n1LUw8DJLUyTXbv9Oe2r81KbedmVRu6OMKCTfy3ZiQ=;
        b=gF+6KkYSkPuCLW86O6juaBcdj4+WaTmJrk88Z0Ll9t0HKXakRLGtL2e+dhoGTjOnOR
         kaUAbdEXQaR5k+Qbya8c5FHurzzHJN1LAkLzVFEolC2/dwXBzRVWyqiVLvuba/NVbUZJ
         noY+rFhLK1Q9kfzlB8PDzkFSYMgTRB1JfbleLBaqnviMYn7MWW4CG7/xL6hjbElKNo14
         gmJSvbOGWteTH8BIykzQFgef/ngKDt0Sg56ylSppx36Hki0V1gGdEPBJDrlV4lT7tq+k
         uPsTKxJCjdk7QRkcXjgoMHmkaC7JaEpnFmoFuVb6hkzmNgrJwpdw3YQtKmaNsIywOXMQ
         VHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=+n1LUw8DJLUyTXbv9Oe2r81KbedmVRu6OMKCTfy3ZiQ=;
        b=Z5jPZqZBfz0J4fmE34yx8pHSUaAcpB7+xTuvPgwTgNtDWk6e2spFDTLFBRyy6ylMqY
         H9lRDiQV0PKdNskZCk6mRWEfHC5of17aHLeHwh3g3rQZphe9rytzHNwYxt6zmwY4w2oD
         c+T039aPZPh5hNFVp3jklNRNrabC6KzPBDcRLM0J8XY2qXybJqiFeZZe+J3fl5YdEX8H
         2RK/6wjQaqVb7YZJ56cQdnEwfPjRT4FFd0hPlZeZKu20nroOoLZW3DemQms5TUfe7bzL
         7A8jfpxj/TBQON/YFAONol+cE8j36TYjUf4jfjZO8w6GtfIl0UztCuhLsmE2mepaCtzC
         bDHQ==
X-Gm-Message-State: AOAM531CTAm9iCUWcNKhY3QnOuVDV+0ad//LHAYt15hHdXu2yDAWf+cI
        mNmj5wYf0yo8G1g4jPZzp8b3NX2foMw=
X-Google-Smtp-Source: ABdhPJy4Ky3Al50cuQO6kqOXG7d2vNlasxYBXERWMS28MgJ0beqiTabAX+wsLbbYFzmtVPKC3nhGlkrYfuA=
X-Received: by 2002:a25:f30c:: with SMTP id c12mr55236202ybs.471.1597199385901;
 Tue, 11 Aug 2020 19:29:45 -0700 (PDT)
Date:   Tue, 11 Aug 2020 19:29:34 -0700
In-Reply-To: <20200812022934.568134-1-badhri@google.com>
Message-Id: <20200812022934.568134-2-badhri@google.com>
Mime-Version: 1.0
References: <20200812022934.568134-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
Subject: [PATCH 2/2 v3] usb: typec: pd: Fix formatting in pd.h header
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Replacing spaces with tabs for PD_T_* constants.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Change history:
First version. Keeping the version number same as the parent.

---
 include/linux/usb/pd.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/usb/pd.h b/include/linux/usb/pd.h
index 1df895e4680b..f842e4589bd2 100644
--- a/include/linux/usb/pd.h
+++ b/include/linux/usb/pd.h
@@ -471,9 +471,10 @@ static inline unsigned int rdo_max_power(u32 rdo)
 #define PD_T_VCONN_SOURCE_ON	100
 #define PD_T_SINK_REQUEST	100	/* 100 ms minimum */
 #define PD_T_ERROR_RECOVERY	100	/* minimum 25 is insufficient */
-#define PD_T_SRCSWAPSTDBY      625     /* Maximum of 650ms */
-#define PD_T_NEWSRC            250     /* Maximum of 275ms */
+#define PD_T_SRCSWAPSTDBY	625	/* Maximum of 650ms */
+#define PD_T_NEWSRC		250	/* Maximum of 275ms */
 #define PD_T_SWAP_SRC_START	20	/* Minimum of 20ms */
+#define PD_T_BIST_CONT_MODE	50	/* 30 - 60 ms */
 
 #define PD_T_DRP_TRY		100	/* 75 - 150 ms */
 #define PD_T_DRP_TRYWAIT	600	/* 400 - 800 ms */
@@ -484,5 +485,4 @@ static inline unsigned int rdo_max_power(u32 rdo)
 #define PD_N_CAPS_COUNT		(PD_T_NO_RESPONSE / PD_T_SEND_SOURCE_CAP)
 #define PD_N_HARD_RESET_COUNT	2
 
-#define PD_T_BIST_CONT_MODE	50 /* 30 - 60 ms */
 #endif /* __LINUX_USB_PD_H */
-- 
2.28.0.236.gb10cc79966-goog

