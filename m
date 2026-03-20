Return-Path: <linux-usb+bounces-35238-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGEGCWAMvWkO5gIAu9opvQ
	(envelope-from <linux-usb+bounces-35238-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 09:59:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B11AA2D79EF
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 09:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8B29302BEB1
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 08:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F33377038;
	Fri, 20 Mar 2026 08:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fMCDp536"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5F23783AB
	for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 08:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773996925; cv=none; b=UG4r5Y+T20vEDmfuE5jwMJhGfqjmyFSoxXIWMmPTMPUR0B3ZREFq+FwKbCm/+ItaUvJJWDUqPnij2LIh69LGlUClbKslQSO5aPy+IUtcN4ZVisYX9LmG+DBYO9H0FLUrw6juad14XQEBi5GLw3l4A1FHHpL9IuoCRLeqRQccTBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773996925; c=relaxed/simple;
	bh=r5JeqbpaQSgzfD5nVZ2+4ZgQVe4wxzOwvDAuDGO/s2g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Fai9+F+2g2hpivbGp//wdFsl7aBxEmp2+o5A/DJeQ850yPQ2eDTvXQx1WV36xznlXsuzgemS7o+9eGMMJOBOMrv9biV75+xN/A9twva1srJs7JEl1C2R2iksSmpSusnTl9VovmCr4XCi254rh+M+T5mSUiSWwYzbheYH4P1WTiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fMCDp536; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3568090851aso4978722a91.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 01:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773996923; x=1774601723; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1dWn+d5N9BmZH7+uNOdi4sUe7sM9CUAvkoQg+RhZqyg=;
        b=fMCDp536uKLz+Qau+iE4aKGJzuJDU+WabL3QVGmjUvZHcTP2bHIZbKSsWK8/QTGi/+
         MVvmz3D/ZPYOMMaB+wkBDDCS22U9HkXiV350DAC7+UwevyYz5fUe3+Ats0esD6AxFnrU
         Xfs4EafJ02JZZfydBCMGR9VbqQoDtMgYYosPSuLdUbv4Ck7bvJmc3VA2V1gIivutY3WN
         X8R9hA0fBycopE/mtdlos3gW1t0g3T3b62M7G+wYqaquXwYIDgTI1LdKNPaJNwLxknir
         pPUb432GjYnqDVYDEwyevXlLTVVKMxp0Cv4S6crNI+KkOr1HThXtdwXXk4qKyvmnqc1o
         Uo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996923; x=1774601723;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1dWn+d5N9BmZH7+uNOdi4sUe7sM9CUAvkoQg+RhZqyg=;
        b=RqML1Y1bDckUQhcHkgF0iJLsFZ87rNpXDEBd+Tku+V6sM/vTL2eI4yhDgxKHwZ4HT3
         3mAd6J+2SdO/i2xEa54+x5kk0TCxJbJDOczR5UZBEJILSmjlf1pfURk8cNafwAWGNCDK
         oOZPxVXJzU9Z3UHtffbistN1CWlLDLF69oDTDRV3gudGoE8epCYlYRhdb/YIQDa3+Nqg
         GdiIBMb9XKw//Vq+mUzrkAwQP8UjQd12/VS9+J/B22pKFSvtPqjYhZiIvSim7KTYvKl/
         SC2y+ig6nMUSYMMtISi5av6sGMzChvFidl2NZQBHW1cfyN3JJ3OODfI7oYWxCw+Hg4LB
         3Khw==
X-Gm-Message-State: AOJu0Ywu3rgYEgu8ROd+DYBO4s5mlgr7LH2zhnUSYNGf1DwfEYslxqsB
	pJAkuBDHpQIwjm8lyWLKK082wPmazyZzLrKWggsQo09K6uSpbS0gmp1t1UxHMmpqLee4Rou0RQG
	oeH294A==
X-Received: from pjbei15.prod.google.com ([2002:a17:90a:e54f:b0:359:bc4:636])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:554e:b0:35b:9ab6:1d65
 with SMTP id 98e67ed59e1d1-35bd2d52dc5mr1663642a91.25.1773996923152; Fri, 20
 Mar 2026 01:55:23 -0700 (PDT)
Date: Fri, 20 Mar 2026 16:54:46 +0800
In-Reply-To: <20260320-usb-net-lifecycle-v1-0-4886b578161b@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260320-usb-net-lifecycle-v1-0-4886b578161b@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773996915; l=1808;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=r5JeqbpaQSgzfD5nVZ2+4ZgQVe4wxzOwvDAuDGO/s2g=; b=zvaz6HcwncN9XVtstgwC9aPtuRPoIf8obg4Gc/e+qJ+iyNk+ZMbETqriLLPo7gpzCHMvHvtdP
 nvSn224/OS2D+4wn+wViROkQiOArwYnBk4OQhn9dJmG8/0i0B350BWG
X-Mailer: b4 0.14.3
Message-ID: <20260320-usb-net-lifecycle-v1-3-4886b578161b@google.com>
Subject: [PATCH 3/7] usb: gadget: u_ncm: Add kernel-doc comments for struct f_ncm_opts
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Felipe Balbi <balbi@kernel.org>, David Lechner <david@lechnology.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35238-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khtsai@google.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B11AA2D79EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Provide kernel-doc descriptions for the fields in struct f_ncm_opts to
improve code readability and maintainability.

Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/gadget/function/u_ncm.h | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/u_ncm.h b/drivers/usb/gadget/function/u_ncm.h
index b1f3db8b68c1..ce2f6358688a 100644
--- a/drivers/usb/gadget/function/u_ncm.h
+++ b/drivers/usb/gadget/function/u_ncm.h
@@ -15,6 +15,20 @@
 
 #include <linux/usb/composite.h>
 
+/**
+ * struct f_ncm_opts - NCM function options
+ * @func_inst: USB function instance.
+ * @net: The net_device associated with the NCM function.
+ * @bind_count: Tracks the number of configurations the NCM function is
+ *              bound to, preventing double-registration of the @net device.
+ * @ncm_interf_group: ConfigFS group for NCM interface.
+ * @ncm_os_desc: USB OS descriptor for NCM.
+ * @ncm_ext_compat_id: Extended compatibility ID.
+ * @lock: Protects the data from concurrent access by configfs read/write
+ *        and create symlink/remove symlink operations.
+ * @refcnt: Reference counter for the function instance.
+ * @max_segment_size: Maximum segment size.
+ */
 struct f_ncm_opts {
 	struct usb_function_instance	func_inst;
 	struct net_device		*net;
@@ -23,12 +37,7 @@ struct f_ncm_opts {
 	struct config_group		*ncm_interf_group;
 	struct usb_os_desc		ncm_os_desc;
 	char				ncm_ext_compat_id[16];
-	/*
-	 * Read/write access to configfs attributes is handled by configfs.
-	 *
-	 * This is to protect the data from concurrent access by read/write
-	 * and create symlink/remove symlink.
-	 */
+
 	struct mutex			lock;
 	int				refcnt;
 

-- 
2.53.0.959.g497ff81fa9-goog


