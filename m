Return-Path: <linux-usb+bounces-4148-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B48B0812B17
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 10:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1750D2828D4
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 09:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FD925773;
	Thu, 14 Dec 2023 09:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="O4RQB6Ut"
X-Original-To: linux-usb@vger.kernel.org
Received: from forward103b.mail.yandex.net (forward103b.mail.yandex.net [178.154.239.150])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD5D310A
	for <linux-usb@vger.kernel.org>; Thu, 14 Dec 2023 01:05:31 -0800 (PST)
Received: from mail-nwsmtp-smtp-production-main-22.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-22.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:9c8d:0:640:38ed:0])
	by forward103b.mail.yandex.net (Yandex) with ESMTP id 6243360B20;
	Thu, 14 Dec 2023 12:05:29 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-22.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id S5gp596PmGk0-mcefhQZX;
	Thu, 14 Dec 2023 12:05:28 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1702544728; bh=qNAf6a0n2iFrRHyvBKAct41bNMWRnW2Gh+8LEzcjWAg=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=O4RQB6Ut7dF5Ym4TUGw+cCVVMY/lCg3QUjtfIuREqB8RuZDsaY7bCNJC8jYgce3pl
	 X9UmpeUfK7aqqiJG2jb4OO4bGhuL5FpJ/TXlX5UbPCihsLfmdgZaHRw3ueF4onnTRn
	 aVHTzFx4jijcgLx5Ea0vF4xBh0uBscDUT0xMwgu0=
Authentication-Results: mail-nwsmtp-smtp-production-main-22.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Udipto Goswami <quic_ugoswami@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] [v2] usb: gadget: f_fs: fix fortify warning
Date: Thu, 14 Dec 2023 12:04:15 +0300
Message-ID: <20231214090428.27292-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When compiling with gcc version 14.0.0 20231206 (experimental)
and CONFIG_FORTIFY_SOURCE=y, I've noticed the following warning:

...
In function 'fortify_memcpy_chk',
    inlined from '__ffs_func_bind_do_os_desc' at drivers/usb/gadget/function/f_fs.c:2934:3:
./include/linux/fortify-string.h:588:25: warning: call to '__read_overflow2_field'
declared with attribute warning: detected read beyond size of field (2nd parameter);
maybe use struct_group()? [-Wattribute-warning]
  588 |                         __read_overflow2_field(q_size_field, size);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This call to 'memcpy()' is interpreted as an attempt to copy both
'CompatibleID' and 'SubCompatibleID' of 'struct usb_ext_compat_desc'
from an address of the first one, which causes an overread warning.
Since we actually want to copy both of them at once, use the
convenient 'struct_group()' and 'sizeof_field()' here.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v2: fix __struct_group(...) usage in uapi header
---
 drivers/usb/gadget/function/f_fs.c  | 5 ++---
 include/uapi/linux/usb/functionfs.h | 6 ++++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index efe3e3b85769..dafedc33928d 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -2931,9 +2931,8 @@ static int __ffs_func_bind_do_os_desc(enum ffs_os_desc_type type,
 
 		t = &func->function.os_desc_table[desc->bFirstInterfaceNumber];
 		t->if_id = func->interfaces_nums[desc->bFirstInterfaceNumber];
-		memcpy(t->os_desc->ext_compat_id, &desc->CompatibleID,
-		       ARRAY_SIZE(desc->CompatibleID) +
-		       ARRAY_SIZE(desc->SubCompatibleID));
+		memcpy(t->os_desc->ext_compat_id, &desc->IDs,
+		       sizeof_field(struct usb_ext_compat_desc, IDs));
 		length = sizeof(*desc);
 	}
 		break;
diff --git a/include/uapi/linux/usb/functionfs.h b/include/uapi/linux/usb/functionfs.h
index d77ee6b65328..078098e73fd3 100644
--- a/include/uapi/linux/usb/functionfs.h
+++ b/include/uapi/linux/usb/functionfs.h
@@ -73,8 +73,10 @@ struct usb_os_desc_header {
 struct usb_ext_compat_desc {
 	__u8	bFirstInterfaceNumber;
 	__u8	Reserved1;
-	__u8	CompatibleID[8];
-	__u8	SubCompatibleID[8];
+	__struct_group(/* no tag */, IDs, /* no attrs */,
+		__u8	CompatibleID[8];
+		__u8	SubCompatibleID[8];
+	);
 	__u8	Reserved2[6];
 };
 
-- 
2.43.0


