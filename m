Return-Path: <linux-usb+bounces-17007-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FF19BAFAD
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 10:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7F0A1C203DA
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 09:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6ABF1AE861;
	Mon,  4 Nov 2024 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipXI7kmU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85718189F43
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 09:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730712731; cv=none; b=VdPsiBG1+kgCM4aT1OuZVG7tCuvz2MpOPX1/V72dJDxi02AOrA/QooI785XvLuzNsy/ixJlb85rzoONpuoRO9Wp35aMa5daeMrFNYDsAldK49QJer5FUQrz3lF9v+8UzaIgHtywC0e9NMB/lTKFLt6+Zx/QixaZ2oYmvZez2Htg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730712731; c=relaxed/simple;
	bh=R2xbUUVagBMbXR5JRrMQYtFvgdCA88P4nvFVtcaSEDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=E08Ip5jjanNyuzB3wGUG1LoJrys8nWcMMlBKOFrxG+7GHgINVj8BczYjPUiXXUXAhstFB5AUqMCZv2Ith4fJ+XIp2XdtEVvsHWeb6HyiEkybGWbEv25oTGgDsy5sDgXiFd6ypf/2UvQLmqrZDgaS+Q/xxuiYTGHQS0Ta+CaZmt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipXI7kmU; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e3f35268so4870252e87.3
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2024 01:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730712728; x=1731317528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ewRSOin4zedt+4Ob6hlHbGsqrEFo0ZIRRLojJKIWCtE=;
        b=ipXI7kmUN0jO7gH3M+5rsdNYyp6LpQSgyPfbTQIQxY1RlIaAYfKBdtZ6OO6xOs0m2Q
         6aAgVc++ztvaTQPSOMWcc+diffSdE8pL1GnnUEmrCBoCUx5JhQs4vNUFtTn8evtqxGyc
         uRU/5jIN6q9GwRlswijFbe74YRRec1ecWhV4oa9YF8Pzq1bvZJKdkTAOtiruuGn45OZU
         5pjuciPINk4REn50w3NqePd44Zxfa2Tv5ylunixrhazPrxYppTGZW0eD/D0h2FDWxfz8
         s1aPHmmzqm05o+PGTp0QlQhmSx0VXxmZUUoac+lNS26tVjX54UlQN9iFomLxHTHJrlri
         P8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730712728; x=1731317528;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewRSOin4zedt+4Ob6hlHbGsqrEFo0ZIRRLojJKIWCtE=;
        b=bfxEXVCkOeonLO9CWSXyZw2T9OgF/NUNJNV3qojqaEAF/vpwRZWjaMTH2EGmh01Cx9
         eayW9KCNCFjTXnT1eArGr2gSJjbmqdZdBjTMXPSM4nMsLIujg72rkHV5wFI+XqImzJ1B
         v3tNSSx/hF1KE0JQ7GH9IN49wTGzOxPGGLUzzluIrxDduqzj2VqdaB0Xv3ohDJ2HdYJw
         9OaoE0hQKZhZQ98fWgPzz0UDexEuUYEIrAdxoLgzJvCK5gq/EpWsTRuBMajtp6KqUln8
         cQkr7oEtHACeAMai9R2rCPA31nkvHTYbUBRNBDCgvpnD/NiiMEhFgrp3AwBDBb0zBHy5
         ICGQ==
X-Gm-Message-State: AOJu0YypHfU5nHPn6tj2s7BShBiMx0lLCQwi1O3kvoey9z6bHajxFV8N
	slIOZx+T7MiV3egIfnYsUjIYFg48WqK6PrzYwo6W+OQZYk9aMf+zhmArOg==
X-Google-Smtp-Source: AGHT+IEMHMK5eG7Y5StWnr3lIE20zS+TmLHvEtVg4sV/Bz3Yx36nOF06K5DH/VYlmTjUKhuTalw4Sg==
X-Received: by 2002:a05:6512:3e22:b0:536:54df:bff2 with SMTP id 2adb3069b0e04-53d65e265e8mr4558106e87.54.1730712727181;
        Mon, 04 Nov 2024 01:32:07 -0800 (PST)
Received: from foxbook (bhf124.neoplus.adsl.tpnet.pl. [83.28.95.124])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc95a6csm1593589e87.4.2024.11.04.01.32.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 04 Nov 2024 01:32:05 -0800 (PST)
Date: Mon, 4 Nov 2024 10:32:00 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH v4 0/3] xhci: Fix Stop Endpoint problems
Message-ID: <20241104103200.533fe1fb@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

v4 of the attempt to sort out Stop Endpoint retries and related issues.

General design:

1/3 guarantee no infinite retries under any failure conditions, ever.
2/3 fix bugs and make Set TR Dequeue handler call invalidate/giveback.
3/3 eliminate cases of pointless Stop EP commands, depends on 2/3.

Changes since v3:

2/3 no longer tries to add code cleanups (and bugs, as it turned out)
    to a bugfix patch, and became much shorter as a result.
3/3 dropped a desperate attempt at detecting a halt/unlink race, which
    I was unable to reproduce because it seems impossible - EP_HALTED
    or SET_DEQ_PENDING remains set until after the halted URB is given
    back to USB core, so we would never queue a pointless Stop command.

Also some commit message and comment cleanups in all three.
And I documented another bug which 2/3 appears to (partly) fix.


The state of other chips:

VIA VL805 and Etron EJ168A don't seem to have the "latent restart" bug
so they don't care about this code, unless it causes pointless retries
on an already stopped endpoint for 100ms, if it's enabled for them.

ASM1042 and ASM3142 have the bug, although not as common as on NEC. It
seems to be particularly triggered by multiple endpoints cancelling at
the same time, so for example, both loops below simultaneously:

while true; do timeout .3 yavta -c /dev/video0; done
while true; do timeout .1 cat /dev/ttyUSB0 >/dev/null; done

On ASM3142 this triggers the bug about once per minute, and prints:

WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.

The "mitigation" patch seems to be helping, because reverting it adds:

ERROR Transfer event TRB DMA ptr not part of current TD ep_index 6 comp_code 13
Looking for event-dma 0000000003715ec0 trb-start 0000000003715ed0 trb-end 0000000003715ed0 seg-start 0000000003715000 seg-end 0000000003715ff0

Enabling the NEC workaround for this chip appears to fix the problem
entirely and so far it only took one retry each time:

Stop ep completion ctx error, ctx_state 3

I have left this running overninght and nothing unexpected was logged
in dmesg. IOW, no undesirable side effects known so far. But I haven't
done much tests with bad cables yet, and ASMedia chips appear to be
quite buggy and prone to strange internal race conditions. Examples:

- the ugly ifconfig up/down lockup issue on 3142 (not tried 1042 yet)
- a pair of "stopped" events out of order preceding the above lockup
- on 1042 Set Deq on streams seems to be no-op (streams are disabled)
- Soft Retry preceding a Set Deq seems to undo the Set Deq's effect
- Stop Endpoint *success* and then a spontaneous restart (1042 only)
- spontaneous restart causes a halt, but transfer event is missing
- TRB 15 (Stop EP) on the event ring (seen only once on 1042)

ASM1042 still not tested for compatilibity with the workaround at all.


Michal Pecio (3):
  usb: xhci: Limit Stop Endpoint retries
  usb: xhci: Fix TD invalidation under pending Set TR Dequeue
  usb: xhci: Avoid queuing redundant Stop Endpoint commands

 drivers/usb/host/xhci-ring.c | 59 ++++++++++++++++++++++++++++++------
 drivers/usb/host/xhci.c      | 21 ++++++++++---
 drivers/usb/host/xhci.h      |  2 ++
 3 files changed, 69 insertions(+), 13 deletions(-)

