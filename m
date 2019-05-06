Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9A2146FA
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbfEFJDd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:33 -0400
Received: from mail-ed1-f50.google.com ([209.85.208.50]:41101 "EHLO
        mail-ed1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfEFJDc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:32 -0400
Received: by mail-ed1-f50.google.com with SMTP id m4so14500865edd.8
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PlkR8zEhx2Qim5Zs0mqHecGcHRL4gqAzc2uemQftQuo=;
        b=G88l682d6c+rzYW3sw0YmM96Zvhogqjj78uKowL+cua9BHmHJIFGyb15IEmvGFT2g4
         BQaoIRCsHf0wKhDTK9N0uYAkJv2B/10nQoaQgGc5SyVAdPQnUgFTiR5CFXZJrHqfpymk
         u/FW+EM3b/n7zL60Z0GLaKA6WIymPhg/WwWHExbLpQ3PPptxVZUCjsJkfkohTUal3v6R
         GtkOC8lZUb/tgtAqJ6l5aCn1+EjwxHC4WBVpHUpUdhcBwg9MOBBsCkR3ewVkGfOMltz9
         I83QPaPjADZzr8XA54kB+xC8yLcwTezoKxY28cDLYGfm2rWue2bSbKoYUIpJbfLtZ8sf
         wLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PlkR8zEhx2Qim5Zs0mqHecGcHRL4gqAzc2uemQftQuo=;
        b=UygF6XSKoMsoX/8xx+3KLgv7CERqqaybVTWt3cyFFDobAMQ+Jj2OwG+3NL8CaoQNJJ
         SEVK195cTi8WOE1uHr5V+oblKnBO4/MJpW2D4F9XR44CRpJem3OL4BdsGBEKqotJI1Wc
         gOPWRtWL3E8zAxsUDR6hRVQcXLvpAR4dPozoyoNRLeRog5vf0Mb3rlYHnT1ACQCEc8/d
         FmWGVsTt/eEbcCnJ6AE2xp1qDoI7C2OcJvZc+WE/snR1AtII7//lf29R4NXJ3s66fghL
         08TL4ZYw9WLNB1xMwQR98pZ/jd0uZDA42y2XKXit4F7jlzpYRcM4uv5BIXmL8ThOhGkU
         mICQ==
X-Gm-Message-State: APjAAAUTBztrY/UeosYI8G/uc+ZwGsePt4okj/rnrQyvaS6ozNOL4Kzk
        dMTdkBOldY+1dc5gVPB4FWNmLGSLwrQ=
X-Google-Smtp-Source: APXvYqyZo7oZ4EG/sPn5x3xamMgomwO5+0szzMTC+yyPc5mZZQ64RL+nPYDFssxQvDjho7n/TY96XA==
X-Received: by 2002:a17:906:3601:: with SMTP id q1mr18532076ejb.163.1557133410338;
        Mon, 06 May 2019 02:03:30 -0700 (PDT)
Received: from localhost (frost.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id b4sm2905482edc.16.2019.05.06.02.03.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:29 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 08/34] lsusb.py: do not entirely hide usb.ids exceptions
Date:   Mon,  6 May 2019 12:02:15 +0300
Message-Id: <20190506090241.169665-9-grawity@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190506090241.169665-1-grawity@gmail.com>
References: <20190506090241.169665-1-grawity@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Signed-off-by: Mantas Mikulėnas <grawity@gmail.com>
---
 lsusb.py.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index f9e273d..0d7ff95 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -610,9 +610,8 @@ def main(argv):
 	if usbids[0]:
 		try:
 			parse_usb_ids()
-		except:
-			print(" WARNING: Failure to read usb.ids", file=sys.stderr)
-			#print(sys.exc_info(), file=sys.stderr)
+		except IOError as e:
+			print("Warning: Failure to read usb.ids:", e, file=sys.stderr)
 	read_usb()
 
 # Entry point
-- 
2.21.0

