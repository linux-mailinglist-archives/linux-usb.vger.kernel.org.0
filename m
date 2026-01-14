Return-Path: <linux-usb+bounces-32348-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFDDD212F6
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 21:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0221302E061
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 20:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A5534E761;
	Wed, 14 Jan 2026 20:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5FrgORa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF53272816
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 20:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768422754; cv=pass; b=so3n75Z7LGeq3kwM9ZHhf6za2NFAM6vAU7DlAAI9X/vKIIYnFoRNtE0wJwForFUXghJ3JBukoy3/coV2pdk0Cq0ktc5Hn+uG3XwaSyBtHqJAdZZ5lECiV5D1HYegHRopnuhYLrmgbrf8GWCo2ZrAjNQHTMphrSB+8zSuW/peK/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768422754; c=relaxed/simple;
	bh=tVj17GUpQMLRYSUDWQiykbEOTBs0tGD6gwkI7XVaJ+A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=T3onM/f3/Djiwg7L5HTgsGTiB/LUeMMToRKA24eH/s4dWs6oNs+sTpnl58sPCyNO6l67M7reNUE0T4htdc/47MVv6kJpZWen5SpAG+Ub6RbEIvn/u+M9nbZt5Rby0gkpEIHcfwPHSNltTrlLSEoJyIXfU2NPBBlhR8yqNfTky9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5FrgORa; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-501488a12cbso1898071cf.3
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 12:32:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768422752; cv=none;
        d=google.com; s=arc-20240605;
        b=ZQkW9plJjg5hd58otT5RjdosS83bFtmwmpZCBW6U6RcFNtbGjowoG3+W0TmHQxZo1N
         tf135Sc8M4HA4pSfFeRL6MbjyUHIIK+u+oP6n0aAw6gDDqR9b04zyMYY8v5J8bAH68qz
         3ldz4itSbe7gDTyKadoRo2tr6vzBPsmgR6N6CGgK4aG8WAf/rSKlp+WWgwLIQws0AA7D
         daCFPzn2C0B68Aw9Vycs72JffMt7E28tWYEuodk2nEtyBf1m6egHoSIbAtsHxAdvet6x
         2dqCpGclp+kjLJE9U8MvS6mKetj2xEOK3dJfUHEJhswfVCtn1kr7uK7vyInbLsj3DyiX
         BPlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=PtB1+GiCWWXBQg9l5i9zTk1CK4VEZJWi0P2LjbHs6IQ=;
        fh=6Dk1aLJzvVCO9/oFYYjaEw8+1a3bHEDT34fJk2Ustv8=;
        b=FAMTfEyQZryo5ZDNBmM0S/jwCl0bOPuUWMuZyszkdCBeEGU50VShjNDxbTK5Cye0rT
         Sj6pFYVBKnGYufZeMYNkmurrr367QEmQAKuUDdKaxT0WcyvCcpPcl6qCg7OFhXaTcCvA
         BAbIJLtoajXdlOZeMD5PKZJRN++Je/tyO06Y1PscLx3fMX1yLofbHQsnw5sk2DGv9SNK
         5t4JLFEm8A2tfVjxFvrEpMur5BP51Vt0yyw2yGKKa3Q6snbkusvN533w2CNDApr3WRqf
         cyiAWXTDrGmQlqbmZVQA48hMU2wvzXX8cR8UbNl2ZlcD9srtrLUB711N29zW5s473dtp
         chHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768422752; x=1769027552; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PtB1+GiCWWXBQg9l5i9zTk1CK4VEZJWi0P2LjbHs6IQ=;
        b=e5FrgORapJB1MpyuNMqGAKnPd+mwSA00qEDvpiviBKAXQebYc/PlLdef4IsWQpmm5Y
         SXxK3wYnLoTjXjnPdUEV/TgmJFmzjnT13afFKb7/ri5inSyrGH1e+Fjovlm/byIB7tpP
         7EeE6nRPoTdqElOwRqhRcJ6We1Tj8YQJiq0wRbSyAy6sy+z+Fu/oxcg/u2ve0qaGZ4Ns
         hwy49zeKD9PEnndalrnYxvnH1ON2T1xvLnQO8uIA7WADgg0om0p6oFOPwkT8pzobdXDu
         t3gyf0ymLSJmpBzr65z9KW2s0b60vMKVPBX2UqmJf/UJsLGXz1PqmKRq2XXaz+uxVhGd
         AwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768422752; x=1769027552;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PtB1+GiCWWXBQg9l5i9zTk1CK4VEZJWi0P2LjbHs6IQ=;
        b=a4kV2uzllv015IntzNU17CWZasJJSZr6We1EYeZ1PsvkFYTcMWSQ97f5XyurUtVfFq
         eofIjttr4LPMl42E0bVqKzcoqkoIZtjFOke5Ie7Mng5b/LfqG9GEKFwUo3zL2GLxYypk
         hUmS4FKEoCVKWgoMDJBjExFhrehHVuHiL3WOyosilmZrqBOjUKPdZjYkCd17forEU7GC
         +BS79bJW/CgOiU8YVnJ5wLP/ygP0X4/d+tsA1eNgV/gzN3AS7yr8JBcIZSX7vmHUn1Rb
         jCaS8HjQwRgG+FRA3fDwJUCw51osKiyRVcg9papERYKtIjaireSa+Br+qecluaRcgVXr
         SRYg==
X-Gm-Message-State: AOJu0Yym6uUTeFls+Du7gw7sgQhCTUb6NENJ0knFNxb+3bU3k6iL2QCk
	QePnfzyzKpEYP+QyS1gwNS/5JaJlyHXiN88Ga/KJgN/p8blAkdPIWVFzzVFV3M91KePlZBZK278
	TAr5Uu3O9iBDGNdTuTnRIv2zfibU5/A==
X-Gm-Gg: AY/fxX5I4cpyetSV8qYWcUJQKdHM6K/Kzr4ln9vFOAX+/u7a0GX2FZ8slszO/VBMB1f
	DoEIA9hBuU/lZYmPm+TxTDYMi/zikQXVkUwsHMacwEZnxSu7jFpDnrjvwK9Gc+o2913BYn6Km9e
	vRnd0swhjLRBEzGViPKXwtC+IgMrV5cYovtv7MNm0OzVLQ3N2ZdFwZtg0fE7/Z4NQCx54Hs8l8H
	hek76Sr6911uv1l3FsYMkDrGSrdFILmlywRDZq/Q+Fcxxh50Q0vvdyIf52XsOFDSlhITg==
X-Received: by 2002:ac8:7e8b:0:b0:501:5233:2a6f with SMTP id
 d75a77b69052e-50234f774f1mr3383941cf.14.1768422751762; Wed, 14 Jan 2026
 12:32:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?6b2Q5p+v5a6H?= <qikeyu2017@gmail.com>
Date: Thu, 15 Jan 2026 04:32:21 +0800
X-Gm-Features: AZwV_QhvetgktZFjMdOgMWnRgnHfU_QNiUm28bh3uJfXYmrsYJEDfO45ZOPgFhg
Message-ID: <CALEuBamV3oXcTm1bE=m6O6XcXR=rrFaMgjaLyZqSOG2ghDDqqw@mail.gmail.com>
Subject: [PATCH] usb: cdns2: fix use-after-free in cdns2_gadget_giveback
To: pawell@cadence.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This fix addresses a use-after-free vulnerability discovered through
static code analysis of the cdns2_gadget_giveback() function.

The vulnerability exists because after usb_gadget_giveback_request()
is called, the code continues to access request->buf. However,
usb_gadget_giveback_request() invokes the request's complete callback,
and certain gadget function drivers (such as FunctionFS with DMABUF)
may directly free the request within this callback.

Call flow leading to use-after-free:

  cdns2_gadget_giveback()
    -> usb_gadget_giveback_request()
       -> request->complete()  [e.g., ffs_epfile_dmabuf_io_complete]
          -> usb_ep_free_request()  // request is freed here
    -> if (request->buf == pdev->zlp_buf)  // UAF: accessing freed memory
       -> cdns2_gadget_ep_free_request()   // potential double-free

Data flow analysis shows that this vulnerability can be triggered when:
1. A user application uses FunctionFS with DMABUF transfer capability
2. The user attaches a DMABUF via FUNCTIONFS_DMABUF_ATTACH ioctl
3. The user initiates a transfer via FUNCTIONFS_DMABUF_TRANSFER ioctl
4. Upon transfer completion, ffs_epfile_dmabuf_io_complete() is called
   as the complete callback, which frees the request
5. cdns2_gadget_giveback() then accesses the freed request->buf field

Evidence that complete callback can free the request (f_fs.c):

  static void ffs_epfile_dmabuf_io_complete(struct usb_ep *ep,
                                            struct usb_request *req)
  {
      ffs_dmabuf_signal_done(req->context, req->status);
      usb_ep_free_request(ep, req);  // frees the request directly
  }

The fix saves the ZLP check result before calling the complete callback
and uses mutually exclusive logic: requests with complete callbacks are
owned by the gadget function driver, while only ZLP requests without
complete callbacks are freed by the UDC driver.

Fixes: 3eb1f1efe204 ("usb: cdns2: Add main part of Cadence USBHS driver")
Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
---
 drivers/usb/gadget/udc/cdns2/cdns2-gadget.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
index 9b53daf76583..8997623cca5a 100644
--- a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
+++ b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
@@ -240,6 +240,7 @@ void cdns2_gadget_giveback(struct cdns2_endpoint *pep,
 {
   struct usb_request *request = &preq->request;
   struct cdns2_device *pdev = pep->pdev;
+  bool is_zlp = (request->buf == pdev->zlp_buf);

   list_del_init(&preq->list);

@@ -257,10 +258,14 @@ void cdns2_gadget_giveback(struct cdns2_endpoint *pep,
      spin_unlock(&pdev->lock);
      usb_gadget_giveback_request(&pep->endpoint, request);
      spin_lock(&pdev->lock);
-  }
-
-  if (request->buf == pdev->zlp_buf)
+  } else if (is_zlp) {
+     /*
+      * Only ZLP requests without a complete callback are freed
+      * by the driver. Requests with complete callbacks are
+      * owned by the gadget function driver.
+      */
      cdns2_gadget_ep_free_request(&pep->endpoint, request);
+  }
 }

 static void cdns2_wa1_restore_cycle_bit(struct cdns2_endpoint *pep)
-- 
2.34.1

