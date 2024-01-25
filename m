Return-Path: <linux-usb+bounces-5495-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 783DA83B62C
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 01:45:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16FE1B21968
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 00:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8915C80B;
	Thu, 25 Jan 2024 00:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O5ilmRpd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A59662B
	for <linux-usb@vger.kernel.org>; Thu, 25 Jan 2024 00:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706143502; cv=none; b=IMCO3DxjpJrOTIWfHb7o+41K2sTHNtvm0JxXdCWzzJHSLs1obm2HE76AzoCtCRQlwa43F7F4D62WT81kqZyUX1gYfWYPuBLiT9r0ZbStR92rsr2vRLUnqeMaO65BLMkYFDeUmWs639hn0agLeC1a8OH4ww/DyUZPzimIqgTkvtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706143502; c=relaxed/simple;
	bh=1Ub0qMCSBqSUX8wgOlnHabtJlPqKVHQn2eRwVX1V8h4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DdmGpMh7HkXTUuH+UcmQFzhS8lYYOOrW2RFYwDUYkgMyRJCgF7BVYj1fA1PZLbj0ukXNbLb3jA4Uijv/T/ragqTKn30+pTcIkOgS4brioagaHx87Vf9TRhPDPUmw3N5V4rykc5r9T4qVg3M8pQ6JTiFKIKkbca7jYoisVM8jY5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekpandit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O5ilmRpd; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekpandit.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc24eb17be6so10046931276.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Jan 2024 16:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706143499; x=1706748299; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VJjR2jV5qU9yB/wyVcnR/yaTWQ4dMOB892g68teFZLI=;
        b=O5ilmRpdS00jIkpr0Mj/tVA/FETxeA+9l2BRZR8nGjkDoPvYPwFQHxClfoKcNPkenq
         9WowNz6O7UZQWFq53fYNuPN7MonoOefpmDtQMmQWmI8267cZ4MEX1HcBrQH/qsgBQy/R
         Fa9yvKTGSvdb+T5xapUZEJQnkHVNRjnlPCW7tLqcgPHqiACE7ILiIGHjnl8aj9qX+c7E
         BNVjI3ZfJsvQZR1vp+oa5AP98/KjRWifkTE116J0ef++LJu301uTKqYIxjrP/Ig8neoO
         9NxGN/kyoVJccZ08c/hi6Uip3bCddxqWZr5NcW9Nx2Qy7e0ATMOwcx+GVsoe2Vxapxdb
         2PdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706143499; x=1706748299;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VJjR2jV5qU9yB/wyVcnR/yaTWQ4dMOB892g68teFZLI=;
        b=JtbqG0ypnHBDiVcnEr2nE5jnYY3Rva4fViV7RI0ZiXVXBFAC+l4O8Nes2DCFiKxapi
         AyKrxC7Ho9cdYM/LF2iS+wNsi9TG1OrPfKJTdIdTctpwrIjLTvmIR4J7Zfr7ocZQzHCa
         3/avi65k+Ff6ZWfT5DqpteLZWebAbCyQEdObcGp9BcnidXkfQiekikP9e+QElCG9gSor
         wAxWii42oJSJU4eywIYtsYRuHehUn5NhpBMj+O1wF42wmfjlUmajlL3PuDB8awiMfIvP
         8v9zh+JWBEykWrNYkUhEAs8D0Bd0jwLIisAqWVNVHrrwNOkz6yR9mGSeFOHzoW6Wo8KL
         biZQ==
X-Gm-Message-State: AOJu0Yy52+MbiYlII+ThBHRTHwI60rTIdKEUIg4EL1fYEqaKIoJuOFgi
	HUD1bSmsWpPju2EOwn6hG71Z3yjrOw444pJ4akdTPEB+G10SselavnPN53uzbMiDT50qdM5qsDt
	UnAVCizmEvpOGkw9BLPwE5llFqiVT+O7VEA==
X-Google-Smtp-Source: AGHT+IFThnUDHcVqOwc/fNcLzTHF6n8GCLiYUBEuW/ph4bODWoDy5/5fW5CM4Ts/6tPSTQGaLmAitsiZ9Vz9gmTMhSpkiA==
X-Received: from abps.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:9b4])
 (user=abhishekpandit job=sendgmr) by 2002:a05:6902:2587:b0:dbe:a5b7:a8d3 with
 SMTP id du7-20020a056902258700b00dbea5b7a8d3mr117632ybb.3.1706143499680; Wed,
 24 Jan 2024 16:44:59 -0800 (PST)
Date: Wed, 24 Jan 2024 16:44:51 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240125004456.575891-1-abhishekpandit@google.com>
Subject: [PATCH v2 0/3] usb: typec: ucsi: Adding support for UCSI 3.0
From: Abhishek Pandit-Subedi <abhishekpandit@google.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org
Cc: jthies@google.com, pmalani@chromium.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rajaram Regupathy <rajaram.regupathy@intel.com>, 
	Saranya Gopal <saranya.gopal@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>


Hi Heikki,

This series starts the work adding UCSI 3.0 support to the UCSI driver.

There's a couple of pieces to start here:
* Add version checks and limit read size on 1.2.
* Update Connector Status and Connector Capability structures.
* Expose Partner PD revision from Capability data.

These were tested against on a 6.6 kernel running a usermode PPM against
a Realtek Evaluation board.

One additional note: there are a lot more unaligned fields in UCSI now
and the struct definitions are getting a bit out of hand. We can discuss
alternate mechanisms for defining these structs in the patch that
changes these structures.

Thanks,
Abhishek

Changes in v2:
  - Changed log message to DEBUG
  - Formatting changes and update macro to use brackets.
  - Fix incorrect guard condition when checking connector capability.

Abhishek Pandit-Subedi (3):
  usb: typec: ucsi: Limit read size on v1.2
  usb: typec: ucsi: Update connector cap and status
  usb: typec: ucsi: Get PD revision for partner

 drivers/usb/typec/ucsi/ucsi.c | 49 +++++++++++++++++++++++++--
 drivers/usb/typec/ucsi/ucsi.h | 64 ++++++++++++++++++++++++++++++++---
 2 files changed, 107 insertions(+), 6 deletions(-)

-- 
2.43.0.429.g432eaa2c6b-goog


