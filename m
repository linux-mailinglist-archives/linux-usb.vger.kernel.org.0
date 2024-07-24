Return-Path: <linux-usb+bounces-12396-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6DE93B7D5
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2024 22:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF8C3B247CE
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2024 20:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF1416F293;
	Wed, 24 Jul 2024 20:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YLXHRLuW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4623716F26D
	for <linux-usb@vger.kernel.org>; Wed, 24 Jul 2024 20:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721851948; cv=none; b=oFAlXaJzPjaByKSena9hvht808UAbzLXntg7zPg9dbz+8+YHR5wuI/slUVv1l91FG7EVSeLf7QjEGRfoyx9lI9cKe408uRXWm1RewWo1RWegi2lEcuGP6WtJXxD7k2FpozKC++DapeRXjhw23cGjVtKj5KFdewTM8OXE1x3Qed4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721851948; c=relaxed/simple;
	bh=ftKGBViUOgmYn6lD6rKdnKxeD3XcFNArhW8Gz6/ov7g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UO+UfituS9Z/gP/LoOBw9oIzfWrDftlN8h3MR7xiyMSbH1sEEuQ//ldde4WtP06qWWxu6i1v+GKI6RE7Ppx3XJsTS6olw3e849VB2yWtOjkjf+irJsY+P7PWhoElxtcH5ut9LyhY7760AGgir4deAXfUCEuv2mnOCkSR/anqGM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YLXHRLuW; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e02b5792baaso238530276.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Jul 2024 13:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721851946; x=1722456746; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=x9PT/6cjnR+Gnm6WIJzoVk3JaTZqlTM7UT6q82pMzX8=;
        b=YLXHRLuWDD0xy6ohmfotgN+90XuBk1tBb7fWP+wEPbP0/LwralxlcJxd62hBFFaSWX
         svuXaKhfVQogTbbKxk6YCLbAtEUKwXQSwnSfgsMUW0XJtR7hhbW1BnVIjMP7rErNd25J
         LCVq19pdRyrkXqNPE73bTiGPnutJ0+XJGp4fyLmKk3eaYs4ZDz5gA9WcHhLSdBydJmOR
         7ESiJx/OM6ePVqu36PO6rtWw+EV3/ZLReBsb09yWpet+98jqyKWrkn2oguTOntV97Yhe
         Zw96oJ9Ev2tVzpt/JLJTUE2eC+1DF1W5e2IslWtdWnXAirckIwPe6BDIJiEUhPoueOGT
         z9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721851946; x=1722456746;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9PT/6cjnR+Gnm6WIJzoVk3JaTZqlTM7UT6q82pMzX8=;
        b=sIhXliz2felRS0kU78Ywtts5i8U4NFDM5uRB6yp8T+vyatkBZRMHy58ACjUyRpD9QM
         XnpRPDo7zApanRwMkyWA0xzxXmJe0YPq7coNbd7SwKRaZ3pX+MOgqDof8t6D/WY7I5ew
         MUjgTTNAtqw08TIJfgvDqtgDa70OfLYryBAUoi1gjSQITa7rx5256+x/4fkGp4rEA1/3
         xzKiJMpF5fZ6Ov/LmZKOJqv//hz8YwUr/Yy1028GYVtgbbEzwYFiqQi6jk9AcrHeJB0K
         mTUFbhoeWCwpuIY3KoP4QwhpHq/b8jiSBSiGQL7+FB1wUj2BKDToQ/xz5xSpSg7MJHTd
         mVEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTm4ApGI/VHn0uJ80b/+NcYexVqOfuTjBMhhIjiYOVG+fEYRqRY7BG6xzwOKeJznG7pyuQrsnMsdqSNavVEMzFluZ+bkWHJVPv
X-Gm-Message-State: AOJu0YyTU5Mg8zEnVKZDVn5focfrbp0J3Z3+7uhbxl3XIL8kseimUhIf
	95pNMWUagxB8vDBNmZQgtB6cj37PZPUYeI+j2t1fmSq1v/d65a8ot93jSOSPSqmWUFUWkPQEWDB
	7WQ==
X-Google-Smtp-Source: AGHT+IEZtWnLjP/SYhqErAI4vD+nBsv+e3S+tTON9apiX87M2tONY2ATm4vpw94egaaQQU8IqgOAGcYzxBE=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:6902:110e:b0:e05:b006:9e12 with SMTP id
 3f1490d57ef6-e0b23239497mr30065276.11.1721851946331; Wed, 24 Jul 2024
 13:12:26 -0700 (PDT)
Date: Wed, 24 Jul 2024 20:11:16 +0000
In-Reply-To: <20240724201116.2094059-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240724201116.2094059-1-jthies@google.com>
X-Mailer: git-send-email 2.45.2.1089.g2a221341d9-goog
Message-ID: <20240724201116.2094059-5-jthies@google.com>
Subject: [PATCH v2 4/4] usb: typec: ucsi: Fix SET_PDR typo in UCSI header file
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, dmitry.baryshkov@linaro.org, 
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Fix SET_PDR typo in UCSI header file.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jameson Thies <jthies@google.com>
---
Changes in V2:
- None.

 drivers/usb/typec/ucsi/ucsi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 6a958eac5703..a0e91335da80 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -153,7 +153,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_SET_UOR_ROLE(_r_)		(((_r_) == TYPEC_HOST ? 1 : 2) << 23)
 #define UCSI_SET_UOR_ACCEPT_ROLE_SWAPS		BIT(25)
 
-/* SET_PDF command bits */
+/* SET_PDR command bits */
 #define UCSI_SET_PDR_ROLE(_r_)		(((_r_) == TYPEC_SOURCE ? 1 : 2) << 23)
 #define UCSI_SET_PDR_ACCEPT_ROLE_SWAPS		BIT(25)
 
-- 
2.45.2.1089.g2a221341d9-goog


