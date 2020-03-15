Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46EB6185BF2
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2020 11:28:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbgCOK2z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 06:28:55 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42055 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728234AbgCOK2z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 06:28:55 -0400
Received: by mail-pg1-f194.google.com with SMTP id h8so7865892pgs.9;
        Sun, 15 Mar 2020 03:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=0A0RJ57z71mMYdjUo91V4iXY17Ap84PMGG8CkVMa8K8=;
        b=o7HfmL36BaFVUjlrx47sFcrPUOsclmtBsW618s/oG1LJSJy/8MF9YCDZaGYEakuyt7
         HpKN9Kj6MbD9Xx44V9Ipmbb/y8nStV7zwJ1IqgfELJtx1A3Fsqc1j0HrzaANMB1eYnmx
         XNjGUpQtGSQ6S7lXhsRzEDONXzpDd/7RS0ddbYsrqvWvZoUOryZtpyOMblYvumwIm1Xm
         DbQKQhKAio3jnJE08YCx14oCa7oYG9yBVamrzkPbNiXITm7cvfzNIR2T9HkdUa5+2N/+
         zjobqZ9vdZVPyhtnSBkqmf/DBzmKaX+qFs5tkSh5pdMzecHsWdPaRDmMfXHZ7ajx8VOy
         xgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=0A0RJ57z71mMYdjUo91V4iXY17Ap84PMGG8CkVMa8K8=;
        b=ApYu7/RAk4vKrD6D5jOpNz+IbtS8E7XnGIINXBe4BGmb0/xkm2NEy/Ns4Wp5FHV+9n
         eHu4jkX+9Lmzq7hK0TjKFWvPg7Z48Fjegtf6wEcbJ3SohqfYA5rAgMd2pi/7TzaVSSVc
         pTmxkCqdGFgkvjbsJb9tRrc7/+29FoyqQ3p+W7/TqCEcsL9OG8A+s0joyQTXHSPyKSRE
         SmFNc5mK6BlwnsCoR5iz57vNcO/SwkPRRA9xc5OkNU+VPtC88XvmnF5YM4+RbqRX7x4Z
         v532ZB+lG3NCYIGwpCyBCzHUWxlVEIxodZYaafqJ6dhLNIeXlTRLnCuQFJDNrWp6E5oD
         l4zQ==
X-Gm-Message-State: ANhLgQ1nNE3nu+zx6lDkQcTFTsx2bJ0S7yIV5rYtn6pM2Rp/1fLSUcC1
        i+/hPf1bXwKkBbJdFuEBSDHuRd2Mc2o=
X-Google-Smtp-Source: ADFU+vu7f2zVxM/NDDw9ipVY18qNybJyCPLvi20SuVj6ZfITcqGgfSSd+h1OAUp0pRgO16x+ynwmwQ==
X-Received: by 2002:a63:fc56:: with SMTP id r22mr21746883pgk.147.1584268134549;
        Sun, 15 Mar 2020 03:28:54 -0700 (PDT)
Received: from nishad ([106.51.232.103])
        by smtp.gmail.com with ESMTPSA id x6sm62618646pfi.83.2020.03.15.03.28.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Mar 2020 03:28:54 -0700 (PDT)
Date:   Sun, 15 Mar 2020 15:58:48 +0530
From:   Nishad Kamdar <nishadkamdar@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Joe Perches <joe@perches.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] USB: atm: Use the correct style for SPDX License Identifier
Message-ID: <20200315102844.GA3460@nishad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch corrects the SPDX License Identifier style in
header file related to USB DSL modem support drivers.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used).

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/usb/atm/usbatm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/atm/usbatm.h b/drivers/usb/atm/usbatm.h
index 8725755bd53d..d96658e2e209 100644
--- a/drivers/usb/atm/usbatm.h
+++ b/drivers/usb/atm/usbatm.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+/* SPDX-License-Identifier: GPL-2.0+ */
 /******************************************************************************
  *  usbatm.h - Generic USB xDSL driver core
  *
-- 
2.17.1

