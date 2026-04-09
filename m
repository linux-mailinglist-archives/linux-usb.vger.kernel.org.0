Return-Path: <linux-usb+bounces-36093-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AbXAFdh12l6NQgAu9opvQ
	(envelope-from <linux-usb+bounces-36093-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 10:20:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 929163C7AF2
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 10:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A62B330610E4
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 08:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EAE3A3E9E;
	Thu,  9 Apr 2026 08:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="hK8QAq97"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD69396B68
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 08:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722548; cv=pass; b=kwzlro34RNrI7NYwWKEcpuyT9OMPeSCvD0SX0CnX5EmwuTTD/LXBl/+A0ldEtQLU5uJ8HsFvyMm3vLgBr1s8EN9ak69qE6aBadgPMRTGF6vRn0pyiQ6yV1Pe9zqsMY2mautGK9klWtfH7kSyD8mvX89oYTfwsOPnq/y5bAwAzb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722548; c=relaxed/simple;
	bh=Dngotpoiby0FdEKfKRicFCk8dHaAyFjbpWnfFURByR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DcaxmlK7iYssQ89GsgkuF84ZzpGu4EqWiHSlBmJ5DOMbFXNAfpGgbnRZUx9+b9PntzChsJmF9j8ms5rju2Txc7obi7wqjp2cYZX/zNb7CvzpOPIi5oqgi8zMj59mrVJ5WtcxVbHl9zBmZOsOQFXihkjiwEINkOJ80Au3miDW+d4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=hK8QAq97; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-65003f40a22so522700d50.2
        for <linux-usb@vger.kernel.org>; Thu, 09 Apr 2026 01:15:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775722546; cv=none;
        d=google.com; s=arc-20240605;
        b=jv90z9yfgnvMin+9j12wnHt6kZOkdOIWaq5luG7PFxQIXebSqDE59Td3z4LXUtRaoL
         pOCmJJao42o32hDzZiSfA2HSBdBYK4Rf1XFwRvnSWB5MzmDy4v1HHrUT94bTtAppkIz5
         zPyxSzpMjIit1oTD2lN+T3p8igo9nWT2ThLkkI33wYgQUGLnR96ho46/1E1WYaWJph/v
         9T/TvJzUrlYnapaaasYCWfjy5gAHlUZfcOfRFSPolt2Uh/Gwicm704Ua1sJNCMijVE26
         lDeTSqm1ZHvqPg941lCebZIpqWJVlvBVsAAzEzpE7B+4I+IxY2IAHlduDvIqRUm7oIu7
         KPXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dngotpoiby0FdEKfKRicFCk8dHaAyFjbpWnfFURByR0=;
        fh=3le2396DpK6eKqIfXJJhX8yOm++m5xMrSIFn+xuBLfU=;
        b=CskaeURBbRvwdNBzuoPGIdNHUQ9ZejLGd747y8xyFRD+J8/goXWj/MwKrscTDXBe7y
         y2D8dMrMZgjpr0k9tecTVJvlPsQfAduSJQZCsZ/QBNzINgZ6iipsLPEIU+TeDp8b7Dw3
         KyTRUjoLrL9UrO+7+gydksojoaB2pkBbfEc5BIJ5zLkP9yqvUcDidhzTuL2Ictp2SXwD
         LNAIlkgkP0A4wGrDRetk7bWyCUHPjB6uifPxJF+zHk2VCyOJlMNBnENwDUfa+ZgdJkBM
         gtKJlNkMAtGayNWHvVgWT4H8/sMzdcwA4VRApWDFDOAKDOFGVKXB6nYUsMEqI6KKaD5N
         iW1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775722546; x=1776327346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dngotpoiby0FdEKfKRicFCk8dHaAyFjbpWnfFURByR0=;
        b=hK8QAq97TlIOoUC3QXTQogSkiZ5m0vdteO2CqmRT8OD8bwfmVSQVKwb2AfKSWKd8x1
         5omp5PoAQxvuew0sos0lP+Bez4zcRbLI51aH7r5EDDVs1bshFInZoziHjOVJ6KUw+njk
         itjwSNNtufrhKpAf2sQRopPferDvPivo+4Z6S//3cTbO3dtR+rRR1Fuh/WJQf4ahxd3/
         jROhSNHiPy+QkNUa3D5k8HY55knVpJw4J+Mq6tFHixiDOmujL+tS2A9beuKTntQsVTPH
         MXNXACM+Ofx6imiR6LU+p3yqgRiC4yeAobPgxBOWan4C3sbU79Y4Ugj59GT0EWJq0IK8
         Xe7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722546; x=1776327346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dngotpoiby0FdEKfKRicFCk8dHaAyFjbpWnfFURByR0=;
        b=oqnhdQuGfUuq9bc8+ZH6QszGvt2rOQZvp3cw4nwWQXZLeGduXVF6BU56yv99DbcXhD
         fnBJWbUUQ5cwJKYBBrtGD18MtsAugTgShtaQYBGYK8FqSadq69JhSq6c9PzqOUnYkus0
         Vo8bYAlXgfAuh9qrXTllYhGP28WEyUxLJYZ3VT+qjFUjO47d9KpE8G4yYbyMBPzfzDtY
         gYHFTzLSy8M2IzreG00WypVuXaMETLkYEQeRLXY7Y3bFHQKRcCyXKD7iybQotI6A5k1K
         23uzBi7dnDq4JqlLUd7koWEwb1fg2/YTYf0A5N/Ify7NClqvk8dHIrvb4uobY2dzv0+Y
         05dw==
X-Forwarded-Encrypted: i=1; AJvYcCXnuS7uoUcBTuZZNEGUjdT0+VUE0N/fqsbuMe9jGOTopvhQn7mksqlWD8YLElnxla31S/ds6racN3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDUhYKjs6f2ENPdue1yHZu+hh/gFXZjVHPoWcfAqWO3t/r4SVL
	Qx2Lkg2GqtVCnkJVSWCiK46PN6h3G8ckafWF4LuP1WI9qGvZCgXnkm4ifF9Ha/m7AxLZC5C2csS
	6p82R6mV0ym5ObrbCqSl3lj1KWEv5FT96SJ3XR7O9
X-Gm-Gg: AeBDievSQFtN1Vjc/OUWX09PC+3cy6nvgZosACvaWj3HGbLosXyJaxHH8tPOScSJAkm
	2OQ1omzmPs8ghKHpcn6kRX8YBL4Zm2jOR9QU95bx6EKr2JSCPqC54l+UFhGVrh4uh/XvH12Fjam
	kCHZC9REI1W2IiCGEnOSVHZXdFkfeLjDIVzsej3HcLzxhSrONp9O5E6P9jVnwKTfzYKSsfUQVs6
	qpFRY2qIxhUO2j4qqsWYxuGZybp5Xk6BOVHNIMOThHHyYM0ojFeaze+BVmgYudt3CEs123G9Y3Z
	wYAD
X-Received: by 2002:a53:ea4c:0:b0:650:3039:6c7d with SMTP id
 956f58d0204a3-65187573bf5mr1888711d50.12.1775722545547; Thu, 09 Apr 2026
 01:15:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260331003806.212565-3-jp@jphein.com>
 <CANiDSCvsxP+npQTHUrMTp+Z8XULYKSLTz2AFu+WQnsLbRBGa2w@mail.gmail.com> <20260409100247.7cfb62d1.michal.pecio@gmail.com>
In-Reply-To: <20260409100247.7cfb62d1.michal.pecio@gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Thu, 9 Apr 2026 01:15:34 -0700
X-Gm-Features: AQROBzBsC-Nkq1RmMLeEIh8sjrySSruolHrCkdk9eliqPcQqpZeF-BuE1MuBPPs
Message-ID: <CAD5VvzCr7gOxB2J5A6Bpma5+4OTn0zFDmpyzb3N016-BS4a87A@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile firmware
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36093-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,jphein.com:dkim,jphein.com:email]
X-Rspamd-Queue-Id: 929163C7AF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

Thanks for taking another look.

I will reproduce the hc_died() crash with dynamic debug enabled
(xhci_hcd +p, usbcore +p) and with all unrelated USB devices
disconnected so the logs are clean. The slot 17 stalls in the
previous logs may have been from another device on the bus --
I will make sure only the Kiyo is connected for the next capture.

The crash that kills the controller happens when starting a video
stream (LPM disable failure path). I can SSH in to grab dmesg
live during the crash since the controller death only takes out
USB, not the network.

Will follow up with the traces.

Thanks,
JP


On Thu, Apr 9, 2026 at 1:02=E2=80=AFAM Michal Pecio <michal.pecio@gmail.com=
> wrote:
>
> On Thu, 9 Apr 2026 08:45:17 +0200, Ricardo Ribalda wrote:
> > Hi JP
> >
> > On Tue, 31 Mar 2026 at 02:38, JP Hein <jp@jphein.com> wrote:
> > >
> > > Some USB webcams have firmware that crashes when it receives rapid
> > > consecutive UVC control transfers (SET_CUR). The Razer Kiyo Pro
> > > (1532:0e05) is one such device -- after several hundred rapid
> > > control changes over a few seconds, the device stops responding
> > > entirely, triggering an xHCI stop-endpoint command timeout that
> > > causes the host controller to be declared dead, disconnecting every
> > > USB device on the bus.
> >
> > A usb device shall not be able crash the whole USB host. I believe
> > that you already captured some logs and the USB guys are looking into
> > it. I'd really like to hear what they have to say after reviewing
> > them.
>
> Sorry, I forgot about this bug. I will take a closer look at logs
> later today.
>
> I see that there is a case which crashes the host controller, but
> without dynamic debug. It would be helpful if this can be reproduced
> with debug enabled.
>
> In the future, please also make sure that there are no unrelated
> devices spamming dmesg, like "slot 17 ep 2" in those "stall" logs.
> Please find this device and disconnect it or unbind its driver.
>
> The initial cause of all that may really be the device getting
> locked up for no good reason, but not 100% sure yet.
>
> Regards,
> Michal

