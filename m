Return-Path: <linux-usb+bounces-22206-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 152B1A72A2C
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 07:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 318FF3ADE34
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 06:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E68E1BC9E2;
	Thu, 27 Mar 2025 06:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Slx1x+X7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6163878F43
	for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 06:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743056860; cv=none; b=un4ggJsBbq5Dc/Bzt4nLPKKh/29L3SE+TJAcTO8reaMkCqurA7Z9Ro6kxhf5Pa4elbyXfASAI8mzEeoHKg94+TGmJpk4mq+nJQ7MKFv5LrY1bde+I30v4aC2G4rvG4AObVSaKJ5mkYE/MrzS3Yx0q4qQHDTtO+SdHpoUmNn7iOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743056860; c=relaxed/simple;
	bh=vNB55LLHsIzewlg4O3Bpq6Hpru+HJpGh5yavNpxEX24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7cgWfO+cSDF7gkMfDTX/x4HH7IKfvyTh7my7ZnsEMV4bs9i6AwRFzJ36fOi+L3/cxWKbaPhqiXs2xaD2hLFiRSEVKcdVVFx/6pMlo2r9RdAY/ASP0FYY/GTSUo5c++IZy+bJJ4k2FBnSmXvrfoWIImwt42bAVc0TyDBnNFG4pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Slx1x+X7; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-301c4850194so762725a91.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 23:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743056859; x=1743661659; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vNB55LLHsIzewlg4O3Bpq6Hpru+HJpGh5yavNpxEX24=;
        b=Slx1x+X77vv+lBm/QSo/JzDCg5zL3cE+6cCBpC5Bc8vE4vLaS8UZxH/mGc5tkh7PHD
         u8OaFfYX9eRqGiffN9GCxXgfXv3AUdb6YhuceWvYWMWAfUt6nKLoOAiAHzF5ZlxT845B
         qwnwdrqf8oL+k+bliBKFqj3oxl2rynksEqTdl6Px2APq5Et5xjnLFHHFO4XU1QnJRXQ2
         Y5GJie3APj8wN8RVlAeO4TRALaqhGjrUS1LA8UknXJ9RnOlTexp+YPIuOHpXEiqCyJlV
         7yubMZZX1d24EaVRZlQ+ZKl+7EVD3maOJobMB+YDq7kRunvauKf8rfQxALyKVJul8zsf
         z2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743056859; x=1743661659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNB55LLHsIzewlg4O3Bpq6Hpru+HJpGh5yavNpxEX24=;
        b=seKXyo47kuxB0dZhmdYPrbZR6wcD5XGzoMW5DHjtS/rZFk2wRyzh0oCNKIEQjAmUzr
         i3woCWic6RtepILxJ3o0JiECbqOJt/AFj4fjfYrg3b37w+Aruv56wmvbmP1B0aLaS/uU
         rBVXmzxWmSI2eOINTMMPgIYAfcucy+2yTig0O9aUDBhAXRlxlJ+eK48VthaK5lgqLExr
         Jn14ffTXFR12TMRM2pS598DTeMdNHErlMZQysAnjtjIICU7WK9/+Cl/04DVRgljXP3Ms
         gj0kmMYRhuFRLAMlO+TdsHQ7QHy0eyNbhQwhbxmVQIBV5YVOuH0q4EK82iGrxIPabR+H
         F7xA==
X-Forwarded-Encrypted: i=1; AJvYcCXOgHR4XNtQrKNtz7QHdwWpFY6YRNlXPRnqw2dzEt7wdnlnL7iQvFQ8PZ2oWpQhEYAhznPCMpij3u8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW9Ev7Ob6wkzMCshsQtMn7gC62wacuS+LFpUZlhhx4SSIn4rph
	p7E8TAQjkH7Kk9Rumj2kp0HKa27RSyKfbYhewbl0+tfaZ9AKVbugFkhTep31De/6qX7ODDsoYYp
	c0LGiP/6iqv8KRTFw7DQttSWilnyeEo8dGZ16
X-Gm-Gg: ASbGncs1JIkqXysyIh7AjYjkWQ3Ple7U0IT2b2YPpEkJ67LsT23v2F6B12DHo6DfnzU
	b5L6PFJcn2x1ypRLz2m0HQOfX0VyaMhffOrjX0qv/0JLhwq4C5iXRAyTlpbiXVpD2+4nsLm1IOF
	C7YYLvoYTRLVUd4BhBAn1rxjMtywhcw6usMc15YJeBnOaZjMPWtNfma0XG
X-Google-Smtp-Source: AGHT+IFt7Uet3UwCNOAH8meYB2W9ViJLDi7wcmCNPw9mSbfJ0sSbyamjROCSnSFkmO0FUw183zFiWc7Rnl9Qc4okr5s=
X-Received: by 2002:a17:90b:354e:b0:304:ec28:4437 with SMTP id
 98e67ed59e1d1-304ec284935mr218399a91.22.1743056858259; Wed, 26 Mar 2025
 23:27:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com> <20250319005141.312805-2-quic_wcheng@quicinc.com>
In-Reply-To: <20250319005141.312805-2-quic_wcheng@quicinc.com>
From: Puma Hsu <pumahsu@google.com>
Date: Thu, 27 Mar 2025 14:27:00 +0800
X-Gm-Features: AQ5f1JoUEAB76GccOuQU5OR51PoZ29U3C8QHFwNl_oTL2dvwjiuuxHuLDi3FutQ
Message-ID: <CAGCq0LZoi0MOJLJYUeQJW6EfOU_Ch=v1Sg8L4_B-KhdDCx1fCw@mail.gmail.com>
Subject: Re: [PATCH v36 01/31] xhci: sideband: add initial api to register a
 secondary interrupter entity
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net, 
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org, 
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com, 
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

We have implemented and verified the USB audio offloading feature with
the xhci sideband driver on our Google Pixel products. We would
appreciate it if this solution can be accepted. Thank you all for the
work!

