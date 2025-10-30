Return-Path: <linux-usb+bounces-29906-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E24A5C20DC8
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 16:16:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 049EC4ED54F
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 15:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EC232E6A9;
	Thu, 30 Oct 2025 15:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tWhBEaKS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB4F32D7E6
	for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 15:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761837286; cv=none; b=Z2r0YFO83svTTPUL3z+gAo86EW/Honnfk+q6mJzIQDtv/zJGk22jiP9KjPdRDH2l/+oEPy+OplpM8lWeSWAiMb+QwYZbOA2wsmkcEhPjfFKVJmtN+cP6kE9GG/AmBhLrEddyGKCDGCaldAXiMBzux4ytFhbzEHlj4uel4l6wxrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761837286; c=relaxed/simple;
	bh=WueqPrt9PcU5UOs3/n/eywvcdgK3zO0SwyWhjHm1VB8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ShJX0zDzclL9Of3kJD1lXKl6dNd6xHVw9gYWU64IKkVRw/w5R5KbZjovqrozWvmbpJsuWDDkYSrcR5p4hyYBZL2qH3gVTI29nFTcjAjtr9/alRIiM2m4OaeC05gkvUfQuvynkSidHGSLYTljIfFXKNjHJN0JqC4yDuVirRSvyl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tWhBEaKS; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-290c9724deeso11336425ad.2
        for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 08:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761837283; x=1762442083; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lRXCLymhr/IzWTqsnVoHqbEbb803ekNgoGS0KjH34wQ=;
        b=tWhBEaKS73ObveaESw+PdHDH6y4fPqDXrb2+YBN1VG+yKtE4LtprxObnwLL0C55JT+
         dSgBT5pVEbR8zF475n8zZHQvitrgO7Cu9/WhZ/pZDOfsXo5U7JmSdzdZJ49AYhi3fZ1O
         VsFWqVTnFo+Ivi1iN9uu/LPbCq6LHg0ZlDdBuFzQ2SskyfgAjDfeC6MB2zFxmVlZRgI9
         VaqoapxkJgee5DR96PC5P5Y2q1vXtu0hpFQfeTWXSnOOo/U/pTAXRm4yfRNqD/B1BmQ6
         7fPtbPZ0LKy5mJ+9JVIv0K8YnnxeEsaZ81hBqVPnf1s3ZouSluzGGmSg8nzCOQrwyYFG
         bu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761837283; x=1762442083;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lRXCLymhr/IzWTqsnVoHqbEbb803ekNgoGS0KjH34wQ=;
        b=EbLGw9KsMLVkDkwpyINFVFzln1eDuYPDtDxk2k2tY3KxqHWU37YCe8q8J/2AJ/j6sX
         XVP1VDkn+7yuS1l/i9HT/3JZt/yS213xcTbXolXhX4LJVfU5Q7GjfgfHqpVqao6CoF/k
         PIudUPNTaACM1Iqgoa/fr+Co+yOYt97J6/2MNuoagXO/kkH1/ekvwThnHhXb8OLyAv/Y
         fvirh8tooOBSvJER1QxWjSNZDDbk7hysuPnxmc0Tt6Lzv9vmI1pgw5IRu5bU8jqejFBb
         zU5NbTL/3G+wxjzW+9cIusycNbsKjNrd1BmhaLa521F2M8sAx89LtKErdx16uYGt8wUF
         h0fw==
X-Gm-Message-State: AOJu0YwOvlyv2W9LwVTcrojbokT4s0psHUXkBKjiD9dxbFaoeHUbOwG8
	TkN+5FvyGDxXjgL+++s2sp7x0uJYXRhI5eEit7UoEpSIzLKvtmxLJ3+navC0ImFCEmrDQhlHCYd
	b5BG9bw==
X-Google-Smtp-Source: AGHT+IEBtKmRUWaO2GNwcap42mmQ1ywV3rSvOmFQAJJPExluSwBKsC0Atoqd3JmNEkv44E2DXEhyBeksJfQ=
X-Received: from plkg14.prod.google.com ([2002:a17:903:19ce:b0:290:d4c5:90ad])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1103:b0:290:dd1f:3d60
 with SMTP id d9443c01a7336-2951a49de0amr928475ad.51.1761837283473; Thu, 30
 Oct 2025 08:14:43 -0700 (PDT)
Date: Thu, 30 Oct 2025 23:14:20 +0800
In-Reply-To: <20251030-auto-cleanup-v1-0-db30584fadfd@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251030-auto-cleanup-v1-0-db30584fadfd@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761837277; l=2782;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=WueqPrt9PcU5UOs3/n/eywvcdgK3zO0SwyWhjHm1VB8=; b=6ueaX8sq1lNgoMah3k+GxkT1TUasXnrHj6yuhEYnrosVPWFY9rHWt2WEtsp7xWojuHqzjsk+x
 cyKY86DIf2gA6j0Brz1NNbRKN1eTGaIaENcnoDgBq2Z8wvxGb8/I15C
X-Mailer: b4 0.14.2
Message-ID: <20251030-auto-cleanup-v1-2-db30584fadfd@google.com>
Subject: [PATCH 2/2] usb: gadget: f_loopback: Use auto-cleanup for usb_request
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="utf-8"

Refactor f_loopback.c to use auto-cleanup mechanism for usb_request
allocations in alloc_requests().

The shared buffer between in_req and out_req is handled by nullifying
in_req->buf before returning on usb_ep_queue failure, ensuring the
buffer is only freed once by the out_req cleanup.

Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/gadget/function/f_loopback.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/gadget/function/f_loopback.c b/drivers/usb/gadget/function/f_loopback.c
index 49b009a7d5d79285c2397c7aebb8c8fcd3b7dafb..cdf42d8b3d774e5324e83dc308aa5caa265eac3b 100644
--- a/drivers/usb/gadget/function/f_loopback.c
+++ b/drivers/usb/gadget/function/f_loopback.c
@@ -8,6 +8,7 @@
 
 /* #define VERBOSE_DEBUG */
 
+#include <linux/cleanup.h>
 #include <linux/slab.h>
 #include <linux/kernel.h>
 #include <linux/device.h>
@@ -308,9 +309,8 @@ static inline struct usb_request *lb_alloc_ep_req(struct usb_ep *ep, int len)
 static int alloc_requests(struct usb_composite_dev *cdev,
 			  struct f_loopback *loop)
 {
-	struct usb_request *in_req, *out_req;
 	int i;
-	int result = 0;
+	int result;
 
 	/*
 	 * allocate a bunch of read buffers and queue them all at once.
@@ -318,16 +318,16 @@ static int alloc_requests(struct usb_composite_dev *cdev,
 	 * for out transfer and reuse them in IN transfers to implement
 	 * our loopback functionality
 	 */
-	for (i = 0; i < loop->qlen && result == 0; i++) {
-		result = -ENOMEM;
-
-		in_req = usb_ep_alloc_request(loop->in_ep, GFP_ATOMIC);
+	for (i = 0; i < loop->qlen; i++) {
+		struct usb_request *in_req __free(free_usb_request) =
+			usb_ep_alloc_request(loop->in_ep, GFP_ATOMIC);
 		if (!in_req)
-			goto fail;
+			return -ENOMEM;
 
-		out_req = lb_alloc_ep_req(loop->out_ep, loop->buflen);
+		struct usb_request *out_req __free(free_usb_request) =
+			lb_alloc_ep_req(loop->out_ep, loop->buflen);
 		if (!out_req)
-			goto fail_in;
+			return -ENOMEM;
 
 		in_req->complete = loopback_complete;
 		out_req->complete = loopback_complete;
@@ -339,20 +339,16 @@ static int alloc_requests(struct usb_composite_dev *cdev,
 
 		result = usb_ep_queue(loop->out_ep, out_req, GFP_ATOMIC);
 		if (result) {
+			in_req->buf = NULL;
 			ERROR(cdev, "%s queue req --> %d\n",
 					loop->out_ep->name, result);
-			goto fail_out;
+			return result;
 		}
+		retain_and_null_ptr(in_req);
+		retain_and_null_ptr(out_req);
 	}
 
 	return 0;
-
-fail_out:
-	free_ep_req(loop->out_ep, out_req);
-fail_in:
-	usb_ep_free_request(loop->in_ep, in_req);
-fail:
-	return result;
 }
 
 static int enable_endpoint(struct usb_composite_dev *cdev,

-- 
2.51.1.851.g4ebd6896fd-goog


