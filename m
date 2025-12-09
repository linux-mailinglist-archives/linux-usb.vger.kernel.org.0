Return-Path: <linux-usb+bounces-31340-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EA3CB09BC
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 17:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 868D630080CB
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 16:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6F22FF147;
	Tue,  9 Dec 2025 16:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="APIMrdAo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49259328618
	for <linux-usb@vger.kernel.org>; Tue,  9 Dec 2025 16:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765298436; cv=none; b=jfxUslo36onV0QWYC5DNReM6qMnfsAZe78XQYXYdR5KOPCb9dbvtAzu9JBrdbKuy6MitX2MJrXCA0i3boCGD+kqLRRIznvYhreGqx2je6nQPNFGZebrHmPBr07D7NgpZrLJrn+EOJU/FjJeWDkdLmBHLmhM1BPt1BbTXeHq+IvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765298436; c=relaxed/simple;
	bh=++9OHvhMumrV20LJ7q5JsVuI+EnRyA0/+GtmYBQSsVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UKyZk+DlN04bK4S41vA0fKM6bJg6vVAYwM0CUvm2g33owHoEm0v6Tc7jURTwIeiGY0fZby7YomPG6EU0H6vLoAlrihgkhsMt+uIp/MQawsbGgq9WPHTK1gMCYS6m7qloQdDoIj7nrDjSuwSTWqARtl7+uce//ztzRutQe6W7n0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=APIMrdAo; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477632b0621so41949535e9.2
        for <linux-usb@vger.kernel.org>; Tue, 09 Dec 2025 08:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1765298432; x=1765903232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sd5cGMdlvX87FNTFw7luLCsJmzXmWV6Bmc5tqLNvtGs=;
        b=APIMrdAol+fI3N3Po0REqnGQjtvM5s63PeoM18gUxbvTWO2QunC8fWgiqm2w94NL8Q
         4moXbHy4uWqK19f1g0w9MtA4H0cxvm6m/An1DrRVGwtaLSmPzYzlKsmWA5/rCLbKEsrh
         7pQHq8LjGbTlPt+/y9E0YwJ3fyvW/hl5ot04j/83rmDoUo8yrxN+xuAJG92sJxAxh1YI
         2ng/Clx47zJ4Q8fwdCoIF+E5Tlu0BX8akmjlPAFBE9nfAlomf5cAwgXZFESxkGBomFN6
         +ikZmFBPhTm5qO/5mru14H5IET9D5pNJblNhxjf14jbZ5gwVig++ySkpjSBUS0CwpQvq
         GNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765298432; x=1765903232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sd5cGMdlvX87FNTFw7luLCsJmzXmWV6Bmc5tqLNvtGs=;
        b=korFu69mY8ajHxDOhQXMp0H8tMRNQ1tF3RpEPUfOyLaqKHrYzg6RlxHY0VU979ZvRU
         edfPUSPHYLRVOL1PunVDwYD8hyCDgo+hUNf8DXsifB7f95UTec9jJSJTw7Qs/xEM4Qz7
         X502S73vxTcPgpmHm+Ub8WtLARYMCZFf6+HE3DA6++jzotQlM/k9i52KfL23GjLuIIdW
         mg+1JSBKzx1fK8FJ9cR1+c768kr+L2LJd1e7gA3LE+Yk9XEs4iEMPQG+zdS3Ytkio3gj
         2yxjBA65+vXEk3IIz14ONRRKfQfTE8Fdv5uNYP+TCon0jk0x8w7YVLCoUtYmE2rDto3W
         QD9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUf5y7C4qyjQYq6tLnLG5XS97bmDBBqW8tHhUnaB76KPAhhFbG+ohtXu7xl6oNmawxQcMo8E0clz+o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2S47KwQ8ro499yEHjvGVLTUr/1Mv7t7+hAnyrDv7FZPSTVYnZ
	76qn04jJ3LqF99J1jbRpYipF4ix7IoNZ6xrEXYbGZXHzQzlhd2N2fBhCAHZjdFpRkGQ=
X-Gm-Gg: ASbGnctItQ0UdzJMqObilSSeI8ffQULjaiTPWUG4N6omlWtZxPfBcuVmI01mTpJ1A4H
	Nx7y7ilZ92rzRGYgmfrlO0IMXB4At/utuE6vXYNwog3v9ESVuFlheMTZBIW/jf523OSgcYPc8R8
	rPf6dUDbGUaODQLOTGOVpK/iPI00p12asoSh1VizGDxWLJRR0itdrtSrtxviuNAyhOYQcuIhkyf
	8hfTwfG4acqzUSJnyaVx4sopYvWngBwkyLxafH4dkpdy4WEQVPNhees+NvCDZdL92EOawc1nGlD
	FaiSBGi4lcMCAYuCXPGU1A5olFbPz7qvNopSwO6dE1CV9bl/MUTL13Gxqw7WEXBd6ZzGHIgkPFh
	HxgEErnASS1yz2QQwfrnkr2unv+d9815zPre5NkXo1qkGcs005sNSRWA+IpvriALZS9Cfy7ri2A
	/aSru1qo/ttJrbjuLRQ2oE3gdbhaCwHskK0xO7
X-Google-Smtp-Source: AGHT+IELAzcsYpOj9uuRdYM2/XzumHYICgClkqlPJHMr4EhFYRmtgMYYKCFf5swysg49tA6DSYOSlg==
X-Received: by 2002:a05:600c:1c1b:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-47939dfa09fmr113474715e9.12.1765298432259;
        Tue, 09 Dec 2025 08:40:32 -0800 (PST)
Received: from localhost.localdomain ([2a01:cb15:854c:e000:e58b:a5ca:200b:e2e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfee71sm32550060f8f.15.2025.12.09.08.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 08:40:31 -0800 (PST)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: gregkh@linuxfoundation.org
Cc: tiwai@suse.de,
	corbet@lwn.net,
	jilliandonahue58@gmail.com,
	selvarasu.g@samsung.com,
	jkeeping@inmusicbrands.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-api@vger.kernel.org,
	Victor Krawiec <victor.krawiec@arturia.com>
Subject: [PATCH v2] usb: gadget: f_midi: allow customizing the USB MIDI interface string through configfs
Date: Tue,  9 Dec 2025 17:40:06 +0100
Message-ID: <20251209164006.143219-1-victor.krawiec@arturia.com>
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
V1 -> V2:
	- Add documentation
	- Cleanup unnecessary *_allocated boolean as requested in review

 .../ABI/testing/configfs-usb-gadget-midi      |  17 +--
 Documentation/usb/gadget-testing.rst          |  17 +--
 drivers/usb/gadget/function/f_midi.c          | 110 ++++++++++--------
 drivers/usb/gadget/function/u_midi.h          |   2 +-
 4 files changed, 78 insertions(+), 68 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-midi b/Documentation/ABI/testing/configfs-usb-gadget-midi
index 07389cddd51a..d6bd67bb91fc 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-midi
+++ b/Documentation/ABI/testing/configfs-usb-gadget-midi
@@ -4,11 +4,12 @@ KernelVersion:	3.19
 Description:
 		The attributes:
 
-		==========	====================================
-		index		index value for the USB MIDI adapter
-		id		ID string for the USB MIDI adapter
-		buflen		MIDI buffer length
-		qlen		USB read request queue length
-		in_ports	number of MIDI input ports
-		out_ports	number of MIDI output ports
-		==========	====================================
+		================	====================================
+		index			index value for the USB MIDI adapter
+		id			ID string for the USB MIDI adapter
+		buflen			MIDI buffer length
+		qlen			USB read request queue length
+		in_ports		number of MIDI input ports
+		out_ports		number of MIDI output ports
+		interface_string	USB AudioControl interface string
+		================	====================================
diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index 5f90af1fb573..01a128d664cb 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -368,14 +368,15 @@ Function-specific configfs interface
 The function name to use when creating the function directory is "midi".
 The MIDI function provides these attributes in its function directory:
 
-	=============== ====================================
-	buflen		MIDI buffer length
-	id		ID string for the USB MIDI adapter
-	in_ports	number of MIDI input ports
-	index		index value for the USB MIDI adapter
-	out_ports	number of MIDI output ports
-	qlen		USB read request queue length
-	=============== ====================================
+	================ ====================================
+	buflen		 MIDI buffer length
+	id		 ID string for the USB MIDI adapter
+	in_ports	 number of MIDI input ports
+	index		 index value for the USB MIDI adapter
+	out_ports	 number of MIDI output ports
+	qlen		 USB read request queue length
+	interface_string USB AudioControl interface string
+	================ ====================================
 
 Testing the MIDI function
 -------------------------
diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index da82598fcef8..ad679a6ecac1 100644
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
+	if (opts->interface_string)
+		midi_string_defs[STRING_FUNC_IDX].s = opts->interface_string;
+
 	/* maybe allocate device-global string ID */
 	us = usb_gstrings_attach(c->cdev, midi_strings,
 				 ARRAY_SIZE(midi_string_defs));
@@ -1178,59 +1183,60 @@ end:									\
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
+	kfree(opts->name);						\
+	opts->name = c;							\
+	ret = len;							\
+end:									\
+	mutex_unlock(&opts->lock);					\
+	return ret;							\
+}									\
+									\
+CONFIGFS_ATTR(f_midi_opts_, name)
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
@@ -1239,6 +1245,7 @@ static struct configfs_attribute *midi_attrs[] = {
 	&f_midi_opts_attr_in_ports,
 	&f_midi_opts_attr_out_ports,
 	&f_midi_opts_attr_id,
+	&f_midi_opts_attr_interface_string,
 	NULL,
 };
 
@@ -1262,8 +1269,8 @@ static void f_midi_free_inst(struct usb_function_instance *f)
 	mutex_unlock(&opts->lock);
 
 	if (free) {
-		if (opts->id_allocated)
-			kfree(opts->id);
+		kfree(opts->id);
+		kfree(opts->interface_string);
 		kfree(opts);
 	}
 }
@@ -1279,7 +1286,8 @@ static struct usb_function_instance *f_midi_alloc_inst(void)
 	mutex_init(&opts->lock);
 	opts->func_inst.free_func_inst = f_midi_free_inst;
 	opts->index = SNDRV_DEFAULT_IDX1;
-	opts->id = SNDRV_DEFAULT_STR1;
+	opts->id = NULL;
+	opts->interface_string = NULL;
 	opts->buflen = 512;
 	opts->qlen = 32;
 	opts->in_ports = 1;
diff --git a/drivers/usb/gadget/function/u_midi.h b/drivers/usb/gadget/function/u_midi.h
index 2e400b495cb8..41cb8aa73f09 100644
--- a/drivers/usb/gadget/function/u_midi.h
+++ b/drivers/usb/gadget/function/u_midi.h
@@ -19,7 +19,7 @@ struct f_midi_opts {
 	struct usb_function_instance	func_inst;
 	int				index;
 	char				*id;
-	bool				id_allocated;
+	char				*interface_string;
 	unsigned int			in_ports;
 	unsigned int			out_ports;
 	unsigned int			buflen;

base-commit: 67a454e6b1c604555c04501c77b7fedc5d98a779
-- 
2.43.0


