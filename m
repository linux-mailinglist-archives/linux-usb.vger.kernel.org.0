Return-Path: <linux-usb+bounces-36844-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLMcABXI9Wm8OwIAu9opvQ
	(envelope-from <linux-usb+bounces-36844-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 02 May 2026 11:47:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FCB4B1906
	for <lists+linux-usb@lfdr.de>; Sat, 02 May 2026 11:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 13497300601E
	for <lists+linux-usb@lfdr.de>; Sat,  2 May 2026 09:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F0831064E;
	Sat,  2 May 2026 09:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MP2O6I6U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9E32DC332
	for <linux-usb@vger.kernel.org>; Sat,  2 May 2026 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777715215; cv=none; b=fBoJFTgRLUmcp+1pWVkW/hNgQqXFbCQNov+nEtNXI9HWJt6GQe6C8TQvw+u8Iw0UlrZT0vEml01UVQcyIlF161J/X/2l/kJMFe4hnVXvRJE/Q7ABIrNWe/RyUrmUwnwKZ4DC1x5VV1chlD8z9jVrmaXjU0BmmsykiNZle476O3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777715215; c=relaxed/simple;
	bh=DPiNTEITt1TPBpjArvFJpFpEyHTx0vdtATFnbHgPgfU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UzlcgR6K0oXzXa6pnofOPUpcN6JYX01nroBbZDaPzHgpqBkw5XEURyVZIpR6fFWfM/3l1kCW2638PMtE+3Ax9UM+SHXKSQRpx4GuTZ0ivkj4h2FmFuUk7OSRRsS3xmBD8KApiwwKGVEtSbSkPJMKrBjQ7NvUzrgRCeKA/WVb/+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MP2O6I6U; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso30506835e9.3
        for <linux-usb@vger.kernel.org>; Sat, 02 May 2026 02:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777715211; x=1778320011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezmD1eosO8J8L5bV2blwD7uKVAJ5uRnCIe2hKB1QaCg=;
        b=MP2O6I6UmkMu+yWeLeSdXoUwOAlMSjK4K9IympeZv4SCa8wB4CWZAwZoY/hzIZpP2U
         OMuXbB3PskdWK3w7ugNJ/lE/Yqj7fOqV4s3R26NigI8nW6srpOCBRv1eSMFHVl7Ptpb3
         KuOsnHNBNnNMcB9qZqjERcYVNV+uj/9jtgJBe1KQZKtqu3M0+NUaPqk7s9e6/VAwzT14
         Av57RaZeFOAhskc3eTbOxpe/ZEfBosxnZ399ZYK3Zsy9POuvbnY2OvnxxZdWEi5xiTNd
         1e3TGxj3pgeHhHQ6iobs/Hi/8McrRTcTpCsSEvgmCcxRXTeYFzOHjpABo1s93sGRH9xC
         X8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777715211; x=1778320011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ezmD1eosO8J8L5bV2blwD7uKVAJ5uRnCIe2hKB1QaCg=;
        b=V/0cligR8+ooUXI1YiMjEC+SM8qlnUlH3mCnusZvjsF1WUVv6X5BKdHGaS8NNmh9Vc
         zGgbz442sOCViGm7u+aqMozafCSpahYbqkC56N1xgeW3jzd1xJuSEZjNRqtyGOejNYK4
         lLE3EBlIQlmpn+PP4naryg4FcL1pofJv1ZA8YD7IW2ZGeoSb4msFjD8JhPCCxIIQMFhV
         NHyuq3dS9FNrCXN/d9T/HR1Ukjq0qD+XzzZioumbjMO1VARCetARhA6oesEYIEoWiBsP
         1NYUclygQf8zcAlpUcWOYUWXIgCWMEhCQf1sGe68uNH++C9LXyG50d9XYvVJb8MDjVPF
         /vXA==
X-Forwarded-Encrypted: i=1; AFNElJ/pyH3ZDV6+bNgOqbaOQPol6E0RNpBj6cgT81mkENn8+UTf2sQwKaV2CYQbLFx6vVXotH0C162R77M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwotPOQoIWO2lyPXEnMMYl8MJhhbUvbgvkFQVIyEgZcACBQVxpD
	m4sHN7p2fNAND7LpUUsiZ23YKgXnIrx8hyxx15k6r1fUUSHpkPXzRnAz
X-Gm-Gg: AeBDietcMi2QhVklnkVz1lqXbaz8ErfUUCOc5kuNuJ9Ff6uqHCmttIwVPJ4vsjSiVeb
	7vLJOHnz2w02zIrzbm7GrnWnXwRTKA/35mOStwuboTxhXAB9xQTvhpYQYBDfhUfEVbJu8FGrk0U
	TEm12wGuZzctv3iy4N8OjMCcvARmaTuh/RQGiT5EI1zxpk7/TS4B2+4Wnqi5O3+4yQz25PV1+JF
	PmLhhYlxl+BmtHp3TXRGCjRJHemgHULY8UBWmp0y36wpfJwgtSb9geAVWy0VX9ZiZk8naFQWKCH
	V1J7rzzerj9j92Br0AqDhZYAcpD/5vljovuWUmf2fgTUkGwQJcp5x9KeAFnf9VBFMWCepDHTitr
	1FHLY1QVBJm7jYBXpmMkvQDPmP/Uo7PinwjHjyKI5SiAyObJWSccfRnBKKyA+1yra7kf1US+Gaa
	p6mm1HCP1D6pbayN4HG75qis0HFL7xJ81AmN8HTQggDdo9yg==
X-Received: by 2002:a05:6000:40c7:b0:43b:5672:efe with SMTP id ffacd0b85a97d-44bb36d17efmr4004334f8f.9.1777715211096;
        Sat, 02 May 2026 02:46:51 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8ea7d035sm9943933f8f.5.2026.05.02.02.46.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 02 May 2026 02:46:50 -0700 (PDT)
Date: Sat, 2 May 2026 11:46:44 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Desnes Nunes <desnesn@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org, mathias.nyman@intel.com, stable@vger.kernel.org
Subject: [PATCH RFT RFC] usb: xhci: Kill hosts with HCE or HSE on command
 timeout
Message-ID: <20260502114644.76e6b5a3.michal.pecio@gmail.com>
In-Reply-To: <CACaw+ewwM_5eqyGW5=+THwHsYPs7u3NT096AFQdt6x4E6HcWtA@mail.gmail.com>
References: <20260430014817.2006885-1-desnesn@redhat.com>
	<20260430104850.352bd946.michal.pecio@gmail.com>
	<CACaw+exdPSVSfdAob7+d-xH=JEjBbPpY_z1cPPU6rzXx4wUZpA@mail.gmail.com>
	<20260430235453.2288c973.michal.pecio@gmail.com>
	<CACaw+ewwM_5eqyGW5=+THwHsYPs7u3NT096AFQdt6x4E6HcWtA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: F1FCB4B1906
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36844-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Fri, 1 May 2026 11:09:27 -0300, Desnes Nunes wrote:
> On Thu, Apr 30, 2026 at 6:55=E2=80=AFPM Michal Pecio <michal.pecio@gmail.=
com> wrote:
> > When xhci_handle_command_timeout() logs USBSTS, does it help to add:
> >
> > if (usbsts & STS_FATAL) {
> >         xhci_halt(xhci);
> >         xhci_hc_died(xhci);
> >         goto time_out_completed;
> > }
> > It may not be perfect solution (race conditions?) but it could hint
> > that we are on the right track, if it works. =20
>=20
> This panicked the system as soon as I hit `echo c > /proc/sysrq-trigger`:
>=20
> [  141.683476] sysrq: Trigger a crash
> [  141.686970] Kernel panic - not syncing: sysrq triggered crash

Damn, that sucks. Any chance it's not a problem with my proposed change
but some sort of issue on your side?

Anyway, I think the patch below might cover it. It works for me in the
sense that the bus does get killed, without ill effect. I tested on
VL805 where HSE is easily triggered by disabling XHCI_TRB_OVERFETCH.
However, the patch isn't necessary here - VL805 doesn't clear CRCR.CRR
on HSE, so normal abort path is taken and times out, then hc_died().

Can somebody serious confirm if this issue actually exists in the first
place, and whether the patch solves it?

Hello Redhat, anyone alive there? Or only stochastic parrots?

Mathias, do you remember what's the point of the "Command timeout on
stopped ring" branch? Can it happen in any case other than dead chip?

I also wonder if it wouldn't make sense to just hc_died() on every
command timeout except Address Device. We rely on Stop Endpoint
timeouts to kill chips which go unresponsive without setting HCE/HSE,
because sooner or later somebody loses patience and unlinks an URB,
but this story (real or hallucinated, but plausible) shows that this
may not help when there are no devices created yet.

---

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e5823650850a..3041deb67b57 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1761,13 +1761,15 @@ void xhci_handle_command_timeout(struct work_struct=
 *work)
 	/* mark this command to be cancelled */
 	xhci->current_cmd->status =3D COMP_COMMAND_ABORTED;
=20
-	/* Make sure command ring is running before aborting it */
+	/* check for crashed or disconnected chip */
 	hw_ring_state =3D xhci_read_64(xhci, &xhci->op_regs->cmd_ring);
-	if (hw_ring_state =3D=3D ~(u64)0) {
+	if (hw_ring_state =3D=3D ~(u64)0 || usbsts & (STS_FATAL | STS_HCE)) {
+		xhci_info(xhci, "kill the damn thing\n");
 		xhci_hc_died(xhci);
 		goto time_out_completed;
 	}
=20
+	/* Make sure command ring is running before aborting it */
 	if ((xhci->cmd_ring_state & CMD_RING_STATE_RUNNING) &&
 	    (hw_ring_state & CMD_RING_RUNNING))  {
 		/* Prevent new doorbell, and start command abort */

