Return-Path: <linux-usb+bounces-29136-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 28570BCEC5F
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 01:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C01634F8AA5
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 23:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6C22D193C;
	Fri, 10 Oct 2025 23:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="08jTALD2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086B92D1936
	for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 23:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760139774; cv=none; b=TB2ij8rTAASoAyt9UehNovXwEM2/KtmONLCm68ptjlHRhBjiA8dyWUbtFfX9PvvXeyiIhVtqWplr1IaIWh/RKXuKoDX6d+Sqfjn9GaCEomR3EikUmuiPP5Ve3eR2A+BCYSHtGORfIDpojWoMZEwBP50HEWdK4TJmBsucOukWyns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760139774; c=relaxed/simple;
	bh=1DHRMQqIywXJrr6QTGXP6duk0tt6J5QON/Qjub4crf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+qVqG8fSCn1/SXi69P139dcEMERj55TSGdt0P2Qwx+My0wpxx3mY/zG6UAeJqL/n9OvwZN/d0r9dVIU5i8XiPhBuwObY7/Xn9VTvkP8B0AD4GWIG303LjIxq+SUvJBTFa0W0oGUFjQ3gJD53xi5920Nb6sZ9Zi+PoWG4cctfCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=08jTALD2; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso1876524f8f.3
        for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 16:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760139771; x=1760744571; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qjgmlS/nwdme/rqi8+Zl0mMzFEWA0WaAZGElUraE+oY=;
        b=08jTALD27JrtJOANd7g3q0Q/bboL+rjTie/jvR4byY1apN6kr269mfn7dKjWFOCn/P
         OFvzak+pK90w1hRRSo2T0TFyYFgHz1wWTSNylclVcKy5vRpE9UdLBQp4CyXoPwmvex+5
         eVHc6s4yfSxm57vIo45H5iuo8IJCsTciHNZTeAPXxzds4Pi7PWpGnub2QhyUOiQ/qBTx
         dj5zNskkkPXvzoNvjWUX4wjMrtYxjX8hBecNAlkykyTjTUjEyCWsXEo/mVU5j+rfa0iQ
         7wpMZP/jYDVvWJpDifp7yyN8pXOiAtNTy9ntK3rv1WL/30dMuUA7Mh6qghgJSVV+L9Z1
         eY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760139771; x=1760744571;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qjgmlS/nwdme/rqi8+Zl0mMzFEWA0WaAZGElUraE+oY=;
        b=BiKn296Az0iyoftdX0Szxl0nb4WrMO/H4AC/gLmeP74mWeqk2ig2/b95tGs9cplA4r
         cm2e4nqKZpiIsNI0bfSX05zTOZo6ohjTJXwRhz+fXivsXNurxU62EAr8EeaFWr94S/nQ
         aq1tuSlaa0NToIzgIWXbAWwhK/QRSS1paODJCaNeVDmkONumOC/L8IoZiup2THUDBqbQ
         mI7rN0M+VL2G4af1ALq5rN50vJ7VrhoGOhwexloS2UsSPjT3zzlmHlrXgcX5qK7q7Zx5
         rMiwBSKGAsJhpLOQ7bo9kR8PTD6bpk/F33XmgbDSHCGYE+9BUTuhluvRR2OsGP98k+Ot
         yugA==
X-Forwarded-Encrypted: i=1; AJvYcCVTs7cjI/IKjBaxcwMK455zZhkb4ejy+dmno+BHEWsSsFSZcKJdNgzZ+rVUD47ydSLkFLvIIJ2j9Lk=@vger.kernel.org
X-Gm-Message-State: AOJu0YztJxl6XY5xPvYrXt90kAaZbTxw0V+/LerXPOUJv6f/XpI5pKAC
	4qqbFNVXhCtXlK0Wim+6S0rnMCeAIaKZi/M4yn5xFa5JI47DnbU24p2SRp6Y8UCgdwBRgODqfCn
	7TL93m72DJObFCz6niw4n020cfJxfY8cXFJU7xQVX
X-Gm-Gg: ASbGncsEvS4oN3jylXb8imMa34Cyk1pQip6yt14RVR9sOMGbrXBFq5ruOALqGNhCjtB
	rxtf19HEwXewBAJ1HYckTgaGmwJieD7muqKdBEbUsVBTucCTasl+8sB9KhdokOQ9PiuecGuVVeJ
	95cXvIcboDoSnwuGvhfpGh5eGsy90Jh+rkdBqgvizuLM7thsNXqXKJsO2y7DDcH9LiKmVi05qYC
	Gs/lEeEPNWosF0A5TcDfbQOurZ0SlxMVcpr4gAe6zulfbUhdzTBuoD9PSNvjLV/r6LI3v1UPg==
X-Google-Smtp-Source: AGHT+IHwk0C8u8+BGJMJhnPgtDgiHfihQd43A30Zms6p211AfNBUz2Fb03qCPj3iq3U+g5DYO0xAbnnUFf3zJMfbsts=
X-Received: by 2002:a05:6000:1a8f:b0:3fb:aca3:d5d9 with SMTP id
 ffacd0b85a97d-42666ac39c0mr7811026f8f.1.1760139771103; Fri, 10 Oct 2025
 16:42:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009010312.2203812-1-jthies@google.com> <20251009010312.2203812-4-jthies@google.com>
 <zcs3utvlaac336ezw2y7mzbbjsqocbls3e4nx5sc4tufiig475@cekebowcrpmz>
In-Reply-To: <zcs3utvlaac336ezw2y7mzbbjsqocbls3e4nx5sc4tufiig475@cekebowcrpmz>
From: Jameson Thies <jthies@google.com>
Date: Fri, 10 Oct 2025 16:42:38 -0700
X-Gm-Features: AS18NWAbdJz1C0NgiYf1yQNoHH17CeGVC6GnFq4ht1hoOI5sdcoyeMHRLCTzf2I
Message-ID: <CAMFSAReOGgXAKsTPiGi55t2Xt=FsKu9FAznmYzDU=i71N-GTyA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org, 
	robh@kernel.org, bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	ukaszb@chromium.org, tzungbi@kernel.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> It still can be a subdevice of the EC, if it has a correct DT node.

That's correct. What I meant to say in the commit message is that it
does not need to be added as  a subdevice of the cros_ec_dev mfd. I'll
clarify the commit message in the v4 series.

