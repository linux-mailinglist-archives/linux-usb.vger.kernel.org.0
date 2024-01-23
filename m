Return-Path: <linux-usb+bounces-5429-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94923839C40
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 23:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C460B2A01B
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 22:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACA553E16;
	Tue, 23 Jan 2024 22:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V8FXcH7a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF11553815
	for <linux-usb@vger.kernel.org>; Tue, 23 Jan 2024 22:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706049045; cv=none; b=Xw86onWOEsmVckPXRiEcamjz0bZHDEexVL7+bm3lVw+RqoDXPadqOrueJ72lPkU9Rn1KqOBcMQ7q4psW3Enuobd3hBTMEm1dfoDxPHdMRHVtWo0QAn3nBgqHTw0AjETvKiPYjxDoIwyuxdHOI38BcO86CKb3ggYW+Rr+27X7oxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706049045; c=relaxed/simple;
	bh=dBBITS9FO1ji6Tbp5hcqIAnNiL5zxOzeCbOePyJkuP0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=O3Efdau7mSShkQkpl1HfTlKvogpp7Hj8sOh9wfoXlkqVr/0c61WEj5p9wuzvbH2E3cTCJRAHuxdEbMPLOJKspFgZzCdL80sbVZ6bKok3zNECl7a1QDDxrYP6wbejlzRp0olCUpMqyQ6FAC8w6ybH1/eF4ph0SQoSRfT0AwqfId8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekpandit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V8FXcH7a; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekpandit.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5f53b4554b6so71364257b3.3
        for <linux-usb@vger.kernel.org>; Tue, 23 Jan 2024 14:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706049042; x=1706653842; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7Qx2jISN6WbjojC2jV3q1VojHLOX1qD9aHNvqQ5ekZs=;
        b=V8FXcH7anTrlVocZYTCZjJONtNctJdbTUssOyzVr9S3UZP87bOHxt2soQSH0mBrAgg
         a1oK2f/rpobrSj6WNqgbT1rXlkm/F+EsCRq4cZFVdH7bFVNMpXpiyObLOkqkP6tXiQHP
         E4VtpJ5bglpEUYtHbWI1TN/kJr653xu6yOYKdF6Yr/AUrMAGKadoN+2IZl76Vyj5IiPD
         vVKRiVrXAKXcjpnMwHBifAx9y/qLZj2CfTT67y3svCv2oh6q4sktdusami6IN2p2GfEv
         B5R2SGPC3fw25MsqM3/NWXdcI+qwTVJIe8WbH13UKdUHp8X2xZy7FVZI3iTqg+cqMFi8
         DryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706049042; x=1706653842;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Qx2jISN6WbjojC2jV3q1VojHLOX1qD9aHNvqQ5ekZs=;
        b=UeoNtXlsfWKe/Wt3r3tF6iCu7yTYW9SGmSpODjlgHAVrwhhVN+nJmNieJPqR7b1QUg
         fXK4NcTLgutLD7EJSqreaRgp7MKf8qeS812yNXRirjGu4xh6UZq6gH/zTn6cnhHEip9e
         iZXW8dUjy+GzYSTdABFkl2Lm4/hrBV7u6DabqkTgE8qqbGy1YURYDq7dmxre5jMajjjX
         vRpnkdYls5l6OZ0jsurDsbWrC10R5HuLf4tAayHeDRkem3hdEyjjwBR5mdGg+xWa63ko
         fPTKQCgmdiy5oaG1Bb4q3DofMeeUAAbzUQYUPfpQhvxlexCNizLu0rmZ/jydzvHr/eUS
         e97A==
X-Gm-Message-State: AOJu0YwY+q7B9x7odet4Y9eH34k38tMwAlpkKknvZrtFrmtvjE4JN2kP
	a4hZ9Kbgp1fESKqi+C2kIZnnvba2BVVbbml+8s1sQiMw+TURkO/Zwvf2H9aHrgUCbsgJ2Y6SlEz
	QyM4KqLaso9lgohDzlwCzr9W0P/GREjD5zw==
X-Google-Smtp-Source: AGHT+IGB0F14i78ehb8w+zWgRrzyyfOpVdBqKCpsudDfRkcBT5koahQk3yhFjaWF/gkifa7DHHNjaC1N+vTFW3RUI5WAvw==
X-Received: from abps.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:9b4])
 (user=abhishekpandit job=sendgmr) by 2002:a81:48c4:0:b0:5ff:5135:ffcf with
 SMTP id v187-20020a8148c4000000b005ff5135ffcfmr2338544ywa.4.1706049041923;
 Tue, 23 Jan 2024 14:30:41 -0800 (PST)
Date: Tue, 23 Jan 2024 14:30:33 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240123223039.1471557-1-abhishekpandit@google.com>
Subject: [PATCH v1 0/3] usb: typec: ucsi: Adding support for UCSI 3.0
From: Abhishek Pandit-Subedi <abhishekpandit@google.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org
Cc: pmalani@chromium.org, jthies@google.com, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Saranya Gopal <saranya.gopal@intel.com>, 
	linux-kernel@vger.kernel.org
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


Abhishek Pandit-Subedi (3):
  usb: typec: ucsi: Limit read size on v1.2
  usb: typec: ucsi: Update connector cap and status
  usb: typec: ucsi: Get PD revision for partner

 drivers/usb/typec/ucsi/ucsi.c | 51 ++++++++++++++++++++++++++--
 drivers/usb/typec/ucsi/ucsi.h | 64 ++++++++++++++++++++++++++++++++---
 2 files changed, 109 insertions(+), 6 deletions(-)

-- 
2.43.0.429.g432eaa2c6b-goog


