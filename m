Return-Path: <linux-usb+bounces-34228-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKPgIYh+rWkT3gEAu9opvQ
	(envelope-from <linux-usb+bounces-34228-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 14:50:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E00532307D5
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 14:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 073A1301C3F7
	for <lists+linux-usb@lfdr.de>; Sun,  8 Mar 2026 13:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3A8261B8D;
	Sun,  8 Mar 2026 13:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lH9Iqnck"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719C822A817
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 13:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772977735; cv=pass; b=jm1EZ9ZkiMFGozweAn6RNUTTA5ltOw9ujgAbzBG46NA5AzEWB8yOA1RcoigyZyz/cFrrD93OFeG/A5oIVDSOEzTKtYBAi5pOB3GnnSnz4u6oSnHMBHWOMrXuFl8bo+syK0ZSBVrsfbTtA5T/W+HVF42hoLjUTte/by+t66J/aZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772977735; c=relaxed/simple;
	bh=mirjZLK0sGiBRb+DxEIl2A8YjWv8pb1n1yoDr2Kl2mY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GXJZAcFqCpOoJdC7SMk0NAlJ8QvB3ipp0PisNKXJIAFs1NsHpogixmHzoeS4iwsXNY+DwBWjijj2wFyTMIHHZLnfSqSXkcAVHa5lDTodQHt50VjuNv6z11viJB6URzcDLNaoHDNQukzB8NMc+5bD3zZxm+V6FFhgbejzh1vCzIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lH9Iqnck; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2be4e5a4fccso1054947eec.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Mar 2026 06:48:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1772977734; cv=none;
        d=google.com; s=arc-20240605;
        b=UZ9jOgCYRo1+KTXEDh4CDaBAWCTstWsWtIr8HzuMmHSGp6UUvvOddF1jO73XGZRdob
         CxyP+HtDMOYkx5dHZN3Zyc82PyW0sTZ9s851Q2UDAlFmnij9YM+l+fAW87oFZ6GFpfF9
         DL04LJZiC2TDrbwNi2ugMKy5ekPUWjC+XINc8qOQGb6RkbFLB2keZA4DzKAaKQf5WwYa
         KHD/yTYVlCUIbBajErsEHCQLyDjc8mEFxlbKoKSYI+JuViERWM92pfkNg6dMw28Tp6Hu
         1iRNdiUwtMEppy21HVoRwZtei2e0+cdFUJtnYWejTV0DmxcimXDj+G+J2udlXSpxEOGS
         Va/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QDne/1iGZ6vINMaPqsRWiT5WAHOwNwL2T3qbRCbs1Aw=;
        fh=oTkgEtFUuL0LtPwpNjGD5LsmtzAPs2K2ZS4H2pn6DxA=;
        b=E6jcmbSnOwqLOd2J8FKICkhpf/BFp7z055741+2u5qN4Uzp9SX6eJCxEwiBsnwrPwJ
         Wuci5mmYmiFeZHA4DTzKqZsbT1jsiKZQuy+HKM+bdE4MB0tsuIS/7FMrVazZMrJgz8Th
         hKGFi6HbC3SYc+ud+2wNdoOoQd6uGD3uJGFf+Kegwzi96PP4BvfXyYf7zkiFkiWIqhLW
         t4WiYTVFrjWCrPPvOcuZSCuFBxdWLESkHNNopwaMhGYP1E+iYOj7WSXcFFD/A/whHf18
         7AAMx0AJj39zUJvj6EttaJ83aKP+wM0YoivsXJsbL8n69YkQWJVSVQAXV9ACqUVpyr5V
         8vGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772977734; x=1773582534; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QDne/1iGZ6vINMaPqsRWiT5WAHOwNwL2T3qbRCbs1Aw=;
        b=lH9Iqnck2vord1qqyvemPgVmErPHPOSlN8LHsgbXNz5FsqR2YZVsmen7ctTTiO9Icr
         faiz1D+t5jeXnVKEZd5Xr2fqrmITT/Wqmn/pOldxdoanF1ah7Acqq48nYw3rlO8/4tYY
         hWwKONkLX8tmY6pbeQoVOv5jlHmvV2D7222hkjj08d31jz8H+eyFnLDFb+CgezjauhdC
         tlGfR2z7fXY7vVKZRFRbNJz4l2xgqIaapOk0ICtMvmwUl6PGy7XpuHuw/m153IOlSLih
         Pfp3INzgt3LTpPg01MibShSGknQx0pN8FKhIOehxt4BlUeiIxIftlV5zyAIr4OhxeAJM
         Q99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772977734; x=1773582534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDne/1iGZ6vINMaPqsRWiT5WAHOwNwL2T3qbRCbs1Aw=;
        b=nCPuFz02YNPzVwZla4QbY8/CbSMsyuhrbV05G5x6mC+EXE0ubXYd6yoSgXT5o7MFGT
         /DGL3y6je/e8LbNUcPQf7HSQwzfWhzpkdJMDDv2HKtiLPfMCdORIc6BURtPoWypE7FXv
         zfMVMKovAFb9k3lCn/hOeVd2x4FF8X6nmNsMyRz1KB983KKT0jeqJK2blWnzjaswdJ1a
         YEddzIeqoaSimOY23gZu+hkKy9gPXaOFaAeypWBNS9S2dqmt6LiIeTbYW+6vDhy/6cUT
         sIMTKjN9xa0bf86S3SDJEkXy8UL/d+CurgRurRxocaBChFK3kt3FfJaqOZg5/bkj2s6J
         TVGA==
X-Forwarded-Encrypted: i=1; AJvYcCVq5QsWClol2SfoqK+xAx/XY4qxsyxms6ISXb+DVukTr0fRSntEWdzkMxp5KDpMSR6lSaPCHR7ndz0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywydczb/MIT48PaQRHv/TLy4jto5m/ngJd8SweXlBRXkS+4YIoF
	TqsZdYRhbGt7nrCmWT6PTlmNkV56wmFYmat2kSrpMgGZvaObnj5J2D/B+UCK8txR0yF9O0tnqun
	5qb4eKMPhDOU++YprDNG4KwQJVSwcwzo=
X-Gm-Gg: ATEYQzxzWmCriHOYuV/K07V026VTBd7qq7O5JegMxWW7WTTQcHuSkitPQObAnM3ob1U
	v3j9f07ZSAVR3KrTas3xidwfBV/O0JJgzFKYWe6uKXCYVcgmFJYAus3UFV4VnKvCdzAesPAtnxz
	tJxZj4Rm+56HPy0ZF+kyHjhg+5FQugEPB6ClmvKwS2kKkkEiR88wO4KnH65S8dGEYiPa1ZpPC07
	QkwKU2Lm0fqBg8RlsNRI9s6Cc30Fv66S+sX8nF1mduXgW5+OSe9D539iZ2XnOFEsf2h/DkiWfdM
	BuZ2XrS6uUYfZluho07HOraTxD4ptd9JLmyD0DYl
X-Received: by 2002:a05:7022:60a9:b0:11e:3e9:3e92 with SMTP id
 a92af1059eb24-128bc01df9fmr4628415c88.23.1772977733480; Sun, 08 Mar 2026
 06:48:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260307-usbhid-eproto-v2-1-e5a8abce4652@gmail.com> <6cbc6c70-8252-43d0-8701-e1613ddc769f@rowland.harvard.edu>
In-Reply-To: <6cbc6c70-8252-43d0-8701-e1613ddc769f@rowland.harvard.edu>
From: Liam Mitchell <mitchell.liam@gmail.com>
Date: Sun, 8 Mar 2026 14:48:42 +0100
X-Gm-Features: AaiRm51MocJnGriPRluzCDqmFOcXhMhT8vtS9I05YZDwfu2QUrfFVChD0B78ArQ
Message-ID: <CAOQ1CL6GcPUDw+wriKtqq05ywkuhjyi-ujp7WwFpSWgY1fV1zg@mail.gmail.com>
Subject: Re: [PATCH v2] usbhid: tolerate intermittent errors
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: E00532307D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34228-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.881];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitchellliam@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sat, 7 Mar 2026 at 23:53, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Sat, Mar 07, 2026 at 07:57:09PM +0100, Liam Mitchell wrote:
> > Modifies usbhid error handling to tolerate intermittent protocol
> > errors, avoiding URB resubmission delay and device reset.
> >
> > ---
> > Protocol errors like EPROTO can occur randomly, sometimes frequently and are often not fixed by a device reset.
> >
> > The current error handling will only resubmit the URB after at least 13ms delay and may reset the USB device if another error occurs 1-1.5s later, regardless of error type or count.
> >
> > These delays and device resets increase the chance that input events will be missed and that users see symptoms like missed or sticky keyboard keys.
> >
> > This patch allows one protocol error per 500ms to be tolerated and have the URB re-submitted immediately.
> >
> > 500ms was chosen to be well above the error rate of a malfunctioning
> > device but low enough to be useful for users with devices noisier than
> > mine.
> >
> > Signed-off-by: Liam Mitchell <mitchell.liam@gmail.com>
> > Link: https://lore.kernel.org/linux-input/CAOQ1CL6Q+4GNy=kgisLzs0UBXFT3b02PG8t-0rPuW-Wf6NhQ6g@mail.gmail.com/
> > ---
>
> Liam, take a look at
>
>         https://bugzilla.kernel.org/show_bug.cgi?id=221184
>
> On Roman's system, these protocol errors occur fairly regularly,
> apparently caused by high system load.

Thanks Alan, I commented there.

> Do you think a better approach might be to reduce the 13-ms delay to
> just 1 or 2 ms, and perform a reset only there has been no successful
> communication for about one second?  This might perhaps be _too_ lenient
> sometimes, but I don't think such situations will arise in practice.

I would prefer to have at least the first error resubmit immediately.
I want to reduce device downtime and missed events. From that
perspective, I want to assume the error is intermittent unless we see
evidence otherwise.

The current reset logic "reset only if there has been no successful
communication for one second" is problematic because there is no sign
of successful communication if the user isn't pressing keys or moving
the mouse. Two EPROTO errors 1.4 seconds apart will trigger device
reset and 100-200ms of downtime when ideally URBs would be immediately
resubmitted with only a few ms of downtime.

Can we infer from not receiving errors that we have successful
communication? That might change the equation. If we don't receive
errors for say 10x the polling interval, can we assume it is working?

Ideally the reset is only triggered when we are very sure the device
is not working and needs it.

> The reason for having at least a small delay is to avoid getting into a
> tight resubmit/error loop in cases where the device has been unplugged.
>
> Alan Stern

This patch would only allow one immediate resubmission per window
(500ms). How costly is a URB submission? I was assuming they are
relatively cheap and even one per 100ms wouldn't cause problems.

Liam

