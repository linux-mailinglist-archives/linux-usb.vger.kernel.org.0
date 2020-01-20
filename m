Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB95E142CCC
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 15:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbgATOFz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 09:05:55 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43389 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbgATOFy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jan 2020 09:05:54 -0500
Received: by mail-pg1-f194.google.com with SMTP id k197so15590815pga.10;
        Mon, 20 Jan 2020 06:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hJrcFJ3vsqXp48qo1RuEHDb7bDX0LbPhJcuIERyga/A=;
        b=qBYZJhaeClTqitdQhQn1Nh/6WuACkmiDFzbx82/EYpB5s21+STqhxYmWqYS+oi7GlX
         oIBo+AZ56AuXoc7ZJkwnecAWJ1DH3oiXaq/8g3BakcRA4x/97ANXzbFbdDqiIxT/98T7
         JYsUB5GVDPm5p0vN9+klwEfD6QaNn8ZHRRcg3c6NUEu93kCCgr4GcGEPC2GsHFEKvICS
         jWCBrXfuNWIiN9WMj8Txisyat8sNQF1CItStp58bvXzO3MYjaRiwM6PNIri7jVqAF0yl
         cXeapFOBZSdEFJ+Ftk2rdnqyoGItJEG5C2vDS0W/6pyI4pXN6qMvLYy2OpXxPlQfe7CX
         Eiyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hJrcFJ3vsqXp48qo1RuEHDb7bDX0LbPhJcuIERyga/A=;
        b=LAXSLnVi13bpvQ71EufCG9ZrX3eX0PLKEDLFT+5w7DfDynVdTpIOZqBLxJZnrVk9sO
         /U23EXYCcrWV6X7mEjJgNvrZHCiObhpjWiR1JJT224mfpIkSvYsqRjnhEFlRJ2moKLJ7
         YVJLE0hkyjnKucD1N6bDn9lm5sLC8yItgrnhTGbmY7xFBObs6lEhpsm57pu/o+Mi8fCx
         JIyBCKj33A27uZkvqysMs0oMLI8PDw04Fb2+3WkUSXwv189LPBAX6hCPaPp/uLC8cBFt
         Ugv+1FhM7zTEu/ksRgaOjXfiN940Dlx+WfYOO2qLhvsbf11dpqvsAsmxBzsa1Tj2jXBU
         pcMg==
X-Gm-Message-State: APjAAAXgEbI10dJa0H6QmqSSTiPOceFLDh3AUdd55Bv1aS0jxno5hS+w
        x0EYlkTD/QWkj5J2giesHVgjCT2xrXiQyw==
X-Google-Smtp-Source: APXvYqw70cs8vLjnYZx/kM+R8OVhr+GwwfEZSBnYr/t0VvyJGzPLRR/18E35qoo5J+w3AhThHV5I3w==
X-Received: by 2002:a63:7a56:: with SMTP id j22mr11188460pgn.35.1579529153152;
        Mon, 20 Jan 2020 06:05:53 -0800 (PST)
Received: from glados.lan ([2601:647:4c01:6541:fa16:54ff:fed1:1bd6])
        by smtp.gmail.com with ESMTPSA id b42sm188991pjc.27.2020.01.20.06.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 06:05:52 -0800 (PST)
From:   Thomas Hebb <tommyhebb@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-stable@vger.kernel.org, Thomas Hebb <tommyhebb@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 2/2] usb: typec: fusb302: fix "op-sink-microwatt" default that was in mW
Date:   Mon, 20 Jan 2020 06:05:41 -0800
Message-Id: <c497958a1b0d8e3421c5eda46abddba6651cec1e.1579529138.git.tommyhebb@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <0eac53c4878423a9abd49d2142fe4cb1136db4e2.1579529138.git.tommyhebb@gmail.com>
References: <0eac53c4878423a9abd49d2142fe4cb1136db4e2.1579529138.git.tommyhebb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

commit 8f6244055bd3 ("usb: typec: fusb302: Always provide fwnode for the
port") didn't convert this value from mW to uW when migrating to a new
specification format like it should have.

Fixes: 8f6244055bd3 ("usb: typec: fusb302: Always provide fwnode for the port")
Cc: linux-stable@vger.kernel.org
Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>

---

Changes in v2: None

 drivers/usb/typec/tcpm/fusb302.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index ed8655c6af8c..b498960ff72b 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -1666,7 +1666,7 @@ static const struct property_entry port_props[] = {
 	PROPERTY_ENTRY_STRING("try-power-role", "sink"),
 	PROPERTY_ENTRY_U32_ARRAY("source-pdos", src_pdo),
 	PROPERTY_ENTRY_U32_ARRAY("sink-pdos", snk_pdo),
-	PROPERTY_ENTRY_U32("op-sink-microwatt", 2500),
+	PROPERTY_ENTRY_U32("op-sink-microwatt", 2500000),
 	{ }
 };
 
-- 
2.24.1

