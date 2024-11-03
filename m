Return-Path: <linux-usb+bounces-16975-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0F89BA3CB
	for <lists+linux-usb@lfdr.de>; Sun,  3 Nov 2024 04:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2A611C20FF0
	for <lists+linux-usb@lfdr.de>; Sun,  3 Nov 2024 03:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003147082A;
	Sun,  3 Nov 2024 03:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YgQelnFM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CABAD2D
	for <linux-usb@vger.kernel.org>; Sun,  3 Nov 2024 03:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730605604; cv=none; b=HWg6CDdWEFK81yVjhXVXm9xtTSjhD4svVz9D/NXS1BFDO/hVc0KPJc1mmKQbGBYAxAOL8a8A+JANEF/Kas6gjLvl10WvduOG0JQ6JQw048CjO9I/5TH0Y+2r2nYGER1T6IKIN/U3kTfL4QUdb4ZlIpESZMuaP2Le3k6wJw0D3SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730605604; c=relaxed/simple;
	bh=Y8PUlPYSyYfURqxBrhBW27mPXCr/o14+GzZHLQXbQqc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FDHqkhP4OoOELb6U5ENw7m58vSlrQ6XqH+QOWFY1dxyqWp1FtATfnkHaNuhwaE5xLaDHCBiWL5r2gjGWXH4kSqyHzBNrVt/M3/iDgCafcNaQRQS6tII3F95SRlCgvugpApT7SNNVbVFSt3V8YD50ds2QoN18a4l2NR4NMfg8Fkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YgQelnFM; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e9d6636498so65649797b3.2
        for <linux-usb@vger.kernel.org>; Sat, 02 Nov 2024 20:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730605602; x=1731210402; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yqrMO7jaI/jLQSZ1khmj67HB8Idd75hZoxXR9Jgd7NE=;
        b=YgQelnFMcAeKbRXX/TxCmGDsBjMKHLgq4sDZMM+2hk+D+SHvB5dGptm9DgMkQ1RvY7
         HdRSNcNGTB5kwQL/ydfk5zR9wJWPqFS4RUnc7dsONgTbI58oEAsjikR8+YkCPLZzRLyG
         t25ET7FQOVlDhZ8+OC1EpvAqjtOtSE1taM4bmyK2zWvxXA4NciV9ZjANc0cBJXDRLdea
         P9He9MLXpKu/bxYZTyE7+zfwFTQFcH+gzazbT0Jh/axdZMv+it0XRj+llMRs/WDXmqxs
         NYf0kIAU9KxgqvlJe9PqM5I3AaP7bFBw4UMbz6+agjZQ2TxGhlfvfBgVwrvPCKI0yyC4
         0WaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730605602; x=1731210402;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yqrMO7jaI/jLQSZ1khmj67HB8Idd75hZoxXR9Jgd7NE=;
        b=EwB06dpPSMM22qfOr8j07PgeAS+4545RG++ALelKvO3FCytzFRNOSH6X+qF64erYlc
         3KQRvnCUUlVB2D+y2NKm95ga8yM8I32eMI4h3RYELOW71oGShqbciHs61y0f/JpCqBCT
         Hgj28qAWEpAgXc86qLyysDn70APwt7ffACRXYUMOCOb1k05a3tQll5gC/ZcfMKMQ+nT6
         55W7oznJbs05U2vgLVCtfaWd3gXolpggYSOjYlwfKlQa+n1HaMZ8hrlRfHzo91xHpA+9
         h1ljXuiAlgxaEmExG9B2xWdv1wiV/iKSW9CHW1sTF8NY2bAeunDLOSuUWjXZRhpLfqNN
         rnTA==
X-Forwarded-Encrypted: i=1; AJvYcCUCyvMUw23A2DKB2bRSdUoL/xZUHjUkhhZ8Pb4TS2GH9Zgwp8I1+FOOuwU+d6VSXzoscsYUBimsZZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym3JDwOgQ/MPQFz+dMqz+zRFb01MC1VdMVc01ryL9RhPFNyS9G
	cP4La4MFDhWOYQFLoCuzp84kNKuTTKQgrX7mKJ+50GXOh5Nol8aSqY5VIE44DUG5MD9NEQi7vNC
	7Rw==
X-Google-Smtp-Source: AGHT+IFzQ+XLUA1KqayCYTQxnRNjwiTTVM+4ZQkOR0Cd+ZD6QXJMpVyAz4IyOMK5iRkGypJY7FXAKdLo4ug=
X-Received: from amitsd-gti.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:827])
 (user=amitsd job=sendgmr) by 2002:a05:690c:460b:b0:6ea:7a32:8c14 with SMTP id
 00721157ae682-6ea7a328fe2mr115267b3.7.1730605602048; Sat, 02 Nov 2024
 20:46:42 -0700 (PDT)
Date: Sat,  2 Nov 2024 20:43:27 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Message-ID: <20241103034402.2460252-1-amitsd@google.com>
Subject: [PATCH v2 0/3]  Add new time property for battery charger type detection
From: Amit Sunil Dhamne <amitsd@google.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com
Cc: dmitry.baryshkov@linaro.org, kyletso@google.com, rdbabiera@google.com, 
	badhri@google.com, linux@roeck-us.net, xu.yang_2@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Amit Sunil Dhamne <amitsd@google.com>
Content-Type: text/plain; charset="UTF-8"

This patchset adds a new time DT property to handle time taken by
battery charger type detection completion.

Note that BC detection is based on
"Battery Charging Specification Revision 1.2".

This patchset depends on the patch series:
 - https://lore.kernel.org/all/20241022-pd-dt-time-props-v1-0-fea96f51b302@google.com/

Changes in v1 -> v2:
  - Fixed the subject line in patch [2]:
    s/maxim,max33359.yaml/maxim,max33359
  - Fixed typo in patch [3] in body:
    s/conroller/controller


Amit Sunil Dhamne (3):
  dt-bindings: connector: Add time property for Sink BC12 detection
    completion
  dt-bindings: usb: maxim,max33359: add usage of sink bc12 time property
  usb: typec: tcpm: Add support for sink-bc12-completion-time-ms DT
    property

 .../bindings/connector/usb-connector.yaml        | 11 +++++++++++
 .../devicetree/bindings/usb/maxim,max33359.yaml  |  1 +
 drivers/usb/typec/tcpm/tcpm.c                    | 16 +++++++++++++++-
 3 files changed, 27 insertions(+), 1 deletion(-)


base-commit: 0fc810ae3ae110f9e2fcccce80fc8c8d62f97907
prerequisite-patch-id: c08696694dabcbb86b458a935a9cbbcbabb75672
prerequisite-patch-id: 634924883df820956acb33941b659e8c9ef85d1e
-- 
2.47.0.199.ga7371fff76-goog


