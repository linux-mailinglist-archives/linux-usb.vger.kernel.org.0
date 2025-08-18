Return-Path: <linux-usb+bounces-26987-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5D2B2AC14
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 17:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3B4E18A37B0
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 14:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8291623F422;
	Mon, 18 Aug 2025 14:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="UFw/tN1C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A90E23C50F
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 14:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755529154; cv=none; b=ndViSByj5tYUtNuEn5qIRASXIbsZLLLpGu5H2AWgz0Kj7L+JmWT8xMRuvKPPZCUQmu6CeksgHtQvevsTclIgIyQAKTlIF0ACDMPw4Ip7enbVB4fscY1liy1XueVZ2Q6IgtpJGojDqQBWQ8LfmGddq4gWSUVq7N9s5oNSc3rVL38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755529154; c=relaxed/simple;
	bh=JT9J9MuI5daNqLUfEAKiqcNxk3IUK9nL5GyYkUwosQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OMkLLCXdF9f8tMGijzRCxM80fEmNFhQhXXPVJkXnnpYOPua+ApZQrQqohAmmO97TCl9XAYhwf2GFmlNsfj5Tzgsb8OBAbStA+8rzGutRM3AlESfje5jXf/2p2SYb+T/yD6ZZVf9PWFSV7aPtPuHnrQAgQfzDiEvDmS2wIpB/bRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=UFw/tN1C; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4b134a96ea9so13059831cf.1
        for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 07:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755529151; x=1756133951; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OASh2PMnoVxjDhswJjd5kHpLpQV6y4gJO+BmVfob4KI=;
        b=UFw/tN1Cy8+Yrh20dl+Cs/7gfZrDCmoTz7+mi/wI65uKzXeYDhgMGCNYk6juCihSKz
         giCFNhx42/YUK7YNC1ZUPvi0Zq72SDmvMVTLp1d2XhRamc6dV1qse3RF9q9sOUTxEQqX
         xH9N5cgmon1kAESqqesE8puA3KI6+Hyva/pKhUK45KdPy7z0XX1k2intHopLbtYTLlBR
         BJ/wO7PgKujuyzguSnZm7O60fl+On+JNK4n5YShQ1082X56bomlJnkLMJvgV1PYcTWjH
         wsobpZuEiBF6HAnvHotF4m9VM6QK3vNMYM1l3gUbzT5gYpBZ72+RJ3wG0MJW7DPlxelt
         linQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755529151; x=1756133951;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OASh2PMnoVxjDhswJjd5kHpLpQV6y4gJO+BmVfob4KI=;
        b=GybGJQdCJTaMF3AmAKBFVJUGMVU6GxYDWUfbOR21amhyYKnHGSEoGYi5MrL1tim3f1
         mSJ+9fklh3zVjxhiVeoCrsj+w9MHeTYr1fkO3u+GF7XinGXHe/9GY9XzQH/73KpzV/9Y
         CWZ8Y4Zi9fuCL4Vz90F+RuFKeREa4YUG3T2Y184kp3oCKV1KJVNql6KcIeyRDR+MZ/gM
         z+SeQz3Ir8ocYwjn7TFlg+bzpDSnaK5pMNaueQ4wFSSKrdwnRunL2u6ndqGAUVbYt405
         Jrr4RGx3PE2EZmyQ9PA81mts+tBprlOM4KIaWen+tqpeOlKHpeX+ewfmQKmW8lOsZj5s
         6XSQ==
X-Gm-Message-State: AOJu0YyC7ckyRR2cDBbLzJ0t2YlTrGzzLW5D4xO04G6BXwzmxU2YUD7G
	YxubqVAIG/Xt/pfIz6KLwexnE7dYpDCkwAptoVqDkiC6N31rji+wuSwFKu3gA0ZliQuuzEkOmcJ
	SAQw=
X-Gm-Gg: ASbGncvCTnhI3Bkys7GFXbEp0v5We24SA8RJOyNix4jwXnpAFtbIjsLxhodGoXBBnSJ
	imiBz0jVzDga9CYIKZD38eZjbF+vtVMuLsrLyum5mhqhOfilCzMCox6r8vA52nZXIbQu7MF+BKn
	glnbkfB+lRXKpJqU9ftm6jzJN4nZUZb2jMPWuKOyysu8ArPeKloVZ9Ws0COPWjA+yDvBkGKiq3y
	Wb6X5Ub5mSUIdwt1FjqDAZl7Gge+VBXdYE1y7kRS0gLj5R1T7Cm3u+Ur2HrFV1vj5WgfWvxvbyP
	RhTlsNu4/2f64NBhNr1CLTyIVCE1UGQN7HjFhb8t/kNBojR3dSx2JtNBTbUQtbprNEVTmV4q21B
	+kzMY1qeS3R6CWFk+2Y4N0s64B/iNerqAexfE6vAjGfYPDVq+B+giLZw=
X-Google-Smtp-Source: AGHT+IFczJfN8OvrVtXSTk6Dzt67bCrlzq4jkqSMjMQM0G1Ijkoo5sAYAgIJubHFNT8ePVjX9UnA3g==
X-Received: by 2002:ac8:7d96:0:b0:4b0:8b50:35c with SMTP id d75a77b69052e-4b11e21b1c7mr136924101cf.30.1755529150839;
        Mon, 18 Aug 2025 07:59:10 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:349c:f507:d5eb:5d9e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11dddad32sm53314671cf.30.2025.08.18.07.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 07:59:10 -0700 (PDT)
Date: Mon, 18 Aug 2025 10:59:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Update kerneldoc for usb_hcd_giveback_urb()
Message-ID: <41eaae05-116a-4568-940c-eeb94ab6baa0@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The kerneldoc added for usb_hcd_giveback_urb() by commit 41631d3616c3
("usb: core: Replace in_interrupt() in comments") is unclear and
incorrect.  Update the text for greater clarity and to say that URBs
for a root hub will always use a BH context for their completion.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

 drivers/usb/core/hcd.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

Index: usb-devel/drivers/usb/core/hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hcd.c
+++ usb-devel/drivers/usb/core/hcd.c
@@ -1706,10 +1706,10 @@ static void usb_giveback_urb_bh(struct w
  * @urb: urb being returned to the USB device driver.
  * @status: completion status code for the URB.
  *
- * Context: atomic. The completion callback is invoked in caller's context.
- * For HCDs with HCD_BH flag set, the completion callback is invoked in BH
- * context (except for URBs submitted to the root hub which always complete in
- * caller's context).
+ * Context: atomic. The completion callback is invoked either in a work queue
+ * (BH) context or in the caller's context, depending on whether the HCD_BH
+ * flag is set in the @hcd structure, except that URBs submitted to the
+ * root hub always complete in BH context.
  *
  * This hands the URB from HCD to its USB device driver, using its
  * completion function.  The HCD has freed all per-urb resources

