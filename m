Return-Path: <linux-usb+bounces-30741-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA64C70D6D
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 20:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id E7E3B28B5A
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 19:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4DC371DEC;
	Wed, 19 Nov 2025 19:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YIiyXZGl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD125366DAD
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 19:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763581041; cv=none; b=megU2UGFRvqD6mOOiXtcyA/Sl8zx3BOOEgvF5ZeJXdt2WifIFG4fkIHY3agRd6zjKaZie6+/f13CYSSTkf3r0qUy8IH79MzWFeH3lA+WFg3D/1L1QP/+MkeTTCffRD7V0niJTeha0ML15cmN+MiFT34cb73vUHcaKSgZ37tI/2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763581041; c=relaxed/simple;
	bh=yTYFXdI2ZyPR+UMxYGq17qZXJ4j99OhzHGQZUgONSkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uAcHtDhAwrF19Vr1DQtabWvZvRCubGGyP03r/SSijL/TdiJPsTdzA7hGgVFSxX0cgBpe6oF9g4B8Fa/YO79TheE4nE13zyzdCXlDk7wxi/cdOdBnjKMOq86xNfniv/sAVKP9rygPnsC3DdHcnYfKri2rJq8AIyF3C6qvNLiYTqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YIiyXZGl; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-595910c9178so22329e87.1
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 11:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763581035; x=1764185835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuZc8jIJ73fliBU4Q8ei1XsWAfFxT58BcOIlqwL+4cM=;
        b=YIiyXZGlDfSO6Yko+dDvg77jCvf8SsHWYwGOaRfw0ik3CrugAeEJpMoeickmOKDbcp
         OspWDFd0XkNlGot9+NO4lvW4kocgYlfmkOUbLqxlEjJhKZkQadJY561pJwdZYl/glYfp
         LiCkKyGCOZ+k9CtP3t+FMvfmBid/W9Uj8FjyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763581035; x=1764185835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZuZc8jIJ73fliBU4Q8ei1XsWAfFxT58BcOIlqwL+4cM=;
        b=okqqCSYpQkOlyGVtuDKOIwt9Z9zrRjnxKJxuJ/fuT+BoX5gVGvGlLObwOm4DJ4ovTa
         2M5OGs41Zvk905+bCl7wY+eXpNzUeB5RTF6pll2ShvTZIB/Of1d5O/xdjACuoeRQKkbX
         bdpp9p0BWJ6/o6Zqi9feugDLwzbEHp4AY4ssIT6JqPZuTAyF/dts9MZuNJl3GySpPgzb
         +qI4bPLIiMoCjxi9s/W+L4KZ0aRbaVvsl2+8tjbW8Ng7Uom8/bemYRTmSQtMxwZOwIyJ
         nf/LvgHztJ4CDuK/ly9MUaAnF8b1A953OByXlSzc0NRt4wg+CNwbZszNaVg/iQaNtUAJ
         pO4w==
X-Forwarded-Encrypted: i=1; AJvYcCUuFKSouOf4RNkIsqJG7nIbSf7rFaZzC4mWNUOpg7BY8R3r4UqCmtSMT32mBySRb7YFkmLnmZNh0x8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYOZFUek1ogRvddC+CGs+InX2H+tYFLi3vAaRcijxnK+g4SG8O
	tpH9HCidrkbX3OlxQgIUJjk8oGrGghOlFtASpXGuFvmwcbSsJKQko6Y/5AS8VqEkcQ==
X-Gm-Gg: ASbGnctYnDEkCnOaggtHFJI9GpQN3fnsZQkna8pRRtJmELpFNGO9hHVCRouCj6yOADD
	Xbf6usNsitFPJsbfLN2aAZcS5b1R2XdOMPDLhLXWWJRGfn6bzQA6yLbcpkBDO6UpO5A+dZz5NyO
	ehf6WWf6tCFGlh/BGV/sHyvNejRf0IEBlAAcIh2+LiOgXCTeTKrtM4cTX0tPTONz/j/j8pSFPQ1
	lnPRa6hodKM8TcP1/ZfYHAXxkKaq6M22KydmGqISiBJaH9NrYmCBsgp8JC/jWNC5Tl7W5z/G5T6
	jxLLddZOClirSPhWlNx0tJosQ3u9g2wFOR7GCa8VaKZmF6YOgmC1x9tE7g75HYHuIEOqZ6Ai3Mn
	gJ31thPI5KLAbMyZJ09gCP12FOP7oQfStko9EmiJtFdGX83J8cCgdZadQjcUr1k+RGoYEFpaIrg
	1yn8FgzFc0Ao3s6DpekbLzWjd8sLbGBjzzQXf0nlPlCNYETD6yviJ2qvm3F/zOuAEFUg1+iM3O
X-Google-Smtp-Source: AGHT+IFoB7chSLIwfjSFTphqjgmua7Tjt0U+ohKJOcu/D64VE8zTccK69k87nmH3ArQfjCz5alhfSQ==
X-Received: by 2002:a05:6512:3b9c:b0:592:f9dd:8f28 with SMTP id 2adb3069b0e04-5969e305a42mr18282e87.35.1763581035322;
        Wed, 19 Nov 2025 11:37:15 -0800 (PST)
Received: from ribalda.c.googlers.com (80.38.88.34.bc.googleusercontent.com. [34.88.38.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbd15a1sm65790e87.98.2025.11.19.11.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:37:14 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 19 Nov 2025 19:37:13 +0000
Subject: [PATCH v2 4/6] media: uvcvideo: Document how to format GUIDs
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-uvcdynctrl-v2-4-0359ffb98c9e@chromium.org>
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
In-Reply-To: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Manual formatting the GUIDs can lead to errors, document a
programmatically way to format the GUIDs from lsusb into something tha
the driver can use.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/linux/usb/uvc.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index b939a01da11466747249c64c72a3ea40cd364a59..dea23aabbad48270c807463c1a7e1c0d1b79fc1f 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -10,6 +10,14 @@
 
 /* ------------------------------------------------------------------------
  * GUIDs
+ *
+ * The GUID returned by lsusb can be converted to this format with the
+ * following python snippet:
+ *
+ * import uuid
+ * id = "{01234567-89ab-cdef-0123-456789abcdef}"
+ * le = uuid.UUID(id).bytes_le
+ * print("{" + ", ".join([f"0x{b:02x}" for b in le]) + "}")
  */
 #define UVC_GUID_UVC_CAMERA \
 	{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \

-- 
2.52.0.rc1.455.g30608eb744-goog


