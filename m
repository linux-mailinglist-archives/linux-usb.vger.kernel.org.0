Return-Path: <linux-usb+bounces-4036-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EC280EA84
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 12:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 222C6282054
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 11:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3D05D4A8;
	Tue, 12 Dec 2023 11:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="fFdul7tf"
X-Original-To: linux-usb@vger.kernel.org
X-Greylist: delayed 344 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 12 Dec 2023 03:38:33 PST
Received: from forward206a.mail.yandex.net (forward206a.mail.yandex.net [178.154.239.87])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D67B8ED
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 03:38:33 -0800 (PST)
Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d101])
	by forward206a.mail.yandex.net (Yandex) with ESMTP id DE14765BFE
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 14:32:49 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-51.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-51.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0d:2a02:0:640:77d9:0])
	by forward101a.mail.yandex.net (Yandex) with ESMTP id 8EF4960907;
	Tue, 12 Dec 2023 14:32:43 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-51.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id gWgMi99Yw4Y0-xhSa6cYC;
	Tue, 12 Dec 2023 14:32:43 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1702380763; bh=8Phpyb5PwskZg7D9WswZASCj93/VdmPhH/Kja8Z5tG8=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=fFdul7tfzcK/Y9RZTBPrH/vKEQC8bJ6O/svXRsTQdE2OsZLIqs1CNKX9SBinXWBFB
	 W9DMB2wljarAv8T5OpHJybsP+Z2A/9v5giTsydwQ2JJYviVTfkBbolWj/6FBVqnAK6
	 0OgpSjbEsZ4QH0/Oa4ceSX/02XgkCrChk7C9m30U=
Authentication-Results: mail-nwsmtp-smtp-production-main-51.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Udipto Goswami <quic_ugoswami@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] usb: gadget: f_fs: fix fortify warning
Date: Tue, 12 Dec 2023 14:29:16 +0300
Message-ID: <20231212112923.61799-1-dmantipov@yandex.ru>
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
index d77ee6b65328..afb97d6d950e 100644
--- a/include/uapi/linux/usb/functionfs.h
+++ b/include/uapi/linux/usb/functionfs.h
@@ -73,8 +73,10 @@ struct usb_os_desc_header {
 struct usb_ext_compat_desc {
 	__u8	bFirstInterfaceNumber;
 	__u8	Reserved1;
-	__u8	CompatibleID[8];
-	__u8	SubCompatibleID[8];
+	struct_group(IDs,
+		__u8	CompatibleID[8];
+		__u8	SubCompatibleID[8];
+	);
 	__u8	Reserved2[6];
 };
 
-- 
2.43.0


