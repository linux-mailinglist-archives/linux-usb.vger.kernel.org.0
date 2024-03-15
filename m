Return-Path: <linux-usb+bounces-7998-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6918A87D290
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 18:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23AE41C212C4
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 17:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA3C46548;
	Fri, 15 Mar 2024 17:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m6luGXXi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331F43A8E1
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 17:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710523138; cv=none; b=SLjglKhePAM3iQPLMZSfHIFIbcGR6ivI7VtPlMbvXMqYG+ylHJ49842kqb3LBxLLwtx0FOmGuYqGgDcJgDeDTKv86d6k6O3LFaY71Ft2nIJYfoxwXsWPsH1MK84uhyJDui7mTi5nbEGM8zAwqE4M8gX1Cr48rZFwVfX1/Imrb7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710523138; c=relaxed/simple;
	bh=LjdE53DAeCK/DV4IGBzwE6QKkJ7zjfXL42DBeebkQMg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bcuUEJ3DouUvCEr96TRNPBAmxaWguH+qEWNxcLCOS1PH7aPrDBhd4QLtAzh9zf5JVdH4G2ufXZXqMtCPg5TcDMk6ss53yMbdOyXmqiF2a1RVRhFwtZTFVWWcUrKKByO+lRxN91b2+FBZjNblckWaFre7avumb/j9PhO+lsWzQ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m6luGXXi; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-60a08eb0956so37128017b3.3
        for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 10:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710523136; x=1711127936; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x+U5NBs6WRZY8QHIXBoAKLIZmwg0dfigkJKpGoGlj90=;
        b=m6luGXXi0PWusywGR+Lq/xkyw7xDaTzplPCL5M83eLqy8JEnPGZHJa3IRei94ZXlH8
         0DF2tBQX2dvSmk3tw0AEZXIRRYpwusZvxB5bOabQcjedOzF2WIngnXQX7HCrIRmtJuOm
         1fAAURqN2TgDvGu2lFUJUcoUx+j1cMpl4NNAfuwSbrJvvPv1Xv1f+B9yEuEjj678BrNe
         P0Sn0Ivseq5S6b+QrCzRPVIiwuycgY08AFb9N0elYfAlqejMwdZmcok0MIV1cV0uMpKe
         AFfNKUa4yvK2JigmPy5evrzujpIB9B7JmcOs7EBZ5xnT37/tehRB6etaq6Z9QoH2jdP/
         zscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710523136; x=1711127936;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x+U5NBs6WRZY8QHIXBoAKLIZmwg0dfigkJKpGoGlj90=;
        b=q8/JHXEcD/IlEksanhtP2iYGpnTQb3IO8tJ2Z7Y4ZaDqyoxGD6nhwtMa1zrOxNnEdP
         zTquha9bp1xoeGSr1gUI78VvXFrwbQrw1r7ALIu9wPabQ+QEb1yTTlpH5OJneNmk3/Kr
         Gt1nSi/1xPdDMduedGOmKvEwv3muaIdBvKFJJZX5amjcKKEBSsoeSln9uU/homN6iGFG
         Cb/jxqRbZNyV4uHEbXpZtPg5aiEJY2zezI13b39yh0FruR3Nfk2ZUE+UfuEAj2hLxr5b
         RPerv4ItXirtEHdldJwd1/yI127ofrNovPpUN53EbRC9yHXp8Y7VGK72wD7Axj+njKWi
         hi+w==
X-Forwarded-Encrypted: i=1; AJvYcCX6QYq6R+06KK9SOrWn7cje3Y4c8jOL0msj5yyyRprHwUdjOH/sFW9m0bFLpXLdSkUQGMxdOAepQVJbeYiL2BWUmSF8iDuSuWN2
X-Gm-Message-State: AOJu0YzKUIXw0fod9nYyqGFcgjUrTgcHnUv1EolTtNHHblk6YcG85D6l
	+rapdC03/cVr2ismgHE83wDN5lctJl0+nTPARpiQSWhg3q7Qfuo6bkNjXToJIzzCZ7aLsOKOXBA
	ORA==
X-Google-Smtp-Source: AGHT+IEJ7GpoKdok/Jv7P5V2DJOncHhW1qMA+O9OKiAgOc41iLcJp85JipwLdakV4XdThj9EjCn4ZDMQlmo=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a81:4ed3:0:b0:60a:5d76:a875 with SMTP id
 c202-20020a814ed3000000b0060a5d76a875mr890098ywb.5.1710523136230; Fri, 15 Mar
 2024 10:18:56 -0700 (PDT)
Date: Fri, 15 Mar 2024 17:18:34 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240315171836.343830-1-jthies@google.com>
Subject: [PATCH v2 0/1] usb: typec: ucsi: Check capabilities before discovery
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Heikki,

This patch updates the UCSI driver to better check the appropriate
capability bit before sending a UCSI command to discovery cable and
identity information.

These have been tested on a the usb-testing branch merged with a
chromeOS 6.8-rc2 kernel. Let me know if you have any questions.

Thanks,
Jameson

Jameson Thies (1):
  usb: typec: ucsi: Check capabilities before cable and identity
    discovery

 drivers/usb/typec/ucsi/ucsi.c | 34 +++++++++++++++++++++-------------
 drivers/usb/typec/ucsi/ucsi.h |  5 +++--
 2 files changed, 24 insertions(+), 15 deletions(-)


base-commit: d99e42ce6b8341d3f09e22c6706461ec900fe172
-- 
2.44.0.291.gc1ea87d7ee-goog


