Return-Path: <linux-usb+bounces-25734-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF2EB031CE
	for <lists+linux-usb@lfdr.de>; Sun, 13 Jul 2025 17:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 399E13A7D9C
	for <lists+linux-usb@lfdr.de>; Sun, 13 Jul 2025 15:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76F3427AC31;
	Sun, 13 Jul 2025 15:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ecL2X6z5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8884B276046
	for <linux-usb@vger.kernel.org>; Sun, 13 Jul 2025 15:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752420980; cv=none; b=A15YXXsUa+vmUwBEeGgHfUbZv7HoukXifbXh2KFwacVPHdejc4EGqK5sOr+pQNrWuSNIDnW6IkYrduOSY+VyaLUzXzU01qCyqu07pZhAGA7xBy4iCoOM0tR77rEdOE0GVl4G6T50SdvSak0ZaHCpX+5ACsuiThv+XtJQZyrLBXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752420980; c=relaxed/simple;
	bh=OtLdzkDG9gZHNlIcuLOu7/T9q4f+G0GEG2tcZwLaGnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlHJeTwz3gLFZqs3o+Bt+p+cjEK08ZJi8m2pZb1/kttE1Y8E2bqSOUQMj6fJ93uxOJE7tQJV32FY3aUmjXMfsZyPDKIBpHuPawqLz1Ki5Q7nmI/j7IxyS0KD5u/m2cYcu+xsadMKYV4W/+uqscRfBOckUSe2AkqzCDjBfUx6+f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ecL2X6z5; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7dfc604107eso172873685a.2
        for <linux-usb@vger.kernel.org>; Sun, 13 Jul 2025 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752420977; x=1753025777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kgiAbctzHGEi6mO8tGBybGTaW34ebEGLyz6arvDweFY=;
        b=ecL2X6z5wxe+/rDwMRsCCOmn7wjtxCYR1e/tKS0h04SvOW/ryZIUi5Ea2Rz/5cTuNE
         csKBItce/kxfR07GgJz14PY1pWe2FSxYgDtiHGVfSefJAAvvYMw3eReMiNgQvORhvqu6
         MCWGDt7RHyYFyl+VtZAfofIy/HocTppqWjJ2hKIwgB1Jakiijf92RQfVGh+aCQiLDmYE
         sq8jgWwhjI4yrZKPlh1bYRqvYL303gvJS1z8cHANZXLgV2AVi8zWyfbAoGRQcmv173B9
         YIIDWhF/oK8jYxVHUzDiiXxZXIbf0E5gqnNIuU0NGDJ5i0Nm05qAgY2xWSGsHZ7U3kCN
         4Z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752420977; x=1753025777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgiAbctzHGEi6mO8tGBybGTaW34ebEGLyz6arvDweFY=;
        b=v3rBgYfPtfXl6LN0iHb4LZ9ubrEJlbzMk0bmlr5faxOwC0eV/JzZmetALAGh5j7azm
         +3ghBgJp93+WO5hd+E038vQLJh5QVenQ48MG0HDRTqkhE+OtAbW5qlYB8SRs+FU5Sb/o
         WzCEpaFcvcipEnb9Qd9WjWPO+SEzl7bwzlvgKPmME84JMAVIQOQorqmerF8eWUXTzvti
         uTHJYVWyp+W6L82G/7jT/bH82QARJZYB1m8iq/bh6RhkpYEDXyTYvUG4G3z2/w+seFeS
         UD9jsp8UeYr1tEpHQJ1X03/lXoUeDfAN2NXTSE3AX+6JbORrRRwxFs1/gY3+iXFYmHer
         kHKw==
X-Forwarded-Encrypted: i=1; AJvYcCXDqKDVnwzamnwa0LGhOwN7Ap3De9Fwr/YX+CtHMnElh7gxIlckb61dEO/FRNVXfWi1XvFtn5DyOQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyylarWGfCIzyohW/b5O8EJMGuuI5yycWLwCfSqk+NpHkSrBAkR
	g/ED2BAFK3zuq4JVl/zwTqrBpAVc1h0k/edcYasrf4zFdz7SxI11cBTP5Bx8oxyA7Q==
X-Gm-Gg: ASbGnctTzXpsu2OgEJLVJ2HX+EonOO4K0jGxkHvogvKOE/pJ2qWFuOD4dtMk1F4ZVre
	rQri9c0MNWXLW7TdzHpQCIilCw9nODQDlgkKlQGgoJz/cRBVdIpc96g+lZVM1+q6C6ydBWX7rhA
	D/a7FuP8F/68giQ+pTxrqb+9ff7YnEWw3QUKVKA/Gro0DCvEJe+ywPO1BixepUmAMgCvME9IOhi
	4PwV9r7O9ARncaNqa3Rm2fzhTvjE3BwywPsItk8c7cYuePV+32O5wAZUfM/UKgytN//1WpBibwn
	7xTVkuPttmHG8w4xtqkEA3Su2uqPbVh5+alXz7bocsvxVbeV+pnxRpFrq5jTmYwtfjFSNrtlVm3
	ca6sB1/Z7aAeDDvsUKi9YnnQ=
X-Google-Smtp-Source: AGHT+IH1wwMnrDCsai/j+oCTo/iwDmbuCxz2g1gw4k1wyFwG11dFtMcHLcsSkStUGinV21npPT2CRg==
X-Received: by 2002:a05:620a:370a:b0:7db:9555:d7ce with SMTP id af79cd13be357-7ddecd13a4emr1728874785a.56.1752420976509;
        Sun, 13 Jul 2025 08:36:16 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::401d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e168b4e2d0sm123910485a.90.2025.07.13.08.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 08:36:15 -0700 (PDT)
Date: Sun, 13 Jul 2025 11:36:12 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] HID: core: Improve the kerneldoc for hid_report_len()
Message-ID: <1c8416cb-7347-4a06-b00a-20518069d263@rowland.harvard.edu>
References: <20250710-report-size-null-v2-0-ccf922b7c4e5@kernel.org>
 <175239324234.1701499.15395216375379684975.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175239324234.1701499.15395216375379684975.b4-ty@kernel.org>

The kerneldoc for hid_report_len() needs to be improved.  The
description of the @report argument is ungrammatical, and the
documentation does not explain under what circumstances the report
length will include the byte reserved for the report ID.

Let's fix up the kerneldoc.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

 include/linux/hid.h |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

Index: usb-devel/include/linux/hid.h
===================================================================
--- usb-devel.orig/include/linux/hid.h
+++ usb-devel/include/linux/hid.h
@@ -1216,7 +1216,11 @@ static inline void hid_hw_wait(struct hi
 /**
  * hid_report_len - calculate the report length
  *
- * @report: the report we want to know the length
+ * @report: the report whose length we want to know
+ *
+ * The length counts the report ID byte, but only if the ID is nonzero
+ * and therefore is included in the report.  Reports whose ID is zero
+ * never include an ID byte.
  */
 static inline u32 hid_report_len(struct hid_report *report)
 {

