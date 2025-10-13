Return-Path: <linux-usb+bounces-29256-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C7BBD6ABA
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 00:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 408944F00B2
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 22:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0468A2FE04C;
	Mon, 13 Oct 2025 22:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TDOHLq/h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDEA258ED9
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 22:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760396009; cv=none; b=aH/qj9Lgbhpx7d7R0ijlGfVobNzoCQDHh9Z9pH5AY3TgHquxZsjTq3LFObbGMyhM4SBX9i/jRwHKIgGQg7GCILCZlOtEJYRIcICJvt1VoRTq1VgOp4rUO3OcsyONdnlkakYRU8J9AbwLSURoJmjnzer0jAqlh2QrmNdGtOihspE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760396009; c=relaxed/simple;
	bh=VxDmSLJ7Pl58cmqGN/eTKyC6uRlD8Xhn1Kk5fyLUXYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AaqkS/bZ4kZiXMiGVW0uAd/2eMKgsHehwQ8ZgjE2aUmdO03lSLmr6mLsR5PndlE6ahchIs5mxqxQJWjTpoq/t23fnxgeZldbPntvtH22buAljQXuSz7BEltjb2Ptj2LvfnqY8vZ0RFVed2n+YEdwORFnAbG4ZtPx7VvS7gfUMXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TDOHLq/h; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee12807d97so3167711f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 15:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760396006; x=1761000806; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VxDmSLJ7Pl58cmqGN/eTKyC6uRlD8Xhn1Kk5fyLUXYk=;
        b=TDOHLq/hSaw2994qUBI6NuSlboNI53oBq0aiCrHz12nLpQiuCr3Kez3TOvJSJn8LFm
         HYdX2WfaOlDKikibLegCJlcJ2UgdInGHIuwVLDODo1JAshszMZb8ZNzlg18l+zPAkHXD
         SfdNfygJQKTuMVgmW15C3xwehuCt/fYeRoFn9Q5sdAq0L85XV6lAmTHsForZ1Y5hGSl0
         qmk9ylSvJ7uKaLyNi6L29j3VrgCvW1zlRsi6YqRBH3Ds03YnNnKjETKiA6yUX+Ul+NCx
         wIGdPPIWCnlegIQqVFF/EA3cZOBH/prjRz9FPRuCnuJJc6FR1Jpe5uKmEE+ozIB4acET
         0lew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760396006; x=1761000806;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxDmSLJ7Pl58cmqGN/eTKyC6uRlD8Xhn1Kk5fyLUXYk=;
        b=qqx/3/X7jQQO8GueEAW8Dkp3f+6EWXzyiS/LKzrB6aQ+/Tn28KzCXfkNTuUXBuDOoP
         iktZLakN7N6S1xtrMiy4nCX2S5TBhcLUmSO1WgLGv2Ig9GqkzIEB6TeIAilcddaqN/A9
         SWXGigH1nM0ir/dBeMgJ4kR39GG5MOmzT1x6eabiUc9vteUC3TY6/IrOcMt1L4WGtV1b
         BKF31FzcR8VPW6Ku/9TFL7zitTDrUQeUdNmbA2pQmCVY8Hepy1LUsHlfXpLqX0OVYgbW
         pSFcbWN+G4M4dHVBnIyF09j+1Tff5LhEMR45JaW1/d2i2oKcrzJTxuxrvHTa7YbEYnvz
         rFSg==
X-Forwarded-Encrypted: i=1; AJvYcCUhxCcWmUCLvD5G1m76n3xXE7/k7hI/2Jf6ZCSj1hJ3h/y5zXeFoy88wXXsaeTpV4EYw5C0g0bYqt8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk96H/v07pQsyRAp1i3Ee2wmyLNIQlymIMiTzy04SFxVqKKFCr
	n8MSgKi9kHm46KWvzvUUyvVbqPem600kzWZwWX3eTuhykPSHkW8veRN6DtD9TbJj94ifNrOw6nJ
	48H7Q6dc8Msj9+/i1T3Rdnizjhh98Iiv1uq1ZxomN
X-Gm-Gg: ASbGncvOww8ZGaa8HbmIC0ZnkWqFWewNd1QOun2S9P6NAASz2NNvr3/fs4ia3vI9TI0
	/ecivBvvOH7m9RZJWkwWY4a7kq4oudMaaYwgKzst0FY/26xf+1F5rZdodwakZC7wdUmcd47q3K7
	CSEODLZ64UytzGpcIyuy598N2wmXTdsbpSsqp/eJBz6af5PUHrOn8Tgl83nmjMKyVQfX2j4ErsQ
	wQX1cTJm09u7e1kY3Oye/fgcLsIUXdnh5P0nQ2VcCWMvb3rOkewjJeR51izsss=
X-Google-Smtp-Source: AGHT+IHN0t3NmIlHBzBN76m1atkXs712mA3WKLgcMNSupWFwJZ3i0jdFLSUHLWMjbly990ZrauvZiG0fi3+9cSLBVUQ=
X-Received: by 2002:a05:6000:2f82:b0:425:825d:2c64 with SMTP id
 ffacd0b85a97d-4266e7d6472mr16363020f8f.17.1760396005998; Mon, 13 Oct 2025
 15:53:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007000007.3724229-1-jthies@google.com> <92c821fb-537a-40e6-98fc-616941b57778@panix.com>
In-Reply-To: <92c821fb-537a-40e6-98fc-616941b57778@panix.com>
From: Jameson Thies <jthies@google.com>
Date: Mon, 13 Oct 2025 15:53:13 -0700
X-Gm-Features: AS18NWB5frOXzr6oF_XfKeFC8F4rRq6IsJiUPIJr2IgROQ85_BdLxUbQKV6WZZ0
Message-ID: <CAMFSARf8--QW9otZDFGE4yr9i_WjYuwehJ0cV3ioD8KZFzjXaw@mail.gmail.com>
Subject: Re: [PATCH 0/6] UCSI Power Supply Updates and Bug Fixes
To: Kenneth Crudup <kenny@panix.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	bleung@chromium.org, gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, sebastian.reichel@collabora.com, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kenneth,
You are correct that adding POWER_SUPPLY_USB_TYPE_PD_DRP in
ucsi_register_port_psy() is missing here. I would have expected that
adding it resolves the issue. I'll take a closer look, thanks for
raising this.

