Return-Path: <linux-usb+bounces-21662-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FB5A5D2A8
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 23:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1D363B8FD4
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 22:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C56264F9D;
	Tue, 11 Mar 2025 22:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUYgiRn9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A167264A7C
	for <linux-usb@vger.kernel.org>; Tue, 11 Mar 2025 22:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741732908; cv=none; b=KSbAnNilhxdMrc2BGiNQ9cya4lkuyMCWcaO1GpWPufwU9evrlXwtAgK99Kbm0mSQBEmQyCK5I4n0KpS0J5aeFBaVUPD+Y916eNXqflBBpavy8YZiv1Jy1YYRtASItBbbhcNlu90K7bybWxgXPWvmGvx1pezHlHjqDXSslh5r0wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741732908; c=relaxed/simple;
	bh=LqZGd+hJkkJefIyvCzrrJJXZGXnv0+QOyTvIuUL1nGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VPi23Fq6LEW8TVS96JPJs+NWb+fcNrQJKn67RY0QSiK3oFqmv8Fh/zKHksqUx7y4QTKKw9n+IW/peq7nbJc7XYPhXWoR+avxgC9ck84ixi0I5vX+rzOWMESvL3MIE6xpyJY6HdpxCplYX7yA/FbFL6m4rKpm9WZI3xHj5XFHbsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUYgiRn9; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab78e6edb99so911631866b.2
        for <linux-usb@vger.kernel.org>; Tue, 11 Mar 2025 15:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741732904; x=1742337704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LqZGd+hJkkJefIyvCzrrJJXZGXnv0+QOyTvIuUL1nGk=;
        b=RUYgiRn9wm8cBBtgngYnWYc9VM5AEvIWE+NGCZTNsXdvE4MvJU5da01Py22BiX0x4L
         uAMt2a7DDlIODrw6EpcCerYYSH7Z1ugjOi20pEPlFtYMoTbBkpqlIwswA4LxUFbz9tNX
         Wsw7ZIQ35MlJs7mnSXICvAdRcL0S58qvJkN9l57NMJs1PnOc+WHCelprl+KQz/BcoWw+
         x/kBwFwCF2CO6sqPtToynYYKWxSOAMD/HSOCNjhgs6XsFNY0dVBkORBjDnFwbPhN22wa
         qN6jcvOFD6c0BcuSHqFEnM49wbm/HX869mnE0Ah4f1aAkcnG2xzncgzzjtnwQZYmu8FX
         OCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741732904; x=1742337704;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqZGd+hJkkJefIyvCzrrJJXZGXnv0+QOyTvIuUL1nGk=;
        b=hEQvZYIL+1UvXzUDvu5wdEUF9R3OAQ6/7kHHS1+jBbLixaiptFXYa5ciXR4QfLIYH+
         At+VKhJCbPmKjQLEyFLvDJOm9H+/HaJfQVJIqLTkL/nZXFGc/Rg/sACAHME7t6XBVhJB
         TCDiZ2TtbM28hNu+9PQetKlQQu6Soy9Nkvw6U2E+gHF9KbUcpxDagX21FvJ3yko6eh9i
         zhDpkaCb0PSzFgTQwEaeKKa8BPloRgQi0Tn9sE/yX3W4orLvgoKdDlkAxlzd5hojJtNX
         N3sQugdi7dq0H61vY0iLFRTHTpKY73gzcIykf30CBIAKWY2wXHIaPjuucYQulxFwl4N6
         ur/w==
X-Gm-Message-State: AOJu0YzENHK2kNVf4yaiAKMd42+IcAVaPpJEM1pdKm0RPC0WNN3Ti2yn
	mpoXdBAQSDA2tQ5HZT5p8VNzcxPcF96lzyT63G3HI5zNlgkg4LajJyQa2w==
X-Gm-Gg: ASbGncterd0aJluatcEFQbu19MpXa5l7+izh00PKgo6HGYw2zNjxqVAmEczk9yRPswt
	rpTSBDSl1sEFPbA0FxMT8cjcQiiOvy8MOq93070OUOHXn1xUv7NEYkEAy9aaYlChkQ0wDhZDdnn
	3UzffKHucVddU30jgYdRe2/iPYMtAn/R7Ll0qhvkTPSoMqpMOYCAO69kRmqTac5PT9kaJdmoYog
	dnKXmGN/3XIHdQprk68qI81aihOa6Rt0WbnceMjNaBON8WWp97e3drKw6qRwnVBEUnPUnOe2Pm9
	QlImJmThN74X4Jb9lZgyDYFBz2JUCk82yYa4aKAsydsB6Ii3SavcF0bNHw9kSg==
X-Google-Smtp-Source: AGHT+IFR5ZN6GrJujkLh6GWuYDmCWNvi8rtl1rbVYjX/ZWmDvaqdy72SsMD36x+19lykktRK0VaTGg==
X-Received: by 2002:a17:907:97ca:b0:abe:e981:f152 with SMTP id a640c23a62f3a-ac252fa1113mr2403754666b.37.1741732903878;
        Tue, 11 Mar 2025 15:41:43 -0700 (PDT)
Received: from foxbook (adts246.neoplus.adsl.tpnet.pl. [79.185.230.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23988c542sm984110866b.134.2025.03.11.15.41.43
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 11 Mar 2025 15:41:43 -0700 (PDT)
Date: Tue, 11 Mar 2025 23:41:39 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: My transfer ring grew to 740 segments
Message-ID: <20250311234139.0e73e138@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

This happened under a simple test meant to check if AMD "Promontory"
chipset (from ASMedia) has the delayed restart bug (it does, rarely).

Two pl2303 serial dongles were connected to a hub, loops were opening
and closing /dev/ttyUSBn to enqueue/dequeue some IN URBs which would
never complete with any data (nothing was fed to UART RX).

The test was running unattended for a few hours and it seems that at
some point the hub stopped working and transfers to downstream devices
were all returning Transaction Error. dmesg was full of this:

[102711.994235] xhci_hcd 0000:02:00.0: Event dma 0x00000000ffef4a50 for ep 6 status 4 not part of TD at 00000000eb22b790 - 00000000eb22b790
[102711.994243] xhci_hcd 0000:02:00.0: Ring seg 0 dma 0x00000000ffef4000
[102711.994246] xhci_hcd 0000:02:00.0: Ring seg 1 dma 0x00000000ffeee000
[102711.994249] xhci_hcd 0000:02:00.0: Ring seg 2 dma 0x00000000ffc4e000

[ ... 735 lines omitted for brevity ... ]

[102711.995935] xhci_hcd 0000:02:00.0: Ring seg 738 dma 0x00000000eb2e2000
[102711.995937] xhci_hcd 0000:02:00.0: Ring seg 739 dma 0x00000000eb22b000

Looking through debugfs, ffef4a50 is indeed a normal TD, apparently no
longer on td_list for some reason and hence the errors. The rest of the
ring is No-Ops.

Class driver enqueues its URBs, rings the doorbell and triggers this
error message. The endpoint halts, but that is ignored. Serial device
is closed, URBs are unlinked, Stop EP sees Halted, resests. No Set Deq
because HW Dequeue doesn't match any known TD. Rinse, repeat.

At some point end of the segment is reached, new segment is allocated
because ep_ring->dequeue is still in the first segment.


Sow how does the driver enter this screwed up state? Apparently due to
a HW bug. More detailed debug log from a different run:

[39607.305224] xhci_hcd 0000:02:00.0: 2/6 (040/3) ring_ep_doorbell stream 0
[39607.305235] xhci_hcd 0000:02:00.0: 2/6 (040/3) ring_ep_doorbell stream 0
[39607.305413] xhci_hcd 0000:02:00.0: 2/6 (040/1) handle_tx_event comp_code 4 trb_dma 0x00000000ffa80050

The 1 in (040/1) is EP Ctx state, i.e. Running, despite Trans. Error.
It looks like finish_td() sees it, ignores the error and gives back
normally. EP Ctx is still wrong later when the next URB is unlinked:

[39607.398526] xhci_hcd 0000:02:00.0: 2/6 (040/1) xhci_urb_dequeue cancel TD at 0x00000000ffa80060 stream 0
[39607.398531] xhci_hcd 0000:02:00.0: 2/6 (044/1) queue_stop_endpoint suspend 0

But Stop EP fails and updates it properly to 2=Halted:

[39607.398655] xhci_hcd 0000:02:00.0: 2/6 (044/2) handle_cmd_completion cmd_type 15 comp_code 19

Then the EP is reset without Set Deq or clearing and ffa80050 becomes
"stuck and forgotten", initiating the above problem.


The fact that EP Ctx state is Running for >90ms suggests that it's
a bug. But a race could have similar effect, and I can't find any
guarantee in the spec that EP Ctx is updated before posting an error
transfer event. 4.8.3 guarantees that it becomes Running before normal
transfer events are posted, but suggests not to trust EP Ctx too much.

Maybe finish_td() should be more cautious?


Michal





