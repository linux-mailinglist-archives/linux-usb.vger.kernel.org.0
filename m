Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1642534CB
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 18:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgHZQYS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 12:24:18 -0400
Received: from mga04.intel.com ([192.55.52.120]:17284 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726856AbgHZQYR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Aug 2020 12:24:17 -0400
IronPort-SDR: lG6ROm7RZMfhQb/k/ORl9Ewcumm/7iTIcJZCbWT0exu1aOzqKG1d8hCImLvFIRDhVnTYecGyrk
 E0wUwAQeZGpA==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="153749924"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; 
   d="scan'208";a="153749924"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 09:24:17 -0700
IronPort-SDR: K3eoO5N6s+0LS26WHH4aipA/YzuuQfZywiPvdPp9F+vRetDQlHZ0wpq/fMG3XW4KbLP5yZjUOr
 D9zCwbgOonNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; 
   d="scan'208";a="336877573"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2020 09:24:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 633E71B4; Wed, 26 Aug 2020 19:24:14 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Brooke Basile <brookebasile@gmail.com>,
        Kees Cook <keescook@chromium.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v1] USB: gadget: u_f: Unbreak offset calculation in VLAs
Date:   Wed, 26 Aug 2020 19:24:13 +0300
Message-Id: <20200826162413.21637-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Inadvertently the commit b1cd1b65afba ("USB: gadget: u_f: add overflow checks
to VLA macros") makes VLA macros to always return 0 due to different scope of
two variables of the same name. Obviously we need to have only one.

Fixes: b1cd1b65afba ("USB: gadget: u_f: add overflow checks to VLA macros")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/gadget/u_f.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/u_f.h b/drivers/usb/gadget/u_f.h
index df4e1dcb357d..0b5c5f0dd073 100644
--- a/drivers/usb/gadget/u_f.h
+++ b/drivers/usb/gadget/u_f.h
@@ -25,8 +25,8 @@
 		size_t offset = 0;					       \
 		if (groupname##__next != SIZE_MAX) {			       \
 			size_t align_mask = __alignof__(type) - 1;	       \
-			size_t offset = (groupname##__next + align_mask)       \
-					 & ~align_mask;			       \
+			offset = (groupname##__next + align_mask) &	       \
+				  ~align_mask;				       \
 			size_t size = array_size(n, sizeof(type));	       \
 			if (check_add_overflow(offset, size,		       \
 					       &groupname##__next)) {          \
@@ -43,8 +43,8 @@
 		size_t offset = 0;						\
 		if (groupname##__next != SIZE_MAX) {				\
 			size_t align_mask = __alignof__(type) - 1;		\
-			size_t offset = (groupname##__next + align_mask)	\
-					 & ~align_mask;				\
+			offset = (groupname##__next + align_mask) &		\
+				  ~align_mask;					\
 			if (check_add_overflow(offset, groupname##_##name##__sz,\
 							&groupname##__next)) {	\
 				groupname##__next = SIZE_MAX;			\
-- 
2.28.0

