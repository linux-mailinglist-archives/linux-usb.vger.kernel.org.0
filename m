Return-Path: <linux-usb+bounces-24247-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5238CAC1F52
	for <lists+linux-usb@lfdr.de>; Fri, 23 May 2025 11:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F244A283D6
	for <lists+linux-usb@lfdr.de>; Fri, 23 May 2025 09:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDE322422F;
	Fri, 23 May 2025 09:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLmz6SWU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A74139CFA
	for <linux-usb@vger.kernel.org>; Fri, 23 May 2025 09:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747991289; cv=none; b=NY9wyW3tPQkdE7aQcIxZgOPoctS9LoKIbvi2LnCA4Xc2vBq29JtAq7KUPUqwJlhXW5OxqFrzpUF3SetFTN7XAn854K11/Zef/JpBeybA6QoDEF0E327dYGFPCtSVFQcZgi3dkcdQyrzBigsUwQw4BlL8WPPyDinUM40c156Jzvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747991289; c=relaxed/simple;
	bh=2AXImvXC2U+jciUy6Q9slWinGE+PUtwlbqOyjuFWelE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oUlZFc2Z1kpUKvsFnuXfSACuplxTYef9X1+0416q97Gk+8VMC+S41S08LiZGh1N2VRILuG+QrYUJRXT4D/j+mezmHYaQ5LOzSzhqRxHpmxuo3ZpARJF5+Ir1kxJrAU7dRs3uestIRlh6VUdFGDHN0FoZu8cv2lnpLWwuEfj0FLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLmz6SWU; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32928704a28so49244961fa.1
        for <linux-usb@vger.kernel.org>; Fri, 23 May 2025 02:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747991286; x=1748596086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JFHgM3SHIuxNhWaRJX2MPgsa000o0uwl1Q3M+csxEKk=;
        b=iLmz6SWUoarD3lodcYOIR5JSw20NnBXv6bJH4JeZIFGkcr3wRj9K/9uwuaWtRPUQBU
         cvUZ4fwTfIPLzC0YZNk76UrK1LdxE7IqwnzZ/Aggk3Gkz2UDQdG3ILqQLh9J4Rfp7fao
         OIOE8PCqN1CXuB7uY1HZ1G5wR8DGl/2OybkSPl1sA3QYzhGhZf7NuLhgJnRN63EZkZVI
         Lh7fvuuOSnIWTwpTdY/O0GXgOJ7wiOvSAQzwB1pWesuXAvJhyWx8/wodKgAUoREeIK9n
         oOiKCq7E2r3tRbrjT2lxOym+ED8QJmUhNA22Luxp8pggv0XuTbM1LpJxYECKQfVtiE+Q
         lEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747991286; x=1748596086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFHgM3SHIuxNhWaRJX2MPgsa000o0uwl1Q3M+csxEKk=;
        b=cswbnt6W6K+cMJnaePPGj+6zcnkBomSSG9ELP2pyoJvfGc30/LcnFyeqzH/4C8n8PR
         NX6WS1sKvEPgu6YNLjtIZ1DmpPz6qcpNDRc05RJp91azasPkW0ROmFk42cFEOfZLSXMp
         WUEWkoDaxiQduEDxrs+dONZw3LFtdapLeRNoj6/jPiDmsw1uLEnulW1oPbcPoZ0fhoh1
         s0BuP3NAyG5fqeiUtNMefMUN9+MonfqXmH10bPCMIoMaXx72mWUGgzkj2CpEqvKYCKs/
         mku4TGkVe4WB1EAt7+H+hdKMtd9oi8gGvgFMyIwpRMNjgYP2GDRE71hNNefq0ZxOEz/d
         hv6w==
X-Forwarded-Encrypted: i=1; AJvYcCUxm7iEmTgmRK/b9BnSCUOtHzIAVkgby/G18vYa7hT+o6TJHRjcBlqvDNw2NcH2oKBJgr/nUk4PtxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKyqgF0PrHl9d/Tbblq/XoxTBpImybLbOxGUPyOlQQ4fqwwSRy
	QO1OCjHp6aaI4xm+eWGln/dLWr7Da5xA4D5mVSaQ20LG9sSw/g7Sijzh
X-Gm-Gg: ASbGncvA9UDAvs0P7Ud4zugX+x1xVrjJDy11/0ngbl1XhMFFdf54vyozavzDPpCaPAr
	w3E6euicNDV+RQ1S9vBdt5310E1/mYEu5E2yilYfD3kD7UBGGTwebrz2rvpMDtkbScKI50rDGFC
	8f0r9HgIN9mCPRSPtP3u55BJJnKP5zFYcqqrn2FUX96afNHh/pSJuYbx+IQDYYqvtvDwMJKTNkS
	QZApB+kEsXpchw561bcpi7MBhuFdqPxvDDy3KhHpjDCIlb3KbIeb5r7mV/VGcl1ivKylMsH9Y6l
	QEau0KeLDz9G2JfyShYTDcbSugAgjrM1BBZgCpV8
X-Google-Smtp-Source: AGHT+IFo3bD7UQARJlaurSosD1wnNDYhcNQvyriSzS4ofS0yIEYtib06UaVWleWw/u/Efg82HWK3jA==
X-Received: by 2002:a2e:8a94:0:b0:30c:719:1145 with SMTP id 38308e7fff4ca-328077432a3mr75089341fa.17.1747991285539;
        Fri, 23 May 2025 02:08:05 -0700 (PDT)
Received: from dell.. ([193.0.218.35])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085f64a0sm35318391fa.114.2025.05.23.02.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 02:08:05 -0700 (PDT)
From: Vadym Hrynchyshyn <vadimgrn@gmail.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	linux-usb@vger.kernel.org
Cc: Vadym Hrynchyshyn <vadimgrn@gmail.com>
Subject: [PATCH v2 0/3] usbipd: enable tcp keepalive and set its options for accepted connection
Date: Fri, 23 May 2025 12:07:22 +0300
Message-ID: <20250523090802.17987-1-vadimgrn@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If usbip client does not close a TCP/IP connection to a daemon
gracefully, the daemon will keep this connection open indefinitely.

The issue is that the client cannot attach this device again
until the device will be rebinded by commands:
"usbip unbind -b ..." and "usbip bind -b ...".

This issue was reported by a user, look for details here 
https://github.com/vadimgrn/usbip-win2/issues/109.

To reproduce this issue, run "usbip attach ..." to attach remote usb 
device and make a hard reset of this PC by pressing Reset button.
usbipd will keep this connection forever and will not allow to
attach this device again until unbind/bind will be executed.

To fix that, enable SO_KEEPALIVE for accepted connection and set keepalive
parameters if corresponding program options are passed.

Vadym Hrynchyshyn (3):
  usbipd: enable SO_KEEPALIVE socket option for accepted connection
  usbipd: add long options to set TCP_KEEPIDLE/TCP_KEEPCNT/TCP_KEEPINTVL
    socket options
  usbipd: use usbip_to_int to simplify usbip_setup_port_number
    implementation

 tools/usb/usbip/configure.ac        | 24 +++++++-
 tools/usb/usbip/src/usbip_network.c | 96 +++++++++++++++++++++++++----
 tools/usb/usbip/src/usbip_network.h | 14 +++++
 tools/usb/usbip/src/usbipd.c        | 58 +++++++++++++++--
 4 files changed, 174 insertions(+), 18 deletions(-)

-- 
2.43.0


