Return-Path: <linux-usb+bounces-37189-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLTrIEOx/2kj9gAAu9opvQ
	(envelope-from <linux-usb+bounces-37189-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 00:12:19 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 036EA501A61
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 00:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FDF7300EC8A
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2026 22:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F142D3D412D;
	Sat,  9 May 2026 22:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UixAovcQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4E8312803
	for <linux-usb@vger.kernel.org>; Sat,  9 May 2026 22:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778364733; cv=none; b=RZLpO7pEK7XxjSMZIuM/f5H0/IWqBJfeuNSvsDF23pdOsTJx16YIy5N8trxme01bLx4osp5PRU7wN4vuTaaY10Xewr+WK5w77S1AIasPaH4hGRnXng6yJyLJeGkaHzBRYy7COPlnvNK5tunF7zhNvSW9V+25fS1pIv5HuwHJZZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778364733; c=relaxed/simple;
	bh=1/lZs7rpklYOa1Pt2xPIsui+GTwuh89R5y1t1h/U2DM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SCvhv+7MWwsj9Hz258xtl96C0tvWNv8s43/pccgbYOnY0gkW262zRCxQqa4KHED2h5Qu2YD6XMQgKZG6UZ3//3s0GC+v3NtGmRLktA3MUlkf9ycOYDaaGaVwp3NLFt0axycgpi90GnIWHHlmVuHqg6dctFrhSCkwhwlOcHyl65M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UixAovcQ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a865d1547aso3870879e87.1
        for <linux-usb@vger.kernel.org>; Sat, 09 May 2026 15:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778364730; x=1778969530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KITeipvmTQTeRXel/IJrFyGNXKz0aAcNGMOTKZiLD6w=;
        b=UixAovcQY/ZeZEfcWqO5+XsLXDgGAlqO7OXSsgsLs+sV41sPbsuRUow4FPeY3PoCCy
         m+lDeK9fb55mq6fZaRGBi4LeeaAgHA9u+tAkA5lTh7OOebz+k1tk7NTH9JWFtPLnmUNx
         8B8ND0NzLoXcQHYRej92HDACXwJ4GIF4HtxatcVWFPe0ZWdrwyokpLp6qGiPNZr4Cwe6
         kX6/lEGmh+bP/cnPnCUynbsGardt9yglS/0TvKFi15ZGPV0DioKHU5aoLUDdJpG0PISQ
         PPu1AYt1of5fyHN48RNyvW/522I7dr7qA6pS0IlQkzk4gxRVTQo5bOQfyNJhtWR/psHl
         dgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778364730; x=1778969530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KITeipvmTQTeRXel/IJrFyGNXKz0aAcNGMOTKZiLD6w=;
        b=FM75l4vDDTP9va5WIbm/fxhg9qpFH5low6X+h1lahsf1l3fvr2vBhFPQyiBrhJv/xw
         NRQlG4r0FWo/+Lq7FTbBuJbI+IbSUdd0JySn+t7/gT3lmdv5a8AQ/He9V20ImvkMkMSc
         YDyEJv3ikO+Ta1740a5IBkT2tUP4t/zP405LcKc4z1ErVuPIlodLn9oAFSTM92nqjCG7
         z2QB1MZjBgsMjHTjNadJj5MBOig+nnZfe+mJheCYyJHnDlnImPmccV99ymBjClHEszQD
         mxCEpd3ek+E53IprYjPbYoP8ek6Kocj4oZu9fGa+nI6n4jmR79TiAEtBURpYyJcfn+fs
         kFXg==
X-Forwarded-Encrypted: i=1; AFNElJ/57HVE/SLb2dcyR5LbLOjKpWdH+dpZmrjJ2rYB5+Typ7RVnuTWwbS+cT/29kQ85mEsy7/9N10O5Y8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzByWkU3Du7UB7bX7tWEUnSAXhzUfQrI1URPXSb3Uao+T5u7D6
	UDHsSm0/yUWPUw11GQjcfyev39eGNx8PQchbVqXgw4VLP5LcrsQmeeRC
X-Gm-Gg: Acq92OFGngpgIee8h5nZxOBK1BXBvUi7Qk4Au9Yp7bP7Kv6B7O3fifU4f9lUbqFdAQJ
	F3veR6qI74+ey7+6vNzJGnRgYab6m2cG0sJ1UgeXkqhq8A3lc+HwKPH2wGhjFwxxBAUIWT9tiYL
	/B9bLdD0S3nGMOYFpC+dB9e/evtiDx2gCW+8h3Nm8eFK6mI9jR4+tzW/Z+/8IhBZfPPOzrgKkKK
	DzgZ9X5yDIUoTNgMjpta9QRZ3Ik6ST64uI1pMQup0ItWVGWbIOB+phEtwpBRVh7MNnHfhAnGSTg
	9Sh7N9HMGaAJtiSNX+gYTI/GWBX9cy8HfbNd3iolphUvdlEwgMk3GqUfnyU5EkOXa9AJV1utdiJ
	ui0qUCVvtL+ChfG3XitZBGrDnYdUNmfgFKQjG/Xaost7l4WJsLLeHBTuXcRUqvSsG5hGlmwETBk
	OF0Fv2mAYBoh8L97q12tZ24XcJrMsj1/4kbJM=
X-Received: by 2002:ac2:4f03:0:b0:5a3:4692:61ce with SMTP id 2adb3069b0e04-5a899b8fc3emr4452701e87.1.1778364729897;
        Sat, 09 May 2026 15:12:09 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8bd7d8964sm511890e87.65.2026.05.09.15.12.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 09 May 2026 15:12:09 -0700 (PDT)
Date: Sun, 10 May 2026 00:12:04 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Dylan Robinson <dylan_robinson@motu.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com
Subject: Re: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame
 and always assumes URB_ISO_ASAP is set
Message-ID: <20260510001204.7a4d5faa.michal.pecio@gmail.com>
In-Reply-To: <CA+Df+jf=UaVubKM1Pfu7sgREUMYv=6QMi94mbhhefjhXq8-6uw@mail.gmail.com>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
	<bug-220748-208809-eL7PrzeMxr@https.bugzilla.kernel.org/>
	<fe08eabc-4f92-43fd-89d7-5e9d0e35c979@rowland.harvard.edu>
	<CA+Df+jdtQrYye85d7uZyT3jirsztKhf7qQes3LvOAPa+9qxSOw@mail.gmail.com>
	<87d93b07-be3e-4c36-a6cb-97190560f648@rowland.harvard.edu>
	<CA+Df+jfP-idvQqNrGo7Tc7+03ruh6kBa=MOSXE1mwXL2VqLNrw@mail.gmail.com>
	<a756038c-270b-455e-9f53-51b1ad6a31d0@rowland.harvard.edu>
	<CA+Df+jf=UaVubKM1Pfu7sgREUMYv=6QMi94mbhhefjhXq8-6uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 036EA501A61
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37189-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, 8 May 2026 13:20:04 -0400, Dylan Robinson wrote:
> Our High Speed and SuperSpeed devices always use a bInterval of 1, so
> they expect transfers in every microframe. I'm less familiar with the
> behavior and expectations of endpoints that use larger polling
> intervals.
> 
> Perhaps, rather than treating this as a "specified start frame", it
> would be better to think of it as a "specified start service
> interval".
> 
> If a driver requests a start frame that is not specifically available
> within the periodic schedule, it seems reasonable for the HCD to place
> the transfer at another valid position within that same service
> interval. The actual start frame used could then still be reported
> back through the completed URB, which can be inspected by the driver
> if it needs to know the precise scheduling decision.

IDK if drivers ever need to know. They better not, because there is
no way to get "phase" information out of xHCI, besides timing IRQs.
There is also no way to set it. And no way to schedule a new stream
not on frame boundary. See xHCI 4.11.2.5.1, the rules are simple.

The urb->start_frame you get is the first (u)frame of target interval.
Requests from drivers would need to be rounded, ignored or rejected.

> > It's always possible to observe these errors after the fact
> > (assuming the start_frame values are reliable).  I'm not sure what
> > value there is in observing them when the URB is submitted,
> > however.  What would the driver do differently in these two cases?  
> 
> I agree the two cases are quite similar in terms of observability.
> 
> The main practical benefit of detecting this at submission time might
> be the potential to reduce recovery latency. If the driver can
> determine immediately that scheduling has failed, it may be able to
> restart or resynchronize the stream sooner, which for an audio
> interface, could translate to a smaller audible glitch.

I believe gaps between URBs are not supposed to be happening at all
with proper resubmission, according to documented rules, so drivers
can detect gaps by watching for EXDEV status in frame_desc, if we
manage to bring xhci-hcd into compliance with the rules.

As for predicting EXDEV at submission, it's a gable. We can only be
100% sure whether it's too late or not when the interval completes
with Missed Service or Success.

Admittedly if it fails, the driver unfortunately only learns about
it after the end of the whole URB. Short URBs could be better here.

We can predict it by looking at the Isochronous Scheduling Threshold
reported by the HC, but it's a single number which may not accurately
reflect all cases (full-speed devices behind high-speed hubs are a
fascinating topic) and IME it's quite pessimistic on many chips - in
reality, they can do better than they claim.

So being conservative and failing submissions which missed the IST
might cause a driver to panic and reset the endpoint when no glitch
would actually occur. And of course delaying such URBs (as currently
done) has the known effects that this bug is about.

I wrote some experimental patches to debug and fix this back then,
but nobody was commenting on the bug so I dropped this topic because
I'm reluctant to submit significant changes without real testing.
I can rehash this stuff.

The most important question is if actual HW properly handles URBs
submitted too late. It would be nice to get testing on various xHCI
chips from varous vendors. If there are problems, it could prove
necessary to detect late submissions and complete such transfers as
EXDEV witout HW involvemnet. Yuck. Maybe it won't come to that.

Regards,
Michal

