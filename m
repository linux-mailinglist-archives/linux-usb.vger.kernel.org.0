Return-Path: <linux-usb+bounces-37523-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OKRJlxnB2ps1wIAu9opvQ
	(envelope-from <linux-usb+bounces-37523-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 20:35:08 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EC25564FC
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 20:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 84B9D3059C52
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 18:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3702DC762;
	Fri, 15 May 2026 18:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b="G03b+Fyp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AFC3FF1B6
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 18:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778868809; cv=pass; b=mkkxT4lmqq/zZh4N3CL9w84/Te/qZDH1NAAwwZFBiZ5kaWnE9loyCa3S+grxD0/7YBPk8d6D8PQRk4N4tDeeYRrqJTH6FUt4XoWCi1gYzJQ4jEMrkz+PBl4i8Y9WFgTEob5rNAVq44U4Qpp/emWu67TPxWp2irar0TQ//b5hLE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778868809; c=relaxed/simple;
	bh=AioMUTxFFK4MP+hhxeM45/YQ9LT2o4dpzyJ2xpNEtJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F7wMyRCD2FQDK8mDNiTIlMqSXAv/EZTULdIwqeclodlOfdybdpMYJ1Wu1+ZfgorDXX5F43S5MqauZu4zCNlITHhYWfUL9/O+9G/gI42o7/xUMhwXLjzBEmzpY1tXmcLAY06lqkl2rVPuybNwlkreiw17IbuXkBEWLlevKc8X1xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com; spf=pass smtp.mailfrom=motu.com; dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b=G03b+Fyp; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motu.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so320253a12.2
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 11:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778868807; cv=none;
        d=google.com; s=arc-20240605;
        b=fiefTo8YVbaqiSwgs1zxgSTGDRremxZtJI8w1I7Y7o9rGTL1GrvzPZaQGmeid84x/m
         +FXFyh0ZA3BuuoVSDYhj7xyhvKOkUD8hJb17/beDvXDrbmeB5qgbZVyrkWq/nqS1wtvX
         fdk0R9pZbDaLAUW4uUrHwslxcnIVfbwx2I6/3uWlMZw5AEvH9y3sCCmKjIruecSDCPyK
         0tmT/N04kfrmOZ6Vy99T+As80+ji+Z1HK5EekOscG4ssvw8RwHcd+Tka4CZRzY8KDVzB
         6QhuR5HieZoC7y4hURDEAx/LLAVjIMOuKhE7PuPqpVXgvyh9v/VCn1lVaeiZRjraf2er
         dHbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AioMUTxFFK4MP+hhxeM45/YQ9LT2o4dpzyJ2xpNEtJ0=;
        fh=lMAohbBfDEMHaHgX1gudnvDpKgLwikY9ENQH8spH0XU=;
        b=VdBeTy0vnAt21i7ThNsI3EBeRaMtrM5PM+XUgJKHt1Vz3Tpl04U6vEYXUk41V+S8+W
         +gphyPiH2NvopGsLSh0IiYLRHfXLkhP/ky1DVCpksoERRsJ9SXg1s64lF8SBUq38W4At
         q7rQOflxClLPcfaFXoO7bE7/Tcw2FAA2R47DJOXSqlqyoxhvCAzmrZEo/N8DEnXH6og4
         YQcIFxOm3CpaYjvxnJ38dvs+V24P1k4N1m9y4nS0zYGjLjhSy64VRhRGnPprAo4fnjmZ
         ZTnlPHTUVSnn5fJsS4UTQrbPOf9DqN8V9q7D+FNX3CJnBoWtFZnlglKSBVnGJmwvgrz6
         7+jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=motu.com; s=google; t=1778868807; x=1779473607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AioMUTxFFK4MP+hhxeM45/YQ9LT2o4dpzyJ2xpNEtJ0=;
        b=G03b+FypH/1ya4LOgJPol32XmaKyG65Pj0uwb9r3Qp1IUwynMv0eKm0Lx1VD6CDNcq
         2C7LH0m8xrCyBcC6qFYyreDszm218WnrHxBhtdq8WysWnfs3y83/8batL0+FqGQVP+Q/
         QHA3f6bupb1z91c094miqkN/XxOmwZ+ZfKyts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778868807; x=1779473607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AioMUTxFFK4MP+hhxeM45/YQ9LT2o4dpzyJ2xpNEtJ0=;
        b=J6hU8uAGBuWJbOM1Wc18ZIdet/ezbb3Vo4wK+RdvC0gfzC7DnCvzJnZKtLGBGoW/+x
         2dNg1le/xSlfJcahnn+Anx3SNONJ0VRkWwcuAnjRsn1se+gWeJuwRmkVSps8JvMfEI2P
         SHlexRDJSDAWhBmsvd4RMhzg/R+1JSA93B/vLE0HKdkrag4l+nFS+zjFTVgbf6Zl3Ajg
         XEXfVPMkszkQJohza7+0/qnzKQtWvnXv3ZNHjArd75tbmGqeeXz2R2pM6ghlV994BzlU
         dyH9JjCh0SlBYeB671CW7P4gQq1Kw4es7gWH588nvqIWW5FEQ1VSTVTodQZhVQ6wnpyX
         8ESw==
X-Forwarded-Encrypted: i=1; AFNElJ946x7YKK4Qj3r9MuSKu39r/gzwL8kftRjHVp7HaUTNvcGr9Pa2kj/Kt/Q2mv6apwWcgIAMTzYJ0Ag=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNPHcHR+DFDuXAwHiS/8Lui0LfyFjpjocQ1dlJCyOPkXdUYRpc
	bGPfeMBD4bK+y5p2hWOxScbvQsErbnvYTUcYOkTWbZiIlEl+jseWbz7plVGxtKi8OkH76DFnvGZ
	xQw5kW6RH5//SCBzBz9uSg7+zAuPrNBI9imrMg5tEsg==
X-Gm-Gg: Acq92OFYv6Fp9qu4430l+wGTQx2p/hISQVRmfP2gaDJSt+DW35k5P+PUQu3zNHpWYzi
	mbNdMqY262j43Q3Io4iwnrpvJ5cS2IbBp5NKnIxlVqbdphiLIxtOpBqY2vyITemCIkNqAHockWK
	M42n3wKDQusO7fclXHQqCowHhvN1s7YIs8D+Lx9x5FtZd/rBObjEIOXnn0rnYkzh7tE/jlAN1U6
	Su9kwIMsi/iaD3QqzzNeYp6gxvuYP8Ur708UKiDEZ1kDpVkcqmChHq4+HCzridWhr9AciPi4Irb
	+kXnDjqW
X-Received: by 2002:a05:6402:458a:b0:67b:790e:bf12 with SMTP id
 4fb4d7f45d1cf-683bd095059mr2535503a12.12.1778868806797; Fri, 15 May 2026
 11:13:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+Df+jeoj_QL6XNzUyP963HF7ngCWoAs0MjqQXPr3Fa6VW3rXw@mail.gmail.com>
 <20260511192105.3756809-1-mathias.nyman@linux.intel.com> <20260512110810.17fbde0a.michal.pecio@gmail.com>
 <85f8441d-d6c0-4607-9269-d80b1294afbd@linux.intel.com> <CA+Df+jf79bnONyXUnf0_zAUrqNAVzy1zt9VCivbxYvkedfGHRQ@mail.gmail.com>
 <20260515063210.4ed0a940.michal.pecio@gmail.com>
In-Reply-To: <20260515063210.4ed0a940.michal.pecio@gmail.com>
From: Dylan Robinson <dylan_robinson@motu.com>
Date: Fri, 15 May 2026 14:13:14 -0400
X-Gm-Features: AVHnY4K-7u876KjxGkXUXwG2qif9ksEUargluhtt7C_j2ysjWBIjx0Ho5nGBHYM
Message-ID: <CA+Df+jc=z96K52NJ6YXG4x8gK95udcbFHs=0hTQS6cm1r8z0zw@mail.gmail.com>
Subject: Re: [RFT PATCH] xhci: fix frame id calculation for isoc transfer
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 19EC25564FC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[motu.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[motu.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37523-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dylan_robinson@motu.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[motu.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 12:32=E2=80=AFAM Michal Pecio wrote:
> Did you try with short enough playback buffer to get occasional xHCI
> ring underruns?
>
> Is Frame ID still correct then?

Good point, no, it does not remain correct.

I repeated the test using 1-microframe-long URBs in order to induce
ring underruns/overruns.

When the URB_ISO_ASAP flag is not set, urb->start_frame is initially
accurate, but drifts further and further off following each ring
underrun/overrun event. In the completion handler, urb->start_frame
appears to remain continuous with the previous URB even after
underrun/overrun events occur. The URB completion status and the
isochronous frame descriptor statuses always report success.

When the URB_ISO_ASAP flag is set, the behavior is essentially the
same, except that urb->start_frame begins slightly offset from the
actual start frame.

> That's true, but the HC is allowed to look at the URB as soon as it
> is submitted. The spec states that SW shall never do such things, so
> HW is allowed to assume that SW doesn't and make the dumbest
> assumptions, if this saves them implementation complexity somehow.

Fair enough, that makes sense. In any case, the 895 ms window is more
than enough for what I'm trying to do.

-Dylan

