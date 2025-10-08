Return-Path: <linux-usb+bounces-29056-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70232BC6CB3
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 00:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5F3974E4AAF
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 22:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BF32C11E2;
	Wed,  8 Oct 2025 22:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gb8H+f4e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2B02C15B8
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 22:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759962370; cv=none; b=ne5KYHgHLLw0TZx5sMej7whuJdH+zrJUtXIXPOa5aJoT2kO5YrsBT1UstWMdCU8IgcARkbn3KzbvzOaPxegj+5lkTtCK0phxOQ33KFnd088iUCekRQAPNYMWfKmbaQLlOCQTTF8xLdD7fgNh+BgdB1zdV5M8UQiwM8M/eWOHV9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759962370; c=relaxed/simple;
	bh=SSjbrzdgh/nOoql1zsGYj2WvrqyAF9J5MZIuUzoTBdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OxKE8srAvfSVOk3iPMmne9ahwf3bsIMGiOGxAy1JLmO6Nd/ZepRp1bqnoUJ4tkOy+GS3b/yZHO6EFlYop7vnZdFmhWTR7T2TL2vDnSd8FzUe/ABdjYuHVVmr5uztcMOB/8yvOWeFlMCY9SgGiwpbMEKrdOzlfYr5PY6glipYjvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gb8H+f4e; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-554a7e98e19so207496e0c.3
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 15:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759962368; x=1760567168; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SSjbrzdgh/nOoql1zsGYj2WvrqyAF9J5MZIuUzoTBdE=;
        b=Gb8H+f4exqrWs++6IfZlbOSfT2VEpxnIaU7FTnK9jatfAw0lS+KWG3dvx9e3bHQ+On
         KnvM73zhAiWZmWumemHZrHWydVPpYdZQ5nkWjyq2hN2NLtbcTz1iCaZIND9nm20ZZiJC
         xhbjr0hOEu6jQVa8AsOcqgM9vdyKNR6qXXIfetR7ww6hPkhUEUX5AQY9pgsIFDCsnT3x
         mbaIbZXqOoUva31yM3vLmMV6vyrjEwzFgjELmA/Q1dnO8VnBW21OefkTuYirBI2/kokv
         dxQ3Z9sDfjlyWLdWOxUU+k9HGZ7QTyjHi9frOox53f7pRP4CzVyO5mMXoBxGc3e7DJz+
         7huQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759962368; x=1760567168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSjbrzdgh/nOoql1zsGYj2WvrqyAF9J5MZIuUzoTBdE=;
        b=V/9BeL7TrZ191l+c0+WMyBC6d5dameIlHf5VMPIsAbduOmHH6AKC93mSx6bkjwzQpI
         +1gTxBSMqLm0e25ttY82mDj/gIEuubth5uwckPYu6z/tGh6DofsdChglhVozraiq9wD6
         viJ0DrcOrxb7KvQPPsPIvZRtHWlE/3dOnHWP48Ug6lUJIzD0Zv6xTK8KDEDZj4MyQU2H
         DVxRa3pOe3+sCrVdF/jPZk1SjFWT4JsmL8fNdyBAPr8BBWFk6pIWbTZ3hRofxWBa4IHI
         BxFrQDbND+XUiQCxn+8y2x3HkP+cB4ZfLfPtFJte65Y2lMmXNh/AyxwlRGQcIcarnqOW
         yNFA==
X-Gm-Message-State: AOJu0YxJxuqQykCqdX6jBja5vnm7hA5L9S8CJIkhJVAFGzq5PJ9o+eC3
	nk7tOGdqFW/YkXjJK1o02C2BnOPfsBJkAEhSiFYjW6MGacOl8qB+4T5asIqZiN5B8EzNzbQO8st
	xNcv+lTkPPsmv5hAq6xQ7x/8ACA2iR9I=
X-Gm-Gg: ASbGnctkE8lYlTgYLnQ2H/9SjnrqfgPgiXWxAsNmPdCU3ggtYFhCFkMcA+GPFCTSqcf
	ZRGcpmclBu0pG7gZkajaCpnwXhl7eCws9dCY9PkbTrOSE6Q9/n4cRmb7YL0fNdaqEMraMCIOTId
	2PNrk5ksMAF7b0CpKw4beuTEnJkNG3DJ4VJwgH8vVNWaDDlJtItrTMBpPhC5YGtJbIuaJRC1Hp6
	dCc9grK6tf7AS1GaiNZ/JHjrehvlfw=
X-Google-Smtp-Source: AGHT+IFc2bHUCZOVk/jSHRVhDMxkU1QLA3u78KP0usSruM30hY94G/DjGOEPi/85KUy5GXymTHlhotJcUFMrCdPFeQg=
X-Received: by 2002:a05:6122:308d:b0:54a:93be:46fc with SMTP id
 71dfb90a1353d-554b890bc3emr2323268e0c.0.1759962367723; Wed, 08 Oct 2025
 15:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
 <20251007231709.6c16802e.michal.pecio@gmail.com> <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
 <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
 <20251008082055.5646dadc.michal.pecio@gmail.com> <CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
 <20251008130532.49922d58.michal.pecio@gmail.com> <CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
 <20251008223406.13f16f19.michal.pecio@gmail.com> <CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
In-Reply-To: <CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
From: Arisa Snowbell <arisa.snowbell@gmail.com>
Date: Thu, 9 Oct 2025 00:25:55 +0200
X-Gm-Features: AS18NWAufrPo0--_wjTTgEstRbde3_tDtM2AG8z7OpPilyHw637Tecy3L1mXPWI
Message-ID: <CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com>
Subject: Re: [REGRESSION] USB-A devices not working on boot after recent USB merge
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev, 
	Niklas Neronin <niklas.neronin@linux.intel.com>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

This is what I get when I use good kernel:

kernel: xhci_hcd 0000:7a:00.0: xHCI Host Controller
kernel: xhci_hcd 0000:7a:00.0: new USB bus registered, assigned bus number 9
kernel: xhci_hcd 0000:7a:00.0: USB3 root hub has no ports
kernel: xhci_hcd 0000:7a:00.0: hcc params 0x0110ffc5 hci version 0x120
quirks 0x0000000200000010
kernel: xhci_hcd 0000:7a:00.0: xHCI Host Controller
kernel: xhci_hcd 0000:7a:00.0: new USB bus registered, assigned bus number 10
kernel: xhci_hcd 0000:7a:00.0: Host supports USB 3.0 SuperSpeed
kernel: usb usb9: New USB device found, idVendor=1d6b, idProduct=0002,
bcdDevice= 6.17
kernel: usb usb9: New USB device strings: Mfr=3, Product=2, SerialNumber=1
kernel: usb usb9: Product: xHCI Host Controller
kernel: usb usb9: Manufacturer: Linux
6.17.0-1-mainline-12298-gf5bd2142c274 xhci-hcd
kernel: usb usb9: SerialNumber: 0000:7a:00.0
kernel: hub 9-0:1.0: USB hub found
kernel: hub 9-0:1.0: 1 port detected
kernel: usb usb10: We don't know the algorithms for LPM for this host,
disabling LPM.
kernel: usb usb10: New USB device found, idVendor=1d6b,
idProduct=0003, bcdDevice= 6.17
kernel: usb usb10: New USB device strings: Mfr=3, Product=2, SerialNumber=1
kernel: usb usb10: Product: xHCI Host Controller
kernel: usb usb10: Manufacturer: Linux
6.17.0-1-mainline-12298-gf5bd2142c274 xhci-hcd
kernel: usb usb10: SerialNumber: 0000:7a:00.0
kernel: hub 10-0:1.0: USB hub found
kernel: hub 10-0:1.0: config failed, hub doesn't have any ports! (err -19)

where the 2.0 USB's work, mice is powered on, with the bad kernel the
mice doesn't even power the LED's on.
In the bad kernel its missing the New USB and all.

Regards,
Arisa

