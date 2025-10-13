Return-Path: <linux-usb+bounces-29241-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4171BD600B
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 21:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 857B44078B5
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 19:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D752DA765;
	Mon, 13 Oct 2025 19:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gw1RMSQ2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B833C1D5CC6
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 19:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760384982; cv=none; b=raJGE5jm9s7/j9YqGV1NhDtOrO+Xb3CS0hQvc8v1/RO32wc3AGjHGvaUvF57X0y1JK7gjQiGWZAaie9qydz9EDn8eO82D6LVntmVDv34KprgrZdWdHs2k0JE5mkxEnCNtd4HpUBZMQEulCIcAM8gQxXlUSaRvKo6koET0gM5w38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760384982; c=relaxed/simple;
	bh=/DrKiXuWmXA5zXJIwBMSXqDq5Rn8SXQvuQWnNtsh0VU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D8K/B7eO4Mh4bgRFYtryTwA1utZE+g26pEWextowM9jsPTBOWVEOoYrYygCsLAzgKzXvJMyMEXz+U+BYxES3N/HiUizrxGXAhuXv87/KitmeDFMLXMzUgEKXUZCMi8u0OUf4CRGKUuYYdRFCdSgQvr/i0xQY2j7LCrXhl7mSlQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gw1RMSQ2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e61ebddd6so49177155e9.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 12:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760384979; x=1760989779; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/DrKiXuWmXA5zXJIwBMSXqDq5Rn8SXQvuQWnNtsh0VU=;
        b=Gw1RMSQ2YLBJ5WEEzmrGrFHdpMMqWCKNVzgLrWEuH2r7COHcEhBiFKpgG7MhXsZh1x
         OMRznKqtNJig0TvsaFUEDxWX9PPPyF6XHEXkydWLVi4k4MZ+cFe+f7HvfvQarBLvr/0H
         JkAIf/NCTChQ3lGqbfA/Q1tLUsHKlOjzeK+3FIC97rcqRjLLOBfkMnwyrnkkn94ObFEY
         T2kCt0DHF9cXRe109Ryrlz3zH+5Zg8sh2C0CGM7OGkcH0Iv5c7/I0ZRYAXrJzGa4Xf5u
         E/wiwY4gNtDRs4hzlv0KJiV0prQKsLA7TkxVsMrGFSU1FqGfD4iem72/fbDgWtL5kbJ+
         xIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760384979; x=1760989779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DrKiXuWmXA5zXJIwBMSXqDq5Rn8SXQvuQWnNtsh0VU=;
        b=i2ADxjSLxh6IcQaxafOohMjPmcqLeyg+fX3MDT7VziubIgfR2ft2MycbFVvKRC814R
         GJDMmCgSqjnlPY2MfrbpVWAxAzY52B8fMggx8+FLuXGd8gnHFxYLHLUVsvpIZvDErCrM
         /x/6LJe7ofr/XdN0Bwrg4LseR/WWim4RBXVWvNLVudRn5rWobwG0xIPxjq+pLVms/DAk
         exvdSW9w5ivk1RpPo6of3AzNL8SJb2Rv9s3WKkZDu+lKSUtKmCAXxq2A1TXc8pO3sDl5
         F8l6d9AEU9/QbRq79oWLaSL4ZLYQ1m58X2Y37lckhb+DJlbYJkUQ1Q/9toYj3gOF/xGe
         p/gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYcn4amKjBnN4XUVSeIklllSF3hCwfbWOSlEzEx6lD3hfX72ZhzP3RNzz1hMkLhCATg5s+/QigNpM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4f8dLRfQjudUOiWfADte5OTuihAdBUUx/k6DipvdoCSCMcT3p
	PU7I2mCpjpIqZSB/0qzk6eZ1p8WoMiVm4H0BpY8ejPh8PJFQdX9JV1oAQbCKEOFgbSgOPGBBo6h
	hjEUG8Ara4JnfznOEqVdL3jvHIgCcc27GXuQsCbuj
X-Gm-Gg: ASbGncv5/XiR1cx0W1e5DBAkPIvr/oAID9Tw3dIvQz5Sh7BbJA6UmP83QAf+46A0Gyv
	zQDKLCEbdmN0WzR0M9tEOV5rynDJDG1gdUPRPD/SnYG1Nk7cPgL7vRn2/sYPG29rSy5d/215yBk
	vpaVzBhtA1pMucoCpvak7fT20jAK3AYtAyPOo3Gxp39mhAkEKQoKeu8tnaSDoWfsZIt3y5QuxSu
	2LYTrOz8vhfg64JrUrOtzjF9nM80r2ovAf5lxdYEQRp+AZFtUxgODoncl43/MAQZZZQvAGJSg==
X-Google-Smtp-Source: AGHT+IHY0QThJviNDN13Na0YoMT4nnE0a7l4g/aXq2yJNMMpvrw4aO2zCu7aZscq5GGO+Y0OCsnqucCGtPNGmRlRxaA=
X-Received: by 2002:a05:600c:4e01:b0:46e:37fe:f0e6 with SMTP id
 5b1f17b1804b1-46fa9b090d0mr180438765e9.30.1760384979034; Mon, 13 Oct 2025
 12:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009010312.2203812-1-jthies@google.com> <20251009010312.2203812-3-jthies@google.com>
 <alnlmxbcv3ivhh7iolfqsurhknnm2o6i6waxq7kuhmzcbeljr5@a4wy3prshu3c>
 <CAMFSARdzoZrv4oXxVAYRcZJgxdLcrTMVAVGa=D8H=9c1vZ0zKQ@mail.gmail.com> <fciyxaedvyqeppldl26rsy7hogoi2zks6tq6m2yu5xerfjxo3g@u6vzsiicv5ke>
In-Reply-To: <fciyxaedvyqeppldl26rsy7hogoi2zks6tq6m2yu5xerfjxo3g@u6vzsiicv5ke>
From: Jameson Thies <jthies@google.com>
Date: Mon, 13 Oct 2025 12:49:25 -0700
X-Gm-Features: AS18NWBSBKFbpC2dPCDDX4XxbL8PoeUJPBg6KiZ18nToguJJIvN2knvCEUtPr-U
Message-ID: <CAMFSARc7ySH4VhGbwd+CXXC9845NUkf-RE4gKeTW8D_9zNY--g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] usb: typec: cros_ec_ucsi: Load driver from OF and
 ACPI definitions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org, 
	robh@kernel.org, bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	ukaszb@chromium.org, tzungbi@kernel.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> IIRC, MFD devices support binding subdevices to the OF nodes. Do you
> plan to use it? Could you possibly point out the example DTs?

I'm not planning to add this, we want to move away from using the
cros_ec_dev mfd to load cros_ec_ucsi. On upcoming devices using
cros_ec_ucsi will just be loaded based on ACPI/DT. Regarding example
DTs, I'll point this out in the comment.

