Return-Path: <linux-usb+bounces-1936-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 067077D034A
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 22:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B48C328230D
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 20:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6ABDF59;
	Thu, 19 Oct 2023 20:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EulO5Oy4"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5749171B6
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 20:45:14 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7C4116
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 13:45:12 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-53f98cbcd76so980a12.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 13:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697748311; x=1698353111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVuCB44VLEjsZzvUgM1w7n2lvEI4MsHtEyH+2GVq2dY=;
        b=EulO5Oy4vXgxAA88b1og3ur2Akh0sYSkPVfIpxvdGm4MMF93ZCwC1lj2M+zZLqG6eQ
         A2Pyy0EJ4bXkkrdo7FlBfFVZtAmXDPTVpWgs4MiadRD84rCsdV957TmoxHIs8fAh5OJR
         LWH+O7bqv3+BZ1CoAaTo7px+dZp2vRpOeiIoL5aSkVby89PJtAhnMCGpk9XMaHLfBIms
         vaynbKJref+ZTPRmPnc+Wwjun2M1X65PfBJ5TVBm2ZAJOmc1H34QGZIw5Zo2QtFK0zqL
         CK5pv1cXTUAZOIMeusY13UWvRnqzJaIS6rYMBqCJ7baIWJZlslahMbQxMbWwG3hfByDB
         F+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697748311; x=1698353111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVuCB44VLEjsZzvUgM1w7n2lvEI4MsHtEyH+2GVq2dY=;
        b=qt+zR5fw+v+3jHwjkZLlkBVBMlL4vciVQ0fDydulY+PgNdoOygqkgWDVYKCqZ8Pvve
         d+2aWSjJCbBWHUdq07RhY5uYbIHHe8sqVu3dxz3dfl8d/mpsGFPOG62Hyq266lW3jMy+
         e45CcD3vEofYbfN4U3C8HMFwGYkpcej9A4zZEQ8DIrF0T/MEn1JX+mkPsWow5ff4BRA3
         VlXBNOZWRoVXZ/TTjD4nci8oyL6stCtF10X16xVk6UMHKZ6FDCseIaUFqqlO5MXjqZ46
         nVoianXlnbXLH6HfE9VcxpHd/QW2oWXnbjAEaMhm7rQlJlme68vlv4bDMhxsEWwmWqvs
         FMlg==
X-Gm-Message-State: AOJu0YzUYJvNsc0omwswKj5/qFbxbzUIdS7EgVQ5MWYBw3rHP/inTjmh
	PDFtPGRo4Cl5i/rMOXHNDcpuNLyT7gS4q24yAZhHGg==
X-Google-Smtp-Source: AGHT+IHFC9ybSiyivStLgYN8fa6C0ml9tRY1/5sGB2bF7uJu4CHMtn3ZiatZMgc3HYBkARDtPGQ6AHj9IsKbPrz5vok=
X-Received: by 2002:a50:9f41:0:b0:53f:91cb:6904 with SMTP id
 b59-20020a509f41000000b0053f91cb6904mr27602edf.4.1697748310674; Thu, 19 Oct
 2023 13:45:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231016232816.3355132-2-rdbabiera@google.com> <ZTDkIGLmjmL9HwJP@kuha.fi.intel.com>
In-Reply-To: <ZTDkIGLmjmL9HwJP@kuha.fi.intel.com>
From: RD Babiera <rdbabiera@google.com>
Date: Thu, 19 Oct 2023 13:44:59 -0700
Message-ID: <CALzBnUF-EZjFEHCc4XRLdFr5yP8dCq7De4SaNif32LcL5=tMYA@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: tcpm: only discover modes the port
 supports svids for
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux@roeck-us.net, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, badhri@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heikki,

On Thu, Oct 19, 2023 at 1:09=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
> I'm confused here. Is the device here the port or partner (or both)?

The port, I'll make sure to be more precise when describing.

> Why are you skipping the first SVID?

Skipping to the first SVID supported by the port when preparing
the first Discover Modes message.

> Please note that the Type-C specification puts priority on TBT over DP.
> Is this in conflict with that?

Not in this case. Assuming the port supports both TBT and DP, a Discover
Modes message will be sent to both regardless of what order they return
in the Discover SVIDs ACK message.

> > Fixes: f0690a25a140 ("staging: typec: USB Type-C Port Manager (tcpm)")
>
> I think that's wrong commit (perhaps you want 8afe9a3548f9d instead?).

8afe9a3548f9d looks to be more concerned with the consumption and
processing of the received payload, I had put f0690a25a140 because it
contained the logic to determine if the Discover Mode message was being
sent at all as well as preparing the response. 5e1d4c49fbc86 does touch
the response formation but only the svdm_version and not the SVID.

> Right now I'm not convinced that this should be considered as a fix at
> all. I don't know anything about the test you are talking about, but
> if this patch is just about making it pass, then there is something
> seriously wrong.

I use the VESA DisplayPort Alt Mode on USB Type-C CTS as a reference.
In regards to this being a fix, if this ends up being more optional (discus=
sed
below), then I'll remove the fix tag.

> If you need the modes to be discovered in some specific order, then we
> need the framework to allow you to do that. So perhaps the tcpci
> drivers should be able to supply the preferred order to the tcpm?
>
> But as such, unless I'm mistaken, this patch will change the logic so
> that only the partner alt modes that the port supports get registered,
> and that way are exposed to the user. You can't do that - right now
> it's the only way we can inform the user about them. All partner
> alternate modes (at least the SVIDs) must be exposed to the user one
> way or the other, regardless does the port support them or not.

The test this patch tries to fix could just be written without consideratio=
n
of this. My guess is that the test was designed such that the SVIDs before
the DisplayPort SVID are unknown to the port under test so the mentality
could have been "why should a port care about SVIDs it doesn't know
about?"

A defense I could make for it is that the USB PD CTS doesn't test
to see if a port under test sends Discover Modes for every SVID returned
in a Discover SVIDs ACK, so the interpretation isn't invalid. I've seen oth=
er
tcpm implementations handle Discover Modes this way as well.

Regardless, you're definitely right that the user should know about all
Alt Modes/SVIDs - the port would lose SVID information without
registering a partner altmode for it. Currently I think the approaches to p=
ass
this test look like:
    1. Your suggestion - let the tcpci decide if there should be a
discovery order.
Alternatively, let the tcpci decide if it wants to opt into this
patch's behavior of
only discovering modes for known SVIDs - a strict discovery flag.
    2. Send a Discover Mode message to known SVIDs first in the order
they come in, and then to unknown SVIDs. The test passes and no information
is lost, but it's unnecessary refactoring just to pass one test for
one Alt Mode.
    3. Don't send a Discover Mode message to unknown SVIDs, but do register
an Alt Mode with blank info for that SVID. It passes the test without havin=
g to
do any reordering compared to the first option and it preserves supported
SVIDs. But, the port would lose information such as each SVID's Alt Modes
VDO plus each SVID can support more than one Alt Mode.

Let me know if any of these approaches sound worth pursuing; I do think
Option 1 does make more sense than the others.

---
Thanks for the feedback,
RD

