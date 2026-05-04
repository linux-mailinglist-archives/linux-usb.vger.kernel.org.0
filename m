Return-Path: <linux-usb+bounces-36904-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP97JMcs+Wkq6QIAu9opvQ
	(envelope-from <linux-usb+bounces-36904-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 01:33:27 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAFB4C4D72
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 01:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19184301BA66
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 23:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C5F3DDDBB;
	Mon,  4 May 2026 23:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjQOt1RK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB353DD514
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 23:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777937600; cv=none; b=h9Iby8ipiyNuZbRNl8e4UXgrQEK6HKrkxl9BUZXzuXIJPrFt2tvuQsFrCGv4L/MhGJKhAMv1Ay29y1kaknRKfFLC49UOr6b4DgQ3Fu572cF364NJc2zFjXZoiZLbb9q0N3lRQU7pD6uu7v4s3etkinR9knjMj1IErp1qMKB+5Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777937600; c=relaxed/simple;
	bh=AioJGV7TX2w4sVAACa4CrG5P+lLY/aPz8hTWSVEtUaY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OgMDImM1apuzKX43mGS7gPdSvrsmKFgRG70YsMDqKBRDcCO04MS3UreqF8qp7obuHXihxcfulYNd1LG/0XOQc/IhZHmY5g0VA8xmZ/lEl6twFtdKos/S/9NiZJtIdlSAT6QOz7maXZOKqUn0BmbUHIuuB603HW6b4xMpeHK2trg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjQOt1RK; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bb91b426e40so803879266b.0
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 16:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777937598; x=1778542398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4hnTA4iOvao+u5kOBZqTjREvzFNShYmOaT+yI41pmjU=;
        b=YjQOt1RKMvgXQJpmh/S0as0Q6V50Aditk2IKAi0/PhPMennogpPqYihwSzbNSagw2A
         7ngrJbgveSyMASBLBnC9QGaDXC7Qt2B9QW46Vq/nRQpUuM+J3uNaQkn8tj8RR8hAiV3b
         N81FU9ls9tX14FyIrFgSXzha/8a0V/H+aMnGNrK1cLQRsCSpzaeVG/Kuz4e0cIcVMhjH
         5emgxT+Rhuf79euG7VCYF1ToVcgyz4rKGSFKWszhXlRiNCzz+pEsz4zUGpjEQNsVmIq0
         qwSNw7IAHSqvI2bIIrhGZazD2nu7JwG7HzHdDXrBEGaXiJTB0E+CoYAYQeO+pp7WAsAW
         UMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777937598; x=1778542398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hnTA4iOvao+u5kOBZqTjREvzFNShYmOaT+yI41pmjU=;
        b=D5ZeJtNAOQrTy5DL/x/9ygvgSboCjHmCZMUOSJd56Qfl3v49u0Bvhsbywp45zHO5Ww
         4FGGN4voJI0dxfamKNrumREDIQubh8Db/fVaD6IXtiijMA4lSifGEvFOGJrgr7nxNM/k
         okC8f2nVdqbHhqoq63JtUtUkDpnDry2mnd4V1ArnG6AwO9zWtfrvNf9htiOGWkny1dwP
         NbqqLsuqzeAd9/LslumWY2ILxkcljqdqGhZzM3PGRGXGAHhw3IoPEEJ9ShBnPjomrPgb
         EJRfazEIUzjEMOR9liZShClEVYIupJUxFwJIxDlv3HsKvp2D2MRYGPG4NywBhY9OQhvh
         v77A==
X-Gm-Message-State: AOJu0Yy2B0U+LBvajW0J74ESD8We6MhTh/dUCALYB/TktqTh32Hv3Fla
	0UOxXtuKhVHOpnIsFuPHVvApZvMEdg3qwZlRsAzkqTadtpayrwBq3MI4
X-Gm-Gg: AeBDietuCtwGwD9j0XjW/Qnx6b3UYRtPCeXuIt3lJsaoO7vTRlHejFlZLTI665Mh3gq
	HX34JRuhwv6VlwKl5PvPM7NM0uOOC1ys/uQlW+X07IYAwY2qaqdiIwM0tF1P6F+9J3JRA4CzNlK
	ur9Mz3/aqTh3cPABsHCrtTdiodvJhgAj1e5Te1wSgNAuwEV/XbEcoarWVTmSRxBn0MI6z9zjNVY
	StmtsvbwNeDZDM/YlAOkyFrnOAQqmtPN0bKombpw1MlFRCw7gXwyel70FAeUO0r62Qq9JUDC8Rw
	gplr/SXxIE4szmKyz9QKBn4/rkI72XKFVvDBTOPS2ch5Dh2qL3gDuBg9P6SJS7dUrmPAhHFgpkX
	ex5a1syX+UmKqTJgWxNG26yOmE05TzyTWHvf2yCCkcidyDzFhfdAE+4xAivB1SlGFrJIqBtioMD
	LzejkaO+HELusbFF6QIfNQwdTT/dV3dKYDgw+3Yq/18HGTSSLGmBpZVCuLzIcBq6JlUqgMzBRVb
	jb+WkPuRE+XkNsFdc536j6Nke5zV48IQdkBVU0kdFZF0g6DU9tDEpgtXz2olQ2/XRt08o7ak3Mb
	isk=
X-Received: by 2002:a17:907:3ea1:b0:bc1:36dd:c6c9 with SMTP id a640c23a62f3a-bc136ed1858mr466108766b.33.1777937597490;
        Mon, 04 May 2026 16:33:17 -0700 (PDT)
Received: from nick-GTR-Pro.arnhem.chello.nl (2001-1c00-3281-1680-7a55-36ff-fe02-cdba.cable.dynamic.v6.ziggo.nl. [2001:1c00:3281:1680:7a55:36ff:fe02:cdba])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6aa4d524sm445224366b.26.2026.05.04.16.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 16:33:16 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: mathias.nyman@intel.com,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nicola Lunghi <nick83ola@gmail.com>
Subject: [PATCH 0/2] xhci: Fix isochronous scheduling gaps on CFC controllers
Date: Tue,  5 May 2026 01:31:42 +0200
Message-ID: <20260504233143.10242-2-nick83ola@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1AAFB4C4D72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36904-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,gmail.com,linux.intel.com,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nick83ola@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

This series addresses a long-standing issue where the xHCI driver introduces frame-aligned gaps in isochronous streams during timing fluctuations.
While many USB devices handle these gaps with a minor glitch, professional interfaces like the MOTU 1248 lose internal channel
synchronization when these gaps occur.  

I have identified two specific code paths in xhci-ring.c where these gaps are created:

Silent Rescheduling:
When a start frame is "late," the driver adds a +1 frame offset, creating an explicit hole in the stream.  

Ring Drain Race:
On CFC-capable controllers, the driver falls back to ASAP scheduling if the ring is momentarily empty,
resulting in a jump to a future frame instead of continuing sequentially.  

Impact on MOTU 1248:
The MOTU 1248 is particularly sensitive to stream continuity. The two situations described above cause a
shift in the output channels, where audio intended for one set of channels is routed to the wrong physical outputs until the device is reset.  

Proposed Solution:
This series modifies the xHCI driver to prefer sequential scheduling on modern CFC-capable controllers:

- Patch 1 removes the silent start_frame_id + 1 reschedule, returning -EINVAL to allow the use of the TRB_SIA (Schedule Immediate After) flag.  
- Patch 2 expands the CFC sequential condition to check if a periodic completion is in progress, covering the
          "ring drain" race where a new URB is submitted just as the previous one finishes.  

These changes build upon recent work by Michał Pecio regarding missed TD
handling. 

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220748

Nicola Lunghi (2):
  usb: xhci: fix isoc silent reschedule creating stream gap on CFC
    controllers
  usb: xhci: fix CFC sequential scheduling lost on ring drain race

 drivers/usb/host/xhci-ring.c | 42 +++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 13 deletions(-)

-- 
2.51.0


