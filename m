Return-Path: <linux-usb+bounces-37192-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NKiGJB8AGrJJQEAu9opvQ
	(envelope-from <linux-usb+bounces-37192-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 14:39:44 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E8A504004
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 14:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E5EF300CBC6
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2026 12:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6E638236D;
	Sun, 10 May 2026 12:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b="ddLWp7xt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5783806CD
	for <linux-usb@vger.kernel.org>; Sun, 10 May 2026 12:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416772; cv=pass; b=awk1DI6iOEsR11m29vrqgnNxibjWzCy/5mKbjbc6+E/qnOw01e1BVQTLc4UvbPLEpugU57IKyEKs4MZBYC+/+ltofGazCwT/4zJf5lyk+UvMa9kLkOFyvREZ5FYqHaqBnPPlQ0to4te7JqY9W3ozKItHUTXqiSU1VG6AUWVvzX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416772; c=relaxed/simple;
	bh=0QEtS4OPVDf1HqYPP+C9FwjWgJ7P/cwSYmMRcmzxN2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kuISuAQYkEk1ZBy2bsrbpHt8DlPlpNDNOd2/1LWFLhbOHgxTUgXhwt9zcOWLN+e+n3IHPiaTPXqy1bB+G1zo7YVOc58T760myul9sc7TkPWdS8dP7QzCIwP59tMO89aCXlPMOzKoRe95gfFN/sCSr8bg+D+YTN31MAm/P2lE0uU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com; spf=pass smtp.mailfrom=motu.com; dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b=ddLWp7xt; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motu.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-67fd8befac7so338659a12.2
        for <linux-usb@vger.kernel.org>; Sun, 10 May 2026 05:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778416767; cv=none;
        d=google.com; s=arc-20240605;
        b=bFBtvUMLL1RggDBCKcrou7yhZkCVmOZiPu9dD/KnO+u4hIJ9zOSq9o0LNP1uK76/WP
         rUU44UBrf+A5mXX8jHD8FejDSuqVP4TjtYANJQyxI8iLeW7gcFU/Lnf+zDFm5I6vYTuX
         fv2sSkFm3UAHy39pqupMNsWJIvoYH8IgeB/xQso5R5V8I0rWvzCDyiynCG/c05NR5F79
         gNNeJavPIhPrAqDVYCCrhZGbN2beImdI8MQZJXUQmoFLyZgdO9P7XAry9QfeY/al/NNV
         +X6znvKMSyoDKip5/EPTTGgea+uP+hzAO0VfydfY9DDHqVcrZcKcyV45c61VXxPGqk28
         1u1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0QEtS4OPVDf1HqYPP+C9FwjWgJ7P/cwSYmMRcmzxN2Q=;
        fh=eTBROdqFLSPp7ZQNFIbMatZOADlnPDeHeMWxVn2ubFs=;
        b=htNS/AyECfiSf3CLAql8GjgchGz5/cqiQrQNCaxt7UpCOGRYK/9m/ovkErcODdNAC9
         oSQvGgYFcfnhvpG1QkNaSCMtmZOj2cU5B+Eubv67mS7lZc3HgEihbl+snmGwISxguskS
         60hUdJNxi7E5UOqZwkeWTYWAQZDLn6HcQY9912yk4svJslrf+xpoGU5XQBweaev5WkvG
         8kDW/RZ+U4CL3AvMNu2TOLlzg+mQy2lAsWfraSLjLkjGktI1bky9KChhm3Y2an1O1HCZ
         0SaLEEAd6rr3nFQOLXKDVrSPnMyWt4x/HPyCBLIxJQ/CmXnhwHsi8pVOJXgyHIrvMaBG
         bSfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=motu.com; s=google; t=1778416767; x=1779021567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QEtS4OPVDf1HqYPP+C9FwjWgJ7P/cwSYmMRcmzxN2Q=;
        b=ddLWp7xtHMRPeruo8qnM6DqKS7DXTATAOKATVVa52qw1wduXep771MrCW5dY1Q0vQ1
         IeWHh0B9xSHQouFHJRWrF9xlKQdOUDsbXM2e0E7+SKeYjvdLYci3yh++bfd/SjOzMomv
         uYi5daylHPACKrbx24qm3PZjUkRID483FzaRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778416767; x=1779021567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0QEtS4OPVDf1HqYPP+C9FwjWgJ7P/cwSYmMRcmzxN2Q=;
        b=M/UmIvrZrLwAarSR1rauWrlQyydelaJoXbirITwvAKX/iRSMCdR3kjrMn5Mb6sTb7q
         7TFNS+aHXrYQfr32g6XrGNoL3WTwOhUasIFBFgwoFpwWXhKaKwmonBcyQy896q6QsIVu
         tHWntJtadxqw+0cRxYXYEWYfNh/7evbyqPvIjPyJaP0NFfg+8L1vSj9Vk+qIffMlwoRO
         YHegdkB2xNLkf/5Mtuc8c7jwVo9/lHDI9ulN3zbW4bd1ooX/HAsmi28F2deJGhy8uieP
         DJ/Uyf/2WxHpornZ8NZEK/7wn0niOopb00CS75bfcT6QFvc1v34FkuLeLW0N+R9vfeEi
         KnSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wh+jtvzpMqUif2zqfwIk+mi7QR6eYeSZ8f39jHpqTMQR2DEkFZ8Gi1WEi0lly0k/1IC4vP5qwypw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9CekatBYqzEx71fMMKdFrSqPYF3aeefe7nUxfen5ypKFmYFhv
	kSAKjcVXOnRE2OcZLPPT37/PrLBzDwDsCKCRVDX0qGoVYzlRN9vXpIRDBKMqUNFhOyg8ZkT3azz
	Aj9CfAFyL/NW6OOhYQC7BZfZljobBASoYRJH+4zqfaw==
X-Gm-Gg: Acq92OHVjea2zNuYxKwA0qq20bwBR4ZkyCffXb+5OcGLNx8FtfR9EbE4VWy82E4KMay
	x7Tg4tRdpSNiTw86tXBgvzDaJPxWG2syOU3RLKYMsDirtP0dEBxzxaDtJnbwo3qtoEJr4Z05GdT
	D9LnusoB7amqX01nouVKILhe3i+sL5bDMbjOShZeXsb3kLvrbVOoL8UduB3gFtaVqC/UQH7gzas
	cPDGHFJ6OrT+2xJz//jhW83zqdcBilRZ55vR2k9ZP/KKhq7sXg0UOg+Mp8Fgp60NL5prmZn3wrb
	V8TVFlXUVXlUPVudtg==
X-Received: by 2002:a17:907:94ce:b0:bc3:149d:e9e0 with SMTP id
 a640c23a62f3a-bc56d1358f7mr1118346366b.23.1778416767370; Sun, 10 May 2026
 05:39:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bug-220748-208809@https.bugzilla.kernel.org/> <bug-220748-208809-eL7PrzeMxr@https.bugzilla.kernel.org/>
 <fe08eabc-4f92-43fd-89d7-5e9d0e35c979@rowland.harvard.edu>
 <CA+Df+jdtQrYye85d7uZyT3jirsztKhf7qQes3LvOAPa+9qxSOw@mail.gmail.com>
 <87d93b07-be3e-4c36-a6cb-97190560f648@rowland.harvard.edu>
 <CA+Df+jfP-idvQqNrGo7Tc7+03ruh6kBa=MOSXE1mwXL2VqLNrw@mail.gmail.com>
 <a756038c-270b-455e-9f53-51b1ad6a31d0@rowland.harvard.edu>
 <CA+Df+jf=UaVubKM1Pfu7sgREUMYv=6QMi94mbhhefjhXq8-6uw@mail.gmail.com> <20260510001204.7a4d5faa.michal.pecio@gmail.com>
In-Reply-To: <20260510001204.7a4d5faa.michal.pecio@gmail.com>
From: Dylan Robinson <dylan_robinson@motu.com>
Date: Sun, 10 May 2026 08:39:13 -0400
X-Gm-Features: AVHnY4LCgcm2Pxnxxbcpl9ySdBzECNl3wFQJHAuoUv5Xevg75y9-vMKNWDSHI5k
Message-ID: <CA+Df+jeoj_QL6XNzUyP963HF7ngCWoAs0MjqQXPr3Fa6VW3rXw@mail.gmail.com>
Subject: Re: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame
 and always assumes URB_ISO_ASAP is set
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	mathias.nyman@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D8E8A504004
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[motu.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[motu.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37192-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dylan_robinson@motu.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[motu.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,motu.com:dkim]
X-Rspamd-Action: no action

On Sat, May 9, 2026 at 6:12=E2=80=AFPM Michal Pecio wrote:
> IDK if drivers ever need to know. They better not, because there is
> no way to get "phase" information out of xHCI, besides timing IRQs.
> There is also no way to set it. And no way to schedule a new stream
> not on frame boundary. See xHCI 4.11.2.5.1, the rules are simple.
>
> The urb->start_frame you get is the first (u)frame of target interval.

This seems reasonable to me. Drivers should not expect timing
information with finer granularity than the endpoint service interval.

> Requests from drivers would need to be rounded, ignored or rejected.

For the first URB in a stream, I think rounding makes sense if the
requested start frame falls within the valid scheduling window, while
requests outside that window should be rejected.

For subsequent URBs submitted as continuations (and therefore able to
rely on -EXDEV to detect discontinuities), I think the requested start
frame can be ignored.

> I believe gaps between URBs are not supposed to be happening at all
> with proper resubmission, according to documented rules, so drivers
> can detect gaps by watching for EXDEV status in frame_desc, if we
> manage to bring xhci-hcd into compliance with the rules.

This sounds good.

> As for predicting EXDEV at submission, it's a gable. We can only be
> 100% sure whether it's too late or not when the interval completes
> with Missed Service or Success.
>
> Admittedly if it fails, the driver unfortunately only learns about
> it after the end of the whole URB. Short URBs could be better here.
>
> We can predict it by looking at the Isochronous Scheduling Threshold
> reported by the HC, but it's a single number which may not accurately
> reflect all cases (full-speed devices behind high-speed hubs are a
> fascinating topic) and IME it's quite pessimistic on many chips - in
> reality, they can do better than they claim.
>
> So being conservative and failing submissions which missed the IST
> might cause a driver to panic and reset the endpoint when no glitch
> would actually occur. And of course delaying such URBs (as currently
> done) has the known effects that this bug is about.

For an established stream, I agree with taking the optimistic approach
of attempting to append transfers that are only marginally past the
IST.

For a new stream with a requested start frame, however, I think the
HCD should, to the extent practical, validate that the request falls
within the valid scheduling window.

> I wrote some experimental patches to debug and fix this back then,
> but nobody was commenting on the bug so I dropped this topic because
> I'm reluctant to submit significant changes without real testing.
> I can rehash this stuff.

I am happy to help test in whatever way I can.

> The most important question is if actual HW properly handles URBs
> submitted too late. It would be nice to get testing on various xHCI
> chips from varous vendors. If there are problems, it could prove
> necessary to detect late submissions and complete such transfers as
> EXDEV witout HW involvemnet. Yuck. Maybe it won't come to that.

I would be interested to learn more about how this is handled in reality to=
o.

I think drivers should, whenever possible, avoid submitting URBs too
close to the IST. A motivation for having a requested start frame is
that it allows transfers to be enqueued well in advance of when the
hardware will actually need them.

In our case, URBs are often submitted tens of milliseconds ahead of
time, while the transfer buffers themselves are serviced just before
the data is consumed by the host controller. For audio streaming, this
still allows low latency while avoiding the need to make submissions
close to the scheduling threshold.

In practice, we have found it less disruptive to occasionally miss
copying audio data in time than to lose continuity of the isochronous
stream itself and have to restart the endpoint.

Dylan

