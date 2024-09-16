Return-Path: <linux-usb+bounces-15132-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 428B3979ABC
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2024 07:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4BD81F21F11
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2024 05:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6114644E;
	Mon, 16 Sep 2024 05:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="ZPp1wIzE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE9B446D1
	for <linux-usb@vger.kernel.org>; Mon, 16 Sep 2024 05:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726464316; cv=none; b=pV3MCeLdSr2AVFtLXR+NvZwolWOwx9GWNzt6OELUBLxBb+r1e3oheBT0n2SAC4HImrk4FIj7eVlBxXi8q2M/GybtiGNu1Zz0DkPOMD7wYM2RJywqAM29IOfCU8JqSVjH3XMsPXUC7iIVC6A6TFccPuc+3y+Gn4KUSdYt/c0t3PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726464316; c=relaxed/simple;
	bh=9PL0KJkREBXZCsZeUMZCiVV9MTdg3kNhpdgdTCTbBVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mQKZox+P7/0JcVPTesUX6k2uajLLx7AnRqPTAtwdIx9R1+T7ReK9vwriGmsZzio0/WFLrF1xeVcBAJLpYLzUX6eS7KtoDGL5CBSXKeHqPwzTjlVntaXzt4JtkY9pYgN/mEpDisqYauDOULoWhPzYT/job1dZu9AIZ2JC3JrTNto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np; spf=none smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=ZPp1wIzE; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=everestkc.com.np
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-205659dc63aso38938405ad.1
        for <linux-usb@vger.kernel.org>; Sun, 15 Sep 2024 22:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1726464314; x=1727069114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuSOh5erKMKm0kXqVEy8c5VHv8IQUs4PbHs0ClPNTXk=;
        b=ZPp1wIzEQaj6a7MHF6tfZdM4RHOaYYdfJcL1OUBW69/jbn2pe29vCqu4f4BeuwpKOt
         4zszxipGgqlYGJpEXyUMMqIrx096FeZdG3CicilWFWnFPf3TXVyMrry7TF0h+wnxIMbW
         D3VbMsFaFwaw4A81pGJ9ZQLswalGjWjdbCnDOEf7F0DVY/DajFPBmXm62WzA5n+B+cod
         +gX2nN/webFRpQ48S4a+UWqRVHSgSMGpCpnETGtM/UZLfKqMEyE9VGK1hWI6yxsl6A+p
         InfQuapNmOCFRuRycRMTIqeaZIDXDVtmnUfWVm/cuf6PLKaX1kPVJ8vDO6wkN61PadNE
         6v4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726464314; x=1727069114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LuSOh5erKMKm0kXqVEy8c5VHv8IQUs4PbHs0ClPNTXk=;
        b=qZZ0JqmBOOE6L/KLYBwf+B26Q/ZhQRbc69uiMC0a37eg44lto9S79e04TIFpamuw1t
         qjOzk78xArAw3GYVMN//PabRwSeoIH3ZLlub7QNL8QUc5ra5EIkTSyb4TqXXXIhOFw+S
         7/gUvIH5z2va8Y6HSCZMPdzr3TCN1TqnLjK4znagjZwbUuo9u+nXQr1oaD0pTFvEVjXs
         bWJCmGSvszslGhNYAgxR8YGIYX6vbz/xTaMb9GVJUrdQYM4EAqCZbOUCNOzVuJwjC+76
         K+UppZZ5H3YWDEPn2xijtpxpBFyhvf58o3PIoDJeYo7WAz1nECLrKENk1RJxJTjRE26O
         Qg5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNwopHyOAQFrDTyw4RnLXKL2z01V/G+Dc3I/0RZUUC076VUihEeBYRE6jppEEdX6YPt8N2UCyX55c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3b1zI6rTUMDUJWI0ZkKYXEDPiEVRksBR+8cnnok8ySs3+Xtk3
	tkyjL5s7dgJY3PMIrsaMU70Cum2iTLQfwL4RI367ozCtoO/9xYTnHCpV2y1Igjk=
X-Google-Smtp-Source: AGHT+IHmQ63E/FEOpoDXOeA0lDDGe6ISeVicf0+BYH3UfBDH+OXq+7L1AczokPEJBRu4wR99+sU0NQ==
X-Received: by 2002:a17:903:11ce:b0:1f7:26f:9185 with SMTP id d9443c01a7336-2076e36a649mr238332795ad.10.1726464313734;
        Sun, 15 Sep 2024 22:25:13 -0700 (PDT)
Received: from localhost.localdomain ([132.178.238.28])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-207946f3558sm29624865ad.183.2024.09.15.22.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 22:25:13 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: gregkh@linuxfoundation.org,
	u.kleine-koenig@pengutronix.de
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Fix spelling errors in file drivers/usb/gadget/udc/m66592-udc.c
Date: Sun, 15 Sep 2024 23:23:56 -0600
Message-ID: <20240916052357.6487-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2024091626-trailside-grandkid-5f86@gregkh>
References: <2024091626-trailside-grandkid-5f86@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed spelling errors in error message and comments that
were reported by codespell as follows:
	unexpect  --> unexpected
	workaound --> workaround

Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 v1 --> v2: Removed the coding style fix. This patch now only
	    fixes spelling errors. The coding style will be fixed
	    in a separate patch. 

 drivers/usb/gadget/udc/m66592-udc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadget/udc/m66592-udc.c
index bfaa5291e6c8..c5e68caaac8d 100644
--- a/drivers/usb/gadget/udc/m66592-udc.c
+++ b/drivers/usb/gadget/udc/m66592-udc.c
@@ -110,7 +110,7 @@ static inline u16 control_reg_get_pid(struct m66592 *m66592, u16 pipenum)
 		offset = get_pipectr_addr(pipenum);
 		pid = m66592_read(m66592, offset) & M66592_PID;
 	} else
-		pr_err("unexpect pipe num (%d)\n", pipenum);
+		pr_err("unexpected pipe num (%d)\n", pipenum);
 
 	return pid;
 }
@@ -126,7 +126,7 @@ static inline void control_reg_set_pid(struct m66592 *m66592, u16 pipenum,
 		offset = get_pipectr_addr(pipenum);
 		m66592_mdfy(m66592, pid, M66592_PID, offset);
 	} else
-		pr_err("unexpect pipe num (%d)\n", pipenum);
+		pr_err("unexpected pipe num (%d)\n", pipenum);
 }
 
 static inline void pipe_start(struct m66592 *m66592, u16 pipenum)
@@ -155,7 +155,7 @@ static inline u16 control_reg_get(struct m66592 *m66592, u16 pipenum)
 		offset = get_pipectr_addr(pipenum);
 		ret = m66592_read(m66592, offset);
 	} else
-		pr_err("unexpect pipe num (%d)\n", pipenum);
+		pr_err("unexpected pipe num (%d)\n", pipenum);
 
 	return ret;
 }
@@ -172,7 +172,7 @@ static inline void control_reg_sqclr(struct m66592 *m66592, u16 pipenum)
 		offset = get_pipectr_addr(pipenum);
 		m66592_bset(m66592, M66592_SQCLR, offset);
 	} else
-		pr_err("unexpect pipe num(%d)\n", pipenum);
+		pr_err("unexpected pipe num(%d)\n", pipenum);
 }
 
 static inline int get_buffer_size(struct m66592 *m66592, u16 pipenum)
@@ -293,7 +293,7 @@ static void pipe_buffer_release(struct m66592 *m66592,
 		if (info->type == M66592_BULK)
 			m66592->bulk--;
 	} else
-		pr_err("ep_release: unexpect pipenum (%d)\n",
+		pr_err("ep_release: unexpected pipenum (%d)\n",
 				info->pipe);
 }
 
@@ -428,7 +428,7 @@ static int alloc_pipe_config(struct m66592_ep *ep,
 		counter = &m66592->isochronous;
 		break;
 	default:
-		pr_err("unexpect xfer type\n");
+		pr_err("unexpected xfer type\n");
 		return -EINVAL;
 	}
 	ep->type = info.type;
@@ -579,7 +579,7 @@ static void start_ep0(struct m66592_ep *ep, struct m66592_request *req)
 		control_end(ep->m66592, 0);
 		break;
 	default:
-		pr_err("start_ep0: unexpect ctsq(%x)\n", ctsq);
+		pr_err("start_ep0: unexpected ctsq(%x)\n", ctsq);
 		break;
 	}
 }
@@ -599,7 +599,7 @@ static void init_controller(struct m66592 *m66592)
 		m66592_bclr(m66592, M66592_DPRPU, M66592_SYSCFG);
 		m66592_bset(m66592, M66592_USBE, M66592_SYSCFG);
 
-		/* This is a workaound for SH7722 2nd cut */
+		/* This is a workaround for SH7722 2nd cut */
 		m66592_bset(m66592, 0x8000, M66592_DVSTCTR);
 		m66592_bset(m66592, 0x1000, M66592_TESTMODE);
 		m66592_bclr(m66592, 0x8000, M66592_DVSTCTR);
@@ -1186,7 +1186,7 @@ __acquires(m66592->lock)
 		control_end(m66592, 0);
 		break;
 	default:
-		pr_err("ctrl_stage: unexpect ctsq(%x)\n", ctsq);
+		pr_err("ctrl_stage: unexpected ctsq(%x)\n", ctsq);
 		break;
 	}
 }
-- 
2.43.0


