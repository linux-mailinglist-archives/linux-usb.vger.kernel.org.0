Return-Path: <linux-usb+bounces-10210-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BED98C2A0B
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 20:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDA601C21839
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 18:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E785E43ADF;
	Fri, 10 May 2024 18:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cBUGftx1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086503D968
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 18:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715366614; cv=none; b=MnaGlTRisxCTBh2stSAnyXXnjGF+QKW9JzM2n/PXwmnIEqJPMNsuCpIyNnKN0xlK5rpS7AlHQ3envU10vWpbX6entqcHfUimW45vjdVQLpFTVvu9q1gcexXmW27JiWg0hsB7ia3Y+93pwWb+bSR2O+UG7R86EsQN1GDC1HEuYcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715366614; c=relaxed/simple;
	bh=Mox5CygbAp0hbnlUnK+vjkkchP3v4sLYbiSX1PaNIXM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=KeiD8eUfo3IIYm9VZCq+txMJ0jgbl0tbjkn0WZv9t7W8vfxbcFid8xCghrFkn+0BQbGcomJwQo7GzcrZqNrIQgZIf7unnYdwBeRS4KoUBVUK27Yxuqa8gX66W2TE70jW7p5QDxvTK/evlecXCm/5zIpYuI2OvZz2jCMMo/Qgo0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cBUGftx1; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-61be4601434so42813227b3.3
        for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 11:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715366612; x=1715971412; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LpXK4QtSXraUQ+jRpkogOhgYroQ8dBMsRdFzLXDbwtE=;
        b=cBUGftx15pUhg4NtQIUT6AIsOC2WXipxPcc8yTzbT4YToYXznSt+RvlfGwjM+GXi8j
         2EYCSvEt2L9bqc/tE02kb6waZGFZ76n2bPFkG/sf9KprSfZ4i4aB5HciE9396gvqOzXc
         J6tHLAtUCIBARxKcM35MrN9qVw+NMVYRZ2kDAevudML9WwsfRXhYtvuBxV+fyRwT3115
         I8ZjYhk4ibxIMf2enTUG+6x1ys/EpAvK3u+ZmwqjNjT6fQxYpEoMViuDZL5YYP+J7S6a
         nmMJlJMNVcES9ebQt2pS6pTbIF4UDFcVGRO1ZQDXHGkMEtyQw29q6u8WXUD8133DdmsP
         Rg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715366612; x=1715971412;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LpXK4QtSXraUQ+jRpkogOhgYroQ8dBMsRdFzLXDbwtE=;
        b=A2c0IdlV6tr7t5/N3PkUBiacobhUidFsvkOwQEvfTiXskIZbh9aZg8vhqBirCJdi3O
         giuwl51QGuSbrCMOB/yp5PopdmTDPsQriPjlftMLfl3PCBgVrW4q4XJSZayCAL+cbHl1
         A1aShpYXidSgRHsLUB+WEVUR/evtFKrj5vsghiEtz/She5LUbOQMQN7kvOHKN5q46miW
         NJ3QiWUEFCYPgAyATe9HCov2+lL4BlVtHwaK3fzNIxSiJbyVkxAqDUvDZDXPoR2Z/3fB
         gdQN+YKMJJfHiC+F1DwcdpNrmfqFXXOSnyEacQSNzcdseg+3LthWlO7yQgdSoXGkA3k2
         o46g==
X-Forwarded-Encrypted: i=1; AJvYcCVeTor9TTfVTgEhJrGCRFIKkOTlapv2X4Gt800lJauK3ddoFG3qwGp1gytr9Da9Vw2ZI9B0BbhzDCqbh/GWlL3AFS9I9E1mhF4m
X-Gm-Message-State: AOJu0YyHhXCHVKMhwzpfcsM5Fh1Ikjv0SQdTCSzB1xA2Xep7DvMej1iy
	9kLkEXV9lS1cHXhU+AcjwKC0xhFEVIhLZIw71NDv50hI3HIWNiBhn37udGvoLhlUpzhoHhSVWIZ
	B8A==
X-Google-Smtp-Source: AGHT+IG+48erkgdEz5uPmVNeCO4BkSFDKeouCWhPs6mrrdcIsWoSJL3hL/YwMVrHxyGIGd/WSyUsaAjFvsU=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:690c:3802:b0:61b:e2ea:4d7b with SMTP id
 00721157ae682-622affa5943mr8898277b3.1.1715366612088; Fri, 10 May 2024
 11:43:32 -0700 (PDT)
Date: Fri, 10 May 2024 18:43:20 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510184324.2944101-1-jthies@google.com>
Subject: [PATCH v4 0/4] usb: typec: ucsi: Update UCSI alternate mode
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

This series appliess some changes to the UCSI driver to help support AP
driven alternate mode entry. This includes...

1. An update to the altmode sysfs group after registration to make
"active" writable.
2. A change to the ucsi_partner_task delay when queuing
ucsi_check_altmodes to prevent it from running before other discovery
functions.
3. An update to always define a number of alternate modes for partners
and plugs.

Not related to AP driven altmode entry, there is an additional fix for a
null derefrence in this series.

I tested the series on a ChromeOS v6.8 kernel merged with usb-testing.
That build had some additinal patches to enable a PPM in ChromeOS. Let
me know if you have any questions.

Thanks,
Jameson

Changes in V4:
- Updates to the commit messages.

Changes in V3:
- Returns typec_port_register_altmode call from
ucsi_register_displayport when CONFIG_TYPEC_DP_ALTMODE is not enabled.

Changes in V2:
- Checks for error response from ucsi_register_displayport when
registering DisplayPort alternate mode.

Abhishek Pandit-Subedi (2):
  usb: typec: ucsi: Fix null pointer dereference in trace
  usb: typec: Update sysfs when setting ops

Jameson Thies (2):
  usb: typec: ucsi: Delay alternate mode discovery
  usb: typec: ucsi: Always set number of alternate modes

 drivers/usb/typec/altmodes/displayport.c |  2 +-
 drivers/usb/typec/class.c                | 18 +++++++++++++++++-
 drivers/usb/typec/ucsi/displayport.c     |  2 +-
 drivers/usb/typec/ucsi/ucsi.c            | 18 +++++++++++++-----
 drivers/usb/typec/ucsi/ucsi.h            |  2 +-
 include/linux/usb/typec.h                |  3 +++
 6 files changed, 36 insertions(+), 9 deletions(-)


base-commit: e4306116b5e93748b3eaa7666aa55c390b48a8f4
-- 
2.45.0.118.g7fe29c98d7-goog


