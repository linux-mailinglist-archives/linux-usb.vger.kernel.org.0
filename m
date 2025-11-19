Return-Path: <linux-usb+bounces-30684-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BC2C6E202
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 12:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2C3AC34E32F
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 11:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AECC30C366;
	Wed, 19 Nov 2025 11:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3gHq9BP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097705B21A
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 11:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550136; cv=none; b=iw/QRagX/EQYQqPY7Shfvui2UAGNliADxvVFp1kffG/3BJ+b0SYJ7xiISvbOEAXf9NgUfaSbctieujFJS6hri8Zm6jKbfBSL4zHGR5BEQJ/m5hnRR4ZIs0tj2NeADsC3KDPy5hnMwZ/u/WeEDeDCV/efjkMYGO9yx+CJm2iIhJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550136; c=relaxed/simple;
	bh=fvmZiiuC9jCtgaL8qw/5yNya6Ce+iiqP2FKgu7P/vIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AT12OkxZ0IJibXZ7UCG8wKGNfRM7TwG8B3dTnJKoVoFsTGbWR769T0CZWw7YWQglz/hrKkfOGbCOIjzp9s0opkSnR3ECLi2l1wE6t3xTkO1E5ewxP5zQTKIZk86eogXUJk81mvN4d4RtHsDBGbg/npxJIGG4VkIWiVehhDfhUjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3gHq9BP; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so10383110a12.2
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 03:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763550133; x=1764154933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K+jLnN1hAUVFGAduW9V62lyAXS4wcslys/Va1Bxsbb0=;
        b=X3gHq9BPSd28dcm2PRYR0Xje2jXSqLHMLsjFmLSzrdJo7PX0pzxmOiaqKEZdm3FCTV
         LfKuOhmpxqrluSsttvDhi+KqfleG4aZvTmEccFaucC/YkA/KHYhAotUNO22nsrEP8XG+
         DgDRbRdhFBnkxf+F13WEY90e1o9fkE3YaY6blTh5RxuZA+Q/yBtzLwT6KXd25sCrD9/V
         I4dM6NcOQb4/w23tF+dfNbMXX6qoZDeUpMg0RZRNW5p5w9gqOWfSKHbCRr3hwDr9vwDw
         Pi9gZT+9Z8m3tLvbjrzbVHVHCesiuSnlzf1Ti2rbhHHrbhPHIZZGOWxe6iOiEYIREoqe
         GnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550133; x=1764154933;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+jLnN1hAUVFGAduW9V62lyAXS4wcslys/Va1Bxsbb0=;
        b=RGvQZ7oPXRWtDNC549G83AFn3dpv2k/kw0J7jmOnlSeRGlnOH8eA1EpPGBvYei9JwT
         5Kh6fihggIMmFyxUgfAvsXp6oVp0zpBjhkdml0vYyKYI0IKQyWiqracaU8Q0czLtR/KA
         /AKx3kV/vRRql/F3jfwrVKOudDyUNWyPnrLTuw9oIXcyj/KQJRdVrp+Ukc7pNww+PoIH
         TEnWXRV4rs2VvP2bzq3a29b6815iqDJ4FQJrKfBbytjZ4Rk6b28I2gRPP8R8+GJZqWXC
         Yd7z0FeRrq7Cd8IFEIqX8rlVwsIlWNLts2k3EDl2NlucI7ZgjQY13yGQRNmoh7/V+7+v
         tDxQ==
X-Gm-Message-State: AOJu0YzR/Dkek3qHlA3LZrDBcI1wXF57Q71iV2p7Xl19nzXTiJObAyE1
	mui/DusVwTPYPQlftgMw5kIcg0aix31piaJ7s1QJR2MCsSsSuTXy4LwL
X-Gm-Gg: ASbGncvybuJ9Hu6HkL4q9eFkKWzJshJXQXWfSUA92Dl67VtDiJQeoG3+rcfBRMkDAwd
	hwoV4mrF/BhKbdWF2vZfGXfdPhHXkWtByzD0SPmWhnpGbTkyrqpVjIiDLk+1IFKD9SY0UrakmQV
	NwWhByJVfNCYMIiVNjm13QTsr4Mr+DzdizgwoFnV4rKjkbq6BvwErS16Q+qcT7ro568nRFABNmk
	GZyFOOBFwWU8bbGAGHfV3Ih2Cf2+p5i/mdtG6NG8rPLQ1lZ6NZ6kJHHr9dUTURE5VyuC0RbYeUv
	/mOSRpxV1i5lRyOWaD8ObnXDesmiiNSog6TjA28TZbO+80f45B0+ItZA4ALLFegKOJvPaK+OJgA
	KvquckutfyPUv/oGBXe/z+0Xy+QKNcnUVv+uLPajkFHu6IVUr7Pw4+aW0cSkh7kMUnOOnVVwVZx
	yEV44na3vOTm2Smt6Meb8F1qe5yKDHLII5iA==
X-Google-Smtp-Source: AGHT+IG1afES/XV2bo4MB7VzzF+Ue9Ifqe7vhIWAKzFI37FLf/iR5dK2plv5L3tJ2TcBJbQi4ks7Aw==
X-Received: by 2002:a05:6402:2806:b0:643:5f45:6fa5 with SMTP id 4fb4d7f45d1cf-6435f457518mr16163433a12.33.1763550132952;
        Wed, 19 Nov 2025 03:02:12 -0800 (PST)
Received: from foxbook (bhd138.neoplus.adsl.tpnet.pl. [83.28.93.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6450857c5c1sm3228143a12.27.2025.11.19.03.02.12
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 19 Nov 2025 03:02:12 -0800 (PST)
Date: Wed, 19 Nov 2025 12:02:08 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] xHCI: Decouple updating Dequeue from giveback
Message-ID: <20251119120208.6a025eb0.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

This introduces unified mechanism for handling all short transfers
and errors mid TD plus their later events, accurately and in-spec.
I have been working on this code on and off for the last few months,
it's dead simple conceptually and tested a lot on various hardware.

When a TD completes early, store its end_trb on ep_ring and give it
back. Use end_trb to recognize future events for the TD. Remove the
SPURIOUS_SUCCESS quirk and unreliable comp code guesswork.

Isochronous TDs with errors are given back instantly, which reduces
latency and eliminates the need for error_mid_td flag and some hacks
like handling Missed Service only to give back error_mid_td.

Dequeue will be moved in accordance with received events, never to
the next TD right away. Previous code would do that on Short Packet,
allowing overwriting of remaining TRBs if it happens across segment
boundary. Rare enough that no one complained, but obviously wrong.

We will need a trb_in_range(), and I used this as an opportunity to
smuggle some long-discussed changes and improve trb_in_td() usage.
After converting from dma_addr_t to trb* once in handle_tx_event(),
pass ep_trb instead ep_trb_dma to trb_in_td().

This requires a rewrite of trb_in_td(). New version is easier and
shorter. While I'm aware it could be shorter still by using segment
numbers, it has two advantages which I thought are neat:

* It can detect when "suspect" TRB is on a different ring than TD.
  This means it has a loop, but common cases never enter it.

  (And yes, I've seen this warning once, but I suspect corruption -
   DMA UAF was involved. Things improved with pdev->untrusted = 1).

* Needs only one segment pointer (suspect). Call sites are tidier
  and I don't need to store last TD's end_seg together with end_trb.

Alternatively, segment numbers can also be used, but I really wanted
to see if the code could be less noisy.

Regards,
Michal

Michal Pecio (5):
  usb: xhci: Track transfer ring dequeue progress properly
  usb: xhci: Find transfer TRB early in handle_tx_event()
  usb: xhci: Refactor and generalize trb_in_td()
  usb: xhci: Reduce error mid TD latency with a new "done TD" mechanism
  usb: xhci: Handle short transfers as "done TDs"

 drivers/usb/host/xhci-mtk.c  |   5 -
 drivers/usb/host/xhci-pci.c  |   5 -
 drivers/usb/host/xhci-ring.c | 318 +++++++++++++++++++----------------
 drivers/usb/host/xhci.c      |   7 -
 drivers/usb/host/xhci.h      |   5 +-
 5 files changed, 174 insertions(+), 166 deletions(-)

