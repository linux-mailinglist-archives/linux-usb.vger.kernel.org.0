Return-Path: <linux-usb+bounces-29419-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D553EBEBB99
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 22:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 458A4583726
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 20:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC243271441;
	Fri, 17 Oct 2025 20:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SnIFHLZZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC6F1D5CC6
	for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 20:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760734117; cv=none; b=nw+XaJBOXo+J3TSB+wqIK25PFbmtZ2VxHGCS0yYRibXh1gYN/8A2ALKDx0y1byogBtHyyZXNJJoE4WtS87TyChPrD1Z0nhPwewgb8ikD6e/OzCfuZNXbiGqNCHVwfdVTzMiB10Ojksy5SaS+BMqY0CuVxK5Dm92snYh+O5Tfp3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760734117; c=relaxed/simple;
	bh=oQ/gGtYvav+gWWdoIlX8Zb6LNC9cOW2UkrE8R2Ydnos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEv++JUYPS7pnAdpcby6pWdgmTQ1z2W/OZNPK1zyq9liVbFexGUk55PuN0ja/u0nVskUIxaYWZrO6kgbipvJMOeL08xzxtLf2eEk7530vDk8+2LMPbUz11KVcunHxryMxkngxidVBnRGZMpa1iA7owJ4Po9zw7QB8J7vBLELBOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SnIFHLZZ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso1648810f8f.0
        for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 13:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760734114; x=1761338914; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oQ/gGtYvav+gWWdoIlX8Zb6LNC9cOW2UkrE8R2Ydnos=;
        b=SnIFHLZZs7YhF2m0vcAe6oe2xSQE7X5HerxWIZHUhyYeXUfr/vpSeIuV2rCIv4Ej1Y
         ZvCk1M9UfrxvmkrBhjvhTfzrpcEjQ5i31aiY1TEDK9+gw7ES+bcHEB9K4Qv2ZL8lFwau
         w2onrMDpEfDdqPAmxo0vDNbqdxfCYANz0jtb22JO+be/pGGXtDJbiEhV/qr66XMN/Xi3
         qaVkTy6tgfAXQs1ioibH64ugtYfJtBOZPzPUTpkcUIpSrZjsL7yvUQDdeHjCTLlv+kp1
         0TghXFfBor0vE/LkNvPq1EqIl92DvkMBSS8QuROhu/tsu/pJEJFPAn4nSNSLPd9Ffx5z
         06og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760734114; x=1761338914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQ/gGtYvav+gWWdoIlX8Zb6LNC9cOW2UkrE8R2Ydnos=;
        b=TqkulrJP6wKKNE83aOYMSO/6l/sGX+gcg7r+25OyjYn7z4jwtR4A+nfbKac5JBD8jn
         kVU86L8+c4qth+jH3yaslPR7nsSLMWFF7q7gabEZ3yvP+F0WQbnyg+/9/M3Q4Li82Nww
         3m7umFG2+Yhs+IzoqFzyJjnM1Unq8KGcDbFjMeeMvBawranvEGuhrgzh72FqN5wpaE3A
         7Ljpv1MuHMCwOOkZut/hZ1eWs0adIXznrAo3ktS6ivK1QZ4raKceUz1ZRkJqYKlhsBVT
         KmXIu4zkYkejNYCi/S29h58kd6n/1S7Nj+k5nqf45sO3thGRgF+D++WDcWbcGncMokxu
         LnxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn8aDjcqEb5y86dhTgIQ3596lPlZ3bgONSFqjsyjVUL4h2GfeWPloeBLpKPcmLfdakIfviDlnSWk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS/b8LRs9ujI2T7sbvB6GrIH6ELs4L9LRCUT96h4bjD/1Qkork
	2CyrEPGyOQtQl74SZp+PNknyFAXNVlF3GxmTiXCssczRfCdrwx6xRYyKOmAQPvv4Cm8k6u4o63h
	29dyO4GVM1z6f411M23w3JwRQ0HthoDoJPaVsRc6w
X-Gm-Gg: ASbGnctOV8pmZ27ZIoP3Ebq4VdPKbwqnIHn9KvKInMhReQNio61DG7vio2yiywbOyzV
	ir0O92lbUUGu3Mm8x/I1xTCI0e+s54loSvG0b+TUQ6qL3D5WPbkce1sIIahV0P/kuJP0NFGY/J4
	zq0FiAq0416wK1whoIgiweU+MVMWF3uu5i6DBw5fRSjC/gj5lalYZoDiBmVs8pY082l4EJDZxyZ
	h+0T4bKAx8HjinYGrNH8rvw0Xz4beecn442BV7Bvuu3CKxS0XZ6e/VPtB9sctANTaXjxtjYc7QL
	bj2d0m7f56t4r8dKIplODks=
X-Google-Smtp-Source: AGHT+IHAavia4dajmjd1wu0ozenk/EgHnS13fnhiNCGOo15GBQoO3qzrk0f46KUvjIzbKPhJBuIwwZghoR1ZvbV+ZV8=
X-Received: by 2002:a05:600c:681b:b0:46e:4921:9443 with SMTP id
 5b1f17b1804b1-4711792a6bemr42023365e9.37.1760734113965; Fri, 17 Oct 2025
 13:48:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017000051.2094101-1-jthies@google.com> <abd715e2-6edd-4f35-a308-d2ee9a5ca334@panix.com>
In-Reply-To: <abd715e2-6edd-4f35-a308-d2ee9a5ca334@panix.com>
From: Jameson Thies <jthies@google.com>
Date: Fri, 17 Oct 2025 13:48:21 -0700
X-Gm-Features: AS18NWBOVLDYxDh3NOr1aYj7ImsXftnVZMr0nHmHk5U7INnmD_I0toUf4vs0lBc
Message-ID: <CAMFSARdUMJ3WX1L8U-2k1w7kmH8Z4y7=MKKEBjCmyY-94wiBig@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: psy: Set max current to zero when disconnected
To: Kenneth Crudup <kenny@panix.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	bleung@chromium.org, gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, sebastian.reichel@collabora.com, 
	linux-pm@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
> Subject: [PATCH] usb: typec: ucsi: psy: Set max current to zero when disconnected
> Link: https://lore.kernel.org/stable/20251017000051.2094101-1-jthies%40google.com

My mistake, I'll send up a v2 adding the appropriate CCs.

> I wonder if this is the reason my (Kubuntu 25.04, FWIW) system will
> sometimes show the battery icon as "Charging" even when it's discharging
> (or nothing is plugged into either USB-C port)?

The update to set max current to 0.1A for BC and default USB operation
landed only a couple months ago. If the battery icon issue is a recent
regression, it's definitely possible.

