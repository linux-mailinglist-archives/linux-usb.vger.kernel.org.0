Return-Path: <linux-usb+bounces-19700-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D5FA1BCE9
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2025 20:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8A9616DCE2
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2025 19:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE692248AC;
	Fri, 24 Jan 2025 19:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tGCEBmVB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE2035976
	for <linux-usb@vger.kernel.org>; Fri, 24 Jan 2025 19:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737747630; cv=none; b=IdE/w0uL9wWjxrkZLR19K6Y863W4542cJCFEbSSNj8dts8xw76xL0GiWeY2HPEp2ISFpEsWKFlcmCBpSbQ1ZWibCVFi564tfNCloOai8d0J7hZQKDf/aBUWmHrjGzS9a60v/3hz3m1uotnkrBJZZoDtLaNBitXP0OJqS36kDAdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737747630; c=relaxed/simple;
	bh=7u/oXjBRZp/xICilidPMGfoO3yKFUNQrNcrjM+JLEOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A67Hb2ZAAXu4EfeknT42Jx5JqyQV3I7szD7DT4B/QvKSA8cVeP9QOLQ0QEwut7aJ6Kbi5EIpDiEGPQWlFr965oSYudIRNNthuwWguSD6/OQbPHODEGbjgG2bp7k0ufjIOynFa7N8pGkkCZQ2rVEh0+AMNcKyAkpeyzgEh8D0m10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tGCEBmVB; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21a7ed0155cso43558625ad.3
        for <linux-usb@vger.kernel.org>; Fri, 24 Jan 2025 11:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737747628; x=1738352428; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XeTFUke24YztL2UFTa1EA42MEpaJFIIZjeHmRdx9I0M=;
        b=tGCEBmVBW03gAbx7+KQlmgYSZMvK8u8SmYISov6WgHorPoEbbBNHZ0xaWmGm+HVjeX
         GccmBZtA0oPkLdoSFdZPjqfcbVRcuAlOb42D0CqqK0HMCpAPMUPz8sjSfJP2U6Ee2i1/
         PnvNHtUZl9zyPsJTeqarTq09Sc37B5nDW4y3DfwuxawW1c9NOtgLH7n/H3bomQyVts6j
         E7R2uEDqR71HSrwtrg4TPUT1fGq9r44nEJ5WG+D65tWlN3k8V/gUJ9dqj5M/7ZX9M1Ty
         VY5Z6jS/+5B/Ql+PELxs63tkuL+nlfxISRNRyTdvSsyAhKGN7G74c7fifH024aDuZSvq
         3a4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737747628; x=1738352428;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeTFUke24YztL2UFTa1EA42MEpaJFIIZjeHmRdx9I0M=;
        b=KopK/c/7wZoMxl96msNeXvmydYhjm9Qot8Yt1XMgGIEgDZSEbWWP+Ec8vI4i/ggq+d
         oGwBwZJ/PKmDyqbtRfqW1NPveGiM1xVsSv3L+b4KuC+PhIlrYRwyZoDC+ckBW825hw5J
         AxegdeiHwIXKzHnmf3wktRlKTiGCZPUDFur6wbvY+H6jx3PMw3j5KcBrsBSglYdKrSxM
         dZiZtk2HqxtbzYTZ7XFGeUMkfhflCaH7n6Cn779T/0IYDxzcqNj4UV0mrNHjBE957gNP
         debWt391Oe+nt1d6TH3NftvZbKczT16DDs6OIXQybNGdKGOSo3oXeOT/QvAZx6M4y8BL
         E/PA==
X-Forwarded-Encrypted: i=1; AJvYcCV5uX7IOtbPv0QyCXlWXsjzIUxD/ADFWCvvVMCljj6mOscIFeTvTvhjK6kxGCXoRRzkkYu0RRZ387Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOaRU0//b9RX6W2jhPnbEQNm38Hqx1ErnXW9yfM7byK9QTJrFw
	Za1uN+5+EfuGkbFrYnWnE0GjP0L+b9ApTfB94cOGP/LVWDYI7MNxrKgDnir0Bw==
X-Gm-Gg: ASbGncuz9dyUzAXc5EiE5gjGC2xBRohGYCEx6LMyxBakYE9BgKN7h3LZS4KVxEC5Llx
	KcglFDvcsN6k2tHMTIwCYQcPMcb7xw4DNoT1R8hDwYawWEuYXn70ff4+S0Se10Rnq89GUvLrEyI
	pWfJlVr58p+ncdAbDH2JS/BhGaipY9dC/zVIOhFGFfrke3uf37QjC/5DA9DZ75KcCtDOuve8P0m
	5TsAFuGU2IGa2PHyWKmvTRDuzmcldOnlXYd5aA3POrOVovw+YKCBhThE49hTB98y4WH7rBcEhyq
	WEAzlq4YN0Ats1n27iWDitZewW7+QC8vGTKTzVu4ufvwre+TWDs=
X-Google-Smtp-Source: AGHT+IED3i4wnCoiLFROaAx+kXZsYkw8NBVlPE2QiqDLo+oCmVgIvJn05HRKiZA5a7lTiHsXuu3C/w==
X-Received: by 2002:a17:902:ce8a:b0:216:32c4:f7f5 with SMTP id d9443c01a7336-21c3540c7a1mr484270375ad.19.1737747628323;
        Fri, 24 Jan 2025 11:40:28 -0800 (PST)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414db35sm20118915ad.195.2025.01.24.11.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 11:40:26 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date: Fri, 24 Jan 2025 19:40:23 +0000
From: Benson Leung <bleung@chromium.org>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	abhishekpandit@chromium.org, dan.carpenter@linaro.org
Cc: bleung@chromium.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, akuchynski@google.com,
	ukaszb@chromium.org
Subject: [PATCH 1/2] usb: typec: thunderbolt: Fix loops that iterate
 TYPEC_PLUG_SOP_P and TYPEC_PLUG_SOP_PP
Message-ID: <Z5Psp615abaaId6J@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixes these Smatch static checker warnings:
drivers/usb/typec/altmodes/thunderbolt.c:116 tbt_altmode_work() warn: why is zero skipped 'i'
drivers/usb/typec/altmodes/thunderbolt.c:147 tbt_enter_modes_ordered() warn: why is zero skipped 'i'
drivers/usb/typec/altmodes/thunderbolt.c:328 tbt_altmode_remove() warn: why is zero skipped 'i'

Fixes: 100e25738659 ("usb: typec: Add driver for Thunderbolt 3 Alternate Mode")

Signed-off-by: Benson Leung <bleung@chromium.org>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/typec/altmodes/thunderbolt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
index 1b475b1d98e7..94e47d30e598 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -112,7 +112,7 @@ static void tbt_altmode_work(struct work_struct *work)
 	return;
 
 disable_plugs:
-	for (int i = TYPEC_PLUG_SOP_PP; i > 0; --i) {
+	for (int i = TYPEC_PLUG_SOP_PP; i >= 0; --i) {
 		if (tbt->plug[i])
 			typec_altmode_put_plug(tbt->plug[i]);
 
@@ -143,7 +143,7 @@ static int tbt_enter_modes_ordered(struct typec_altmode *alt)
 	if (tbt->plug[TYPEC_PLUG_SOP_P]) {
 		ret = typec_cable_altmode_enter(alt, TYPEC_PLUG_SOP_P, NULL);
 		if (ret < 0) {
-			for (int i = TYPEC_PLUG_SOP_PP; i > 0; --i) {
+			for (int i = TYPEC_PLUG_SOP_PP; i >= 0; --i) {
 				if (tbt->plug[i])
 					typec_altmode_put_plug(tbt->plug[i]);
 
@@ -324,7 +324,7 @@ static void tbt_altmode_remove(struct typec_altmode *alt)
 {
 	struct tbt_altmode *tbt = typec_altmode_get_drvdata(alt);
 
-	for (int i = TYPEC_PLUG_SOP_PP; i > 0; --i) {
+	for (int i = TYPEC_PLUG_SOP_PP; i >= 0; --i) {
 		if (tbt->plug[i])
 			typec_altmode_put_plug(tbt->plug[i]);
 	}
-- 
2.48.1.262.g85cc9f2d1e-goog


