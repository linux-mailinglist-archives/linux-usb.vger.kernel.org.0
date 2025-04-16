Return-Path: <linux-usb+bounces-23165-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED215A90E14
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 23:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1336D460195
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 21:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9382376E7;
	Wed, 16 Apr 2025 21:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hesling.com header.i=@hesling.com header.b="Vexj+C7U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF3E234966
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 21:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744840577; cv=none; b=UdkZwpaDSoR6u6Fox7cNmrS/0mRU50XqJVlRlgs71I8Kzbal4xsrKZBIx2rn1MKp1TndbNfFnP6EV4/C5T/6H02Mb7AyaTS60xwJzRvWSDV7hiLwkDlB+BEZcJUBzbyvJ0/aBJcGSl5Uc/JqMk7KtzyviSR29piyrDlzcJRy6yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744840577; c=relaxed/simple;
	bh=rNJlO4/q80kk+PEPtW5ue8B+S2Qcu1i/6aKbO8a3aoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j9TrRmO/fe4goiUIV65M0bveAlTku8Ochr+XkQMBrLVEeWaUgFdW0M29W8WmRaBY+UYeWvBaziTmEUk/7HWc1u2EIGhI2xcVJAa+mDa+xjmhrw3BGiTIxWGxv33GfHHDfZ+miYXfxh1kNqLJbrllnZ/rpS9tlFWQoLg5Vd4LnPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hesling.com; spf=pass smtp.mailfrom=hesling.com; dkim=pass (2048-bit key) header.d=hesling.com header.i=@hesling.com header.b=Vexj+C7U; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hesling.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hesling.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736b98acaadso74056b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 14:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hesling.com; s=google; t=1744840575; x=1745445375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNJlO4/q80kk+PEPtW5ue8B+S2Qcu1i/6aKbO8a3aoI=;
        b=Vexj+C7Ul07JQBq2y0L3MzXMGWw8lqcRiwvvv0Hy+9AeJ5BM80EP3vopa3KHzoXMtx
         dXacwweP011CQBSX1KM0N2hyu9wBxnVX+x85L0BlRLdbtq45VuVqskKjrloi8TGZAVCY
         B4u/hgDj1STtVZvIb1Bg0aOU6zTDciOOQ5XaaPW2OeqHTYUauJLWgWWoPMzVAZIPd5TJ
         8Zx450dbP419MinyygHSiSbWF7VypD6baQc69dQDP9mRiJC52xNvZ4hgPzTlq/QNU0kT
         BstyTu/LwMUEHlx/kO7D7Y/sBcKfZWeBb/cCQeJPNsgcSTsKYLd+cmvn4ZbWpxClfZPD
         BRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744840575; x=1745445375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNJlO4/q80kk+PEPtW5ue8B+S2Qcu1i/6aKbO8a3aoI=;
        b=VZtyVO5OSfSop2JmQFtzWPtO5AEjo0RvkDlz011kSGFGxkhFrOActao2S7DnjL63F0
         aDmonl9vww9OngtGGh7TBUctNpUsHw4yeYgg+KFbuBJ0eFdChk2t+xx/HbRzR/Uj0Tjs
         +Nm5DH3cXuFOCrZ3q1S49UBC3lOiK2etMPLwt2hpxx1OqurZQ2nU6yCqZCnsrI8Ey86/
         UQdphAL8eeDWVbtL+vHHTNKSLURB/g1fB6vAGR1CYalFPEF0FqAW+SOgEJsOpt7tYY64
         7DWTfy+mzglMFR5iX61M5Lsj9//NHxciIgpigHozIIGJUtOcjGT1HifU8qQcDchWuPwI
         GoJg==
X-Forwarded-Encrypted: i=1; AJvYcCVeIeL/pnBNqd3C9OXaZ5SmTPaUS1WnkTLFRwvnVZHNDKu8DZxdqX1OrlpvXYiHDWIb0tRYwKYnGsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiIHzEyzKY3ye/4h6C/7WmbaJTT2wsB6AXDA/Q7e+8jmeQISu5
	6ALsweSIgQDuEMk0OyniHfpOZQKsQIxEy/2PZ2ZaYYlYg4uSd0hi4EyqeMjMfd0=
X-Gm-Gg: ASbGncutve9Bd9Rfwb+ctbJ9M3ERbn4LMDWoDO/MYz3WKnCz8RFQg/Pj/d5GTfEnrK9
	SVWQ+0neeAWQz53QXcQV3H+A8eckGmzVuLVx2cFN1TpJXI+alqnFztLhGLZYQ2RCba0BkEDeSIc
	IdHORwbZbmIp8UAQirA2VcyRJl1vfB36pudCMldA+4+kr/UbEXrnSCspcbEnRk1GUq4sQri9MD5
	EPAconDsxKh8/GmJYeX2pIaDRGCxcbqMhfB+lEBtoye22/u+UwDIWNy6a4ZlP6OE49DgZS0eAMa
	llOlKS5FCelFN5iaiPwcZ3nZEO482stF3bcAxlWCnagfJWdNmQ==
X-Google-Smtp-Source: AGHT+IHNgzQj47NKKgEqJD5f4I6iY7S3hMdvrSvGtw/poQtKH3L1W5/yAej/xvhEAAGShLlDJSIYQA==
X-Received: by 2002:a05:6a00:ac2:b0:736:3be3:3d77 with SMTP id d2e1a72fcca58-73c267c9faemr4932907b3a.16.1744840575375;
        Wed, 16 Apr 2025 14:56:15 -0700 (PDT)
Received: from craigwork.rex-boga.ts.net ([2601:646:300:8200::b8b4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230de24sm11210134b3a.136.2025.04.16.14.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 14:56:14 -0700 (PDT)
From: Craig Hesling <craig@hesling.com>
To: johan@kernel.org
Cc: craig@hesling.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	sboyd@kernel.org
Subject: Re: Re: [PATCH] USB: serial: simple: add OWON HDS200 series oscilloscope support
Date: Wed, 16 Apr 2025 14:56:12 -0700
Message-ID: <20250416215612.39029-1-craig@hesling.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <Z_9PssdqzDrAmgUb@hovoldconsulting.com>
References: <Z_9PssdqzDrAmgUb@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you!

