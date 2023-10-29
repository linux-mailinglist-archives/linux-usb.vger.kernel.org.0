Return-Path: <linux-usb+bounces-2326-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 603F77DADA2
	for <lists+linux-usb@lfdr.de>; Sun, 29 Oct 2023 19:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A0EBB20D49
	for <lists+linux-usb@lfdr.de>; Sun, 29 Oct 2023 18:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399051094E;
	Sun, 29 Oct 2023 18:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkiMDHy+"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC71DF69
	for <linux-usb@vger.kernel.org>; Sun, 29 Oct 2023 18:21:36 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C80BA;
	Sun, 29 Oct 2023 11:21:35 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-507bd644a96so5413588e87.3;
        Sun, 29 Oct 2023 11:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698603693; x=1699208493; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0K7gdIvXPk68vkSSta81KyHTb3uDVkYkVGmAdrIYgkc=;
        b=TkiMDHy+GCNhgJpTLIqWSGHWuByzwRNI8lds5ajwizCN0aHH89vDuUYyrnLum9MRtn
         kQYcoY8OiKRfKSp+tUNhp7Alw+Mr7BgAQr4F6KnTn6i5GT8ITgq+AbJaoQ64bi3WiLJ9
         AitrLKnCQ/3th1yJ2CMopr0D0XMeIFWb3S14Y0/mkT/nQkDi+pnEJlK3uh6OWiLdAFd7
         OBh7I3JgGk2TWuABzY6hxf4BzeFcHaYxi+4M+4bPaGEq24JwgNWkAj7wlu4+XUlq4NGO
         CsD7W5pafgIAwTD1JDvjYlJxBHJLrPJcX4bjiM1f3VhvdQicoxKMB8qsjYTG3rYkkJ6c
         ZgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698603693; x=1699208493;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0K7gdIvXPk68vkSSta81KyHTb3uDVkYkVGmAdrIYgkc=;
        b=tJWtV71PFH4I+pUJVbR7W0lkbnGLD0YmacORrozCat+9DfuvXRT+xMYPVgg/u2MJ7O
         CUZX8gEyWExUFwAj86bs3uX+0vEtHa/KNuL8SJeIMamCwEVeZL12kCqbfQRal/ibpqyQ
         fvuiFJaRvaN3rqWK9ezE+ONPv9zC9AksjGX/l9U6XZII/LwdOhAcP+RSDEhlPCwADmve
         MfE2rIU9dQEk8Sg76TI6fXIte0GmxarRejNHG94E3rW3rU1GxrQKwtt/6Veohy3/+rap
         k1rYZIF69YbIL1eJbp8tcS5eKDFjgjIzE4viE1bn8l5nSITR4gkVi4CpV6hAWVn6uwej
         dG7Q==
X-Gm-Message-State: AOJu0YwtAvnRpTdb8gcJpLXeddyvGEgIRlDAxZCQu76rMazIabY44K4q
	cNeLMVC8+yS/wyu7DF0XfWtKMCPnV6FQm0MChFQc0lrP0KY=
X-Google-Smtp-Source: AGHT+IF1Ai4stFSXDDfufHmG2BJEfJoyobYkJcJmY8D9e3NPw1aQyMvsS8lCEaOkHR3kA+iomQVLFkXJN11MLKlqrIU=
X-Received: by 2002:a05:6512:249:b0:503:fee:5849 with SMTP id
 b9-20020a056512024900b005030fee5849mr5762769lfo.53.1698603692931; Sun, 29 Oct
 2023 11:21:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ariel marcovitch <arielmarcovitch@gmail.com>
Date: Sun, 29 Oct 2023 20:21:21 +0200
Message-ID: <CAFGKuwoFUaXMsOOWJNBenQDG6+syt80Z9pvQQK1XSZFztC2_SQ@mail.gmail.com>
Subject: Gaps in logs while using usb-serial as a console
To: johan@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Greetings!

While using a usb-serial device as console, I've noticed some
significant gaps in the kernel logs it receives.

The problem can be reproduced in qemu like this (the kernel is a
x86_64_defconfig with usb-serial enabled and with the ftdi_sio driver
enabled):
qemu-system-x86_64 -m 4G -kernel arch/x86_64/boot/bzImage -usb -device
usb-serial,chardev=ser -chardev pty,id=ser -append 'console=ttyUSB0'
(this will create a `pts` device that will connect to the other end of
the emulated usb-serial)

Then the logs look something like this:
[    1.006459] SELinux:  Initializing.
[    1.011620] Mount-cache hash table entries: 8192 (order: 4, 65536
bytes, li[    2.315341] ACPI: \_SB_.LNKD: Enabled at IRQ 11

This probably happens because of the code in
`usb_serial_generic_write` which tries to insert the data into the
fifo:
count = kfifo_in_locked(&port->write_fifo, buf, count, &port->lock);
Because added indications for when the result is less than expected
and it showed significant losses.
The return value is silently ignored in `usb_console_write`
Also making the fifo bigger in `setup_port_bulk_out` helped (I made it
10 times bigger and there were no losses)

The reason so much data is written at a short time is because
usb-serial is initialized rather late, and when it is registered as a
console, all the logs until this point are written to it.

I'm not sure what the solution should be. Maybe we need to check
whether the write in `console_emit_next_record` was successful and not
increase the seq counter in this case.

Any suggestions?

