Return-Path: <linux-usb+bounces-5393-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEE9838A03
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 10:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41C8F28A489
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 09:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48F05812D;
	Tue, 23 Jan 2024 09:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5f+bWny"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C524A58124
	for <linux-usb@vger.kernel.org>; Tue, 23 Jan 2024 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706001060; cv=none; b=L+lIvmlWmuK4svYDfTM6virVMp48sXl0bnBZhyf5kn/kmkCV18M/a+hI2aHB4hi9mFoZYSAcUb7B/PQ3DsaAKtLqkZHVSq5hKXrpRK71DC2gXz7pki11IZ01cCMVSQVo0oriAZRQ+/6HUck3ni2Zt8ZMGni2zVEQHhhycY0Ik98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706001060; c=relaxed/simple;
	bh=CNAvhk+ctgZW7S/WDsXnpzUkaaze6ALFXV+DhUrOG6g=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=cMPrpDvJ6vFYg6VmCUD9MmdDGqq541WwopEfzkc4FuyVs5SCCMIxm0uc9fmuPmy9GCYlRbbZqKj5v7UI6AFGSUbblPlTfR92e8o0TBYN5wroNcgPFqoIsGHJaVpZMjEiuxHgykvpq83H64EQltOQp4nJlhTRRM1p8SVQviiMYh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5f+bWny; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50e7c6f0487so4520719e87.3
        for <linux-usb@vger.kernel.org>; Tue, 23 Jan 2024 01:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706001057; x=1706605857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ERkL/+BOaOSAcv9JaeJ17wcdjLtEvEqVGgqlk6wrhx4=;
        b=Z5f+bWnyUcDo4H6sYzENsP/2rREGs1p/4I5ilnzu35m7mFrhV7MdvgkCUKlyYuQQiF
         Lbw+v+LTU7FgqEU86VCa8G/M1QzgkV4ReihDdviDnjVrBaIPq8WH0U15SKuE3MuXAgi7
         84beoiAiRlmO49mHfws91ErKWMwbI474BMFOtYDK6rkUFH1veVXu6PAdvDJ3ZLavWr0T
         SYSUpBPdgdUNI3J88GJ76UeJBz7C28G4Ov4hUFfH3T4xYBvXuEaLrzV1GO7niVfLxthZ
         /h1L3V3KjEFAGL0CpLOjnDWAD40I9aBqm7BioTdJbK0uE3UI5KUHRjKHeK+R3Eav/rV6
         zCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706001057; x=1706605857;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ERkL/+BOaOSAcv9JaeJ17wcdjLtEvEqVGgqlk6wrhx4=;
        b=pIPF2T+d6rCg1jU1Gql4fnwq8sXFxAjcand/YbO+fF8Qog1f42nZ0i4cxnz3UuVQKv
         Rxuen+MZqXdYmmtjrcR6hzWe9OYZ/P5/bRrZAoUwqusKi01ILOxxfXGmJpfn/mgZ3/bv
         gyFQGWUsfdgd+5NK2I8nsb2CtFFRkodYCdnQd7TSrf8M/J1c8szl6qHuak1aDnCcSK4g
         yUnZOa0RegzYWF+C9LT89OkNCCfFgRdfrYysc1ozzPgYORQj/lE2BnVi0fdAS2JGtTRO
         lCSaTn5gxBi5AHClef41jTEunPwQ1sdaseM/kEo9yHWthNI4HYjZyo+iubsmsEjFWlmN
         Xs0Q==
X-Gm-Message-State: AOJu0Yy3rsricm43leBDtigIA2cHcCkswUJT2Y2GT4h4/YE/CanEqvvp
	v4Xobn4g3nyQVjjxyAGjnWJtoe+jY1aztvlPCBBd+ftJEoj0/9dmaGy84leh
X-Google-Smtp-Source: AGHT+IFRgluLHPuMCZ98DOYyg7H0qwa1VhjjmU24NV9fjl5vH4NRinZtAqx6LcSr+pyeGXcP5yYxlg==
X-Received: by 2002:a05:6512:280b:b0:50e:7b9c:8b1a with SMTP id cf11-20020a056512280b00b0050e7b9c8b1amr1868582lfb.95.1706001056461;
        Tue, 23 Jan 2024 01:10:56 -0800 (PST)
Received: from foxbook (acgj208.neoplus.adsl.tpnet.pl. [83.9.237.208])
        by smtp.gmail.com with ESMTPSA id k11-20020ac24f0b000000b0050e74ec73f6sm2284364lfr.124.2024.01.23.01.10.55
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2024 01:10:56 -0800 (PST)
Date: Tue, 23 Jan 2024 10:10:49 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Subject: [PATCH] xhci: handle isoc Babble and Buffer Overrun events properly
Message-ID: <20240123101049.4f76f43f@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

xHCI 4.9 explicitly forbids assuming that the xHC has released its
ownership of a multi-TRB TD when it reports an error on one of the
early TRBs. Yet the driver makes such assumption and releases the TD,
allowing the remaining TRBs to be freed or overwritten by new TDs.

The xHC should also report completion of the final TRB due to its IOC
flag being set by us, regardless of prior errors. This event cannot
be recognized if the TD has already been freed earlier, resulting in
"Transfer event TRB DMA ptr not part of current TD" error message.

Fix this by reusing the logic for processing isoc Transaction Errors.
This also handles hosts which fail to report the final completion.

Fix transfer length reporting on Babble errors. They may be caused by
device malfunction, no guarantee that the buffer has been filled.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

Question:

Will this become a game of whack-a-mole as new cases are reported?

Would it make sense to apply error_mid_td right away to more codes
that plausibly lead to an abort of the current TD?

Or do it after the initial patches prove themselves in real world?


The impact of freeing owned TRBs is unknown. No one appears to have
ever complained, myself included. The error messages are merely an
annoyance - next event is a match and all is back to normal.


 drivers/usb/host/xhci-ring.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 22a4aa65e4c9..9673354d70d5 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2393,9 +2393,13 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	case COMP_BANDWIDTH_OVERRUN_ERROR:
 		frame->status = -ECOMM;
 		break;
-	case COMP_ISOCH_BUFFER_OVERRUN:
 	case COMP_BABBLE_DETECTED_ERROR:
+		sum_trbs_for_length = true;
+		fallthrough;
+	case COMP_ISOCH_BUFFER_OVERRUN:
 		frame->status = -EOVERFLOW;
+		if (ep_trb != td->last_trb)
+			td->error_mid_td = true;
 		break;
 	case COMP_INCOMPATIBLE_DEVICE_ERROR:
 	case COMP_STALL_ERROR:
-- 
2.43.0


