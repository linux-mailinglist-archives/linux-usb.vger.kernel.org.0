Return-Path: <linux-usb+bounces-13220-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7551B94B6DB
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 08:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C579283302
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 06:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7483818785D;
	Thu,  8 Aug 2024 06:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2nF6LM9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E0E18757C
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 06:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723099170; cv=none; b=rP6Ps5r8ePDLJ7R2mBPMpG9kkAHkVPDED923cHX4TNeZbtbKAzQoTWdP3imKgkVub/r9q0lgiRuXhBsly/UU2N+GYFVuICfd0r104imA65RN3wyOLG7l3ndQBn4HWuSFESo7LoYNWcleS2ev0Dl6GgGnSrDsfgp6IrH75MECIsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723099170; c=relaxed/simple;
	bh=3z4ELZ2YlZ/b7/PIsGLXbeAtLBObRwiH4GCU9kc4mdk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=HAfj5GZ9aToZd2IzEVFxg8GEfedSu3nhvHIinEjjxSrSfEGd9ZqutMxxU+Y9ChmRmWC+UH1eCLCZbPACSSCQc6ihh2irQQ/qFoaSZup/285mX8UPZgPOs1SAocPmCOSCypBBps1tfXlFluV6hCT4eH4dZE7taSyMDIpx2OTah90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2nF6LM9; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52efa16aad9so741504e87.0
        for <linux-usb@vger.kernel.org>; Wed, 07 Aug 2024 23:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723099166; x=1723703966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3z4ELZ2YlZ/b7/PIsGLXbeAtLBObRwiH4GCU9kc4mdk=;
        b=H2nF6LM9ktSLt/KjFatUSDaiXQsy/N8eeKrnahfYP6VVx3qbMkZTIcVax4oy6aYwO0
         N5zu3VDB/tkiSzAypadW8vagru6ih2LgLj0ZU6f85A7+25AlWYXWACiHpCy/e4fdZnId
         HP0GDnhJdmjtygAb3dvShBptzTkBZpSFpTxDOAh8DsI7a+N8w38IaEj0dMGi1j9TyIHM
         ioNOotCk3cBdB80ohtiPnguSdTLz171JRRinq8ueq4I8/d96SPMYC3I2Xw2ddCah99mx
         AJS8bmZxhClOMKaBcF4GufDPjpDDe5CV9DOd2SKDol3SAcyAStRSOoIHrNfgeyWODKrK
         0drA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723099166; x=1723703966;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3z4ELZ2YlZ/b7/PIsGLXbeAtLBObRwiH4GCU9kc4mdk=;
        b=WlFRvINYmH9esGhsNrIX8MdrmohD9pg/fMSDjaA96WV/SuAae/LrpawHBQUcR5km0r
         QFPlyWpb2FcuYNRiBS5Iooyq3mmoP0PB0mAXGXanirptmxWlJps7HL3Ry5wyjAPp2e6j
         P9hiSTs2mKPi7VPLkRHSlzWOkYV6qM6BxDSXWfCl56g+E9h9/9WjyZSIce/GF4mIzK3b
         9aMabhUSUhtLtSthYqH5Bpmc69CFUhhPYZbPWMghy7LN+hJTd3RGmbYX0/I727CXaYOv
         FpJT2yzUzd7cPFNpDLtAlQjdFBRRSxpF3wHU7+0JEGsZZ/FCWqcgXWH3TNZbOZCY6xob
         fBPw==
X-Gm-Message-State: AOJu0YyRVra81qZtKFnycoVxIxGMpSYI9r/swXpXgX6P9KWggN9mlYh3
	HMvPhnwA37LZzGmXYzlhvcYFApZq3nyIzNr/GfYXaXy6ae20CC2tGYGm3A==
X-Google-Smtp-Source: AGHT+IG9YNGdfnHCMl8450D49x5YSD/0dBz0gq8kkbUy5aR68aTVf27qOBjZtxm3PnhXPL+JILGCYQ==
X-Received: by 2002:a05:6512:1593:b0:530:dfab:930c with SMTP id 2adb3069b0e04-530e584449amr597733e87.28.1723099166066;
        Wed, 07 Aug 2024 23:39:26 -0700 (PDT)
Received: from foxbook (bip144.neoplus.adsl.tpnet.pl. [83.28.131.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530de3e2f91sm512075e87.38.2024.08.07.23.39.25
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 07 Aug 2024 23:39:25 -0700 (PDT)
Date: Thu, 8 Aug 2024 08:39:21 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: linux-usb@vger.kernel.org
Subject: Forcing re-enumeration of a chosen USB device from userspace?
Message-ID: <20240808083921.0400af26@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I have a buggy USB device which works fine if connected before booting
Linux and also starts to work if I unbind and rebind the XHCI driver.

On the other hand, hot plugging the device with the driver already
running usually results in invalid descriptors being returned and
sometimes even if the descriptors are right, the device still doesn't
function entirely normally. I suspect a race between initialization of
its internal state and enumeration by the host, nothing I can fix.

Rebinding XHCI driver forces new enumeration of the device and reliably
fixes all issues every time, but it has the obvious downside of also
resetting everything else on this bus.

Can I have the same effect selectively, for one chosen device only?

Thanks,
Michal

