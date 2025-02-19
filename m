Return-Path: <linux-usb+bounces-20828-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D93A3C49B
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 17:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8765D189CEFC
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 16:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166BB1FDA97;
	Wed, 19 Feb 2025 16:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="klMiooKr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB57A1FDA85
	for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2025 16:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739981567; cv=none; b=mQFezT72VvVrAfN3UDou+36rB1pz/6tHSUPLk7NXtZ3sT5UAaSja/f8FVCK50vVtoO2gzdscIHgb81bjvknD6wQzxbrM+E/Nhe1rhMKLtPZoU5O7XH1Xga9pD01vAoCoPNX/HwHJduo27wghmPcv0rqQPND+G9zF+CoMgJcFu1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739981567; c=relaxed/simple;
	bh=u9re8REjXvzfjxXgY3YZOGCROFhktmSNqqLvuZr/BdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O0UtFTkQ3wIwlbZ9dgKdXL8Ofu0fdmTD2Bt/IkzH5f8hCziSCyn4Q/CFp8lzqlCXXmxf9eJYU1p378OTA3l7zUUT6reKhD6U6lcwlle/4svztnJFdkaEls1ZI75iau1a2I0vwZNqxVDwSwCj3Fh/apJDpYln6dT0tV/8HwXMOpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=klMiooKr; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e04861e7a6so7146975a12.1
        for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2025 08:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739981563; x=1740586363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EjtQMF6TRiPlbfacQTAhkXNaJjpdhJbKUPVWmlaNaqw=;
        b=klMiooKrmcSRc7RSB90dBHDHBOzadk/MKMnP/lIa/O+w6CCa5GinDAoWpGwokHEVLi
         FAS32poSWqe1a9u/WJOgFwVGWiHlwiDecpIs0fHxRAExsYDNtSiWrs/Uoz7poWyMLAvs
         5ksvdGq0tybUbUVSAKKEYPDfA+8malYm4Tirn/DQfxp43u7PW0k7Ax1/AhOVzFnytohr
         0bcFoGjbb/iqCN12JZnLddfGAODfC6zTKUPhOsX+1Z/KFEryuMxq2N06W913kBjbXCr/
         Z0oeILIDDzBvEXpBJzD6gSU08dCVkC8OKSaH+z0kHMegiJiBjh4xw+CrpaEJIrIOZlHC
         42wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981563; x=1740586363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EjtQMF6TRiPlbfacQTAhkXNaJjpdhJbKUPVWmlaNaqw=;
        b=SZqz3QdUBLn6mVxupRyjSUHdStXsszQ1BRE8ZYB5s7Jv/uryhElh/12LrCiZiunlp4
         EfzMfrEm4ncaUQFiovkEmKbrIRIHxCj3I3TD62oU1KClkOXFF4gdXHfIfL3lyBXYJEl6
         rMgv07g/kxJtJk8mvwXpyJ+sbN2tIan93s27M43nwOvmBqfmDPRVb0ha1HahbdjGOB6S
         4K5Zyfn2DJiQ+XQO0HOp6Dp/b8OPoDfFRrajDTHieGB3P+4ORtX6id2JMeWu6g6XotZv
         GNyQb3zZ4LEcKb1ntIXX2RLdvFfpbl3ByB6opc58IvdhOAqnSPEJ0uX/WH42eDyuibdw
         I2qg==
X-Forwarded-Encrypted: i=1; AJvYcCU8Jqpch1cxuxFKVp5Zho6JXJW5zefZDf48oYFCYguzgoRHbGk3iEAADYuRcjhYYFNZ/2asea4dJAc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3KDsPrMDEkiUsmKx0YzzUtQfAIbQPte9Dbi1TE+LOaLOd3qNN
	F/RfL7Xld0vYoZ8j9AXG2Fta9U+ANEzCH5rRbUB/W7p8ZyRCGerJArBKB9MpIfsA28d/+xfj7u+
	x
X-Gm-Gg: ASbGncvvkbwuhMVcTv1pZ9ExUgHJngyFcLByzEbO8bRx74QPHV3RUS1aZn7GpYalwrO
	vx4s9ny9QFWiBxdsrWStq5qWdSyh+JAchUZ+h/20PtOdJpKWB9wSv2bvyrIFSurBNtwAjOzad8d
	ZOvVKSZMEyOf9xIrzd30bdSIluq3PtF6YYaO7exU9ZREYcZZPlRPirz7IOuqRdVFSots71fovbf
	OXpB/bNDJCpNGe96i3Yx1YbSFnRyKTey2ipvjpdclYFyeb/mvZfyuqxWkSE9vtu5osv0jzrHVr8
	tLJnBdv3KoxW31FW7xiMKVhnCElsDJUFO0SChRErTnNH
X-Google-Smtp-Source: AGHT+IFDZiBTqJrldYlbzqbLeUrNI2Old0Cil6RTu/LjqVXeUEAxzu3ZkZ9acNlt3bU6vH0XYRdRTQ==
X-Received: by 2002:a05:6402:1ece:b0:5de:aa54:dc30 with SMTP id 4fb4d7f45d1cf-5e0360441bbmr18248109a12.5.1739981563113;
        Wed, 19 Feb 2025 08:12:43 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e07f390626sm2548881a12.30.2025.02.19.08.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:12:42 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	biju.das.jz@bp.renesas.com,
	geert+renesas@glider.be,
	yoshihiro.shimoda.uh@renesas.com,
	laurent.pinchart@ideasonboard.com,
	phil.edworthy@renesas.com,
	balbi@ti.com,
	kuninori.morimoto.gx@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH RFT 0/3] usb: renesas_usbhs: Fixes for renesas_usbhs
Date: Wed, 19 Feb 2025 18:12:36 +0200
Message-ID: <20250219161239.1751756-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series add fixes for the Renesas USBHS driver identified while
working on the Renesas USB PHY driver (series at [1]).

Series (with [1] on top) was tested on Renesas RZ/G3S with consecutive
unbind/bind and data transfer tests before/after the unbind/bind.

The unbind/bind was also tested on the devices with the following
device trees but w/o checking the data transfer (as I only had
remote access w/o USB devices connected):
- r8a7742-iwg21d-q7.dts
- r8a7743-iwg20d-q7.dts
- r8a7744-iwg20d-q7.dts
- r8a7745-iwg22d-sodimm.dts
- r8a77470-iwg23s-sbc.dts
- r8a774a1-hihope-rzg2m-ex.dts
- r8a774b1-hihope-rzg2n-ex.dts
- r8a774e1-hihope-rzg2h-ex.dts
- r9a07g043u11-smarc.dts
- r9a07g044c2-smarc.dts
- r9a07g044l2-smarc.dts
- r9a07g054l2-smarc.dts
- r9a07g043f01-smarc.dts

Please give it a try also on your devices with [1] on top as well.

Thank you,
Claudiu Beznea

Claudiu Beznea (3):
  usb: renesas_usbhs: Call clk_put()
  usb: renesas_usbhs: Use devm_usb_get_phy()
  usb: renesas_usbhs: Flush the notify_hotplug_work

 drivers/usb/renesas_usbhs/common.c     | 6 +++++-
 drivers/usb/renesas_usbhs/mod_gadget.c | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.43.0


