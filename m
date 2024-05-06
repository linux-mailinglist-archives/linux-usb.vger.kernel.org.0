Return-Path: <linux-usb+bounces-10051-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3248BCCA9
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2024 13:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 355001F22948
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2024 11:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10428142E82;
	Mon,  6 May 2024 11:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTaDzsj0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472A5142E77
	for <linux-usb@vger.kernel.org>; Mon,  6 May 2024 11:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714994084; cv=none; b=PdKZnjq66O0MfNnBGSuT9aY45xpr+jbY/Rq/gsIN47D9UUfSq7x4na1EyEDeG97xNRzxwbn8gPPIE3l2RxjQqei0F3dZyTvCS3oyiheHuokMXU3lsSG2eLqXJrfc24jR99HXNLDG3IMWZi3vkdFqDZX+9oNGCXU14xZfVAdeBc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714994084; c=relaxed/simple;
	bh=cH7OgjiXUlQyPJZ9Ky446nwS92MDFOp7dA2W9R6NLlI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=eN0v2E5Vmd+fHEzOn+9Tv7VetHA1pxJH8/ATtNNy298rpWkpoPkMe1gqsaB00sbhkWs/tcNoGq0RqfwzwyW7ReYCk2N/P8ViOs6N0JfX+RV4lBMHK3sLATNFpa1GpTKHRuKXAckl8zS632EHfLOUQ8TDLzmeyLMfkixvyI7pXbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTaDzsj0; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-61be4b986aaso19229357b3.3
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2024 04:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714994082; x=1715598882; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YsLc+RrDPGdZtG+J+tUsi2ZK39sAflpOwrLMT5QFSpY=;
        b=DTaDzsj0zKiEc9WKqPZ5/kX/dIrKpdaTPlJ9+jnwgff+ZJP8JhyK/d3XD4hzFt/ktN
         RDkyRXWIIVg7YjNkHUDnbFtF1JxEKxL16UvKHEI32XCHwiSPnaDjC5PM+NHl7YFPRHOJ
         UsbxAtvOavTz4w6BZCvGwTDpzxRvmIgqvp3OvAIq0pwq8npXLc6xJ38QdsLLXjlYdxVx
         eQD+8Hz7CQV9R9WRURlEp+8lA0B6X8RCDDESmHquYNjis3xWN1h7bvX1xVEWaKRsAPkU
         EBKUyjnUXr687b061rxOdB+oMc35Mbr7LkY6Jgdqf5kcKa5E5cW6lYxAtSUQZ2lmlkt6
         NXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714994082; x=1715598882;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YsLc+RrDPGdZtG+J+tUsi2ZK39sAflpOwrLMT5QFSpY=;
        b=T/Ai/1lzGKtrs3SKMdaXJtPAt1VNjom+XjqE9OyMJuYmSdRKO7ZgVKfYmUt4dBRkx3
         El7pC/FH/kjqAJwWXy+mkPZ7vfV1tp6xl9D5zSaQ2mAP0Aak4I+pu1GLh3pmMo6Dbuia
         cVCtRD0sJ/zMPfKXcl40osy3Z3NC4V5DcS6poNAwDzXfXAB+sUo74k0jvI8YuER8tB/o
         mDPJO2aYxUZYfhzTzerQ9BAFGW+0e3FrfK4I4BKxInHcFAZiKWnJh9cW1yXMqsCNxqYo
         CjeM/yAbymVJT4iIEpUBElW/DmEm1bcwqH4r6N/c+Ul6l6+dp3YM80z5BxpRJH25MFTG
         8sNg==
X-Gm-Message-State: AOJu0Yx9Gps3IwIl57VjyHyx9t7y8mnBdmTerNHfN2ipvocpOr4KP2XG
	dvVs9+eAOrRPYJ1n8Ej5MtsYk4bE4kNinUvHeFb7kW+iMzc+l1RbzDmw/seJIPZBWkZmiPDgMwy
	Hp0pkdJClKZYHnZrVdIY+a3Uc3MUM6CwQ
X-Google-Smtp-Source: AGHT+IHh/xb6bIkJ9jNK+CNx5hADJK8EjR0Y+/MUbVulEzQaMVXL98gnTF9uRBcnwSLf6H2ltElp/yXxAMMIgeedXT0=
X-Received: by 2002:a0d:cb91:0:b0:615:3858:d154 with SMTP id
 n139-20020a0dcb91000000b006153858d154mr10398527ywd.30.1714994081993; Mon, 06
 May 2024 04:14:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Mon, 6 May 2024 16:44:30 +0530
Message-ID: <CAHhAz+g=7pocghMX-Yu=jg0jxnpfwa3+ZmmdLP_pVuXmWLJ=aw@mail.gmail.com>
Subject: Seeking Assistance: Implementing USB Device Suspend/Resume in User
 Space Driver
To: linux-usb@vger.kernel.org
Cc: kernelnewbies <kernelnewbies@kernelnewbies.org>
Content-Type: text/plain; charset="UTF-8"

Dear Linux USB Subsystem Community,

I hope this email finds you well. We are currently working on a USB
device driver in the Linux kernel space, which supports the
suspend/resume functionality for a USB device using the struct
usb_driver's .suspend and .resume callbacks.


In our driver code, we perform a check to determine if the device has
remote wakeup capability. If the device supports remote wakeup, we
enable the device's autosuspend mode by setting the struct
usb_device->dev.power.autosuspend_delay parameter and then calling
usb_enable_autosuspend().


Similarly, to resume the suspended device, we expose an API to user
space via IOCTL. In this process, we set struct
usb_device->dev.power.autosuspend_delay to -1 and then call
usb_disable_autosuspend().


While we have successfully converted most of the USB device driver
functionality from kernel space to user space using libusb, we are now
seeking guidance on how to implement USB device suspend/resume in user
space. Specifically, we would like to know if libusb provides support
for achieving the suspend/resume functionality mentioned above.
Additionally, any insights or suggestions on how to accomplish this
task would be greatly appreciated.


It's worth mentioning that our USB device driver also supports
Bulk\Coontrol I/O transfers and other functionalities.


Thank you in advance for any assistance you can provide. I look
forward to your valuable inputs and recommendations.


-- 
Thanks,
Sekhar

