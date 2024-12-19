Return-Path: <linux-usb+bounces-18686-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B09029F8668
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 21:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1679316CE16
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 20:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30311C4A12;
	Thu, 19 Dec 2024 20:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2m/lt16"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D50D111A8;
	Thu, 19 Dec 2024 20:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734641731; cv=none; b=Xvea/Eq6DlHWFtfUkIjkvPxNWFRzAgiQ4uefkjpTWAW1cz5m4832HSOxd3LYxse8G3HvTexcnDdTs70pKibz9gHhKQ4sHK/pPP6rU2cMLNd54PsnZHZ/NL1DHRuDU4pB/9dPgGrdNS05wHUfr9oTHV5n2o5GFTGeNTtKTmYWxaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734641731; c=relaxed/simple;
	bh=GMzYW8WGGgLCsegZT+UPaYjnoa0wKgU9kcOTcblbHRI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gl7jJMh2v1qF7Z4K2Nq0x3zMA2t2FlflDjeZwZyOst5OKWkrT7sxAXgHlBKRu30i36w7zw/wPqxWJZILYsXFaNTuwnpOE4t4Ub34z6geqAzGjO228OxGb8Nalk/gAao82Y+zmc8ueIJ8+8JlzzMIQJJ02xbGwTOq9h/oeRo5VbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2m/lt16; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3003c0c43c0so13932291fa.1;
        Thu, 19 Dec 2024 12:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734641728; x=1735246528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPNViEWhUgdkee9mpEeP4slyvic4bADZBNeb7yt4tHw=;
        b=P2m/lt16db1Clrf5lS2NSVPg8PET/LPBRRBxd0HRkPF4r0JiiTZ4DcuY+w5/lRs2ub
         VkQBsZiBjbcxhMxmj5rZAXFkFP0RJpttZ7S82h4aYQd+dT0DLTwIXCals/Yp4wF5KmIm
         CuGpQhulbfJ+dXBkh9i9G5yqRBQHM63LD362kZsyPaOv3Is5Xs4beQ9krYLXUFp/me4S
         q29e1MvuAYX7mDn9YFA9H1HxRSxFq8wE0Z8jr/ypEJcqsbgZz16TJIQYVNwp+IHw0vt5
         13J92ypIWkg8PwtOS+22lPFhPkq7FkeHregux+Kkn98bJQ4ThrKGb+oEJR7fk76kRRk5
         l9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734641728; x=1735246528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPNViEWhUgdkee9mpEeP4slyvic4bADZBNeb7yt4tHw=;
        b=lXtc+QQcvZVTb0VJlioCx+sQcOFST9rDEZqUPz6P1lBJr03ttG9V3IOvEBku2/4asv
         XykZ7wE2S8fqgRBcmKmyOz1RAvgLi3WRh9EHCm6gv0koJ3keE9mciF5y1Xt258nwYYaJ
         22qmplg+ygjAjoq6GSwoiuhW7lGF84g6+JAQ4rndO3D5t+wxx9jsxNiizvoVchFNYNSE
         MSXxITBbYufO/KHGEYhMRUrjdxw9y2OUpO7Y/c3a5/fHvLnI19gWl0SiIzWPgKHVRF3R
         yizXwu4MfXDUT37AwgMV3IXdTJwAW9UNGBUsPb8S9O8HNmfoVU+eN4RvJeM2W5kUUM/T
         mQOA==
X-Forwarded-Encrypted: i=1; AJvYcCVEi/+div16KXHHCxroY9CpFsUcuSb3qmP598tUoYqbI1pISELKDCkNL92XB1W49oNusVd/GobGOOlI@vger.kernel.org, AJvYcCVHtYTyCD7053NfStyibDo6MGcjRl0r5OvIsKLGnN38jW9MeyF3A5V/7tS+qqG4BQ4X4h5aRumMvuvfNag=@vger.kernel.org
X-Gm-Message-State: AOJu0YysCdPdnZyF41/4HGw+Et99gbj/jzNOs8M8pdk33gY8FuoqEHiI
	V62sBXyuzG7HfP5Bq85XddAXwSXIKmSAANf/XMhgY5dgiNq5viq1FP0LgQ==
X-Gm-Gg: ASbGncu6tXGHFSv/WsiJOWhFGJxj1YrDTw99ktVgHfBCdE0usfV/foVF4vxiIzuplbq
	tIwYoK5tV3nJBdvLOrzC1bSqeXk0ZpQ8/s32gCigPIfUhgdhBZXZQCNoXa2F2xYDFEbo6HL0dKq
	dCH4+qPQDb5iAVCXjgLza6smCxoPetvjZa80fBc6uRS+GInnZPTWETM0MlpuBUouNFoRUPdUSLH
	YAnjaLXShM4wst6bpgGuPUeJBbRf/UAVLorlxyP0MZhWhB+I0XZMIkCqMHadCt80sPPvNqCkA==
X-Google-Smtp-Source: AGHT+IGMn+fBM2nbjmSNIUfxVozuIpphL0BXAlr9H2WEHS4rrgoGudVSwxTYlAAdBejzVMIYautZaQ==
X-Received: by 2002:a05:651c:601:b0:302:3e14:34c8 with SMTP id 38308e7fff4ca-304685783f3mr1325791fa.22.1734641727314;
        Thu, 19 Dec 2024 12:55:27 -0800 (PST)
Received: from foxbook (adtk139.neoplus.adsl.tpnet.pl. [79.185.222.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6cb69sm3220051fa.17.2024.12.19.12.55.23
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 19 Dec 2024 12:55:25 -0800 (PST)
Date: Thu, 19 Dec 2024 21:55:19 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: xhci: Fix NULL pointer dereference on certain
 command aborts
Message-ID: <20241219215519.273c5c41@foxbook>
In-Reply-To: <20241203205123.05b32413@foxbook>
References: <20241203205123.05b32413@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

If a command is queued to the final usable TRB of a ring segment, the
enqueue pointer is advanced to the subsequent link TRB and no further.
If the command is later aborted, when the abort completion is handled
the dequeue pointer is advanced to the first TRB of the next segment.

If no further commands are queued, xhci_handle_stopped_cmd_ring() sees
the ring pointers unequal and assumes that there is a pending command,
so it calls xhci_mod_cmd_timer() which crashes if cur_cmd was NULL.

Don't attempt timer setup if cur_cmd is NULL. The subsequent doorbell
ring likely is unnecessary too, but it's harmless. Leave it alone.

This is probably Bug 219532, but no confirmation has been received.

The issue has been independently reproduced and confirmed fixed using
a USB MCU programmed to NAK the Status stage of SET_ADDRESS forever.
Everything continued working normally after several prevented crashes.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=219532
Fixes: c311e391a7ef ("xhci: rework command timeout and cancellation,")
CC: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

This is practically a RESEND of a patch submitted earlier this month,
but with updated commit message.

 drivers/usb/host/xhci-ring.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 09b05a62375e..dfe1a676d487 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -422,7 +422,8 @@ static void xhci_handle_stopped_cmd_ring(struct xhci_hcd *xhci,
 	if ((xhci->cmd_ring->dequeue != xhci->cmd_ring->enqueue) &&
 	    !(xhci->xhc_state & XHCI_STATE_DYING)) {
 		xhci->current_cmd = cur_cmd;
-		xhci_mod_cmd_timer(xhci);
+		if (cur_cmd)
+			xhci_mod_cmd_timer(xhci);
 		xhci_ring_cmd_db(xhci);
 	}
 }
-- 
2.47.1


