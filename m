Return-Path: <linux-usb+bounces-34191-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gE/INVKsrGldsgEAu9opvQ
	(envelope-from <linux-usb+bounces-34191-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 23:53:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6E522DEEB
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 23:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4799B300D68A
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2026 22:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428EF2D7DF3;
	Sat,  7 Mar 2026 22:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="p0mw1HKA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1D823EA85
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 22:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772923981; cv=none; b=om+58UO/xcqcjtx+DGtioaEymvuVngwgxWAbYqmsAB/LO9xmZXGde3+J5O/3TW1rPHluI33y3LFqwfEJCt9qiGfXx0FMgOitGUSoYsNOGnxzjyZzy4MjcOga41PQ4phsA/SKHEjmWQyATDwnRtH6DHvDQShXTz2FPZGxcQaSJrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772923981; c=relaxed/simple;
	bh=onuSXtg6F2LCy0LxbZ/34VrpJdyeiEFGVxLttUdYP3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BaM7as25fPk9S8J/2jqKXMANqdjQ5nfBful083CGL9ppXHKQ8QRsNAJtNqs1E5vY4mEOY3+HkluUCPSARGFZ8eZi7NoSxAsZdCQI1uNqd/xvBZfhbUfibzTyo6HVhhPPPKb2EXIiruv8j/EAoc5S/r6Pd5YNkZj50D+UM2wkVvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=p0mw1HKA; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cd7a75c680so53487885a.1
        for <linux-usb@vger.kernel.org>; Sat, 07 Mar 2026 14:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1772923979; x=1773528779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=csKDsiBXgnWt/0Smw1tLZwTuHlhZeD6UkDDjhH+moI4=;
        b=p0mw1HKAR0Ynllgi5cdAuMq576fHQl1VVQrNmwJrauVgoxvG57fP0zssEdbRxToTFQ
         d7hNkJpl2mUGvbKbCufFNMF+MPQvdgii73IT9eLLf/ieDE/epwjgzzYzMkhicetwsiGS
         f+8lKnLhWkxZZunFJmlzvbd+YJ7pb/DJaSmhUBvr1uTSODhtiFypOSBM25IZMpf9xuoY
         j48cMoTH3mw93SHGEB6+k9I28PYGDwCtVpSrXGQu76exfpCruvyCFWqieZ9OExotCJWT
         hRmGQDlDOaSKNxBsTN2E7R/+LzKScydN7z1pU0kklkYL6BA5elyttSDLsvJYHxmlOXNe
         LyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772923979; x=1773528779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csKDsiBXgnWt/0Smw1tLZwTuHlhZeD6UkDDjhH+moI4=;
        b=O/vH/7OsmoaXCje41kfI5PMgTOlJWSp4iGypORP62cpRHVOTNU94tEoot1spcJbTwh
         hafRYNvrS+5eslj1vC2QnUp4gUlhfcVP4gzwJ2MD7WIdGTuL5irPJIGZF66ebMtqGaXE
         v72HPhS9bWOvCuhz95qPVTVSy6Vz5iEdXo6LLTNBmx2H7MBTWHzJH3EZk533VdeHwFe6
         HU3zI6DWUMvouWXbOR4daQkCj+0J++A2tEH6Igntp4Dxoz7jGMTvQzD9usmAybTvkZ9z
         a4ueXzqKMuiSPtf7PH3PaFfYdmK/KGpw153cV1uvPkCnQRYCuknxIWUev+3eEZBTH9ez
         UW3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVnmBV1cwW/dSatyjeLqfXeXbPZWYS6rwyBCwTN/RpVCUqCLEqETNaEV+J4WeNh3HrlhrwaCdXT38=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya3qDwKKrG7ic0lvHfbwevyGgw0gLev+WRPUbvXJV/8H3/wqfN
	QrXKmkRnRHqrY3+S2/8cd78Ok3Zw2v/bM0tm533mvQbuASk4lHE/X7G5SW0bYxU2cw==
X-Gm-Gg: ATEYQzzfQwSuC8SkLnW/kIDj4JwlVPmPlyCH4jCOH4DegzOQorRyUqKvsDGorNZLOn6
	kjH50yuyvhh1auetIgVcLwcQFd+Qu1bMUFqngPMH/unAgiqUL16Qfwz/TGd6HJG2rnd7tqOeht2
	uLox8d/GZFAjCC5zlIASGO1RL+V8EnGc11IAe0cET6Gb6x9TdkcGZ3s6aSFf1g/LHcEKIp0Y9U/
	nIyrIytYdmAkCm1EBaIJnrQ06nevzYfejP1VoSFPK6qayOiHW0V43Y4Du0dI7YFaVdnPoxp7Hqi
	9q000fvBfWJBkiNpHi1mFRF+wN5e5wKvocMKSEvdQD5upip1IjklyE6Ff6P71Qd47jpRILnPsCa
	XF2Jkf1LXFFFqL+fa116KVI9yp9gSROogfjiDJtw3WYRlgKVQMyciNwveuxJ0ZN5Se+Q7cPdOAQ
	uMRvy+frSgCMGHcrsz+U/3TllR
X-Received: by 2002:a05:620a:580f:b0:8cd:75a9:eab9 with SMTP id af79cd13be357-8cd75a9ec10mr410940685a.14.1772923979416;
        Sat, 07 Mar 2026 14:52:59 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd7e857037sm90933585a.20.2026.03.07.14.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 14:52:57 -0800 (PST)
Date: Sat, 7 Mar 2026 17:52:54 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Liam Mitchell <mitchell.liam@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usbhid: tolerate intermittent errors
Message-ID: <6cbc6c70-8252-43d0-8701-e1613ddc769f@rowland.harvard.edu>
References: <20260307-usbhid-eproto-v2-1-e5a8abce4652@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307-usbhid-eproto-v2-1-e5a8abce4652@gmail.com>
X-Rspamd-Queue-Id: 4E6E522DEEB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34191-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.939];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Action: no action

On Sat, Mar 07, 2026 at 07:57:09PM +0100, Liam Mitchell wrote:
> Modifies usbhid error handling to tolerate intermittent protocol
> errors, avoiding URB resubmission delay and device reset.
> 
> ---
> Protocol errors like EPROTO can occur randomly, sometimes frequently and are often not fixed by a device reset.
> 
> The current error handling will only resubmit the URB after at least 13ms delay and may reset the USB device if another error occurs 1-1.5s later, regardless of error type or count.
> 
> These delays and device resets increase the chance that input events will be missed and that users see symptoms like missed or sticky keyboard keys.
> 
> This patch allows one protocol error per 500ms to be tolerated and have the URB re-submitted immediately.
> 
> 500ms was chosen to be well above the error rate of a malfunctioning
> device but low enough to be useful for users with devices noisier than
> mine.
> 
> Signed-off-by: Liam Mitchell <mitchell.liam@gmail.com>
> Link: https://lore.kernel.org/linux-input/CAOQ1CL6Q+4GNy=kgisLzs0UBXFT3b02PG8t-0rPuW-Wf6NhQ6g@mail.gmail.com/
> ---

Liam, take a look at

	https://bugzilla.kernel.org/show_bug.cgi?id=221184

On Roman's system, these protocol errors occur fairly regularly, 
apparently caused by high system load.

Do you think a better approach might be to reduce the 13-ms delay to 
just 1 or 2 ms, and perform a reset only there has been no successful 
communication for about one second?  This might perhaps be _too_ lenient 
sometimes, but I don't think such situations will arise in practice.

The reason for having at least a small delay is to avoid getting into a 
tight resubmit/error loop in cases where the device has been unplugged.

Alan Stern

