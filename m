Return-Path: <linux-usb+bounces-27311-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A28B37250
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 20:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F3A7366C1A
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 18:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A12370584;
	Tue, 26 Aug 2025 18:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4np88ZLg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD89336CC87
	for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 18:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756233538; cv=none; b=dvepM0gXueV6+wqJCbrQHqf5cISahDpOhWJcV/Yoo5c658gNncyGpUhud3DVKzaA0ymdX1Z+BlreWs/ZoR6EDYUKI6DnL3AP/gkeXRmKhOEYvDJT+27hU4q3Je7cIVBWxLVfhNDyaZrbPfbBXEqGqSUCMAxEmt8imPl3IfRQNLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756233538; c=relaxed/simple;
	bh=06jdW27mAIPRBmadC9Obk+RK34cpiAgXn9PuJx8myVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjD8oC9mLmHti09jQ71iwLwzW3a60dg02Z05Ot3oS9QxH1paeygcF4ssBZKn9Xf2TT1S9PcV3r9pBna/Pmb2ShKM27gsqXepbqf95rsND5FMoWCGZ97nU9Fc6YVzW4Sykqo9TUEvItAhoF/QGA04GA3Tu/X1grYaSecijlrYWVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4np88ZLg; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-244580523a0so59091095ad.1
        for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 11:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756233536; x=1756838336; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06jdW27mAIPRBmadC9Obk+RK34cpiAgXn9PuJx8myVg=;
        b=4np88ZLgYd03qQc+6huSoWZ8qYhBXOmi2/meJB6jH5nRw7LvpYZViOacMFrunlUhkg
         Dz0I/Zg2JfZ/Ydk9obh57WNifbkMxudPbptJg+UYLZQz9LyJIBdkpDBh0fnXFGMgHpRc
         Njv1ItWVxux541lA72eSzs63HzjXMYwplpcCDQZNnmLdDk+LluwjusnFDeukVDtt9Hd6
         jNNhu/1bQDx8Mi5YtELcQA0XFeZ0q1rg4cz+WlV6Wto4rScR/JR3pxVjUuOuKJ4cSO1P
         rMAf4ATPqkCbpcn0lrjuUDj2sisX29um2ig9Rr3SvSVcGEtqHnNxnVGkEUuSlsrsNZbV
         KBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756233536; x=1756838336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06jdW27mAIPRBmadC9Obk+RK34cpiAgXn9PuJx8myVg=;
        b=vZXYCVV1iZVAAUT4Gq6wbqgq9Kd5/abtql49v2mOUeemKyAvLjCxYYoTPSFDtQVM7C
         NNoKqdQbwGBedfbGn6NvXJl/38BiFZekc7VQO6klLWGhTPTAelY0rGaBGyyFOcZRawaA
         Op1thGgjaaNN0kWzMnV5dhlb5g8cI71g1IDKPe8dr2tEagj9yL8ZSVdUAxTqRw1Lqx5d
         cjB3Ak/2xp3EweCvLPcCy7LNxTzj73GZnLOjb6920TqJ5SiEwlPsAuMBMBgf4TxyWCtj
         nI/iYfAe9/wZ516YBcXKcGcLiuq08VXCEIFzUMSgDNjSseMy+qsJ3nfXw8RaoHaJCih0
         4N6A==
X-Forwarded-Encrypted: i=1; AJvYcCXCOCVqVN7GGwREuxnQjBBsGiHkYUcll010Ho9TrEYkC347XNO/uIHOf+sPUIoUV2Y1ZjqDW7SF80w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/8SkmyC/mgLOLY0iVSu0simf+kRQGr1oU5BHx43L6lXfv3KLD
	jNoYW2/JKos4+/RMZCSYuzDaqOHf882Pi2xTr8K5b+D9380UhlWQ6/QWCfG+pjBzEahEJ3aAjFd
	8ozpxOrg8ySgY5+9nIjcxF5QERxw12k8nsVfPE3Y0
X-Gm-Gg: ASbGnctFEtpn/Xo/jiqY4BTH/TEm8aui5rzw/veMMGFEcuhMiXtr99pvmfqI/JXxF1l
	CfDM4KZn/RRvacoZejoQIsRb86wEyemaILYkTHHw4OXqMqzYv3vA9x885crOTw1jk8gQk0BBgx+
	zY3e6EjkdOIU0UWlQu5JVMEHD1vdtVL/Nk+FQZEv5Sn1VBBtths/AbwqVWmY00Wb0ZlwGO8yL+x
	L6+4k4M5N7sNcx8/F+mMpC3LhDb80EBt9qsGsBzMk6FW3qvzyI16A==
X-Google-Smtp-Source: AGHT+IH5KjEJVhvCkQSabMFJ6Dgae7xyjx92todBEtX1cQ3584ZTM1rL7jIKPVZvYFP3E0VQrG7UKBtxiwCnzhW7MZo=
X-Received: by 2002:a17:902:e946:b0:246:461b:d46b with SMTP id
 d9443c01a7336-246461bdafamr192188235ad.46.1756233535777; Tue, 26 Aug 2025
 11:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250826150826.11096-1-ryanzhou54@gmail.com>
In-Reply-To: <20250826150826.11096-1-ryanzhou54@gmail.com>
From: Roy Luo <royluo@google.com>
Date: Tue, 26 Aug 2025 11:38:19 -0700
X-Gm-Features: Ac12FXziHtS4dfDITSUW9py7_9gScCCwvZ_1Krem7Oi7XWBIDVeE6StLiWQj7w0
Message-ID: <CA+zupgwnbt=5Oh28Chco=YNt9WwKzi2J+0hQ04nqyZG_7WUAYg@mail.gmail.com>
Subject: Re: [PATCH] drvier: usb: dwc3: Fix runtime PM trying to activate
 child device xxx.dwc3 but parent is not active
To: Ryan Zhou <ryanzhou54@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 8:12=E2=80=AFAM Ryan Zhou <ryanzhou54@gmail.com> wr=
ote:
>
> Issue description:
> The parent device dwc3_glue has runtime PM enabled and is in the
> runtime suspended state. The system enters the deep sleep process
> but is interrupted by another task. When resuming dwc3,
> console outputs the log 'runtime PM trying to activate child device
> xxx.dwc3 but parent is not active'.
>

Wouldn't the parent glue dev already resume before resuming the child dwc3?
Why would 'runtime PM trying to activate child device xxx.dwc3 but parent i=
s
not active' happen in the first place?
What is the glue driver that's being used here? Knowing what's being done i=
n
the glue driver pm callbacks would help in understanding the issue.

Regards,
Roy

