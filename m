Return-Path: <linux-usb+bounces-11464-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9548090FC68
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 07:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C962283D3C
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 05:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD13383AE;
	Thu, 20 Jun 2024 05:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggQ1JM5A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01DD2744C
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 05:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718863108; cv=none; b=FVFhkI3bT25mNWk4TQV9S0fN2w6wPxWrPhzqB05BO3nPsGb/5qBp3UtrlVefHp/DZHqTsrUhQqJuWBvEuvF5VuOcC2/knmalQ/uZG1b+biKG3RXw6rBJIY86qAkWDQEIZZ3jzYgj/o1oLFUUQuZIALx8Pu234PsgivV0BFEBNE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718863108; c=relaxed/simple;
	bh=aSj+XWQzS7UIAWjlJImvrepTcimos7WZnzajBpmLIgc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=V8y/t7yLDiuPWDjJmR2iTmRIG4iFY3wmwvynHosmGgzN8cu9eaXyoomY3tlhFGsqMV183M88UAJwbCLWmGXuJG/L9Zxe5TUSMyZnHm9FrxGq6aDXAM0iIaZtpoVj74zhpS2UdjlDdh/+aRC7mXL7JH+hXXUwV+AovM/FIn7fb0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggQ1JM5A; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6f1dc06298so49409166b.1
        for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2024 22:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718863105; x=1719467905; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=duWGANdwoGbyoZaBpJ6EWHdJWXK/FpjErbI51E09UYQ=;
        b=ggQ1JM5A2YpwkM2L+Xy6jM6lU7/LX12bLI+gV4jyG7rDXlwphCSRQSHje62pY0CWxP
         fj02LBPz7z4h/CWe3T0K4A83tyj68TVLj4q0X/fq7tox5evpXDd61GbCobZkpijNr1jl
         +GtJe07OGjIaCmL+PvWL/M68+8KNP9VaNCbuOoaVYcnPFJtZuFZGfRP0nHJHwCJVa6SJ
         BSDL0E9GFBDPp4nFgBrEa/SfYnsM0dRlmkYZVU7oLMSHgreXbIZt2zrRhP+lfR+2aqOL
         7CZeC6vdEgkIjRgDra36kAw2uovvem5FPyh7wI/XC5+Hri1/vrawop76yYl+Z3N3CO6W
         2qWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718863105; x=1719467905;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=duWGANdwoGbyoZaBpJ6EWHdJWXK/FpjErbI51E09UYQ=;
        b=gM+FX1tAYkICvSOgeLV+jZutwEjHyVA7P8eQKxLqsmPbl4PTgV0416qY29UqwUuglY
         HzP5lXBSpRKfpDX5pfhOot7f1jGxfkKk+kyrrfnnYC96pYTxW5gBk3OIh/t2kwHP8zCm
         YvJn4ioDC+gAFJV+Xv79k8eEJB+zp7OBQXNl3cRjT4TQkdVUWCBtpFJso0q3Kygh4Y2Z
         6m4QaFUXLwMSFrDc3GgMyT8sKEk+q+2M5nMFl3GarLMl+f37JVHHbmcK3u/xbYm2pPGM
         kDYKMRA3FjXbnXllb48y0fR++f1JWE7qCtntpJyhGBKy1O0FfjvCeYF5Gt/AmMB2YJ4y
         cMnw==
X-Gm-Message-State: AOJu0Ywuqx6z0jSUEq8hFHiwcmFJjvvARCl57ZPiKpmml33iylaUcI1f
	NuQ8JkPtv/M6Al+jLkczTdD7FocGqKMbMcUoxM3VS0B246bzs2sr9Tt/FUfPx1CQBighkc3bMGv
	z1nM4iZDx7oa7A8UhIIJr3eOQRcUfS3Tb
X-Google-Smtp-Source: AGHT+IFGWhtHSQ+85/IebVMYuxBwPoM1VEvvXI1EjyHZr9vd1FU7Px9VVqYCActzbqFN9PoDnTtKtF9ca5KhqQIwB0Y=
X-Received: by 2002:a17:906:9c16:b0:a6f:10d0:f3e0 with SMTP id
 a640c23a62f3a-a6fab6187e7mr203522266b.21.1718863104748; Wed, 19 Jun 2024
 22:58:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Giacinto Cifelli <gciofono@gmail.com>
Date: Thu, 20 Jun 2024 07:58:13 +0200
Message-ID: <CAKSBH7F7LhCykPdKYRi0DvLX5yYjKtbOZbEOKhDXfvrQJA-XKA@mail.gmail.com>
Subject: usb composition without class
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

greetings,

question:

on a system (yocto), I have a usb composition that doesn't assign the
class for the interfaces:
    |__ Port 1: Dev 2, If 1, Class=, Driver=usbhid, 1.5M
    |__ Port 1: Dev 2, If 0, Class=, Driver=usbhid, 1.5M
    |__ Port 3: Dev 3, If 10, Class=, Driver=cdc_mbim, 480M
    |__ Port 3: Dev 3, If 8, Class=, Driver=cdc_acm, 480M
    |__ Port 3: Dev 3, If 6, Class=, Driver=cdc_acm, 480M
    |__ Port 3: Dev 3, If 4, Class=, Driver=cdc_acm, 480M
    |__ Port 3: Dev 3, If 2, Class=, Driver=cdc_acm, 480M
    |__ Port 3: Dev 3, If 11, Class=, Driver=cdc_mbim, 480M
    |__ Port 3: Dev 3, If 0, Class=, Driver=cdc_acm, 480M
    |__ Port 3: Dev 3, If 9, Class=, Driver=cdc_acm, 480M
    |__ Port 3: Dev 3, If 7, Class=, Driver=cdc_acm, 480M
    |__ Port 3: Dev 3, If 5, Class=, Driver=cdc_acm, 480M
    |__ Port 3: Dev 3, If 3, Class=, Driver=cdc_acm, 480M
    |__ Port 3: Dev 3, If 1, Class=, Driver=cdc_acm, 480M
Kernel: Linux version 6.1.35 (oe-user@oe-host) (x86_64-poky-linux-gcc
(GCC) 11.4.0, GNU ld (GNU Binutils) 2.38.20220708) #1 SMP
PREEMPT_DYNAMIC Thu Jun 22 18:03:13 UTC 2023

instead of (arch):
    |__ Port 004: Dev 004, If 0, Class=Communications, Driver=cdc_acm, 5000M
    |__ Port 004: Dev 004, If 1, Class=CDC Data, Driver=cdc_acm, 5000M
    |__ Port 004: Dev 004, If 2, Class=Communications, Driver=cdc_acm, 5000M
    |__ Port 004: Dev 004, If 3, Class=CDC Data, Driver=cdc_acm, 5000M
    |__ Port 004: Dev 004, If 4, Class=Communications, Driver=cdc_acm, 5000M
    |__ Port 004: Dev 004, If 5, Class=CDC Data, Driver=cdc_acm, 5000M
    |__ Port 004: Dev 004, If 6, Class=Communications, Driver=cdc_acm, 5000M
    |__ Port 004: Dev 004, If 7, Class=CDC Data, Driver=cdc_acm, 5000M
    |__ Port 004: Dev 004, If 8, Class=Communications, Driver=cdc_acm, 5000M
    |__ Port 004: Dev 004, If 9, Class=CDC Data, Driver=cdc_acm, 5000M
    |__ Port 004: Dev 004, If 10, Class=Communications, Driver=cdc_mbim, 5000M
    |__ Port 004: Dev 004, If 11, Class=CDC Data, Driver=cdc_mbim, 5000M
Kernel: Linux 6.6.34-1-lts #1 SMP PREEMPT_DYNAMIC Sun, 16 Jun 2024
14:45:31 +0000 x86_64 GNU/Linux

This lack of class creates too many /dev/ttyACMx ports, and
ModemManager tries to access them all, perhaps also blocking the
device, and the whole system doesn't work.

For completeness, the device is:
    Bus 002 Device 004: ID 1e2d:0065 Gemalto M2M GmbH LTE Modem
which is supported without any customs in the cdc-acm and cdc_mbim drivers.

I spotted only two options not compiled-in in the yocto .config
(compared with the arch one), but I strongly doubt this is related:
    CONFIG_USB_G_MULTI
    CONFIG_USB_G_MULTI_CDC

Would you know why the class is not assigned?

Thank you,
Kind Regards,
Giacinto

