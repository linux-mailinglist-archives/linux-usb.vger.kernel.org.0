Return-Path: <linux-usb+bounces-5114-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D45282F08C
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 15:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9B6C1F23E6E
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 14:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACE75CA1;
	Tue, 16 Jan 2024 14:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CV6S4Bag"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA5E6FBD
	for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 14:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50e7d6565b5so11701236e87.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 06:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705415539; x=1706020339; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vcp0J7zk08bcGnG6ixoY9FJh5UMVRDDbvoFP3uqAdc=;
        b=CV6S4BagAt8ofTqqWDb7XDQoa7gnIoqCKRi24VJ4Dinf1wtF53HFzIRzHBmrEdYRno
         ImM3IWLYHryI0xNQu+SG5j4hxzY/Bb/9BdI6OgIFgJmwoHKdcBl7EMF7J6zDojW3cA5t
         AJm3psyxJLaGs7Ns4wGOudkK3dKgQhJMbBUrgC4sKF5CB1ropnu9cEcNKUsCC8AEKmx/
         x48em5BhjXj9HxbR8AiWNE9wHA6yyPOLDfBsQCXU0CJK3UF6doD3BBWv7ADl+Vueyy0V
         w0tGnEG0Xj7ngcOfof2vbBwE6Z6GQrfDTdj0SsUN+Xr5gee29U2OAymSrjW9OjRgZJdF
         vxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705415539; x=1706020339;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5vcp0J7zk08bcGnG6ixoY9FJh5UMVRDDbvoFP3uqAdc=;
        b=ItePRicdXrDNxPGuGajIyPzC98zxOVMrcA+YQbVJ9S3d2ozWgw5jGAFz+7LTX44TP2
         HsAxdBejWg10Wz/Q0zmwXo5pPNbkqIDKGazHHt+HMcqgC/yzWf7ohSxMnlpF+MXV1LKz
         wqv/HxPEfjsYayX8j8LY6P/4SZOsWngBSk143O9ZA8I4t2eXkFp9nAU/OwtaF9htPDKi
         pePhNF+Jh1thpUKUkuHD+w48joYSF0KxQR62njzwjW2qKb2uyo0O4YIiw5JNdUFvA/Aj
         g20LOMvr+ddmnic+2SSRYTPjsT1dDyEP39lDevD3SMg6O2XlFEL8COhPZPjIWQo6bxuT
         uhkA==
X-Gm-Message-State: AOJu0Yygj8NQGPBE5diQdyBBja+rwSZtcajKoYxzZ0N2nFVhVtgKSeY9
	iTOUZTddZYOof3EB7Y3ipab6CFVSfZQ=
X-Google-Smtp-Source: AGHT+IH+GdRJDvWmo+M8VtNQcNgrkS87jK9QaiPN58X8uDFgKz0b/3LT4Zg2mD0DmC8YaFmSR739kw==
X-Received: by 2002:ac2:5bce:0:b0:50e:d447:45bc with SMTP id u14-20020ac25bce000000b0050ed44745bcmr3126746lfn.55.1705415538903;
        Tue, 16 Jan 2024 06:32:18 -0800 (PST)
Received: from [185.222.58.35] ([185.222.58.35])
        by smtp.gmail.com with ESMTPSA id w13-20020a056402128d00b00554d6b46a3dsm6872061edv.46.2024.01.16.06.32.18
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jan 2024 06:32:18 -0800 (PST)
From: Teri Ford <sofiaw7j121981@gmail.com>
X-Google-Original-From: Teri Ford <terrford@outlook.com>
Message-ID: <aca9a4a3700f8c7143a5f8ccc27d5e1f0188fb8f109523ac02f8b20a7cdfb5e3@mx.google.com>
Reply-To: terrford@hotmail.com
To: linux-usb@vger.kernel.org
Subject: ` ` You want this ? `
Date: Tue, 16 Jan 2024 15:32:18 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,

I'm giving out my late husband's Yamaha Baby Grand Piano for free to any passionate instrument lover. kindly let me know if you want it or have someone else who wants it.

Thanks,
Teri

