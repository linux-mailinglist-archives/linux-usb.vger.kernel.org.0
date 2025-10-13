Return-Path: <linux-usb+bounces-29249-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8CEBD63F7
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 22:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EFDC04F5CB5
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 20:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869B82EF654;
	Mon, 13 Oct 2025 20:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wvAVBQqs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B63622A813
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 20:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760388365; cv=none; b=e7Xq5r8wSi5KzzAwtlT2CoWOEJ0N6jyUa3M3YihU/H563130LKFGnNILsU0Jti1NOfVebFt3k3pD15WCk9Rv0oyNVkvkj078sYGeC8c2urIv42LGSRnZEDBRRddhEo1cj63iA6KOFlCgbTLv/oZtd8GFYl/kdKDyBWzdWOkpzlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760388365; c=relaxed/simple;
	bh=99QjUoMLoVQrhY3mrpehmIsZka20aMAz1lwH7oyNwYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CV8XsKTMcCLIC8tiePtGI7xgwgx8WUtDnUT7dpyof2M980CIqUlb0nlDB+3XmcMBX4qN/zQGpBpMJe44XvDaBFxzhcpnNYd7rTzl9tMdy4tXGhWE+El9c4M1ZsP+eaQVE7+yWtKvJcusHyJaOvAUl3mjC+/4iNqjMs1kFxSixKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wvAVBQqs; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so3373114f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 13:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760388362; x=1760993162; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=99QjUoMLoVQrhY3mrpehmIsZka20aMAz1lwH7oyNwYw=;
        b=wvAVBQqsbnTT+WQ5q1j+wr4/lzjUSLc5g7rQSEGuDNyJfzOLoVyRb2XI16zXEPFpXy
         +7S0L6Du7zvvISBuz7nuDsZMLlw8a9W0vvOpib1w22wjJML1ckNOzwI35p9P4pYG+Tf8
         q2YDy+mzta+G3RpYdmvwGzgVZqCr+yslcCMONFq+V0+nmMFDZZ/eGaKblLBhNO+W9QlS
         6Hvj5XVBX2bPv0fU/wb1gJeO3z7B9KvV+rL8JVurZfmk8AYrSPtm1LOr+k7oFXWy4W6q
         VoVKp5seCOSr/acE4y9cQmhjeqQji/kZk5602k0lEfN4Muc1GAWDdoGAkMfYuIVTwBI9
         OWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388362; x=1760993162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99QjUoMLoVQrhY3mrpehmIsZka20aMAz1lwH7oyNwYw=;
        b=NYZ+LqUOr0MpBSch4Y8FAwuWbdrJJnORv9njc8dfY0rVG8SuuFPBGpKr/GdyWmtUhq
         S/eHn9x+Cj4hiqyQdQQpJC1PMeC/Ryux7zj2sx95uWuR5ClQbSpWJTKC8cF01rk/6aDD
         O8a2CZB+TbaF2bYQ+N+EvqpU31kIlNiqu8dcLNwGM1tN5/WptIATtyPLAF0l08wfbjvn
         WtioIdu1HhkxYP1S5mslnuhag6yZW3CwRtjgKJfggYl76tQrGRR77sjK+pIO+lxgTqz4
         Mufix9+ff22+qMDcm+YOGvAbON30mXr5C7zria4tfAU51wYFmU8PurrVOqewt4FyvseM
         25vA==
X-Gm-Message-State: AOJu0YxgP/OCFZyXIbfY8eDrGSMbyvmzijd6+sh2XbPFE4djs+8zo5DF
	ph9m5ZwiOApbc/8xqcWvrE5ADM+DVN3ERnDLq553TllYBt07plh+F0s2YKQdBSY4jla590c+D+4
	MPPSHalKEBPcosXDJSncZWkFDzsSnzjNVjQpolVz3
X-Gm-Gg: ASbGncu98tD7/1ESbdj4ThbTwS8BJG/8kG3leY3pq8d0YXQnc8SgzWaaM1uX+HV+hgq
	KqQEaDmez9QjpHWfcvthkxHDrvURr3FL1tjGnZai3QB668+qf4FNML26rOmFza2ADt5xSeM1txc
	+7rmcqdhaBu7+wbOb/b93uFHwRRdGU5w8WUypRM5V3aZY3ub1/4OSM6zRtIUJlh2Y/HpJd/sfDD
	xFrurBtNMmbNOM1JW5DsH1/Np4+QMeUAk9po34rl2ykqjsFiVx7YtyNje+xfmykT89kZVZEvQ==
X-Google-Smtp-Source: AGHT+IE8TROKuhNVu/BWqODTDcSV9rDf2MBMkLJcEl030I+lvoxpeDpI1cmeAFlCMdh9HW11ihmrMXGez5UzLgpHrN0=
X-Received: by 2002:a05:6000:491a:b0:426:d53b:4ac with SMTP id
 ffacd0b85a97d-426d53b05admr7436865f8f.36.1760388361662; Mon, 13 Oct 2025
 13:46:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007000007.3724229-1-jthies@google.com> <20251007000007.3724229-5-jthies@google.com>
 <aOZhyhmIv_d_knXK@kuha.fi.intel.com>
In-Reply-To: <aOZhyhmIv_d_knXK@kuha.fi.intel.com>
From: Jameson Thies <jthies@google.com>
Date: Mon, 13 Oct 2025 13:45:49 -0700
X-Gm-Features: AS18NWChD4MSZ1x95bfLrGIqzvRKmQSlLAN19rWkyqbygoElJEKAFbCC0PRVrEQ
Message-ID: <CAMFSARctns_u+65pWH8+j65bv74hKcqFBgbZzCEH2PO+PQ5+SA@mail.gmail.com>
Subject: Re: [PATCH 4/6] usb: typec: ucsi: Report power supply change on sink
 path change
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, bleung@chromium.org, 
	gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, sebastian.reichel@collabora.com, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> How about:
>
> if (change & (UCSI_CONSTAT_BC_CHANGE | UCSI_CONSTAT_SINK_PATH_CHANGE))

Thank you for the suggestion, this is neater. I'll apply it to the v2 series.

