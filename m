Return-Path: <linux-usb+bounces-16626-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965C29AE12C
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 11:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5236D2837F6
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 09:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98741D049D;
	Thu, 24 Oct 2024 09:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEdXcBgD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511501BCA0E
	for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2024 09:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729762691; cv=none; b=ZP04LLap3glMh7+CW+xEA1vAnICKtPYfX3gtwmG7fjE/DXbeeQPGY+uvf2Eeq76Y1RIAKorteG06EeKxil9ydl30NUBWvqAx1oze1QU3rxORvaKVX77K2dk0IRQ8HPDC7uDMqezgsRbcfezdv1n1hMymyuieD5IPwXBiWNIm8w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729762691; c=relaxed/simple;
	bh=JgbdMIkrdlCVjrFusXAcvJSPJeS80r3upqDI50vecac=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=WwZK8qTh+AtYCG/SU8bwoE8HxCvfYa1ER5KPyXxnMFMWSjp3jp9g1c0t4SycPKMde6dx/d5ap0uCM9mj3V9cDx76WoRkdQaPGH+tnp1u+KXUF57/oJx7CHpljRudwwrXI8WZEI9//st4crfKILiU0PIKPqZLkorlckEfdOA/82k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEdXcBgD; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4a48839bc89so233083137.1
        for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2024 02:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729762687; x=1730367487; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JgbdMIkrdlCVjrFusXAcvJSPJeS80r3upqDI50vecac=;
        b=NEdXcBgDGuH+XfkLREobFt7QI0l/R3kTuiizdoa+TxlDOG6LwVEANN3nrC3P1aOySP
         Iwn+G7STocVxSKwmarzxPb4j7c+FwDGpbLygyiYj+xpeOwipQIM4giwqdzwCWMWAFNTs
         vKUfxGx6vh9BX7xnqwXBgNNBJ2ywU8ZW4gj9i1P3KTkuzBHs54v1qEMOo1mwhV2XpJ3A
         RgYUKVHDqYDljfAgvkc0Bnia9WY7lXxQR4F/LblL2X0PHM4KA88dfvrYmlgINqq7WzGu
         IWHRNEIfWKA+ka4lYNI/kTrwLLnxJFiT5oMZRbDcxoxCJ4UtA0V3v5hRkcpjLgcmPXlP
         OmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729762687; x=1730367487;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JgbdMIkrdlCVjrFusXAcvJSPJeS80r3upqDI50vecac=;
        b=e/vlT8bu3/DYPOWk48FTXIK07GwfIE00boLV/zi+sbh2j6IGsZmsNmMcFguTNubz33
         l1hqoBLl8LhbBk5eKZXpZDvxndx3lL3l4xCFV9P2gJolGzGTc86BGYijqbUNEXqXt51E
         aGxTOUlxC0dflwRzPXo1Ig/MORFpTDRYGRVdTRQUCoMwBXTzbXvU0+qZ4VpB1yvuALWa
         icTTEUY5K6VB3gg2c/GQYAucQCp+9j9wfr3OWbpGoOUnyv875wDUvW3dc+Uanxk6KkD8
         EL3+oK6oEfd+L1lItKQrRjFz4vrZyD1mahss+cscov4nfKClLiVWVqm9sITfbf87PezK
         Vx9g==
X-Gm-Message-State: AOJu0YwRD3by/MhHQCGMDilZw7b8dPVKDq2IGk//ukoEDWlb9vAFnhuE
	YcX4oNHCwKINkod1qkbxj6uRtO1nnzWP8YdH2Ugg7lMDzHsbSgFecGluO1wMP6/RQJGleTl1fYp
	UBuMhYnsJ8Yd0myCCExh8YZedSuQTmw7T
X-Google-Smtp-Source: AGHT+IFuWJmMLNkN6f5oZPuShVlqSZ3VmYsp/eSLKVHcBUgdFd8Hn9Ve8ZU8B5uNE5VVGRh3OxV/19O+w8jcgkBePXw=
X-Received: by 2002:a05:6102:5122:b0:4a4:7ddc:6972 with SMTP id
 ada2fe7eead31-4a751cbb410mr5801250137.26.1729762687404; Thu, 24 Oct 2024
 02:38:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bart Van Severen <bart.v.severen@gmail.com>
Date: Thu, 24 Oct 2024 11:37:50 +0200
Message-ID: <CAOLjEn56gcrBLYqmtAPY49wpZCUzuKAGSt+L2ADBpAEELoQ1TQ@mail.gmail.com>
Subject: usb: gadget: automatic remote wakeup on hid write
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

We have a use case to remote control a pc through a composite gadget
consisting of keyboard, mouse and tablet functions.
The problem we face is that when the pc is sent to sleep, we cannot
wake it by writing to the hid device, which is what you
would expect to work.

We're running on Xilinx Zynqmp soc/DWC3 290A.

We have set the bmAttributes ch9 USB_CONFIG_ATT_WAKEUP bit and do see
the set_feature request to enable remote
wakeup, just before the pc goes to sleep.

We noticed the recent relevant work
https://lore.kernel.org/linux-usb/1679694482-16430-1-git-send-email-quic_eserrao@quicinc.com/,
regarding function suspend/resume and remote wakeup improvements.

However, the main question we have is: what would be the right place
in the gadget framework to fix the issue where a hid write
doesn't trigger a remote wake up when the usb device is suspended and
the host has enabled remote wakeup.

Some further context:
DWC3_DEVICE_EVENT_LINK_STATUS_CHANGE are disabled by default
(https://github.com/torvalds/linux/commit/799e9dc82968c66d6f8faf96d0bd01e515b0b2f2#diff-5e9721ccc2bd0a326d3b1a8cbcd9d91130774b1a7d06533c39074ad67aee7e96L1540),
so dwc3 gadget driver isn't interrupted when host goes to sleep, but
it does get DWC3_DEVICE_EVENT_WAKEUP when it wakes up.
So the gadget device in turn is not suspended when the pc goes to sleep.

dwc3_send_gadget_ep_cmd does issue __dwc3_gadget_wakeup when cmd is
DWC3_DEPCMD_STARTTRANSFER.
It has no provision for doing the same when cmd is DWC3_DEPCMD_UPDATETRANSFER,
which is our current patch to make it work in a pragmatic way.

Sorry if the mail format isn't what you normally expect, this is my
first time posting...

Br,

Bart Van Severen

