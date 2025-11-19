Return-Path: <linux-usb+bounces-30694-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A39D7C6ED53
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A4C19365C67
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 13:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3503659E8;
	Wed, 19 Nov 2025 13:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsmAVFv9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46F7364E96
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 13:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557745; cv=none; b=PkWvLJYzF28OMnFpqeF0hQrYYQhcxd72ll6dypWSx17/4spKZyRKy9MeM1WHOVxJqzSV1KOjUDegcnG/+d61UHCEZ8dxsjE9eGjFW6hIgb6Ry8KkZMdsOwuHUPulhH5EYQeHApdt4UBTESgYiVe1YRkDGrfzGcMYOyAurnYw9P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557745; c=relaxed/simple;
	bh=Ov1DO0gEROAmZbORgQvXasiNjE3BiOD+UMuymUYTkjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CHNdDfRRK+j06FIY3lT8POEqjjAJ6JH6YrRJRA+aZrYx+BQvJeBjqpuon8EigPhudCKmgHsmRb88ZRUuBHqpZ0BqHu8RkWT71vrbjpbyOmMsiC40HidPlcXSoQXKY06ZbvKP3ztWCN+yuMY6Z+VudUCBSMV9O6IMQRgCqEOoR7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsmAVFv9; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso785488b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 05:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763557743; x=1764162543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PhfpThnBPbWYm99SayqqOmvAer1zIz//ZVr6sgUx8g=;
        b=SsmAVFv9zoxWpPLwDyPrzS/gM0PWX84g7u6DD+8HLNFwrkGs5pMypr3/c5wCZ72u7X
         ONMIRvLCe1w17Z7G9isLv9BtaqTaglV+R6ivqz5HBTYr5nkgvhIPyKOSXuXJSzAw6w64
         B3aQElMtdXOkjASWnBgQC6dXyp2SZQEU4E07s5+5IDldiv2RgNWAHa6wS/xqCxCcizRb
         O8QUs4QNm+opevEFyZuDXQ7AsysWTVmY7LxHaApficcZJOt+q/PsiVjBNp6NptFG2M7X
         8O4n0DsYCPr2V7TH2ZOMqHykVFkcdRgbVgiSJf781cp+HKUwBEPx4NsUaQOddgfwSgJb
         o49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557743; x=1764162543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/PhfpThnBPbWYm99SayqqOmvAer1zIz//ZVr6sgUx8g=;
        b=kBBrdD1PyCkYlOcXMVKoEarI2iGzYJuE4k35f89ZZ/WjQA39j9TyOxXOIRSaljkTdy
         ML7KIMX3QxG2GVQ8PeufwihdhPDpT1eOnVVOMGYyItitBlH8+NS8OqX/ego8/xmYNPMM
         kNGXC+HcKy61dAjX7iEFXHJEvZNo4FAVqg01/ATSNI8xjd/4XWnt6xPDTmjgHJXajdm6
         1tPKIQRu8n0rMievHMgqHy2c04du7UCMDAKxR7aE005L1ycZ8Ho1NNX1ACW8CQiad4Lb
         /5+qqm/neW3TIFC8yeQwshinkrDakCH3v6gJ4BpcWZ52/t0G6eSDAc8jjz38jcSFcf+S
         V/2Q==
X-Gm-Message-State: AOJu0Yzh3geC+2YtmD5bkpEvOxkh90ED88m7TKuDKwZy5UJpikmrn/Nl
	7eUS550rfSkijKlLkUV2eMRwzc09iwIyiGldsfXOrTxhQyNBphO48k22
X-Gm-Gg: ASbGncsAmVvAOkATJn0t7pOOggmHo71VG+74xu8XLE41yninMcp4ZXFOGmvE6otE5xM
	WO8u6/Yam6hSOm8yhn5DsPFw92zw+ethenYZj1wObsD4bZxCjFvGzYdF+rH5bgtSCoQsgKeZ5xI
	zQfhO7oHU66O60OgSOFMVynhEYxDS8JHUQIdSMOvnjbXp/eBJVgOcHLzXrOliJlTBk+7xK4d3zj
	Mg0glPjnbZ3FnNuHFwAz4CDh+LxjuRlEGuIY3jfkB/bccfIghQ+obsj7R0tbGvTyhbrx+XZZ3q4
	7dANdC3Yx+Z7Lu9CTDNcvMq7rmbjUnqnNJl5CsD04gueXiUs72yPnm+O4VwXm6MztcV20JlWJYx
	lf0cbn2yVBqNLF9qBEzGMOoAPYQ7Ng4OfYWiqTmJPDCxk+pTSP6OP1JGgR3VoWXzPRoTnDNidRN
	+kYxgqqtpUZrKT45RqG4R3jOcMR2eByd4DZVUDl4bBdXKgpg==
X-Google-Smtp-Source: AGHT+IH2icsuZup0t28zq1+gCeYw7a1CehWBpfDeeE9rZAiWffx4jMLQwXpNwKhhHe3WGMo/AhuUMQ==
X-Received: by 2002:a05:6a00:4601:b0:7a9:7887:f0fa with SMTP id d2e1a72fcca58-7c2c0f5719amr2777639b3a.1.1763557742964;
        Wed, 19 Nov 2025 05:09:02 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.183.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd969sm19692422b3a.23.2025.11.19.05.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:09:02 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH 3/8] usb: gadget: dummy_hcd: use 'unsigned int' instead of bare 'unsigned'
Date: Wed, 19 Nov 2025 18:38:35 +0530
Message-ID: <20251119130840.14309-4-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119130840.14309-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 'unsigned int' instead of 'unsigned' wherever possible to maintain
consistency with the kernel coding style.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 1369b9613..6ad366640 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -506,7 +506,7 @@ static int dummy_enable(struct usb_ep *_ep,
 	struct dummy		*dum;
 	struct dummy_hcd	*dum_hcd;
 	struct dummy_ep		*ep;
-	unsigned		max;
+	unsigned int		max;
 	int			retval;
 
 	ep = usb_ep_to_dummy_ep(_ep);
@@ -1414,7 +1414,7 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
 top:
 	/* if there's no request queued, the device is NAKing; return */
 	list_for_each_entry(req, &ep->queue, queue) {
-		unsigned	host_len, dev_len, len;
+		unsigned int	host_len, dev_len, len;
 		int		is_short, to_host;
 		int		rescan = 0;
 
@@ -1443,7 +1443,7 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
 			/* not enough bandwidth left? */
 			if (limit < ep->ep.maxpacket && limit < len)
 				break;
-			len = min_t(unsigned, len, limit);
+			len = min_t(unsigned int, len, limit);
 			if (len == 0)
 				break;
 
@@ -1624,8 +1624,8 @@ static int handle_control_request(struct dummy_hcd *dum_hcd, struct urb *urb,
 	struct dummy_ep		*ep2;
 	struct dummy		*dum = dum_hcd->dum;
 	int			ret_val = 1;
-	unsigned	w_index;
-	unsigned	w_value;
+	unsigned int	w_index;
+	unsigned int	w_value;
 
 	w_index = le16_to_cpu(setup->wIndex);
 	w_value = le16_to_cpu(setup->wValue);
-- 
2.43.0


