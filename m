Return-Path: <linux-usb+bounces-33250-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBFpD2YUi2n5PQAAu9opvQ
	(envelope-from <linux-usb+bounces-33250-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 12:20:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B91B011A0DE
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 12:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C18DA3010625
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 11:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B052E093A;
	Tue, 10 Feb 2026 11:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G86SMuSs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB283195E3
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 11:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770722403; cv=pass; b=sHFiGeI+PWuLs+dAqONJ1bLsTDtuCn3cxApgIPuPjZFtLIMes9nkcv2Gm1d8ujhFakFnAhBVxqA+PdHlvSgKWPtcC5PEBU7uv3mvXqmg5plEMttgZbv3bNma8midnIb4apR/usAheeN971X2u94V2V6uj98h59weGYcGn5pM/Qg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770722403; c=relaxed/simple;
	bh=tdkHWPYjZNrzZyBbaB2xUr1X+iba3W9kU3z+UpBq45A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dFmViufrCy1W3bd9EuIDtV3kNbw0w4HbSeh2DePVex7bKJa0M+Ueafxz3YMzB+mcZA7ksw4BsPFnB7bQoH/cg9PupUiOB3QZZ2iHfSYUzMehe9XYAgedjwDB1Yw6hs7KqOYWo8W84YMQPpkiM8qLGhvOJ9DPQe1qsigFXtjPIeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G86SMuSs; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59b77f2e43aso7112280e87.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 03:20:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770722399; cv=none;
        d=google.com; s=arc-20240605;
        b=MfGYQETLugNfYcLD26kqO5TCTg3IUfKfDOt3umrCPNgqWbZARc+hXYr/+JaSF54ytU
         /ZwcX48XZ52oWIpwWvo9X4n56lI7H6kKBjIbaIaks7pXrAMHNHnTa6Al6SiFYODiYwjv
         t76E6poreYWYXf0e6EnCXvc3nW62WS7pjl9/mBh8rbybQMoueUDUAk/RnGhM/2XoQndH
         2Bc8fvKFlH6bd7ZB1hyjXvl7xD6Okd0WTjkB2zZsgFL90/l7sPxa3TjtFRd/ehWHvD5b
         FejByV8pn13h9gcKi1Qk8eLYUwQ79Vf8hXjgcTfRCVSTxM+2daFRFPvf915mmYkeW1to
         YJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tdkHWPYjZNrzZyBbaB2xUr1X+iba3W9kU3z+UpBq45A=;
        fh=wKpeeol20pgYzTSbbpySwjuByoGbIny7IZ69xY+RzTg=;
        b=UWGBUNNZxrEdtcCO0viU1u21gVz0JDEUpvNBSIaS9j/9uIY7fbk8yM6ORqO6dt8mI/
         Dw/SFGcK1XdOvPFMnQg4rT8GvG3FLVZV6ofBvqYz0t3asyJa/jjFMcmCkCf18eDNYw9O
         +zTjzfCtUkvxxeP/kYJRrliuCcHCLIyKSsWEURcktGrMV2DqPdSKW4QVXSMf2feL2ENO
         9np8UppnEpD0QPNX62v/slNwPiCCY3DeqIz9dqFMdY6xdyXaRyrEkrmbrO/GAS31/NjJ
         VMgj8D4zoO/VlhCFHm8pRnpSlNc31C11rC1Xgi6TZ7lBMrmZKWiwhZfnW0Xn7pvGZnGA
         M4SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770722399; x=1771327199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdkHWPYjZNrzZyBbaB2xUr1X+iba3W9kU3z+UpBq45A=;
        b=G86SMuSsJiRPGUz2sgSwJ+k1pMzCDPTX8JkL2r5JTktPSVarOYE+sKslohr6Tu4Czr
         9aETLDfVQr9vctdYUZrIAGKZ+Iz01xZkTpERB6deib6zIlsBVwIeJNVBCxerHKvtUVpK
         R2B1rDEzGUIOvjDM4ZMBodxzXpQT3Yj+BNNzr0mRHnx06relrNRjQI4VHX9gX62jQllW
         1CswVdEKfdE8bgYUnk9Rzc6evGmXZRgTEGFJwCrdIueh5PJhyQJXqG5jUjWZqiFvswrO
         cG4wNJrDNlTLlFm21q96BLw4RnjMZqVBpfHU687mWnrnadOP5gLHytLOxnaNAgQmjVoc
         LBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770722399; x=1771327199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tdkHWPYjZNrzZyBbaB2xUr1X+iba3W9kU3z+UpBq45A=;
        b=d9nbPB9xbisQWCsCaaPDAmbBLLU7nuznS2OMb/jTyVUckjctFlBQInNztEn5RnoKHl
         TQGnCv9TrJp9BZNMuZ4gYPaBeURed1aWjdvpDvMr5J5poLTp5rFBKD+Bh2YMeQjlipVy
         AIL6Gl4nJUZG9CA4flXpe2LoGYu8xKelbW9irySciTh3cgN4G3tSsdW7rcq6S2lR5d1N
         nLbNFYUUfLQVHPCocorxtpZz+YRRv+2kRN0ElksXcy9FuRp5Rqm3LgTuUm9zttnP5Sq4
         Aur5ruzcCcji9Zk+LTaK0fMJC97KIwh4qJQVtvTKGxWym3XTlY/IeXwShit1sXTJ2Id1
         u1zA==
X-Forwarded-Encrypted: i=1; AJvYcCVhx2aegrug6peQnWSspmTcBCHf8UEo6iiX5s1p7jghPRd7+IMZWXOjNLIUaN24Hjh4WTN3sdYTB1U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0ax32CLym5C9ZOJYrGwJRvzAm/y2sHsMfkvM7yH2UmBlSKXbG
	AXfnVB74lGYrvRD/YXZOP2GJdn6b+k68SfcOaooOFnd2GzchnridOK8iTp/8sPf2UPZqTq4XKOe
	DefH1uwnH2aJpbFLNGfMsicXF/TOIugY=
X-Gm-Gg: AZuq6aKkeOhC9Oaw9kvGfz5QmJ2M5WO3nwPyDzhdItr0Oul3RWR1JSA1R+eOSKAEC/l
	RfoRiq10dyrTso1U/5CKjyz7D8mWQZPLOu7xRgsvsTVMLUZPVk1rr9XzenXMa56qVwrE76WUYth
	lpTsVh7W3B57eLNdu1qoMgZ6rtjoOEgHq9r8llNcvqglV9AQv9EFJ2FFRbmDmjP4EfAWwJJmBOr
	1nqfZguAC3ivZ2teKFxy72wyxt6smydR9/B2b75u3HC2MomSmFOPZQraZh4YdbF85zSrmYiKZyU
	rXtHZ1/ICMHbszN+APrN/7HDrzdN5iS3jMEvRITZN2AfX0+4Lw==
X-Received: by 2002:a05:651c:4351:10b0:37f:d9ba:747 with SMTP id
 38308e7fff4ca-386ee29beebmr7363401fa.5.1770722398640; Tue, 10 Feb 2026
 03:19:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOMZO5DuiHWpu9px2-FDWwBnq-W-jEQj1GMSUpTKvncw4OBF-g@mail.gmail.com>
 <CAOMZO5CVcLRBhXByZRT=dNGFWZuQm7r-ALXnWUgC1wu8tXxHfg@mail.gmail.com> <PAXPR04MB8829F3B7736C63C5527AB7468C62A@PAXPR04MB8829.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8829F3B7736C63C5527AB7468C62A@PAXPR04MB8829.eurprd04.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Feb 2026 08:19:46 -0300
X-Gm-Features: AZwV_Qh1VjKId049_-nZRqOqKYtMT_veiUgRcwcDAZqYV2XJU9Y0eCyNRTvLPas
Message-ID: <CAOMZO5BWcezf8QVSgj_pTR38NQ7RPNf+8x7YQKLFyaPTaXzSJw@mail.gmail.com>
Subject: Re: [EXT] Re: i.MX6 chipidea: USB port does not power off
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>, Frank Li <frank.li@nxp.com>, 
	USB list <linux-usb@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33250-lists,linux-usb=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[festevam@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: B91B011A0DE
X-Rspamd-Action: no action

Hi Xu,

On Tue, Feb 10, 2026 at 6:03=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wrote:

> CI_HDRC_TURN_VBUS_EARLY_ON is set for imx6sx_usb_data.
> http://10.193.102.149/cgit/usb/commit/drivers/usb/chipidea/ci_hdrc_imx.c?=
id=3D6adb9b7b5fb64be3c3e4d57578ea1446da91a8f9

This is an internal URL. Here is a public one:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv6.19&id=3D6adb9b7b5fb64be3c3e4d57578ea1446da91a8f9

> So VBUS won't be off even you disable the port. Otherwise, USB PHY won't =
work well if you force off/on it.

Understood, thanks. This is an i.MX6 hardware limitation.

In this case, the only way to turn VBUS off is by forcing the removal
of the controller:

echo "ci_hdrc.1" > /sys/bus/platform/drivers/ci_hdrc/unbind

Thanks for your explanation, I appreciate it.

Regards,

Fabio Estevam

