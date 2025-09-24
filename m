Return-Path: <linux-usb+bounces-28606-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AA3B9AC3D
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 17:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32F0617C2B0
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 15:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350EB30B53B;
	Wed, 24 Sep 2025 15:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="a0oJvL8E"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A89719E7E2
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 15:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758728920; cv=none; b=SusKbhA/O337HSmhrWWK6KlnQzAU/RYm2Zzk5d33liPvaCbTgtd2BRiBKkGXN2Xoyq2U6cZ+fpr/kQ9Y2nPx8Ow9RWbD67zosQmfcS0MyCrlb85c+gAs0Yx8kvJUdEzQso0sAZFe+7hJBruydO1kdkIs7mDTVJPM8wzE56UnTLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758728920; c=relaxed/simple;
	bh=FNKsNLilWsQySnx+JaHNaL+3PDqiW1uMqoqV/cmu77c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ihQJIkhJLPLrQIkjIQeUTd1ba8kg20UUfpYAjheXJpLAmbJY0AgYppVT/N3hXa9NWcFR7gSlOX8tJ8ORThXQlQtegPuYcV5d0QuxGzLszdTZITFHzIEeUgdcbiKQyCV24PVeYgil4jY+fqBgyFn8iKeti3SH22PS97ZE9gw6EpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=a0oJvL8E; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ee1381b835so29567f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 08:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1758728917; x=1759333717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ga9wpd87ypEhIhE5XHNvwVyhbRbjt41ZUlw/++PjyKs=;
        b=a0oJvL8EipjJ+8mZX2I3hYg2J8KsM7GrUb8jQX5ommoRJP570CsTIFeB2dJG6yjWNt
         55cNZVI6cd641ZVQ36wGz13JNkeqUaKpN1mqd27yRmIyp5cMliImKpXQsfXFawByNGER
         +7LwCPvVCh8sZBVelNDXaKMAofuTHA8Qpg/OCNuQleh1nhY4MxMkehvOHMc50d2CkI4j
         kqccudbHzRLsXwUB6tMn0+jf38g3ZY+hr3EY16DZ7Bi0lKH6AB46QHMD1iTHNxaLr0ul
         vXZCq4OteA6bENIfiioG2qBBJyHmyW+zByQP+xcK8/l0G9km9o9cgGP3ZXT/QBiY4oNX
         tNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758728917; x=1759333717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ga9wpd87ypEhIhE5XHNvwVyhbRbjt41ZUlw/++PjyKs=;
        b=TWelNdneYh6pFPtDh1DLs2gkX8Fgm9O+t6x3v2/9Tx+l8OJPKfnH2eGFTLeIZ7UhIz
         8XTy+38m/7Nm0e7ta9nog+3+Ol7rof+2iN4fzwZKP0oDfq9err5f5xGptrEjjqfdO9hZ
         62S7ecxLYB2/mvYZ7ld3AHUADe5VIdbiLa9/ts8VCCQ+wkpvwPBr60G0mZBNQ03lx4XQ
         PEZSBza7RQZhCP2dqbKqmOfuGQSEBEVSJ+cb+3mJbZeXuFALUpFMolFIHAiGPIBr2b6M
         jlXN8RtmYRzF10xX/gJewFW9dbvS4ihtDgewu6jWxmlBDVuiBG2qiGyyNZeZWMg/QZSf
         V4lw==
X-Gm-Message-State: AOJu0YzWWjyTaIkIasD2k3txAxwH28o2wxuoY1IOZn3KJIiVYd+lKENq
	1sJYndfS+lJd4eTS+4hn250ryQ9dtLBWQYKH8ZD9+aOVliryNAYVJbEn4ohtSSQ29a8=
X-Gm-Gg: ASbGncsbzE516HU/u7yljUz7LMag84Rp/JD6bL4Rwq6L0cUFzWSRdHXV9fCMGzMTo00
	/QOG2fZgrQk6aAWdLINGL1ZF9fNs+4fF1kPiyV61JelLuzCWDpM9KK0tYkgGOi0s7Yq3b8z/a0R
	h6jgk89urI9W1D6a+VTdK6P7FVqwkkvJiGC4wspb8ItH1JU9ho2v9fY7xD7al6xCLXEaMaHslV1
	FVDQCUUcpLFaIID2zGepu661m8YakALZkv2iUfnNJ5jgGjnyL7S6EkeKEOFJewgW506Ibg1f/wR
	2y2I2rst8xM8sr0lHaQQZ4NDCBO5eegnAxSY8FkFpL3stameu5Nqknx9JP9n7HQcAb89wz0szqx
	oy/CehSllF6C4e1kmJqSQLWh2KqixbFs92O3/5vJQEVgvJaWC
X-Google-Smtp-Source: AGHT+IGteDCuymW8jXqrVPp1LBIadB6oPStoD1tgjWbrgFvwIM1Si+KHLUQ/JYjhGxkaqDiiOa3zlg==
X-Received: by 2002:a5d:5d0b:0:b0:3fa:ebaf:4c2f with SMTP id ffacd0b85a97d-40e4bb2f5c2mr317315f8f.30.1758728916768;
        Wed, 24 Sep 2025 08:48:36 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb15:854c:e000:cf85:df87:23e6:2e45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee07407aebsm29694004f8f.14.2025.09.24.08.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:48:36 -0700 (PDT)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	kees@kernel.org,
	abdul.rahim@myyahoo.com,
	jilliandonahue58@gmail.com,
	jkeeping@inmusicbrands.com,
	Victor Krawiec <victor.krawiec@arturia.com>
Subject: [PATCH] usb: gadget: f_midi: allow customizing the USB MIDI interface string through configfs
Date: Wed, 24 Sep 2025 17:48:21 +0200
Message-ID: <20250924154822.205703-1-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using f_midi from configfs the USB MIDI interface string is hardcoded
to 'MIDI function'.

This USB string descriptor is used by some third-party OS or software to
display the name of the MIDI device

Since we add an additional string option a new macro block was created to
factorize declarations

Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>
---
 drivers/usb/gadget/function/f_midi.c | 108 +++++++++++++++------------
 drivers/usb/gadget/function/u_midi.h |   8 +-
 2 files changed, 66 insertions(+), 50 deletions(-)

diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index da82598fcef8..0a8af7d507d9 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -875,6 +875,7 @@ static int f_midi_bind(struct usb_configuration *c, struct usb_function *f)
 	struct usb_composite_dev *cdev = c->cdev;
 	struct f_midi *midi = func_to_midi(f);
 	struct usb_string *us;
+	struct f_midi_opts *opts;
 	int status, n, jack = 1, i = 0, endpoint_descriptor_index = 0;
 
 	midi->gadget = cdev->gadget;
@@ -883,6 +884,10 @@ static int f_midi_bind(struct usb_configuration *c, struct usb_function *f)
 	if (status < 0)
 		goto fail_register;
 
+	opts = container_of(f->fi, struct f_midi_opts, func_inst);
+	if (opts->interface_string_allocated && opts->interface_string)
+		midi_string_defs[STRING_FUNC_IDX].s = opts->interface_string;
+
 	/* maybe allocate device-global string ID */
 	us = usb_gstrings_attach(c->cdev, midi_strings,
 				 ARRAY_SIZE(midi_string_defs));
@@ -1178,59 +1183,62 @@ end:									\
 									\
 CONFIGFS_ATTR(f_midi_opts_, name);
 
+#define F_MIDI_OPT_STRING(name)						\
+static ssize_t f_midi_opts_##name##_show(struct config_item *item, char *page) \
+{									\
+	struct f_midi_opts *opts = to_f_midi_opts(item);		\
+	ssize_t result;							\
+									\
+	mutex_lock(&opts->lock);					\
+	if (opts->name) {						\
+		result = strscpy(page, opts->name, PAGE_SIZE);		\
+	} else {							\
+		page[0] = 0;						\
+		result = 0;						\
+	}								\
+									\
+	mutex_unlock(&opts->lock);					\
+									\
+	return result;							\
+}									\
+									\
+static ssize_t f_midi_opts_##name##_store(struct config_item *item,	\
+					 const char *page, size_t len)	\
+{									\
+	struct f_midi_opts *opts = to_f_midi_opts(item);		\
+	int ret;							\
+	char *c;							\
+									\
+	mutex_lock(&opts->lock);					\
+	if (opts->refcnt > 1) {						\
+		ret = -EBUSY;						\
+		goto end;						\
+	}								\
+									\
+	c = kstrndup(page, len, GFP_KERNEL);				\
+	if (!c) {							\
+		ret = -ENOMEM;						\
+		goto end;						\
+	}								\
+	if (opts->name##_allocated)					\
+		kfree(opts->name);					\
+	opts->name = c;							\
+	opts->name##_allocated = true;					\
+	ret = len;							\
+end:									\
+	mutex_unlock(&opts->lock);					\
+	return ret;							\
+}									\
+									\
+CONFIGFS_ATTR(f_midi_opts_, name);
+
 F_MIDI_OPT_SIGNED(index, true, SNDRV_CARDS);
 F_MIDI_OPT(buflen, false, 0);
 F_MIDI_OPT(qlen, false, 0);
 F_MIDI_OPT(in_ports, true, MAX_PORTS);
 F_MIDI_OPT(out_ports, true, MAX_PORTS);
-
-static ssize_t f_midi_opts_id_show(struct config_item *item, char *page)
-{
-	struct f_midi_opts *opts = to_f_midi_opts(item);
-	ssize_t result;
-
-	mutex_lock(&opts->lock);
-	if (opts->id) {
-		result = strscpy(page, opts->id, PAGE_SIZE);
-	} else {
-		page[0] = 0;
-		result = 0;
-	}
-
-	mutex_unlock(&opts->lock);
-
-	return result;
-}
-
-static ssize_t f_midi_opts_id_store(struct config_item *item,
-				    const char *page, size_t len)
-{
-	struct f_midi_opts *opts = to_f_midi_opts(item);
-	int ret;
-	char *c;
-
-	mutex_lock(&opts->lock);
-	if (opts->refcnt > 1) {
-		ret = -EBUSY;
-		goto end;
-	}
-
-	c = kstrndup(page, len, GFP_KERNEL);
-	if (!c) {
-		ret = -ENOMEM;
-		goto end;
-	}
-	if (opts->id_allocated)
-		kfree(opts->id);
-	opts->id = c;
-	opts->id_allocated = true;
-	ret = len;
-end:
-	mutex_unlock(&opts->lock);
-	return ret;
-}
-
-CONFIGFS_ATTR(f_midi_opts_, id);
+F_MIDI_OPT_STRING(id);
+F_MIDI_OPT_STRING(interface_string);
 
 static struct configfs_attribute *midi_attrs[] = {
 	&f_midi_opts_attr_index,
@@ -1239,6 +1247,7 @@ static struct configfs_attribute *midi_attrs[] = {
 	&f_midi_opts_attr_in_ports,
 	&f_midi_opts_attr_out_ports,
 	&f_midi_opts_attr_id,
+	&f_midi_opts_attr_interface_string,
 	NULL,
 };
 
@@ -1264,6 +1273,8 @@ static void f_midi_free_inst(struct usb_function_instance *f)
 	if (free) {
 		if (opts->id_allocated)
 			kfree(opts->id);
+		if (opts->interface_string_allocated)
+			kfree(opts->interface_string);
 		kfree(opts);
 	}
 }
@@ -1280,6 +1291,7 @@ static struct usb_function_instance *f_midi_alloc_inst(void)
 	opts->func_inst.free_func_inst = f_midi_free_inst;
 	opts->index = SNDRV_DEFAULT_IDX1;
 	opts->id = SNDRV_DEFAULT_STR1;
+	opts->interface_string = SNDRV_DEFAULT_STR1;
 	opts->buflen = 512;
 	opts->qlen = 32;
 	opts->in_ports = 1;
diff --git a/drivers/usb/gadget/function/u_midi.h b/drivers/usb/gadget/function/u_midi.h
index 2e400b495cb8..c9c396301a43 100644
--- a/drivers/usb/gadget/function/u_midi.h
+++ b/drivers/usb/gadget/function/u_midi.h
@@ -15,11 +15,15 @@
 
 #include <linux/usb/composite.h>
 
+#define F_MIDI_OPT_STRING_DECLARE(name) \
+	char *name; \
+	bool name##_allocated; \
+
 struct f_midi_opts {
 	struct usb_function_instance	func_inst;
 	int				index;
-	char				*id;
-	bool				id_allocated;
+	F_MIDI_OPT_STRING_DECLARE(id);
+	F_MIDI_OPT_STRING_DECLARE(interface_string);
 	unsigned int			in_ports;
 	unsigned int			out_ports;
 	unsigned int			buflen;

base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
-- 
2.43.0


