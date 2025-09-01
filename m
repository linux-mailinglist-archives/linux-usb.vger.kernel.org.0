Return-Path: <linux-usb+bounces-27409-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D242B3DA32
	for <lists+linux-usb@lfdr.de>; Mon,  1 Sep 2025 08:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0489189AA2C
	for <lists+linux-usb@lfdr.de>; Mon,  1 Sep 2025 06:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA42E256C9B;
	Mon,  1 Sep 2025 06:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwUuaMr+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC3353363
	for <linux-usb@vger.kernel.org>; Mon,  1 Sep 2025 06:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756709214; cv=none; b=fRIolk8j/wRlJ/nw1SPguV3W0gBbaEkcrOHUqVSIYgs20BOV3Sf3fw/5dFPWlgpNY/UzDQHxOINtFcKAxdP5aMGrbVGB6i3yp/7XgNQlJu2IfwY1pZcKxb+pkU0Uwtqvm7qLUV4xRkJ3YCt0wS0wYVSaDukIHE7Bx9bTXZMFF4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756709214; c=relaxed/simple;
	bh=Ub0T6ySA4pbQfvsjQC+ORdJIKtDuCD5MjBoKhKwLIxY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=b0TY8yMwjY4979NZoQHqpDqLlIv/T/LEHDlcG20OfmEQLx4wvrNy11r5r9IFdtmzo9SB0iY5Eb9Ryvehvwz2MXH38cP1GGPvY92O6fXNI/dSul1/Ybyu+O6JG1cRTdFRRKb/D7oW8p9Pf29ydHTYJxTh1ioQQJ5BkdD5qVbIChQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwUuaMr+; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-336c2194a65so14752121fa.2
        for <linux-usb@vger.kernel.org>; Sun, 31 Aug 2025 23:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756709211; x=1757314011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ub0T6ySA4pbQfvsjQC+ORdJIKtDuCD5MjBoKhKwLIxY=;
        b=JwUuaMr+IsUjRdnjsmrEAn3vpZcdflKw4LcRe055GT+6wKNtRmzqbi/mZuye0Y8rzX
         iKE3c8MVS1A2tiIVTj4gIdwX6582neQHvLetY/QIc5poU5mp9Gks+eNwljcJ5uXfARCz
         xqMZDTZ7tz5PTCXfB4F3NxRds4SFvdTl45E2SC2qnGCh1l1bsyRX3xJLfLtK4HMwDe7m
         7qTp3VUZIiH9wZMHmdp0n+epNYg9QIMAAoai/NIgXY7l8yKB2xbL8/Ku9+D8SaoYZqjf
         dOPsaB6qUH3JwNxomkK9YhWmPz8Iu/zS3S+Bn9myS12UXocW2udZ+b5cbNBiwlF26gf1
         JlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756709211; x=1757314011;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ub0T6ySA4pbQfvsjQC+ORdJIKtDuCD5MjBoKhKwLIxY=;
        b=saQu5xItVd8JOMT8lIbzql8jMFKEtkyhnCHkcQNuEKAvXLhpOEhnTdzLhDXWSenl9I
         evNATu6H9OMdLh44N0UUnguHL94n/9gvD/rKcEKMQ24VvqC2UHV2MaPjbuuFvWe2aFBY
         4thFsmV1GpIdlqRspxcIDJSfFCd1WVxNIl+txAWeKaYm7j0n2CFaqt91sOf3t5osN2op
         ARTd5jX/UNm8d3c86fud+dCWig45nR04Z+nD7eKb/W+jxU8zOnwhGeCp1XGaf4O/768E
         tjdXAdPVTTlI5/bVg34GoCznReqKNclb1DTu9pa4guuPQjClXx/PFqWatKhNz0T6GaCL
         utIA==
X-Gm-Message-State: AOJu0Yx/a4mgchIU9lsAKFJFsTYC3p8GyFCA7A+KgHyAB1BFKYCFfUF5
	RW4BtALc3tZ560t2axU+cB+crMMUcTRnzCOMgBJataHnaggCUlSfB7h2
X-Gm-Gg: ASbGncvtc9Xdmr2TqPVpNOfV6rPA6/lFadiapNUAQZritC3icmhtKlZxifaA7RITJD+
	AhuGEJzDRXsK0147tAvTjzV/nR1d3gtJVP2nEvp+ztvneZx+hOw7dTuDUdvsu56cZzjlBwVtayT
	K+su3TX/35i+Odf+uTw6DXk1CuHJrTqmGmX0ALu88BNQcqSn32C5zv2UIR1LqP0jMC2dEVZX9E9
	s9nb8Bhpd+ULzC0ZqsCzwcSgl0f60wbsLB/0IhprgzY1GzacmIfpDeurA1yhyYGSkfn412es1or
	vD1+b7yrGjrmU49OYR9r0qvYOwQLa5IojAa10R3jK9cqFxFgWtUmgcay8iEAFXeCRI/RiMd7oQk
	J4l+LgS+f72nZLzPDYQ6vpORlYfzju7FYZCA=
X-Google-Smtp-Source: AGHT+IHARazxgr/0K0fpgFf9h2q3RjrgHPYhxODpdXtt45F0HQE2BR2SIpxykhmWIp9YmWQ+/FCYZQ==
X-Received: by 2002:a2e:b8c1:0:b0:336:de52:f455 with SMTP id 38308e7fff4ca-336de52f908mr9796181fa.13.1756709208960;
        Sun, 31 Aug 2025 23:46:48 -0700 (PDT)
Received: from foxbook (bhd106.neoplus.adsl.tpnet.pl. [83.28.93.106])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-336d0e9d9f9sm12476771fa.62.2025.08.31.23.46.45
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 31 Aug 2025 23:46:47 -0700 (PDT)
Date: Mon, 1 Sep 2025 08:46:42 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Niklas Neronin
 <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH RFC 0/2] xhci: Simplify TD cancellation and drop some states
Message-ID: <20250901084642.2b42c0e7.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

Thoughts about this?

Thanks to asynchronous giveback we can give back TDs at any time we
want without dropping xhci->lock and worrying what we might find when
we take it back. So give back TDs as soon as they are no longer needed
instead of keeping them around in TD_CLEARED state and using a second
pass through the list to give them back.

This turns out to be a surprisingly simple patch and I gave it a quick
test and it's working fine.

The second patch removes another almost meaningless cancel status and
shortens the code a bit while adding functionality which may or may not
turn out to be useful. And hopefully won't be harmful?

That too was tested, by patching xhci_move_dequeue_past_td() to fail
randomly and unlinking from multiple streams on UAS. Works exactly as
described in the commit message.

Overall, the driver lost 40 lines of code and 2KB in binary size. The
latter is surprising, I think I haven't removed 2KB worth of code, but
maybe it affects how gcc inlines or otherwise changes functions. YMMV.

Regards,
Michal

